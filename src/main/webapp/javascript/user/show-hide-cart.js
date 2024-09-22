/* || Cart */
const cart_1 = document.getElementById("cart-1"),
cart_2 = document.getElementById("cart-2"),
wrapper = document.querySelector(".wrapper"),
body = document.querySelector("body"),
shopping_cart = document.querySelector(".shopping-container"),
xButton = document.getElementById("hide-cart");
function showCart(){
    body.style.overflow = "hidden";
    wrapper.style.display = "block";
    shopping_cart.style.right = "0";
}
function hideCart(){
    body.style.overflow = "visible";
    wrapper.style.display = "none";
    shopping_cart.style.right = "-1000px";
}
cart_1.addEventListener("click", showCart);
cart_2.addEventListener("click", showCart);
xButton.addEventListener("click", hideCart);