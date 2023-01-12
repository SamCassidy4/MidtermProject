package com.skilldistillery.mealmagic.data;

import com.skilldistillery.mealmagic.entities.Rating;

public interface RatingDAO {
	
	public Rating createRating(Rating rating);
	
	public int averageRating(int RecipeId);

}
