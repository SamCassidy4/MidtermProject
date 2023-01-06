package com.skilldistillery.mealmagic.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.mealmagic.data.RecipeDAO;
import com.skilldistillery.mealmagic.entities.Recipe;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDAO recipeDAO;

	@RequestMapping("getRecipe.do")
	public String showRecipe(Model model, int id) {

		Recipe recipe = recipeDAO.findById(id);
		model.addAttribute("recipe", recipe);
		return "recipe/showRecipe";
	}

	@RequestMapping("create.do")
	public String create(Model model, Recipe recipe) {
		Recipe create = recipeDAO.createRecipe(recipe);
		model.addAttribute("recipe", create);
		return "recipe/showRecipe";
	}

	@RequestMapping("delete.do")
	public String delete(Model model, int id) {
		boolean delete = recipeDAO.deleteRecipe(id);
		model.addAttribute("deleteRecipe", delete);
		return "recipe/deletedRecipePage";

	}

	@RequestMapping("update.do")
	public String update( Model model, int id) {
		Recipe update = recipeDAO.findById(id);
		
		model.addAttribute("update", update);
		
		return "recipe/updateRecipe";
	}

	@RequestMapping("updateRecipe.do")
	public String updatedRecipe(Model model, int id, Recipe recipe, RedirectAttributes redir) {
		
		Recipe update = new Recipe();
		
		model.addAttribute("recipe", recipeDAO.updateRecipe(update, id));
		
		redir.addAttribute("id", id);
		return "recipe/showRecipe";
	}

	@RequestMapping("findKeyword.do")
	public String findByKeyword(Model model, String keyword) {
		model.addAttribute("recipes", recipeDAO.findByKeyword(keyword));
		return "recipe/ListResult";
	}

	@RequestMapping("findAllRecipes.do")
	public String findAllRecipes(Model model) {
		model.addAttribute("recipes", recipeDAO.findAll());
		return "recipe/ListResult";
	}

}
