package com.skilldistillery.mealmagic.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mealmagic.data.UserDAO;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {

		return "home";
	}

	@RequestMapping("account.do")
	public String account(User user, HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {

			return "accountPage";

		} else {
			return "loginPage";
		}
	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String login() {

		return "loginPage";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session) {

		User user = userDao.findByUsernameAndPassword(username, password);

		if (user != null) {

			session.setAttribute("loggedInUser", user);
			session.setAttribute("timeLoggedIn", LocalDateTime.now());

			return "accountPage";
		}

		else {

			return "loginPage";

		}
	}

	@RequestMapping(path = "findrecipes.do")
	public String findRecipes(Model model) {
		return "recipeSearch";

	}

	@RequestMapping(path = "uploadrecipes.do")
	public String uploadRecipe(Model model) {
		return "recipe/createRecipe";

	}

	@RequestMapping(path = "viewfavorites.do")
	public String favorites(Model model, HttpSession session) { // going to need to take in a User

		

		if (session.getAttribute("loggedInUser") != null) {
			
			User user1 = (User) session.getAttribute("loggedInUser");

			User user = userDao.findById(user1.getId());
			
			List<Recipe> favorites = user.getFavoriteRecipes();

			favorites.size();
			model.addAttribute("favorites", favorites);

			return "favoriteView";
		} 
		else {

			return "loginPage";

		}
	}

	@RequestMapping(path = "about.do")
	public String aboutPage(Model model) {
		return "aboutPage";

	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {

		session.removeAttribute("loggedInUser");
		session.removeAttribute("timeLoggedIn");

		return "home";
	}

}
