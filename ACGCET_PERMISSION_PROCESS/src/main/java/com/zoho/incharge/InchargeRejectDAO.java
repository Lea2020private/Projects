package com.zoho.incharge;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class InchargeRejectDAO {
	private String DataBaseDriver="com.mysql.cj.jdbc.Driver";
	private String DataBaseUrl="jdbc:mysql://localhost:3306/acgcet_permission_process";
	private String DataBaseUsername="root";
	private String DataBasePassword="";

	
	public int UpdateStatus(String permission_letter_no,String approver_id,String reject_reason) {
		try {
			Class.forName(DataBaseDriver);  
			Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
			
			String rejectTime=LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")).toString();
			//crate prepared statement for fetch records
			PreparedStatement ps_1=con.prepareStatement("update permission_request_details set permission_letter_status=2,approver_id=?,reject_reason=?,approved_time=? where permission_letter_no=?");
		    
		    ps_1.setString(1,approver_id);
		    ps_1.setString(2,reject_reason);
		    ps_1.setString(3,rejectTime);
		    ps_1.setString(4,permission_letter_no);
		    
		    
			//exceute that query ,update pemission letter status to approve
		    int updation=ps_1.executeUpdate();
			return updation;
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return 0;
	}
}
