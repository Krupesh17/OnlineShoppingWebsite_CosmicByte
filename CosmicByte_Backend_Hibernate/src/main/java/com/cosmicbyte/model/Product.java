package com.cosmicbyte.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prodId;
	 
	@Column
	@NotEmpty(message="Product Name is required")
	@Size(min=2, message = "Minimum length for Product Name is 2")
	private String prodName;
	
	@NotEmpty(message="Product Image Link is required")
	private String prodImage;
	
	@NotEmpty(message="Product Code is required")
	private String prodCode;
	
	@NotEmpty(message="Product Brand Name is required")
	private String prodBrand;
	
	@Column(length = 2000000000)
	@NotEmpty(message="Product Description is required")
	private String prodDescription;
	
	@Column
	@NotEmpty(message="Product Type is required")
	private String prodType;			//<- Will hold info about which type of product it is like is it a keyboard or mouse
	
	@DecimalMin("0")
	@DecimalMax("10000000")
	private int prodOldPrice;
	
	@DecimalMin("0")
	@DecimalMax("10000000")
	private int prodPrice;
	
	@NotEmpty(message="Product Behaviour is required")
	private String prodBehaviour;		//<- Will hold product popularity info like is product most best seller or most viewed.
	
	@NotEmpty(message="Product Category is required")
	private String prodCategory;			//<- Will hold section info like is product gaming accessory or console accessory.
	
	@NotEmpty(message="Product Availability is required")
	private String prodAvailability;
	
	@NotEmpty(message="Product Sale is required")
	private String prodOnSale;
	
	
// CONSTRUCTORS	
	public Product() {
		super();
	}
	
	public Product(String prodName, String prodImage, String prodCode, String prodBrand, String prodDescription, String prodType, int prodOldPrice,
			int prodPrice, String prodBehaviour, String prodCategory, String prodAvailability, String prodOnSale) {
		super();
		this.prodName = prodName;
		this.prodImage = prodImage;
		this.prodCode = prodCode;
		this.prodBrand = prodBrand;
		this.prodDescription = prodDescription;
		this.prodType = prodType;
		this.prodOldPrice = prodOldPrice;
		this.prodPrice = prodPrice;
		this.prodBehaviour = prodBehaviour;
		this.prodCategory = prodCategory;
		this.prodAvailability = prodAvailability;
		this.prodOnSale = prodOnSale;
	}

	
// GETTERS & SETTERS
	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	
	public String getProdImage() {
		return prodImage;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	public String getProdBrand() {
		return prodBrand;
	}

	public void setProdBrand(String prodBrand) {
		this.prodBrand = prodBrand;
	}

	public String getProdDescription() {
		return prodDescription;
	}

	public void setProdDescription(String prodDescription) {
		this.prodDescription = prodDescription;
	}
	
	public String getProdType() {
		return prodType;
	}

	public void setProdType(String prodType) {
		this.prodType = prodType;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdOldPrice() {
		return prodOldPrice;
	}

	public void setProdOldPrice(int prodOldPrice) {
		this.prodOldPrice = prodOldPrice;
	}

	public String getProdBehaviour() {
		return prodBehaviour;
	}

	public void setProdBehaviour(String prodBehaviour) {
		this.prodBehaviour = prodBehaviour;
	}

	public String getProdCategory() {
		return prodCategory;
	}
	
	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}
	
	public String getProdAvailability() {
		return prodAvailability;
	}

	public void setProdAvailability(String prodAvailability) {
		this.prodAvailability = prodAvailability;
	}

	public String getProdOnSale() {
		return prodOnSale;
	}

	public void setProdOnSale(String prodOnSale) {
		this.prodOnSale = prodOnSale;
	}	
	
}
