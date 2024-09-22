const button = document.getElementById("show-input"),
inputCoupon = document.querySelector(".coupon-container .coupon-input-user"),
order = document.querySelector(".order-container");

button.addEventListener("click", function(){
    if(inputCoupon.style.opacity === "0" || inputCoupon.style.opacity === ""){
        order.style.transform = "translateY(10%)";
        order.style.paddingBottom = "9%";
        inputCoupon.style.opacity = "1";
        inputCoupon.style.pointerEvents = "auto";
    } else {
        order.style.transform = "translateY(0)";
        inputCoupon.style.opacity = "0";
        inputCoupon.style.pointerEvents = "none";
        console.log("Hello");
    }
    
})