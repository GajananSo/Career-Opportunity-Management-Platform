package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/updateJobByRecruiter")
public class UpdateJobByRecruiter extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String location = req.getParameter("location");
		String salary = req.getParameter("salary");
		int recId = Integer.parseInt(req.getParameter("recId"));

//		System.out.println(title);
//		System.out.println(id);
//		System.out.println(description);
//		System.out.println(location);
//		System.out.println(salary);

		Job job = new Job();
		job.setId(id);
		job.setTitle(title);
		job.setDescription(description);
		job.setLocation(location);
		job.setSalary(Double.parseDouble(salary));

		User recruiterByJobId = UserDao.getRecruiterByJobId(recId);
		job.setRecuriter(recruiterByJobId);

		boolean updateJob = JobDao.updateJob(job);

		if (updateJob) {
//			System.out.println("Update Status : " + updateJob);
			req.setAttribute("successMessage", "Job Updated Successfully");
		} else {
			req.setAttribute("errorMessage", "Failed To Update Job");
		}

		req.getRequestDispatcher("recruiter-dashboard.jsp").forward(req, resp);
	}
}