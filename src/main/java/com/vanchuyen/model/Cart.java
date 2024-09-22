package com.vanchuyen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vanchuyen.embeddables.CartEmbeddable;

@Entity
@Table(name = "Cart")
public class Cart {
	
	@Id
	private CartEmbeddable cartID;
	
	@Column(name = "Quantity")
	private int quantity;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public CartEmbeddable getCartID() {
		return cartID;
	}

	public void setCartID(CartEmbeddable cartID) {
		this.cartID = cartID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Cart [cartID=" + cartID + ", quantity=" + quantity + "]";
	}
	
	
}
