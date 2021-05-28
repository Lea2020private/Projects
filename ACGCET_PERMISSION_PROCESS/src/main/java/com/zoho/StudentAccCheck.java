package com.zoho;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentAccCheck
 */
public class StudentAccCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//check student account is exists or not
		response.setContentType("text/plain");
		//response.getWriter().print("greetings");     //for debugging
		String uname=request.getParameter("username");
	    String regno=request.getParameter("regno");
	    String securityqn=request.getParameter("securityqn");
	    String securityans=request.getParameter("securityans");
	    
	    
	    //code to check acc exists using uname and regno
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
		//Statement stmt= con.createStatement();  
		
		//crate prepared statement for fetch records
		PreparedStatement ps=con.prepareStatement("select * from student_details where username=? and register_number=?");
		ps.setString(1,uname);
		ps.setString(2,regno);
		
		//exceute that query ,username and password match if any data found in database
		ResultSet rs=ps.executeQuery();
		
		//create a object for EncryptDecryt class
		 EncryptDecrypt obj=new EncryptDecrypt();
		
		
		if(rs.next()) {
			int acc_status=rs.getInt("acc_status");	
			//encrypt a regno 
			String forgot_password_key=obj.GetRandomEncryted_key();
			if(acc_status==1) {
                if((rs.getString("security_qn").equals(securityqn)) && (rs.getString("security_ans").equals(securityans))) {
                	PreparedStatement ps_1=con.prepareStatement("update student_details set forgot_password_key=? where username=? and register_number=?");
                	ps_1.setString(1, forgot_password_key);
                	ps_1.setString(2,uname);
            		ps_1.setString(3,regno);
            	
            		//exceute that query to update new password
            		 ps_1.executeUpdate();
                	Cookie cookie=new Cookie("student_forgot_password_key",forgot_password_key);  //set cookie for forgot password
    			    response.addCookie(cookie);
                	response.getWriter().print("exists");
                }else {
                	response.getWriter().print("mismatch");
                	
                }
			   
			}else if(acc_status==2) {
			    	response.getWriter().print("rejected");
			    }else {
			    	response.getWriter().print("waiting");
			    }
			
			
		}else {
			response.getWriter().print("not_found");
		}
		
		}catch(Exception e) {
			response.getWriter().println("SQLException: " + e.getMessage());
		}
	    
	    
	}

}
