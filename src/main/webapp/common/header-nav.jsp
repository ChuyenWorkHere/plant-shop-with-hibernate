<%@page import="com.vanchuyen.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.vanchuyen.dao.CategoryDAO"%>
<%@page import="com.vanchuyen.model.Users"%>
<%@page import="com.vanchuyen.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles/common/header-nav.css">
</head>
<body>
	<%!
		double total;
		int numProduct;
	%>
	<%
		Users u = (Users)session.getAttribute("user");
		if(u != null) {
			String uID = u.getUserID();
			CartDAO cd = new CartDAO();
			total = cd.getTotalByIdUser(uID);
			numProduct = cd.selectByIdUser(uID).size();
			
			
			request.setAttribute("total", total);
			request.setAttribute("num", numProduct);
			
		}
		CategoryDAO cateDAO = new CategoryDAO();
		List<Category> allCate = cateDAO.selectAll();
		request.setAttribute("allCate", allCate);
	%>
	<!--Start header navigate bar-->
	<div class="navigate-bar">
		<div class="container-lg-name-page">
			<img src="images/plants-store-logo-green.svg" alt=""
				class="logo-page">
			<div class="name-page">Simply Natural</div>
		</div>
		<div class="menu-navigate-link">
			<div class="menu-navigate">
				<div class="menu-cart-link">
					<button id="cart-1">
						<c:if test="${sessionScope.user ne null}">
							<p class="total-money">$${total}</p>
						</c:if>
						<c:if test="${sessionScope.user eq null}">
							<p class="total-money">$0.00</p>
						</c:if>
						<div class="cart-container">
							<img class="header-icon" src="icons/bag-shopping-solid.svg"
								alt="">
							<c:if test="${sessionScope.user ne null}">
								<div class="number-prod">${num}</div>
							</c:if>
							<c:if test="${sessionScope.user eq null}">
								<div class="number-prod">0</div>
							</c:if>

						</div>
					</button>
				</div>
				<button id="show-menu">
					<i id="show-x" class="fas fa-bars" style="color: #fc5f5f;"></i>
				</button>
			</div>
		</div>
		<div id="menu" class="navigate-link-part">
			<div class="navigate-link home-link">
				<a href="index.jsp">Home</a>
			</div>
			<div class="navigate-link store-link">
				<a href="store.jsp">Store <img
					style="width: 10px; margin-left: 5px;"
					src="icons/chevron-down-solid.svg" alt="">
				</a> <span id="show-category"> <i
					class="fa-solid fa-chevron-down"
					style="font-size: 0.6em; color: #2b2f38; margin-right: 5px;"></i>
				</span>
				<div class="option-container">
					<c:forEach items="${allCate}" var="o">
						<a href="cate?cID=${o.categoryID}">
							<div class="plants-link">${o.categoryName}</div>
						</a>
					</c:forEach>
				</div>
			</div>
			<div id="menu-category" class="menu-option-container">
				<c:forEach items="${allCate}" var="o">
					<a href="cate?cID=${o.categoryID}">
						<div class="plants-link">
							<i class="fa-solid fa-chevron-right"
								style="font-size: 0.6em; color: #2b2f38; margin-right: 5px;"></i>
							${o.categoryName}
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="navigate-link about-us-link">
				<a href="about.jsp">About Us</a>
			</div>
			<div class="navigate-link contact-us-link">
				<a href="contact.jsp">Contact Us</a>
			</div>
			<div class="navigate-link cart-link">
				<button id="cart-2">
					<c:if test="${sessionScope.user ne null}">
						<p class="total-money">$${total}</p>
					</c:if>
					<c:if test="${sessionScope.user eq null}">
						<p class="total-money">$0.00</p>
					</c:if>
					<div class="cart-container">
						<img class="header-icon" src="icons/bag-shopping-solid.svg" alt="">
						<c:if test="${sessionScope.user ne null}">
							<div class="number-prod">${num}</div>
						</c:if>
						<c:if test="${sessionScope.user eq null}">
							<div class="number-prod">0</div>
						</c:if>
					</div>
				</button>
			</div>

			<div class="navigate-link user-link">
				<c:if test="${sessionScope.user ne null}">
					<button>
						<c:if test="${sessionScope.user.userAvatar eq null}">
							<img class="header-icon" src="icons/user-solid.svg" alt="">
						</c:if>
						<c:if test="${sessionScope.user.userAvatar ne null}">
							<img class="user-avatar" src="${sessionScope.user.userAvatar}"
								alt="">
						</c:if>
					</button>
					<div class="option-container">
						<a id="user-profile-link" href="account">My account</a> <a
							id="log-link" href='<c:url value = '/logout'></c:url>'>Logout</a>
					</div>
				</c:if>
				<c:if test="${sessionScope.user eq null}">
					<a href='<c:url value = '/login'></c:url>'>Login</a>
				</c:if>
			</div>
			
			<div class="navigate-link store-link user-link-res">
				<a href="#" style="pointer-events: none;">Account
				</a> <span id="show-user"> <i
					class="fa-solid fa-chevron-down"
					style="font-size: 0.6em; color: #2b2f38; margin-right: 5px;"></i>
				</span>
			</div>
			<div id="menu-user" class="menu-option-container">
				<a href="account">
					<div class="plants-link">
						<i class="fa-solid fa-chevron-right"
							style="font-size: 0.6em; color: #2b2f38; margin-right: 5px;"></i>
						My account
					</div>
				</a> <a href="logout">
					<div class="cactus-link">
						<i class="fa-solid fa-chevron-right"
							style="font-size: 0.6em; color: #2b2f38; margin-right: 5px;"></i>
						Logout
					</div>
				</a>
			</div>
		</div>
	</div>
	<!--End header navigate bar-->
</body>
</html>