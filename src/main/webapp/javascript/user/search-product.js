/**
 * 
 */
/* || Range price slider */
const rangeInput = document.querySelectorAll(".min-max-range input"),
    progress = document.querySelector(".min-max-range div"),
    reset_button = document.getElementById("reset");

let priceGap = 6;
rangeInput.forEach(input => {
    input.addEventListener("input", e => {
        // Lấy 2 giá trị max min và chuyển nó về dạng số
        let minVal = parseInt(rangeInput[0].value),
            maxVal = parseInt(rangeInput[1].value);

        if (maxVal - minVal < priceGap) {
            if (e.target.className === "min-range") {
                rangeInput[0].value = maxVal - priceGap;
            } else {
                rangeInput[1].value = minVal + priceGap;
            }
        } else {
            document.getElementById("input-min").textContent = "$" + minVal + "";
            document.getElementById("input-max").textContent = "$" + maxVal + "";
            progress.style.left = ((minVal - rangeInput[0].min) / (rangeInput[0].max - rangeInput[0].min)) * 100 + "%";
            progress.style.right = 100 - ((maxVal - rangeInput[0].min) / (rangeInput[0].max - rangeInput[0].min)) * 100 + "%";
        }
        if (minVal !== rangeInput[0].min || maxVal !== rangeInput[0].max) {
            reset_button.style.opacity = "1";
            reset_button.style.pointerEvents = 'auto';
        } else {
            reset_button.style.opacity = "0";
        }
        console.log(rangeInput[0].value, rangeInput[1].value);
        
        let minPrice = parseInt(rangeInput[0].value),
        maxPrice = parseInt(rangeInput[1].value),
        cate = document.getElementById("cate").value;
        
        $.ajax({
            url: 'search',
            method: 'GET',
            data: "min="+ minPrice + "&max=" + maxPrice+"&cate="+cate,
            success: function(data) {
            	console.log(data);
                $(".product-container").html(data);
                $(".related-content span").text("");
            },
            error: function(error) {
            	alert("Something went wrong. Please try again");
                console.error("Error:", error);
            }
        });
        
        
    });
    
})

reset_button.addEventListener('click', function () {
     rangeInput[0].value = rangeInput[0].min;
     rangeInput[1].value = rangeInput[0].max;
     progress.style.left = "0";
     progress.style.right = "0";
     document.getElementById("input-min").textContent = "$" + rangeInput[0].min + "";
     document.getElementById("input-max").textContent = "$" + rangeInput[0].max + "";
     reset_button.style.opacity = "0";
     reset_button.style.pointerEvents = 'none';
     
     let minPrice = parseInt(rangeInput[0].value),
     maxPrice = parseInt(rangeInput[1].value),
     cate = document.getElementById("cate").value;
     
     $.ajax({
         url: 'search',
         method: 'GET',
         data: "min="+ minPrice + "&max=" + maxPrice+"&cate="+cate,
         success: function(data) {
         	console.log(data);
             $(".product-container").html(data);
             $(".related-content span").text("");
         },
         error: function(error) {
         	alert("Something went wrong. Please try again");
             console.error("Error:", error);
         }
     });
});