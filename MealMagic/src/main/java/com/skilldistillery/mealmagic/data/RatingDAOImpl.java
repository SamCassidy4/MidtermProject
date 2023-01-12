package com.skilldistillery.mealmagic.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Rating;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;
@Service
@Transactional
public class RatingDAOImpl implements RatingDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Rating createRating(Integer rating, int userId, int recipeId) {
		System.out.println("DaoImpl"+ " " + rating + " "+ userId +" "+ recipeId +" ***********************************************************");
		Rating bigDaddy = new Rating();
		User user = em.find(User.class, userId);
		Recipe recipe = em.find(Recipe.class, recipeId);
		bigDaddy.setRecipe(recipe);
		bigDaddy.setUser(user);
		em.persist(bigDaddy);
		recipe.addRating(bigDaddy);
		return bigDaddy;
	}

	
}
