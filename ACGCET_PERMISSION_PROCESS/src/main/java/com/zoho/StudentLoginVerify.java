package com.zoho;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentLoginVerify
 */
public class StudentLoginVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
		//response.getWriter().print("greetings");     //for debugging
		String uname=request.getParameter("username");
		String pass=request.getParameter("password");
		
		//Create object for login dao to access that
		StudentLoginVerifyDAO login=new StudentLoginVerifyDAO();
		boolean user_found=login.CheckUserExists(uname, pass);
		
		if(user_found) {
			int acc_status=login.GetAccStatus(uname, pass);
			if(acc_status==1) {
				 //create a object for EncryptDecryt class
 				  EncryptDecrypt obj=new EncryptDecrypt();
				//get a randomly generated encrypt key
           		String encrypted_key=obj.GetRandomEncryted_key();	
			    //update a randomly generated encrypt key in server
				int updation=login.UpdateLoginKey(uname, pass, encrypted_key);
				if(updation!=0) {
				Cookie cookie=new Cookie("student_login_key",encrypted_key);
			    response.addCookie(cookie);
				}
			}
			response.getWriter().print(acc_status);
			
		}else {
			response.getWriter().print("not_found");
		}
	}
	
}
