package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet(value = "/updateApplicationStatus")
public class UpdateApplicationStatus  extends HttpServlet{

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			int appId = Integer.parseInt(req.getParameter("applicationId"));
			int jobId = Integer.parseInt(req.getParameter("jobId"));
			String status = req.getParameter("status");
			
			System.out.println("Applicart Id" + appId);
//			System.out.println("Job Id" + jobId);
			System.out.println("Status" + status);
			
			Application application  = ApplicationDao.updateStatus(appId, status);
			
			if(application == null) {
			    resp.sendRedirect("viewApplicants?jobId=" + jobId);
			    return;
			}
			
			String emailTo = application.getUser().getEmail();
			
			if("ACCEPTED".equals(application.getStatus())) {
				
				String subject = "Your Application for "
		                		+ application.getJob().getTitle()
		                		+ " has been Accepted | COMP Portal";
				
				String message =
				        "Dear " + application.getUser().getName() + ",\n\n"
				        + "Congratulations!\n\n"
				        + "We are pleased to inform you that your application "
				        + "for the position of " + application.getJob().getTitle()
				        + " has been successfully shortlisted and accepted.\n\n"
				        + "Our recruitment team will contact you shortly "
				        + "regarding the next steps in the hiring process.\n\n"
				        + "Thank you for choosing COMP Portal.\n\n"
				        + "Best Regards,\n"
				        + "COMP Portal Team";
				
				EmailUtil.sendEmail(emailTo, subject, message);
//				System.out.println(subject);
				resp.sendRedirect("viewApplicants?jobId=" + jobId);
				return;
				
			}else if("REJECTED".equals(application.getStatus())) {
				
				String subject = "Application Status Update - " 
								+ application.getJob().getTitle()
								+ " | COMP Portal";

				String message =
				        "Dear " + application.getUser().getName() + ",\n\n"
				        + "Thank you for your interest in the position of "
				        + application.getJob().getTitle() + ".\n\n"
				        + "After careful consideration of all applications, "
				        + "we regret to inform you that your application "
				        + "has not been selected for this opportunity.\n\n"
				        + "We appreciate the time and effort you invested "
				        + "in applying and encourage you to explore future "
				        + "opportunities through COMP Portal.\n\n"
				        + "We wish you success in your career journey.\n\n"
				        + "Best Regards,\n"
				        + "COMP Portal Team";
				
				EmailUtil.sendEmail(emailTo, subject, message);
//				System.out.println(subject+"REJECTED");
				resp.sendRedirect("viewApplicants?jobId=" + jobId);
				return;
			}
			
			resp.sendRedirect("viewApplicants?jobId=" + jobId);
			
			
		}

}
