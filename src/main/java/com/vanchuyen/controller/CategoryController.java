package com.vanchuyen.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vanchuyen.dao.CategoryDAO;
import com.vanchuyen.dao.ProductDAO;
import com.vanchuyen.model.Category;
import com.vanchuyen.model.Product;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/cate")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		
	    Boolean ok = false;
	    
		String categoryID = request.getParameter("cID");
		
		ProductDAO pd = new ProductDAO();
		
		List<Product> products = new ArrayList<Product>();
		
		CategoryDAO cateDAO = new CategoryDAO();
		
		Category cate = cateDAO.selectById(categoryID);
		
		if(cate != null) {
			
			products = pd.selectAllByCategory(cate);
			
			request.setAttribute("PRODUCTS", products);
			
			request.setAttribute("CATEGORY", cate);
			
			ok = true;
			
		}
		request.setAttribute("ok", ok);
		
		request.getRequestDispatcher("category.jsp").forward(request, response);
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
