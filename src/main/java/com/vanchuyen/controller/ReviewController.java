package com.vanchuyen.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class ReviewController
 */
@WebServlet("/review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String review = request.getParameter("review");
		String pID = request.getParameter("pID");
		int numberStar = Integer.parseInt(request.getParameter("num"));		
		
		Review rv = new Review();
		rv.setNameUser(name);
		rv.setEmailUser(email);
		rv.setMainReview(review);
		rv.setNumberStar(numberStar);
		
		Product p = new ProductDAO().selectById(pID); 
		
		rv.setProduct(p);
		
		ReviewDAO rd = new ReviewDAO();
		
		System.out.println(rd.insert(rv));
		
		Review rdLatest = rd.getLatestReivew(p);
		
		PrintWriter out = response.getWriter();
		
		String star = "";
		
		int num1 = rdLatest.getNumberStar(), num2 = rdLatest.getNumberStar();
		while( num1 > 0) {
			star += "<i class=\"active fa-solid fa-star\"></i>";
			num1--;
		}
		while (5 - num2 > 0) {
			star += "<i class=\"fa-solid fa-star\"></i>";
			num2++;
		}
		
		System.out.println(rdLatest);
		
		System.out.println(star);
		
		out.print("<div class=\"user-comment\">\r\n" + 
				"					<div class=\"profile-container\">\r\n" + 
				"						<div class=\"el-user-name\">\r\n" + 
				"							<img src=\"images/teammate-1.png\" alt=\"\"> <span>"+rdLatest.getNameUser()+"</span>\r\n" + 
				"						</div>\r\n" + 
				"						<div class=\"number-star\">\r\n" + star+ "</div>\r\n" + 
				"					</div>\r\n" + 
				"					<p>"+rdLatest.getMainReview()+"</p>\r\n" + 
				"				</div>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
