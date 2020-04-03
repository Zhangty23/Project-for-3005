package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.model.Publisher;
import com.bookstore.model.User;
import com.bookstore.tool.ConnectDatabase;

public class PublisherDao {
	private ConnectDatabase cd;
	public PublisherDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(Publisher publisher)
	{
		String sql="insert into publisher(name,address,email,phone,banking_account) values('"+publisher.getName()+"','"+publisher.getAddress()+"','"+publisher.getEmail()+"','"+publisher.getPhone()+"','"+publisher.getBanking_account()+"')";
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public Publisher select(int pid){
		String sql="select * from publisher where pid="+pid;
		Publisher publisher=new Publisher();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				publisher.setPid(rs.getInt("pid"));
				publisher.setName(rs.getString("name"));
				publisher.setAddress(rs.getString("address"));
				publisher.setEmail(rs.getString("email"));
				publisher.setPhone(rs.getString("phone"));
				publisher.setBanking_account(rs.getString("banking_account"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return publisher;
	}
	public List<Publisher> select(){
		String sql="select * from publisher";
		Publisher publisher=new Publisher();
		ResultSet rs = cd.executeQuery(sql);
		List<Publisher> lp=new ArrayList<Publisher>();
		try {
			while(rs.next()){
				publisher=new Publisher();
				publisher.setPid(rs.getInt("pid"));
				publisher.setName(rs.getString("name"));
				publisher.setAddress(rs.getString("address"));
				publisher.setEmail(rs.getString("email"));
				publisher.setPhone(rs.getString("phone"));
				publisher.setBanking_account(rs.getString("banking_account"));
				lp.add(publisher);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return lp;
	}
	public int delete(int pid){
		String sql="delete from users where pid="+pid;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public Publisher select(String name) {
		String sql="select * from publisher where name='"+name+"'";
		Publisher publisher=new Publisher();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				publisher.setPid(rs.getInt("pid"));
				publisher.setName(rs.getString("name"));
				publisher.setAddress(rs.getString("address"));
				publisher.setEmail(rs.getString("email"));
				publisher.setPhone(rs.getString("phone"));
				publisher.setBanking_account(rs.getString("banking_account"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return publisher;
	}
}
