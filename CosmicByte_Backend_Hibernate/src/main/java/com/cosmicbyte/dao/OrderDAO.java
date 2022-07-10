package com.cosmicbyte.dao;

import java.util.List;

import com.cosmicbyte.model.Order;
import com.cosmicbyte.model.User;

public interface OrderDAO {

	public boolean addProductToOrder(Order orderItem);
	public List<Order> displayAllProductsFromOrderByUserId(User user);
	public boolean removeProductFromOrder(Order orderItem);
}
