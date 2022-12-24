package com.skilldistillery.mealmagic.data;


import com.skilldistillery.mealmagic.entities.Category;
import com.skilldistillery.mealmagic.entities.User;

public interface UserDAO {
	Category findById(int userId);
	// FIXME: Implement real methods. We're Just Testing for now
	User findByUsernameAndPassword(String username, String password);
	

}
