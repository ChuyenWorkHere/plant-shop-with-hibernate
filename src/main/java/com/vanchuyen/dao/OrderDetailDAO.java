package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.embeddables.OrdersDetailEmbeddable;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Orders;
import com.vanchuyen.model.OrdersDetails;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Users;
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
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			ordersDetail = (OrdersDetails) session.createQuery("FROM OrdersDetails u WHERE u.orderDetailID = :id").setParameter("id", id)
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
		return ordersDetail;
	}
	
	public List<OrdersDetails> selectAllByOrderId(Orders o) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			details = (List<OrdersDetails>) session.createQuery("FROM OrdersDetails u WHERE u.orderDetailID.orderID = :id").setParameter("id", o.getOrderID())
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
		return details;
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
	
	public double getTotalByOrderId(String id) {
			
			double total = 0;
			
			OrderDAO od = new OrderDAO();
			Orders order = od.selectById(id);
			ProductDAO pd = new ProductDAO();
			
			List<OrdersDetails> listDetail = selectAllByOrderId(order);
			
			Product p = null;
			
			if (listDetail != null) {
				for (OrdersDetails o : listDetail) {
					//System.out.println(c);
					String pID = o.getOrderDetailID().getProductID();
					
					p =  pd.selectById(pID);
					
					total += p.getPriceAfterSale() * o.getQuantity();
			
				}
			}
			
			return Math.round(total * 100.0) / 100.0;
	}
}
