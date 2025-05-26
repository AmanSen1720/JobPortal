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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			String email = req.getParameter("email1");
			String password = req.getParameter("password1");
			User u = new User();
			HttpSession session = req.getSession();
			
			if("admin@gmail.com".equals(email)&&"admin@123".equals(password)) {
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}else {
				
				UserDao dao = new UserDao(DbConnect.getCon());
				User user = dao.login(email, password);
				
				if(user!=null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("home.jsp");
				}else {
					session.setAttribute("msg", "Invald User and passoword");
					resp.sendRedirect("login.jsp");
				}
				
		
		
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}
}
