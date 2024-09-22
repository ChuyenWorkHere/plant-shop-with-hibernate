/* || Image zoom */
var image_area = document.getElementById("image-area");
var image_zoom = document.getElementById("image-zoom");

image_area.addEventListener("mousemove", function (event) {
    clientX = event.clientX - image_area.offsetLeft;
    clientY = event.clientY - image_area.offsetTop;

    mWidth = image_area.offsetWidth;
    mHeight = image_area.offsetHeight;

    clientX = clientX / mWidth * 100;
    clientY = clientY / mHeight * 100;
    image_zoom.style.transform = 'translate(-' + clientX + '%, -' + clientY + '%) scale(2)';
});
image_area.addEventListener("mouseleave", function () {
    image_zoom.style.transform = 'scale(1)';
});

/* || Description and review */
const plant_description = document.querySelectorAll(".option-user h4"),
    border_top = document.querySelectorAll(".option-user div"),
    desciption_container = document.querySelector(".des-and-review .desciption-container"),
    review_container = document.querySelector(".des-and-review .review-container");

review_container.style.display = "none";
border_top[1].style.display = "none";

plant_description[0].addEventListener('click', function () {
    review_container.style.display = "none";
    border_top[1].style.display = "none";
    desciption_container.style.display = "inline-block";
    border_top[0].style.display = "inline-block";
})
plant_description[1].addEventListener('click', function () {
    desciption_container.style.display = "none";
    border_top[0].style.display = "none";
    review_container.style.display = "block";
    border_top[1].style.display = "inline-block";
})

/* || Star rating */
const stars = document.querySelectorAll(".stars i"),
    stars_box = document.querySelector(".user-rating-star .stars");

stars.forEach((star, index1) => {
    star.addEventListener("click", () => {
        console.log(index1);
        stars_box.style.direction  === "ltr";
        stars.forEach((star, index2) => {
            index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
        })
    })

})
