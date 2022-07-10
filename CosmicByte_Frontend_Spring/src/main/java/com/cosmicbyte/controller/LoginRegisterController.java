package com.cosmicbyte.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmicbyte.dao.AddressDAO;
import com.cosmicbyte.dao.UserDAO;
import com.cosmicbyte.model.Address;
import com.cosmicbyte.model.User;

@Controller
@RequestMapping("/user")
public class LoginRegisterController {	
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	AddressDAO addressDAO;
	
	@RequestMapping("/login")
	public String getLoginPage() {
		
		return "login";
	}
	
	
	@RequestMapping("/register")
	public String getRegisterPage(ModelMap map) {
		
		map.addAttribute("user", new User());
		return "register";
	}
	
	
	@RequestMapping("/add") 
	public String storeUser(@Valid @ModelAttribute("user") User user, BindingResult result) throws Exception {
		
		if(!result.hasErrors()){
			
			Address address = new Address();
			
			user.setAddress(address);
			user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
			
			userDAO.addUser(user);
			

//			Email email = new Email(user.getEmail(), "Cosmic Byte: Register Successfully", "Welcome To Cosmic Byte");
//			email.sendEmail();
			
			return "redirect:/user/login";
		}
		else {
			return "register";
		}
	}
	
	
// MY ACCOUNT PAGE
	@RequestMapping("/my-account")
	public String getMyAccountPage(ModelMap map) {
		 
		String username = ""; 
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails) {
			UserDetails user = ((UserDetails)principal);
			username = user.getUsername();
		}
		
		User user = userDAO.displayUserByName(username); 
		
		int addressId = user.getAddress().getAddressId();
		
		Address address = addressDAO.displayAddressById(addressId);
		
		map.addAttribute("userDetails", user);
		map.addAttribute("addressDetails", address);
		
		return "myAccount";
	}
	
// UPDATE USER
	@PostMapping("/update")
	public String updateUser(@ModelAttribute("userDetails") User user, BindingResult result) {
		
		if(!result.hasErrors()) {
			
			userDAO.updateUser(user);
			return "myAccount";
		}
		else {
			
			return "redirect:/home";
		}
	}
	
}
