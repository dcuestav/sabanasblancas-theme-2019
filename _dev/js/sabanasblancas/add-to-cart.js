import $ from 'jquery';
import prestashop from 'prestashop';

if ($('body#product').length) {

    function getQuantityWanted() {
        return parseInt($('#quantity_wanted').val());
    }
    
    function getAddToCartButton() {
        return $('[data-button-action="add-to-cart"]');
    }
    
    function enableAddToCartButton() {
        getAddToCartButton().removeClass('spinner').removeAttr('disabled');
    }
    
    function disableAddToCartButton() {
        getAddToCartButton().addClass('spinner').attr('disabled', true);
    }

    function disableAddToCartButtonOnClick() {
        // El evento updateCart tiene mucho retardo
        getAddToCartButton().click(()=>{ 
            setTimeout(disableAddToCartButton, 0);
        });
    }
    
    function getBlockCartModal() {
        return $('#blockcart-modal');
    }
    
    function setBlur() {
        getBlockCartModal().siblings().addClass('blurred');
    }
    
    function removeBlur() {
        $('.blurred').removeClass('blurred');
    }

    $(document).ready(()=>{
    
        prestashop.blockcart = prestashop.blockcart || {};
        prestashop.blockcart.showModal = (html) => {
            $('body').append(html);
            setBlur();
            var $blockCartModal = getBlockCartModal();
            $blockCartModal.on('shown.bs.modal', enableAddToCartButton);
            $blockCartModal.on('hidden.bs.modal', function (event) { 
                prestashop.emit('updateProduct', {
                    reason: event.currentTarget.dataset,
                    event: event
                });
                removeBlur();
                // Destruirla completamente al ocultarla
                $(this).modal('dispose').remove();
            });
            $blockCartModal.modal('show'); // Mostrar la ventana
        };

        prestashop.on('updateProduct', disableAddToCartButton);

        disableAddToCartButtonOnClick();
        prestashop.on('updatedProduct', ()=>{
            enableAddToCartButton();
            // El botón se regenera después de cada update
            disableAddToCartButtonOnClick();
        });
    
        // Analytics
        prestashop.on('updateCart', ()=>{
            window.current_product = window.current_product || {};
            window.current_product.quantity = getQuantityWanted();
            window.dataLayer = window.dataLayer || [];
            window.dataLayer.push({
                'event': 'addToCart',
                'ecommerce': {
                    'add': {
                        'products': [window.current_product]
                    }
                }
            });
        });
    
    });
    
}



