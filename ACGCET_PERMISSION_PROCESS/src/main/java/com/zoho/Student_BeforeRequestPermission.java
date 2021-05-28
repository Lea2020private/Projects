package com.zoho;

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
 * Servlet implementation class Student_BeforeRequestPermission
 */
public class Student_BeforeRequestPermission extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	
	//in this class check permission request date and time already occupied or not and then
	//notify student to priority of the request
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		   String permissionFor=request.getParameter("permission_for");
	       String purposeFor_permission=request.getParameter("purpose");
	       String date_time_from=request.getParameter("date_time_from");
	       String date_time_to=request.getParameter("date_time_to");
	       
	       
	       
	       //create object for get permission piriority
	       
	       GetPermissionPriority obj=new GetPermissionPriority();
	       
	       int permissionLetterPriority=Integer.parseInt(obj.GetPriority(purposeFor_permission));
	      
	       try{
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root","");
				
				//now check the requested date and time is alredy occupied or not
				PreparedStatement ps_1=con.prepareStatement("select * from permission_request_details where permission_for=? and date_time_from=? and date_time_to=? and permission_letter_status=1");
				ps_1.setString(1,permissionFor);
				ps_1.setString(2,date_time_from);
				ps_1.setString(3,date_time_to);
				ResultSet rs_1=ps_1.executeQuery();  //using resultset to get the output		
				
				//now check the requested date and time is alredy requested or not
				PreparedStatement ps_2=con.prepareStatement("select * from permission_request_details where permission_for=? and date_time_from=? and date_time_to=? and permission_letter_status=0");
				ps_2.setString(1,permissionFor);
				ps_2.setString(2,date_time_from);
				ps_2.setString(3,date_time_to);
				ResultSet rs_2=ps_2.executeQuery();  //using resultset to get the output	
				
				if(rs_1.next()) {
					System.out.println("equipment already occupied");
					response.getWriter().write("occupied");	
					
				}else if(rs_2.next()) {
					
					//getting alredy entered permission priority
					PreparedStatement ps_3=con.prepareStatement("select permission_letter_priority from permission_request_details where permission_for=? and date_time_from=? and date_time_to=? and permission_letter_status=0 order by permission_letter_priority desc limit 1");
					ps_3.setString(1,permissionFor);
					ps_3.setString(2,date_time_from);
					ps_3.setString(3,date_time_to);
					ResultSet rs_3=ps_3.executeQuery();
					if(rs_3.next()) {
						int higher_priority_permission=Integer.parseInt(rs_3.getString("permission_letter_Priority"));
		                //compare both priority and response which higher and greater
						if(permissionLetterPriority<higher_priority_permission) {
							response.getWriter().write("priority_less");
						}else {
							response.getWriter().write("priority_more");
						}
					}
	         	}else {
					
					System.out.println("equipment free to use");
					response.getWriter().write("free");
				}
					
				
	       }catch(Exception e) {
	    	   System.out.println(e.getMessage());
	       }
	       
  
   
	       //response.getWriter().write("checking");
		
		
	}

}
