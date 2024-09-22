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
import com.vanchuyen.embeddables.CartEmbeddable;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Users;

/**
 * Servlet implementation class UpdateCartController
 */
@WebServlet("/update-cart")
public class UpdateCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] productIDs = request.getParameterValues("productID");
		String[] quantities = request.getParameterValues("quantity");
		
		
		HttpSession session = request.getSession(false);
		CartDAO cd = new CartDAO();
		ProductDAO pd = new ProductDAO();
		
		Users u = (Users) session.getAttribute("user");
		
		Boolean isOver = false;
		if(u == null) {
			response.sendRedirect("login");
			return;
		} else if ( (productIDs == null || quantities == null) && u != null) {
			response.sendRedirect("cart");
		}
		else if(u != null && productIDs != null && quantities != null) {
			String uID = u.getUserID();
					
			//Update quantity of products
			for(int i = 0; i < productIDs.length; i++) {
				String pID = productIDs[i];
				int quantity = Integer.parseInt(quantities[i]);
				CartEmbeddable ce = new CartEmbeddable(uID, pID);				
				
				Cart c = cd.selectById(ce);
				
				if(c == null) {
					response.sendRedirect("cart");
					return;
				}
				
				//Get the available quantity
				Product product = pd.selectById(pID);
				int availableQuantity = product.getProductQuantity();
				
				//If quantity in cart > available quantity 
				if(quantity > availableQuantity) {
					quantity = availableQuantity;
					isOver = true;
				}
				
				//	If the quantity down to 0, delete it from the cart
				if(quantity == 0) {
					cd.delete(c);
				} else {
					c.setQuantity(quantity);
					cd.update(c);
				}
				
			}
			
			//Data send to Cart
			List<Cart> carts = cd.selectByIdUser(uID);
			Map<Product, Integer> mapData = new HashMap<Product, Integer>();
			for(Cart c: carts) {
				Product p = pd.selectById(c.getCartID().getProductID());
				int quantity = c.getQuantity();
				mapData.put(p, quantity);
			}
			double total = cd.getTotalByIdUser(u.getUserID());
			request.setAttribute("MAPCART", mapData);
			request.setAttribute("TOTAL", total);
			request.setAttribute("isSuccess", true);
			request.setAttribute("isOver", isOver);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
