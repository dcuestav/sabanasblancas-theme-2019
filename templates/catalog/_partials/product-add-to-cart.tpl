<div class="product-add-to-cart">
  {if !$configuration.is_catalog}

    <div class="form-row mb-3">
      {* <label for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label> *}
      <div class="col">
        <div class="input-group quantity-button">
          <button class="btn btn-secondary icon-only quantity-button-remove" type="button"><i class="material-icons">remove</i></button>
          <input
              type="number"
              name="qty"
              id="quantity_wanted"
              value="{$product.quantity_wanted}"
              class="form-control quantity-button-input"
              min="{$product.minimal_quantity}"
              {if !$product.allow_oosp}max="{$product.quantity}" {/if}
              aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
            >
          <button class="btn btn-secondary icon-only quantity-button-add" type="button"><i class="material-icons">add</i></button>
        </div>

      </div>
      <label id="total_price_message" class="col col-form-label text-right text-muted invisible">Total <span id="total_price"></span> €</label>
    </div>

    {block name='product_quantity'}
      <div class="product-quantity clearfix">

        <div class="add">
          <button
            class="btn btn-lg btn-block btn-primary add-to-cart position-relative"
            data-button-action="add-to-cart"
            type="submit"
            {if !$product.add_to_cart_url}
              disabled
            {/if}
          >
            <i class="material-icons">shopping_cart</i>
            <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
          </button>
        </div>
      </div>
    {/block}

    {block name='product_minimal_quantity'}
      {if $product.minimal_quantity > 1}
        <p class="product-minimal-quantity">
          {l
          s='The minimum purchase order quantity for the product is %quantity%.'
          d='Shop.Theme.Checkout'
          sprintf=['%quantity%' => $product.minimal_quantity]
          }
        </p>
      {/if}
    {/block}
  {/if}
</div>
