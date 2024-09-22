package com.vanchuyen.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vanchuyen.dao.ProductDAO;
import com.vanchuyen.dao.ReviewDAO;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Review;

/**
 * Servlet implementation class DetailController
 */
@WebServlet("/product-detail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID = request.getParameter("id");
		
		ProductDAO pd = new ProductDAO();
		
		Product p = pd.selectById(productID);
		
		List<Review> reviews = new ReviewDAO().selectAllById(p);
		
		request.setAttribute("PRODUCT", p);
		request.setAttribute("REVIEWS", reviews);
		
		request.getRequestDispatcher("detail_plants.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
