package com.bookstore.model;

public class ShoppingCar {
	private int id=0;
	private int uid=0;
	private int bid=0;
	private int number=0;
	private String datetime="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public ShoppingCar(int id, int uid, int bid, int number, String datetime) {
		super();
		this.id = id;
		this.uid = uid;
		this.bid = bid;
		this.number = number;
		this.datetime = datetime;
	}
	public ShoppingCar() {
		super();
	}
}
