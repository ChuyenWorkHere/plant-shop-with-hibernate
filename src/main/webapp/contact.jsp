<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Contact - Simply Natural</title>
	<link rel="icon" href="images/plants-store-logo-green.svg" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="styles/contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
	<!--First Part of Home Page-->
    <div class="header-container">
        <!-- Header navigate -->
    	<jsp:include page="common/header-nav.jsp"/>
    	
    	 <!--Start opening part-->
        <div class="opening-part">
            <div class="opening-adver">
                Contact Us
            </div>
        </div>
    </div>
    
    <!--Cart -->
    <jsp:include page="common/cart-embedded.jsp"></jsp:include>
    
    <!--Start contact details information-->
    <div class="contact-detail-container">
        <div class="contact-detail">
            <h3>Contact Details</h3>
            <div class="contact-info">
                <div class="contact-location contact">
                    <i class="fa-solid fa-location-dot" style="color: #fc5f5f;"></i>
                    <div class="info-container">
                        <h4>Our Location</h4>
                        <p>1569 2nd Ave, New York,
                            NY 10028, USA​</p>
                    </div>

                </div>
                <div class="contact-phone-number contact">
                    <i class="fa-solid fa-phone" style="color: #fc5f5f;"></i>
                    <div class="info-container">
                        <h4>Call Us</h4>
                        <p>+123 456 7890 <br>
                            +123 456 7891</p>
                    </div>

                </div>
                <div class="contact-email contact">
                    <i class="fa-solid fa-envelope" style="color: #fc5f5f;"></i>
                    <div class="info-container">
                        <h4>Our Email</h4>
                        <p>
                            info@example.com<br>
                            support@example.com
                        </p>
                    </div>

                </div>
            </div>
            <div class="contact-send-meassage">
                <h3>Send Us a Message</h3>
                <input type="text" placeholder="Name">
                <input type="text" placeholder="Email">
                <input type="text" placeholder="Subject">
                <textarea rows="5" placeholder="Message"></textarea>
                <button class="send-meassage-btn">SEND MESSAGE</button>
            </div> 
        </div>
        <div class="contact-map">
            <h3>Find Us</h3>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.473788451511!2d105.73253187489014!3d21.053730980601816!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345457e292d5bf%3A0x20ac91c94d74439a!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2hp4buHcCBIw6AgTuG7mWk!5e0!3m2!1svi!2s!4v1720778914377!5m2!1svi!2s"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
                <a href="#" class="map-navigation">
                    <i class="fa-solid fa-location-arrow"></i> OPEN MAP NAVIGATION</a>
        </div>
    </div>
    
    <!-- Footer -->
    <jsp:include page="common/footer.jsp"/>
    
    <!--Javascript code-->
    <script src="javascript/main.js"></script>
    <script src="javascript/show-hide-cart.js"></script>
</body>
</html>