package com.vanchuyen.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;

import com.vanchuyen.dao.UserDAO;
import com.vanchuyen.model.Users;

@WebServlet("/account")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccountController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login");
		} else {
			HttpSession ss = request.getSession();
			Users u = (Users) ss.getAttribute("user");
			request.setAttribute("u", u);
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fName = request.getParameter("first-name");
		String lName = request.getParameter("last-name");
		String company = request.getParameter("com-name");
		String country = request.getParameter("country");
		String address = request.getParameter("address");
		String town = request.getParameter("town");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		HttpSession session = request.getSession();
		Users u = (Users)session.getAttribute("user");
		System.out.println(u);
		if(u != null) {
			UserDAO userDao = new UserDAO();
			u.setfName(fName);
			u.setlName(lName);
			u.setCompany(company);
			u.setCountry(country);
			u.setAddress(address);
			u.setCity(town);
			u.setPhone(phone);
			u.setEmail(email);
			
			userDao.update(u);
			
			request.setAttribute("u", u);
			request.getRequestDispatcher("account.jsp").forward(request, response);
			
		} else {
			response.sendRedirect("login");
		}
		
	}

}
