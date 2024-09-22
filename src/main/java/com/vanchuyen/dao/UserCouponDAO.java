package com.vanchuyen.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vanchuyen.embeddables.UserCouponEmbeddable;
import com.vanchuyen.enums.CouponStatus;
import com.vanchuyen.model.Coupon;
import com.vanchuyen.model.UserCoupon;
import com.vanchuyen.model.Users;
import com.vanchuyen.util.HibernateUtil;

public class UserCouponDAO implements DAOInterface<UserCoupon, UserCouponEmbeddable>{
	
	Session session = null;
	Transaction transaction = null;
	UserCoupon userCoupon = null;
	List<UserCoupon> userCoupons = null;
	
	@Override
	public ArrayList<UserCoupon> selectAll() {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			userCoupons = session.createQuery("FROM UserCoupon").getResultList();
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
		return (ArrayList<UserCoupon>) userCoupons;
	}
	public ArrayList<UserCoupon> selectAllByCouponID(String couponID) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			userCoupons = session.createQuery("FROM UserCoupon uc WHERE uc.userCouponID.couponID = :couponID")
								 .setParameter("couponID", couponID)
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
		return (ArrayList<UserCoupon>) userCoupons;
	}

	@Override
	public UserCoupon selectById(UserCouponEmbeddable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(UserCoupon t) {
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
	public int insertAll(ArrayList<UserCoupon> arr) {
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			
			for(UserCoupon t: arr) {
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
	public int delete(UserCoupon t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<UserCoupon> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(UserCoupon t) {
		int result = 0;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			String hql = "UPDATE UserCoupon u SET u.status = :status WHERE u.userCouponID = :userCouponID";
			Query query = session.createQuery(hql);
			
			query.setParameter("userCouponID", t.getUserCouponID());
			query.setParameter("status", t.getStatus());
			
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
	public String validateCoupon (Coupon coupon, Users u) {
		String status = null;
		
		//Find the current status of coupon
		UserCouponEmbeddable ucID = new UserCouponEmbeddable(u.getUserID(), coupon.getCouponID());
		UserCouponDAO ucd = new UserCouponDAO();
		
		//Update expiration before validating
		ucd.updateCouponExpiration(coupon);
		
		//Get user coupon 	
		UserCoupon uc = ucd.selectById(ucID);
		
		//Get date to check exprired
		LocalDate currentDate = LocalDate.now();
		LocalDate dayExpired = coupon.getDayExpired();
		LocalDate dayStart = coupon.getDayStart();
		
		//Check if it's used
		if(uc.getStatus().equals(CouponStatus.USED.getDescription())) {
			status = CouponStatus.USED.getDescription();
			return status;
		}
		//Check if it's expired
		if(dayExpired.isBefore(currentDate)) {
			status = CouponStatus.EXPIRED.getDescription();
		}
		//Check if it's active
		if(currentDate.isAfter(dayStart) && currentDate.isBefore(dayExpired)) {
			status = CouponStatus.ACTIVE.getDescription();
		}
		return status;
	}
	public void updateCouponExpiration(Coupon coupon) {
		
		//Get date to check exprired
		LocalDate currentDate = LocalDate.now();
		LocalDate dayExpired = coupon.getDayExpired();
		LocalDate dayStart = coupon.getDayStart();
		
		//Check if it's expired
		if(dayExpired.isBefore(currentDate)) {
			//Get list user_coupon
			UserCouponDAO ucd = new UserCouponDAO();
			List<UserCoupon> listUC = ucd.selectAllByCouponID(coupon.getCouponID());
			
			//Update to EXPIRED
			listUC.forEach(uc -> {
				uc.setStatus(CouponStatus.EXPIRED.getDescription());
				ucd.update(uc);
			});
			
		}
	}
	
	public static void main(String[] args) {
		UserCouponDAO ucd = new UserCouponDAO();
		String uID = "US001";
		String couponID = "CO001";
		UserCouponEmbeddable userCouponID = new UserCouponEmbeddable(uID, couponID);
		UserCoupon uc = new UserCoupon(userCouponID, CouponStatus.USED.getDescription());
		System.out.println(ucd.update(uc));
	}
}
