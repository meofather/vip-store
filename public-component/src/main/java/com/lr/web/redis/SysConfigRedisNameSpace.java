package com.lr.web.redis;


import com.lr.web.cache.RedisRootNameSpace;

/**
 * @author rui23
 * @version 创建时间：2016年10月20日 下午7:44:02
 * @类说明
 */
public interface SysConfigRedisNameSpace {
	
	public static final String SYS_CONFIG_DIR= RedisRootNameSpace.CACHE_ROOT + RedisRootNameSpace.NAMESPACE_SEPARATOR
			+ "sysConfig";
}
