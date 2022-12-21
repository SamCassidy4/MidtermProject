package com.skilldistillery.mealmagic.data;

import com.skilldistillery.mealmagic.entities.User;

public interface UserDAO {
	User findById(int userId);
	User findByUsernameAndPassword(String username, String password);
	

}
