/**
 * 
 */
$(document).ready(function() {
	$('#cart-content').on('click', 'a.remove', function(event) {
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
            		
            		$('#cart-content').find('div#' + pID).remove();
            		
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
                	}
                	
            	}
                
            },
            error: function(error) {
                console.error("Error:", error);
            }
        });
    });
});