package com.bookstore.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDatabase {
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
//	public static void main(String[] args) {
//		ConnectDatabase cd=new ConnectDatabase();
//		ResultSet rs = cd.executeQuery("Select * from users");
//		try {
//			while(rs.next()){
//				System.out.println(rs.getString("uid"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		cd.close();
//		System.out.println("succeed");
//	}
	//load the driver
	public ConnectDatabase() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			System.err.println(e.getMessage());
		}
	}
	//select
	public ResultSet executeQuery(String sql){
		try {
			conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=bookstore","sa","sa");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println(e.getMessage());
		}
		return rs;
	}
	//update¡¢delete¡¢insert
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=bookstore","sa","sa");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			result = 0;
		}
		return result;
	}
	//close
	public void close() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}
