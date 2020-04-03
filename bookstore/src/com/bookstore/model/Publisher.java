package com.bookstore.model;

public class Publisher {
	private int pid=0;
	private String name="";
	private String address="";
	private String email="";
	private String phone="";
	private String banking_account="";
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBanking_account() {
		return banking_account;
	}
	public void setBanking_account(String banking_account) {
		this.banking_account = banking_account;
	}
	public Publisher(int pid, String name, String address, String email,
			String phone, String banking_account) {
		super();
		this.pid = pid;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.banking_account = banking_account;
	}
	public Publisher() {
		super();
		// TODO Auto-generated constructor stub
	}
}
