package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.bookstore.model.User;
import com.bookstore.tool.ConnectDatabase;

public class UserDao {
	private ConnectDatabase cd;
	public UserDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(User user)
	{
		String sql="insert into users(username,phone,address,email,password) values('"+user.getUsername()+"','"+user.getPhone()+"','"+user.getAddress()+"','"+user.getEmail()+"','"+user.getPassword()+"')";
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public User select(String username){
		String sql="select * from users where username='"+username+"'";
		User user=new User();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				user.setUid(rs.getInt("uid"));
				user.setUsername(rs.getString("username"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return user;
	}
	public int delete(String id){
		String sql="delete from users where uid="+id;
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
}
