/**
 * Copyright (C), 2012-2016, 江苏中地集团有限公司
 * Author:   LG
 * Date:     2016年7月29日 下午4:04:01
 * Description: //模块目的、功能描述
 * History: //修改记录
 * <author>      <time>      <version>    <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package com.lr.web.redis;

import java.lang.reflect.Array;
import java.util.*;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * 1 。带进程内同步锁的redis缓存读写操作框架类<br>
 * 引用该类防止大量线程同时请求时造成同时回源，增加系统负担。<br>
 * 基本流程：<br>
 * 1) 读取 -(未找到)-> 回源 -> 写入 -> 返回<br>
 * 2) 读取 -(找到)-> 返回
 * <p>
 * 2  不需要回源的方法 可以直接运行
 */
public class MyphSyncCacheWorker {

    private static final Long LOCK_EXPIRE_TIME = 10L;
    private static final long SLEEP_TIME = 100;
    private final ReentrantReadWriteLock rwl = new ReentrantReadWriteLock();
    private final Lock r = rwl.readLock();
    private final Lock w = rwl.writeLock();

    /**
     * 一般用于 callback直接操作 无需要回源
     *
     * @param lockKey
     * @param callBack
     * @param <T>
     * @return
     */
    public <T> T execute(String lockKey, CallBack<T> callBack) {
        try {
            return callBack.invoke();
        } finally {

        }
    }

    /**
     * 通过机制控制数据回源
     *
     * @param lockKey
     * @param readBack  读方法
     * @param writeBack 写方法
     * @param <T>
     * @return
     */
    public <T> T execute(String lockKey, CallBack<T> readBack, CallBack<T> writeBack) {
        //
        boolean lockedFail = false;
        do {
            if (lockedFail) {
                lockedFail = false;
                try {
                    Thread.sleep(SLEEP_TIME);
                } catch (InterruptedException ex) {
                    return null;
                }
            }
           // r.lock();
            try {
                T t = readBack.invoke();
                if (isEmpty(t)) {
                    //r.unlock();
                   // w.lock();
                    try {
                        t = readBack.invoke();
                        if (isEmpty(t)) {
                            if (acquireLock(lockKey)) {
                                try {
                                    t = writeBack.invoke();
                                } finally {
                                    releaseLock(lockKey);
                                }
                            } else {
                                lockedFail = true;
                                continue;
                            }
                        }
                    } finally {
                       // r.lock();
                       // w.unlock();
                    }
                }
                return beforeReturn(t);
            } finally {
               // r.unlock();
            }
        } while (true);

    }


    private static boolean isEmpty(Object object) {
        if (object == null) {
            return true;
        } else if (object instanceof String) {
            return ((String) object).trim().equals("") || ((String) object).trim().equals("null");
        } else if (object instanceof Collection<?>) {
            return ((Collection<?>) object).isEmpty();
        } else if (object instanceof Map<?, ?>) {
            return ((Map<?, ?>) object).isEmpty();
        } else if (object.getClass().isArray()) {
            return Array.getLength(object) == 0;
        } else {
            return false;
        }
    }

    /**
     * 单条回源后，立即执行方法入口
     *
     * @param t 输入对象
     * @return 输出对象
     */
    private <T> T beforeReturn(T t) {
        return t;
    }


    private void releaseLock(String lockKey) {
        CacheService.WatchLock.unLock(getLockKey(lockKey));
    }

    private boolean acquireLock(String lockKey) {
        try {
            return CacheService.WatchLock.addLock(getLockKey(lockKey), LOCK_EXPIRE_TIME);
        } catch (RedisLockException e) {
            return false;
        }
    }

    private String getLockKey(String lockKey) {
        return "lock_".concat(lockKey);
    }

}
