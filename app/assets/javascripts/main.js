$(document).ready(function(){

  // Masonry plugin
  var $container = $('#container');
  $container.masonry({
    itemSelector : '.contentBox',
    columnWidth : 314 
  });

  // Endless scroll
  (function(){

    //inner functions will be aware of this
    var currentPage = 1,
    currentXHR;

    $(window).scroll(function() {

        if($(window).scrollTop() + $(window).height() > $(document).height() - 500) {

          if (currentXHR) {
            return;
          }   

          currentXHR = $.ajax({
            type: "GET",
            url: "posts/page/" + currentPage++,
            data: "", 
            success: function(results){
              $("#container").append(results).masonry('reload');
            },  
            complete: function() {
              currentXHR = null;
            }   
          })  

        }   

      }); 

  })();

  // Submit on enter for posts/create/
  $(function(){
    $('input').keydown(function(e){
      if (e.keyCode == 13) {
        $(this).parents('form').submit();
        return false;
      }   
    }); 
  }); 
  
});
