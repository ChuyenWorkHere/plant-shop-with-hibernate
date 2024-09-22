package com.vanchuyen.embeddables;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class OrdersDetailEmbeddable implements Serializable {
	
	@Column(name = "OrderID")
	private String orderID;
	
	@Column(name = "ProductID")
	private String productID;
	
	public OrdersDetailEmbeddable() {
		// TODO Auto-generated constructor stub
	}

	public OrdersDetailEmbeddable(String orderID, String productID) {
		super();
		this.orderID = orderID;
		this.productID = productID;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}
	
}
