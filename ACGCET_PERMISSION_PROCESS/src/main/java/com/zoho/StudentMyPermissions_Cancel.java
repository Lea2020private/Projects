package com.zoho;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentMyPermissions_Cancel
 */
public class StudentMyPermissions_Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String permission_letter_no=request.getParameter("permission_letter_num");
		
		 
	       try{  
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
				
				//delete the permission letter data  in the server
				PreparedStatement ps=con.prepareStatement("DELETE FROM `permission_request_details` WHERE permission_letter_no=?");
				ps.setInt(1, Integer.parseInt(permission_letter_no));
				int deletion=ps.executeUpdate();
				if(deletion!=0) {
					response.getWriter().print("success");
					System.out.println("permission request letter successfully deleted ");
				}
				
	         }catch(Exception e){ 
	        	 response.getWriter().print(e.getMessage());
				System.out.println("SQLException: " + e.getMessage());
				   }

	}

}
