package com.skilldistillery.mealmagic.data;

import com.skilldistillery.mealmagic.entities.RecipeIngredient;

public interface RecipeIngredientDAO {
	
	public RecipeIngredient findById(int ingredientId, int recipeId);
	
	

}
