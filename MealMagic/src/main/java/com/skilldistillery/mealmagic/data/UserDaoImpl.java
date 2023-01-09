package com.skilldistillery.mealmagic.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Recipe;
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
		User user = null;
		try {
			String query = "SELECT u FROM User u WHERE u.username=:username AND u.password =:password";

			user = em.createQuery(query, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public boolean deleteUser(int id) {
		boolean userWasDeleted = false;
		User deletedUser = em.find(User.class, id);
		if (deletedUser != null) {
			em.remove(deletedUser);
			userWasDeleted = !em.contains(deletedUser);
		}

		return userWasDeleted;
	}

	@Override
	public User updateUser(User user) {
		User updatedUser = em.find(User.class, user.getId());

		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setEnabled(user.getEnabled());
		updatedUser.setRole(user.getRole());
		updatedUser.setCreatedDate(user.getCreatedDate());
		updatedUser.setLastUpdate(user.getLastUpdate());
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setUserBio(user.getUserBio());
		updatedUser.setImageUrl(user.getImageUrl());

		return updatedUser;
	}
	
	

}
