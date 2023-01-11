package com.skilldistillery.mealmagic.data;

import java.util.List;

import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.DietaryPreference;

public interface DietaryPreferenceDAO {
	
	public DietaryPreference findById(int dpId);
	
	public DietaryPreference createDp(DietaryPreference dp);
	
	public boolean deleteDp(int dpId);
	
	public DietaryPreference updateDp(int dpId, DietaryPreference dp);
	
	//public List<DietaryPreference> findByKeyword(String keyword);   IDK IF WE NEED MAYBE?? 
	
	public List<DietaryPreference> findAll();
	
	

}
