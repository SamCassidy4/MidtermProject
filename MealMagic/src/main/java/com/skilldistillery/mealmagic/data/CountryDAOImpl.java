package com.skilldistillery.mealmagic.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealmagic.entities.Country;

@Service
@Transactional
public class CountryDAOImpl implements CountryDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Country findById(int countryId) {
		
		return em.find(Country.class, countryId);
	}

	@Override
	public Country createCountry(Country country) {
		em.persist(country);
		return country;
	}

	@Override
	public boolean deleteCountry(int countryId) {
		boolean countryWasDeleted = false;
		Country country = em.find(Country.class, countryId);
          if(country != null) {
        	  em.remove(country);
        	  countryWasDeleted = !em.contains(country);
          }
		return countryWasDeleted;
	}

	@Override
	public Country updateCountry(int countryId, Country country) {
		Country updateCountry = em.find(Country.class, country.getId());
		
		if(updateCountry != null) {
			updateCountry.setName(country.getName());
			updateCountry.setContinent(country.getContinent());
			updateCountry.setRegion(country.getRegion());
			
			em.persist(updateCountry);
		}
		return country;
	}

	@Override
	public List<Country> findAll() {
		String query = "SELECT c FROM Country c ";
		List<Country>countries = em.createQuery(query, Country.class).getResultList();
		
		return countries;
	}

//	@Override
//	public List<Country> findByKeyword(String keyword) {
//		String query = "SELECT c FROM Country c WHERE c.name LIKE :nameC";
//		
//		List<Country> country = em.createQuery(query, Country.class)
//				.setParameter("nameC", "%" + keyword + "%")
//				.getResultList();
//		
//		return country;
//	}

}
