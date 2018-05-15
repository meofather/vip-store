package com.lr.web.redis;

/**
 * INFO: info
 * User: zhaokai
 * Date: 2016/7/19 - 10:23
 * Version: 1.0
 * History: <p>如果有修改过程，请记录</P>
 */

public class RedisException extends Exception {
    private String message;

    public RedisException() {
        this.message = "";
    }

    public RedisException(String message) {
        this.message = message;
    }

    public RedisException(String message, Throwable t) {
        super(message, t);
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

}