<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    HttpSession ss = request.getSession();
    if (ss == null || ss.getAttribute("user") == null) {
        response.sendRedirect("login");
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
    
    <!-- Bill -->
        <section class="profile-container">
        	<div class = "profile-avt">
        		<img src="${u.userAvatar}" alt="">
        		<div class = "profile">
        			<h4>${u.fName} ${u.lName}</h4>
        			<span>@${u.userName}</span>
        		</div>
        	</div>
        	<div>
        		<h4 class="profile-title">User settings</h4>
        		<form action="account" method="post">
                    <div class="name-user">
                        <div class="input-user">
                            <label for="first-name">First Name<span> *</span></label>
                            <input type="text" name="first-name" required value="${u.fName}">
                        </div>
                        <div class="input-user">
                            <label for="last-name">Last Name<span> *</span></label>
                            <input type="text" name="last-name" required value="${u.lName}">
                        </div>
                    </div>
                    <div class="input-user">
                        <label for="com-name">Company Name (optional)</label>
                        <input type="text" name="com-name" value="${u.company}">
                    </div>
                    <div class="input-user">
                        <label for="country">Country / Region<span>*</span></label>
                        <input type="text" name="country" required value="${u.country}">
                    </div>
                    <div class="input-user address">
                        <label for="address">Street address<span> *</span></label>
                        <input type="text" name="address" required placeholder="House number and street name" value="${u.address}">
                        <input type="text" name="optional-address"
                            placeholder="Apartment, suite, unit, etc. (optional)">
                    </div>
                    <div class="input-user">
                        <label for="town">Town / City<span> *</span></label>
                        <input type="text" name="town" required value="${u.city}">
                    </div>
                    <div class="input-user">
                        <label for="phone">Phone<span> *</span></label>
                        <input type="text" name="phone" required value="${u.phone}">
                    </div>
                    <div class="input-user">
                        <label for="email">Email address<span> *</span></label>
                        <input type="text" name="email" required value="${u.email}">
                    </div>
                    <button type="submit">UPDATE</button>
             </form>
        	</div>
        </section>

	
	<!-- Footer -->
    <jsp:include page="common/footer.jsp"/>
    
    <!--Javascript code-->
    <script src="javascript/main.js"></script>
    <script src="javascript/show-hide-cart.js"></script>
    
</body>
</html>