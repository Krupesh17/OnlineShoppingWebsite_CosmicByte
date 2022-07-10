package com.cosmicbyte.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	@Column
	@NotEmpty(message = "Full Name is required.")
	private String fullName;
	
	@Column
	@NotEmpty(message = "Username is required.")
	@Size(min = 4, max = 20, message = "Username length should be min 4 and max 16.")
	private String username;
	
	@Column
	@NotEmpty(message = "Gender is required.")
	private String gender;
	
	@NotEmpty(message = "Mobile Number is required.")
	@Size(min = 10, max = 12, message = "Mobile Number length should be min 10 and max 12.")
	private String mobileNumber;
	
	@NotEmpty(message = "Email is required")
	private String email;
	
	@NotEmpty(message = "Password is required")
	private String password;
	
	@Column
	private String authority = "user";
	private boolean enabled = true;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER) // By Default @OneToOne Mapping's Fetch Type is EAGER.
	@JoinColumn(name="address_FK")
	private Address address;
	
	@OneToMany(mappedBy = "user")
	private List<Cart> cartItems = new ArrayList<Cart>();
	
	@OneToMany(mappedBy = "userData")
	private List<Order> orderedItems = new ArrayList<Order>(); 
	
// CONSTRUCTOR
	public User() {
		super();
	}
	
	public User(String fullName, String username, String gender, String mobileNumber, String email, String password, String authority, 
			boolean enabled) {
		super();
		this.fullName = fullName;
		this.username = username;
		this.gender = gender;
		this.mobileNumber = mobileNumber;
		this.email = email;
		this.password = password;
		this.authority = authority;
		this.enabled = enabled;
	}

	
// GETTERS & SETTERS
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getFullName() {
		return fullName;
	}
	
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getMobileNumber() {
		return mobileNumber;
	}
	
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;	
	}
	
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;	
	}

	public List<Cart> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<Cart> cartItems) {
		this.cartItems = cartItems;
	}

	public List<Order> getOrderedItems() {
		return orderedItems;
	}

	public void setOrderedItems(List<Order> orderedItems) {
		this.orderedItems = orderedItems;
	}
		
	
}
