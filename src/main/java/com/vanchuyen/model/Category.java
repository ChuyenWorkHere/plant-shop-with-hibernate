package com.vanchuyen.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "Category")
public class Category {
	
	@Id
	@GeneratedValue(generator = "IDCategoryGenerator")
	@GenericGenerator(name = "IDCategoryGenerator", strategy = "com.vanchuyen.util.IDCategoryGenerator")
	private String categoryID;
	
	@Column(name = "CategoryName")
	private String categoryName;
	
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(String categoryID, String categoryName) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}

	public String getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryName=" + categoryName + "]";
	}
	
	
	
}
