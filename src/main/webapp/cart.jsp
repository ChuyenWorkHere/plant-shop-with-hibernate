<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	if (request.getAttribute("ok") == null || !(Boolean) request.getAttribute("ok")) {
//		response.sendRedirect("cart");
		request.getRequestDispatcher("cart").forward(request, response);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart - Simply Natural</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles/cart.css">
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
	
	<!--Notification -->
	<jsp:include page="common/notification.jsp"></jsp:include>

	<!--Cart -->
	<jsp:include page="common/cart-embedded.jsp"></jsp:include>

	<!-- Cart main -->
	<main>
	<section class="cart-wrapper">
		<h3 id="cart">Cart</h3>
		<div class="cart-noti">
			<div class="noti-update-wrapper">
				<div class="noti-update noti-success">
					<span><i class="fa-solid fa-check"></i></span> <span class="notifi-updated">Cart
						updated!</span> <span class="product-delete"></span>
				</div>
				<div class="noti-update noti-fail">
					<span><i class="fa-solid fa-exclamation"></i></span> <span>Updated
						unsuccessfully!</span>
				</div>
				<c:if test="${isSuccess}">
					<style>
						.noti-update-wrapper .noti-success {
							display: flex; 
						}
					</style>
				</c:if>
				<c:if test="${isOver}">
					<script type="text/javascript">
						const notification = document.querySelector(".noti-update .notifi-updated");
						notification.innerHTML = "Quantity added over quantity in stock! You'll add all available quantities to the cart."; 
					</script>
				</c:if>
			</div>
			<div class="noti-coupon-wrapper">
				<div class="noti-coupon noti-success">
					<span><i class="fa-solid fa-check"></i></span> <span>Apply
						coupon code successfully!</span>
				</div>
				<div class="noti-coupon noti-fail">
					<span><i class="fa-solid fa-exclamation"></i></span> <span>Coupon
						does not exist!</span>
				</div>
			</div>
			<div class="empty-cart">
				<div class="noti-empty-cart">
					<span><i class="fa-regular fa-calendar"></i></span> <span>Your
						cart is currently empty.</span>
				</div>
				<a href="store" class="return-shop">RETURN TO SHOP NOW</a>
			</div>
		</div>
		<c:if test="${MAPCART.size() == 0 ||  MAPCART eq null}">
			<style>
				<!--
				.cart-table, .cart-table-responsive, .cart-checkout {
					display: none;
				}
				
				.empty-cart {
					display: flex;
					gap: 3rem;
				}
				-->
			</style>
		</c:if>
		<section class="cart-table">
			<form action="update-cart" method="post">
				<table>
					<tr>
						<th></th>
						<th></th>
						<th>Product</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>
					</tr>
					<c:forEach items="${MAPCART}" var="o">
						<tbody id="${o.key.productID}">
							<tr>
								<td><a href="delete?pID=${o.key.productID}"
									class="remove-plant"> <span>&Cross;</span>
								</a></td>
								<td><img src="${o.key.productImage}" alt=""></td>
								<td><a style="text-decoration: none;"
									href="product-detail?id=${o.key.productID}"> <span>${o.key.productName}</span>
								</a></td>
								<td>$${o.key.priceAfterSale}</td>
								<td><input style="width: 20%" name="quantity" class="num-plants num1"
									type="number" value="${o.value}" min="0">
									<input style="width: 20%" name="productID"
									type="hidden" value="${o.key.productID}">
									</td>
								<td><span>$<fmt:formatNumber value="${o.key.priceAfterSale * o.value}" maxFractionDigits="2" minFractionDigits="2" /></span></td>
							</tr>
						</tbody>
					</c:forEach>
	
					<tr>
						<td colspan="5">
							<div class="coupon-code">
								<input id="coupon-code-1" type="text" placeholder="Coupon code">
								<a href="apply-coupon" id="apply-button-1" class="apply-button" style="text-decoration: none">APPLY
									COUPON</a>
							</div>
						</td>
						<td class="update-col">
							<button type="submit" class="not-allowed-button update-button">UPDATE
								CART</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
		<section class="cart-table-responsive">
			<form action="update-cart" method="post">
				<table>
					<c:forEach items="${MAPCART}" var="o">
						<tbody id="${o.key.productID}">
							<tr>
								<td class="remove-x"><a
									href="delete?pID=${o.key.productID}" class="remove-plant">
										<span>&Cross;</span>
								</a></td>
							</tr>
							<tr>
								<td class="plant-image"><img src="${o.key.productImage}"
									alt=""></td>
							</tr>
							<tr class="plant-row">
								<td class="plant-info"><span class="title">Product:</span>
									<a class="name" href="product-detail?id=${o.key.productID}"><span>${o.key.productName}</span></a>
								</td>
							</tr>
							<tr class="plant-row">
								<td class="plant-info"><span class="title">Price:</span> <span>${o.key.priceAfterSale}</span>
								</td>
							</tr>
							<tr class="plant-row">
								<td class="plant-info"><span class="title">Quantity:</span>
									<input class="num-plants num2" type="number" name="quantity" value="${o.value}" min="0">
									<input type="hidden" name="productID" value="${o.key.productID}">
								</td>
							</tr>
							<tr class="plant-row">
								<td class="plant-info"><span class="title">Subtotal:</span>
									<span>$<fmt:formatNumber value="${o.key.priceAfterSale * o.value}" maxFractionDigits="2" minFractionDigits="2" /></span></td>
							</tr>
						</tbody>
					</c:forEach>

					<tr class="plant-info">
						<td class="user-coupon">
							<div class="coupon-code">
								<input id="coupon-code-2" type="text" placeholder="Coupon code">
								<a href="apply-coupon" id="apply-button-2" class="apply-button" style="text-decoration: none">APPLY
									COUPON</a>
							</div>
							<button type="submit" class="not-allowed-button update-button">UPDATE
								CART</button>
						</td>
					</tr>
				</table>
			</form>

		</section>
		<section class="cart-checkout">
			<table>
				<th>
					<h3>Cart totals</h3>
				</th>
				<tr>
					<td>
						<table>
							<tbody>
								<tr class="rows-price">
									<td class="price"><span class="title">Subtotal</span> <span
										class="sub-total">$${total}</span></td>
								</tr>
								<tr class="rows-price">
									<td class="price"><span class="title">Total</span> <span
										class="in-total">$${total}</span></td>
								</tr>
							</tbody>
						</table>
						<button>PROCEED TO CHECKOUT</button>
					</td>
				</tr>
			</table>
		</section>
	</section>

	</main>


	<!-- Footer -->
	<jsp:include page="common/footer.jsp" />

	<!--Javascript code-->
	<script src="javascript/main.js"></script>
	<script src="javascript/user/cart-update.js"></script>
	<script src="javascript/user/apply-coupon.js"></script>
</body>
</html>