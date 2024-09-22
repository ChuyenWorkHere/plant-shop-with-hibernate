package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.model.Orders;
import com.vanchuyen.util.HibernateUtil;

public class OrderDAO implements DAOInterface<Orders, String> {

	Session session = null;
	Transaction transaction = null;
	Orders order = null;
	List<Orders> listOrders = null;
	private String prefix = "ORD";

	@Override
	public ArrayList<Orders> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			listOrders = session.createQuery("FROM Orders").getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return (ArrayList<Orders>) listOrders;
	}

	@Override
	public Orders selectById(String id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();

			order = (Orders) session.createQuery("FROM Orders u WHERE u.orderID = :orderID").setParameter("orderID", id)
					.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return order;
	}

	@Override
	public int insert(Orders t) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();

			session.persist(t);

			transaction.commit();
			return 1;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return 0;
	}

	@Override
	public int insertAll(ArrayList<Orders> arr) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();

			for (Orders t : arr) {
				session.persist(t);
			}
			transaction.commit();
			return 1;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return 0;
	}

	@Override
	public int delete(Orders t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();

			String sql = "DELETE Orders u WHERE u.orderID = :orderID";
			Query query = session.createQuery(sql);

			query.setParameter("orderID", t.getOrderID());

			result = query.executeUpdate();

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}

	@Override
	public int deleteAll(ArrayList<Orders> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Orders t) {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getOrderID() {
		int maxID = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String query = "select c.orderID from Orders c";
			maxID = session.createQuery(query, String.class).stream().map(id -> id.replace(prefix, ""))
					.mapToInt(Integer::parseInt).max().orElse(0);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return prefix + (String.format("%03d", maxID + 1));
	}

}
