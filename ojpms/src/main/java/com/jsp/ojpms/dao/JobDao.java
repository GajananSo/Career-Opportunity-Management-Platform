package com.jsp.ojpms.dao;

import java.util.Base64;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class JobDao {

	public static boolean saveJob(Job job) {

		try {
			EntityManager em = JPAUtil.getEm();
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.persist(job);
			et.commit();

			return true;

		} catch (Exception e) {
			return false;
		}
	}

	public static List<Job> getAllJobs() {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job");
		List<Job> list = query.getResultList();
		return list;
	}

	public static List<Job> getAllJob(String search) {

		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job j WHERE j.title LIKE ?1 OR j.description LIKE ?1 OR j.location LIKE ?1");

		query.setParameter(1, "%" + search + "%");

		return query.getResultList();
	}

	public static List<Job> getRecruiterJobs(int id) {

		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job WHERE recuriter_id = :id");

		query.setParameter("id", id);

		List<Job> list = query.getResultList();

		return list;
	}

	public static boolean updateJob(Job jobObj) {

		try {
			EntityManager em = JPAUtil.getEm();
			EntityTransaction et = em.getTransaction();

			et.begin();
			em.merge(jobObj);
			et.commit();

			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean deleteJobById(int jobId) {

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		try {

			et.begin();

			Query q0 = em.createNativeQuery("DELETE FROM users_jobs WHERE savedJobs_id = ?");
			q0.setParameter(1, jobId);
			q0.executeUpdate();

			Query q1 = em.createQuery("DELETE FROM Application WHERE job.id = :id");
			q1.setParameter("id", jobId);
			q1.executeUpdate();

			Query q2 = em.createQuery("DELETE FROM Job j WHERE j.id = :id");
			q2.setParameter("id", jobId);

			int rowsDeleted = q2.executeUpdate();

			et.commit();

			return rowsDeleted > 0;

		} catch (Exception e) {

			e.printStackTrace();

			if (et.isActive()) {
				et.rollback();
			}

			return false;
		}
	}

	// Rutuja Code

	public static List<Job> getAllJobsSortedByLatest() {
		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job j ORDER BY j.id DESC");

		return query.getResultList();
	}

	public static List<Job> getAllJobsSortedBySalary() {
		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job j ORDER BY j.salary DESC");

		return query.getResultList();
	}

	public static List<Job> getAllJobsSortedByMostApplied() {
		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("SELECT j FROM Job j " + "LEFT JOIN Application a ON a.job.id = j.id "
				+ "GROUP BY j.id " + "ORDER BY COUNT(a.id) DESC");

		return query.getResultList();
	}
}