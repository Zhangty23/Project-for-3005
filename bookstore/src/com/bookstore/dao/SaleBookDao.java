package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;

import com.bookstore.model.SaleBook;
import com.bookstore.tool.ConnectDatabase;

/**
 * on the view view_salebook
 *
 */
public class SaleBookDao {
	private ConnectDatabase cd;
	public SaleBookDao()
	{
		cd=new ConnectDatabase();
	}
	public List<SaleBook> selectBook(){
		String sql="select top 5 book_name,sum(number) number,sum(number*sale_price) total_price from view_salebook group by book_name order by number desc";
		SaleBook sb=new SaleBook();
		List<SaleBook> lsb=new ArrayList<SaleBook>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				sb=new SaleBook();
				sb.setType(rs.getString("book_name"));
				sb.setNumber(rs.getInt("number"));
				sb.setTotal_price(new Formatter().format("%.2f", Float.parseFloat(rs.getString("total_price"))).toString());
				lsb.add(sb);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lsb;
	}
	public List<SaleBook> selectGenre(){
		String sql="select genre,sum(number) number,sum(number*sale_price) total_price from view_salebook group by genre order by number desc";
		SaleBook sb=new SaleBook();
		List<SaleBook> lsb=new ArrayList<SaleBook>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				sb=new SaleBook();
				sb.setType(rs.getString("genre"));
				sb.setNumber(rs.getInt("number"));
				sb.setTotal_price(new Formatter().format("%.2f", Float.parseFloat(rs.getString("total_price"))).toString());
				lsb.add(sb);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lsb;
	}
	public List<SaleBook> selectAuthor(){
		String sql="select top 5 author_name,sum(number) number,sum(number*sale_price) total_price from view_salebook group by author_name order by number desc";
		SaleBook sb=new SaleBook();
		List<SaleBook> lsb=new ArrayList<SaleBook>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				sb=new SaleBook();
				sb.setType(rs.getString("author_name"));
				sb.setNumber(rs.getInt("number"));
				sb.setTotal_price(new Formatter().format("%.2f", Float.parseFloat(rs.getString("total_price"))).toString());
				lsb.add(sb);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lsb;
	}
	
}
