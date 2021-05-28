package com.zoho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentLoginVerifyDAO {
  //database access variables
	private String DataBaseDriver="com.mysql.cj.jdbc.Driver";
	private String DataBaseUrl="jdbc:mysql://localhost:3306/acgcet_permission_process";
	private String DataBaseUsername="root";
	private String DataBasePassword="";

	
	public boolean CheckUserExists(String uname,String pass) {
		try {
			Class.forName(DataBaseDriver);  
			Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
			//crate prepared statement for fetch records
			PreparedStatement ps=con.prepareStatement("select * from student_details where username=? and password=?");
			ps.setString(1,uname);
			ps.setString(2, pass);
			
			//exceute that query ,username and password match if any data found
			ResultSet rs=ps.executeQuery();
			return rs.next();
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return false;
	}
	public int GetAccStatus(String uname,String pass) {
		try {
			Class.forName(DataBaseDriver);  
			Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
			//crate prepared statement for fetch records
			PreparedStatement ps=con.prepareStatement("select * from student_details where username=? and password=?");
			ps.setString(1,uname);
			ps.setString(2, pass);
			
			//exceute that query ,username and password match if any data found
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
			return rs.getInt("acc_status");
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return 0;
	}
	
	public int UpdateLoginKey(String uname,String pass,String login_key) {
		try {
			Class.forName(DataBaseDriver);  
			Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
			//crate prepared statement for fetch records
			PreparedStatement ps_1=con.prepareStatement("update student_details set login_key=? where username=? and password=?");
			ps_1.setString(1, login_key);
    		ps_1.setString(2,uname);
     		ps_1.setString(3, pass);
			
			//exceute that query ,username and password match if any data found
     		int updation=ps_1.executeUpdate();
			return updation;
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return 0;
	}
	
}
