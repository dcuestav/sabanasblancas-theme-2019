
import $ from 'jquery';
import prestashop from 'prestashop';

function setUpCheckout() {
  if ($('.js-cancel-address').length !== 0) {
    $('.checkout-step:not(.js-current-step) .step-title').addClass('not-allowed');
  }

  $('.js-terms a').on('click', (event) => {
    event.preventDefault();
    var anchor = $(event.target);
    var url = anchor.attr('href');
    if (url) {
      // TODO: Handle request if no pretty URL
      url += `?content_only=1`;

      $('#cms-modal').find('.js-modal-content')
        .empty()
        .addClass('spinner');

      $('#cms-modal').find('.modal-title').text(anchor.text());

      $('#cms-modal').modal('show');

      $.get(url, (content) => {
        $('#cms-modal').find('.js-modal-content')
          .removeClass('spinner')
          .html($(content).find('.page-cms').contents());

      }).fail((resp) => {
        prestashop.emit('handleError', {eventType: 'clickTerms', resp: resp});
      });
    } else {
      console.error('cms url not found');
    }
    
  });

  $('.js-gift-checkbox').on('click', (event) => {
    $('#gift').collapse('toggle');
  });
}

$(document).ready(() => {
  if ($('body#checkout').length === 1) {
    setUpCheckout();
  }

  prestashop.on('updatedDeliveryForm', (params) => {
    if (typeof params.deliveryOption === 'undefined' || 0 === params.deliveryOption.length) {
        return;
    }
    // Hide all carrier extra content ...
    $(".carrier-extra-content").hide();
    // and show the one related to the selected carrier
    params.deliveryOption.next(".carrier-extra-content").slideDown();
  });
});
