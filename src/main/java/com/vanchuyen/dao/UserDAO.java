package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.model.Users;
import com.vanchuyen.util.HibernateUtil;

public class UserDAO implements DAOInterface<Users, String>  {
	
	Session session = null;
	Transaction transaction = null;
	Users user = null;
	List<Users> users = null;
	
	
	@Override
	public ArrayList<Users> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			users = session.createQuery("FROM Users").getResultList();
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
		return (ArrayList<Users>) users;
	}

	@Override
	public Users selectById(String id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			user = (Users) session.createQuery("FROM Users u WHERE u.userID = :userID").setParameter("userID", id)
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
		return user;
	}

	@Override
	public int insert(Users t) {
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
	public int insertAll(ArrayList<Users> arr) {
		
		return 0;
	}

	@Override
	public int delete(Users t) {
		
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<Users> arr) {
		
		return 0;
	}

	@Override
	public int update(Users t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "UPDATE Users u SET u.fName = :fName, u.lName = :lName, u.company = :company,"
					+ "u.country = :country, u.city = :city, u.address = :address, u.phone = :phone, u.email = :email WHERE u.userID = :userID";
			Query query = session.createQuery(hql);
			
			query.setParameter("fName", t.getfName());
			query.setParameter("lName", t.getlName());
			query.setParameter("company", t.getCompany());
			query.setParameter("country", t.getCountry());
			query.setParameter("city", t.getCity());
			query.setParameter("address", t.getAddress());
			query.setParameter("phone", t.getPhone());
			query.setParameter("email", t.getEmail());
			query.setParameter("userID", t.getUserID());
			
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
	
	public Users validateUser(String username, String password) {
		session = HibernateUtil.getSessionFactory().openSession();
		try {
			
			transaction = session.beginTransaction();
			
			user = (Users) session.createQuery("FROM Users u WHERE u.userName = :username").setParameter("username", username)
						  .uniqueResult();
			if(user != null && user.getPassword().equals(password) ) {
				return user;
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
		return null;
	}
	
}
