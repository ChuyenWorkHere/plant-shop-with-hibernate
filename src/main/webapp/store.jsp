<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if (request.getAttribute("ok") == null || !(Boolean) request.getAttribute("ok")) {
		response.sendRedirect("store");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Store - Simply Natural</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles/store.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<!--Header-->
	<div class="header-container">
		<!--Start navigate bar-->
		<jsp:include page="common/header-nav.jsp" />
		<!--End navigate bar-->

		<!--Start opening part-->
		<div class="opening-part">
			<div class="opening-adver">Store</div>
		</div>
		<!--End openning part-->
	</div>

	<!--Cart -->
	<jsp:include page="common/cart-embedded.jsp"></jsp:include>
	
	
	<!--Notification -->
	<jsp:include page="common/notification.jsp"></jsp:include>

	<!--Featured plants-->
	<div class="featured-plant-container">
		<h2 class="featured-plant-title">Featured Plants</h2>
		<div class="featured-plant-sample-product">
			<div class="featured-sample-product">
				<div class="not-sale-product">Sale!</div>
				<div class="add-to-cart-container">
					<div class="image-container">
						<img src="images/plant3-free-img.jpg" alt="" class="image-product">
						<div class="add-to-cart">
							<a href="#"> <i class="fa-solid fa-bag-shopping"></i>
							</a>
							<div>Add to cart</div>
						</div>
					</div>
				</div>
				<div class="detail-product">
					<p class="category-product">Plants</p>
					<p class="name-product">Boncellensis Secullant</p>
					<div class="star-rated-product">
						<img src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating">
					</div>
					<p class="price-product">$34.00</p>
				</div>
			</div>
			<div class="featured-sample-product">
				<div class="sale-product">Sale!</div>
				<div class="add-to-cart-container">
					<div class="image-container">
						<img src="images/cactus2-free-img-768x768.jpg" alt=""
							class="image-product">
						<div class="add-to-cart">
							<a href="#"> <i class="fa-solid fa-bag-shopping"></i>
							</a>
							<div>Add to cart</div>
						</div>
					</div>
				</div>
				<div class="detail-product">
					<p class="category-product">Cactus</p>
					<p class="name-product">Cleistocactus</p>
					<div class="star-rated-product">
						<img src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating">
					</div>
					<p class="price-product sale">$34.00</p>
				</div>
			</div>
			<div class="featured-sample-product">
				<div class="sale-product">Sale!</div>
				<div class="add-to-cart-container">
					<div class="image-container">
						<img src="images/plant5-free-img.jpg" alt="" class="image-product">
						<div class="add-to-cart">
							<a href="#"> <i class="fa-solid fa-bag-shopping"></i>
							</a>
							<div>Add to cart</div>
						</div>
					</div>
				</div>
				<div class="detail-product">
					<p class="category-product">Cactus</p>
					<p class="name-product">Cleistocactus</p>
					<div class="star-rated-product">
						<img src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating">
					</div>
					<p class="price-product sale">$34.00</p>
				</div>
			</div>
		</div>
	</div>

	<!--Collections-->
	<div class="plants-collection">
		<div class="featured-plant-container">
			<h2 class="featured-plant-title">Our Plants Collection</h2>
			<div class="featured-plant-sample-product">
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
	</div>

	<!-- Assistance -->
	<jsp:include page="common/assistance.jsp"></jsp:include>

	<!-- Footer -->
	<jsp:include page="common/footer.jsp" />

	<!--Javascript code-->
	<script src="javascript/main.js"></script>
	<script src="javascript/user/show-hide-cart.js"></script>
	<script src="javascript/user/add-to-cart-jQuery.js"></script>
	<script src="javascript/user/delete-cart-jQuery.js"></script>
</body>
</html>