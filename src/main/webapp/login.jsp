<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    HttpSession ss = request.getSession();
    if (ss != null && ss.getAttribute("user") != null) {
        response.sendRedirect("account");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>My Account - Simply Natural</title>
	<link rel="icon" href="images/plants-store-logo-green.svg" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="styles/account.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
	<!--First Part of Home Page-->
    <div class="header-container">
       <!-- Header navigate -->
    	<jsp:include page="common/header-nav.jsp"/>
    </div>
    
     <!--Cart -->
    <jsp:include page="common/cart-embedded.jsp"></jsp:include>
    
    <!--Login-->
    <form action="login" method="post">
	    <div class="login-container">
	        <div class="my-account">My account</div>
	        <div class="login-title">Login</div>
	        <div class="login-form-container">
	            <div class="label-login user-name">
	                <label for="user-name">Username or email address<span style="color: #FF0000;">*</span></label>
	                <input type="text" id="user-name" name="username">
	            </div>
	            <div class="label-login password">
	                <label for="password">Password<span style="color: #FF0000;">*</span></label>
	                <input type="password" id="password" name = "password">
	            </div>
	            <div class="remember-me">
	                <input type="checkbox" id="remember-me">
	                <label for="remember-me">Remember me</label>
	            </div>
	            <div class="login-nav">
	                <button type="submit">LOG IN</button>
	                <a href="#">Lost your password?</a>
	            </div>
	        </div>
	    </div>
    </form>
	<!-- Footer -->
    <jsp:include page="common/footer.jsp"/>
    
    <!--Javascript code-->
    <script src="javascript/main.js"></script>
    <script src="javascript/show-hide-cart.js"></script>
    
</body>
</html>