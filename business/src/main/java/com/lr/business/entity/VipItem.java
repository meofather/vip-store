package com.lr.business.entity;

import com.lr.web.bean.BaseEntity;

import java.math.BigDecimal;

public class VipItem extends BaseEntity {
    private Long id;

    private String itemName;

    private String imageUrl;

    private BigDecimal costPrice;

    private BigDecimal sellingPrice;

    private BigDecimal officialPrice;

    private Integer realStock;

    private Integer cacheStock;

    private Long salesVolume;

    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }

    public BigDecimal getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
    }

    public BigDecimal getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(BigDecimal sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public BigDecimal getOfficialPrice() {
        return officialPrice;
    }

    public void setOfficialPrice(BigDecimal officialPrice) {
        this.officialPrice = officialPrice;
    }

    public Integer getRealStock() {
        return realStock;
    }

    public void setRealStock(Integer realStock) {
        this.realStock = realStock;
    }

    public Integer getCacheStock() {
        return cacheStock;
    }

    public void setCacheStock(Integer cacheStock) {
        this.cacheStock = cacheStock;
    }

    public Long getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Long salesVolume) {
        this.salesVolume = salesVolume;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @Override
    public String toString() {
        return "VipItem{" +
                "id=" + id +
                ", itemName='" + itemName + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", costPrice=" + costPrice +
                ", sellingPrice=" + sellingPrice +
                ", officialPrice=" + officialPrice +
                ", realStock=" + realStock +
                ", cacheStock=" + cacheStock +
                ", salesVolume=" + salesVolume +
                ", description='" + description + '\'' +
                '}';
    }
}