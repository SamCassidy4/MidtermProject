package com.skilldistillery.mealmagic.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.mealmagic.data.RecipeDAO;
import com.skilldistillery.mealmagic.entities.Recipe;

@Controller
public class RecipeController {

@Autowired
private RecipeDAO recipeDAO;

@RequestMapping ("getRecipe.do")
public String showRecipe (Model model, int id) {

	Recipe recipe = recipeDAO.findById(id);
	model.addAttribute("recipe", recipe);
	return "showRecipe";
}




}
