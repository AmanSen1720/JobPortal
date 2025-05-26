package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.PreparableStatement;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		// TODO Auto-generated constructor stub
		this.con = con;
	}

	public boolean addUser(User u) {

		boolean f = false;

		try {

			String q = "insert into user(name,email,password,qualification,role) values  (?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getQualification());
			pstmt.setString(5, "user");

			int i = pstmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String em, String ps) {

		User u = null;

		try {
			
			String q = "Select * from user where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, em);
			pstmt.setString(2, ps);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}
	
	public boolean updateUser(User u) {
		boolean f =false;
		
		try {
			String q = "update user set name=?,email=?,password=?,qualification=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getQualification());
			pstmt.setInt(5, u.getId());
			
			int i = pstmt.executeUpdate();
			
			if(i==1) {
				f= true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
