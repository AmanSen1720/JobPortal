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
@WebServlet("/delete")
public class DeletJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			JobDao dao = new JobDao(DbConnect.getCon());
			boolean f = dao.deleteJobs(id);

			HttpSession session = req.getSession();

			
			if (f) {

				session.setAttribute("msg", "Job deleted Successfully..");
				resp.sendRedirect("add_job.jsp");
			} else {
				session.setAttribute("msg", "something wrong on server");
				resp.sendRedirect("add_job.jsp");
			}

		} catch (Exception e) {

		}
	}

}
