$(function(){
				// Trigger maximage
				jQuery('#maximage').maximage();
			});
			 $(function(){
                    $('#signup-nav').hover(function(){
                        $(this).animate({width:'200px'},500);
                        $('#start').hide();
                        $('#start-btn').show();
                    },function(){
                        $(this).animate({width:'35px'},500);
                        $('#start').show();
                        $('#start-btn').hide();
                    }).trigger('mouseleave');
                })
