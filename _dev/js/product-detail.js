import $ from 'jquery';
import prestashop from 'prestashop';
import Tooltip from 'bootstrap/js/src/tooltip';

// Basic functions

function getProductPrice() {
    return Number($("[itemprop='price']").attr('content'));
}

function getQuantityWanted() {
    return $('#quantity_wanted').val();
}

function setTotalPrice(value) {
    $('#total_price').text(formatNumber(value));
    $('#total_price_message').removeClass('invisible');
}

function hideTotalPrice() {
    $('#total_price').text('');
    $('#total_price_message').addClass('invisible');
}

function getStock() {
    return $('#availability-delivery-help').data('stock');
}

function getAllowOrdersOutOfStock() {
    return $('#availability-delivery-help').data('allow-oosp');
}

function getPartialDeliveryFrom() {
    return $('#availability-delivery-help').data('partial-delivery-from');
}

function enableCartButton() {
    $('[data-button-action="add-to-cart"]').removeAttr('disabled');
}

function disableCartButton() {
    $('[data-button-action="add-to-cart"]').attr('disabled', 'disabled');
}

function hideAllAvailabilityDeliveryHelpBlocks() {
    return $('#availability-delivery-help').children().addClass('d-none');
}

function showAvailabilityDeliveryHelpBlocks(blockSelector) {
    return $('#availability-delivery-help').children(blockSelector).removeClass('d-none');
}

function formatNumber(value) {
    return value.toFixed(2).replace('.', ',');
}

// Behaviors

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

function updateTotalPrice() {
    var productPrice = getProductPrice();
    var quantity = getQuantityWanted();
    if (productPrice && quantity) {
        setTotalPrice(productPrice * quantity);
    } else {
        hideTotalPrice();
    }
}

function disableAddToCartIfNecessary() {
    var quantityWanted = getQuantityWanted();
    var quantity = getStock();
    var allowOrdersOutOfStock = getAllowOrdersOutOfStock();
    if (quantityWanted > quantity && !allowOrdersOutOfStock) {
        disableCartButton();
    } else {
        enableCartButton();
    }
}

function updateStockInfo() {

    var quantityWanted = getQuantityWanted();
    var quantity = getStock();
    hideAllAvailabilityDeliveryHelpBlocks();

    if (quantityWanted && quantity) {
        if (quantity==0) {
            return;
        }

        var partialDeliveryFrom = getPartialDeliveryFrom();

        if (quantityWanted <= quantity) {
            showAvailabilityDeliveryHelpBlocks('.quantity-wanted-lower-than-stock');
        } else if (quantity >= partialDeliveryFrom) {
            showAvailabilityDeliveryHelpBlocks('.quantity-wanted-greater-than-stock-with-partial-delivery');
        } else {
            showAvailabilityDeliveryHelpBlocks('.quantity-wanted-greater-than-stock');
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
$('#quantity_wanted').change(disableAddToCartIfNecessary);

// Cada vez que se actualiza el producto se cambian partes de la página por ajax
// y hay que reasignar los comportamientos
prestashop.on('updatedProduct', productImagesActions);
prestashop.on('updatedProduct', updateTotalPrice);
prestashop.on('updatedProduct', enableTooltips);
prestashop.on('updatedProduct', disableAddToCartIfNecessary);





