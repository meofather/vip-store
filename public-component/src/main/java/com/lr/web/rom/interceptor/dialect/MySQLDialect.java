package com.lr.web.rom.interceptor.dialect;

/**
 * INFO: mysql方言实现
 * User: zhaokai
 * Date: 2016/2/18 - 14:19
 * Version: 1.0
 * History: <p>如果有修改过程，请记录</P>
 */
public class MySQLDialect implements IDBDialect {

    /*
     * (non-Javadoc)
     *
     * @see
     * org.yate.basic.dao.interceptor.IDBDialect#getPaginationSQL(java.lang.
     * String, int, int)
     */
    public String getPaginationSQL(String originalSql, int page, int rows) {
        StringBuilder sb = new StringBuilder(originalSql.trim().length() + 16);
        sb.append(originalSql).append(" limit ")
                .append(Math.max((page - 1) * rows, 0)).append(",")
                .append(rows);
        return sb.toString();
    }

}
