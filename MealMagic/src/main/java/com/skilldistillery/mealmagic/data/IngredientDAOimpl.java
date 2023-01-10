package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Ingredient;
import com.skilldistillery.mealmagic.entities.Recipe;

@Service
@Transactional
public class IngredientDAOimpl implements IngredientDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Ingredient findById(int ingredientId) {
		return em.find(Ingredient.class, ingredientId);
	}

	@Override
	public Ingredient createIngredient(Ingredient ingredient) {
		em.persist(ingredient);
		return ingredient;
	}

	@Override
	public boolean deleteIngredient(int ingredientId) {
		boolean ingredientWasDeleted = false;
		Ingredient ingredient = em.find(Ingredient.class, ingredientId);

		if (ingredient != null) {
			em.remove(ingredient);
			ingredientWasDeleted = !em.contains(ingredient);
		}
		return ingredientWasDeleted;
	}

	@Override
	public Ingredient updateIngredient(int ingredientId, Ingredient ingredient) {
		Ingredient updateIngredient = em.find(Ingredient.class, ingredient.getId());
		
		updateIngredient.setName(ingredient.getName());
		updateIngredient.setDescription(ingredient.getDescription());
		updateIngredient.setImageUrl(ingredient.getImageUrl());
		
		return ingredient;
	}

	@Override
	public List<Ingredient> findByKeyword(String keyword) {
		String query = "SELECT i FROM Ingredient i WHERE i.name LIKE :nameI";
		List<Ingredient> ingredient = em.createQuery(query, Ingredient.class).setParameter("nameI", "%" + keyword + "%")
				.getResultList();
		return ingredient;
	}

	@Override
	public List<Ingredient> findAll() {
		String query = "SELECT i From Ingredient i";
		List<Ingredient> ingredients = em.createQuery(query, Ingredient.class).getResultList();
		return ingredients;
	}
	
	@Override
	public List<Recipe> findRecipeByIngredientKeyword(String keyword){
		String query = "SELECT r FROM Recipe r JOIN RecipeIngredient ri ON ri.recipe.id = r.id JOIN Ingredient i ON ri.ingredient.id "
				+ "= i.id WHERE i.name LIKE :nameI";
		List<Recipe> recipes = em.createQuery(query, Recipe.class).setParameter("nameI", "%" + keyword + "%")
				.getResultList();
		return recipes;
	}
	

}
