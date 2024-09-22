package com.vanchuyen.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanchuyen.dao.CartDAO;
import com.vanchuyen.dao.ProductDAO;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Users;

/**
 * Servlet implementation class CheckoutController
 */
@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckoutController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);

		request.setAttribute("ok", true);

		if (session.getAttribute("user") != null) {
			Users u = (Users) session.getAttribute("user");
			CartDAO cd = new CartDAO();
			ProductDAO pd = new ProductDAO();
			List<Cart> carts = cd.selectByIdUser(u.getUserID());
			Map<Product, Integer> mapData = new HashMap<Product, Integer>();
			for (Cart c : carts) {
				Product p = pd.selectById(c.getCartID().getProductID());
				int quantity = c.getQuantity();
				mapData.put(p, quantity);
			}
			double total = cd.getTotalByIdUser(u.getUserID());
			request.setAttribute("MAPCART", mapData);
			request.setAttribute("TOTAL", total);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		} else {
			response.sendRedirect("login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
