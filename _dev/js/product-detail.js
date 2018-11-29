import $ from 'jquery';
import prestashop from 'prestashop';
import Tooltip from 'bootstrap/js/src/tooltip';

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

function updateStockInfo() {

    var toggleClass = 'd-none';
    
    var quantityWanted = $('#quantity_wanted').val();
    var deliveryHelpBlock = $('#availability-delivery-help');
    var quantity = deliveryHelpBlock.data('quantity');
    var partialDeliveryFrom = deliveryHelpBlock.data('partial-delivery-from');

    deliveryHelpBlock.children().addClass(toggleClass);

    if (quantityWanted && quantity) {
        if (quantity==0) {
            return;
        }

        if (quantityWanted <= quantity) {
            deliveryHelpBlock.children('.quantity-wanted-lower-than-stock').removeClass(toggleClass);
        } else if (quantity >= partialDeliveryFrom) {
            deliveryHelpBlock.children('.quantity-wanted-greater-than-stock-with-partial-delivery').removeClass(toggleClass);
        } else {
            deliveryHelpBlock.children('.quantity-wanted-greater-than-stock').removeClass(toggleClass);
        }
    }
}

function enableTooltips() {
    $('[data-toggle="tooltip"]').bstooltip({ container: 'body' });
}

// Cargar el tooltip de Bootstrap con otro nombre porque tooltip está ocupado por JQueryUI
const NAME = 'bstooltip'
$.fn[NAME] = Tooltip._jQueryInterface
$.fn[NAME].Constructor = Tooltip

$(document).ready(enableTooltips);

productImagesActions();
$('#quantity_wanted').change(updateTotalPrice);
$('#quantity_wanted').change(updateStockInfo);

// Cada vez que se actualiza el producto se cambian partes de la página por ajax
// y hay que reasignar los comportamientos
prestashop.on('updatedProduct', productImagesActions);
prestashop.on('updatedProduct', updateTotalPrice);
prestashop.on('updatedProduct', enableTooltips);





