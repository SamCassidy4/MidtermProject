package com.skilldistillery.mealmagic.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class DietaryPreferenceTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private DietaryPreference dp;

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
		dp = em.find(DietaryPreference.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		dp = null;
	}

	@Test
	void inital_test_DietaryPreference_entity_mapping() {
		assertNotNull(dp);
		assertEquals("dairy",dp.getName());

	}
	@Test
	void test_DietaryPreference_ManyToMany_mapping() {
		assertNotNull(dp.getRecipes());
	    assertTrue(dp.getRecipes().size() > 0);
	    assertNotNull(dp.getRecipes());
	}
}