package com.skilldistillery.mealmagic.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.mealmagic.data.CategoryDAO;
import com.skilldistillery.mealmagic.data.RecipeDAO;
import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping("getRecipe.do")
	public String showRecipe(Model model, int id) {

		Recipe recipe = recipeDAO.findById(id);
		model.addAttribute("recipe", recipe);
		return "recipe/showRecipe";
	}

	@RequestMapping("create.do")
	public String create(Model model, Recipe recipe, Category category, HttpSession session) {
		recipe.setUser((User) session.getAttribute("loggedInUser"));
		Recipe create = recipeDAO.createRecipe(recipe);
		model.addAttribute("recipe", create);
		return "recipe/showRecipe";
	}

	@RequestMapping("delete.do")
	public String delete(Model model, int rid) {
		boolean delete = recipeDAO.deleteRecipe(rid);
		model.addAttribute("deleteRecipe", delete);
		return "recipe/deletedRecipePage";

	}

	@RequestMapping("updateView.do")
	public String update(Model model, int id) {
		Recipe recipe = recipeDAO.findById(id);
		model.addAttribute("recipe", recipe);

		return "recipe/updateRecipe";
	}

	@RequestMapping("updateRecipe.do")
	public String updatedRecipe(Model model, Recipe recipe, RedirectAttributes redir) {
		recipeDAO.updateRecipe(recipe.getId(), recipe);
		redir.addFlashAttribute(recipe);

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
