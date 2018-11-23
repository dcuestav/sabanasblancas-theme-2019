import quantityButtonHandlers from './common';

(function(){

    function handleQuantityChange() {

        $('.js-cart-line-product-quantity').change(function() {
            var updateUrl = $(this).data('update-url');
    
            var requestData = {
                ajax: 1,
                action: 'update'
            };
    
            $.post(updateUrl, requestData, null, 'json').then(function (resp) {
    
                prestashop.emit('updateCart', { reason: resp.cart, resp: resp });
            
            }).fail(function (resp) {
                prestashop.emit('handleError', {eventType: 'updateShoppingCart', resp: resp});
            });
        })
    }

    $(document).ready(handleQuantityChange);
    prestashop.on('updatedCart', handleQuantityChange);
    prestashop.on('updatedCart', quantityButtonHandlers);
    
})()

  
    