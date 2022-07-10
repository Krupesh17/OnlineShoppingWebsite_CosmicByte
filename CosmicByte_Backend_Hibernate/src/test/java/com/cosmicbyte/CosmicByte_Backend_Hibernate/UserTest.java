package com.cosmicbyte.CosmicByte_Backend_Hibernate;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringRunner;

import com.cosmicbyte.dao.UserDAO;
import com.cosmicbyte.model.User;
import com.cosmicbyte.config.AppConfig;

@RunWith(SpringRunner.class)
@SpringJUnitConfig(classes=AppConfig.class)
public class UserTest 
{
	@Autowired
	UserDAO userDAO;
	
    @Test
    @Ignore
    public void test_AddUser() {
        assertTrue(userDAO.addUser(new User("Krupesh Vilas Parab", "Krupesh2000", "Male", "7208685804", "krupeshparab17@gmail.com", "Pass@123", 
        		"admin", true)));
    }
    
    @Test
    @Ignore
    public void test_UpadteUser() {
    	User updatedUser = userDAO.displayUser(1);
    	updatedUser.setUsername("Krupesh17");
    	assertTrue(userDAO.updateUser(updatedUser));
    }
    
    @Test
    @Ignore
    public void displayUsersTest() {
    	assertNotNull(userDAO.displayUsers());
    }  
    
    @Test
    @Ignore
    public void displayUserById() {
    	assertNotNull(userDAO.displayUser(1));
    }
    
    @Test
    @Ignore
    public void deleteUserTest() {
    	User user = new User();
    	user.setUserId(1);
        assertTrue(userDAO.deleteUser(user));
    }
}
