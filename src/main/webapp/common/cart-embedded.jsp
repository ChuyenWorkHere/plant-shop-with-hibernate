<%@page import="com.vanchuyen.model.Users"%>
<%@page import="com.vanchuyen.dao.UserDAO"%>
<%@page import="com.vanchuyen.dao.CartDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.vanchuyen.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.vanchuyen.model.Product"%>
<%@page import="com.vanchuyen.model.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/common/cart-embedded.css">
<body>
	<%
		Users user = (Users)session.getAttribute("user");
		
		if(user != null) {
			
			System.out.println(user.getUserID());
			
			CartDAO cartDao = new CartDAO();
			
			List<Cart> listCart = cartDao.selectByIdUser(user.getUserID());
			
			if(listCart != null) {
				
				Map<String, Integer> cartMap = new HashMap<>();
				
				ProductDAO pd = new ProductDAO();
				
				List<Product> listProduct = new ArrayList<>();
					
				for (Cart c : listCart) {
					//System.out.println(c);
					String pID = c.getCartID().getProductID();
					listProduct.add(pd.selectById(pID));
					cartMap.put(pID, c.getQuantity());
				}
				for(String s : cartMap.keySet()){
					System.out.println(s);
				}
				
				double total = cartDao.getTotalByIdUser(user.getUserID());
				request.setAttribute("listCart", listCart);
				request.setAttribute("cartMap", cartMap);
				request.setAttribute("pd", pd);
			}
			
		}
	%>
	<!--Cart -->
	<div class="wrapper"></div>
	<div class="shopping-container">
		<div class="shopping-cart">
			<h4>Shopping Cart</h4>
			<span id="hide-cart">&Cross;</span>
		</div>
 		<div id="cart-content" style="overflow: auto; flex: 1;">
			<c:if test="${sessionScope.user ne null and not empty listCart and listCart.size() > 0}">
				<c:forEach items="${cartMap.keySet()}" var="o">
					<div id="${o}" class="product-wrapper">
						<div class="plant-cart">
							<img src="${pd.selectById(o).getProductImage()}" alt="">
							<div class="info-cart-wrapper">
								<div>
									<a href="product-detail?id=${o}" class="name">${pd.selectById(o).getProductName()}</a>
									<p id="${o}" class="price">${cartMap.get(o)} &Cross; $${pd.selectById(o).getProductPrice() * (100 - pd.selectById(o).getProductSale()) / 100}</p>
								</div>	
								<a href="delete?pID=${o}" class="remove" >&Cross;</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<c:choose>
			<c:when test="${sessionScope.user ne null and listCart.size() == 0 }">
				<style>
					.no-product {
						display: block;
					}
				</style>
			</c:when>
			<c:otherwise>
				<style>
					.no-product {
						display: none;
					}
				</style>
			</c:otherwise>			
		</c:choose>
		<div class="no-product">
			<p>No products in the cart.</p>
		</div>
		<c:if test="${sessionScope.user eq null}">
			<div class="no-login">
				<p>You need to login to view cart.</p>
			</div>
		</c:if>
		<div class="navigate-button-cart">
				<div id="price" class = "price">
					<span>Subtotal:</span> <span class="price-total">$${total}</span>
				</div>
			<div class="btn">
					<a class="same-condition" href="cart.jsp">VIEW CART</a>
					<a class="same-condition" href="checkout">CHECKOUT</a>
				<c:if test="${sessionScope.user eq null}">
					<a href="login">LOGIN NOW</a>
				</c:if>
				<a id="continue" href="store">CONTINUE SHOPPING</a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.user ne null and listCart.size() > 0}">
					<style>
						#price {
							display: flex;
						}
						.same-condition {
							display: block;
						}
					</style>
				</c:when>
				<c:otherwise>
					<style>
						#price, .same-condition {
							display: none;
						}
					</style>
				</c:otherwise>			
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.user ne null && listCart.size() == 0 }">
					<style>
						
					</style>
				</c:when>
				<c:otherwise>
					<style>
						#continue {
							display: none;
						}
					</style>
				</c:otherwise>			
			</c:choose>
		</div>
	</div>
	<!--End Cart-->
</body>
</html>