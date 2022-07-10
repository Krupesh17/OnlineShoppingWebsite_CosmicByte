package com.cosmicbyte.daoImpl;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cosmicbyte.dao.ProductDAO;
import com.cosmicbyte.model.Product;

@Transactional
@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	SessionFactory sessionFactory;

// ADD PRODUCT 
	@Override
	public boolean addProduct(Product product) {
		sessionFactory.getCurrentSession().save(product);
		return true;
	}
	
// UPDATE PRODUCT
	@Override
	public boolean updateProduct(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
		return true;
	}

// DISPLAY ALL PRODUCTS
	@Override
	public List<Product> displayProducts() {
		return sessionFactory.getCurrentSession().createCriteria(Product.class).list();
	}
	
// DISPLAY PRODUCT BY ID 
	@Override
	public Product displayProductById(int productId) {
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodId = :id");
		query.setParameter("id", productId);
		return (Product)query.getResultList().get(0);
	}
	
// DISPLAY PRODUCT BY CATEGORY
	@Override
	public List<Product> displayProductsByCategory(String category) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodCategory = :category");
		query.setParameter("category", category);
		return (List<Product>)query.getResultList();
	}
	
// DISPLAY PRODUCT BY TYPE	
	@Override
	public List<Product> displayProductsByType(String prodType) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodType = :prodType");
		query.setParameter("prodType", prodType);
		return (List<Product>)query.getResultList();
	}
	
// DISPLAY PRODUCT BY BEHAVIOUR
	@Override
	public List<Product> displayProductsByBehaviour(String prodBehaviour) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodBehaviour = :prodBehaviour");
		query.setParameter("prodBehaviour", prodBehaviour);
		return (List<Product>)query.getResultList();
	}
	

// DISPLAY PRODUCT DESCENDING	
	@Override
	public List<Product> displayProductByPriceDescending(String category) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodCategory = :category order by prodPrice desc");
		query.setParameter("category", category);
		return (List<Product>)query.getResultList();
	}
	
	
// DISPLAY PRODUCT ASCENDING
	@Override
	public List<Product> displayProductByPriceAscending(String category) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodCategory = :category order by prodPrice asc");
		query.setParameter("category", category);
		return (List<Product>)query.getResultList();
	}
	
// DELETE PRODUCT
	@Override
	public boolean deleteProduct(Product product) {
		sessionFactory.getCurrentSession().delete(product);
		return true;
	}
	
// SEARCH PRODUCT
	@Override
	public List<Product> displayProductBySearchValue(String category, String searchValue) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from com.cosmicbyte.model.Product where prodCategory = :category and prodName like :searchValue");
		query.setParameter("category", category);
		query.setParameter("searchValue", "%" + searchValue + "%");
		return (List<Product>)query.getResultList();
	}
}
