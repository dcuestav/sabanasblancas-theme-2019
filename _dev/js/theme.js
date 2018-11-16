
import 'bootstrap/js/src/util';
// import 'bootstrap/js/src/alert';
import 'bootstrap/js/src/button';
import 'bootstrap/js/src/carousel';
import 'bootstrap/js/src/collapse';
import 'bootstrap/js/src/dropdown';
import 'bootstrap/js/src/index';
import 'bootstrap/js/src/modal';
// import 'bootstrap/js/src/popover';
// import 'bootstrap/js/src/scrollspy';
// import 'bootstrap/js/src/tab';
// import 'bootstrap/js/src/tooltip';

import 'flexslider/jquery.flexslider';
import './product-detail';
import './replace-image-effect';


(function() {
 
    // store the slider in a local variable
    var $window = $(window),
        flexslider = { vars:{} };
   
    // tiny helper function to add breakpoints
    function getGridSize() {
      return (window.innerWidth < 283) ? 1 :
                (window.innerWidth < 551) ? 2 :
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