package com.zoho.incharge;

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
 * Servlet implementation class InchargeApprove
 */
public class InchargeApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//perform to set approved status
		String permission_letter_no=request.getParameter("permission_no");
		String date_time_from=request.getParameter("date_time1");
		String date_time_to=request.getParameter("date_time2");
		String permission_for=request.getParameter("permission_for");
		
		String approver_id="";
		
		//get cookies to check if current user's details	
		String login_key="";
		 Cookie cookies[]=request.getCookies();
		 for(Cookie c:cookies){
		 	if(c.getName().equals("incharge_login_key")){
		 		login_key=c.getValue();
		 	}
		 }
		 
		try {	
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
			PreparedStatement stmt=con.prepareStatement("select * from incharge_details where login_key=?");
			stmt.setString(1,login_key);
			ResultSet rs=stmt.executeQuery(); 
			if(rs.next()){
				approver_id=rs.getString("user_id");
			 }
	
		}catch(Exception e) {
			System.out.println(e.getMessage());	
		}

		//create a object for InchargeApproveDAO class to perform some operation
		InchargeApproveDAO obj=new InchargeApproveDAO();
		if(!obj.AlredyOccupiedorNot(permission_letter_no, date_time_from, date_time_to,permission_for)) {
			int updateApprove=obj.UpdateStatus(permission_letter_no,approver_id);
			if(updateApprove!=0) {
				response.getWriter().write("approved");
			}
		}else {
			response.getWriter().write("occupied");
		}
	}

}
