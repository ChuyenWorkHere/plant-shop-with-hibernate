package com.vanchuyen.model;

import java.time.LocalDate;
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
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Orders")
public class Orders {
	
	@Id
	@GeneratedValue(generator = "IDOrderGenerator")
	@GenericGenerator(name = "IDOrderGenerator", strategy = "com.vanchuyen.util.IDOrderGenerator")
	@Column(name = "OrderID")
	private String orderID;
	
	@Column(name = "FirstName")
	private String fName;
	
	@Column(name = "LastName")
	private String lName;
	
	@Column(name = "Company")
	private String company;
	
	@Column(name = "OrderDate")
	private LocalDate orderDate;
	
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
	
	@Column(name = "Note")
	private String note;
	
	@Column(name = "Status")
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "userID")
	private Users user;
	
	@ManyToMany
	@JoinTable(name = "OrdersDetails",
	joinColumns = {@JoinColumn(name = "OrderID", referencedColumnName = "orderID")},
	inverseJoinColumns = {@JoinColumn(name = "ProductID", referencedColumnName = "productID")}	)
	private Set<Product> products = new HashSet<Product>();
	
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

	public Orders(String fName, String lName, String company, String country, String city, String address, String phone,
			String email, String note, String status, Users user, Set<Product> products, LocalDate orderDate) {
		super();
		this.fName = fName;
		this.lName = lName;
		this.company = company;
		this.country = country;
		this.city = city;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.note = note;
		this.status = status;
		this.user = user;
		this.products = products;
		this.orderDate = orderDate;
	}

	public Orders(String orderID, String fName, String lName, String company, String country, String city,
			String address, String phone, String email, String note, String status, Users user, Set<Product> products) {
		super();
		this.orderID = orderID;
		this.fName = fName;
		this.lName = lName;
		this.company = company;
		this.country = country;
		this.city = city;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.note = note;
		this.status = status;
		this.user = user;
		this.products = products;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Orders [orderID=" + orderID + ", fName=" + fName + ", lName=" + lName + ", company=" + company
				+ ", orderDate=" + orderDate + ", country=" + country + ", city=" + city + ", address=" + address
				+ ", phone=" + phone + ", email=" + email + ", note=" + note + ", status=" + status + "]";
	}
	
	
}
