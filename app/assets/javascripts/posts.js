$(document).ready(function(){
  var $container = $('.container');

  $container.imagesLoaded( function() {
    $container.masonry({
      itemSelector        : '.post-box',
      columnWidth         : '.post-box',
      transitionDuration  : 0
    });
  });
});
