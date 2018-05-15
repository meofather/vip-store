package com.lr.web.param;


import com.lr.web.constants.PayUtil;

public class MaPayRequestVo {
	String id = PayUtil.UID;//UID
	
	String type = "1";
	
	Double price;
	//订单ID 我们的订单ID
	String pay_id;
	
//	String sign;
	
	Integer page = 4;//JSON = 4
	
	Long outTime;
	
	String token = PayUtil.TOKEN;
	
	String notify_url = PayUtil.NOTIFY_URL;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPay_id() {
		return pay_id;
	}

	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Long getOutTime() {
		return outTime;
	}

	public void setOutTime(Long outTime) {
		this.outTime = outTime;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getNotify_url() {
		return notify_url;
	}

	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}

	@Override
	public String toString() {
		return "MaPayRequestVo [id=" + id + ", type=" + type + ", price="
				+ price + ", pay_id=" + pay_id + ", page=" + page
				+ ", outTime=" + outTime + ", token=" + token + ", notify_url="
				+ notify_url + "]";
	}
	
	
}
