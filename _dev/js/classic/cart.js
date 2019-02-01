import $ from 'jquery';
import prestashop from 'prestashop';

prestashop.cart = prestashop.cart || {};

prestashop.cart.active_inputs = null;

let spinnerSelector = 'input[name="product-quantity-spin"]';
let hasError = false;
let isUpdateOperation = false;
let errorMsg = '';

/**
 * Attach Bootstrap TouchSpin event handlers
 */
function createSpin()
{
  $.each($(spinnerSelector), function (index, spinner) {
     $(spinner).TouchSpin({
      verticalbuttons: true,
      verticalupclass: 'material-icons touchspin-up',
      verticaldownclass: 'material-icons touchspin-down',
      buttondown_class: 'btn btn-touchspin js-touchspin js-increase-product-quantity',
      buttonup_class: 'btn btn-touchspin js-touchspin js-decrease-product-quantity',
      min: parseInt($(spinner).attr('min'), 10),
      max: 1000000
    });
  });
  
  CheckUpdateQuantityOperations.switchErrorStat();
}


$(document).ready(() => {
  let productLineInCartSelector = '.js-cart-line-product-quantity';
  let promises = [];

  prestashop.on('updateCart', () => {
    $('.quickview').modal('hide');
  });

  prestashop.on('updatedCart', () => {
    createSpin();
  });

  createSpin();

  let $body = $('body');

  function isTouchSpin(namespace) {
    return namespace === 'on.startupspin' || namespace === 'on.startdownspin';
  }

  function shouldIncreaseProductQuantity(namespace) {
    return namespace === 'on.startupspin';
  }

  function findCartLineProductQuantityInput($target) {
    var $input = $target.parents('.bootstrap-touchspin').find(productLineInCartSelector);

    if ($input.is(':focus')) {
      return null;
    } else {
      return $input;
    }
  }

  function camelize(subject) {
    let actionTypeParts = subject.split('-');
    let i;
    let part;
    let camelizedSubject = '';

    for (i = 0; i < actionTypeParts.length; i++) {
      part = actionTypeParts[i];

      if (0 !== i) {
        part = part.substring(0, 1).toUpperCase() + part.substring(1);
      }

      camelizedSubject = camelizedSubject + part;
    }

    return camelizedSubject;
  }

  function parseCartAction($target, namespace) {
    if (!isTouchSpin(namespace)) {
      return {
        url: $target.attr('href'),
        type: camelize($target.data('link-action'))
      }
    }

    let $input = findCartLineProductQuantityInput($target);
    if (!$input) {
      return;
    }

    let cartAction = {};
    if (shouldIncreaseProductQuantity(namespace)) {
      cartAction = {
        url: $input.data('up-url'),
        type: 'increaseProductQuantity'
      };
    } else {
      cartAction = {
        url: $input.data('down-url'),
        type: 'decreaseProductQuantity'
      }
    }

    return cartAction;
  }

  let abortPreviousRequests = () => {
    var promise;
    while (promises.length > 0) {
      promise = promises.pop();
      promise.abort();
    }
  };

  var getTouchSpinInput = ($button) => {
    return $($button.parents('.product-line-actions').find('input'));
  };

  function findProductQuantityInCart(id_product, id_product_attribute) {
    var product = prestashop.cart.products.find( product => product.id_product===id_product && product.id_product_attribute===id_product_attribute);
    return product ? product.cart_quantity : 0;
  }

  // Procesa el +1/ -1 y la eliminación de una línea
  // MODIFICADO: el dataset que se lanza con el evento updateCart no es correcto y causa que la pérdida de prestashop.cart 
  var handleCartAction = (event) => {
    event.preventDefault();

    let $target = $(event.currentTarget);
    // let dataset = event.currentTarget.dataset;

    let cartAction = parseCartAction($target, event.namespace);
    let requestData = {
      ajax: '1',
      action: 'update'
    };

    if (typeof cartAction === 'undefined') {
      return;
    }

    abortPreviousRequests();
    $.ajax({
      url: cartAction.url,
      method: 'POST',
      data: requestData,
      dataType: 'json',
      beforeSend: function (jqXHR) {
        promises.push(jqXHR);
      }
    }).then(function (resp) {
      CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
      var $quantityInput = getTouchSpinInput($target);
      $quantityInput.val(resp.quantity);

      // AÑADIDO
      var query = extractQueryStringFromUrl(cartAction.url);

      var initialQuantity = findProductQuantityInCart(query.id_product, query.id_product_attribute);
      var finalQuantity = resp.quantity;
      var quantityIncrease = finalQuantity - initialQuantity;

      $quantityInput.val(finalQuantity);
      
      prestashop.emit('updateCartAnalytics', { 
        id_product: query.id_product,
        id_product_attribute: query.id_product_attribute,
        quantity: quantityIncrease
      });
      // FIN AÑADIDO

      // Refresh cart preview
      prestashop.emit('updateCart', {
        // reason: dataset
        reason: resp
      });
    }).fail((resp) => {
      prestashop.emit('handleError', {
        eventType: 'updateProductInCart',
        resp: resp,
        cartAction: cartAction.type
      });
    });
  };

  $body.on(
    'click',
    '[data-link-action="delete-from-cart"], [data-link-action="remove-voucher"]',
    handleCartAction
  );

  $body.on('touchspin.on.startdownspin', spinnerSelector, handleCartAction);
  $body.on('touchspin.on.startupspin', spinnerSelector, handleCartAction);

  function sendUpdateQuantityInCartRequest(updateQuantityInCartUrl, requestData, $target) {
    abortPreviousRequests();

    return $.ajax({
      url: updateQuantityInCartUrl,
      method: 'POST',
      data: requestData,
      dataType: 'json',
      beforeSend: function (jqXHR) {
        promises.push(jqXHR);
      }
    }).then(function (resp) {
      CheckUpdateQuantityOperations.checkUpdateOpertation(resp);
      $target.val(resp.quantity);

      var dataset;
      if ($target && $target.dataset) {
        dataset = $target.dataset;
      } else {
        dataset = resp;
      }

      // AÑADIDO
      var query = extractQueryStringFromUrl(updateQuantityInCartUrl);
      prestashop.emit('updateCartAnalytics', { 
        id_product: query.id_product,
        id_product_attribute: query.id_product_attribute,
        quantity: requestData.op === 'up' ? requestData.qty : -requestData.qty
      });
      // FIN AÑADIDO

      // Refresh cart preview
      prestashop.emit('updateCart', {
        reason: dataset
      });
    }).fail((resp) => {
      prestashop.emit('handleError', {eventType: 'updateProductQuantityInCart', resp: resp})
    });
  }

  // AÑADIDO
  function extractQueryStringFromUrl(url) {
    var query = url.substring(url.indexOf('?') + 1).split('&');
    var result = {};
    query.forEach(element => {
      var items = element.split('=');
      result[items[0]] = items[1];
    });
    return result;
  }
  // FIN AÑADIDO

  function getRequestData(quantity) {
    return {
      ajax: '1',
      qty: Math.abs(quantity),
      action: 'update',
      op: getQuantityChangeType(quantity)
    }
  }

  function getQuantityChangeType($quantity) {
    return ($quantity > 0) ? 'up' : 'down';
  }

  function updateProductQuantityInCart(event)
  {
    let $target = $(event.currentTarget);
    let updateQuantityInCartUrl = $target.data('update-url');
    let baseValue = $target.attr('value');

    // There should be a valid product quantity in cart
    let targetValue = $target.val();
    if (targetValue != parseInt(targetValue) || targetValue < 0 || isNaN(targetValue)) {
      $target.val(baseValue);

      return;
    }

    // There should be a new product quantity in cart
    let qty = targetValue - baseValue;
    if (qty == 0) {
      return;
    }

    var requestData = getRequestData(qty);

    sendUpdateQuantityInCartRequest(updateQuantityInCartUrl, requestData, $target);
  }

  $body.on(
    'focusout',
    productLineInCartSelector,
    (event) => {
      updateProductQuantityInCart(event);
    }
  );

  $body.on(
    'keyup',
    productLineInCartSelector,
    (event) => {
      if (event.keyCode == 13) {
        updateProductQuantityInCart(event);
      }
    }
  );

  $body.on(
    'click',
    '.js-discount .code',
    (event) => {
      event.stopPropagation();

      var $code = $(event.currentTarget);
      var $discountInput = $('[name=discount_name]');

      $discountInput.val($code.text());

      return false;
    }
  )
});

