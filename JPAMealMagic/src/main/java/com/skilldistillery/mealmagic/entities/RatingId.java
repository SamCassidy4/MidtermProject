package com.skilldistillery.mealmagic.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Embeddable
public class RatingId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="recipe_id")
	private int recipeId;
	
	@Column(name="user_id")
	private int userId;

	public RatingId() {
		super();
	}
	

	public RatingId(int recipeId, int userId) {
		super();
		this.recipeId = recipeId;
		this.userId = userId;
	}


	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(recipeId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RatingId other = (RatingId) obj;
		return recipeId == other.recipeId && userId == other.userId;
	}


	@Override
	public String toString() {
		return "RatingId [recipeId=" + recipeId + ", userId=" + userId + "]";
	}
	
	

}
