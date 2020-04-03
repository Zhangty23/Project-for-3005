package com.bookstore.model;

public class Order {
	private String oid="";
	private int uid=0;
	private String status="";
	private String total_price="";
	private String datetime="";
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public Order(String oid, int uid, String status, String total_price,
			String datetime) {
		super();
		this.oid = oid;
		this.uid = uid;
		this.status = status;
		this.total_price = total_price;
		this.datetime = datetime;
	}
	public Order() {
		super();
	}
}
