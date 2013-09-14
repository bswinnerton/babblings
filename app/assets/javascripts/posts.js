$(document).ready(function(){
  var $container = $('.masonry');

  $container.imagesLoaded( function() {
    $container.masonry({
      itemSelector        : '.post-box',
      columnWidth         : '.post-box',
      transitionDuration  : 0
    });
  });
});
