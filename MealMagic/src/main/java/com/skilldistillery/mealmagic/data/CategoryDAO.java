package com.skilldistillery.mealmagic.data;

import java.util.List;

import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.Country;

public interface CategoryDAO {
	
	public Category findById(int categoryId);
	
	public Category createCategory(Country country);
	
	public boolean deleteCountry(int countryId);
	
	public Country updateCountry(int countryId, Country country);
	
	//public List<Country> findByKeyword(String keyword);   IDK IF WE NEED MAYBE?? 
	
	public List<Country> findAll();
	
	

}
