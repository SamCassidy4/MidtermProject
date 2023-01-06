package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Recipe;

@Service
@Transactional
public class RecipeDAOImpl implements RecipeDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Recipe findById(int recipeId) {

		return em.find(Recipe.class, recipeId);
	}

	@Override
	public Recipe createRecipe(Recipe recipe) {
		em.persist(recipe);
		return recipe;
	}

	@Override
	public boolean deleteRecipe(int recipeId) {
		boolean recipeWasDeleted = false;
		Recipe recipe = em.find(Recipe.class, recipeId);
		if (recipe != null) {
			em.remove(recipe);
			recipeWasDeleted = !em.contains(recipe);
		}

		return recipeWasDeleted;
	}

	@Override
	public Recipe updateRecipe(Recipe recipe, int recipeId) {
		Recipe updatedRecipe = em.find(Recipe.class, recipe.getId());

		updatedRecipe.setName(recipe.getName());
		updatedRecipe.setDescription(recipe.getDescription());
		updatedRecipe.setImageUrl(recipe.getImageUrl());
		updatedRecipe.setCookingInstructions(recipe.getCookingInstructions());
		updatedRecipe.setNumberOfServing(recipe.getNumberOfServing());
		updatedRecipe.setCalories(recipe.getCalories());
		updatedRecipe.setPrepTime(recipe.getPrepTime());
		updatedRecipe.setYield(recipe.getYield());
		updatedRecipe.setNotes(recipe.getNotes());
		updatedRecipe.setCookTime(recipe.getCookTime());

		return recipe;
	}

	@Override
	public List<Recipe> findByKeyword(String keyword) {
		String query = "SELECT r FROM Recipe r WHERE r.name LIKE :nameR";
		List<Recipe> recipe = em.createQuery(query, Recipe.class).setParameter("nameR", "%" + keyword + "%")
				.getResultList();
		return recipe;
	}

	@Override
	public List<Recipe> findAll() {
		String query = "SELECT r FROM Recipe r";
		List<Recipe> recipes = em.createQuery(query, Recipe.class).getResultList();
		return recipes;
	}

}
