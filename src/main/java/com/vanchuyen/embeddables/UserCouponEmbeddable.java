package com.vanchuyen.embeddables;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UserCouponEmbeddable implements Serializable {
	
	@Column(name = "uID")
	private String userID;
		
	@Column(name = "CouponID")
	private String couponID;
	
	public UserCouponEmbeddable() {
		// TODO Auto-generated constructor stub
	}

	public UserCouponEmbeddable(String userID, String couponID) {
		super();
		this.userID = userID;
		this.couponID = couponID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getCouponID() {
		return couponID;
	}

	public void setCouponID(String couponID) {
		this.couponID = couponID;
	}
	
	
}
