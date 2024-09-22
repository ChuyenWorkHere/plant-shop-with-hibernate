package com.vanchuyen.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanchuyen.dao.CategoryDAO;
import com.vanchuyen.dao.ProductDAO;
import com.vanchuyen.model.Category;
import com.vanchuyen.model.Product;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int minPrice = Integer.parseInt(request.getParameter("min"));
		int maxPrice = Integer.parseInt(request.getParameter("max"));
		String cate = request.getParameter("cate");
		
		ProductDAO pd = new ProductDAO();
		
		CategoryDAO cateDAO = new CategoryDAO();
		
		Category category = cateDAO.selectById(cate);
		HttpSession session = request.getSession(false);
		
		if(category != null) {
			//Get all the products from category
			List<Product> listProducts = pd.selectAllByCategory(category);
			
			//Find the product's price between min and max
			List<Product> filteredProduct = listProducts.stream()
														.filter(p -> p.getPriceAfterSale() >= minPrice && p.getPriceAfterSale() <= maxPrice)
														.collect(Collectors.toList());
			
			StringBuilder data = new StringBuilder();
			
			for(Product p: filteredProduct) {
				data.append("<div class=\"featured-sample-product\">");
				if(p.getProductSale() > 0) {
					data.append("<div class=\"sale-product\">Sale!</div>");
				} else {
					data.append("<div class=\"not-sale-product\">Sale!</div>");
				}
				data.append("<div class=\"add-to-cart-container\">\r\n" + 
						"							<div class=\"image-container\">\r\n" + 
						"								<a href=\"product-detail?id="+p.getProductID()+"\"> <img\r\n" + 
						"									src=\""+p.getProductImage()+"\" alt=\"\" class=\"image-product\">\r\n" + 
						"								</a>\r\n" + 
						"								<div class=\"add-to-cart\">");
				if(session.getAttribute("user") == null) {
					data.append("<a href=\"login\"> <i class=\"fa-solid fa-bag-shopping\"></i></a>");
				} else {
					data.append("<a class=\"add-to-cart\" href=\"add?pID="+p.getProductID()+"\"> <i\r\n" + 
							"											class=\"fa-solid fa-bag-shopping\"></i></a>");
				}
				data.append("<div>Add to cart</div>\r\n" + 
						"								</div>\r\n" + 
						"							</div>\r\n" + 
						"						</div>\r\n" + 
						"						<div class=\"detail-product\">\r\n" + 
						"							<p class=\"category-product\">"+p.getCategory().getCategoryName()+"</p>\r\n" + 
						"							<a href=\"product-detail?id="+p.getProductID()+"\"\r\n" + 
						"								style=\"text-decoration: none\">\r\n" + 
						"								<p class=\"name-product\">"+p.getProductName()+"</p>\r\n" + 
						"							</a>\r\n" + 
						"							<div class=\"star-rated-product\">\r\n" + 
						"								<img src=\"icons/star-regular.svg\" alt=\"\" class=\"star-rating\"><img\r\n" + 
						"									src=\"icons/star-regular.svg\" alt=\"\" class=\"star-rating\"><img\r\n" + 
						"									src=\"icons/star-regular.svg\" alt=\"\" class=\"star-rating\"><img\r\n" + 
						"									src=\"icons/star-regular.svg\" alt=\"\" class=\"star-rating\"><img\r\n" + 
						"									src=\"icons/star-regular.svg\" alt=\"\" class=\"star-rating\">\r\n" + 
						"							</div>\r\n" + 
						"							<p class=\"price-product\">");
				if(p.getProductSale() > 0) {
					data.append("<span class=\"before-sale\">$"+p.getProductPrice()+"</span>");
				}
				data.append("$" + p.getPriceAfterSale() + "</p>\r\n" + 
						"						</div>\r\n" + 
						"					</div>");
			}
			
			String products = data.toString();
			
	        PrintWriter out = response.getWriter();
	        out.print(products);
	        out.flush();
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
		int minPrice = 10;
		int maxPrice = 40;
		String cate = "CATE001";
		
		ProductDAO pd = new ProductDAO();
		
		CategoryDAO cateDAO = new CategoryDAO();
		
		Category category = cateDAO.selectById(cate);
		
		//Get all the products from category
		List<Product> listProducts = pd.selectAllByCategory(category);
		
		//Find the product's price between min and max
		List<Product> filteredProduct = listProducts.stream().filter(p -> p.getPriceAfterSale() >= minPrice && p.getPriceAfterSale() <= maxPrice).collect(Collectors.toList());
	
		for (Product p: filteredProduct) {
			System.out.println(p.getPriceAfterSale());
		}
	}
}
