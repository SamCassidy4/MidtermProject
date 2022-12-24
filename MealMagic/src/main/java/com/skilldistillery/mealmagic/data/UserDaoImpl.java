package com.skilldistillery.mealmagic.data;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Category findById(int userId) {
		
		return em.find(Category.class, userId);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		
		return null;
	}

}
