package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet("/viewRecruiterJobs")
public class DisplayPostJobByRecruiterController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		String idStr = req.getParameter("id");
		int parseInt = Integer.parseInt(req.getParameter("id"));

//		System.out.println(parseInt);

		List<Job> recruiterJobs = JobDao.getRecruiterJobs(parseInt);

		req.setAttribute("RecJobs", recruiterJobs);
		req.getRequestDispatcher("recruiter-view-jobs.jsp").forward(req, resp);
	}
}