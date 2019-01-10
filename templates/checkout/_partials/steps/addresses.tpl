
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div class="js-address-form">
    <form
      method="POST"
      action="{$urls.pages.order}"
      data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
    >

      {* {if !$use_same_address} *}
        <h2 class="h4">{l s='Shipping Address' d='Shop.Theme.Checkout'}</h2>
      {* {/if} *}

      {if !$cart.is_virtual && !$show_delivery_address_form && !$show_invoice_address_form}
        <div class="form-group mt-3">
          {if $use_same_address}
            <a class="icon-adjust" data-link-action="different-invoice-address" href="{$use_different_address_url}">
              <i class="material-icons">check_box</i>
              <span>{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</span>
            </a>
          {else}
            <a class="icon-adjust" data-link-action="different-invoice-address" href="{$use_different_address_url|replace:'use_same_address=0':'use_same_address=1'}">
              <i class="material-icons">check_box_outline_blank</i>
              <span>{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</span>
            </a>
          {/if}
        </div>
      {/if}

      {if $use_same_address && $cart.is_virtual}
        <p>
          {l s='The selected address will be used as your personal address (for invoice).' d='Shop.Theme.Checkout'}
        </p>
      {/if}

      {if $show_delivery_address_form}
        <div id="delivery-address" class="mb-3">
          {render file                      = 'checkout/_partials/address-form.tpl'
                  ui                        = $address_form
                  use_same_address          = $use_same_address
                  type                      = "delivery"
                  form_has_continue_button  = $form_has_continue_button
          }
        </div>
      {elseif $customer.addresses|count > 0}
        <div id="delivery-addresses" class="address-selector js-address-selector row">
          {include  file        = 'checkout/_partials/address-selector-block.tpl'
                    addresses   = $customer.addresses
                    name        = "id_address_delivery"
                    selected    = $id_address_delivery
                    type        = "delivery"
                    interactive = !$show_delivery_address_form and !$show_invoice_address_form
          }
        </div>

        {if isset($delivery_address_error)}
          <p class="alert alert-danger js-address-error" name="alert-delivery" id="id-failure-address-{$delivery_address_error.id_address}">{$delivery_address_error.exception}</p>
        {else}
          <p class="alert alert-danger js-address-error" name="alert-delivery" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
        {/if}

        <p class="add-address">
          <a href="{$new_address_delivery_url}" class="icon-adjust"><i class="material-icons">add</i><span>{l s='add new address' d='Shop.Theme.Actions'}</span></a>
        </p>

      {/if}

      {if !$use_same_address}

        <h2 class="h4 mt-4">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h2>

        {if $show_invoice_address_form}
          <div id="invoice-address">
            {render file                      = 'checkout/_partials/address-form.tpl'
                    ui                        = $address_form
                    use_same_address          = $use_same_address
                    type                      = "invoice"
                    form_has_continue_button  = $form_has_continue_button
            }
          </div>
        {else}
          <div id="invoice-addresses" class="address-selector js-address-selector row">
            {include  file        = 'checkout/_partials/address-selector-block.tpl'
                      addresses   = $customer.addresses
                      name        = "id_address_invoice"
                      selected    = $id_address_invoice
                      type        = "invoice"
                      interactive = !$show_delivery_address_form and !$show_invoice_address_form
            }
          </div>

          {if isset($invoice_address_error)}
            <p class="alert alert-danger js-address-error" name="alert-invoice" id="id-failure-address-{$invoice_address_error.id_address}">{$invoice_address_error.exception}</p>
          {else}
            <p class="alert alert-danger js-address-error" name="alert-invoice" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
          {/if}

          <p class="add-address">
            <a href="{$new_address_invoice_url}" class="icon-adjust"><i class="material-icons">add</i><span>{l s='add new address' d='Shop.Theme.Actions'}</span></a>
          </p>
        {/if}

      {/if}

      {if !$form_has_continue_button}
        <div class="d-flex justify-content-end">
          <button type="submit" class="btn btn-primary continue" name="confirm-addresses" value="1">
              {l s='Continue' d='Shop.Theme.Actions'}
          </button>
          <input type="hidden" id="not-valid-addresses" value="{$not_valid_addresses}">
        </div>
      {/if}

    </form>
  </div>
{/block}
