package com.poly.dao;

import java.util.List;

import com.poly.entity.Category;

public interface CategoryDAO {
	
	List<Category> findAll();

	Category findById(String id);

	void create(Category item);

	void update(Category item);

	void deleteById(String id);

}
