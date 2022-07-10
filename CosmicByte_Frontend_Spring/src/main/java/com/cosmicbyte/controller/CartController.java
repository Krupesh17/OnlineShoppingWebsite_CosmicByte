package com.cosmicbyte.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmicbyte.dao.AddressDAO;
import com.cosmicbyte.dao.CartDAO;
import com.cosmicbyte.dao.ProductDAO;
import com.cosmicbyte.dao.UserDAO;
import com.cosmicbyte.model.Address;
import com.cosmicbyte.model.Cart;
import com.cosmicbyte.model.TempDataStorage;
import com.cosmicbyte.model.Product;
import com.cosmicbyte.model.User;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	AddressDAO addressDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CartDAO cartDAO;
	
// TO ADD PRODUCT IN CART	
@RequestMapping("/add_to_cart/{id}")
	public String addProductToCart(@PathVariable("id") int prodId) {
	
		String username = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
	
		Product product = productDAO.displayProductById(prodId);
		
		Cart cartItem = new Cart(product.getProdImage(), product.getProdName(), product.getProdCode(), product.getProdOldPrice(), 
				product.getProdPrice(), user);
		
		if(cartDAO.isExcistByModel(product.getProdCode())) {
			
			return "redirect:/cart/open_cart";
		}
		else {
			
			cartDAO.addProductToCart(cartItem);
			return "redirect:/cart/open_cart";
		}
		
	}


// TO OPEN CART PAGE
	@RequestMapping("/open_cart")
	public String getMyCartPage(ModelMap map) {
		
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
		
		map.addAttribute("addressDetails", address);
		map.addAttribute("cartItems", cartItems);
		map.addAttribute("priceDetails", priceDetails);
		
		return "myCart";
	}
	
// TO REMOVE PRODUCT FROM CART
	@RequestMapping("/remove/{id}")
	public String removeProductFromCart(@PathVariable("id") int prodId) {
		Cart cart = new Cart();
		cart.setId(prodId);
		cartDAO.removeProductFromCart(cart);
		return "redirect:/cart/open_cart";
	}
}
