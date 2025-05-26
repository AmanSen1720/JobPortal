package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {

	public static Connection con;
	
	public static Connection getCon(){
		
		try {
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","aman@123");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return con;
	}
	
}
