package com.skilldistillery.mealmagic.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mealmagic.data.CommentDAO;
import com.skilldistillery.mealmagic.data.RecipeDAO;
import com.skilldistillery.mealmagic.entities.Comment;
import com.skilldistillery.mealmagic.entities.Recipe;

@Controller
public class CommentController {

@Autowired
private CommentDAO commentDAO;

@Autowired
private RecipeDAO recipeDAO;

@RequestMapping(path = "addComment.do", method = RequestMethod.POST)
public String addComment(Model model, Comment comment, HttpSession session) {
	
	comment.setPostedDate(LocalDateTime.now());
	
	Comment addedComment = commentDAO.addComment(comment);
	
	Recipe recipe  = recipeDAO.findById(addedComment.getRecipe().getId());
	
	model.addAttribute("recipe", recipe);
	
	return "recipe/showRecipe";
}
@RequestMapping("deleteComment.do")
public String deleteComment(Model model, int commentId, HttpSession session) {
	
	boolean deletedComment = commentDAO.deleteComment(commentId);

	model.addAttribute("deletedComment", deletedComment);
	
	return "comment/deletedComment";
}

}
