package com.skilldistillery.mealmagic.data;

import java.util.List;

import com.skilldistillery.mealmagic.entities.Ingredient;
import com.skilldistillery.mealmagic.entities.Recipe;

public interface RecipeDAO {

public Recipe findById (int recipeId);

public boolean deleteRecipe(int recipeId, Recipe enabled);

public Recipe updateRecipe(int recipeId, Recipe recipe);

public List<Recipe> findByKeyword(String keyword);

public List<Recipe> findAll();

public Ingredient addIngredientToRecipe (int recipeId, Ingredient ingredient);

boolean addRecipeToIngredient(int ingredientId, Recipe recipe);

Recipe createRecipe(Recipe recipe, String[] dietaryPreferenceCollection, String[] category);




}