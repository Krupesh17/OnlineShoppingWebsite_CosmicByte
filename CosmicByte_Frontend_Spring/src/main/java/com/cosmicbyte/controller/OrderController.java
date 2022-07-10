package com.cosmicbyte.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmicbyte.dao.AddressDAO;
import com.cosmicbyte.dao.CartDAO;
import com.cosmicbyte.dao.OrderDAO;
import com.cosmicbyte.dao.UserDAO;
import com.cosmicbyte.model.Address;
import com.cosmicbyte.model.Cart;
import com.cosmicbyte.model.Order;
import com.cosmicbyte.model.User;
import com.cosmicbyte.model.TempDataStorage;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	AddressDAO addressDAO;
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	OrderDAO orderDAO;
	
	@RequestMapping("/place-order")
	public String getCheckOutPage(ModelMap map) {
		
		String username = "";
		int totalOfOldPrice = 0;
		int totalOfPrice = 0;
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		int addressId = user.getAddress().getAddressId();
		
		Address address = addressDAO.displayAddressById(addressId);
		
		List<Cart> cartItems = cartDAO.displayAllProductsFromCartByUserId(user);

		for(Cart cartItem : cartItems) {
			totalOfOldPrice += cartItem.getProdOldPrice();
			totalOfPrice += cartItem.getProdPrice();
		}
		
		TempDataStorage priceDetails = new TempDataStorage();
		priceDetails.setItemCount(cartItems.size());
		priceDetails.setTotalOfOldPrice(totalOfOldPrice);
		priceDetails.setTotalOfPrice(totalOfPrice);
		priceDetails.setDiscount(totalOfOldPrice - totalOfPrice);
		
		map.addAttribute("userDetails", user);
		map.addAttribute("addressDetails", address);
		map.addAttribute("cartItems", cartItems);
		map.addAttribute("priceDetails", priceDetails);
		
		// Sending empty object of TempDataStorage CLASS to get ATM CARD DETAILS and match those details in checkCardDetails() method.
		map.addAttribute("cardDetails", new TempDataStorage());
		
		return "checkOut";
	}
	
	
//TO ADD PRODUCTS TO ORDERS USING COD
	@RequestMapping("/confirm-order-mass")
	public String addListOfProductsToOrder_COD(ModelMap map) {
		
		String username = "";
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		
		// CODE TO GET DELIVERY DATE.
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate date = LocalDate.now();
		date = date.plusDays(7);
		String deliveryDate = dateTimeFormatter.format(date);
		
		//LIST OF ITEMS FROM CART.
		List<Cart> cartItems = cartDAO.displayAllProductsFromCartByUserId(user);
		
		for(Cart cartItem : cartItems) {
			
			Order orderItem = new Order(cartItem.getProdName(), cartItem.getProdImageLink(), cartItem.getProdModel(), 
					cartItem.getProdPrice(), deliveryDate, user);
			
			//ADDING PRODUCT TO ORDER.
			orderDAO.addProductToOrder(orderItem);
			
			// REMOVING PRODUCT FROM CART AFTER ADDING IT TO ORDER.
			cartDAO.removeProductFromCart(cartItem);
		}
		
		List<Order> orderedItems = orderDAO.displayAllProductsFromOrderByUserId(user);
		map.addAttribute("orderedItems", orderedItems);
		
		return "myOrder";
	}
	
	
//TO ADD PRODUCT TO ORDER USING COD
	@RequestMapping("/confirm-order-solo/{prodModel}")
	public String addSoloProductToOrder_COD(@PathVariable("prodModel") String prodModel, ModelMap map) {
		
		String username = "";
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		
		// CODE TO GET DELIVERY DATE.
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate date = LocalDate.now();
		date = date.plusDays(7);
		String deliveryDate = dateTimeFormatter.format(date);
		
		Cart cartItem = cartDAO.displayProductByModel(prodModel);
		
		Order orderItem = new Order(cartItem.getProdName(), cartItem.getProdImageLink(), cartItem.getProdModel(), 
				cartItem.getProdPrice(), deliveryDate, user);

		//ADDING PRODUCT TO ORDER.
		orderDAO.addProductToOrder(orderItem);
		
		// REMOVING PRODUCT FROM CART AFTER ADDING IT TO ORDER.
		cartDAO.removeProductFromCart(cartItem);
		
		// LIST OF ORDERED ITEMS SENDING TO MY ORDERS PAGE.
		List<Order> orderedItems = orderDAO.displayAllProductsFromOrderByUserId(user);
		map.addAttribute("orderedItems", orderedItems);
		
		return "myOrder";
	}
	
	
