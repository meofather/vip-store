package com.lr.web.param;

import java.util.Date;

public class PayResult {
private  String pay_id;

private String money;

private String price;

private String type;

private String pay_no;

private String param;

private String pay_time;

private String pay_tag;

private String sign;

private Date create_time;


public String getPay_tag() {
	return pay_tag;
}

public void setPay_tag(String pay_tag) {
	this.pay_tag = pay_tag;
}

public String getPay_id() {
	return pay_id;
}

public void setPay_id(String pay_id) {
	this.pay_id = pay_id;
}

public String getMoney() {
	return money;
}

public void setMoney(String money) {
	this.money = money;
}

public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getPay_no() {
	return pay_no;
}

public void setPay_no(String pay_no) {
	this.pay_no = pay_no;
}

public String getParam() {
	return param;
}

public void setParam(String param) {
	this.param = param;
}

public String getPay_time() {
	return pay_time;
}

public void setPay_time(String pay_time) {
	this.pay_time = pay_time;
}

public String getSign() {
	return sign;
}

public void setSign(String sign) {
	this.sign = sign;
}

@Override
public String toString() {
	return "PayResult [pay_id=" + pay_id + ", money=" + money + ", price="
			+ price + ", type=" + type + ", pay_no=" + pay_no + ", param="
			+ param + ", pay_time=" + pay_time + ", pay_tag=" + pay_tag
			+ ", sign=" + sign + "]";
}

public Date getCreate_time() {
	return create_time;
}

public void setCreate_time(Date create_time) {
	this.create_time = create_time;
}

}
