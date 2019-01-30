<section id="js-checkout-summary" class="card cart-summary js-cart mb-3" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
  <ul class="list-group list-group-flush">
    <li class="list-group-item">
      {block name='hook_checkout_summary_top'}
        {* {hook h='displayCheckoutSummaryTop'} *}
      {/block}

      {block name='cart_summary_products'}
        <div class="cart-summary-products">

          <p>{$cart.summary_string}</p>

          <p>
            <a href="#" data-toggle="collapse" data-target="#cart-summary-product-list">
              {l s='show details' d='Shop.Theme.Actions'}
            </a>
          </p>

          {block name='cart_summary_product_list'}
            <div class="collapse" id="cart-summary-product-list">
              <ul class="media-list list-unstyled">
                {foreach from=$cart.products item=product}
                  <li class="media mb-1">{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>
                {/foreach}
              </ul>
            </div>
          {/block}
        </div>
      {/block}

      {block name='cart_summary_subtotals'}
        {foreach from=$cart.subtotals item="subtotal"}
          {if $subtotal && $subtotal.type !== 'tax'}
            <div class="cart-summary-line cart-summary-subtotals" id="cart-subtotal-{$subtotal.type}">
              <span class="label">{$subtotal.label}</span>
              <span class="value">{$subtotal.value}</span>
            </div>
          {/if}
        {/foreach}
      {/block}
    </li>

    {block name='cart_summary_voucher'}
      {* {include file='checkout/_partials/cart-voucher.tpl'} *}
    {/block}

    {block name='cart_summary_totals'}
      {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
    {/block}

  </ul>

</section>
