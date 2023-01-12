package com.skilldistillery.mealmagic.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Recipe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToMany (mappedBy ="recipe")
	private List<RecipeIngredient> recipeIngredients;
	
	public List<RecipeIngredient> getRecipeIngredients() {
		return recipeIngredients;
	}

	public void setRecipeIngredients(List<RecipeIngredient> recipeIngredients) {
		this.recipeIngredients = recipeIngredients;
	}

	private String name;
	
	private String description;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="cooking_instructions")
	private String cookingInstructions;
	
	@Column(name="number_of_serving")
	private String numberOfServing;
	
	private Integer calories;
	
	@Column(name="prep_time")
	private String prepTime;
	
	private String yield;
	
	private String notes;
	
	@Column(name="cook_time")
	private String cookTime;
	
	@ManyToMany(mappedBy="recipes")
	private List<Ingredient> ingredients;
	
	@ManyToMany(mappedBy="recipes")
	private List<Category> categories;
	
	@ManyToMany(mappedBy="recipes")
	private List<DietaryPreference> dietaryPreferences;
	
	@ManyToMany(mappedBy="favoriteRecipes")
	private List<User> users;
	
	@OneToMany(mappedBy="recipe")
	private List<RecipeImage> images;
	
	@OneToMany(mappedBy="recipe")
	private List<Comment> comments;
	
	
	@OneToMany(mappedBy="recipe")
	private List<Rating> ratings;
	
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	public void addDietaryPreferences(DietaryPreference dietaryPreference) {
		if (dietaryPreferences == null ) {
			dietaryPreferences = new ArrayList<>();
		}
		if(! dietaryPreferences.contains(dietaryPreference)) {
			dietaryPreferences.add(dietaryPreference);
			dietaryPreference.addRecipe(this);
		}
	}
	
	public void addCategory(Category category) {
		if (categories == null ) {
			categories = new ArrayList<>();
		}
		if(! categories.contains(category)) {
			categories.add(category);
		    category.addRecipe(this);
		}
	}
	
	public void addRating(Rating rating) {
		if(ratings == null) {
			ratings = new ArrayList<>();
		}
		if(!ratings.contains(rating)) {
			ratings.add(rating);
		}
	}
	
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Rating> getRatings() {
		return ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}



	public Recipe() {
		super();
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getCookingInstructions() {
		return cookingInstructions;
	}

	public void setCookingInstructions(String cookingInstructions) {
		this.cookingInstructions = cookingInstructions;
	}

	public String getNumberOfServing() {
		return numberOfServing;
	}

	public void setNumberOfServing(String numberOfServing) {
		this.numberOfServing = numberOfServing;
	}

	public Integer getCalories() {
		return calories;
	}

	public void setCalories(Integer calories) {
		this.calories = calories;
	}

	public String getPrepTime() {
		return prepTime;
	}

	public void setPrepTime(String prepTime) {
		this.prepTime = prepTime;
	}

	public String getYield() {
		return yield;
	}

	public void setYield(String yield) {
		this.yield = yield;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getCookTime() {
		return cookTime;
	}

	public List<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	public void setCookTime(String cookTime) {
		this.cookTime = cookTime;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<DietaryPreference> getDietaryPreferences() {
		return dietaryPreferences;
	}

	public void setDietaryPreferences(List<DietaryPreference> dietaryPreferences) {
		this.dietaryPreferences = dietaryPreferences;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<RecipeImage> getImages() {
		return images;
	}

	public void setImages(List<RecipeImage> images) {
		this.images = images;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "Recipe [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl=" + imageUrl
				+ ", cookingInstructions=" + cookingInstructions + ", numberOfServing=" + numberOfServing
				+ ", calories=" + calories + ", prepTime=" + prepTime + ", yield=" + yield + ", notes=" + notes
				+ ", cookTime=" + cookTime + "]";
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
		Recipe other = (Recipe) obj;
		return id == other.id;
	}

	
	
	

}
