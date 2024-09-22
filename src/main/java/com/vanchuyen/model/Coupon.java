package com.vanchuyen.model;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Coupon")
public class Coupon {
	
	@Id
	@GeneratedValue(generator = "IDCouponGenerator")
	@GenericGenerator(name = "IDCouponGenerator", strategy = "com.vanchuyen.util.IDCouponGenerator")
	@Column(name = "CouponID")
	private String couponID;
	
	@Column(name = "DayStart")
	private LocalDate dayStart;
	
	@Column(name = "DayExpired")
	private LocalDate dayExpired;
	
	@Column(name = "CouponCode")
	private String couponCode;
	
	@Column(name = "Discount")
	private double discount;
	
	@ManyToMany(mappedBy = "coupons")
	private Set<Users> users = new HashSet<Users>();
	
	
	public Coupon() {
		super();
	}

	public Coupon(LocalDate dayStart, LocalDate dayExpired, String couponCode, double discount, Set<Users> users) {
		this.dayStart = dayStart;
		this.dayExpired = dayExpired;
		this.couponCode = couponCode;
		this.discount = discount;
		this.users = users;
	}

	public Coupon(String couponID, LocalDate dayStart, LocalDate dayExpired, String couponCode, double discount, Set<Users> users) {
		super();
		this.couponID = couponID;
		this.dayStart = dayStart;
		this.dayExpired = dayExpired;
		this.couponCode = couponCode;
		this.discount = discount;
		this.users = users;
	}


	public LocalDate getDayStart() {
		return dayStart;
	}


	public void setDayStart(LocalDate dayStart) {
		this.dayStart = dayStart;
	}


	public LocalDate getDayExpired() {
		return dayExpired;
	}


	public void setDayExpired(LocalDate dayExpired) {
		this.dayExpired = dayExpired;
	}


	public String getCouponCode() {
		return couponCode;
	}


	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}


	public double getDiscount() {
		return discount;
	}


	public void setDiscount(double discount) {
		this.discount = discount;
	}


	public String getCouponID() {
		return couponID;
	}


	public void setCouponID(String couponID) {
		this.couponID = couponID;
	}


	public Set<Users> getUsers() {
		return users;
	}


	public void setUsers(Set<Users> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Coupon [couponID=" + couponID + ", dayStart=" + dayStart + ", dayExpired=" + dayExpired
				+ ", couponCode=" + couponCode + ", discount=" + discount + "]";
	}
	
	
	
}
