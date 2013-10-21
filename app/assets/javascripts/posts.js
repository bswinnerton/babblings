$(document).ready(function(){

  // Masonry Layout
  var $container = $('.masonry');
  $container.imagesLoaded(function() {
    $container.masonry({
      itemSelector        : '.post-box',
      columnWidth         : '.post-box',
      transitionDuration  : 0
    });
  });

  // Endless Scroll
  var currentPage = 1, currentXHR;
  $(window).scroll(function() {
    if ($(window).scrollTop() + $(window).height() > $(document).height() - 500) {
      if (currentXHR) { return; }
      currentXHR = $.ajax({
        type: 'GET',
          url: 'posts/page/' + currentPage++,
          data: '',
          success: function(results){
            $container.imagesLoaded(function() {
              $container.append(results).masonry('appended', results, 'reloadItems');
            });
          },
          complete: function() {
            currentXHR = null;
          }
      });
    }
  });

  // Auto select for editing Post
  $('.dropdown-menu li a').click(function(){
    var selectedText = $(this).text();
    $(this).parents('.input-group-btn').find('.dropdown-toggle').html(selectedText+' <span class="caret"></span>');
    $('[data-toggle="dropdown"]').parent().removeClass('open');
    $('#post_format').val(selectedText.toLowerCase());
    return false;
  });
});
