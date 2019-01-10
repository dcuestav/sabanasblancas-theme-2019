
{block name='cart_detailed_actions'}
  <div class="card-footer checkout cart-detailed-actions card-block">
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="text-sm-center">
        <button type="button" class="btn btn-lg btn-block btn-primary pl-4 pr-4 icon-adjust" disabled>
          <i class="material-icons">payment</i>
          <span>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</span>
        </button>
      </div>
    {elseif empty($cart.products) }
      <div class="text-sm-center">
        <button type="button" class="btn btn-lg btn-block btn-primary pl-4 pr-4 icon-adjust" disabled>
          <i class="material-icons">payment</i>
          <span>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</span>
        </button>
      </div>
    {else}
      <div class="text-sm-center">
        <a href="{$urls.pages.order}" class="btn btn-lg btn-block btn-primary pl-4 pr-4 icon-adjust">
          <i class="material-icons">payment</i>
          <span>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</span>
        </a>
        {hook h='displayExpressCheckout'}
      </div>
    {/if}
  </div>
{/block}
