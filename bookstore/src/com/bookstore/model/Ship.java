package com.bookstore.model;

public class Ship {
	private int id=0;
	private String oid="";
	private String place="";
	private String datetime="";
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
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public Ship(int id, String oid, String place, String datetime) {
		super();
		this.id = id;
		this.oid = oid;
		this.place = place;
		this.datetime = datetime;
	}
	public Ship() {
		super();
	}
}
