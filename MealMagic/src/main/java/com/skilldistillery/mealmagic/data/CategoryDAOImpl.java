package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Category;

@Service
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Category findById(int categoryId) {
		return em.find(Category.class, categoryId);
	}

	@Override
	public Category createCategory(Category category) {
		em.persist(category);
		return category;
	}

	@Override
	public boolean deleteCategory(int categoryId) {
		boolean categoryWasDeleted = false;
		Category category = em.find(Category.class, categoryId);
		if(category != null) {
			em.remove(category);
			categoryWasDeleted = !em.contains(category);
		}
		return categoryWasDeleted;
	}

	@Override
	public Category updateCategory(int categoryId, Category category) {
		Category updateCategory = em.find(Category.class, categoryId);
		
		if(updateCategory != null) {
			updateCategory.setName(category.getName());
			
			em.persist(updateCategory);
		}
		return category;
	}

	@Override
	public List<Category> findAll() {
		String query = "SELECT c FROM Category c";
		List<Category>categories = em.createQuery(query, Category.class)
				.getResultList();
		return categories;
	}

}
