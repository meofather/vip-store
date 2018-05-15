package com.lr.business.entity;

import com.lr.web.bean.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

public class VipOrder extends BaseEntity {
    private Long id;

    private String orderNo;

    private Long itemId;

    private Long itemStockId;

    private String mobile;

    private Integer payStyle;

    private Integer status;

    private Integer deliverGood;

    private Date createTime;

    private BigDecimal price;

    private Integer num;

    private String itemName;

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

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

    public Long getItemStockId() {
        return itemStockId;
    }

    public void setItemStockId(Long itemStockId) {
        this.itemStockId = itemStockId;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public Integer getPayStyle() {
        return payStyle;
    }

    public void setPayStyle(Integer payStyle) {
        this.payStyle = payStyle;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDeliverGood() {
        return deliverGood;
    }

    public void setDeliverGood(Integer deliverGood) {
        this.deliverGood = deliverGood;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VipOrder vipOrder = (VipOrder) o;

        if (id != null ? !id.equals(vipOrder.id) : vipOrder.id != null) return false;
        if (orderNo != null ? !orderNo.equals(vipOrder.orderNo) : vipOrder.orderNo != null) return false;
        if (itemId != null ? !itemId.equals(vipOrder.itemId) : vipOrder.itemId != null) return false;
        if (itemStockId != null ? !itemStockId.equals(vipOrder.itemStockId) : vipOrder.itemStockId != null)
            return false;
        if (mobile != null ? !mobile.equals(vipOrder.mobile) : vipOrder.mobile != null) return false;
        if (payStyle != null ? !payStyle.equals(vipOrder.payStyle) : vipOrder.payStyle != null) return false;
        if (status != null ? !status.equals(vipOrder.status) : vipOrder.status != null) return false;
        if (deliverGood != null ? !deliverGood.equals(vipOrder.deliverGood) : vipOrder.deliverGood != null)
            return false;
        if (createTime != null ? !createTime.equals(vipOrder.createTime) : vipOrder.createTime != null) return false;
        if (price != null ? !price.equals(vipOrder.price) : vipOrder.price != null) return false;
        if (num != null ? !num.equals(vipOrder.num) : vipOrder.num != null) return false;
        return itemName != null ? itemName.equals(vipOrder.itemName) : vipOrder.itemName == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (orderNo != null ? orderNo.hashCode() : 0);
        result = 31 * result + (itemId != null ? itemId.hashCode() : 0);
        result = 31 * result + (itemStockId != null ? itemStockId.hashCode() : 0);
        result = 31 * result + (mobile != null ? mobile.hashCode() : 0);
        result = 31 * result + (payStyle != null ? payStyle.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (deliverGood != null ? deliverGood.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (itemName != null ? itemName.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "VipOrder{" +
                "id=" + id +
                ", orderNo='" + orderNo + '\'' +
                ", itemId=" + itemId +
                ", itemStockId=" + itemStockId +
                ", mobile='" + mobile + '\'' +
                ", payStyle=" + payStyle +
                ", status=" + status +
                ", deliverGood=" + deliverGood +
                ", createTime=" + createTime +
                ", price=" + price +
                ", num=" + num +
                ", itemName='" + itemName + '\'' +
                '}';
    }
}