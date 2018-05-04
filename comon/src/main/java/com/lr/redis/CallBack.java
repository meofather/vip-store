package com.lr.redis;

/**
 *	回调接口
 * @param <T>
 */
public interface CallBack<T> {
    /**
     * 回调方法
     * @return T
     */
    T invoke();
}
