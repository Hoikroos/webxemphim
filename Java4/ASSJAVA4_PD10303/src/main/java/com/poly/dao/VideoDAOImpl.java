package com.poly.dao;

import java.util.ArrayList;
import java.util.List;
import com.poly.entity.Video;
import com.poly.service.XJPA;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class VideoDAOImpl implements VideoDAO {
	EntityManager em = XJPA.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public Video findById(String id) {
		return em.find(Video.class, id);
	}

	@Override
	public List<Video> findAll() {
		try {
			return em.createQuery("SELECT v FROM Video v", Video.class).getResultList();
		} catch (Exception e) {
			return new ArrayList<>();
		}
	}

	@Override
	public void create(Video video) {
		try {
			em.getTransaction().begin();
			em.persist(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void update(Video video) {
		try {
			em.getTransaction().begin();
			em.merge(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void deleteById(String id) {
		Video video = em.find(Video.class, id);
		if (video != null) {
			try {
				em.getTransaction().begin();
				em.remove(video);
				em.getTransaction().commit();
			} catch (Exception e) {
				em.getTransaction().rollback();
			}
		}
	}

	@Override
	public List<Video> findActiveVideos() {
		String jpql = "SELECT v FROM Video v WHERE v.active = true";
		return em.createQuery(jpql, Video.class).getResultList();
	}

	@Override
	public List<Video> findVideosByCategoryId(String categoryId) {
		String jpql = "SELECT v FROM Video v WHERE v.category.id = :categoryId AND v.active = true";
		return em.createQuery(jpql, Video.class).setParameter("categoryId", categoryId).getResultList();
	}

	@Override
	public List<Video> findNewestVideos(int limit) {
		return em.createQuery("SELECT v FROM Video v WHERE v.active = true ORDER BY v.years DESC", Video.class)
				.setMaxResults(limit).getResultList();
	}

	@Override
	public List<Video> findByName(String title) {
		String jpql = "SELECT v FROM Video v WHERE v.title LIKE :title";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("title", "%" + title + "%");
		return query.getResultList();
	}
}
