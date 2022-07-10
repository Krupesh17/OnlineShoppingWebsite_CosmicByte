package com.cosmicbyte.daoImpl;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosmicbyte.dao.AddressDAO;
import com.cosmicbyte.model.Address;

@Transactional
@Repository("addressDAO")
public class AddressDAOImpl implements AddressDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean addAddress(Address address) {

		try {
			
			sessionFactory.getCurrentSession().save(address);
			return true;
		}
		catch(Exception e) {
			
			return false;
		}
	}

	@Override
	public boolean updateAddress(Address address) {

		try {
			
			sessionFactory.getCurrentSession().saveOrUpdate(address);
			return true;
		}
		catch(Exception e) {
			
			return false;
		}
	}

	@Override
	public Address displayAddressById(int addressId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from com.cosmicbyte.model.Address where addressId=:addressId");
		return (Address)query.setParameter("addressId", addressId).getResultList().get(0);
	}

}
