function is_touch_device() {
    var prefixes = ' -webkit- -moz- -o- -ms- '.split(' ');
    var mq = function(query) {
      return window.matchMedia(query).matches;
    }
  
    if (('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch) {
      return true;
    }
  
    // include the 'heartz' as a way to have a non matching MQ to help terminate the join
    // https://git.io/vznFH
    var query = ['(', prefixes.join('touch-enabled),('), 'heartz', ')'].join('');
    return mq(query);
}

$(window).load(function() {

    if (is_touch_device()) {
        return;
    }

    $('img[data-alternative-image]').each(function(){
        $this = $(this);
        var image1 = $this.attr('src');
        var image2 = $this.attr('data-alternative-image');
        $this.hover(function(){
            $(this).attr('src', image2);
        }, function() {
            $(this).attr('src', image1);
        })
    });
});

