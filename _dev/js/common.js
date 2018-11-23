// Quantity button

function quantityButtonHandlers() {
    $('.quantity-button-add').click(function(){
        var qtyInput = $(this).siblings('.quantity-button-input');
        var qtyInputMin = qtyInput.attr('min');
        var min = (qtyInputMin && qtyInputMin > 0) ? qtyInputMin : 1;
        var newValue = Number(qtyInput.val()) + 1;
        qtyInput.val((newValue >= min) ? newValue : min);
        qtyInput.trigger('change');
    });
    
    $('.quantity-button-remove').click(function(){
        var qtyInput = $(this).siblings('.quantity-button-input');
        var qtyInputMin = qtyInput.attr('min');
        var min = (qtyInputMin && qtyInputMin > 0) ? qtyInputMin : 1;
        var newValue = Number(qtyInput.val()) - 1;
        qtyInput.val((newValue >= min) ? newValue : min);
        qtyInput.trigger('change');
    });
}

$(document).ready(quantityButtonHandlers);

module.exports = quantityButtonHandlers;