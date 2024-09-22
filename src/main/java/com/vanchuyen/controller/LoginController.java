package com.vanchuyen.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanchuyen.dao.CartDAO;
import com.vanchuyen.dao.UserDAO;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Users;


public class LoginController extends HttpServlet {
	
	
	public LoginController() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("user") != null) {
			response.sendRedirect("account");
		} else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
			authenticate(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void authenticate (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String uname = request.getParameter("username");
		String password =request.getParameter("password");
		
		UserDAO userDao = new UserDAO();
		CartDAO cartDao = new CartDAO();
		
		Users user = userDao.validateUser(uname, password);
		
		
		if(user != null) {
			
//			Cookie cUserName = new Cookie("username", uname);
//			Cookie cPassword = new Cookie("password", password);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
//			session.setAttribute("carts", carts);
//			session.setAttribute("total", cartDao.getTotalById(user.getUserID()));
//			session.setAttribute("numProduct", cartDao.selectByIdUser(user.getUserID()).size());
//			cUserName.setMaxAge(10 * 60);
//			cPassword.setMaxAge(10 * 60);
//			response.addCookie(cUserName);
//			response.addCookie(cPassword);
			response.sendRedirect("account");
//			System.out.println(uname);
//			System.out.println(password);
		} else {
			response.sendRedirect("login");
		}
	}
	public static void main(String[] args) {
	}
}
