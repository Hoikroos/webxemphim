package com.poly.dao;

import java.util.List;

import com.poly.entity.User;
import com.poly.entity.Video;

public interface UserDAO {

	List<User> findAll();

	User findByIdOrEmail(String idOrEmail);

	User findById(String id);

	void create(User user);

	void update(User user);

	void deleteById(String id);

	void updatePassword(String id, String newPassword);
}
