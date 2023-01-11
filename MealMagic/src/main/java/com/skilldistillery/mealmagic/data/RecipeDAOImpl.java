package com.skilldistillery.mealmagic.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.DietaryPreference;
import com.skilldistillery.mealmagic.entities.Ingredient;
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
	public Recipe createRecipe(Recipe recipe, String [] dietaryPreferenceCollection, String [] categoryCollection) {
		for (String dietaryPreference : dietaryPreferenceCollection) {
			DietaryPreference dp = em.find(DietaryPreference.class, Integer.parseInt(dietaryPreference));
			recipe.addDietaryPreferences(dp);
		}
		for (String category : categoryCollection) {
			Category c = em.find(Category.class, Integer.parseInt(category));
			recipe.addCategory(c);
		}
		
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
	public Recipe updateRecipe(int recipeId, Recipe recipe) {
		Recipe updatedRecipe = em.find(Recipe.class, recipe.getId());

		if (updatedRecipe != null) {
			
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
			
			em.persist(updatedRecipe);
		}

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

	@Override
	public Ingredient addIngredientToRecipe(int recipeId, Ingredient ingredient) {
		Recipe managedRecipe = em.find(Recipe.class, recipeId);
		List<Ingredient> ingredients = managedRecipe.getIngredients();

		if (!ingredients.contains(ingredient)) {
           ingredient.setRecipes(new ArrayList<Recipe>());
           ingredient.getRecipes().add(managedRecipe);
			em.persist(ingredient);
			ingredients.add(ingredient);
			managedRecipe.setIngredients(ingredients);
			em.persist(managedRecipe);
		}
		return ingredient;
	}
	

	@Override
	public boolean addRecipeToIngredient(int ingredientId, Recipe recipe) {
		Ingredient managedIngredient = em.find(Ingredient.class, ingredientId);
		List<Recipe> recipes = managedIngredient.getRecipes();

		if (!recipes.contains(recipe)) {
			recipes.add(recipe);
			managedIngredient.setRecipes(recipes);
			em.persist(managedIngredient);
		}
		return false;
	}

}
