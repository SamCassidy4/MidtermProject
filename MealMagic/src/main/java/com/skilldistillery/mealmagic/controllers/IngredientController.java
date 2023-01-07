package com.skilldistillery.mealmagic.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.mealmagic.data.IngredientDAO;

@Controller
public class IngredientController {
	
	@Autowired
	private IngredientDAO ingredientDAO;

}
