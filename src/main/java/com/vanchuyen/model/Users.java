package com.vanchuyen.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "user")
public class Users  {

	@Id
	@GeneratedValue(generator = "IDUserGenerator")
	@GenericGenerator(name = "IDUserGenerator", strategy = "com.vanchuyen.util.IDUserGenerator")
	@Column(name = "UserID")
	private String userID;	
	
	@Column(name = "UserName")
	private String userName;
	
	@Column(name = "UserPassword")
	private String password;
	
	@Column(name = "UserAvatar")
	private String userAvatar;
	
	@Column(name = "UserRole")
	private String userRole;
	
	@Column(name = "FirstName")
	private String fName;
	
	@Column(name = "LastName")
	private String lName;
	
	@Column(name = "Company")
	private String company;
	
	@Column(name = "Country")
	private String country;
	
	@Column(name = "City")
	private String city;
	
	@Column(name = "Address")
	private String address;
	
	@Column(name = "Phone")
	private String phone;
	
	@Column(name = "Email")
	private String email;
	
	@ManyToMany
	@JoinTable(name = "User_Coupon",
			joinColumns = {@JoinColumn(name = "uID", referencedColumnName = "userID")},
			inverseJoinColumns = {@JoinColumn(name = "CouponID", referencedColumnName = "couponID")})
	private Set<Coupon> coupons = new HashSet<Coupon>();
	
	@ManyToMany
	@JoinTable(name = "Cart",
			joinColumns = {@JoinColumn(name = "uID", referencedColumnName = "userID")},
			inverseJoinColumns = {@JoinColumn(name = "productid", referencedColumnName = "productID")})
	private Set<Product> products = new HashSet<Product>();
	
	public Users() {
		super();
	}

	public Users(String userName, String password, String userAvatar, String userRole) {
		this.userName = userName;
		this.password = password;
		this.userAvatar = userAvatar;
		this.userRole = userRole;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserAvatar() {
		return userAvatar;
	}

	public void setUserAvatar(String userAvatar) {
		this.userAvatar = userAvatar;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Coupon> getCoupons() {
		return coupons;
	}

	public void setCoupons(Set<Coupon> coupons) {
		this.coupons = coupons;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Users [userID=" + userID + ", userName=" + userName + ", password=" + password + ", userAvatar="
				+ userAvatar + ", userRole=" + userRole + ", fName=" + fName + ", lName=" + lName + ", company="
				+ company + ", country=" + country + ", city=" + city + ", address=" + address + ", phone=" + phone
				+ ", email=" + email + "]";
	}
	
}
