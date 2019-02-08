(function() {

  // store the slider in a local variable
  var $window = $(window),
      flexslider = { vars:{} };
  
  // tiny helper function to add breakpoints
  function getGridSize() {
    return (window.innerWidth < 551) ? 2 :
              (window.innerWidth < 819) ? 3 :
              (window.innerWidth < 1087) ? 4 : 5;
  }

  $.flexslider.defaults.prevText = '';
  $.flexslider.defaults.nextText = '';
  
  $window.load(function() {
    $('.flexslider').flexslider({
      animation: "slide",
      slideshow: false,
      animationSpeed: 400,
      animationLoop: false,
      itemWidth: 252,
      itemMargin: 15,
      minItems: 2, // use function to pull in initial value
      maxItems: getGridSize() // use function to pull in initial value
    });
  });
  
  // check grid size on resize event
  $window.resize(function() {
    var gridSize = getGridSize();
    flexslider.vars.maxItems = gridSize;
  });
}());