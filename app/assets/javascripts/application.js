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
//= require ios-orientationchange-fix
//= require_tree .

$(document).ready(function(){

  // HTML-to-JSON plugin for API beta
  $('#json_convert').click( function() { 
    var table = $('#json_table').tableToJSON();
    document.getElementById('target').innerHTML = JSON.stringify(table);
  });

  // The dropdown in the global nav for showing / hiding the "follow" contents
  $(".pri_nav li.dropdown_reveal").click(function(){
    $(this).toggleClass('open');
    $('li.dropdown_itself').toggleClass('visible');
    return false;
  });
  $(".pri_nav li.dropdown_itself a").click(function(){
    $('.pri_nav li.dropdown_reveal').toggleClass('open');
    $('li.dropdown_itself').toggleClass('visible');
  });

  // The song stickynav
  var nav = $('.song-nav');
  var navHeight = nav.outerHeight();
  var aboveFold = nav.offset().top;
  var y = $('.song-show').outerHeight();
  $(window).scroll(function(){
      if ($(window).scrollTop() > aboveFold){
        $('.song-nav').css('top',0).addClass('fixed');
        $('body').css('margin-top',navHeight);
      } else { 
        $('.song-nav').css('top',aboveFold).removeClass('fixed');
        $('body').css('margin-top',0);
      }
      if ($(window).scrollTop() > y){
        $('.song-nav').removeClass('fixed');
        $('body').css('margin-top',0);
      }
  });

  // Song wayfinding
  $(window).scroll(function () {
    var inview = '#' + $('section:in-viewport:first h2').parent().attr('id'),
      $link = $('.song-nav a').filter('[href="' + inview + '"]');
      if ($link.length && !$link.is('.active')) {
        $('.song-nav a').removeClass('active');
        $link.addClass('active');    
      }
  });
});


// Parallax scroll for homepage
$(document).scroll(function(){
	s = $(document).scrollTop();
	$('.home_intro').css('-webkit-transform', 'translateY(' + (s/5) + 'px)');
});