$(document).ready(function() {
	$('.apply-button').on('click', function(event) {
        event.preventDefault();
        
        const inputUser1 = document.getElementById("coupon-code-1");
        const inputUser2 = document.getElementById("coupon-code-2");
        if( !inputUser1 && !inputUser2 ) {
        	alert("Coupon cannot be empty");
        } else {
        	
        	let input = "";
            if (inputUser1 && inputUser1.value.trim() !== "") {
                input = inputUser1.value.trim();
            } else if (inputUser2 && inputUser2.value.trim() !== "") {
                input = inputUser2.value.trim();
            }
        	
        	$.ajax({
                url: 'apply-coupon',
                method: 'POST',
                data: "coupon="+ input,
                success: function(data) {
                	
                    
                },
                error: function(error) {
                    console.error("Error:", error);
                }
            });
        }
    });
});