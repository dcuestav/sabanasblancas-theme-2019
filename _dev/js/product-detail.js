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

    $('#button_add_qty').click(function(){
        var qtyInput = $('#quantity_wanted');
        var qtyInputMin = qtyInput.attr('min');
        var min = (qtyInputMin && qtyInputMin > 0) ? qtyInputMin : 1;
        var newValue = Number(qtyInput.val()) + 1;
        qtyInput.val((newValue >= min) ? newValue : min);
    });

    $('#button_remove_qty').click(function(){
        var qtyInput = $('#quantity_wanted');
        var qtyInputMin = qtyInput.attr('min');
        var min = (qtyInputMin && qtyInputMin > 0) ? qtyInputMin : 1;
        var newValue = Number(qtyInput.val()) - 1;
        qtyInput.val((newValue >= min) ? newValue : min);
    });

}());

