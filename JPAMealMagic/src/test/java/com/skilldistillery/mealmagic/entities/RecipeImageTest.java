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

class RecipeImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeImage recipeImage;

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
		recipeImage = em.find(RecipeImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipeImage = null;
	}

	@Test
	void inital_test_RecipeImage_entity_mapping() {
		assertNotNull(recipeImage);

	}
	@Test
	void test_RecipeImage_ManyToOne_entity_mapping() {
		assertNotNull(recipeImage.getRecipe());
	}
}
