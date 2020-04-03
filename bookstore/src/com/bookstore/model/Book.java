package com.bookstore.model;

public class Book {
	private int id=0;
	private String book_name="";
	private String author_name="";
	private String ISBN="";
	private String genre="";
	private String pid="";
	private String cover="";
	private String page_number="";
	private String price="";
	private String number="";
	private String warehouse="";
	private String percentage="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
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
	public Book(int id, String book_name, String author_name, String iSBN,
			String genre, String pid, String cover, String page_number,
			String price, String number, String warehouse, String percentage) {
		super();
		this.id = id;
		this.book_name = book_name;
		this.author_name = author_name;
		ISBN = iSBN;
		this.genre = genre;
		this.pid = pid;
		this.cover = cover;
		this.page_number = page_number;
		this.price = price;
		this.number = number;
		this.warehouse = warehouse;
		this.percentage = percentage;
	}
	public Book() {
		super();
	}
}
