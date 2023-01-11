package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Country;
import com.skilldistillery.mealmagic.entities.DietaryPreference;

@Service
@Transactional
public class DietaryPreferenceDAOImpl implements DietaryPreferenceDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public DietaryPreference findById(int dpId) {
		return em.find(DietaryPreference.class, dpId);
	}

	@Override
	public DietaryPreference createDp(DietaryPreference dp) {
		em.persist(dp);
		return dp;
	}

	@Override
	public boolean deleteDp(int dpId) {
		boolean dietaryPreferenceWasDeleted = false;
		DietaryPreference dp = em.find(DietaryPreference.class, dpId);
          if(dp != null) {
        	  em.remove(dp);
        	  dietaryPreferenceWasDeleted = !em.contains(dp);
          }
		return dietaryPreferenceWasDeleted;
	}

	@Override
	public DietaryPreference updateDp(int dpId, DietaryPreference dp) {
		DietaryPreference updateDp = em.find(DietaryPreference.class, dp.getId());
		
		if(updateDp != null) {
			updateDp.setName(dp.getName());
			updateDp.setDescription(dp.getDescription());
			
			em.persist(updateDp);
		}
		return dp;
	}

	@Override
	public List<DietaryPreference> findAll() {
		String query = "SELECT d FROM DietaryPreference d ";
		System.out.println(query);
		List<DietaryPreference> dp = em.createQuery(query, DietaryPreference.class)
				.getResultList();
		return dp;
	}

}
