package com.bookstore.model;

public class Item {
	private int id=0;
	private String oid="";
	private int bid=0;
	private String sale_price="";
	private String number="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getSale_price() {
		return sale_price;
	}
	public void setSale_price(String sale_price) {
		this.sale_price = sale_price;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Item(int id, String oid, int bid, String sale_price, String number) {
		super();
		this.id = id;
		this.oid = oid;
		this.bid = bid;
		this.sale_price = sale_price;
		this.number = number;
	}
	public Item() {
		super();
	}
}
