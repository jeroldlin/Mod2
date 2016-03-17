window.onload = initialPage;

function initialPage(){
	startingEffects();
	navbarAutoCollapse();
}


function startingEffects(){
	$("#welcome").delay(500).fadeIn(1000);
	slideDownMenu();
	slideUpFooter();
	slideRightFooter();
	slideLeftFooterText();
	slideRightFooterText();
	aboutIn();
}

function slideDownMenu(){
	$("#Navbar").css({"top":"-50px", "width":"100%", "opacity":"0.2", "position":"fixed"});
	$("#Navbar").animate({top:0, opacity:1},1000);
}

function slideUpFooter(){
	$("footer").css({"bottom":"-50px", "width":"100%", "opacity":"0.2", "position":"fixed"});
	$("footer").animate({bottom:0, opacity:1},1000);
}

function slideRightFooter(){
	$("#rightFooter").css({"right":"-100%", "position":"fixed"});
	$("#rightFooter").delay(1000).animate({right:0},500);
}

function slideLeftFooterText(){
	$("#leftFooterText").css({"left":"-1000px", "position":"relative"});
	$("#leftFooterText").delay(0).animate({left:0},500);
}

function slideRightFooterText(){
	$("#rightFooterText").css({"right":"-1000px", "position":"relative"});
	$("#rightFooterText").delay(1000).animate({right:0},500);
}

function aboutIn(){
	$("#about").css({"opacity":"0"});
	$("#about").delay(4000).animate({opacity:1},0);
}

//Starting Effects

function navbarAutoCollapse(){
	$(document).ready(function(){
		$("#menuButton").blur(function(){
			setTimeout(function(){ $("#myNavbar").collapse("hide") }, 200);
		});
	});
	$(document).ready(function(){//overwrite bootstrap css --better for phone & desktop
		$("#menuButton").on('mouseenter', function () {
			$("#menuButton").css("background-color", "black");
		});
		$("#menuButton").on('mouseleave', function () {
			$("#menuButton").css("background-color", "#cc0000");
		});
		$("#myNavbar").on('hidden.bs.collapse', function () {
			$("#menuButton").css("background-color", "#cc0000");
			$("#menuButton").on('mouseleave', function () {
				$("#menuButton").css("background-color", "#cc0000");
			});
		});
		$("#myNavbar").on('show.bs.collapse', function () {
			$("#menuButton").css("background-color", "black");
			$("#menuButton").on('mouseleave', function () {
				$("#menuButton").css("background-color", "#cc0000");
			});
		});
	});

	$(document).on('page:load', function(){
		$("#menuButton").blur(function(){
			setTimeout(function(){ $("#myNavbar").collapse("hide") }, 200);
		});
	});
	$(document).on('page:load', function(){//overwrite bootstrap css --better for phone & desktop
		$("#menuButton").on('mouseenter', function () {
			$("#menuButton").css("background-color", "black");
		});
		$("#menuButton").on('mouseleave', function () {
			$("#menuButton").css("background-color", "#cc0000");
		});
		$("#myNavbar").on('hidden.bs.collapse', function () {
			$("#menuButton").css("background-color", "#cc0000");
			$("#menuButton").on('mouseleave', function () {
				$("#menuButton").css("background-color", "#cc0000");
			});
		});
		$("#myNavbar").on('show.bs.collapse', function () {
			$("#menuButton").css("background-color", "black");
			$("#menuButton").on('mouseleave', function () {
				$("#menuButton").css("background-color", "#cc0000");
			});
		});
	});
}//Menu button improvement

function footerUp(){
			if ($("#rightFooter").css("bottom") == "0px"){
				var abc = 1;
				$("#rightFooter").delay(0).animate({bottom:50},1000);
				$("#leftFooter").delay(0).animate({bottom:50},1000);
			}else{
				$("#rightFooter").delay(0).animate({bottom:0},1000);
				$("#leftFooter").delay(0).animate({bottom:0},1000);
			}

}