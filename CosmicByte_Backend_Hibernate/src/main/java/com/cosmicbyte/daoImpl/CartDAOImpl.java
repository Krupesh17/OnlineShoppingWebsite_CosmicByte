package com.cosmicbyte.daoImpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosmicbyte.dao.CartDAO;
import com.cosmicbyte.model.Cart;
import com.cosmicbyte.model.User;

@Transactional
@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addProductToCart(Cart cartItem) {
		
		sessionFactory.getCurrentSession().save(cartItem);
		return true;
	}

	@Override
	public List<Cart> displayAllProductsFromCartByUserId(User user) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Cart where userId = :user");
		query.setParameter("user", user);
		return (List<Cart>)query.getResultList();
	}
	
	@Override
	public Cart displayProductByModel(String prodModel) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Cart where prodModel = :prodModel");
		query.setParameter("prodModel", prodModel);
		return (Cart) query.getResultList().get(0);
	}
	
	public boolean isExcistByModel(String prodModel) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Cart where prodModel = :prodModel");
		query.setParameter("prodModel", prodModel);
		
		List<Cart> listOfItems = query.getResultList();
		
		if(listOfItems.isEmpty()) {
			
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public boolean removeProductFromCart(Cart cartItem) {
		
		sessionFactory.getCurrentSession().delete(cartItem);
		return true;
	}
}
