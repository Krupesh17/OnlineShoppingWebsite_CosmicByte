package com.cosmicbyte.dao;

import java.util.List;

import com.cosmicbyte.model.Cart;
import com.cosmicbyte.model.User;

public interface CartDAO {

	public boolean addProductToCart(Cart cartItem);
	public List<Cart> displayAllProductsFromCartByUserId(User user);
	public Cart displayProductByModel(String prodModel);
	public boolean isExcistByModel(String prodModel);
	public boolean removeProductFromCart(Cart cartItem);
}
