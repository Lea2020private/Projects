package com.zoho;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentPermission_back
 */
public class StudentPermissionRequest_back extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       //get all user entered data
       String permissionFor=request.getParameter("permission_for");
       String purposeFor_permission=request.getParameter("purpose");
       String date_time_from=request.getParameter("date_time_from");
       String date_time_to=request.getParameter("date_time_to");
       String eventDescription=request.getParameter("event_description");
      
       //get permission letter priority
       GetPermissionPriority obj=new GetPermissionPriority();
       String permissionPriority=obj.GetPriority(purposeFor_permission);
       
       //System.out.println("permissionPriority");
       //get a login key of a user
       String login_key="";
       Cookie cookies[]=request.getCookies();
       for(Cookie c:cookies){
       	if(c.getName().equals("student_login_key")){
       		login_key=c.getValue();
       	}
       }
       String student_id="";
 
       
       try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
			PreparedStatement ps=con.prepareStatement("select * from student_details where login_key=?");
			ps.setString(1,login_key);
			//exceute that query ,and get the current user details
			ResultSet rs=ps.executeQuery();	
			if(rs.next()) {
				student_id=rs.getString("user_id");
				}
			
			//insert the permission letter data's in server
			PreparedStatement ps_1=con.prepareStatement("INSERT INTO `permission_request_details` (`permission_for`, `purpose`, `date_time_from`, `date_time_to`, `description_about_purpose`, `requested_student_id`,  `permission_letter_priority`,`requested_time`) VALUES ( ?,?, ?, ?, ?, ?, ?,?)");
			ps_1.setString(1, permissionFor);
			ps_1.setString(2, purposeFor_permission);
			ps_1.setString(3, date_time_from);
			ps_1.setString(4, date_time_to);
			ps_1.setString(5, eventDescription);
			ps_1.setString(6, student_id);
			ps_1.setString(7, permissionPriority);
			ps_1.setString(8, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")).toString());
			
			int insertion=ps_1.executeUpdate();
			if(insertion!=0) {
				Statement stmt=con.createStatement(); 
				ResultSet rs_1=stmt.executeQuery("select permission_letter_no from permission_request_details order by permission_letter_no desc limit 1 ");
				if(rs_1.next()) {
					 System.out.println("sucessfully request inserted");
					 Cookie cookie=new Cookie("permission_letterno",rs_1.getString("permission_letter_no"));
					 response.addCookie(cookie);
					 response.getWriter().write("success");
				}
			}
				
         }catch(Exception e){ 
			System.out.println("SQLException: " + e.getMessage());
			   }
       
	}

}
