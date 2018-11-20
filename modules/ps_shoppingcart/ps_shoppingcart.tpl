
<div id="_desktop_cart" class="d-flex">
  <div class="blockcart cart-preview header-nav-item ml-3 {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    {if $cart.products_count > 0}
      <a rel="nofollow" href="{$cart_url}" class="icon-adjust">
        <i class="material-icons">shopping_cart</i>
        <span>{l s='Cart' d='Shop.Theme.Checkout'} </span>
        <span class="cart-products-count">({$cart.products_count})</span>
      </a>
    {else}
      <span class="icon-adjust">
        <i class="material-icons">shopping_cart</i>
        <span>{l s='Cart' d='Shop.Theme.Checkout'} </span>
        <span class="cart-products-count">(0)</span>
      </span>
    {/if}
  </div>
</div>
