(function() {

    $(window).load(function() {
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

})();

