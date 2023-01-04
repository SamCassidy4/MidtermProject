package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Recipe;

@Service
@Transactional
public class RecipeDAOImpl implements RecipeDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Recipe findById(int recipeId) {
		
		return em.find(Recipe.class, recipeId);
	}

	@Override
	public Recipe createRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteRecipe(int recipeId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Recipe updateRecipe(Recipe recipe, int recipeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> findByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recipe> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
