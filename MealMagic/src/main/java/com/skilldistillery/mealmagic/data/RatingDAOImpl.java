package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Rating;
import com.skilldistillery.mealmagic.entities.Recipe;
@Service
@Transactional
public class RatingDAOImpl implements RatingDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Rating createRating(Rating rating) {
		
		em.persist(rating);
		
		 

		return rating;
	}

	@Override
	public int averageRating(int recipeId) {
		
	
		
	
		
		List<Rating> rating = em.find(Recipe.class, recipeId).getRatings();
		
		
		int sum = 0;
		
		for(int i = 0; i < rating.size(); i++) {
			
			sum = sum + rating.get(i).getRating();
			
		}
		
		int averageRating = sum / rating.size();
		
		return averageRating;
		
		
	}

	
}
