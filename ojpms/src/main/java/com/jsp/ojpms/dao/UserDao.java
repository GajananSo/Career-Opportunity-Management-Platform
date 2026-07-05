package com.jsp.ojpms.dao;

import java.util.Base64;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EmailUtil;
import com.jsp.ojpms.util.EncodeDecodeUtil;
import com.jsp.ojpms.util.JPAUtil;

public class UserDao {

	public static void save(User user) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		String encodedPassword = EncodeDecodeUtil.encodeing(user.getPassword());

		user.setPassword(encodedPassword);

		et.begin();
		em.persist(user);
		et.commit();

		System.out.println(user);
	}

	public static boolean updatePassword(String email, String password) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		String encodedPassword = EncodeDecodeUtil.encodeing(password);
		
		Query query = em.createQuery("UPDATE User u SET u.password = :password WHERE u.email = :email");
		query.setParameter("email", email);
		query.setParameter("password", encodedPassword);

		et.begin();
		int rowsUpdated = query.executeUpdate();
//		User user = (User) query.getSingleResult();
//		em.merge(user);
		et.commit();
		
		em.clear();

		return rowsUpdated > 0;
	}

	public static User getUser(String email, String password) {
		try {
			EntityManager em = JPAUtil.getEm();
			Query query = em.createQuery("FROM User WHERE email=?1 AND password=?2");
			
//			System.out.println("before initial");
//			System.out.println("email -==>"+email);
//			System.out.println("password -==>"+password);

			String encodedPassword = EncodeDecodeUtil.encodeing(password);
//			System.out.println("find encry password :"+encodedPassword);
			
			query.setParameter(1, email);
			query.setParameter(2, encodedPassword);

			User user = (User) query.getSingleResult();
			
//			System.out.println("After quere result \n"+user);

//			String decoded = EncodeDecodeUtil.decodeing(user.getPassword());
//
//			user.setPassword(decoded);

//			System.out.println("After decode getUser");
//			System.out.println("email -==>"+user.getEmail());
//			System.out.println("password -==>"+user.getPassword());
			
//			em.close();
			return user;
		} catch (Exception e) {
			return null;
		}

	}

	public static void updateProfile(User userObj) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		String encodedPassword = EncodeDecodeUtil.encodeing(userObj.getPassword());

		userObj.setPassword(encodedPassword);

		et.begin();
		em.merge(userObj);
		et.commit();

		System.out.println(userObj);
	}
	
	public static User getRecruiterByJobId(int uId) {
		EntityManager em = JPAUtil.getEm();
		
		Query query = em.createQuery("FROM User WHERE id= :id");
		
		query.setParameter("id", uId);
		
		User result = (User) query.getSingleResult();
		
		return result;
	}
	
	
	private static List<User> getJobSeekerEmail() {
		
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM User WHERE role= :role");
		query.setParameter("role", "JOB_SEEKER");
		
		List<User> listUser = query.getResultList();
		
		return listUser;
	}
	
	
	public static void jobSeekerToSend(Job job) {
		
		List<User> jobSeekerEmail = getJobSeekerEmail();
		
		for(User user : jobSeekerEmail) { 
			
			String subject = "New Job Posted | COMP Portal"; 
			String message = "Dear " + user.getName() + ",\n\n" 
							 + "A new job opportunity " 
							 + "has been posted on " 
							 + "COMP Portal.\n\n" 
							 + "Job Details:\n" 
							 + "---------------------------------\n" 
							 + "Job Title : " + job.getTitle() 
							 + "\n" + "Location : " + job.getLocation() 
							 + "\n" + "Salary : ₹" + job.getSalary() 
							 + "\n\n" + "Job Description:\n" + job.getDescription() 
							 + "\n\n" + "Are you interested " 
							 + "in this opportunity?\n\n" 
							 + "Login to COMP Portal " 
							 + "and confirm your interest.\n\n" 
							 + "Best Regards,\n" 
							 + "COMP Portal Team"; 
			EmailUtil.sendEmail( user.getEmail(), subject, message); }
	}
}