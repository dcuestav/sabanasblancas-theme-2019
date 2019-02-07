import $ from 'jquery';
import prestashop from 'prestashop';

if ($('body#product').length) {

    // Basic functions
    function getProductPrice() {
        return Number($('.current-price>span').attr('content'));
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

    

    // if body id product -> show modal add class blurred to #wrapper. On hide modal remove class blurred
    function blurScreenOnShowModal() {
        if ($('body#product')===0) {
            return;
        }
        var $itemsToBlur = $('#header, #footer, .breadcrumb, #main>*:not(.modal)');
        $('.modal').on('show.bs.modal', function (e) {
            $itemsToBlur.addClass('blurred');
        });
        $('.modal').on('hide.bs.modal', function (e) {
            $itemsToBlur.removeClass('blurred');
        });
    }

    // Cada vez que se actualiza el producto se cambian partes de la página por ajax
    // y hay que reasignar los comportamientos

    $(document).ready(()=>{
        blurScreenOnShowModal();
        $('#quantity_wanted').change(updateTotalPrice);
        prestashop.on('updatedProduct', updateTotalPrice);

        // Analytics
        window.dataLayer = window.dataLayer || [];
        
        window.dataLayer.push({
            'event': 'productVariantView',
            'ecommerce': {
                'detail': {
                'products': [window.current_product]
                }
            }
        });

        prestashop.on('updatedProduct', ()=>{
            if (window.current_product && window.current_product.id !== window.previous_product_id) {
                window.dataLayer.push({
                    'event': 'productVariantView',
                    'ecommerce': {
                        'detail': {
                        'products': [window.current_product]
                        }
                    }
                });
            }
        });
    });

}


