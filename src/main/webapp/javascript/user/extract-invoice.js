$(document).ready(function() {
	$('.gen').on('click', function(event) {
		event.preventDefault();
		
		var url = $(this).attr('href');

	    var urlParams = new URL(url, window.location.origin);
	           
	    var oID = urlParams.searchParams.get("id");
		
		$.ajax({
			url : 'get-invoice',
			method : 'POST',
			data : "id=" + oID,
			success : function(data) {
				$('#name-user').text(data.order.fName + " " + data.order.lName);
				$('#address').html(data.order.address +', <br> '+data.order.city + ',' +data.order.country+' <br>');
				$('#oID').text(data.order.orderID);
				$('#oDate').text(data.order.orderDate);
				var billContent = '';
		        $.each(data.product, function(index, p) {
		        	billContent += '<tr>' +
		                          '<td>' + (index + 1) + '</td>' +
		                          '<td>' + p.pName + '</td>' +
		                          '<td>$' + p.pPrice + '</td>' +
		                          '<td>' + p.pQuantity + '</td>' +
		                          '<td>$' + (p.pPrice * p.pQuantity).toFixed(2) + '</td>' +
		                          '</tr>';
		        });
		        $('#bill-print').html(billContent);
		        $('#sub-total').text('$' + data.total);
		        $('#total').text('$'+data.total);
			},
			
			error : function(error) {
				console.error("Error:", error);
			}
		});
	});
});