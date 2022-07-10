package com.cosmicbyte.daoImpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosmicbyte.dao.OrderDAO;
import com.cosmicbyte.model.Order;
import com.cosmicbyte.model.User;

@Transactional
@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addProductToOrder(Order orderItem) {
		
		sessionFactory.getCurrentSession().save(orderItem);
		return true;
	}

	@Override
	public List<Order> displayAllProductsFromOrderByUserId(User user) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Order where userId = :user");
		query.setParameter("user", user);
		return (List<Order>)query.getResultList();
	}

	@Override
	public boolean removeProductFromOrder(Order orderItem) {

		sessionFactory.getCurrentSession().delete(orderItem);
		return true;
	}

}
