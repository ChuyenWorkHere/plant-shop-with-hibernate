package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.embeddables.OrdersDetailEmbeddable;
import com.vanchuyen.model.OrdersDetails;
import com.vanchuyen.util.HibernateUtil;

public class OrderDetailDAO implements DAOInterface<OrdersDetails, OrdersDetailEmbeddable> {
	
	Session session = null;
	Transaction transaction = null;
	OrdersDetails ordersDetail = null;
	List<OrdersDetails> details = null;
	
	@Override
	public ArrayList<OrdersDetails> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrdersDetails selectById(OrdersDetailEmbeddable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(OrdersDetails t) {
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
	public int insertAll(ArrayList<OrdersDetails> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(OrdersDetails t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<OrdersDetails> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(OrdersDetails t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "UPDATE OrdersDetails u SET u.quantity = :quantity WHERE u.orderDetailID = :orderDetailID";
			Query query = session.createQuery(hql);
			
			query.setParameter("orderDetailID", t.getOrderDetailID());
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
		
}
