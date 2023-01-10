package com.skilldistillery.mealmagic.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.mealmagic.data.CategoryDAO;


@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	

}
