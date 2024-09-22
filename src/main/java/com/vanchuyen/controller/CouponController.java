package com.vanchuyen.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanchuyen.dao.CouponDAO;
import com.vanchuyen.dao.UserCouponDAO;
import com.vanchuyen.embeddables.UserCouponEmbeddable;
import com.vanchuyen.enums.CouponStatus;
import com.vanchuyen.model.Coupon;
import com.vanchuyen.model.UserCoupon;
import com.vanchuyen.model.Users;

/**
 * Servlet implementation class CouponController
 */
@WebServlet("/apply-coupon")
public class CouponController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CouponController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String coupon = request.getParameter("coupon");
		
		System.out.println("COUPON:" + coupon);
		
		HttpSession session = request.getSession(false);
		CouponDAO cd = new CouponDAO();
		UserCouponDAO ucd = new UserCouponDAO();
		
		Users u = (Users)session.getAttribute("user");
		if(u == null) {
			response.sendRedirect("login");
			return;
		}
		if(coupon != null ) {
			
		}
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