// TO ADD LIST OF PRODUCTS TO ORDERS FROM CART
	@RequestMapping("/pay-mass")
	public String addListOfProductsToOrder(@ModelAttribute("cardDetails") TempDataStorage cardDetails, ModelMap map) {
		
		String username = "";
		
		String cardNumber = "1234123412341234";
		int Month = 7;
		int Year = 23;
		int cvvNumber = 111;
							
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		
		// CODE TO GET DELIVERY DATE.
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate date = LocalDate.now();
		date = date.plusDays(7);
		String deliveryDate = dateTimeFormatter.format(date);
		
		//LIST OF ITEMS FROM CART.
		List<Cart> cartItems = cartDAO.displayAllProductsFromCartByUserId(user);
		
		if(cardNumber.equals(cardDetails.getCardNumber()) && Month == cardDetails.getValidMonth() && 
				Year == cardDetails.getValidYear() && cvvNumber == cardDetails.getCvvNumber()) {
			
			for(Cart cartItem : cartItems) {
				
				Order orderItem = new Order(cartItem.getProdName(), cartItem.getProdImageLink(), cartItem.getProdModel(), 
						cartItem.getProdPrice(), deliveryDate, user);
				
				//ADDING PRODUCT TO ORDER.
				orderDAO.addProductToOrder(orderItem);
				
				// REMOVING PRODUCT FROM CART AFTER ADDING IT TO ORDER.
				cartDAO.removeProductFromCart(cartItem);
			}
			
			List<Order> orderedItems = orderDAO.displayAllProductsFromOrderByUserId(user);
			map.addAttribute("orderedItems", orderedItems);
			
			return "myOrder";
		} 
		else {
			return "redirect:/order/place-order";
		}

	}
	
	
// TO ADD PRODUCT TO ORDERS FROM CART
	@RequestMapping("/pay-solo/{prodModel}")
	public String addSoloProductToOrder(@PathVariable("prodModel") String prodModel, @ModelAttribute("cardDetails") TempDataStorage cardDetails, ModelMap map) {
		
		String username = "";
		
		String cardNumber = "1234123412341234";
		int Month = 7;
		int Year = 23;
		int cvvNumber = 111;
							
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		
		// CODE TO GET DELIVERY DATE.
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate date = LocalDate.now();
		date = date.plusDays(7);
		String deliveryDate = dateTimeFormatter.format(date);
		
		Cart cartItem = cartDAO.displayProductByModel(prodModel);
		
		if(cardNumber.equals(cardDetails.getCardNumber()) && Month == cardDetails.getValidMonth() && 
				Year == cardDetails.getValidYear() && cvvNumber == cardDetails.getCvvNumber()) {
			
			Order orderItem = new Order(cartItem.getProdName(), cartItem.getProdImageLink(), cartItem.getProdModel(), 
					cartItem.getProdPrice(), deliveryDate, user);

			//ADDING PRODUCT TO ORDER.
			orderDAO.addProductToOrder(orderItem);
			
			// REMOVING PRODUCT FROM CART AFTER ADDING IT TO ORDER.
			cartDAO.removeProductFromCart(cartItem);
			
			// LIST OF ORDERED ITEMS SENDING TO MY ORDERS PAGE.
			List<Order> orderedItems = orderDAO.displayAllProductsFromOrderByUserId(user);
			map.addAttribute("orderedItems", orderedItems);
			
			return "myOrder";
		} 
		else {
			return "redirect:/order/place-order";
		}
	}
	
	
// TO VISIT ORDERS PAGE.
	@RequestMapping("/my-orders")
	public String getOrdersPage(ModelMap map) {
		
		String username = "";
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username);
		
		List<Order> orderedItems = orderDAO.displayAllProductsFromOrderByUserId(user);
		map.addAttribute("orderedItems", orderedItems);
		return "myOrder";
	}
}



