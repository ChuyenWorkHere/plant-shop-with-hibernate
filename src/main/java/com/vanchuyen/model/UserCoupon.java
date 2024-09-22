package com.vanchuyen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vanchuyen.embeddables.UserCouponEmbeddable;

@Entity
@Table(name = "User_Coupon")
public class UserCoupon {
	
	@Id
	private UserCouponEmbeddable userCouponID;
	
	@Column(name = "Status")
	private String status;
	
	public UserCoupon() {
		
	}

	public UserCoupon(UserCouponEmbeddable userCouponID, String status) {
		super();
		this.userCouponID = userCouponID;
		this.status = status;
	}

	public UserCouponEmbeddable getUserCouponID() {
		return userCouponID;
	}

	public void setUserCouponID(UserCouponEmbeddable userCouponID) {
		this.userCouponID = userCouponID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
