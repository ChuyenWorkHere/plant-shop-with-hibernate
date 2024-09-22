<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	if (request.getAttribute("ok") == null || !(Boolean) request.getAttribute("ok")) {
		response.sendRedirect("checkout");
		//		request.getRequestDispatcher("cart").forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout - Simply Natural</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles/checkout.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
	<header>
		<!--First Part of Home Page-->
		<div class="header-container">
			<!-- Header navigate -->
			<jsp:include page="common/header-nav.jsp" />
		</div>
	</header>

	<main>
	<section class="container">
		<h3>Checkout</h3>
		<section class="coupon-container">
			<div class="coupon-suggest">
				<span> <i class="fa-regular fa-calendar"></i>
				</span>
				<div>
					<span>Have a coupon?</span>
					<button id="show-input">Click here to enter your code</button>
				</div>
			</div>
			<div class="coupon-input-user">
				<p>If you have a coupon code, please apply it below</p>
				<div>
					<input type="text" placeholder="Coupon code">
					<button>APPLY COUPON</button>
				</div>
			</div>
		</section>
		<form action="checkout-submit" method="post">
			<section class="order-container">
				<section class="bill-container">
					<h4 class="billing">Billing details</h4>
					<div class="name-user">
						<div class="input-user">
							<label for="first-name">First Name<span> *</span></label> <input
								type="text" name="first-name" required>
						</div>
						<div class="input-user">
							<label for="last-name">Last Name<span> *</span></label> <input
								type="text" name="last-name" required>
						</div>
					</div>
					<div class="input-user">
						<label for="com-name">Company Name (optional)</label> <input
							type="text" name="com-name">
					</div>
					<div class="input-user">
						<label for="country">Country / Region<span>*</span></label> <input
							type="text" name="country">
					</div>
					<div class="input-user address">
						<label for="address">Street address<span> *</span></label> <input
							type="text" name="address" required
							placeholder="House number and street name"> <input
							type="text" name="optional-address"
							placeholder="Apartment, suite, unit, etc. (optional)">
					</div>
					<div class="input-user">
						<label for="postcode">Postcode / ZIP (optional)</label> <input
							type="text" name="postcode">
					</div>
					<div class="input-user">
						<label for="town">Town / City<span> *</span></label> <input
							type="text" name="town" required>
					</div>
					<div class="input-user">
						<label for="phone">Phone<span> *</span></label> <input type="text"
							name="phone" required>
					</div>
					<div class="input-user">
						<label for="email">Email address<span> *</span></label> <input
							type="text" name="email" required>
					</div>
					<h4>Additional information</h4>
					<div class="input-user">
						<label for="note">Order notes (optional)</label>
						<textarea name="note" id=""
							placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
					</div>
				</section>
				<section class="order-detail">
					<div>
						<h4>Your order</h4>
						<table>
							<thead>
								<th>Product</th>
								<th>Subtotal</th>
							</thead>
							<tbody>
								<c:forEach items="${MAPCART}" var="o">
									<tr>
										<td>${o.key.productName}&Cross; ${o.value}</td>
										<td>$<fmt:formatNumber
												value="${o.key.priceAfterSale * o.value}"
												maxFractionDigits="2" minFractionDigits="2" /></td>
									</tr>
								</c:forEach>
								<tr>
									<td>Subtotal</td>
									<td>$${TOTAL}</td>
								</tr>
								<tr>
									<td>Total</td>
									<td>$${TOTAL}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="payment-method">
						<div class="method">
							<p>Cash on delivery</p>
							<span></span>
							<div class="payment-notice">
								<p>Pay with cash upon delivery</p>
							</div>
						</div>
						<button type="submit">PLACE ORDER</button>
					</div>
				</section>

			</section>
		</form>
	</section>
	</main>
	<!-- Footer -->
	<jsp:include page="common/footer.jsp" />

	<!--Javascript code-->
	<script src="javascript/main.js"></script>
	<script src="javascript/user/show-input-coupon.js"></script>
</body>
</html>