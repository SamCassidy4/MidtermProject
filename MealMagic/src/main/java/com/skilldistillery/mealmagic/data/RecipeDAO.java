package com.skilldistillery.mealmagic.data;

import java.util.List;

import com.skilldistillery.mealmagic.entities.Recipe;

public interface RecipeDAO {

public Recipe findById (int recipeId);

public Recipe createRecipe(Recipe recipe);

public boolean deleteRecipe(int recipeId);

public Recipe updateRecipe(Recipe recipe, int recipeId);

public List<Recipe> findByKeyword(String keyword);

public List<Recipe> findAll();


}
