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

@WebServlet(value = "/viewjob")
public class ViewJobController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sortBy = req.getParameter("sortBy");
		List<Job> list;

		if ("salary".equals(sortBy)) {

			list = JobDao.getAllJobsSortedBySalary();

		} else if ("applied".equals(sortBy)) {

			list = JobDao.getAllJobsSortedByMostApplied();

		} else {

			// Default → latest jobs
			list = JobDao.getAllJobsSortedByLatest();
		}

		req.setAttribute("jobs", list);
		req.setAttribute("sortBy", sortBy);

		req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
	}
}
