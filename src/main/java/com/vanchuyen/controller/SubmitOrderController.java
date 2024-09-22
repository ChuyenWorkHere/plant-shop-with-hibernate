package com.vanchuyen.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanchuyen.dao.CartDAO;
import com.vanchuyen.dao.OrderDAO;
import com.vanchuyen.dao.OrderDetailDAO;
import com.vanchuyen.dao.ProductDAO;
import com.vanchuyen.embeddables.OrdersDetailEmbeddable;
import com.vanchuyen.enums.OrderStatus;
import com.vanchuyen.model.Cart;
import com.vanchuyen.model.Orders;
import com.vanchuyen.model.OrdersDetails;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Users;

/**
 * Servlet implementation class SubmitOrderController
 */
@WebServlet("/checkout-submit")
public class SubmitOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fName = request.getParameter("first-name");
		String lName = request.getParameter("last-name");
		String company = request.getParameter("com-name");
		String country = request.getParameter("country");
		String address = request.getParameter("address") + request.getParameter("optional-address");
		String city = request.getParameter("town");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String note = request.getParameter("note");
		
		//Get user
		HttpSession session = request.getSession(false);
		Users user = (Users)session.getAttribute("user");
		CartDAO cd = new CartDAO();
		ProductDAO pd = new ProductDAO();
		OrderDAO od = new OrderDAO();
		OrderDetailDAO odd = new OrderDetailDAO();
		
		if(user != null) {
			
			//Create list products to check out
			Set<Product> setProducts = new HashSet<Product>();
			
			//Add products in cart into Set
			List<Cart> carts = cd.selectByIdUser(user.getUserID());
			carts.forEach(c -> {
				Product p = pd.selectById(c.getCartID().getProductID());
				setProducts.add(p);
			});
			
			Orders newOrder = new Orders(fName, lName, company, country, city, address, phone, email, note, OrderStatus.WAIT.getDescription(), user, setProducts);
			
			//Insert into database
			String nextID = od.getOrderID();
			od.insert(newOrder);
			
			carts.forEach(c -> {
				OrdersDetails oDetail = new OrdersDetails();
				OrdersDetailEmbeddable ode = new OrdersDetailEmbeddable(nextID, c.getCartID().getProductID());
				oDetail.setOrderDetailID(ode);
				oDetail.setQuantity(c.getQuantity());
				odd.update(oDetail);
			});
			
			//Delete old products in cart
			carts.forEach(c -> {
				cd.delete(c);
			});
			
			response.sendRedirect("home");
			
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

}
