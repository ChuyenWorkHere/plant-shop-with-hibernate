package com.vanchuyen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Review")
public class Review {
	
	@Id
	@GeneratedValue(generator = "IDReviewGenerator")
	@GenericGenerator(name = "IDReviewGenerator", strategy = "com.vanchuyen.util.IDReviewGenerator")
	@Column(name = "ReviewID")
	private String reviewID;
	
	@Column(name = "NameUser")
	private String nameUser;
	
	@Column(name = "EmailUser")
	private String emailUser;
	
	@Column(name = "MainReivew")
	private String mainReview;
	
	@Column(name = "NumberStar")
	private int numberStar;
	
	@ManyToOne
	@JoinColumn(name = "productID")
	private Product product;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(String reviewID, String nameUser, String emailUser, String mainReview, Product product) {
		this.reviewID = reviewID;
		this.nameUser = nameUser;
		this.emailUser = emailUser;
		this.mainReview = mainReview;
		this.product = product;
	}

	public String getReviewID() {
		return reviewID;
	}

	public void setReviewID(String reviewID) {
		this.reviewID = reviewID;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}

	public String getMainReview() {
		return mainReview;
	}

	public void setMainReview(String mainReview) {
		this.mainReview = mainReview;
	}
	
	public int getNumberStar() {
		return numberStar;
	}

	public void setNumberStar(int numberStar) {
		this.numberStar = numberStar;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Review [reviewID=" + reviewID + ", nameUser=" + nameUser + ", emailUser=" + emailUser + ", mainReview="
				+ mainReview + ", numberStar=" + numberStar;
	}
	
}
