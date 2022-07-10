package com.cosmicbyte.serviceImpl;			

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cosmicbyte.dao.UserDAO;
import com.cosmicbyte.model.User;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	UserDAO userDAO;
	
	@Transactional(readOnly = true)
	public org.springframework.security.core.userdetails.UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 
		User user = new User();
		user.setUsername(username);
		
		User userObj = userDAO.displayUserByName(username);
		UserBuilder userBuilder = null;
		 
		if(userObj != null) {
			
			userBuilder = org.springframework.security.core.userdetails.User.withUsername(username);
			userBuilder.disabled(!userObj.isEnabled());
			userBuilder.password(userObj.getPassword());
			
			String[] authorities = new String[]{userObj.getAuthority()};
			userBuilder.authorities(authorities);
		}
		else {
		    throw new UsernameNotFoundException("User not found.");
		}
		
		return userBuilder.build();
	} 
}
