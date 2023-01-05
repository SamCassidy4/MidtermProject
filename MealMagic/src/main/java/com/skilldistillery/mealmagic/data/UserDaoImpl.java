package com.skilldistillery.mealmagic.data;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		
		return em.find(User.class, userId);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		
		String query = "SELECT u from User u where u.username=:username AND u.password =:password";
		
		User user = em.createQuery(query, User.class)
				.setParameter("username", username)
				.setParameter("password", password).getSingleResult();
		
		return user;
	}

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
