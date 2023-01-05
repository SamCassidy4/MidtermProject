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

class RecipeIngredientTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeIngredient ingredient;

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
		ingredient = em.find(RecipeIngredient.class, new RecipeIngredientId(1,1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ingredient = null;
	}

	@Test
	void Test_RecipeIngredient_mapping (){
	assertNotNull(ingredient);
	assertEquals("1 1/2 cups", ingredient.getAmount());
	assertEquals(1,ingredient.getRecipe().getId());

}
	}