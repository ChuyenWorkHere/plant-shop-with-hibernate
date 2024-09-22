package com.vanchuyen.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class DeleteCartController
 */
@WebServlet("/delete")
public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		
		String pID = request.getParameter("pID");
		
		HttpSession session = request.getSession(false);
		
		Users user = (Users)session.getAttribute("user");
		
		if(user != null && pID != null) {
			CartDAO cd = new CartDAO();
			
			CartEmbeddable cartID = new CartEmbeddable(user.getUserID(), pID);
			
			Cart c = new Cart();
			c.setCartID(cartID);
			
			//Get amount kind of product after delete cart
			int numProduct = cd.selectByIdUser(user.getUserID()).size();
			
			int result = cd.delete(c);
			
			if(result != 0) {
				
				Product p = new ProductDAO().selectById(pID);
				
				//Get total money after delete cart
				double total = cd.getTotalByIdUser(user.getUserID());
				
				StringBuilder data = new StringBuilder();
				
		        data.append("{");
		        data.append("\"result\": \"").append("success").append("\",");
		        data.append("\"total\": ").append(total).append(",");
		        data.append("\"id\": \"").append(pID).append("\",");
		        data.append("\"name\": \"").append(p.getProductName()).append("\",");
		        data.append("\"num\": ").append(numProduct);
		        data.append("}");
		         
		        String json = data.toString();
 
		        PrintWriter out = response.getWriter();
		        out.print(json);
		        out.flush();
			}
			
		} else {
			response.sendRedirect("login");
		}
		
		
		System.out.println(pID);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
