package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.model.Order;
import com.bookstore.tool.ConnectDatabase;

public class OrderDao {
	private ConnectDatabase cd;
	public OrderDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(Order order)
	{
		String sql="insert into orders(oid,uid,status,total_price,datetime) values('"+order.getOid()+"','"+order.getUid()+"','"+order.getStatus()+"','"+order.getTotal_price()+"','"+order.getDatetime()+"')";
		int result=cd.executeUpdate(sql);
//		System.out.println(sql);
		cd.close();
		return result;
	}
	public Order select(String oid){
		String sql="select * from orders where oid='"+oid+"'";
		Order order=new Order();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				order.setOid(rs.getString("oid"));
				order.setUid(rs.getInt("uid"));
				order.setStatus(rs.getString("status"));
				order.setTotal_price(rs.getString("total_price"));
				order.setDatetime(rs.getString("datetime"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return order;
	}
	public List<Order> select(int uid){
		String sql="select * from orders where uid="+uid+" order by oid desc";
		Order order = new Order();
		List<Order> lbc = new ArrayList<Order>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				order = new Order();
				order.setOid(rs.getString("oid"));
				order.setUid(rs.getInt("uid"));
				order.setStatus(rs.getString("status"));
				order.setTotal_price(rs.getString("total_price"));
				order.setDatetime(rs.getString("datetime"));
				lbc.add(order);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lbc;
	}
//	public int update(int id, int number, String datetime){
//		String sql="update orders set number='"+number+"',datetime='"+datetime+"' where id="+id;
//		int result=cd.executeUpdate(sql);
//		cd.close();
//		return result;
//	}
	public int delete(String oid){
		String sql="delete from orders where oid='"+oid+"'";
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
}
