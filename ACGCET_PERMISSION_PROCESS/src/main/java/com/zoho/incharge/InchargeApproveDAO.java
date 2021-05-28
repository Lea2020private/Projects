package com.zoho.incharge;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class InchargeApproveDAO {
	private String DataBaseDriver="com.mysql.cj.jdbc.Driver";
	private String DataBaseUrl="jdbc:mysql://localhost:3306/acgcet_permission_process";
	private String DataBaseUsername="root";
	private String DataBasePassword="";

	
	public int UpdateStatus(String permission_letter_no,String approver_id) {
		try {
			Class.forName(DataBaseDriver);  
			Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
			String approvedTime=LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")).toString();
			//crate prepared statement for fetch records
			PreparedStatement ps_1=con.prepareStatement("update permission_request_details set permission_letter_status=1,approver_id=?,approved_time=? where permission_letter_no=?");
		    
		    ps_1.setString(1,approver_id);
		    ps_1.setString(2,approvedTime);
		    ps_1.setString(3,permission_letter_no);
		    
			//exceute that query ,update pemission letter status to approve
		    int updation=ps_1.executeUpdate();
			return updation;
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return 0;
	}
	
	
	public boolean AlredyOccupiedorNot(String permission_letter_no,String date_time_from,String date_time_to,String permission_for) {
		try {
			Class.forName(DataBaseDriver);  
			Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
			//crate prepared statement for fetch records
			PreparedStatement ps_1=con.prepareStatement("select * from permission_request_details where permission_letter_no!=? and permission_for=? and date_time_from=? and date_time_to=? and permission_letter_status=1");
		    ps_1.setString(1,permission_letter_no);
		    ps_1.setString(2,permission_for);
		    ps_1.setString(3,date_time_from);
		    ps_1.setString(4,date_time_to);
			
			//exceute that query ,check the wanted equipment alredy occupied or not
			ResultSet rs=ps_1.executeQuery();
			return rs.next();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return false;
	}
	

}
