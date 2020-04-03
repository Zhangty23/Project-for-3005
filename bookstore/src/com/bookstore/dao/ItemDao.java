package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import com.bookstore.model.BookItem;
import com.bookstore.model.Item;
import com.bookstore.tool.ConnectDatabase;

public class ItemDao {
	private ConnectDatabase cd;
	public ItemDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(Item item)
	{
		String sql="insert into item(oid,bid,sale_price,number) values('"+item.getOid()+"','"+item.getBid()+"','"+item.getSale_price()+"','"+item.getNumber()+"')";
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public List<BookItem> select(String oid){
		String sql="select item.id iid,oid,bid,sale_price,item.number number,book_name,author_name,ISBN,genre,pid,cover,page_number,warehouse,percentage from item join book on(book.id=item.bid) where oid='"+oid+"'";
		BookItem bi=new BookItem();
		List<BookItem> lbi=new ArrayList<BookItem>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				bi=new BookItem();
				bi.setIid(rs.getInt("iid"));
				bi.setOid(rs.getString("oid"));
				bi.setBid(rs.getInt("bid"));
				bi.setSale_price(new Formatter().format("%.2f", Float.parseFloat(rs.getString("sale_price"))).toString());
				bi.setNumber(rs.getString("number"));
				bi.setBook_name(rs.getString("book_name"));
				bi.setAuthor_name(rs.getString("author_name"));
				bi.setISBN(rs.getString("ISBN"));
				bi.setGenre(rs.getString("genre"));
				bi.setPid(rs.getString("pid"));
				bi.setCover(rs.getString("cover"));
				bi.setPage_number(rs.getString("page_number"));
				bi.setWarehouse(rs.getString("warehouse"));
				bi.setPercentage(rs.getString("percentage"));
				lbi.add(bi);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lbi;
	}
	public int delete(int id){
		String sql="delete from item where id="+id;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
}
