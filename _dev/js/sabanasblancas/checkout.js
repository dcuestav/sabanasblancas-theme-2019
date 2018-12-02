import $ from 'jquery';

function checkAtLeastLastStepIsOpen() {
    $('#accordion').on('hidden.bs.collapse', () => {
        if ($('.collapse.show').length === 0) {
            $('.checkout-step.-reachable').last().find('.collapse').collapse('show');
        }
    });
}

$(document).ready(checkAtLeastLastStepIsOpen);