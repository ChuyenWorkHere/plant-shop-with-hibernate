package com.vanchuyen.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.vanchuyen.model.Users;
import com.vanchuyen.model.UserCoupon;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Category;
import com.vanchuyen.model.Coupon;
import com.vanchuyen.model.Orders;
import com.vanchuyen.model.OrdersDetails;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Review;


public class HibernateUtil {
	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		
		if( sessionFactory == null) {
			Configuration con = new Configuration().configure("hibernate.cfg.xml")
								.addAnnotatedClass(Users.class)
								.addAnnotatedClass(Coupon.class)
								.addAnnotatedClass(UserCoupon.class)
								.addAnnotatedClass(Product.class)
								.addAnnotatedClass(Category.class)
								.addAnnotatedClass(Cart.class)
								.addAnnotatedClass(Review.class)
								.addAnnotatedClass(Orders.class)
								.addAnnotatedClass(OrdersDetails.class);
	        
	        StandardServiceRegistry reg = new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
	        
	        sessionFactory = con.buildSessionFactory(reg);
		}
		
		return sessionFactory;
	}
}
