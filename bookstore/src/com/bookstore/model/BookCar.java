package com.bookstore.model;

public class BookCar {
	private int sid=0;
	private int uid=0;
	private int bid=0;
	private int number=0;
	private String datetime="";
	private String book_name="";
	private String author_name="";
	private String ISBN="";
	private String genre="";
	private String pid="";
	private String price="";
	private String cover="";
	private String page_number="";
	private String warehouse="";
	private String percentage="";
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
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
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getPage_number() {
		return page_number;
	}
	public void setPage_number(String page_number) {
		this.page_number = page_number;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public BookCar(int sid, int uid, int bid, int number, String datetime,
			String book_name, String author_name, String iSBN, String genre,
			String pid, String price, String cover, String page_number,
			String warehouse, String percentage) {
		super();
		this.sid = sid;
		this.uid = uid;
		this.bid = bid;
		this.number = number;
		this.datetime = datetime;
		this.book_name = book_name;
		this.author_name = author_name;
		ISBN = iSBN;
		this.genre = genre;
		this.pid = pid;
		this.price = price;
		this.cover = cover;
		this.page_number = page_number;
		this.warehouse = warehouse;
		this.percentage = percentage;
	}
	public BookCar() {
		super();
	}
}
