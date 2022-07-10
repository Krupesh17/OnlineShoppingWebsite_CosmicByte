package com.cosmicbyte.model;

public class TempDataStorage {

	private int itemCount;
	private int discount;
	private int totalOfOldPrice;
	private int totalOfPrice;
	private String cardNumber;
	private int validMonth;
	private int validYear;
	private int cvvNumber;


	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	
	public int getTotalOfOldPrice() {
		return totalOfOldPrice;
	}

	public void setTotalOfOldPrice(int totalOfOldPrice) {
		this.totalOfOldPrice = totalOfOldPrice;
	}

	public int getTotalOfPrice() {
		return totalOfPrice;
	}

	public void setTotalOfPrice(int totalOfPrice) {
		this.totalOfPrice = totalOfPrice;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public int getValidMonth() {
		return validMonth;
	}

	public void setValidMonth(int validMonth) {
		this.validMonth = validMonth;
	}

	public int getValidYear() {
		return validYear;
	}

	public void setValidYear(int validYear) {
		this.validYear = validYear;
	}

	public int getCvvNumber() {
		return cvvNumber;
	}

	public void setCvvNumber(int cvvNumber) {
		this.cvvNumber = cvvNumber;
	}
}
