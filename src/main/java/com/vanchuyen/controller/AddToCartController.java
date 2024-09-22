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
 * Servlet implementation class AddToCartController
 */
@WebServlet("/add")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		
		String pID = request.getParameter("pID");
		
		//For input sector in detail plant
		int num;
		if(request.getParameter("num") == null) {
			num = 1; 
		} else {
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		HttpSession ss = request.getSession(false);
		Users u = (Users) ss.getAttribute("user");
		
		if(ss != null && u != null) {
			
			String isOver = "false";
			
			String uID = u.getUserID();
			 
			CartEmbeddable ce = new CartEmbeddable(uID, pID);
			ProductDAO pd = new ProductDAO();
			CartDAO cd = new CartDAO();
			
			int currentQuantity;
			int availableQuantity = pd.selectById(pID).getProductQuantity();
			Cart c = new Cart();
			c.setCartID(ce);
			
			
			int exist;
			
			if(cd.selectById(ce) == null) {
				currentQuantity = 0;
				//Check quantity added is over available quantity
				if(currentQuantity + num > availableQuantity) {
					c.setQuantity(availableQuantity);
					isOver = "true";
				} else {
					c.setQuantity(num + currentQuantity);
				}
				cd.insert(c);
				exist = 0;
			} else {
				currentQuantity = cd.selectById(ce).getQuantity();
				//Check quantity added is over available quantity
				if(currentQuantity + num > availableQuantity) {
					c.setQuantity(availableQuantity);
					isOver = "true";
				} else {
					c.setQuantity(num + currentQuantity);
				}
				cd.update(c);
				exist = 1;
			} 
		
			double total = cd.getTotalByIdUser(uID);
			
			int numProduct = cd.selectByIdUser(uID).size();
			
			Product product = pd.selectById(pID);
			
			StringBuilder data = new StringBuilder();
			
	        data.append("{");
	        data.append("\"total\": ").append(total).append(",");
	        data.append("\"numProduct\": ").append(numProduct).append(",");
	        data.append("\"exist\": ").append(exist).append(",");
	        data.append("\"isOver\": ").append(isOver).append(",");
	        data.append("\"product\": {");
	        data.append("\"name\": \"").append(product.getProductName()).append("\",");
	        data.append("\"id\": \"").append(product.getProductID()).append("\",");
	        data.append("\"image\": \"").append(product.getProductImage()).append("\",");
	        data.append("\"price\": ").append(product.getProductPrice()).append(",");
	        data.append("\"quantity\": ").append(c.getQuantity()).append(",");
	        data.append("\"salePrice\": ").append(product.getPriceAfterSale());
	        data.append("}");
	        data.append("}");
			
	        String json = data.toString();
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
	     
		} else {
			response.sendRedirect("login");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static void main(String[] args) {
		
		double total = 100;
		
		int numProduct = 5;
		
		Product product = new ProductDAO().selectById("PD001");
		
		StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{");
        jsonBuilder.append("\"total\": ").append(total).append(",");
        jsonBuilder.append("\"numProduct\": ").append(numProduct).append(",");
        jsonBuilder.append("\"product\": {");
        jsonBuilder.append("\"name\": \"").append(product.getProductName()).append("\",");
        jsonBuilder.append("\"image\": \"").append(product.getProductImage()).append("\",");
        jsonBuilder.append("\"price\": ").append(product.getProductPrice()).append(",");
        jsonBuilder.append("\"sale\": ").append(product.getProductSale());
        jsonBuilder.append("}");
        jsonBuilder.append("}");
      
        System.out.println(jsonBuilder);
	}
}
