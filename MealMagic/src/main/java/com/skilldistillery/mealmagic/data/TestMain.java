package com.skilldistillery.mealmagic.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.mealmagic.entities.User;

public class TestMain {
	static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMealMagic");
	static EntityManager em = emf.createEntityManager();

	public static void main(String[] args) {
		
		

	

	 
		String username = "admin"; 
		String password = "admin"; 
		
		String query = "SELECT u FROM User u WHERE u.username=:username AND u.password =:password";
		
		User user = em.createQuery(query, User.class)
				.setParameter("username", username)
				.setParameter("password", password).getSingleResult();
		System.out.println(user);
		
		
	}
}
