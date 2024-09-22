package com.vanchuyen.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Product")
public class Product {
	
	@Id
	@GeneratedValue(generator = "IDProductGenerator")
	@GenericGenerator(name = "IDProductGenerator", strategy = "com.vanchuyen.util.IDProductGenerator")
	@Column(name = "ProductID")
	private String productID;
	
	@Column(name = "ProductName")
	private String productName;
	
	@Column(name = "ProductPrice")
	private double productPrice;
	
	@Column(name = "ProductImage")
	private String productImage;
	
	@Column(name = "ProductQuantity")
	private int productQuantity;
	
	@Column(name = "ProductStarRating")
	private int productStarRating;
	
	@Column(name = "ProductSale")
	private double productSale;
	
	@Column(name = "ProductDescription")
	private String productDescription;
	
	@ManyToOne
	@JoinColumn(name = "categoryID")
	private Category category;
	
	@ManyToMany(mappedBy = "products")
	private Set<Users> users = new HashSet<Users>();
	
	@ManyToMany(mappedBy = "products")
	private Set<Orders> orders = new HashSet<Orders>();
	
	public Product() {
		
	}

	public Product(String productID, String productName, double productPrice, String productImage, int productQuantity,
			int productStarRating, double productSale, String productDescription) {
		this.productID = productID;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productImage = productImage;
		this.productQuantity = productQuantity;
		this.productStarRating = productStarRating;
		this.productSale = productSale;
		this.productDescription = productDescription;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public int getProductStarRating() {
		return productStarRating;
	}

	public void setProductStarRating(int productStarRating) {
		this.productStarRating = productStarRating;
	}

	public double getProductSale() {
		return productSale;
	}

	public void setProductSale(double productSale) {
		this.productSale = productSale;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}

	//Round to 2 digits
	public double getPriceAfterSale() {
		return (double)(Math.round(this.productPrice * (100 - this.productSale) ) / 100.0);
	}
	
	@Override
	public String toString() {
		return "Product [productID=" + productID + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productImage=" + productImage + ", productQuantity=" + productQuantity + ", productStarRating="
				+ productStarRating + ", productSale=" + productSale + ", productDescription=" + productDescription
				+ ", category=" + category + "]";
	}

	
}
