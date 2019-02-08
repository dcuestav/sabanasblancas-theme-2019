{extends file='checkout/cart.tpl'}

{block name='content' append}
  {hook h='displayCrossSellingShoppingCart'}
{/block}

{block name='cart_actions'}
  <div class="card-footer checkout cart-detailed-actions card-block">
    <div class="text-sm-center">
      <button type="button" class="btn btn-lg btn-block btn-primary pl-4 pr-4 icon-adjust" disabled>
        <i class="material-icons">payment</i>
        <span>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</span>
      </button>
    </div>
  </div>
{/block}

{block name='cart_voucher'}{/block}
{block name='hook_reassurance'}{/block}
