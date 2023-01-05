package com.skilldistillery.mealmagic.data;


import com.skilldistillery.mealmagic.entities.User;

public interface UserDAO {
	User findById(int userId);
	// FIXME: Implement real methods. We're Just Testing for now
	
	User findByUsernameAndPassword(String username, String password);
	
	User createUser(User user);
	
	User deleteUser(User user);
	
	User updateUser(User user);

}
