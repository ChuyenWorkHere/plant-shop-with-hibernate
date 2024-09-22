package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.sound.midi.Soundbank;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.model.Category;
import com.vanchuyen.model.Product;
import com.vanchuyen.util.HibernateUtil;

public class ProductDAO implements DAOInterface<Product, String> {
	
	Session session = null;
	Transaction transaction = null;
	Product product = null;
	List<Product> products = null;
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public ArrayList<Product> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			products = session.createQuery("FROM Product").getResultList();
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
		return (ArrayList<Product>) products;
	}

	@Override
	public Product selectById(String id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			product = (Product) session.createQuery("FROM Product u WHERE u.productID = :productID").setParameter("productID", id)
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
		return product;
	}

	public ArrayList<Product> selectAllByCategory(Category cate) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			Query<Product> query = session.createQuery("FROM Product p WHERE p.category = :cate");
			
			query.setParameter("cate", cate);
			
			products = query.getResultList();
			
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
		return (ArrayList<Product>) products;
	}
	
	@Override
	public int insert(Product t) {
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
	public int insertAll(ArrayList<Product> arr) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			for(Product t: arr) {
				session.persist(t);
			}
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
	public int delete(Product t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			String sql = "DELETE Product u WHERE u.productID = :productID";
			Query query = session.createQuery(sql);
			
			query.setParameter("productID", t.getProductID());
			
			result = query.executeUpdate();
			
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
		return result;
	}

	@Override
	public int deleteAll(ArrayList<Product> arr) {
		int result = 0;
		
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			String sql = "DELETE Product u WHERE u.productID = :productID";
			Query query = session.createQuery(sql);
			
			for(Product t : arr) {
				query.setParameter("productID", t.getProductID());
				
				result = query.executeUpdate();
			}
			
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
		return result;
	}

	@Override
	public int update(Product t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "UPDATE Product u SET u.productName = :productName, u.productPrice = :productPrice, u.productImage = :productImage,"
					+ "u.productQuantity = :productQuantity, u.productStarRating = :productStarRating, u.productSale = :productSale,"
					+ " u.productDescription = :productDescription, u.category = :category WHERE u.productID = :productID";
			Query query = session.createQuery(hql);
			
			query.setParameter("productDescription", t.getProductDescription());
			query.setParameter("productImage", t.getProductImage());
			query.setParameter("productName", t.getProductName());
			query.setParameter("productPrice", t.getProductPrice());
			query.setParameter("productQuantity", t.getProductQuantity());
			query.setParameter("productSale", t.getProductSale());
			query.setParameter("productStarRating", t.getProductStarRating());
			query.setParameter("category", t.getCategory());
			query.setParameter("productID", t.getProductID());
			
			
			result = query.executeUpdate();
			
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
		return result;
	}
		
	public static void main(String[] args) {
		ProductDAO pd = new ProductDAO();
			
		List<Product> prods = pd.selectAll();
		
		for(Product p : prods) {
			System.out.println(p.getPriceAfterSale());
		}
		
	}
}
