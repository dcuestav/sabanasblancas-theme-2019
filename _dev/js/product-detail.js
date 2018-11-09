(function() {

    $('#button_add_qty').click(function(){
        var qtyInput = $('#quantity_wanted');
        var qtyInputMin = qtyInput.attr('min');
        var min = (qtyInputMin && qtyInputMin > 0) ? qtyInputMin : 1;
        var newValue = Number(qtyInput.val()) + 1;
        qtyInput.val((newValue >= min) ? newValue : min);
        updateTotalPrice();
    });

    $('#button_remove_qty').click(function(){
        var qtyInput = $('#quantity_wanted');
        var qtyInputMin = qtyInput.attr('min');
        var min = (qtyInputMin && qtyInputMin > 0) ? qtyInputMin : 1;
        var newValue = Number(qtyInput.val()) - 1;
        qtyInput.val((newValue >= min) ? newValue : min);
        updateTotalPrice();
    });

    $('#quantity_wanted').change(updateTotalPrice);

    function productImagesActions() {
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
    }

    function formatNumber(value) {
        return value.toFixed(2).replace('.', ',');
    }

    function updateTotalPrice() {
        var productPrice = Number($("[itemprop='price']").attr('content'));
        var quantity = $('#quantity_wanted').val();
        if (productPrice && quantity) {
            $('#total_price').text(formatNumber(productPrice * quantity));
            $('#total_price_message').removeClass('invisible');
        } else {
            $('#total_price_message').addClass('invisible');
        }
    }

    productImagesActions();
    prestashop.on('updatedProduct', productImagesActions);

}());

