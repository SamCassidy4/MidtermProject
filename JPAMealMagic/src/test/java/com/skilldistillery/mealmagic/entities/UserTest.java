package com.skilldistillery.mealmagic.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAMealMagic");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void inital_test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
		assertEquals("Owner",user.getFirstName());
		assertEquals("larry",user.getLastName());
		assertEquals("I like to eat",user.getUserBio());
		
		
		
	}
	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertTrue(user.getRatings().size() > 0);
	//	assertNotNull(user.getUserRecipes());
	//	assertEquals("admin", user.);
		
		
		
	}
	@Test
	void test_User_ManyToMany_mapping() {
		assertNotNull(user.getFavoriteRecipes());
		assertNotNull(user.getComments());
		assertTrue(user.getFavoriteRecipes().size() > 0);
	}

}
