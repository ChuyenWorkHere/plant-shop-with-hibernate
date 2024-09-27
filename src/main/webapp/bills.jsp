<%@page import="com.vanchuyen.dao.OrderDetailDAO"%>
<%@page import="com.vanchuyen.dao.OrderDAO"%>
<%@page import="com.vanchuyen.dao.ProductDAO"%>
<%@page import="com.vanchuyen.dao.CartDAO"%>
<%@page import="com.vanchuyen.model.Users"%>
<%@page import="com.vanchuyen.model.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	Users user = (Users) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("login");
	}
%>
<%
	CartDAO cd = new CartDAO();
	ProductDAO pd = new ProductDAO();
	OrderDAO od = new OrderDAO();
	OrderDetailDAO odd = new OrderDetailDAO();

	//Get all the order to billing page
	List<Orders> listOrders = od.selectByUserId(user);
	request.setAttribute("BILLS", listOrders);
	request.setAttribute("ok", true);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Billings</title>
<link rel="icon" href="images/plants-store-logo-green.svg"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="styles/bills.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
#cart-2 p {
	margin: 0 5px;
}
.wait {
	color: #cccc00;
	font-weight: 600;
}
.success {
	color: #75C32C;
	font-weight: 600;
}
.fail {
	color: red;
	font-weight: 600;
}
.table-chooser {
	max-height: 50vh;
	overflow: auto;
}
@media screen and (max-width: 645px) {
	.bill {
		right : 0;
		left: 0;
	}
}
</style>
</head>
<body>
	<div class="header-container">
		<!-- Header navigate -->
		<jsp:include page="common/header-nav.jsp" />
	</div>

	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>My orders</h2>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Order Date</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${BILLS}" var="o">
							<tr>
								<td>${o.fName}${o.lName}</td>
								<td>${o.address},${o.country}, ${o.city}</td>
								<td>${o.email}</td>
								<td>${o.phone}</td>
								<td>${o.orderDate}</td>
								<td class="status ${o.status eq 'WAITING'? 'wait': (o.status eq 'SUCCESS'? 'success' : 'fail')}">${o.status}</td>
								<td id="detail" class="detail-btn" data-toggle="modal"><a class="gen" href="get-invoice?id=${o.orderID}">Detail</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="container-xl bill" style="z-index: 200">
		<div class="logo">
			<img src="images/plants-store-logo-green.svg" alt="">
			<div class="brand">
				<h5>Simply Natural</h5>
				<span>Le Van Chuyen</span>
			</div>
		</div>
		<div class="bill-header">
			<div class="title">
				<h2>INVOICE</h2>
			</div>
			<div class="header-info">
				<div class="user-bill">
					<h5 class="bold">Invoice To:</h5>
					<br>
					<p class="bold" id="name-user">Maruf Billah</p>
					<br> <span class="nor" id = "address"> 25 Dummy Street Area, <br>
						Location, Lorem Ipsum <br> 
					</span>
					<span class="nor" id = "phone">0123456789</span>
				</div>
				<div class="bill-id">
					<table class="tab">
						<tbody>
							<tr>
								<th class="bold">Invoice#</th>
								<td class="nor" id = "oID">12345</td>
							</tr>
							<tr>
								<th class="bold">Date</th>
								<td class="nor" id = "oDate">01/01/2024</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="table-responsive">
				<div class="table-wrapper table-chooser">
					<table class="table table-striped table-hover table-bill">
						<thead>
							<tr>
								<th>SL.</th>
								<th>Item Description</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody id="bill-print">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="bill-footer">
			<div>
				<table class="tab">
					<tbody>
						<tr>
							<th class="bold">Subtotal:</th>
							<td class="nor" id="sub-total">$200.00</td>
						</tr>
						<tr>
							<th class="bold">Coupon</th>
							<td class="nor" id = "coupon">$0.00</td>
						</tr>
					</tbody>
				</table>
				<p>
					Total: <span id="total">20.00</span>
				</p>
			</div>
			<button id="hide-bill">OK</button>
		</div>
	</div>
	</div>
	<script src="javascript/user/hide-bill.js"></script>
	<script src="javascript/user/extract-invoice.js"></script>
	<script src="javascript/main.js"></script>
</body>
</html>