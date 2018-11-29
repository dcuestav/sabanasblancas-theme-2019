import $ from 'jquery';
import prestashop from 'prestashop';

function productImagesActions(data) {

    if (data) {
        $('#product-modal').replaceWith(data.product_images_modal);
    }

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
prestashop.on('updatedProduct', updateTotalPrice);

$('#quantity_wanted').change(updateTotalPrice);



