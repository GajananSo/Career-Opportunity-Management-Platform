package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet("/unsavejob")
public class UnsaveJobController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		int jobId = Integer.parseInt(req.getParameter("jobId"));

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("user");

		EntityManager em = JPAUtil.getEm();

		EntityTransaction et = em.getTransaction();

		Job job = em.find(Job.class, jobId);

		et.begin();

		user.getSavedJobs().remove(job);

		em.merge(user);

		et.commit();

		resp.sendRedirect("savedjobs.jsp");
	}
}
