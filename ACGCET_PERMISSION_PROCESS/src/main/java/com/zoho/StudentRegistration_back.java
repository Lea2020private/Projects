package com.zoho;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.apache.commons.fileupload.FileItem;
//  
//import com.oreilly.servlet.MultipartRequest; 



/**
 * Servlet implementation class StudentRegistration_back
 */
public class StudentRegistration_back extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
protected //	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
//	
	   // file name of the upload file is included in content-disposition header like this:
    // name="dataFile";filename="PHOTO.JPG"

    
       
   

	 void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stu
	   //getting all the user entered values
	   String name=request.getParameter("name");
	   String uname=request.getParameter("uname");
	   String regno=request.getParameter("regno");
	   String dept=request.getParameter("dept");
	   
//	   System.out.print(request.getParameter("name"));  //for debugging

	   int year=Integer.parseInt(request.getParameter("year"));
	   String mobno=request.getParameter("mobno");
	   String email=request.getParameter("email");
	   String role=request.getParameter("role");
	   String club=request.getParameter("club");
	   
	   String password=request.getParameter("pass");
	   String security_qn=request.getParameter("securityqn");
	   String security_ans=request.getParameter("securityans");
	  
	   //uploading file 

	   //insert student records using StudentRegistrationDAO class
	   StudentRegistrationDAO obj=new  StudentRegistrationDAO();
	   obj.setName(name);
	   obj.setUsername(uname);
	   obj.setMobno(mobno);
	   obj.setDept(dept);
	   obj.setEmail(email);
	   obj.setRegno(regno);
	   obj.setClub(club);
	   obj.setRole(role);
	   obj.setPassword(password);
	   obj.setSecurity_qn(security_qn);
	   obj.setSecurity_ans(security_ans);
	   obj.setYear(year);
	   
	   //get status of record inserted or not
	   int insertionStatus=obj.insertStudentRecords();
	   
	   if(insertionStatus!=0) {
		   String encryptUser_id=obj.GetUserId(regno);
		   
		   //create a cookie and add application id
		   Cookie cookie=new Cookie("user_id",encryptUser_id); 
     	   response.addCookie(cookie);
     	   
     	   System.out.println("sucess");
     	  response.sendRedirect("Student/AfterStudentRegistration.jsp");
	       
	   }else {
		   System.out.println("SQLException: " + insertionStatus);
           response.sendRedirect("Student/StudentRegistration_Error.jsp");
	   }
	}
}

