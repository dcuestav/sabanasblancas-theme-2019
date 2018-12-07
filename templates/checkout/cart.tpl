
{extends file=$layout}

{block name='content'}

  <section id="main">
    <div class="cart-grid row">

      <!-- Left Block: cart product informations & shpping -->
      <div class="cart-grid-body col-12 col-lg-8">

        <!-- cart products detailed -->
        <div class="card cart-container">
          <div class="card-header">
            <h1 class="h1">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
          </div>
          <div class="card-body">
            {block name='cart_overview'}
              {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
            {/block}
          </div>
        </div>

        {block name='continue_shopping'}
          <a href="{$urls.pages.index}" role="button" class="btn btn-light mt-3">
            <i class="material-icons">arrow_back</i>
            <span class="">{l s='Volver a la tienda' d='Shop.Theme.Customeraccount'}</span>
          </a>
        {/block}

        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}
      </div>

      <!-- Right Block: cart subtotal & cart total -->
      <div class="cart-grid-right col-12 col-lg-4">

        {block name='cart_summary'}
          <div class="card cart-summary mb-3">

            {block name='hook_shopping_cart'}
              {hook h='displayShoppingCart'}
            {/block}

            {block name='cart_totals'}
              {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
            {/block}

            {block name='cart_actions'}
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
            {/block}

          </div>
        {/block}

        {block name='hook_reassurance'}
          {hook h='displayReassurance'}
        {/block}

      </div>

    </div>
  </section>
{/block}
