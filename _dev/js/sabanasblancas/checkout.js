import $ from 'jquery';

if ($('body#checkout').length) {

    function checkAtLeastLastStepIsOpen() {
        $('#accordion').on('hidden.bs.collapse', () => {
            if ($('.collapse.show').length === 0) {
                $('.checkout-step.-reachable').last().find('.collapse').collapse('show');
            }
            // Analytics
            triggerAnalyticsCheckoutEvent();
        });
    }
    
    function emptyTermsModalOnHide() {
        $('#modal').on('hidden.bs.modal', ()=>{
            $('#modal .js-modal-content').html('');
        });
    }

    function selectableCardsBehavior() {
        $('.js-selectable-card').click( (event) => {

            var $selectedCard = $(event.target).closest('.card');
            var $radio = $selectedCard.find('input[type="radio"]');

            var radioGroup = $radio.attr('name');

            // Desactivar todas las opciones
            $(`input[type="radio"][name="${radioGroup}"]`)
                .closest('.card')
                .removeClass('selected')
                .find('.js-additional-information').hide();

            // Activar la opción seleccionada
            $selectedCard
                .addClass('selected')
                .find('.js-additional-information').show();
            
            $radio.prop("checked", true);

        })
    }

    // Analytics
    function triggerAnalyticsCheckoutEvent() {
        // Hay que dejar tiempo para que se añada la clase show
        setTimeout(()=>{
            var currentStep = $('.collapse.show').closest('section').attr('id');
            var step = 0;
            switch (currentStep) {
                case 'checkout-personal-information-step':
                    step = 1;
                    break;
                case 'checkout-addresses-step':
                    step = 2;
                    break;
                case 'checkout-delivery-step':
                    step = 3;
                    break;
                case 'checkout-payment-step':
                    step = 4;
                    break;
            }
            window.dataLayer = window.dataLayer || [];
            window.dataLayer.push({
                'event': 'checkout',
                'ecommerce': {
                    'checkout': {
                        'actionField': {
                            'step': step
                        }
                    }
                }
            });
        },100);
    }
    
    $(document).ready(()=>{
        checkAtLeastLastStepIsOpen();
        emptyTermsModalOnHide();
        triggerAnalyticsCheckoutEvent();
        selectableCardsBehavior();
    });

}

