package com.lr.web.rom.interceptor.dialect;

/**
 * INFO: 弱化的ＳＱＬ分析工具
 * User: zhaokai
 * Date: 2016/2/18 - 14:19
 * Version: 1.0
 * History: <p>如果有修改过程，请记录</P>
 */
public interface IDBDialect {
	public static enum Type {
		MYSQL
	}

    /**
     *
     * @param originalSql
     * @param page
     * @param size
     * @return
     */
	String getPaginationSQL(final String originalSql, final int page,
                            final int size);
}
