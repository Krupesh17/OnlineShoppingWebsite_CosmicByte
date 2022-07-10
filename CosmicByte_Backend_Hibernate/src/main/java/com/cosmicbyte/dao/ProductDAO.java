package com.cosmicbyte.dao;

import java.util.List;

import com.cosmicbyte.model.Product;

public interface ProductDAO {
	public boolean addProduct(Product product);
	public boolean updateProduct(Product product);
	public List<Product> displayProducts();
	public Product displayProductById(int productId);
	public List<Product> displayProductsByCategory(String Category);
	public List<Product> displayProductsByType(String prodType);
	public List<Product> displayProductsByBehaviour(String prodBehaviour);
	public List<Product> displayProductByPriceDescending(String category);
	public List<Product> displayProductByPriceAscending(String category);
	public List<Product> displayProductBySearchValue(String category, String searchValue);
	public boolean deleteProduct(Product product);
}
