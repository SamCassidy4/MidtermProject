package com.skilldistillery.mealmagic.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "recipe_ingredient")
public class RecipeIngredient {

	@EmbeddedId
	private RecipeIngredientId id;

	private String amount;

	@Column(name = "food_prep")
	private String foodPrep;

	@ManyToOne
	@JoinColumn(name = "ingredient_id")
	@MapsId(value = "ingredientId")
	private Ingredient ingredient;

	@ManyToOne
	@JoinColumn(name = "recipe_id")
	@MapsId(value = "recipeId")
	private Recipe recipe;

	public RecipeIngredient() {
	}

	public RecipeIngredientId getId() {
		return id;
	}

	public void setId(RecipeIngredientId id) {
		this.id = id;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getFoodPrep() {
		return foodPrep;
	}

	public void setFoodPrep(String foodPrep) {
		this.foodPrep = foodPrep;
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
	public String toString() {
		return "RecipeIngredient [id=" + id + ", amount=" + amount + ", foodPrep=" + foodPrep + ", ingredient="
				+ ingredient + ", recipe=" + recipe + "]";
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

}
