package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		User ok = null;
		
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			HttpSession httpSession = request.getSession();
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email,password);
			PrintWriter out = response.getWriter();
			if(user == null) {
				response.sendRedirect("Invalid.jsp ");
			}else {
				out.println("<h1>Welocome "+ user.getUserName()+"</h1><br>");
				httpSession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				else if(user.getUserType().equals("normal"))
				{
					response.sendRedirect("normal.jsp");
				}
				else {
					out.println("<h1>invalid use type</h1>");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
