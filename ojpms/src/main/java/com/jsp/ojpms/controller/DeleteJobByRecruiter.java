package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;

@WebServlet(value = "/deleteJobByRecruiter")
public class DeleteJobByRecruiter extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int jobId = Integer.parseInt(req.getParameter("jobId"));

		boolean deleteJobById = JobDao.deleteJobById(jobId);

		if (deleteJobById) {
			req.setAttribute("successMessage", "Job Deleted Successfully");
		} else {
			req.setAttribute("errorMessage", "Failed To Delete Job");
		}

		req.getRequestDispatcher("recruiter-dashboard.jsp").forward(req, resp);
	}
}