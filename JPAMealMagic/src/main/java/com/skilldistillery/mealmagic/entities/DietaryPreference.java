package com.skilldistillery.mealmagic.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="dietary_preference")
public class DietaryPreference {
	
	@Id
	@GeneratedValue
	private int id;
	
	private String name;

	public DietaryPreference() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		DietaryPreference other = (DietaryPreference) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "DietaryPreference [id=" + id + ", name=" + name + "]";
	}
	
	

}
