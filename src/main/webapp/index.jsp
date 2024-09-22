<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
	if (request.getAttribute("ok") == null || !(Boolean) request.getAttribute("ok")) {
		response.sendRedirect("home");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - Simply Natural</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles/index.css">
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

		<!--Start opening part-->
		<div class="opening-part">
			<div class="opening-title">Best Quality Plants</div>
			<div class="opening-adver">Amazing Variety Of Plants Starting
				Just $6</div>
			<button class="go-to-shop">SHOP NOW</button>
		</div>
	</div>

	<!--Cart -->
	<jsp:include page="common/cart-embedded.jsp"></jsp:include>
	
	<!--Notification -->
	<jsp:include page="common/notification.jsp"></jsp:include>

	<!--Offer for customer part-->
	<div class="offers-container">
		<div class="offer">
			<img src="icons/spa-solid.svg" alt="" class="offer-logo">
			<div class="offer-content">
				<p class="offer-title">Plants Collection</p>
				<p class="main-offer">Any plants for your space</p>
			</div>
		</div>
		<div class="offer">
			<img src="icons/box-solid.svg" alt="" class="offer-logo">
			<div class="offer-content">
				<p class="offer-title">Free Shipping</p>
				<p class="main-offer">Free shipping on order</p>
			</div>
		</div>
		<div class="offer">
			<img src="icons/sync-solid.svg" alt="" class="offer-logo">
			<div class="offer-content">
				<p class="offer-title">100% Money Back</p>
				<p class="main-offer">If the item didn't suit you</p>
			</div>
		</div>
	</div>
	<!--End Offer for customer part-->

	<!--Collection for page-->
	<div class="collection-container">
		<div class="collection collection-1">
			<img src="images/plant6-free-img.jpg" alt=""
				class="sample-plant sample-product">
			<div>
				<p class="name-collection">Beautiful Plant Varieties</p>
				<p class="detail-collection">Luctus nec ullamcorper mattis,
					pulvinar dapibus leo.</p>
				<button class="go-to-collection">SEE COLLECTION</button>
			</div>
 
		</div>
		<div class="collection collection-2">
			<img src="images/cactus2-free-img-768x768.jpg" alt=""
				class="sample-cactus sample-product">
			<div>
				<p class="name-collection">Trendy Cactus Varieties</p>
				<p class="detail-collection">Luctus nec ullamcorper mattis,
					pulvinar dapibus leo.</p>
				<button class="go-to-collection">SEE COLLECTION</button>
			</div>
		</div>
		<div class="collection collection-3">
			<img src="images/plant4-free-img.jpg" alt=""
				class="sample-garden sample-product">
			<div>
				<p class="name-collection">Gardening Accessories</p>
				<p class="detail-collection">Luctus nec ullamcorper mattis,
					pulvinar dapibus leo.</p>
				<button class="go-to-collection">VISIT THE STORE</button>
			</div>

		</div>
	</div>
	<!--End collection for page-->

	<!--Start featured plants-->
	<div class="featured-plant-container">
		<h2 class="featured-plant-title">Featured Plants</h2>
		<div class="featured-plant-introduce">Lorem ipsum dolor sit
			amet, consectetur adipiscing elit.</div>
		<div class="featured-plant-sample-product">
			<c:if test="${PRODUCTS.size() >= 8 }">
				<c:forEach items="${PRODUCTS}" begin="0" end="7" var="o">
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
								style="text-decoration: none"><p class="name-product">${o.productName}</p></a>
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
			</c:if>
			<c:if test="${PRODUCTS.size() < 8 }">
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
								<img src="${o.productImage}" alt="" class="image-product">
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
							<a href="product-detail?id=${o.productID}"
								style="text-decoration: none"><p class="name-product">${o.productName}</p></a>
							<p class="name-product">${o.productName}</p>
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
								$${o.priceAfterSale}"
							</p>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!--End featured plants-->

	<!-- Assistance -->
	<jsp:include page="common/assistance.jsp"></jsp:include>
	<!-- End assistance -->

	<!--Testimonials part -->
	<div class="testimonials-container">
		<div class="testimonials-part-1">
			<div class="testimonials-title">Testimonials</div>
			<div class="testimonials-preview">Lorem ipsum dolor sit amet,
				consectetur adipiscing elit.</div>
			<div class="user-container user-1">
				<img src="images/user1-free-img.jpg" alt="">
				<div class="testimonials-feedback-container">
					<div class="testimonials-feedback">Neque porro quisquam est,
						qui dolore ipsum quia dolor sit amet, consectetur adipisci velit,
						sed quia non numquam eius modi tempora incidunt.</div>
					<div class="testimonials-author">
						<p class="author-name">Sarah Jones</p>
						<p class="author-job">Interior Designer</p>
					</div>
				</div>
			</div>
		</div>
		<div class="testimonials-part-2">
			<div class="user-container user-2">
				<img src="images/user2-free-img.jpg" alt="">
				<div class="testimonials-feedback-container">
					<div class="testimonials-feedback">Neque porro quisquam est,
						qui dolore ipsum quia dolor sit amet, consectetur adipisci velit,
						sed quia non numquam eius modi tempora incidunt.</div>
					<div class="testimonials-author">
						<p class="author-name">Jessica Foxx</p>
						<p class="author-job">Student</p>
					</div>
				</div>
			</div>
			<div class="user-container user-3">
				<img src="images/user3-free-img.jpg" alt="">
				<div class="testimonials-feedback-container">
					<div class="testimonials-feedback">Neque porro quisquam est,
						qui dolore ipsum quia dolor sit amet, consectetur adipisci velit,
						sed quia non numquam eius modi tempora incidunt.</div>
					<div class="testimonials-author">
						<p class="author-name">Briana Luke</p>
						<p class="author-job">Student</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End testimonials part-->

	<!--Advertisement part-->
	<jsp:include page="common/advertisement.jsp"></jsp:include>

	<!-- Footer -->
	<jsp:include page="common/footer.jsp" />

	<!--Javascript code-->
	<script src="javascript/main.js"></script>
	<script src="javascript/user/show-hide-cart.js"></script>
	<script src="javascript/user/add-to-cart-jQuery.js"></script>
	<script src="javascript/user/delete-cart-jQuery.js"></script>
</body>
</html>