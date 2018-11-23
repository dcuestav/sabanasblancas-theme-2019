
{block name='cart_detailed_product'}
  <div class="cart-overview js-cart" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}
    <ul class="cart-items list-unstyled mb-0">
      {foreach from=$cart.products item=product name=cart_detailed_products}
        <li class="cart-item {if !$smarty.foreach.cart_detailed_products.last}mb-3{/if}">
          {block name='cart_detailed_product_line'}
            {include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
          {/block}
        </li>
        {if $product.customizations|count >1}<hr>{/if}
        {if !$smarty.foreach.cart_detailed_products.last}<hr>{/if}
      {/foreach}
    </ul>
    {else}
      <span class="no-items">{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}</span>
    {/if}
  </div>
{/block}
