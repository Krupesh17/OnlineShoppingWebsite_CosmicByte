package com.cosmicbyte.CosmicByte_Backend_Hibernate;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringRunner;

import com.cosmicbyte.config.AppConfig;
import com.cosmicbyte.dao.ProductDAO;
import com.cosmicbyte.model.Product;

@RunWith(SpringRunner.class)
@SpringJUnitConfig(classes=AppConfig.class)
public class ProductTest {

	@Autowired
	ProductDAO productDAO;
	
    @Test
    @Ignore
    public void test_AddProduct() {
    	assertEquals(true, productDAO.addProduct(new Product("COSMIC BYTE CB-GK-20 STYX TKL MEMBRANE GAMING KEYBOARD WITH RAINBOW LED (BLACK)", "https://ik.imagekit.io/bfrs/tr:w-500,h-500,pr-true,cm-pad_resize,bg-FFFFFF/image_cosmic/data/Styx-top-min.jpg", "TCBP03382", "Cosmic Byte", "TKL Membrane Keyboard. Anti-Ghosting Keys: 6 Keys. Backlight: Rainbow single color. Wired USB Connection for Laptops and PCs.", "Gaming Keybord", 899, 699, "Most Viewed", "Gaming Accessories", "true", "true")));
    }
    
    
    @Test
    @Ignore
    public void test_UpdateProduct() {
    	Product updatedProduct = new Product("COSMIC BYTE CB-GK-20 STYX TKL MEMBRANE GAMING KEYBOARD WITH RAINBOW LED (BLACK)", "https://ik.imagekit.io/bfrs/tr:w-500,h-500,pr-true,cm-pad_resize,bg-FFFFFF/image_cosmic/data/Styx-top-min.jpg", "TCBP03382", "Cosmic Byte", "TKL Membrane Keyboard. Anti-Ghosting Keys: 6 Keys. Backlight: Rainbow single color. Wired USB Connection for Laptops and PCs.", "Gaming Keybord", 849, 699, "Most Viewed", "Gaming Accessories", "true", "true");
    	updatedProduct.setProdId(1);
    	
    	assertEquals(true, productDAO.updateProduct(updatedProduct));
    }
    
    @Test
    @Ignore
    public void test_DisplayProducts() {
    	assertNotEquals(null, productDAO.displayProducts());
    }
    
    @Test
    @Ignore
    public void test_DeleteProduct() {
    	Product deleteProduct = new Product();
    	deleteProduct.setProdId(1);
    	
    	assertEquals(true, productDAO.deleteProduct(deleteProduct));
    }

}
