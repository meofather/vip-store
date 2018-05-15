package com.lr.business.entity;

import com.lr.web.bean.BaseEntity;

import java.util.Date;

public class VipItemStock extends BaseEntity {
    private Long id;

    private String orderNo;

    private Long itemId;

    private String itemInfo;

    private String mobile;

    private Date createTime;

    private Date updateTime;

    private Date invalidateStart;

    private Date invalidateEnd;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemInfo() {
        return itemInfo;
    }

    public void setItemInfo(String itemInfo) {
        this.itemInfo = itemInfo == null ? null : itemInfo.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getInvalidateStart() {
        return invalidateStart;
    }

    public void setInvalidateStart(Date invalidateStart) {
        this.invalidateStart = invalidateStart;
    }

    public Date getInvalidateEnd() {
        return invalidateEnd;
    }

    public void setInvalidateEnd(Date invalidateEnd) {
        this.invalidateEnd = invalidateEnd;
    }

    @Override
    public String toString() {
        return "VipItemStock{" +
                "id=" + id +
                ", orderNo='" + orderNo + '\'' +
                ", itemId=" + itemId +
                ", itemInfo='" + itemInfo + '\'' +
                ", mobile='" + mobile + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", invalidateStart=" + invalidateStart +
                ", invalidateEnd=" + invalidateEnd +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VipItemStock that = (VipItemStock) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (orderNo != null ? !orderNo.equals(that.orderNo) : that.orderNo != null) return false;
        if (itemId != null ? !itemId.equals(that.itemId) : that.itemId != null) return false;
        if (itemInfo != null ? !itemInfo.equals(that.itemInfo) : that.itemInfo != null) return false;
        if (mobile != null ? !mobile.equals(that.mobile) : that.mobile != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;
        if (invalidateStart != null ? !invalidateStart.equals(that.invalidateStart) : that.invalidateStart != null)
            return false;
        return invalidateEnd != null ? invalidateEnd.equals(that.invalidateEnd) : that.invalidateEnd == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (orderNo != null ? orderNo.hashCode() : 0);
        result = 31 * result + (itemId != null ? itemId.hashCode() : 0);
        result = 31 * result + (itemInfo != null ? itemInfo.hashCode() : 0);
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (invalidateStart != null ? invalidateStart.hashCode() : 0);
        result = 31 * result + (invalidateEnd != null ? invalidateEnd.hashCode() : 0);
        return result;
    }
}