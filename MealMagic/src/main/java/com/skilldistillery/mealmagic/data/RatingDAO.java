package com.skilldistillery.mealmagic.data;

import com.skilldistillery.mealmagic.entities.Rating;

public interface RatingDAO {
	
	public Rating createRating(Integer rating, int userId, int recipeId);

}
