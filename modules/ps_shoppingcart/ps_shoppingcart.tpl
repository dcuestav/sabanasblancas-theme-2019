
<div id="_desktop_cart" class="header-nav-item ml-3">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
      {if $cart.products_count > 0}
        <a rel="nofollow" href="{$cart_url}" class="icon-adjust">
      {else}
        <span class="icon-adjust">
      {/if}
        <i class="material-icons">shopping_cart</i>
        <span>{l s='Cart' d='Shop.Theme.Checkout'}</span>
        <span class="cart-products-count">({$cart.products_count})</span>
      {if $cart.products_count > 0}
        </a>
      {else}
        </span>
      {/if}
    </div>
  </div>
</div>
