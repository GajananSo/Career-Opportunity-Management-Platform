package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class ApplicationDao {

	public static void saveApplication(Application applObj) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.persist(applObj);
		et.commit();
	}

	public static boolean isApplyAlready(int userId, int jobId) {

		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Application WHERE user.id=?1 AND job.id=?2");

		query.setParameter(1, userId);
		query.setParameter(2, jobId);

		List resultList = query.getResultList();

		boolean empty = resultList.isEmpty();

		return !empty;
	}
	
	public static List<Application> getApplicantUsersByJobId(int jobId){
		
		EntityManager em = JPAUtil.getEm();
		
		Query query = em.createQuery("FROM Application a WHERE a.job.id = :jobId");

		query.setParameter("jobId", jobId);
		
		 List <Application> list = query.getResultList();
		
		return list;
	}
	
	
	public static Application updateStatus(int appId, String status) {
		
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		
		Application applicats = em.find(Application.class, appId);
		
		et.begin();
		
		applicats.setStatus(status);
		
		em.merge(applicats);
		
		et.commit();
		
		return applicats;
	}
}