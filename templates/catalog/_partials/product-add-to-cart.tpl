{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="product-add-to-cart">
  {if !$configuration.is_catalog}

    <div class="form-group row mb-3">
      {* <label for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label> *}
      <div class="col-sm-6">
        <div class="input-group quantity-button">
          <button class="btn btn-secondary" type="button" id="button_remove_qty"><i class="material-icons">remove</i></button>
          <input
              type="number"
              name="qty"
              id="quantity_wanted"
              value="{$product.quantity_wanted}"
              class="form-control"
              min="{$product.minimal_quantity}"
              aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
            >
          <button class="btn btn-secondary" type="button" id="button_add_qty"><i class="material-icons">add</i></button>
        </div>

      </div>
      <label id="total_price_message" class="col-sm-6 col-form-label text-right text-muted invisible">Total <span id="total_price"></span> €</label>
    </div>

    {block name='product_quantity'}
      <div class="product-quantity clearfix">

        <div class="add">
          <button
            class="btn btn-lg btn-block btn-primary add-to-cart"
            data-button-action="add-to-cart"
            type="submit"
            {if !$product.add_to_cart_url}
              disabled
            {/if}
          >
            <i class="material-icons shopping-cart mr-2">&#xE547;</i>
            {l s='Add to cart' d='Shop.Theme.Actions'}
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
