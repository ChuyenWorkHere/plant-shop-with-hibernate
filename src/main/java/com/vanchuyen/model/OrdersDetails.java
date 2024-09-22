package com.vanchuyen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vanchuyen.embeddables.OrdersDetailEmbeddable;

@Entity
@Table(name = "OrdersDetails")
public class OrdersDetails {
	
	@Id
	private OrdersDetailEmbeddable orderDetailID;
	
	@Column(name = "Quantity")
	private int quantity;
	
	public OrdersDetails() {
		// TODO Auto-generated constructor stub
	}

	public OrdersDetails(OrdersDetailEmbeddable orderDetailID, int quantity) {
		this.orderDetailID = orderDetailID;
		this.quantity = quantity;
	}

	public OrdersDetailEmbeddable getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(OrdersDetailEmbeddable orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
