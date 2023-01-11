package com.skilldistillery.mealmagic.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.mealmagic.data.CategoryDAO;
import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.Country;


@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping("createCategory.do")
	public String createCategory(Model model, Category category, HttpSession session) {
		Category create = categoryDAO.createCategory(category);
		session.setAttribute("category", create);
		
		return "category/showCategory";
	}
	
	@RequestMapping(path = "createCategoryPage.do", method = RequestMethod.GET)
	public String newCateogryPage(Model model) {
		return "category/newCategoryPage";
	}
	
	@RequestMapping(path = "showListCategory.do", method = RequestMethod.GET)
	public String showListOfCategory(Model model) {
		model.addAttribute("category", categoryDAO.findAll());
		return "category/ListCategory";
	}
	
	@RequestMapping("deleteCategory.do")
	public String deleteCountry(Model model, int id, HttpSession session) {
		boolean deleteCategory = categoryDAO.deleteCategory(id);
		model.addAttribute("deleteCategory", deleteCategory);
		
		return "category/deletedCategoryPage";
	}
	
	@RequestMapping("showCategory.do")
	public String showCategoryPage(Model model, Integer id) {
		Category category = categoryDAO.findById(id);
		model.addAttribute("category", category);
		
		return "category/showCategory";
	}
	
	@RequestMapping("updateCategory.do")
	public String updateCategory(Model model, Category category, RedirectAttributes redir) {
		categoryDAO.updateCategory(category.getId(), category);
		redir.addFlashAttribute(category);
		
		return "category/showCategory";
	}
	
	@RequestMapping("updateCategoryView.do")
	public String updateCategoryView(Model model, Integer id) {
		Category category = categoryDAO.findById(id);
		model.addAttribute("category", category);
		
		return "category/updateCategory";
	}

}
