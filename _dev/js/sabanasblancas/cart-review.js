import $ from 'jquery';
import prestashop from 'prestashop';

if ($('body#cart').length) {

    function findProductReferenceInCart(id_product, id_product_attribute) {
        var product = prestashop.cart.products.find( product => product.id_product===id_product && product.id_product_attribute===id_product_attribute);
        return product ? product.reference_to_display : '';
    }

    $(document).ready(()=>{

        prestashop.on('updateCartAnalytics', (event)=>{

            window.dataLayer = window.dataLayer || [];

            var productReference = findProductReferenceInCart(event.id_product, event.id_product_attribute);

            if (event.quantity > 0) {
                window.dataLayer.push({
                    'event': 'addToCart',
                    'ecommerce': {
                        'add': {
                            'products': [
                                {
                                    'id': productReference,
                                    'quantity': Math.abs(event.quantity)
                                }
                            ]
                        }
                    }
                });
            }
            else if (event.quantity < 0) {
                window.dataLayer.push({
                    'event': 'removeFromCart',
                    'ecommerce': {
                        'remove': {
                            'products': [
                                {
                                    'id': productReference,
                                    'quantity': Math.abs(event.quantity)
                                }
                            ]
                        }
                    }
                });
            }
        });
        
    });
    
}