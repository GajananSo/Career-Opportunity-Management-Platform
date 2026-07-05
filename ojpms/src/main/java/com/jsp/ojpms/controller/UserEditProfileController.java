package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/usereditProfile")
public class UserEditProfileController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = req.getParameter("role");

		User user = new User();

		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(role);

		UserDao.updateProfile(user);

		// update session
		req.getSession().setAttribute("user", user);
		// success popup
		req.getSession().setAttribute("successMessage", "Profile Updated Successfully");

		resp.sendRedirect("user-dashboard.jsp");
	}
}