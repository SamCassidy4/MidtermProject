package com.skilldistillery.mealmagic.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name="dietary_preference")
public class DietaryPreference {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@ManyToMany
	@JoinTable(name="dietary_preference_has_recipe", joinColumns=@JoinColumn(name="dietary_preferences_id"), inverseJoinColumns=@JoinColumn(name="recipe_id"))
	private List<Recipe> recipes;

	public DietaryPreference() {
		super();
	}
	
	public void addRecipe(Recipe recipe) {
		if (recipes == null) {
			recipes = new ArrayList<>();
			
		}
		if(! recipes.contains(recipe)) {
			recipes.add(recipe);
			recipe.addDietaryPreferences(this);
		}
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
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
		DietaryPreference other = (DietaryPreference) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "DietaryPreference [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
	

}
