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
//= require_tree .

$(function(){

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
	$("#show_jobs").on('click',
		function(e){
			e.preventDefault();
			// $('.client_job_list').toggle(100);
			$(this).parent().next().toggle(100);
		});
	$('.all_clients').on('click', 
		function(){
			$('.all_clients').css('border', '1px solid #888');
			$('.all_clients').css('display', 'block');
			$('.search_results').css('border', '1px solid #ccc');
			$('.search_results').css('display', 'none');

		});
	$('.search_results').on('click',
		function(){
			$('.all_clients').css('border', '1px solid #ccc');
			$('.all_clients').css('display', 'none');
			$('.search_results').css('border','1px solid #888');
			$('.search_results').css('display','block');
		});

	
});