package com.skilldistillery.mealmagic.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

@Entity
public class Rating {
	
	@EmbeddedId
	private RatingId id;
	
	@Column(name = "rate_comment")
	private Integer comment;
	
	private Integer rating;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value = "userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="recipe_id")
	@MapsId(value = "recipeId")
	private Recipe recipe;
	
	

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public RatingId getId() {
		return id;
	}

	public void setId(RatingId id) {
		this.id = id;
	}

	public Integer getComment() {
		return comment;
	}

	public void setComment(Integer comment) {
		this.comment = comment;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Rating [id=" + id + ", comment=" + comment + ", rating=" + rating + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Rating other = (Rating) obj;
		return Objects.equals(id, other.id);
	}
	
	
	

}
