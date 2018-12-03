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

function formatNumber(value) {
    return value.toFixed(2).replace('.', ',');
}

// Behaviors

function updateTotalPrice() {
    var productPrice = getProductPrice();
    var quantity = getQuantityWanted();
    if (productPrice && quantity) {
        setTotalPrice(productPrice * quantity);
    } else {
        hideTotalPrice();
    }
}

function enableTooltips() {
    $('[data-toggle="tooltip"]').bstooltip({ container: 'body' });
}

// Cargar el tooltip de Bootstrap con otro nombre porque tooltip está ocupado por JQueryUI
const NAME = 'bstooltip'
$.fn[NAME] = Tooltip._jQueryInterface
$.fn[NAME].Constructor = Tooltip

// Cada vez que se actualiza el producto se cambian partes de la página por ajax
// y hay que reasignar los comportamientos

$(document).ready(()=>{
    enableTooltips();
    $('#quantity_wanted').change(updateTotalPrice);
    prestashop.on('updatedProduct', updateTotalPrice);
    prestashop.on('updatedProduct', enableTooltips);
});




