package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vanchuyen.model.Product;
import com.vanchuyen.model.Review;
import com.vanchuyen.util.HibernateUtil;

public class ReviewDAO implements DAOInterface<Review, String> {

	
	Session session = null;
	Transaction transaction = null;
	Review review = null;
	List<Review> reviews = null;
	
	@Override
	public ArrayList<Review> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			reviews = session.createQuery("FROM Review").getResultList();
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return (ArrayList<Review>) reviews;
	}

	@Override
	public Review selectById(String id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			review = (Review) session.createQuery("FROM Review u WHERE u.reviewID = :reviewID").setParameter("reviewID", id)
						  .uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return review;
	}

	@Override
	public int insert(Review t) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			session.persist(t);
			
			transaction.commit();
			return 1;
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return 0;
	}

	@Override
	public int insertAll(ArrayList<Review> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Review t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<Review> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Review t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public Review getLatestReivew(Product p) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			reviews = session.createQuery("FROM Review u WHERE u.product = :product ORDER BY u.product").setParameter("product", p)
						  .getResultList();
			
			review = reviews.get(reviews.size()-1);
			transaction.commit();
			return review;
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return null;
	}
	public ArrayList<Review> selectAllById(Product p) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			reviews = session.createQuery("FROM Review u WHERE u.product = :product ORDER BY u.product").setParameter("product", p)
					  .getResultList();
			transaction.commit();
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return (ArrayList<Review>) reviews;
	}
	public static void main(String[] args) {
		String star = "";
		int num1 =4, num2 = 4;
		while(num1 > 0) {
			star += "<i class=\"active fa-solid fa-star\">";
			num1--;
		}
		
		while (5 - num2 > 0) {
			star += "<i class=\"fa-solid fa-star\">";
			num2++;
		}
		System.out.println(star);
	}
}
