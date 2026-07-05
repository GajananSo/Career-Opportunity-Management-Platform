package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;


@WebServlet(value = "/viewApplicants")
public class HowManyApplicant extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int jobId = Integer.parseInt(req.getParameter("jobId"));
		
		List<Application> applicants = ApplicationDao.getApplicantUsersByJobId(jobId);
		
//		req.setAttribute("jobId", jobId);
		req.setAttribute("applicants", applicants);
		
		req.getRequestDispatcher("view-applicants.jsp").forward(req, resp);
	}

}
