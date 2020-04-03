package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import com.bookstore.model.Book;
import com.bookstore.tool.ConnectDatabase;

public class BookDao {
	private ConnectDatabase cd;
	public BookDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(Book book)
	{
		Book b = selectByISBN(book.getISBN());
		if(b.getId()!=0){
			return update(b.getId(), Integer.parseInt(b.getNumber())+Integer.parseInt(book.getNumber()));
		}
		String sql="insert into book(book_name,author_name,ISBN,genre,pid,price,cover,page_number,number,warehouse,percentage) values('"+book.getBook_name()+"','"+book.getAuthor_name()+"','"+book.getISBN()+"','"+book.getGenre()+"','"+book.getPid()+"','"+book.getPrice()+"','"+book.getCover()+"','"+book.getPage_number()+"','"+book.getNumber()+"','"+book.getWarehouse()+"','"+book.getPercentage()+"')";
		int result=cd.executeUpdate(sql);
//		System.out.println(result);
		cd.close();
		return result==0?0:1;
	}
	public Book select(int id){
		String sql="select * from book where id = '"+id+"'";
		Book book=new Book();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				book.setId(rs.getInt("id"));
				book.setBook_name(rs.getString("book_name"));
				book.setAuthor_name(rs.getString("author_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setGenre(rs.getString("genre"));
				book.setPid(rs.getString("pid"));
				book.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				book.setCover(rs.getString("cover"));
				book.setPage_number(rs.getString("page_number"));
				book.setNumber(rs.getString("number"));
				book.setWarehouse(rs.getString("warehouse"));
				book.setPercentage(rs.getString("percentage"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return book;
	}
	public Book select(String book_name){
		String sql="select * from book where book_name='"+book_name+"'";
		Book book=new Book();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				book.setId(rs.getInt("id"));
				book.setBook_name(rs.getString("book_name"));
				book.setAuthor_name(rs.getString("author_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setGenre(rs.getString("genre"));
				book.setPid(rs.getString("pid"));
				book.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				book.setCover(rs.getString("cover"));
				book.setPage_number(rs.getString("page_number"));
				book.setNumber(rs.getString("number"));
				book.setWarehouse(rs.getString("warehouse"));
				book.setPercentage(rs.getString("percentage"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return book;
	}
	public List<Book> select(){
		String sql="select * from book order by id desc";
		Book book=new Book();
		ResultSet rs = cd.executeQuery(sql);
		List<Book> lb=new ArrayList<Book>();
		try {
			while(rs.next()){
				book=new Book();
				book.setId(rs.getInt("id"));
				book.setBook_name(rs.getString("book_name"));
				book.setAuthor_name(rs.getString("author_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setGenre(rs.getString("genre"));
				book.setPid(rs.getString("pid"));
				book.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				book.setCover(rs.getString("cover"));
				book.setPage_number(rs.getString("page_number"));
				book.setNumber(rs.getString("number"));
				book.setWarehouse(rs.getString("warehouse"));
				book.setPercentage(rs.getString("percentage"));
				lb.add(book);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lb;
	}
	//recommend
	public List<Book> select(Book b){
		String sql="select * from book where id!="+b.getId()+" and (author_name='"+b.getAuthor_name()+"' or genre='"+b.getGenre()+"' or book_name like '%"+b.getBook_name()+"%')";
		Book book=new Book();
		ResultSet rs = cd.executeQuery(sql);
		List<Book> lb=new ArrayList<Book>();
		try {
			while(rs.next()){
				book=new Book();
				book.setId(rs.getInt("id"));
				book.setBook_name(rs.getString("book_name"));
				book.setAuthor_name(rs.getString("author_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setGenre(rs.getString("genre"));
				book.setPid(rs.getString("pid"));
				book.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				book.setCover(rs.getString("cover"));
				book.setPage_number(rs.getString("page_number"));
				book.setNumber(rs.getString("number"));
				book.setWarehouse(rs.getString("warehouse"));
				book.setPercentage(rs.getString("percentage"));
				lb.add(book);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lb;
	}
	//appoximate search for books
	public List<Book> select(String way,String keyword){
		String sql="";
		if("ISBN".equals(way)){
			sql="select * from book where ISBN = '"+keyword+"'";
		}else {
			sql="select * from book where "+way+" like '%"+keyword+"%'";
		}
		Book book=new Book();
		ResultSet rs = cd.executeQuery(sql);
		List<Book> lb=new ArrayList<Book>();
		try {
			while(rs.next()){
				book=new Book();
				book.setId(rs.getInt("id"));
				book.setBook_name(rs.getString("book_name"));
				book.setAuthor_name(rs.getString("author_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setGenre(rs.getString("genre"));
				book.setPid(rs.getString("pid"));
				book.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				book.setCover(rs.getString("cover"));
				book.setPage_number(rs.getString("page_number"));
				book.setNumber(rs.getString("number"));
				book.setWarehouse(rs.getString("warehouse"));
				book.setPercentage(rs.getString("percentage"));
				lb.add(book);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lb;
	}
	
//	public List<Book> selectByBookName(String book_name){
//		String sql="select * from book where book_name like '%"+book_name+"'%";
//		Book book=new Book();
//		ResultSet rs = cd.executeQuery(sql);
//		List<Book> lb=new ArrayList<Book>();
//		try {
//			while(rs.next()){
//				book=new Book();
//				book.setId(rs.getInt("id"));
//				book.setBook_name(rs.getString("book_name"));
//				book.setAuthor_name(rs.getString("author_name"));
//				book.setISBN(rs.getString("ISBN"));
//				book.setGenre(rs.getString("genre"));
//				book.setPid(rs.getString("pid"));
//				book.setCover(rs.getString("cover"));
//				book.setPage_number(rs.getString("page_number"));
//				book.setNumber(rs.getString("number"));
//				book.setWarehouse(rs.getString("warehouse"));
//				book.setPercentage(rs.getString("percentage"));
//				lb.add(book);
//			}
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		}
//		cd.close();
//		return lb;
//	}
//
	public Book selectByISBN(String ISBN){
		String sql="select * from book where ISBN ='"+ISBN+"'";
		Book book=new Book();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				book.setId(rs.getInt("id"));
				book.setBook_name(rs.getString("book_name"));
				book.setAuthor_name(rs.getString("author_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setGenre(rs.getString("genre"));
				book.setPid(rs.getString("pid"));
				book.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				book.setCover(rs.getString("cover"));
				book.setPage_number(rs.getString("page_number"));
				book.setNumber(rs.getString("number"));
				book.setWarehouse(rs.getString("warehouse"));
				book.setPercentage(rs.getString("percentage"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return book;
	}
	public int update(int id,int number){
		String sql="update book set number="+number+" where id="+id;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result==0?0:2;
	}
	public int delete(String id){
		String sql="delete from book where id="+id;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
}
