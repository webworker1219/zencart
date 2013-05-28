
(function($) {

//$.noConflict();
  
        function mainmenu(){
            $(" .dynamic_menu div ").hover(function(){
            $(this).find('div:first:hidden').show();
            },function(){
                $(this).find('div:first').css({display: "none"});
            });
                        
        }

        function hidePopups(actpopup){
            $('.popup').each(function() { 
                if ($(this).attr('id') != actpopup){
                    $(this).hide(); 
                }
           
            });
        }        

$(document).ready(function() {
//Currency switcher
        
		$("#currency_switcher").click(function(){
            hidePopups("currPopup");
            $("#currPopup").toggle();
            return false;
        });

//Language switcher        

        $("#language_switcher").click(function(){
            hidePopups("langPopup");
            $("#langPopup").toggle();
            return false;
        });
         
        mainmenu();
        


        
        $('.popup').click(function(e) {
            e.stopPropagation();
        });
        $(document).click(function() {
            $('.popup').hide();
        }); 
        $(".close-pic").click(function(){
            $('.popup').hide();
        }); 

        
});

})(jQuery);