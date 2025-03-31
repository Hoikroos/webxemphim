package com.poly.dao;

import java.util.List;

import com.poly.entity.Category;
import com.poly.service.XJPA;
import jakarta.persistence.EntityManager;

public class CategoryDAOImpl implements CategoryDAO {

	EntityManager em = XJPA.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public List<Category> findAll() {
		String jpql = "SELECT c FROM Category c";
		return em.createQuery(jpql, Category.class).getResultList();
	}

	@Override
	public Category findById(String id) {
		return em.find(Category.class, id);
	}

	@Override
	public void create(Category entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void update(Category entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public void deleteById(String id) {
		Category entity = em.find(Category.class, id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
