<%@page import="com.vanchuyen.dao.ProductDAO"%>
<%@page import="com.vanchuyen.model.Product"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.vanchuyen.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.vanchuyen.model.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	if (!Boolean.TRUE.equals(request.getAttribute("ok"))) {
		CategoryDAO cateDAO = new CategoryDAO();
		
		Category cate = cateDAO.selectAll().get(0);
		
		if(cate != null) {
			
			System.out.println("Inside");
			
			response.sendRedirect("cate?cID="+cate.getCategoryID());
			//request.getRequestDispatcher().forward(request, response);
			
			return;
		} else {
			response.sendRedirect("store");
			return;
		}
		
	}
%>

<%
	CategoryDAO cateDAO = new CategoryDAO();

	ProductDAO pd = new ProductDAO();
	
	Category cate = (Category) request.getAttribute("CATEGORY");
	
	request.setAttribute("CATE", cate);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Plant - Simply Natural</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles/category.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<!--First Part of Home Page-->
	<div class="header-container">
		<!-- Header navigate -->
		<jsp:include page="common/header-nav.jsp" />
	</div>

	<!--Cart -->
	<jsp:include page="common/cart-embedded.jsp"></jsp:include>
	
	<!--Notification -->
	<jsp:include page="common/notification.jsp"></jsp:include>

	<!--Main content-->
	<main>
	<section class="element-container">
		<div class="side-bar-container">
			<div class="price-filter-container">
				<p>Filter by price</p>
				<div class="price-range-slider">
					<div class="min-max-range">
						<div class="slider-track"></div>
						<input type="range" min="10" max="50" value="10" class="min-range"
							id="min"> <input type="range" min="10" max="50"
							value="50" class="max-range" id="max">
					</div>
					<div class="min-max">
						<div id="input-min">$10</div>
						<div id="input-max">$50</div>
					</div>
				</div>
				<div class="reset-button">
					<button id="reset">RESET</button>
				</div>
			</div>
			<div class="categories-container">
				<h4>Categories</h4>
				<div>
					<%
						List<Category> cates = cateDAO.selectAll();
						Map<Category, Integer> allCate = new HashMap<>();
						if(cates != null) {
							for(Category c: cates){
								int sizeCate = pd.selectAllByCategory(c).size();
								allCate.put(c, sizeCate);
							}
						}
						request.setAttribute("CATES", allCate);
						
					%>
					<c:forEach items="${CATES}" var="o">
						<a href="cate?cID=${o.key.categoryID}">${o.key.categoryName}<span>(${o.value})</span></a>
					</c:forEach>
					
				</div>
			</div>
			<div class="hottest-deal-container">
				<h3>Hottest Deals</h3>
				<div class="hottest-product-container">
					<div class="product">
						<img style="width: 100%;" src="images/plant1-free-img.jpg" alt="">
						<p class="product-name">Money Plant</p>
						<p class="price">$20.00</p>
					</div>
				</div>
				<div class="hottest-product-container">
					<div class="product">
						<img style="width: 100%;" src="images/plant5-free-img.jpg" alt="">
						<p class="product-name">Green Soil Lotus</p>
						<p class="price">$34.00</p>
					</div>
				</div>
				<div class="hottest-product-container">
					<div class="product">
						<img style="width: 100%;" src="images/cactus6-free-img.jpg" alt="">
						<p class="product-name">Star Cactus</p>
						<p class="price">$30.00</p>
					</div>
				</div>
			</div>
		</div>
		<div class="main-container">
			<div class="path-category">
				<a href="home">Home </a> / ${CATE.categoryName}
				<input style="display: none;" type="text" id="cate" value="${CATE.categoryID}">
			</div>
			<h2>${CATE.categoryName}</h2>
			<div class="related-content">
				<p>
					Showing all <span>${PRODUCTS.size()}</span> results
				</p>
				<select name="option" id="" class="sort-product">
					<option value="default">Default Sorting</option>
					<option value="popularity">Sort by popularity</option>
					<option value="average-rating">Sort by average rating</option>
					<option value="latest">Sort by latest</option>
					<option value="low-to-high">Sort by price: low to high</option>
					<option value="high-to-low">Sort by price: high to low</option>
				</select>
			</div>
			<div class="product-container">
				<c:forEach items="${PRODUCTS}" var="o">
					<div class="featured-sample-product">
						<c:if test="${o.productSale > 0}">
							<div class="sale-product">Sale!</div>
						</c:if>
						<c:if test="${o.productSale == 0 || o.productSale eq null }">
							<div class="not-sale-product">Sale!</div>
						</c:if>
						<div class="add-to-cart-container">
							<div class="image-container">
								<a href="product-detail?id=${o.productID}"> <img
									src="${o.productImage}" alt="" class="image-product">
								</a>
								<div class="add-to-cart">
									<c:if test="${sessionScope.user eq null}">
										<a href="login"> <i class="fa-solid fa-bag-shopping"></i></a>
									</c:if>
									<c:if test="${sessionScope.user ne null}">
										<a class="add" href="add?pID=${o.productID}"> <i
											class="fa-solid fa-bag-shopping"></i></a>
									</c:if>
									<div>Add to cart</div>
								</div>
							</div>
						</div>
						<div class="detail-product">
							<p class="category-product">${o.category.categoryName}</p>
							<a href="product-detail?id=${o.productID}"
								style="text-decoration: none">
								<p class="name-product">${o.productName}</p>
							</a>
							<div class="star-rated-product">
								<img src="icons/star-regular.svg" alt="" class="star-rating"><img
									src="icons/star-regular.svg" alt="" class="star-rating"><img
									src="icons/star-regular.svg" alt="" class="star-rating"><img
									src="icons/star-regular.svg" alt="" class="star-rating"><img
									src="icons/star-regular.svg" alt="" class="star-rating">
							</div>
							<p class="price-product">
								<c:if test="${o.productSale > 0}">
									<span class="before-sale">$${o.productPrice}</span>
								</c:if>
								$${o.priceAfterSale}
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	</main>
	<!--End main content-->

	<!-- Footer -->
	<jsp:include page="common/footer.jsp" />

	<!--Javascript code-->
	<script src="javascript/main.js"></script> 
	<script src="javascript/user/show-hide-cart.js"></script>
	<script src="javascript/user/add-to-cart-jQuery.js"></script>
	<script src="javascript/user/delete-cart-jQuery.js"></script>
	<script src="javascript/user/search-product.js"></script>
</body>
</html>