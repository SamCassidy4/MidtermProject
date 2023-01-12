package com.skilldistillery.mealmagic.data;

import com.skilldistillery.mealmagic.entities.Comment;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;

public interface CommentDAO {

public Comment addComment(Comment comment);

public boolean deleteComment(int commentId);

public Comment editComment(Comment comment);

public Comment findbyId(int id);

}
