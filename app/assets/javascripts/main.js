// ----------------------------------------------------------------------------
// Detect Screensize + Add class to <html>
// ----------------------------------------------------------------------------

        // Change width value on page load
        $(document).ready(function(){
            responsive_resize();
        });

        // Change width value on user resize, after DOM
        $(window).resize(function(){
             responsive_resize();
        });

        function responsive_resize(){
          var current_width = $(window).width();
          if(current_width < 1028){
            $('html').addClass("screen_small").removeClass("scree_large");
            if ( !($('#navburger').hasClass('open')) ) {
              $('#drawer').hide();
            }
          } 
          if(current_width > 1028){
            $('html').addClass("screen_large").removeClass("screen_small");
            $('#drawer').show();
          }
        }

// ----------------------------------------------------------------------------
// Fast Click! via https://github.com/ftlabs/fastclick
// ----------------------------------------------------------------------------
        
        window.addEventListener('load', function() {
            FastClick.attach(document.body);
        }, false);

// ----------------------------------------------------------------------------
// Misc document.ready()
// ----------------------------------------------------------------------------

      $(document).ready(function(){
      
          // Ghetto HTML2JSON Setup for the alpha API
          $('#json_convert').click( function() { 
            var table = $('#json_table').tableToJSON();
            document.getElementById('target').innerHTML = JSON.stringify(table);
          });

          // Nav Drawer Open/Close
          $("#navburger").click(function(){
            $("#drawer").toggle();
            $(this).toggleClass('open');
          });

          // Make embedded videos responsive - via http://webdesignerwall.com/tutorials/css-elastic-videos
          $('#videos iframe').wrap('<div class="video-wrapper"><div class="video-container"></div></div>')
          var videos = $('#videos iframe');
          var size;
          $.each(videos, function() {
            size = $(this).attr('width');
            $(this).parent().parent().css('width',size);
          } );

      });