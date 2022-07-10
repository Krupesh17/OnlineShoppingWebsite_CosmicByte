package com.cosmicbyte.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmicbyte.dao.AddressDAO;
import com.cosmicbyte.model.Address;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	AddressDAO addressDAO;
	
// UPDATE ADDRESS
	@PostMapping("/updateAddress")
	public String updateAddress(@ModelAttribute("addressDetails") Address address, BindingResult result) {
		
		if(!result.hasErrors()) {
			
			addressDAO.updateAddress(address);
			return "redirect:/user/my-account";
		}
		else {
			
			return "redirect:/home";
		}
	}
}
