// start of info related to image slide show and text content
var count = 0;
var images = ["freelanceme-msimonitsch1.png","freelanceme-msimonitsch2.png","freelanceme-msimonitsch3.png"]
var imageText = [
{h4: "User Dashboard", p: "This is the central hub where you can view and organize your business.  On the left is a calendar that will populate with jobs on their corresponding dates. You can add and subtract items from a to-do list. The right side is dedicated to client management. You can add clients and view them here. Clients can be viewed through he list or you can search by first name, last name or business name."},

	{h4: "Job Dashboard", p: "The Job Dashboard gives provides you with all the information about a specific job. Price, revenue, and profit are all tracked and displayed. Track payments by type, amount and date. The Balance will reflect any payments made. Add detailed expense reports with amount and date. Revenue will be adjusted with any changes to your expenses. To make a detailed invoice, add items to the Itemized Pricing module. You can generate PDF invoices by clicking the Print PDF button. You’ll find the Client and Job info as well as the itemized pricing for that job on the invoice. If you would like to email the client and invoice you can click the Email PDF link and it will be sent to the email of the client from your inbox. "},
	{h4: "Analytics", p: "Keep track of your business by using the Analytics page. All current year to date information such as gross income, revenue, payments , number of clients and jobs can be found here. There are two dynamic graphs here that visualize your per job amount and the average as well as  jobs per month."}] 

// function to change image and text to that image on nav right click
function slideShowRight(){
	$('#screen_shots').fadeOut(250);
	var imageEl = document.getElementById('screen_shots');
	var aboutH4 = document.getElementById('aboutH4');
	var aboutP = document.getElementById('aboutP'); 
	count++;
	if (count > 2){
		count = 0;
	}
	else if ( count < 0){
		count = 2
	}
	// setTimeout so that the animation has time to fade out before the content is switched
	window.setTimeout(function(){
		imageEl.setAttribute('src',images[count]);
	},250);
	// sets the h4 and p content from the array of objects
	aboutH4.innerHTML = imageText[count].h4;
	aboutP.innerHTML = imageText[count].p;
	$('#screen_shots').fadeIn(250);
};

// function to change image and text to that image on nav left click
function slideShowLeft(){
	$('#screen_shots').fadeOut(250);
	var imageEl = document.getElementById('screen_shots');
	var aboutH4 = document.getElementById('aboutH4');
	var aboutP = document.getElementById('aboutP');
	count--;
	if (count < 0){
		count = 2;
	}
	else if ( count > 2){
		count = 0;
	}
	// setTimeout so that the animation has time to fade out before the content is switched
	window.setTimeout(function(){
	imageEl.setAttribute('src',images[count]);
	},250);
	// sets the h4 and p content from the array of objects
	aboutH4.innerHTML = imageText[count].h4;
	aboutP.innerHTML = imageText[count].p;
	$('#screen_shots').fadeIn(250);
};