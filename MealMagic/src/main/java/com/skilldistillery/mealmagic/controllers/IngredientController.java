package com.skilldistillery.mealmagic.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.mealmagic.data.IngredientDAO;
import com.skilldistillery.mealmagic.data.RecipeDAO;
import com.skilldistillery.mealmagic.entities.Ingredient;
import com.skilldistillery.mealmagic.entities.Recipe;

@Controller
public class IngredientController {

	@Autowired
	private IngredientDAO ingredientDAO;

	@Autowired
	private RecipeDAO recipeDAO;

	@RequestMapping("createIngredient.do")
	public String createIngredient(Model model, Ingredient ingredient, HttpSession session) {
		Ingredient create = ingredientDAO.createIngredient(ingredient);
		model.addAttribute("ingredient", create);
		return "ingredient/showIngredient";

	}

	@RequestMapping("showIngredient.do")
	public String showIngredient(int id, Model model, HttpSession session) {
		Recipe recipe = recipeDAO.findById(id);

		model.addAttribute("recipe", recipe);

		return "ingredient/showIngredient";
	}

	@RequestMapping("experiment.do")
	public String experiment(Model model, Integer ind, Ingredient ingredient, HttpSession session) {

		Ingredient create = recipeDAO.addIngredientToRecipe(ind, ingredient);

		model.addAttribute("ingredient", create);
		return "ingredient/showIngredient";
	}


	@RequestMapping("getIngredient.do")
	public String showIngredient(Model model, int id) {

		Ingredient ingredient = ingredientDAO.findById(id);
		model.addAttribute("recipe", ingredient);
		return "recipe/showRecipe";

	}
	
	@RequestMapping("getRecipeFromIngredient.do")
	public String showRecipe(Model model, String[] keyword) {
		model.addAttribute("recipes",ingredientDAO.findRecipeByIngredientKeyword(keyword));
		
		return "ingredient/listResult";
	}
}
