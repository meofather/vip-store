package com.lr.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * INFO: User: zhaokai Date: 2016/8/17 - 8:48 Version: 1.0 History:
 * <p>
 * 如果有修改过程，请记录
 * </P>
 */

public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    protected Long id;

    /**
     * 创建时间
     */
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the createTime
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime the createTime to set
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
