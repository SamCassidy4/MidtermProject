package com.skilldistillery.mealmagic.data;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Comment;
import com.skilldistillery.mealmagic.entities.Recipe;
import com.skilldistillery.mealmagic.entities.User;

@Service
@Transactional
public class CommmentDAOimpl implements CommentDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Comment addComment(Comment comment) {

		em.persist(comment);
		
		return comment;
	}

	@Override
	public boolean deleteComment(int commentId) {
		boolean commentDeleted = false;
		Comment comment = em.find(Comment.class, commentId);
		if (comment != null) {

			em.remove(comment);

			commentDeleted = !em.contains(comment);

		}

		return commentDeleted;
	}

	@Override
	public Comment editComment(Comment comment) {
		Comment updatedComment = em.find(Comment.class, comment.getId());
		updatedComment.setPostedDate(LocalDateTime.now());
		updatedComment.setRecipe(comment.getRecipe());
		updatedComment.setRemark(comment.getRemark());
		updatedComment.setUser(comment.getUser());

		return updatedComment;
	}

	@Override
	public Comment findbyId(int id) {
		Comment comment = em.find(Comment.class, id);
		return comment;
	}

}
