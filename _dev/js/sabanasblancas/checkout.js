import $ from 'jquery';

function checkAtLeastLastStepIsOpen() {
    $('#accordion').on('hidden.bs.collapse', () => {
        if ($('.collapse.show').length === 0) {
            $('.checkout-step.-reachable').last().find('.collapse').collapse('show');
        }
    });
}

function emptyTermsModalOnHide() {
    $('#modal').on('hidden.bs.modal', ()=>{
        $('#modal .js-modal-content').html('');
    });
}

function addClassSelectedInRadioCards() {
    $('#checkout [name="payment-option"], #checkout .delivery-option input').change( (event) => {
        $(event.target)
            .closest('.card')
            .addClass('selected')
            .siblings()
            .removeClass('selected');
    })
}

$(document).ready(()=>{
    checkAtLeastLastStepIsOpen();
    emptyTermsModalOnHide();
    addClassSelectedInRadioCards();
});