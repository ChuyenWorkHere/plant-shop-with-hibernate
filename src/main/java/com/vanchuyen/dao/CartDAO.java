package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.embeddables.CartEmbeddable;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Product;
import com.vanchuyen.util.HibernateUtil;

public class CartDAO implements DAOInterface<Cart, CartEmbeddable> {

	Session session = null;
	Transaction transaction = null;
	Cart cart = null;
	List<Cart> carts = null;
	
	@Override
	public ArrayList<Cart> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cart selectById(CartEmbeddable id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			cart = (Cart) session.createQuery("FROM Cart u WHERE u.cartID = :cartID").setParameter("cartID", id)
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
		return cart;
	}

	@Override
	public int insert(Cart t) {
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
	public int insertAll(ArrayList<Cart> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Cart t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			String sql = "DELETE Cart u WHERE u.cartID = :cartID";
			Query query = session.createQuery(sql);
			
			query.setParameter("cartID", t.getCartID());
			
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
	public int deleteAll(ArrayList<Cart> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Cart t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "UPDATE Cart u SET u.quantity = :quantity WHERE u.cartID = :cartID";
			Query query = session.createQuery(hql);
			
			query.setParameter("cartID", t.getCartID());
			query.setParameter("quantity", t.getQuantity());
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
	
	public List<Cart> selectByIdUser(String id) {
		List<Cart> listCart = new ArrayList<Cart>();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "FROM Cart u WHERE u.cartID.userID = :userID";
			
			Query query = session.createQuery(hql);
			
			query.setParameter("userID", id);
			
			listCart = query.getResultList();
			
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
		return listCart;
	}
	
	public double getTotalByIdUser(String id) {
		
		double total = 0;
		
		ProductDAO pd = new ProductDAO();
		
		Product p = null;
		
		List<Cart> carts = selectByIdUser(id);
		
		if (carts != null) {
			for (Cart c : carts) {
				//System.out.println(c);
				String pID = c.getCartID().getProductID();
				
				p =  pd.selectById(pID);
				
				total += p.getPriceAfterSale() * c.getQuantity();
		
			}
		}
		
		return Math.round(total * 100.0) / 100.0;
	}
	
	public static void main(String[] args) {
		
		for(Cart c: new CartDAO().selectByIdUser("US002"))
			System.out.println(c);
	}
}
