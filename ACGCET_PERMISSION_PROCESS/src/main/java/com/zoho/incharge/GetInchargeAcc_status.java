package com.zoho.incharge;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetInchargeAcc_status
 */
public class GetInchargeAcc_status extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get user entered id
		   String userid=request.getParameter("userId");
	        
	        //get incharge account opening status
	        
	        try{  
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
				//Statement stmt= con.createStatement();  
				
				//now create prepared statement for update password
				PreparedStatement ps=con.prepareStatement("select acc_status from incharge_details where user_id=?");
				ps.setString(1, userid);
				ResultSet rs=ps.executeQuery();  //execute the command to get status
			    
				if(rs.next()) {
					int status=rs.getInt("acc_status");
					response.getWriter().print(status);
					
				}else {
					response.getWriter().print("notfound");
				}
				
				
				con.close();  
				}catch(Exception e){ 
					System.out.println("SQLException: " + e.getMessage());
					response.getWriter().print(e.getMessage());
				   } 
	}

}
