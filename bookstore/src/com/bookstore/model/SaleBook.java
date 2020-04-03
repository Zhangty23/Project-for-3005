package com.bookstore.model;

public class SaleBook {
	private String type="";
	private int number=0;
	private String total_price="";
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public SaleBook(String type, int number, String total_price) {
		super();
		this.type = type;
		this.number = number;
		this.total_price = total_price;
	}
	public SaleBook() {
		super();
	}
}
