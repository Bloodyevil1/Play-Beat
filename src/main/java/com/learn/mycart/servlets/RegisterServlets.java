package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.System;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;


public class RegisterServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterServlets() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			  String userName = request.getParameter("user_name");
			  String userEmail = request.getParameter("user_email");
			  String userPassword = request.getParameter("user_password");
			  String userPhone =request.getParameter("user_phone");
			  String userAddress =request.getParameter("user_address");
			  
			  User user =new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
			  
			  Session hibernateSession =FactoryProvider.getFactory().openSession();
			  
			  Transaction tx = hibernateSession.beginTransaction();
			  
			int userId =(int) hashCode();hibernateSession.save(user);
			  
			  tx.commit();
			  hibernateSession.close();
			  
			  response.setContentType("text/html");
			  PrintWriter out = response.getWriter();
			  out.println("<h1>Registered Successfully...</h1>"+userId);
				out.println("<h1  align=center><a href=Register.jsp>Back to Login</a></h1>");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
