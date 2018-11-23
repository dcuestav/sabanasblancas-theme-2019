
<div class="product-line-grid row">
  <div class="col-md-7">
    <div class="row">
      <!--  product left content: image-->
      <div class="product-line-grid-left col-md-4 col-4">
        <span class="product-image media-middle">
          <img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}" class="img-fluid">
        </span>
      </div>

      <!--  product left body: description -->
      <div class="product-line-grid-body col-md-8 col-8">
        <div class="product-line-info">
          <a class="label" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
        </div>

        <div class="product-line-info product-price h5 {if $product.has_discount}has-discount{/if}">
          {if $product.has_discount}
            <div class="product-discount">
              <span class="regular-price">{$product.regular_price}</span>
              {if $product.discount_type === 'percentage'}
                <span class="discount discount-percentage">
                    -{$product.discount_percentage_absolute}
                  </span>
              {else}
                <span class="discount discount-amount">
                    -{$product.discount_to_display}
                  </span>
              {/if}
            </div>
          {/if}
          <div class="current-price">
            <span class="price">{$product.price}</span>
            {if $product.unit_price_full}
              <div class="unit-price-cart">{$product.unit_price_full}</div>
            {/if}
          </div>
        </div>

        {foreach from=$product.attributes key="attribute" item="value"}
          <div class="product-line-info">
            <span class="label">{$attribute}:</span>
            <span class="value">{$value}</span>
          </div>
        {/foreach}

        {if $product.customizations|count}
          <br>
          {block name='cart_detailed_product_line_customization'}
            {foreach from=$product.customizations item="customization"}
              <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
              <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                      <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                    </div>
                    <div class="modal-body">
                      {foreach from=$customization.fields item="field"}
                        <div class="product-customization-line row">
                          <div class="col-sm-3 col-xs-4 label">
                            {$field.label}
                          </div>
                          <div class="col-sm-9 col-xs-8 value">
                            {if $field.type == 'text'}
                              {if (int)$field.id_module}
                                {$field.text nofilter}
                              {else}
                                {$field.text}
                              {/if}
                            {elseif $field.type == 'image'}
                              <img src="{$field.image.small.url}">
                            {/if}
                          </div>
                        </div>
                      {/foreach}
                    </div>
                  </div>
                </div>
              </div>
            {/foreach}
          {/block}
        {/if}
      </div>
    </div>
  </div>

  <div class="col-md-5">

    <!--  product left body: quantity and total price -->
    <div class="product-line-grid-right product-line-actions row mt-3">

        <div class="col-6 offset-sm-4 col-sm-4 offset-md-0 col-md-6 qty">
          {if isset($product.is_gift) && $product.is_gift}
            <span class="gift-quantity">{$product.quantity}</span>
          {else}
            <div class="input-group quantity-button" style="max-width:150px;">
              <button class="btn btn-secondary icon-only quantity-button-remove" type="button"><i class="material-icons">remove</i></button>
              <input
                class="form-control js-cart-line-product-quantity quantity-button-input"
                data-down-url="{$product.down_quantity_url}"
                data-up-url="{$product.up_quantity_url}"
                data-update-url="{$product.update_quantity_url}"
                data-product-id="{$product.id_product}"
                type="text"
                value="{$product.quantity}"
                name="product-quantity-spin"
                min="{$product.minimal_quantity}"
                >
              <button class="btn btn-secondary icon-only quantity-button-add" type="button"><i class="material-icons">add</i></button>
            </div>
          {/if}
        </div>

        <div class="col-4 col-sm-2 col-md-4 price align-self-center">
          <span class="product-price">
            <strong>
              {if isset($product.is_gift) && $product.is_gift}
                <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
              {else}
                {$product.total}
              {/if}
            </strong>
          </span>
        </div>

        <div class="col-2 col-sm-2 text-xs-right">
          <div class="cart-line-product-actions pt-1">
            <a
                class                       = "remove-from-cart"
                rel                         = "nofollow"
                href                        = "{$product.remove_from_cart_url}"
                data-link-action            = "delete-from-cart"
                data-id-product             = "{$product.id_product|escape:'javascript'}"
                data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
                data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
            >
              {if !isset($product.is_gift) || !$product.is_gift}
              <i class="material-icons float-xs-left">delete</i>
              {/if}
            </a>

            {block name='hook_cart_extra_product_actions'}
              {hook h='displayCartExtraProductActions' product=$product}
            {/block}

          </div>
        </div>
    </div>

  </div>

</div>
