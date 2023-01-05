package com.skilldistillery.mealmagic.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

@Entity
public class RecipeIngredient {
	
	@EmbeddedId
    private RecipeId id;
	
	@Column(name="food_prep")
	private String foodPrep;
	
    private String amount; 
    
	@ManyToOne
	@JoinColumn(name="ingredient_id")
	@MapsId(value = "ingredientId")
	private Ingredient ingredient;
	
	@ManyToOne
	@JoinColumn(name="recipe_id")
	@MapsId(value = "recipeId")
	private Recipe recipe;

	public RecipeId getId() {
		return id;
	}

	public void setId(RecipeId id) {
		this.id = id;
	}

	public String getFoodPrep() {
		return foodPrep;
	}

	public void setFoodPrep(String foodPrep) {
		this.foodPrep = foodPrep;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Ingredient getIngredient() {
		return ingredient;
	}

	public void setIngredient(Ingredient ingredient) {
		this.ingredient = ingredient;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeIngredient other = (RecipeIngredient) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "RecipeIngredient [id=" + id + ", foodPrep=" + foodPrep + ", amount=" + amount + ", ingredient="
				+ ingredient + ", recipe=" + recipe + "]";
	}
    
    
}
