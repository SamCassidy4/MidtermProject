package com.skilldistillery.mealmagic.data;

import java.util.List;

import com.skilldistillery.mealmagic.entities.Ingredient;
import com.skilldistillery.mealmagic.entities.Recipe;

public interface IngredientDAO {
	
	public Ingredient findById(int ingredientId);
	
	public Ingredient createIngredient(Ingredient ingredient);
	
	public boolean deleteIngredient(int ingredientId);
	
	public Ingredient updateIngredient(int ingredientId, Ingredient ingredient);
	
	public List<Ingredient> findByKeyword(String keyword);
	
	public List<Ingredient> findAll();
	
	public List<Recipe> findRecipeByIngredientKeyword(String keyword);
	
	
	
	

}
