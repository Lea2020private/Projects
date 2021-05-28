package com.zoho.incharge;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.zoho.*;



public class InchargeRegistrationDAO {
	private String DataBaseDriver="com.mysql.cj.jdbc.Driver";
	private String DataBaseUrl="jdbc:mysql://localhost:3306/acgcet_permission_process";
	private String DataBaseUsername="root";
	private String DataBasePassword="";
	
	//class for insert all records
	private String name;
	private String username;
	private String dept;
	private String mobno;
	private String email;
	private String position;
	private String password;
	private String security_qn;
	private String security_ans;
	
	
	//create setters for set all the fields
	public void setName(String name) {
		this.name = name;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setSecurity_qn(String security_qn) {
		this.security_qn = security_qn;
	}
	public void setSecurity_ans(String security_ans) {
		this.security_ans = security_ans;
	}
	
	//connecting database
	public int insertStudentRecords() {
			try{  
				Class.forName(DataBaseDriver);  
				Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
				//Statement stmt= con.createStatement();  
				
				//crate prepared statement for insert records
				PreparedStatement ps=con.prepareStatement("insert into incharge_details (`name`, `username`, `password`, `department`, `email`, `position`, `mobile_number`, `security_qn`, `security_ans`, `acc_status`) values(?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,name);
				ps.setString(2,username);
				ps.setString(3,password);
				ps.setString(4,dept);
				ps.setString(5,email);
				ps.setString(6,position);
				ps.setString(7,mobno);
				ps.setString(8,security_qn);
				ps.setString(9,security_ans);
				ps.setInt(10,0);
				
				int execution=ps.executeUpdate(); //execute the command
				return execution;
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
			}
			return 0;
			
	}
	
	public String GetUserId(String uname) {
			
				try {
					Class.forName(DataBaseDriver);  
					Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
					PreparedStatement stmt=con.prepareStatement("select user_id from incharge_details where username=?");
					stmt.setString(1,uname);
					ResultSet rs=stmt.executeQuery();  
					if(rs.next()) {
						   int user_id=rs.getInt("user_id");
						   //create a object for EncryptDecryt class
						   EncryptDecrypt obj=new EncryptDecrypt();
						   
				           //encrypt the app_id
						   String encryptUser_id=obj.encryption(String.valueOf(user_id));
						   System.out.println("sucess");
						   
						return  encryptUser_id;  
					}
					con.close(); 
				}catch(Exception e){ 
				  System.out.println("SQLException: " + e.getMessage());
				   }  
				return "";
			}
	
	

}
