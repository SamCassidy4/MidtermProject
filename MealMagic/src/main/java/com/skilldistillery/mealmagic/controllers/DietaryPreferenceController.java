package com.skilldistillery.mealmagic.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.mealmagic.data.DietaryPreferenceDAO;
import com.skilldistillery.mealmagic.entities.DietaryPreference;


@Controller
public class DietaryPreferenceController {
	
	@Autowired
	private  DietaryPreferenceDAO dpDAO;
	
	@RequestMapping("createDp.do")
	public String createDietaryPreference(Model model, DietaryPreference dp, HttpSession session) {
		DietaryPreference createDp = dpDAO.createDp(dp);
		session.setAttribute("dp", createDp);
		
		return "dietaryPreference/showDietaryPreference";
	}
	
	@RequestMapping(path = "createDpPage.do", method = RequestMethod.GET)
	public String newDietaryPreferencePage(Model model) {
		return "dietaryPreference/newDietaryPreferencePage";
	}
	
	@RequestMapping(path = "showListDp.do", method = RequestMethod.GET)
	public String showListOfDietaryPreferences(Model model) {
		model.addAttribute("dp", dpDAO.findAll());
		return "dietaryPreference/ListDietaryPreferences";
	}
	
	@RequestMapping("deleteDp.do")
	public String deleteDietaryPreference(Model model, int id, HttpSession session) {
		boolean deleteDietaryPreference = dpDAO.deleteDp(id);
		model.addAttribute("deleteDp", deleteDietaryPreference);
		
		return "dietaryPreference/deletedDietaryPreferencePage";
	}
	
	@RequestMapping("showDp.do")
	public String showDietaryPreferencePage(Model model, Integer id) {
		DietaryPreference dp = dpDAO.findById(id);
		model.addAttribute("dp", dp);
		
		return "dietaryPreference/showDietaryPreference";
	}
	
	@RequestMapping("updateDp.do")
	public String updateDietaryPreference(Model model, DietaryPreference dp, RedirectAttributes redir) {
		dpDAO.updateDp(dp.getId(), dp);
		redir.addFlashAttribute(dp);
		
		return "dietaryPreference/showDietaryPreference";
	}
	
	@RequestMapping("updateDpView.do")
	public String updateDietaryPreferenceView(Model model, Integer id) {
		DietaryPreference dp = dpDAO.findById(id);
		model.addAttribute("dp", dp);
		
		return "dietaryPreference/updateDietaryPreference";
	}

}
