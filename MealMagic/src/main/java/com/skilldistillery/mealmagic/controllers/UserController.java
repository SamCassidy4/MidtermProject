package com.skilldistillery.mealmagic.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mealmagic.data.CountryDAO;
import com.skilldistillery.mealmagic.data.RecipeDAO;
import com.skilldistillery.mealmagic.data.UserDAO;
import com.skilldistillery.mealmagic.entities.Country;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private RecipeDAO recipeDao;
	@Autowired
	private CountryDAO countryDao;

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
		} else {
			return "loginPage";

		}
	}

	@RequestMapping(path = "createNewUserPage.do", method = RequestMethod.GET)
	public String createNewUserPage(User user, HttpSession session) {
		return "user/newUserPage";
	}

	@RequestMapping(path = "createNewUser.do", method = RequestMethod.GET)
	public String createNewUser(User user, HttpSession session) {
		User newUser = userDao.createUser(user);

		session.setAttribute("user", newUser);

		return "accountPage";
	}

	@RequestMapping(path = "deleteUser.do", method = RequestMethod.GET)
	public String deleteUser(int id, HttpSession session) {
		List<Recipe>recipes = userDao.findById(id).getRecipes();
		
		for (Recipe recipe : recipes) {
			recipeDao.deleteRecipe(recipe.getId());
		}
		
		boolean deletedUser = userDao.deleteUser(id);

		if (session.getAttribute("loggedInUser") != null) {
			session.setAttribute("user", deletedUser);
		}

		return "user/deletedUserPage";
	}

	@RequestMapping(path = "findrecipes.do")
	public String findRecipes(Model model) {
		return "recipeSearch";

	}

	@RequestMapping(path = "uploadrecipes.do")
	public String uploadRecipe(Model model) {
	  	List<Country>countries = countryDao.findAll();
		model.addAttribute("countries",countries);
		return "recipe/createRecipe";

	}

	@RequestMapping(path = "viewfavorites.do")
	public String favorites(Model model, HttpSession session) { // going to need to take in a User

		if (session.getAttribute("loggedInUser") != null) {

			User user1 = (User) session.getAttribute("loggedInUser");

			User user = userDao.findById(user1.getId());

			session.setAttribute("loggedInUser", user);

			List<Recipe> favorites = user.getFavoriteRecipes();

			favorites.size();
			model.addAttribute("favorites", favorites);

			return "favoriteView";

		}

		return "loginPage";

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
