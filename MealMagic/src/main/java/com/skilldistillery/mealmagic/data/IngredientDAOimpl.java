package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
	public List<Recipe> findRecipeByIngredientKeyword(String[] keyword){
		String query = "SELECT DISTINCT r FROM Recipe r"; 

		for(int i=0; i< keyword.length; i++) {
			query += " JOIN RecipeIngredient ri" + i + " ON r.id = ri" + i + ".recipe.id";
		}
		query += " WHERE";
		for(int i=0; i< keyword.length; i++) {
			if(i > 0) {
				query +=" AND";
			}
			query += " EXISTS (SELECT i FROM Ingredient i WHERE i.name LIKE :name" + i + " AND i.id = ri" + i + ".ingredient.id)";
		}
		TypedQuery<Recipe> tq = em.createQuery(query, Recipe.class);
		for(int i=0; i< keyword.length; i++) {
			tq.setParameter("name" + i,"%" + keyword[i] + "%");
			
		}
		List<Recipe> recipes = tq.getResultList();
		return recipes;

	

}
}
