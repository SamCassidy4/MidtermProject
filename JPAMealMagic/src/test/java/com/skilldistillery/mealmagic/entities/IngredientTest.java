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

class IngredientTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Ingredient ingredient;

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
		ingredient = em.find(Ingredient.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ingredient = null;
	}

	@Test
	void inital_test_Ingredient_entity_mapping() {
		assertNotNull(ingredient);
		assertEquals("pumpkin",ingredient.getName());
		assertNotNull(ingredient.getRecipes());
		assertTrue(ingredient.getRecipes().size() > 0);
		assertTrue(ingredient.getRecipeIngredients().size() > 0);
		assertEquals("Pumpkin Pie", ingredient.getRecipeIngredients().get(0).getIngredient().getRecipes().get(0).getName());
		assertEquals("Pumpkin Pie", ingredient.getRecipeIngredients().get(0).getRecipe().getName());

	}

}
