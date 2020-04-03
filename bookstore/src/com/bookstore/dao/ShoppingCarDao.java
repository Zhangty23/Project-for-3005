package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import com.bookstore.model.BookCar;
import com.bookstore.model.ShoppingCar;
import com.bookstore.tool.ConnectDatabase;

public class ShoppingCarDao {
	private ConnectDatabase cd;
	public ShoppingCarDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(ShoppingCar sc)
	{
		ShoppingCar s = select(sc.getUid(), sc.getBid());
		if(s.getId()!=0){
			return update(s.getId(), s.getNumber()+sc.getNumber(), sc.getDatetime());
		}
		String sql="insert into shoppingcar(uid,bid,number,datetime) values('"+sc.getUid()+"','"+sc.getBid()+"','"+sc.getNumber()+"','"+sc.getDatetime()+"')";
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public ShoppingCar select(int uid, int bid){
		String sql="select * from shoppingcar where uid="+uid+" and bid="+bid+" order by id desc";
		ShoppingCar sc = new ShoppingCar();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				sc.setId(rs.getInt("id"));
				sc.setUid(rs.getInt("uid"));
				sc.setBid(rs.getInt("bid"));
				sc.setNumber(rs.getInt("number"));
				sc.setDatetime(rs.getString("datetime"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return sc;
	}
	public List<BookCar> select(int uid){
		String sql="select book.id bid,book_name,author_name,ISBN,genre,pid,price,cover,page_number,warehouse,percentage,shoppingcar.id sid,uid,shoppingcar.number number,datetime from book join shoppingcar on(book.id=shoppingcar.bid) where uid="+uid+" order by shoppingcar.id desc";
		BookCar bc = new BookCar();
		List<BookCar> lbc = new ArrayList<BookCar>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				bc = new BookCar();
				bc.setBid(rs.getInt("bid"));
				bc.setBook_name(rs.getString("book_name"));
				bc.setAuthor_name(rs.getString("author_name"));
				bc.setISBN(rs.getString("ISBN"));
				bc.setGenre(rs.getString("genre"));
				bc.setPid(rs.getString("pid"));
				bc.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				bc.setCover(rs.getString("cover"));
				bc.setPage_number(rs.getString("page_number"));
				bc.setWarehouse(rs.getString("warehouse"));
				bc.setPercentage(rs.getString("percentage"));
				bc.setSid(rs.getInt("sid"));
				bc.setUid(rs.getInt("uid"));
				bc.setNumber(rs.getInt("number"));
				bc.setDatetime(rs.getString("datetime"));
				lbc.add(bc);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lbc;
	}
	public BookCar select(int uid,String bid){
		String sql="select book.id bid,book_name,author_name,ISBN,genre,pid,price,cover,page_number,warehouse,percentage,shoppingcar.id sid,uid,shoppingcar.number number,datetime from book join shoppingcar on(book.id=shoppingcar.bid) where uid="+uid+" and shoppingcar.bid="+bid;
		BookCar bc = new BookCar();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				bc.setBid(rs.getInt("bid"));
				bc.setBook_name(rs.getString("book_name"));
				bc.setAuthor_name(rs.getString("author_name"));
				bc.setISBN(rs.getString("ISBN"));
				bc.setGenre(rs.getString("genre"));
				bc.setPid(rs.getString("pid"));
				bc.setPrice(new Formatter().format("%.2f", Float.parseFloat(rs.getString("price"))).toString());
				bc.setCover(rs.getString("cover"));
				bc.setPage_number(rs.getString("page_number"));
				bc.setWarehouse(rs.getString("warehouse"));
				bc.setPercentage(rs.getString("percentage"));
				bc.setSid(rs.getInt("sid"));
				bc.setUid(rs.getInt("uid"));
				bc.setNumber(rs.getInt("number"));
				bc.setDatetime(rs.getString("datetime"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return bc;
	}
	public int update(int id, int number, String datetime){
		String sql="update shoppingcar set number='"+number+"',datetime='"+datetime+"' where id="+id;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public int delete(int id){
		String sql="delete from shoppingcar where id="+id;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
}
