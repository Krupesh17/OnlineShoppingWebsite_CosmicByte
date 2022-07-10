package com.cosmicbyte.daoImpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosmicbyte.dao.UserDAO;
import com.cosmicbyte.model.User;

@Transactional
@Repository("userDAO")
public class UserDAOImpl implements UserDAO {

	/*
	 * '@Autowired' Means it is going to automatically find where is the 'SessionFactory' in your project created,
	 *  a 'Bean' bean means a memory,
	 *  A memory of our 'SessionFactory' Object, So it is going to take that and give it to us.
	 */
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addUser(User user) {
		
		try {
			
			sessionFactory.getCurrentSession().save(user);
			return true;
		} 
		catch(Exception e) {
			
			return false;
		}
	}

	@Override
	public boolean deleteUser(User user) {

		try {
			
			sessionFactory.getCurrentSession().delete(user);
			return true;
		}
		catch(Exception e) {
		
			return false;
		}
	}

	@Override
	public boolean updateUser(User user) {

		try {
			
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			return true;
		}
		catch(Exception e) {
		
			return false;
		}
	}

	@Override
	public List<User> displayUsers() {

		return sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}

	@Override
	public User displayUser(int userId) {
	
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from com.cosmicbyte.model.User where userId= :uid");	//To Display Data Here We Write Query.
		
		return (User)query.setParameter("uid", userId).getResultList().get(0);	
		//Positional Parameters Didn't Work Here, So We Need To Use Named Parameters. 
	}
	
	@Override
	public User displayUserByName(String username) {
		
		Session session=sessionFactory.getCurrentSession();
		
		Query query=session.createQuery("from com.cosmicbyte.model.User where username= :uName");	//To Display Data Here We Write Query.
		
		return (User)query.setParameter("uName", username).getResultList().get(0);	
	}

}
