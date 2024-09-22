package com.vanchuyen.embeddables;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CartEmbeddable implements Serializable  {
	
	@Column(name = "uID")
	private String userID;
	
	@Column(name = "ProductID")
	private String productID;
	
	public CartEmbeddable() {
		// TODO Auto-generated constructor stub
	}

	public CartEmbeddable(String userID, String productID) {
		super();
		this.userID = userID;
		this.productID = productID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}
	
}
