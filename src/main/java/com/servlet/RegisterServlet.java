package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DbConnect;
import com.entity.User;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  
	
		try {
			String  name= req.getParameter("fullname");
			String qualification = req.getParameter("qualification");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			UserDao udao = new UserDao(DbConnect.getCon());
			
			User u = new User(name,email,password,qualification,"User");
			
			boolean f = udao.addUser(u);
			
			HttpSession session = req.getSession();
			
			if (f) {

				session.setAttribute("msg", "Registration Successfull..");
				resp.sendRedirect("Signup.jsp");
			} else {
				session.setAttribute("msg", "something wrong on server");
				resp.sendRedirect("Signup.jsp.jsp");
			}

		
			
			
		} catch (Exception e) {
		  e.printStackTrace();
		}
		
	}

}
