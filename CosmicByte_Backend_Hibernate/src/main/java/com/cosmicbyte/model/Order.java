package com.cosmicbyte.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	
	@Column
	private String prodName;
	private String prodImageLink;
	private String prodModel;
	private int prodPrice;
	private String prodDeliveryDate;
	
	@ManyToOne
	@JoinColumn(name="userId")
	private User userData;
	
//CONSTRUCTORS
	public Order() {
		super();
	}
	
	public Order(String prodName, String prodImageLink, String prodModel, int prodPrice, String prodDeliveryDate,
			User userData) {
		super();
		this.prodName = prodName;
		this.prodImageLink = prodImageLink;
		this.prodModel = prodModel;
		this.prodPrice = prodPrice;
		this.prodDeliveryDate = prodDeliveryDate;
		this.userData = userData;
	}

// GETTERS & SETTERS	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
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
	
	public String getProdDeliveryDate() {
		return prodDeliveryDate;
	}

	public void setProdDeliveryDate(String prodDeliveryDate) {
		this.prodDeliveryDate = prodDeliveryDate;
	}

	public User getUser() {
		return userData;
	}

	public void setUser(User userData) {
		this.userData = userData;
	}
}
