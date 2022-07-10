package com.cosmicbyte.controller;

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
import com.cosmicbyte.model.Product;
import com.cosmicbyte.model.TempDataStorage;
import com.cosmicbyte.model.User;

@Controller
public class BuyController {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	AddressDAO addressDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CartDAO cartDAO;
	
// TO ADD SOLO PRODUCT IN A CART AND GET TO checkOut.jsp PAGE WITH THAT SOLO PRODUCT.
	@RequestMapping("/buy/{id}")	
	public String addSoloProductToCart(@PathVariable("id") int prodId, ModelMap map) {
		
		String username = "";
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		int addressId = user.getAddress().getAddressId();
		
		Address address = addressDAO.displayAddressById(addressId);
		
		Product product = productDAO.displayProductById(prodId);
		
		Cart cartItem = new Cart(product.getProdImage(), product.getProdName(), product.getProdCode(), product.getProdOldPrice(), 
				product.getProdPrice(), user);
		
		if(cartDAO.isExcistByModel(product.getProdCode())) {
			
			Cart item = cartDAO.displayProductByModel(product.getProdCode());
			
			TempDataStorage priceDetails = new TempDataStorage();
			priceDetails.setItemCount(1);
			priceDetails.setTotalOfOldPrice(item.getProdOldPrice());
			priceDetails.setTotalOfPrice(item.getProdPrice());
			priceDetails.setDiscount(item.getProdOldPrice() - item.getProdPrice());
			
			map.addAttribute("userDetails", user);
			map.addAttribute("addressDetails", address);
			map.addAttribute("cartItemDetails", item);
			map.addAttribute("priceDetails", priceDetails);
			
			// Sending empty object of TempDataStorage CLASS to get ATM CARD DETAILS and match those details in checkCardDetails() method.
			map.addAttribute("cardDetails", new TempDataStorage());
			
			return "checkOut";
		}
		else {

			cartDAO.addProductToCart(cartItem);
			
			Cart item = cartDAO.displayProductByModel(product.getProdCode());
			
			TempDataStorage priceDetails = new TempDataStorage();
			priceDetails.setItemCount(1);
			priceDetails.setTotalOfOldPrice(item.getProdOldPrice());
			priceDetails.setTotalOfPrice(item.getProdPrice());
			priceDetails.setDiscount(item.getProdOldPrice() - item.getProdPrice());
			
			map.addAttribute("userDetails", user);
			map.addAttribute("addressDetails", address);
			map.addAttribute("cartItemDetails", item);
			map.addAttribute("priceDetails", priceDetails);
			
			// Sending empty object of TempDataStorage CLASS to get ATM CARD DETAILS and match those details in checkCardDetails() method.
			map.addAttribute("cardDetails", new TempDataStorage());
			
			return "checkOut";
		}
		
	}	
}


