<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="side-bar-container">
		<div class="price-filter-container">
			<p>Filter by price</p>
			<div class="price-range-slider">
				<div class="min-max-range">
					<div class="slider-track"></div>
					<input type="range" min="10" max="50" value="10" class="min-range"
						id="min"> <input type="range" min="10" max="50" value="50"
						class="max-range" id="max">
				</div>
				<div class="min-max">
					<div id="input-min">$10</div>
					<div id="input-max">$50</div>
				</div>
			</div>
			<div class="reset-button">
				<button id="reset">RESET</button>
			</div>
		</div>
		<div class="categories-container">
			<h4>Categories</h4>
			<div>
				<a href="#">Cactus <span>(6)</span></a> <a href="#">Plants <span>(6)</span></a>
			</div>
		</div>
		<div class="hottest-deal-container">
			<h3>Hottest Deals</h3>
			<div class="hottest-product-container">
				<div class="product">
					<img style="width: 100%;" src="images/plant1-free-img.jpg" alt="">
					<p class="product-name">Money Plant</p>
					<p class="price">$20.00</p>
				</div>
			</div>
			<div class="hottest-product-container">
				<div class="product">
					<img style="width: 100%;" src="images/plant5-free-img.jpg" alt="">
					<p class="product-name">Green Soil Lotus</p>
					<p class="price">$34.00</p>
				</div>
			</div>
			<div class="hottest-product-container">
				<div class="product">
					<img style="width: 100%;" src="images/cactus6-free-img.jpg" alt="">
					<p class="product-name">Star Cactus</p>
					<p class="price">$30.00</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>