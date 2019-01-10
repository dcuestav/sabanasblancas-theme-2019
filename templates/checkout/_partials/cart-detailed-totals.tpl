
{block name='cart_detailed_totals'}
<div class="card-body cart-detailed-totals">

  <div class="card-block">
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal.value && $subtotal.type !== 'tax'}
        <div class="cart-summary-line" id="cart-subtotal-{$subtotal.type}">
          <span class="label{if 'products' === $subtotal.type} js-subtotal{/if}">
            {if 'products' == $subtotal.type}
              {$cart.summary_string}
            {else}
              {$subtotal.label}
            {/if}
          </span>
          <span class="value">{$subtotal.value}</span>
          {* Se muestra un enlace a condiciones de envío solo cuando el carrito está vacío *}
          {* 
          {if $subtotal.type === 'shipping'}
              <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
          {/if}
           *}
        </div>
      {/if}
    {/foreach}
  </div>

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}

  <hr class="separator">

  <div class="card-block">
    <div class="cart-summary-line cart-total">
      <span class="label">{$cart.totals.total.label} {$cart.labels.tax_short}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div>

    <div class="cart-summary-line">
      <small class="label">{$cart.subtotals.tax.label}</small>
      <small class="value">{$cart.subtotals.tax.value}</small>
    </div>
  </div>

</div>
{/block}
