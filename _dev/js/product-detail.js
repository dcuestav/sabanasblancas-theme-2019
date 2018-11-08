(function() {

    $('.js-thumb').click(function(){
        var largeImage = $(this).attr('data-image-large-src');
        $('.js-qv-product-cover, .js-modal-product-cover').attr('src', largeImage);
        $('.js-thumb').removeClass('selected');
        $(this).addClass('selected');
    });
    
    $('.js-modal-thumb').click(function(){
        var largeImage = $(this).attr('data-image-large-src');
        $('.js-modal-product-cover').attr('src', largeImage);
    });

}());

