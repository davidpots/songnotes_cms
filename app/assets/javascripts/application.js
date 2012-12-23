// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$("#chords_show_once").click(function(){
		$(this).toggleClass("active");
		$("#chords_show_none").removeClass("active");
		$("#chords_show_all").removeClass("active");
		return false;
	});
});

$(document).ready(function(){
	$("#chords_show_none").click(function(){
		$(this).toggleClass("active");
		$("#chords_show_once").removeClass("active");
		$("#chords_show_all").removeClass("active");
		return false;
	});
});

$(document).ready(function(){
	$("#chords_show_all").click(function(){
		$(this).toggleClass("active");
		$("#chords_show_none").removeClass("active");
		$("#chords_show_once").removeClass("active");
		return false;
	});
});

$(document).ready(function(){
	$("#cpanel_toggle").click(function(){
	  $(this).toggleClass("active");
	  $('#cpanel_arrow').toggle();
		$(".cpanel").toggleClass("active").toggle();
		return false;
	});
});

