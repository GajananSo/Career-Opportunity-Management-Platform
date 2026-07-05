package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EncodeDecodeUtil;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/userProfile")
public class UserProfileController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		EntityManager em = JPAUtil.getEm();

		User user = em.find(User.class, id);

		System.out.println("ID = " + req.getParameter("id"));
		System.out.println("DB Password = " + user.getPassword());
		
		String decodedPassword = EncodeDecodeUtil.decodeing(user.getPassword());
		
		System.out.println("Decoded Password = " + decodedPassword);

		em.detach(user);

		user.setPassword(decodedPassword);

		req.setAttribute("user", user);

		req.getRequestDispatcher("user-profile.jsp").forward(req, resp);
	}
}