package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDao;
import com.db.DbConnect;
import com.entity.Jobs;

@WebServlet("/addjob")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String location = req.getParameter("location");
			String status = req.getParameter("status");
			String category = req.getParameter("category");
			
			Jobs j = new Jobs();
			
			
			j.setTitle(title);
			j.setDescription(description);
			j.setLocation(location);
			j.setStatus(status);
			j.setCategory(category);
			
			HttpSession session = req.getSession();
			
			JobDao dao = new JobDao(DbConnect.getCon());
			boolean f = dao.addJobs(j);
			if(f) {
				
				session.setAttribute("msg", "Job Post Successfully..");
				resp.sendRedirect("add_job.jsp");
			}else {
	
				session.setAttribute("msg", "something wrong on server");
				resp.sendRedirect("add_job.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
