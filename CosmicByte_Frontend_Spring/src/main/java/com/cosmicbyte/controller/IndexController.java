package com.cosmicbyte.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cosmicbyte.dao.ProductDAO;

@Controller
public class IndexController {

	@Autowired
	ProductDAO productDAO;
	
	@GetMapping(value = {"/", "/home"})
	public String getIndexPage(ModelMap map) {
		
		map.addAttribute("mostViewedProducts", productDAO.displayProductsByBehaviour("Most Viewed"));
		map.addAttribute("bestSellerProducts", productDAO.displayProductsByBehaviour("Best Seller"));
		map.addAttribute("specialProducts", productDAO.displayProductsByBehaviour("Special"));
		return "index";
	}
}
