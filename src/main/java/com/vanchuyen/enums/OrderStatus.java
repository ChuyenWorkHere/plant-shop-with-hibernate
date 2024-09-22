package com.vanchuyen.enums;

public enum OrderStatus {
	SUCCESS("SUCCESS"),
	FAIL("FAILED"),
	WAIT("WAITING");
	
	private final String description;
	
	private OrderStatus(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
