<%@page import="com.vanchuyen.dao.ReviewDAO"%>
<%@page import="com.vanchuyen.model.Review"%>
<%@page import="com.vanchuyen.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.vanchuyen.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ProductDAO pd = new ProductDAO();
	List<Product> prods = pd.selectAll();
	if(request.getAttribute("PRODUCT") == null) {
		Product firstProduct = prods.get(0);
		List<Review> reviews = new ReviewDAO().selectAllById(firstProduct);
		
		request.setAttribute("PRODUCT", firstProduct);
		request.setAttribute("REVIEWS", reviews);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - Simply Natural</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles/detail_plants.css">
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
	<!--End First Part of Home Page-->

	<!--Notification -->
	<jsp:include page="common/notification.jsp"></jsp:include>

	<!--Cart -->
	<jsp:include page="common/cart-embedded.jsp"></jsp:include>

	<main>
	<section class="detail-container">
		<section class="gallery-container">
			<div id="image-area" class="image-container">
				<img id="image-zoom" src="${PRODUCT.productImage}" alt="">
				<c:if test="${PRODUCT.productSale > 0}">
					<div class="sale-product">Sale!</div>
				</c:if>
				<c:if
					test="${PRODUCT.productSale == 0 || PRODUCT.productSale eq null }">
					<div class="not-sale-product">Sale!</div>
				</c:if>
				<div class="zoom-image-btn">
					<button>
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
			</div>
			<div class="gallery"></div>
		</section>
		<section class="info-container">
			<div class="category">
				<a href="cate?cID=${PRODUCT.category.categoryID}">${PRODUCT.category.categoryName}</a>
			</div>
			<div class="info-name">${PRODUCT.productName}</div>
			<div class="info-price">
				<p>
					<c:if test="${PRODUCT.productSale > 0}">
						<span class="before-sale" style="color: #BFBFBC">$${PRODUCT.productPrice}</span>
					</c:if>
					$${ PRODUCT.priceAfterSale}
				</p>
				<span> + Free Shipping</span>
			</div>
			<div class="info-description">${PRODUCT.productDescription}</div>
			<div class="stock" style="border-top: 1px solid rgba(0, 0, 0, 0.15); padding-top: 10px;">
                    <span style="color: #818183; font-family: inherit;">In stock: </span>
                    <span style="color: #797a7c; font-family: inherit; font-weight: 600;">${PRODUCT.productQuantity}</span>
                </div>
			<div class="add-to-cart">
				<input type="number" value="1" name="num-to-cart">
				<a class="add" href="add?pID=${PRODUCT.productID}">ADD TO CART</a>
			</div>
			<div class="info-category">
				<p>
					Category: <a href="cate?cID=${PRODUCT.category.categoryID}">${PRODUCT.category.categoryName}</a>
				</p>
			</div>
		</section>
	</section>
	<section class="des-and-review">
		<div class="option-user">
			<div></div>
			<div></div>
			<h4>Description</h4>
			<h4>
				Review(<span>${REVIEWS.size()}</span>)
			</h4>
		</div>
		<section class="desciption-container">
			<p>${PRODUCT.productDescription}</p>
		</section>
		<section class="review-container">
			<c:if test="${REVIEWS.size() == 0 || REVIEWS eq null}">
				<p class="no-review">There are no reviews yet.</p>
			</c:if>
			<div id="content" class="el-container">
				<c:if test="${REVIEWS.size() > 0}">
					<c:forEach items="${REVIEWS}" var="o">
						<div class="user-comment">
							<div class="profile-container">
								<div class="el-user-name">
									<img src="images/avt.jpg" alt=""> <span>${o.nameUser}</span>
								</div>
								<div class="number-star">
									<c:forEach begin="1" end="${o.numberStar}">
										<i class="active fa-solid fa-star"></i>
										<c:out value="" />
									</c:forEach>
									<c:forEach begin="${o.numberStar + 1}" end="5">
										<i class="fa-solid fa-star"></i>
										<c:out value="" />
									</c:forEach>
								</div>
							</div>
							<p>${o.mainReview}</p>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<form id="myForm" action="">
				<c:if test="${REVIEWS.size() == 0 || REVIEWS eq null}">
					<h4>Be the first to review ${PRODUCT.productName}</h4>
				</c:if>
				<c:if test="${REVIEWS.size() > 0}">
					<h4>Review ${PRODUCT.productName}</h4>
				</c:if>
				<p>Your email address will not be published. Required fields are
					marked *</p>
				<div class="user-rating-star user-input">
					<h4>Your rating *</h4>
					<div style="display: inline-block;" class="stars">
						<!--	<i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i
							class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i
							class="fa-solid fa-star"></i> -->
						<jsp:include page="common/star-rating.jsp"></jsp:include>
					</div>
				</div>
				<div class="user-review user-input">
					<h4>Your reviews *</h4>
					<textarea name="" id="review" cols="10" rows="3"
						required="required"></textarea>
				</div>
				<div class="info-user-container">
					<div class="user-name user-input">
						<label for="name">Name * </label> <input type="text" id="name"
							required="required">
					</div>
					<div class="user-email user-input">
						<label for="email">Email * </label> <input type="text" id="email"
							required="required">
					</div>
					<input type="text" id="pID" value="${PRODUCT.productID}"
						style="display: none">
				</div>
				<button id="comment-submit" type="button">SUBMIT</button>
			</form>
		</section>
	</section>
	<section class="related-product">
		<h3>Realted Products</h3>
		<div class="product-container">
			<div class="featured-sample-product">
				<div class="sale-product">Sale!</div>
				<div class="add-to-cart-container">
					<div class="image-container">
						<img src="images/plant1-collection.jpg" alt=""
							class="image-product">
						<div class="add-to-cart">
							<a href="#"><i class="fa-solid fa-bag-shopping"></i></a>
							<div>Add to cart</div>
						</div>
					</div>
				</div>
				<div class="detail-product">
					<p class="category-product">Plants</p>
					<p class="name-product">Aluminum Plant</p>
					<div class="star-rated-product">
						<img src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating">
					</div>
					<p class="price-product">$45.00</p>
				</div>
			</div>
			<div class="featured-sample-product">
				<div class="not-sale-product">Sale!</div>
				<div class="add-to-cart-container">
					<div class="image-container">
						<img src="images/plant2-collection.jpg" alt=""
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
					<p class="name-product">Ball Cactus</p>
					<div class="star-rated-product">
						<img src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating"><img
							src="icons/star-regular.svg" alt="" class="star-rating">
					</div>
					<p class="price-product">$15.00</p>
				</div>
			</div>
		</div>

	</section>
	</main>

	<!-- Footer -->
	<jsp:include page="common/footer.jsp" />

	<!--Javascript code-->
	<script src="javascript/main.js"></script>
	<script src="javascript/user/detail-plants.js"></script>
	<script src="javascript/user/show-hide-cart.js"></script>
	<script src="javascript/user/comment-jQuery.js"></script>
	<script src="javascript/user/add-to-cart-jQuery.js"></script>
	<script src="javascript/user/delete-cart-jQuery.js"></script>
</body>
</html>