
import 'bootstrap/js/dist/util';
// import 'bootstrap/js/dist/alert';
import 'bootstrap/js/dist/button';
// import 'bootstrap/js/dist/carousel';
import 'bootstrap/js/dist/collapse';
import 'bootstrap/js/dist/dropdown';
import 'bootstrap/js/dist/index';
// import 'bootstrap/js/dist/modal';
// import 'bootstrap/js/dist/popover';
// import 'bootstrap/js/dist/scrollspy';
// import 'bootstrap/js/dist/tab';
// import 'bootstrap/js/dist/tooltip';

import 'flexslider/jquery.flexslider'


(function() {
 
    // store the slider in a local variable
    var $window = $(window),
        flexslider = { vars:{} };
   
    // tiny helper function to add breakpoints
    function getGridSize() {
      return (window.innerWidth < 769) ? 2 :
                (window.innerWidth < 992) ? 3 : 4;
    }
   
    $window.load(function() {
      $('.flexslider').flexslider({
        animation: "slide",
        slideshow: false,
        animationSpeed: 400,
        animationLoop: false,
        itemWidth: 252,
        itemMargin: 5,
        minItems: 1, // use function to pull in initial value
        maxItems: getGridSize() // use function to pull in initial value
      });
    });
   
    // check grid size on resize event
    $window.resize(function() {
      var gridSize = getGridSize();
      flexslider.vars.maxItems = gridSize;
    });
  }());