package com.skilldistillery.mealmagic.data;

import java.util.List;

import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.Country;

public interface CategoryDAO {
	
	public Category findById(int categoryId);
	
	public Category createCategory(Category category);
	
	public boolean deleteCategory(int categoryId);
	
	public Category updateCategory(int categoryId, Category category);
	
	//public List<Category> findByKeyword(String keyword);   IDK IF WE NEED MAYBE?? 
	
	public List<Category> findAll();
	
	

}
