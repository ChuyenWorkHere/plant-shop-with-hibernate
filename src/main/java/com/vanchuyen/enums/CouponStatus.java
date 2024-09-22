package com.vanchuyen.enums;

public enum CouponStatus {
	ACTIVE("ACTIVE"),
	EXPIRED("EXPIRED"),
	USED("USED");
	
	private final String description;
	
	private CouponStatus(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
