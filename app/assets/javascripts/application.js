// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require d3
//= require_tree .


$(function(){

	// fade flash message out
	$('#flashy').delay(1300).fadeOut(800);

	// ## modal pop up and close ###
	$('#add_client_button').on('click',
		function(){
			$('.outer_modal').fadeIn(150);
		});
	$("#add_client_submit").on('click',
		function(){
			$('.outer_modal').fadeOut(150);
		});
	$('.modal_close_button').on('click',
		function(){
			$('.outer_modal').fadeOut(150);
		});

	// ### show and hide jobs of each client on User/show ## 

	$("#show_jobs a").on('click',
		function(e){
			e.preventDefault();
			console.log("hereeeee")
			$(this).parent().nextAll().toggle(200);
		});

	// ### search bar menu click (All Clients) on User/show #### 
	$('.all_clients').on('click', 
		function(e){
			e.preventDefault();
			$('.all_clients').css('background-color', '#fc755d');

			$('.all_clients a').css('color', '#ffffff');

			$('.all_clients').css('border', 'none');

			// $('.all_clients').css('width', '70%');

			$('.search_results').css('background-color', '#ffffff');

			$('.search_results').css('border', '1px solid #ccc');

			// $('.search_results').css('width', '30%');

			$('.search_results').css('border-left', 'none');

			$('.search_results a').css('color', '#888');

			// $('#all_client_list').css('display', 'block');
			$('#all_client_list').delay(100).fadeIn(100);
			
			// $('#client_search_wrapper').css('display', 'none');
			$('#client_search_wrapper').fadeOut(100);

		});

	// ### search bar menu click (Search Clients) on User/show #### 
	$('.search_results').on('click',
		function(e){
			e.preventDefault();
			$('.all_clients').css('background-color', '#ffffff');

			$('.all_clients a').css('color', '#888');

			$('.all_clients').css('border', '1px solid #ccc');

			$('.all_clients').css('border-right', 'none');

			$('.search_results').css('background-color', '#fc755d');

			$('.search_results a').css('color', '#ffffff');

			$('.search_results').css('border', 'none');

			$('#all_client_list').fadeOut(100);
			
			$('#client_search_wrapper').delay(100).fadeIn(100);
		});

	// hide and show client edit form on client/edit
	$('#edit_client_form_show').on('click',
		function(e){
			e.preventDefault();
			$('.edit_client_form').slideToggle();
		});

	// Refreshed jobs balance bar on button press 

	$('#payment_button,#expense_button').on('submit', 
		function(e){
			e.preventDefault();
			console.log("heeeerrree")
			$('#job_price_balance').delay(100).html("<%= j render(partial: 'jobs/job_price_balance')%>");
		});

	

	
});