const CheckUpdateQuantityOperations = {
  'switchErrorStat': () => {
    /*
    if errorMsg is not empty or if notifications are shown, we have error to display
    if hasError is true, quantity was not updated : we don't disable checkout button
     */
    let $checkoutBtn = $('.checkout a');
    if ($("#notifications article.alert-danger").length || ('' !== errorMsg && !hasError)) {
      $checkoutBtn.addClass('disabled');
    }

    if ('' !== errorMsg) {
      let strError = ' <article class="alert alert-danger" role="alert" data-alert="danger"><ul class="list-unstyled"><li>' + errorMsg + '</li></ul></article>';
      $('#notifications .container').html(strError);
      errorMsg = '';
      isUpdateOperation = false;
      if (hasError) {
        // if hasError is true, quantity was not updated : allow checkout
        $checkoutBtn.removeClass('disabled');
      }
    } else if (!hasError && isUpdateOperation) {
      hasError = false;
      isUpdateOperation = false;
      $('#notifications .container').html('');
      $checkoutBtn.removeClass('disabled');
    }
  },
  'checkUpdateOpertation': (resp) => {
    /*
    resp.hasError can be not defined but resp.errors not empty: quantity is updated but order cannot be placed
    when resp.hasError=true, quantity is not updated
     */
    hasError = resp.hasOwnProperty('hasError');
    let errors = resp.errors || "";
    // 1.7.2.x returns errors as string, 1.7.3.x returns array
    if (errors instanceof Array) {
      errorMsg = errors.join(" ");
    } else {
      errorMsg = errors;
    }
    isUpdateOperation = true;
  }
};