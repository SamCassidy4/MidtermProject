package com.skilldistillery.mealmagic.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Embeddable
public class RecipeId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="recipe_id")
	private int recipeId;
	
	@Column(name="ingredient_id")
	private int ingredientId;

	public int getIngredientId() {
		return ingredientId;
	}



}
