package com.vanchuyen.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vanchuyen.model.Category;
import com.vanchuyen.model.Product;
import com.vanchuyen.util.HibernateUtil;

public class CategoryDAO implements DAOInterface<Category, String> {
	
	Session session = null;
	Transaction transaction = null;
	Category cate = null;
	List<Category> cates = null;
	
	public CategoryDAO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public ArrayList<Category> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			cates = session.createQuery("FROM Category").getResultList();
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
		return (ArrayList<Category>) cates;
	}

	@Override
	public Category selectById(String id) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			cate = (Category) session.createQuery("FROM Category u WHERE u.categoryID = :categoryID").setParameter("categoryID", id)
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
		return cate;
	}

	@Override
	public int insert(Category t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAll(ArrayList<Category> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Category t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<Category> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Category t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
