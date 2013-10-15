$(document).ready(function(){
  var $container = $('.masonry');

  $container.imagesLoaded( function() {
    $container.masonry({
      itemSelector        : '.post-box',
      columnWidth         : '.post-box',
      transitionDuration  : 0
    });
  });

  $('.dropdown-menu li a').click(function(){
    var selectedText = $(this).text();
    $(this).parents('.input-group-btn').find('.dropdown-toggle').html(selectedText+' <span class="caret"></span>');
    $('[data-toggle="dropdown"]').parent().removeClass('open');
    $('#post_format').val(selectedText.toLowerCase());
    return false;
  });
});
