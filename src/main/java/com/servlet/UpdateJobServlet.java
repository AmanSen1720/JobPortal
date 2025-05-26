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

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String location = req.getParameter("location");
			String status = req.getParameter("status");
			String category = req.getParameter("category");

			Jobs j = new Jobs();
			j.setId(id);
			j.setDescription(description);
			j.setCategory(category);
			j.setLocation(location);
			j.setTitle(title);
			j.setStatus(status);

			HttpSession session = req.getSession();

			JobDao dao = new JobDao(DbConnect.getCon());
			boolean f = dao.UpdateJob(j);
			if (f) {

				session.setAttribute("msg", "Job Update Successfully..");
				resp.sendRedirect("view_job.jsp");
			} else {
				session.setAttribute("msg", "something wrong on server");
				resp.sendRedirect("view_job.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
