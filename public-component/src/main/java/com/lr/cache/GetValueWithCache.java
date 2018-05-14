package com.lr.cache;


import com.lr.redis.CacheService;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public abstract class GetValueWithCache<T> {

    private String cacheKey;

    private int cacheTime;
    
    protected Class<T> clazz;  

    public GetValueWithCache(String key, int cacheTime) {
        this.cacheKey = key;
        this.cacheTime = cacheTime;
        
        @SuppressWarnings("rawtypes")  
        Class clazz = getClass();  
  
        while (clazz != Object.class) {  
            Type t = clazz.getGenericSuperclass();  
            if (t instanceof ParameterizedType) {  
                Type[] args = ((ParameterizedType) t).getActualTypeArguments();  
                if (args[0] instanceof Class) {  
                    this.clazz = (Class<T>) args[0];  
                    break;  
                }  
            }  
            clazz = clazz.getSuperclass();  
        }  
    }

    public T get() {
        T obj = CacheService.StringKey.getObject(cacheKey,clazz);
        if (obj != null) {
                return obj;
        } else {
            T result = doBiz();
            if (result != null) {
            	CacheService.StringKey.set(cacheKey, result);
            } 
            return result;
        }
    }

    public abstract T doBiz();
}
