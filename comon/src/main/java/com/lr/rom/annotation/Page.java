/**
 * 
 */
package com.lr.rom.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * INFO: 分页注解，给于PaginationInterceptor用
 * User: zhaokai
 * Date: 2016/2/18 - 14:19
 * Version: 1.0
 * History: <p>如果有修改过程，请记录</P>
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface Page {
	/**
	 * @return page index
	 */
	String page() default "pageIndex";

	/**
	 * @return page size
	 */
	String rows() default "pageSize";

	/**
	 * @return
	 */
	String total() default "total";

}
