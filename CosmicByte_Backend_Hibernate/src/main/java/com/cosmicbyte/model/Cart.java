package com.cosmicbyte.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String prodName;
	private String prodImageLink;
	private String prodModel;
	private int prodOldPrice;
	private int prodPrice;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User user;
	
// CONSTRUCTORS	
	public Cart() {
		super();
	}
	
	public Cart(String prodImageLink, String prodName, String prodModel, int prodOldPrice, int prodPrice, User user) {
		super();
		this.prodImageLink = prodImageLink;
		this.prodName = prodName;
		this.prodModel = prodModel;
		this.prodOldPrice = prodOldPrice;
		this.prodPrice = prodPrice;
		this.user = user;
	}

	
// GETTERS & SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdImageLink() {
		return prodImageLink;
	}

	public void setProdImageLink(String prodImageLink) {
		this.prodImageLink = prodImageLink;
	}

	public String getProdModel() {
		return prodModel;
	}

	public void setProdModel(String prodModel) {
		this.prodModel = prodModel;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getProdOldPrice() {
		return prodOldPrice;
	}

	public void setProdOldPrice(int prodOldPrice) {
		this.prodOldPrice = prodOldPrice;
	}
}
