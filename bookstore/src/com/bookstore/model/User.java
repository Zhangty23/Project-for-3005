package com.bookstore.model;

public class User {
	private int uid=0;
	private String username="";
	private String phone="";
	private String password="";
	private String address="";
	private String email="";
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(int uid, String username, String phone, String password,
			String address, String email) {
		super();
		this.uid = uid;
		this.username = username;
		this.phone = phone;
		this.password = password;
		this.address = address;
		this.email = email;
	}
	public User() {
		super();
	}
	
	
}
