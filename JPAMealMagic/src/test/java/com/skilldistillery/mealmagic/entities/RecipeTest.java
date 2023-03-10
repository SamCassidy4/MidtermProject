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

class RecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Recipe recipe;

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
		recipe = em.find(Recipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipe = null;
	}

	@Test
	void inital_test_Recipe_entity_mapping() {
		assertNotNull(recipe);
		assertEquals("Pumpkin Pie", recipe.getName());
		assertNotNull(recipe.getDescription());
		assertEquals(250, recipe.getCalories());
		assertEquals("8", recipe.getNumberOfServing());

	}

	@Test
	void test_Recipe_ManyToMany_mapping() {
		assertNotNull(recipe.getCategories());
		assertEquals(1, recipe.getId());
		assertTrue(recipe.getCategories().size() > 0);
		assertNotNull(recipe.getIngredients());
		assertTrue(recipe.getIngredients().size() > 0);
		assertNotNull(recipe.getDietaryPreferences());
		assertNotNull(recipe.getUsers());
		assertTrue(recipe.getUsers().size() > 0);
		assertNotNull(recipe.getImages());
		assertNotNull(recipe.getComments());
		assertNotNull(recipe.getCountry());
		assertNotNull(recipe.getRatings());
		assertTrue(recipe.getRatings().size() > 0);
		assertEquals(5, recipe.getRatings().get(0).getRating());
		assertEquals(1, recipe.getRatings().get(0).getRecipe().getId());
		assertEquals(1, recipe.getUser().getId());
		assertEquals(1, recipe.getCategories().get(0).getId());
	}

	@Test
	void test_recipe_ingredient() {
		assertNotNull(recipe.getRecipeIngredients());
		assertEquals("1 1/2 cups", recipe.getRecipeIngredients().get(0).getAmount());
	}

	@Test
	void test_recipe_Country_mapping() {
	assertEquals("United States", recipe.getCountry().getName());
	assertEquals("North America",recipe.getCountry().getContinent());
	assertEquals("mid-west", recipe.getCountry().getRegion());
	assertEquals(1, recipe.getCountry().getId());
}
}