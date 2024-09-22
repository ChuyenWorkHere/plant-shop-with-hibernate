package com.vanchuyen.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vanchuyen.embeddables.UserCouponEmbeddable;
import com.vanchuyen.enums.CouponStatus;
import com.vanchuyen.model.Coupon;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.UserCoupon;
import com.vanchuyen.model.Users;
import com.vanchuyen.util.HibernateUtil;

public class CouponDAO implements DAOInterface<Coupon, UserCouponEmbeddable>{
	
	Session session = null;
	Transaction transaction = null;
	Coupon coupon = null;
	List<Coupon> coupons = null;
	
	@Override
	public ArrayList<Coupon> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			coupons = session.createQuery("FROM Coupon").getResultList();
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
		return (ArrayList<Coupon>) coupons;
	}

	@Override
	public Coupon selectById(UserCouponEmbeddable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Coupon t) {
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
	public int insertAll(ArrayList<Coupon> arr) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			for(Coupon t: arr) {
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
	public int delete(Coupon t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<Coupon> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Coupon t) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Coupon> selectByCouponCode(String code) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			coupons = session.createQuery("FROM Coupon c WHERE c.couponCode = :code").setParameter("code", code).getResultList();
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
		return coupons;
	}
	
	public static void main(String[] args) {
		CouponDAO cd = new CouponDAO();
//		UserDAO ud = new UserDAO();
//		UserCouponDAO ucd = new UserCouponDAO();
//		List<Coupon> lc = cd.selectAll();
//		
//		List<Users> lu = ud.selectAll();		
//		for(Users u : lu) {
//			for(Coupon c : lc) {
//				UserCouponEmbeddable uce = new UserCouponEmbeddable(u.getUserID(), c.getCouponID());
//				System.out.println(ucd.insert(new UserCoupon(uce, CouponStatus.ACTIVE.getDescription())));
//			}
//		}
		
//		LocalDate dayStart = LocalDate.of(2024, 9, 18);
//		LocalDate dayExpired = LocalDate.of(2024, 9, 23);
		
		System.out.println(cd.selectByCouponCode("SALE2024"));
	}
	
}
