package com.skilldistillery.mealmagic.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mealmagic.data.UserDAO;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path= {"/","home.do"})
	public String home(Model model) {
		
		return "home";
	}
	@RequestMapping (path ={"account.do"}, method = RequestMethod.GET)
	public String acount(@RequestParam String username, @RequestParam String password, Model model) {
		
		User user = userDao.findByUsernameAndPassword(username, password);
		
		model.addAttribute("user", user);
		
		return "accountPage";
	}
	@RequestMapping(path = "login.do")
	public String login(Model model) {
		return "loginPage";
	}
	
	@RequestMapping(path = "findrecipes.do")
	public String findRecipes(Model model) {
		return "recipeSearch";
		
	}
	@RequestMapping(path = "uploadrecipes.do")
	public String uploadRecipe (Model model){
		return "uploadPage";
		
		
	}
	
	@RequestMapping(path ="viewfavorites.do")
	public String favorites(Model model) { 		// going to need to take in a User
		
		User user = userDao.findById(1);
		//going to change once we have the user login set to pull user account info
		List <Recipe> favorites = user.getFavoriteRecipes();
		model.addAttribute("favorites", favorites);
		return "favoriteView";
	}
	
	@RequestMapping(path = "about.do")
	public String aboutPage (Model model) {
		return "aboutPage";
		
	}
	@RequestMapping (path = "logout.do")
	public String logout (Model model) {
		return "logoutPage";
	}
	

	
}
