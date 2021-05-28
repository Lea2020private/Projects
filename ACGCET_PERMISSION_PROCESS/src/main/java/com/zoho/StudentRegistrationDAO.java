package com.zoho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class StudentRegistrationDAO {
	private String DataBaseDriver="com.mysql.cj.jdbc.Driver";
	private String DataBaseUrl="jdbc:mysql://localhost:3306/acgcet_permission_process";
	private String DataBaseUsername="root";
	private String DataBasePassword="";
	
	//class for insert all records
	private String name;
	private String username;
	private String regno;
	private String dept;
	private int year;
	private String mobno;
	private String email;
	private String role;
	private String club;
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
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setClub(String club) {
		this.club = club;
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
				PreparedStatement ps=con.prepareStatement("insert into student_details (`name`, `username`, `password`, `register_number`, `department`, `year`, `email`, `role`, `club`, `mobile_number`, `security_qn`, `security_ans`, `acc_status`) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,name);
				ps.setString(2,username);
				ps.setString(3,password);
				ps.setString(4,regno);
				ps.setString(5,dept);
				ps.setInt(6,year);
				ps.setString(7,email);
				ps.setString(8,role);
				ps.setString(9,club);
				ps.setString(10,mobno);
				ps.setString(11,security_qn);
				ps.setString(12,security_ans);
				ps.setInt(13,0);
				
				int execution=ps.executeUpdate(); //execute the command
				return execution;
			}catch(Exception e){
				System.out.println("SQLException: " + e.getMessage());
			}
			return 0;
			
	}
	
	public String GetUserId(String regno) {
			
				try {
					Class.forName(DataBaseDriver);  
					Connection con=DriverManager.getConnection(DataBaseUrl,DataBaseUsername,DataBasePassword); 
					PreparedStatement stmt=con.prepareStatement("select user_id from student_details where register_number=?");
					stmt.setString(1,regno);
					ResultSet rs=stmt.executeQuery();  
					if(rs.next()) {
						   int user_id=rs.getInt("user_id");
						   //create a object for EncryptDecryt class
						   EncryptDecrypt obj=new EncryptDecrypt();
						   
				           //encrypt the app_id
						   String encryptApp_id=obj.encryption(String.valueOf(user_id));
						   System.out.println("sucess");
						   
						return  encryptApp_id;  
					}
					con.close(); 
				}catch(Exception e){ 
				  System.out.println("SQLException: " + e.getMessage());
				   }  
				return "";
			}
	
	

}
