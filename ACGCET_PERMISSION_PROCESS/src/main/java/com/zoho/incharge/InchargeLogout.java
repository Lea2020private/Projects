package com.zoho.incharge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentLogout
 */
public class InchargeLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie cookie=new Cookie("incharge_login_key","");
		cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	    response.sendRedirect("Incharge/InchargeLogin.jsp");
	    
	}
}
