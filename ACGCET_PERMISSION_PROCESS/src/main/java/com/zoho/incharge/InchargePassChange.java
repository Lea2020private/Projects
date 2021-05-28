package com.zoho.incharge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentPassChange
 */
public class InchargePassChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//code change password
		 String newpassword=request.getParameter("newpassword");
	     String forgot_password_key="";
		
	     //get the forgot password key
		Cookie cookies[]=request.getCookies();
		for(Cookie c:cookies){
			if(c.getName().equals("incharge_forgot_password_key")){
				forgot_password_key=c.getValue();
			}
		}
        
		if(forgot_password_key!="") {
			try{  
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
				//Statement stmt= con.createStatement();  
				
				//now create prepared statement for update password
				PreparedStatement ps=con.prepareStatement("update incharge_details set password=? where forgot_password_key=?");
				ps.setString(1, newpassword);
				ps.setString(2,forgot_password_key);
				int execution=ps.executeUpdate();   //execute the command to change password
				if(execution!=0) {
					Cookie cookie=new Cookie("incharge_forgot_password_key","");
				    cookie.setMaxAge(0);
				    response.addCookie(cookie);
					response.getWriter().print("changed_successfully");
				}
				con.close();  
				}catch(Exception e){ 
					System.out.println("SQLException: " + e.getMessage());
					response.getWriter().print(e.getMessage());
				   }  
			
		}else {
			response.getWriter().print("failed");
		}
		
	}

}

