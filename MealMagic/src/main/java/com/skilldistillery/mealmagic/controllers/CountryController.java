package com.skilldistillery.mealmagic.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.mealmagic.data.CountryDAO;
import com.skilldistillery.mealmagic.entities.Country;

@Controller
public class CountryController {
	
	@Autowired
	private CountryDAO countryDAO;
	
	@RequestMapping("createCountry.do")
	public String createCountry(Model model, Country country, HttpSession session) {
		Country create = countryDAO.createCountry(country);
		session.setAttribute("country", create);
		
		return "country/showCountry";
	}
	
	@RequestMapping(path = "createCountryPage.do", method = RequestMethod.GET)
	public String newCountryPage(Model model) {
		return "country/newCountryPage";
	}
	
	@RequestMapping(path = "showListCountry.do", method = RequestMethod.GET)
	public String showListOfCountry(Model model) {
		model.addAttribute("country", countryDAO.findAll());
		return "country/ListCountry";
	}
	
	@RequestMapping("deleteCountry.do")
	public String deleteCountry(Model model, int id, HttpSession session) {
		boolean deleteCountry = countryDAO.deleteCountry(id);
		model.addAttribute("deleteCountry", deleteCountry);
		
		return "country/deletedCountryPage";
	}
	
	
	@RequestMapping("showCountry.do")
	public String showCountryPage(Model model, Integer id) {
		Country country = countryDAO.findById(id);
		model.addAttribute("country", country);
		
		return "country/showCountry";
	}
	
	@RequestMapping("updateCountry.do")
	public String updateCountry(Model model, Country country, RedirectAttributes redir) {
		countryDAO.updateCountry(country.getId(), country);
		redir.addFlashAttribute(country);
		
		return "country/showCountry";
	}
	
	@RequestMapping("updateCountryView.do")
	public String updateCountryView(Model model, int id) {
		Country country = countryDAO.findById(id);
		model.addAttribute("country", country);
		
		return "country/updateCountry";
	}

}
