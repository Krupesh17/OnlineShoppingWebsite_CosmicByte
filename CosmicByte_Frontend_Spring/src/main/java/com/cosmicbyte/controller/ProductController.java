package com.cosmicbyte.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosmicbyte.dao.ProductDAO;
import com.cosmicbyte.model.Product;

@Controller
@RequestMapping("/product") 
public class ProductController {
	 
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping("/")
	public String getProductsPage(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProducts());
		return "products";
	}
	
	@GetMapping("/add") 
	public String getAddProductPage(ModelMap map) {
		
		map.addAttribute("product", new Product());
		return "addProduct";
	} 
	
	@PostMapping("/add") 
	public String storeProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		
		if(!result.hasErrors()) {
			productDAO.addProduct(product);
			return "redirect:/home";
		}
		else {
			return "addProduct";
		}
	}
	
	@RequestMapping("/productId/{id}")
	public String getProductPageByProductId(@PathVariable("id") int prodId, ModelMap map) {
		map.addAttribute("product", productDAO.displayProductById(prodId));
		return "product";
	}
	
	@RequestMapping("/delete/{id}")
	public String deleteProductById(@PathVariable("id") int prodId) {
		
		Product product = new Product();
		product.setProdId(prodId);
		productDAO.deleteProduct(product);
		return "redirect:/home";
	}
	
	@RequestMapping("/edit/{id}")
	public String editProductById(@PathVariable("id") int prodId, ModelMap map) {
		
		Product product = productDAO.displayProductById(prodId);
		map.addAttribute("editProduct", product);
		return "editProduct";
	}
	
	@PostMapping("/update")
	public String updateProductById(@Valid @ModelAttribute("editProduct") Product product, BindingResult result) {
		
		if(!result.hasErrors()) {
			
			productDAO.updateProduct(product);
			return "redirect:/home";
		}
		else {
			return "editProduct";
		}
	}
	
// PRODUCT CATEGORY 
	@RequestMapping("/gaming_accessories")
	public String getGamingAccessories(ModelMap map) {
		map.addAttribute("products", productDAO.displayProductsByCategory("Gaming Accessory"));
		return "gamingAccessories";
	}
	
	@RequestMapping("/computer_accessories")
	public String getComputerAccessories(ModelMap map) {
		map.addAttribute("products", productDAO.displayProductsByCategory("Computer Accessory"));
		return "computerAccessories";
	}
	
	@RequestMapping("/headphones_accessories")
	public String getHeadphonesAccessories(ModelMap map) {
		map.addAttribute("products", productDAO.displayProductsByCategory("Headphones"));
		return "headphones";
	}
	
// PRODUCT TYPE	
	@RequestMapping("/gAccessoryType/{type}")
	public String getGamingAccessoriesByProductType(@PathVariable("type") String productType, ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductsByType(productType));
		return "gamingAccessories";
	}
	
	@RequestMapping("/cAccessoryType/{type}")
	public String getComputerAccessoriesByProductType(@PathVariable("type") String productType, ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductsByType(productType));
		return "computerAccessories";
	}
	
	@RequestMapping("/headphonesType/{type}")
	public String getHeadphonesByProductType(@PathVariable("type") String productType, ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductsByType(productType));
		return "headphones";
	}
	
// HEIGH-TO-LOW | LOW-TO-HEIGH
	@RequestMapping("/gAccessoryType/hightolow")
	public String getGamingAccessoriesByProductPriceHigh_To_Low(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductByPriceDescending("Gaming Accessory"));
		return "gamingAccessories";
	}
	
	@RequestMapping("/gAccessoryType/lowtohigh")
	public String getGamingAccessoriesByProductPriceLow_To_High(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductByPriceAscending("Gaming Accessory"));
		return "gamingAccessories";
	}
	
	@RequestMapping("/cAccessoryType/hightolow")
	public String getComputerAccessoriesByProductPriceHigh_To_Low(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductByPriceDescending("Computer Accessory"));
		return "computerAccessories";
	}
	
	@RequestMapping("/cAccessoryType/lowtohigh")
	public String getComputerAccessoriesByProductPriceLow_To_High(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductByPriceAscending("Computer Accessory"));
		return "computerAccessories";
	}
	
	@RequestMapping("/headphones/hightolow")
	public String getHeadphonesByProductPriceHigh_To_Low(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductByPriceDescending("headphones"));
		return "headphones";
	}
	
	@RequestMapping("/headphones/lowtohigh")
	public String getHeadphonesByProductPriceLow_To_High(ModelMap map) {
		
		map.addAttribute("products", productDAO.displayProductByPriceAscending("headphones"));
		return "headphones";
	}

// SEARCH 
	@RequestMapping("/search/c-accessory")
	public String getComputerAccessories_SearchBox(@RequestParam("search") String searchValue, ModelMap map) {
		
		String category = "Computer Accessory";
		map.addAttribute("products", productDAO.displayProductBySearchValue(category, searchValue));
		return "computerAccessories";
	}
	
	@RequestMapping("/search/g-accessory")
	public String getGamingAccessories_SearchBox(@RequestParam("search") String searchValue, ModelMap map) {
		
		String category = "Gaming Accessory";
		map.addAttribute("products", productDAO.displayProductBySearchValue(category, searchValue));
		return "gamingAccessories";
	}
	
	@RequestMapping("/search/h-accessory")
	public String getHeadphones_SearchBox(@RequestParam("search") String searchValue, ModelMap map) {
		
		String category = "headphones";
		map.addAttribute("products", productDAO.displayProductBySearchValue(category, searchValue));
		return "headphones";
	}
}
