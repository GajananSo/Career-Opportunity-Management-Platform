package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/editJobByRecruiter")
public class EditJobByRecruiterController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		String jobIdStr = req.getParameter("jobId");
//		String recIdStr = req.getParameter("recId");

		int jId = Integer.parseInt(req.getParameter("jobId"));
//		int rId = Integer.parseInt(recIdStr);

//		System.out.println("Find edit Job id:"+jId);

		EntityManager em = JPAUtil.getEm();
		Job find = em.find(Job.class, jId);

		req.setAttribute("jobObj", find);
		req.getRequestDispatcher("edit-job-by-recruiter.jsp").forward(req, resp);
	}
}