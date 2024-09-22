/**
 * 
 */
$('#comment-submit').click (
		function(event) {
			var review = $('#review').val();
			var name = $('#name').val();
			var email = $('#email').val();
			const pID = $('#pID').val();
			const star = document.querySelector('input[name="rating"]:checked');
			
			console.log(star);
			
			if (!star) {
		        alert('Please select a star rating.');
		        return;
		    }
			if (review.length < 4 || review.length > 255) {
		        alert('Name must be between 4 and 255 characters.');
		        return;
		    }
			if (name.length < 6 || name.length > 24) {
		        alert('Name must be between 6 and 24 characters.');
		        return;
		    }
			var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		    if (!emailPattern.test(email)) {
		        alert('Please enter a valid email address.');
		        return;
		    }
			var numberStar = star.value;
			console.log(numberStar);
			
			$.ajax({
				type : "GET",
				url : "review",
				data : "name=" + name + "&review=" + review + "&email="+ email + "&num=" + numberStar + "&pID=" + pID,
				success : function(data) {
					const content = document.getElementById("content");
					const form = document.getElementById("myForm");
					var noReview = document.querySelector('.review-container .no-review');
					var star = document.querySelector('.option-user h4 span');
					if (star) {
					    var currentValue = parseInt(star.textContent);
					    star.textContent = currentValue + 1;
					}
					content.innerHTML += data;
					form.style.display = "none";
					if(noReview) {
						noReview.style.display = "none";
					}
				},
				error : function(e) {
					alert("fail");
				}
			})
		}
		
)