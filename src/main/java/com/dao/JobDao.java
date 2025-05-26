package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.mysql.cj.protocol.Resultset;

public class JobDao {

	private Connection con;

	public JobDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJobs(Jobs j) {
		
		boolean f = false;
		
		try {
			
			String q = "insert into jobs (title,description,category,status,location) values (?,?,?,?,?) ";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, j.getTitle());
			pstmt.setString(2, j.getDescription());
			pstmt.setString(3, j.getCategory());
			pstmt.setString(4, j.getStatus());
			pstmt.setString(5, j.getLocation());
			
			int i = pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Jobs> 	getAllJobs(){
		
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String q= "Select * from jobs order by id desc";
			PreparedStatement pstmt = con.prepareStatement(q);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				list.add(j);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return list;
	}
	
public Jobs getJobById(int id){
		
		
		Jobs j = null;
		
		try {
			String q= "Select * from jobs where id=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				j = new Jobs();
				
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) +" ");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return j;
	}

	public boolean UpdateJob(Jobs j) {
	boolean f = false;
		
		try {
			
			String q = "update Jobs set title=?,description=?,category=?,status=?,location=? where id=? ";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, j.getTitle());
			pstmt.setString(2, j.getDescription());
			pstmt.setString(3, j.getCategory());
			pstmt.setString(4, j.getStatus());
			pstmt.setString(5, j.getLocation());
			pstmt.setInt(6,j.getId());
			
			int i = pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteJobs(int id ) {
		
boolean f = false;
		
		try {
			
			String q = "delete from jobs where id=? ";
			
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setInt(1,id);
			
			int i =pstmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<Jobs> getJobsORLocationAndCate(String category,String location){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String q = "Select * from jobs where category=? or location=? order by id desc";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, category);
			pstmt.setString(2, location);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	return list;
	}
	
	public List<Jobs> getJobsAndLocationAndCate(String category,String location){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String q = "Select * from jobs where category=? and location=? order by id desc";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, category);
			pstmt.setString(2, location);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	return list;
	}
}
