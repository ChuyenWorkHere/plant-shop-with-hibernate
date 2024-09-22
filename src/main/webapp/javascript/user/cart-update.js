/* || Coupon code */
const applyButton1 = document.getElementById("apply-button-1"),
applyButton2 = document.getElementById("apply-button-2"),
couponCode1 = document.getElementById("coupon-code-1"),
couponCode2 = document.getElementById("coupon-code-2"),
numPlant1 = document.querySelectorAll(".num1"),
numPlant2 = document.querySelectorAll(".num2"),
updateSuccess = document.querySelector(".noti-update-wrapper .noti-success"),
updateFail = document.querySelector(".noti-update-wrapper .noti-fail"),
couponSuccess = document.querySelector(".noti-coupon-wrapper .noti-success"),
couponFail = document.querySelector(".noti-coupon-wrapper .noti-fail"),
updateButton = document.querySelectorAll(".update-button");


//function solveCoupon(code){
//    if(code === "saleadmin") {
//        couponSuccess.style.display = "flex";
//        updateSuccess.style.display = "none";
//        updateFail.style.display = "none";
//        couponFail.style.display = "none";
//    } else {
//        couponSuccess.style.display = "none";
//        updateSuccess.style.display = "none";
//        updateFail.style.display = "none";
//        couponFail.style.display = "flex";
//    }
//}
//applyButton1.addEventListener("click", function(){
//    const couponCode = couponCode1.value;
//    solveCoupon(couponCode);
//})
//applyButton2.addEventListener("click", function(){
//    const couponCode = couponCode2.value;
//    solveCoupon(couponCode);
//})

/* || Update cart */
numPlant1.forEach((element) => {
	element.addEventListener("input", function(){
	    updateButton[0].style.opacity = "1";
	    updateButton[0].classList.add("allowed-button");
	    updateButton[0].classList.remove("not-allowed-button");
	});
});

numPlant2.forEach((element) => {
	element.addEventListener("input", function(){
	    updateButton[1].style.opacity = "1";
	    updateButton[1].classList.add("allowed-button");
	    updateButton[1].classList.remove("not-allowed-button");
	});
})

$(document).ready(function() {
	$('.cart-table').on('click', 'a.remove-plant', function(event) {
		event.preventDefault();

	    var url = $(this).attr('href');

	    var urlParams = new URL(url, window.location.origin);
	           
	    var pID = urlParams.searchParams.get("pID");
	            
	    $.ajax({
	        url: 'delete',
	        method: 'POST',
	        data: "pID="+ pID,
	        success: function(data) {
	        	if(data.result === "success") {
	        		
	        		//Remove plant
	        		$('#cart-content').find('div#' + pID).remove();
	        		$('.cart-table').find("tbody#" + pID).remove();
	        		$('.cart-table-responsive').find("tbody#" + pID).remove();
	        		$(".sub-total").text("$" +data.total);
	        		$(".in-total").text("$" +data.total);
	        		
	        		//Display notification
	        		$(".noti-update-wrapper .noti-success .notifi-updated").text( "Cart updated!");
	        		$(".noti-update-wrapper .noti-success .product-delete").text( "\""+data.name + "\" removed!");
	        		$(".noti-update-wrapper .noti-success").css("display", "block");
	        		
	        		var numberProduct = document.querySelectorAll(".number-prod");
	                var total = document.querySelectorAll(".total-money");
	                var content = document.getElementById('cart-content');
	                var subtotal = document.querySelector(".price-total");
	                
	                
	                total[0].textContent = "$" +data.total;
	                total[1].textContent = "$" +data.total;
	                subtotal.textContent = "$" + data.total;
	                numberProduct[0].textContent = data.num - 1;
	            	numberProduct[1].textContent = data.num - 1;
	            	
	            	if(data.num === 1 ) {
	            		const showC = document.querySelectorAll(".same-condition");
	                    const tot = document.querySelector('div#price');
	                    const continueBtn = document.querySelector('#continue');
	                    var emptyCart = document.querySelector(".no-product");
	                    showC[0].style.display = "none";
	                    showC[1].style.display = "none";
	                    tot.style.display = "none";
	                    emptyCart.style.display = "block";
	                    continueBtn.style.display = "inline";
	                    $(".cart-noti .empty-cart").css("display", "flex");
	                    $(".cart-checkout").css("display", "none");
	                    $(".cart-table-responsive").css("display", "none");
	                    $(".cart-table").css("display", "none");
	            	} else {
	            		$(".cart-noti .empty-cart").css("display", "none");
	            	}
	            	
	        	}
	            
	        },
	        error: function(error) {
	            console.error("Error:", error);
	        }
	    });
    });
	$('.cart-table-responsive').on('click', 'a.remove-plant', function(event) {
		event.preventDefault();

	    var url = $(this).attr('href');

	    var urlParams = new URL(url, window.location.origin);
	           
	    var pID = urlParams.searchParams.get("pID");
	            
	    $.ajax({
	        url: 'delete',
	        method: 'POST',
	        data: "pID="+ pID,
	        success: function(data) {
	        	if(data.result === "success") {
	        		
	        		//Revome plant 
	        		$('#cart-content').find('div#' + pID).remove();
	        		$('.cart-table').find("tbody#" + pID).remove();
	        		$('.cart-table-responsive').find("tbody#" + pID).remove();
	        		$(".sub-total").text("$" +data.total);
	        		$(".in-total").text("$" +data.total);
	        		
	        		//Display notification
	        		$(".noti-update-wrapper .noti-success .notifi-updated").text( "Cart updated!");
	        		$(".noti-update-wrapper .noti-success .product-delete").text( "\""+data.name + "\" removed!");
	        		$(".noti-update-wrapper .noti-success").css("display", "block");
	        		
	        		
	        		//Changes applied in Cart side bar
	        		var numberProduct = document.querySelectorAll(".number-prod");
	                var total = document.querySelectorAll(".total-money");
	                var content = document.getElementById('cart-content');
	                var subtotal = document.querySelector(".price-total");
	                
	                
	                total[0].textContent = "$" +data.total;
	                total[1].textContent = "$" +data.total;
	                subtotal.textContent = "$" + data.total;
	                numberProduct[0].textContent = data.num - 1;
	            	numberProduct[1].textContent = data.num - 1;
	            	
	            	if(data.num === 1 ) {
	            		const showC = document.querySelectorAll(".same-condition");
	                    const tot = document.querySelector('div#price');
	                    const continueBtn = document.querySelector('#continue');
	                    var emptyCart = document.querySelector(".no-product");
	                    showC[0].style.display = "none";
	                    showC[1].style.display = "none";
	                    tot.style.display = "none";
	                    emptyCart.style.display = "block";
	                    continueBtn.style.display = "inline";
	                    $(".cart-noti .empty-cart").css("display", "flex");
	                    $(".cart-checkout").css("display", "none");
	                    $(".cart-table-responsive").css("display", "none");
	                    $(".cart-table").css("display", "none");
	            	} else {
	            		$(".cart-noti .empty-cart").css("display", "none");
	            	}
	            	
	        	}
	            
	        },
	        error: function(error) {
	            console.error("Error:", error);
	        }
	    });
    });
});