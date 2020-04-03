package com.bookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.model.Ship;
import com.bookstore.tool.ConnectDatabase;

public class ShipDao {
	private ConnectDatabase cd;
	public ShipDao()
	{
		cd=new ConnectDatabase();
	}
	public int insert(Ship ship)
	{
		String sql="insert into ship(oid,place,datetime) values('"+ship.getOid()+"','"+ship.getPlace()+"','"+ship.getDatetime()+"')";
		int result=cd.executeUpdate(sql);
		cd.close();
		return result;
	}
	public List<Ship> select(String oid){
		String sql="select * from ship where oid='"+oid+"'";
		Ship ship = new Ship();
		ArrayList<Ship> as = new ArrayList<Ship>();
		ResultSet rs = cd.executeQuery(sql);
		try {
			while(rs.next()){
				ship = new Ship();
				ship.setId(rs.getInt("id"));
				ship.setOid(rs.getString("oid"));
				ship.setPlace(rs.getString("place"));
				ship.setDatetime(rs.getString("datetime"));
				as.add(ship);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		cd.close();
		return as;
	}
}
