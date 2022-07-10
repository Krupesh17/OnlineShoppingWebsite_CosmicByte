package com.cosmicbyte.dao;

import java.util.List;

import com.cosmicbyte.model.User;

public interface UserDAO {
	public boolean addUser(User user);	
	public boolean updateUser(User user);	
	public List<User> displayUsers();		
	public User displayUser(int userId);
	public User displayUserByName(String username);
	public boolean deleteUser(User user);	
}
