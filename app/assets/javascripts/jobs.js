var paymentButton = document.getElementById('payment_button');
	paymentButton.addEventListener('submit', jobAjax());

var expenseButton = document.getElementById();
	expenseButton.addEventListener('submit', jobAjax());

function jobAjax(){
	$.ajax({
		type: "GET",
		contentType: "application/json; charset=utf-8",
		url: '',
		dataType: 'json',
		success: function(data){
			console.log(data)
		},
		error: function() {

		}
	});
}



