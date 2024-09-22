/**
 * 
 */

$(document).ready(function() {
    $('.add').on('click', function(event) {
        event.preventDefault();

        var url = $(this).attr('href');

        var urlParams = new URL(url, window.location.origin);
               
        var pID = urlParams.searchParams.get("pID");
        
        const inputNumber = document.querySelector('input[name="num-to-cart"]');
        
        var num = 1;
        
        if(inputNumber !== null){
        	num = parseInt(inputNumber.value);
        }
        
        console.log(num);
        
        $.ajax({
            url: 'add',
            method: 'POST',
            data: "pID="+ pID + "&num="+num,
            success: function(data) {
       
            	
                var numberProduct = document.querySelectorAll(".number-prod");
                var total = document.querySelectorAll(".total-money");
                var subtotal = document.querySelector(".price-total");
                var emptyCart = document.querySelector(".no-product");
                
                total[0].textContent = "$" +data.total;
                total[1].textContent = "$" +data.total;
                subtotal.textContent = "$" + data.total;
                
                var newCart = "<div id=\""+data.product.id+"\" class=\"product-wrapper\">\r\n" + 
				"						<div class=\"plant-cart\">\r\n" + 
				"							<img src=\" "+ data.product.image+"\" alt=\"\">\r\n" + 
				"							<div class=\"info-cart-wrapper\">\r\n" + 
				"								<div>\r\n" + 
				"									<a href=\"product-detail?id="+data.product.id+"\" class=\"name\">"+data.product.name +"</a>\r\n" + 
				"									<p id=\""+data.product.id+"\" class=\"price\">"+data.product.quantity+" &Cross; $"+ data.product.salePrice+"</p>\r\n" + 
				"								</div>	\r\n" + 
				"								<a href=\"delete?pID="+data.product.id+"\" class=\"remove\" >&Cross;</a>" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"					</div>";
                
                if(!data.exist) {
                	numberProduct[0].textContent = data.numProduct;
                	numberProduct[1].textContent = data.numProduct;
                	$('#cart-content').append(newCart);
                } else {
                	var price = document.querySelector("p#"+data.product.id);
                	var numPro = data.product.quantity;
                	price.innerHTML = numPro +" &Cross; $"+ data.product.salePrice;
                }
                
                const showC = document.querySelectorAll(".same-condition");
                const tot = document.querySelector('div#price');
                const continueBtn = document.querySelector('#continue');
                showC[0].style.display = "inline";
                showC[1].style.display = "inline";
                tot.style.display = "flex";
                emptyCart.style.display = "none";
                continueBtn.style.display = "none";
                
                const fadeBox = document.querySelector(".suc-fade-box");
                if(data.isOver) {
                	$(".suc-fade-box .success-ele").html("Quantity added over quantity in stock!<br>You'll add all available quantities to the cart.")
                	fadeBox.style.opacity = 1;
                    setTimeout(() => {
                    	fadeBox.style.opacity = 0;
                    }, 3000);
                } else {
                	$(".suc-fade-box .success-ele").text("\""+data.product.name + "\" added to the cart!");
                	fadeBox.style.opacity = 1;
                    setTimeout(() => {
                    	fadeBox.style.opacity = 0;
                    }, 1000);
                }
                
            },
            error: function(error) {
            	const fadeBox = document.querySelector(".fail-fade-box");
            	fadeBox.style.opacity = 1;
                setTimeout(() => {
                	fadeBox.style.opacity = 0;
                }, 1000);
                console.error("Error:", error);
                
            }
        });
    });
    
    //For product after searching in category.jsp
    $(".product-container").on('click', 'a.add-to-cart', function(event) {
        event.preventDefault();

        var url = $(this).attr('href');

        var urlParams = new URL(url, window.location.origin);
               
        var pID = urlParams.searchParams.get("pID");
        
        const inputNumber = document.querySelector('input[name="num-to-cart"]');
        
        var num = 1;
        
        if(inputNumber !== null){
        	num = parseInt(inputNumber.value);
        }
        
        $.ajax({
            url: 'add',
            method: 'POST',
            data: "pID="+ pID + "&num="+num,
            success: function(data) {
            	
                const fadeBox = document.querySelector('.suc-fade-box');

                var numberProduct = document.querySelectorAll(".number-prod");
                var total = document.querySelectorAll(".total-money");
                var subtotal = document.querySelector(".price-total");
                var emptyCart = document.querySelector(".no-product");
                
                total[0].textContent = "$" +data.total;
                total[1].textContent = "$" +data.total;
                subtotal.textContent = "$" + data.total;
                
                var newCart = "<div id=\""+data.product.id+"\" class=\"product-wrapper\">\r\n" + 
				"						<div class=\"plant-cart\">\r\n" + 
				"							<img src=\" "+ data.product.image+"\" alt=\"\">\r\n" + 
				"							<div class=\"info-cart-wrapper\">\r\n" + 
				"								<div>\r\n" + 
				"									<a href=\"product-detail?id="+data.product.id+"\" class=\"name\">"+data.product.name +"</a>\r\n" + 
				"									<p id=\""+data.product.id+"\" class=\"price\">"+data.product.quantity+" &Cross; $"+ data.product.salePrice+"</p>\r\n" + 
				"								</div>	\r\n" + 
				"								<a href=\"delete?pID="+data.product.id+"\" class=\"remove\" >&Cross;</a>" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"					</div>";
                
                if(!data.exist) {
                	numberProduct[0].textContent = data.numProduct;
                	numberProduct[1].textContent = data.numProduct;
                	$('#cart-content').append(newCart);
                } else {
                	var price = document.querySelector("p#"+data.product.id);
                	var numPro = data.product.quantity;
                	price.innerHTML = numPro +" &Cross; $"+ data.product.salePrice;
                }
                
                const showC = document.querySelectorAll(".same-condition");
                const tot = document.querySelector('div#price');
                const continueBtn = document.querySelector('#continue');
                showC[0].style.display = "inline";
                showC[1].style.display = "inline";
                tot.style.display = "flex";
                emptyCart.style.display = "none";
                continueBtn.style.display = "none";
                
                if(data.isOver) {
                	$(".suc-fade-box .success-ele").html("Quantity added over quantity in stock!<br>You'll add all available quantities to the cart.")
                	fadeBox.style.opacity = 1;
                    setTimeout(() => {
                    	fadeBox.style.opacity = 0;
                    }, 3000);
                } else {
                	$(".suc-fade-box .success-ele").text("\""+data.product.name + "\" added to the cart!");
                	fadeBox.style.opacity = 1;
                    setTimeout(() => {
                    	fadeBox.style.opacity = 0;
                    }, 1000);
                }
            },
            error: function(error) {
            	const fadeBox = document.querySelector('.fail-fade-box');
            	fadeBox.style.opacity = 1;
                setTimeout(() => {
                    fadeBox.style.opacity = 0;
                }, 1000);
                console.error("Error:", error);
                
            }
        });
    });
});