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

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String qualification = req.getParameter("qualification");
			
			UserDao dao = new UserDao(DbConnect.getCon());
			
			User u = new User();
			
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			u.setPassword(password);
			u.setQualification(qualification);
			
			boolean f = dao.updateUser(u);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("msg", "Profile update successfully");
				resp.sendRedirect("home.jsp");
			}else {
				
				session.setAttribute("msg", "Something went on server");
				resp.sendRedirect("home.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
