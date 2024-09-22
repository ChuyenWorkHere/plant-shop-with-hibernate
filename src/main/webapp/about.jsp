<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>About Us - Simply Natural</title>
	<link rel="icon" href="images/plants-store-logo-green.svg" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="styles/about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<body>
	<!--Header-->
    <div class="header-container">
        <!--Start navigate bar-->
        <jsp:include page="common/header-nav.jsp"/>
        <!--End navigate bar-->

        <!--Start opening part-->
        <div class="opening-part">
            <div class="opening-adver">
                About Us
            </div>
        </div>
        <!--End openning part-->
    </div>

    <!--Cart -->
    <jsp:include page="common/cart-embedded.jsp"></jsp:include>
    
    <!--Information about us-->
    <div class="about-us-container">
        <div class="about-us-title">
            We Work Hard To Provide You The Best Quality Plants And Succulents
        </div>
        <div class="about-us-content-container">
            <div class="about-us-content">
                It is a long established fact that a reader will be distracted by the readable content of a page when
                looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal. It is a long
                established fact that a reader will be distracted by the readable content of a page when looking at its
                layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as
                opposed to using.
            </div>
            <button class="read-more-btn">
                READ MORE
            </button>
        </div>
    </div>

	<!--Information about company-->
    <div class="about-company-container">
        <div class="about-company-title">
            Our Company
        </div>
        <div class="about-company-content">
            <p>
                I am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur
                adipiscing
                elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo, when an unknown printer took
                a
                galley.
            </p>

        </div>
        <img src="images/bg4-free-img.jpg" alt="">
        <div class="main-company-content-container">
            <div class="paragraph">It is a long established fact that a reader will be distracted by the readable
                content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a
                more-or-less normal distribution of letters, as opposed to using ‘Content here, content here’, making it
                look like readable English. Many desktop publishing packages and web page editors</div>
            <div class="paragraph">There are many variations of passages of Lorem Ipsum available, but the majority have
                suffered alteration in some form, by injected humour, or randomised words which don't look even slightly
                believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t anything
                embarrassing hidden in the middle of text. </div>
        </div>
    </div>
    
    <!--Start information about team-->
    <div class="about-team-container">
        <div class="about-team-title">
            Our Team
        </div>
        <div class="about-team-content">
            <p>
                I am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur
                adipiscing
                elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo, when an unknown printer took
                a
                galley.
            </p>

        </div>
        <div class="main-founder-container">
            <div class="founder-container">
                <img src="images/teammate-1.png" alt="">
                <div class="founder-name">Jessica Gordon</div>
                <div class="founder-position">Co-Founder
                    <div class="line-through"></div>
                </div>

                <div class="social-link-founder">
                    <a href=""><i class="fa-brands fa-facebook-f"></i></a>
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
                    <a href=""><i class="fa-brands fa-square-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="founder-container">
                <img src="images/teammate-2.png" alt="">
                <div class="founder-name">Bryan Joes</div>
                <div class="founder-position">Co-Founder
                    <div class="line-through"></div>
                </div>
                <div class="social-link-founder">
                    <a href=""><i class="fa-brands fa-facebook-f"></i></a>
                    <a  href=""><i class="fa-brands fa-twitter"></i></a>
                    <a href=""><i class="fa-brands fa-square-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="founder-container">
                <img src="images/teammate-3-1.png" alt="">
                <div class="founder-name">Angella Mike</div>
                <div class="founder-position">Co-Founder
                    <div class="line-through"></div>
                </div>
                <div class="social-link-founder">
                    <a href=""><i class="fa-brands fa-facebook-f"></i></a>
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
                    <a href=""><i class="fa-brands fa-square-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </div>
    
    <!--Advertisement part-->
    <jsp:include page="common/advertisement.jsp"></jsp:include>
     
     <!-- Footer -->
    <jsp:include page="common/footer.jsp"/>
    
    <!--Javascript code-->
    <script src="javascript/main.js"></script>
    <script src="javascript/show-hide-cart.js"></script>
</body>
</html>