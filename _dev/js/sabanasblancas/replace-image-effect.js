import isTouchDevice from './utils';

$(window).load(function() {

    if (isTouchDevice()) {
        return;
    }

    $('img[data-alternative-image]').each(function(){
        var $this = $(this);
        var image1 = $this.attr('src');
        var image2 = $this.attr('data-alternative-image');
        $this.hover(function(){
            $(this).attr('src', image2);
        }, function() {
            $(this).attr('src', image1);
        })
    });
});

