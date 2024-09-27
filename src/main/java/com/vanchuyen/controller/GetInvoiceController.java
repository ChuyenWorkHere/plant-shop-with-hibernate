package com.vanchuyen.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanchuyen.dao.OrderDAO;
import com.vanchuyen.dao.OrderDetailDAO;
import com.vanchuyen.dao.ProductDAO;
import com.vanchuyen.model.Orders;
import com.vanchuyen.model.OrdersDetails;
import com.vanchuyen.model.Product;
import com.vanchuyen.model.Users;

/**
 * Servlet implementation class GetInvoiceController
 */
@WebServlet("/get-invoice")
public class GetInvoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetInvoiceController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		HttpSession session = request.getSession(false);
		Users u = (Users) session.getAttribute("user");
		OrderDAO od = new OrderDAO();
		OrderDetailDAO odd = new OrderDetailDAO();
		ProductDAO pd = new ProductDAO();

		if (id != null) {

			Orders order = od.selectById(id);

			// Verify user
			String uID = order.getUser().getUserID();
			if (!uID.equals(u.getUserID())) {
				response.sendRedirect("login");
				return;
			}

			List<OrdersDetails> listDetails = odd.selectAllByOrderId(order);
			double total = odd.getTotalByOrderId(order.getOrderID());

			StringBuilder builder = new StringBuilder();

			builder.append("{ \"order\": {").append("\"orderID\": \"").append(order.getOrderID()).append("\", ")
					.append("\"fName\": \"").append(order.getfName()).append("\", ").append("\"lName\": \"")
					.append(order.getlName()).append("\", ").append("\"orderDate\": \"").append(order.getOrderDate())
					.append("\", ").append("\"country\": \"").append(order.getCountry()).append("\", ")
					.append("\"city\": \"").append(order.getCity()).append("\", ").append("\"address\": \"")
					.append(order.getAddress()).append("\"}, ").append(" \"product\" : [");
			for (int i = 0; i < listDetails.size(); i++) {
				if (i != listDetails.size() - 1) {
					String pId = listDetails.get(i).getOrderDetailID().getProductID();
					Product p = pd.selectById(pId);
					builder.append("{").append("\"pID\": \"").append(p.getProductID()).append("\", ")
							.append("\"pName\": \"").append(p.getProductName()).append("\", ").append("\"pQuantity\": ")
							.append(listDetails.get(i).getQuantity()).append(", ").append("\"pPrice\": ")
							.append(p.getPriceAfterSale()).append("}, ");
				} else {
					String pId = listDetails.get(i).getOrderDetailID().getProductID();
					Product p = pd.selectById(pId);
					builder.append("{").append("\"pID\": \"").append(p.getProductID()).append("\", ")
							.append("\"pName\": \"").append(p.getProductName()).append("\", ").append("\"pQuantity\": ")
							.append(listDetails.get(i).getQuantity()).append(", ").append("\"pPrice\": ")
							.append(p.getPriceAfterSale()).append("} ");
				}
			}
			builder.append("],").append("\"total\" :" + total + "}");

			String json = builder.toString();

			PrintWriter out = response.getWriter();
			System.out.println(json);
			out.print(json);
			out.flush();
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

	public static void main(String[] args) {
		OrderDAO od = new OrderDAO();
		OrderDetailDAO odd = new OrderDetailDAO();
		ProductDAO pd = new ProductDAO();

		Orders order = od.selectById("ORD003");
		List<OrdersDetails> listDetails = odd.selectAllByOrderId(order);
		
		StringBuilder builder = new StringBuilder();

		builder.append("{ \"order\": {").append("\"orderID\": \"").append(order.getOrderID()).append("\", ")
				.append("\"fName\": \"").append(order.getfName()).append("\", ").append("\"lName\": \"")
				.append(order.getlName()).append("\", ").append("\"orderDate\": \"").append(order.getOrderDate())
				.append("\", ").append("\"country\": \"").append(order.getCountry()).append("\", ")
				.append("\"city\": \"").append(order.getCity()).append("\", ").append("\"address\": \"")
				.append(order.getAddress()).append("\"}, ").append(" \"product\" : [");
		for (int i = 0; i < listDetails.size(); i++) {
			if (i != listDetails.size() - 1) {
				String pId = listDetails.get(i).getOrderDetailID().getProductID();
				Product p = pd.selectById(pId);
				builder.append("{").append("\"pID\": \"").append(p.getProductID()).append("\", ")
						.append("\"pName\": \"").append(p.getProductName()).append("\", ").append("\"pQuantity\": ")
						.append(listDetails.get(i).getQuantity()).append(", ").append("\"pPrice\": ")
						.append(p.getPriceAfterSale()).append("}, ");
			} else {
				String pId = listDetails.get(i).getOrderDetailID().getProductID();
				Product p = pd.selectById(pId);
				builder.append("{").append("\"pID\": \"").append(p.getProductID()).append("\", ")
						.append("\"pName\": \"").append(p.getProductName()).append("\", ").append("\"pQuantity\": ")
						.append(listDetails.get(i).getQuantity()).append(", ").append("\"pPrice\": ")
						.append(p.getPriceAfterSale()).append("} ");
			}
		}
		double total = odd.getTotalByOrderId(order.getOrderID());
		builder.append("],").append("\"total\" :" + total + "}");
		System.out.println(builder.toString());
	}
}
