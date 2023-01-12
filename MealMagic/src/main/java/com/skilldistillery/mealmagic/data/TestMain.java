package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.mealmagic.entities.Ingredient;
import com.skilldistillery.mealmagic.entities.Recipe;

public class TestMain {
	static EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPAMealMagic");
	static EntityManager em = emf.createEntityManager();

//	public static void main(String[] args) {
//		
//		String[] ingredientsOnForm = {"broccoli", "garlic powder", "preztel", "duck egg"};
//		
//		
//		Recipe recipe = em.find(Recipe.class, 11);
//	
//		System.out.println(recipe);

	 // delete this
		
		
		//get int array
		
		//for each insert, ingredient Id with recipe Id to recipe_ingredient
		
		
	
//void AddOrSetIngredientId(Recipe recipe, String[] listOfIngredient) {
//
//List<Ingredient> Ingredients;
//	
//for(String ingred : listOfIngredient) {
//		
//	
//		String query= "SELECT i FROM Ingredient i WHERE i.name = :ingred";
//		
//		Ingredient result = em.createQuery(query, Ingredient.class)
//				.setParameter("ingred", ingred).getSingleResult();
//		
//		if(result != null) {
//		
//			result.getId(), recipe.getId()
//			
//			
//		}
//		
		
	//check if ingred name is on ingredient table
	//if ingredient name is on table, get Id
	//if ingredient name is not on table, setId
		
	//add each id to a int[]
	//int array
		
		
		
	
		
	
	
	
}

