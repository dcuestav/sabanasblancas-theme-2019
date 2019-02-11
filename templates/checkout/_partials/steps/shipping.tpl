
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <div class="delivery-options-list">
    {if $delivery_options|count}
      <form
        class="clearfix"
        id="js-delivery"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >
        <div class="form-fields">
          {block name='delivery_options'}
            <div class="delivery-options">
              {foreach from=$delivery_options item=carrier key=carrier_id}

                <div class="card js-selectable-card{if $delivery_option == $carrier_id} selected{/if}">
                  <div class="card-body">
                    <div class="form-check">
                      <input 
                          type="radio" 
                          class="form-check-input"
                          name="delivery_option[{$id_address}]" 
                          id="delivery_option_{$carrier.id}" 
                          value="{$carrier_id}"
                          {if $delivery_option == $carrier_id} checked{/if}
                      >
                      <label class="form-check-label" for="delivery_option_{$carrier.id}">
                        <div class="h5">{$carrier.name}</div>
                        <div class="additional-information">{$carrier.delay}</div>
                        <div class="additional-information">{$carrier.price}</div>
                      </label>
                    </div>
                    
                  </div>  
                </div>


                  {* <div class="row delivery-option">
                    <div class="col-sm-1">
                      <span class="custom-radio float-left">
                        <input type="radio" name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if $delivery_option == $carrier_id} checked{/if}>
                        <span></span>
                      </span>
                    </div>
                    <label for="delivery_option_{$carrier.id}" class="col-sm-11 delivery-option-2">
                      <div class="row">
                        <div class="col-sm-5 col-12">
                          <div class="row">
                            {if $carrier.logo}
                            <div class="col-3">
                                <img src="{$carrier.logo}" alt="{$carrier.name}" />
                            </div>
                            {/if}
                            <div class="{if $carrier.logo}col-9{else}col-12{/if}">
                              <span class="h6 carrier-name">{$carrier.name}</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-sm-4 col-12">
                          <span class="carrier-delay">{$carrier.delay}</span>
                        </div>
                        <div class="col-sm-3 col-12">
                          <span class="carrier-price">{$carrier.price}</span>
                        </div>
                      </div>
                    </label>
                  </div> *}
                  <div class="row carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
                    {$carrier.extraContent nofilter}
                  </div>
                  {* <div class="clearfix"></div> *}
              {/foreach}
            </div>
          {/block}
          <div class="order-options mt-3">
            <div id="delivery" class="form-group">
              <label for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
              <textarea class="form-control" rows="2" cols="120" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
            </div>

            {* {if $recyclablePackAllowed}
              <span class="custom-checkbox">
                <input type="checkbox" id="input_recyclable" name="recyclable" value="1" {if $recyclable} checked {/if}>
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                <label for="input_recyclable">{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</label>
              </span>
            {/if} *}

            {* {if $gift.allowed}
              <span class="custom-checkbox">
                <input class="js-gift-checkbox" id="input_gift" name="gift" type="checkbox" value="1" {if $gift.isGift}checked="checked"{/if}>
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                <label for="input_gift">{$gift.label}</label >
              </span>

              <div id="gift" class="collapse{if $gift.isGift} in{/if}">
                <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
                <textarea rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
              </div>
            {/if} *}

          </div>
        </div>
        <div class="d-flex justify-content-end">
          <button type="submit" class="continue btn btn-primary float-right" name="confirmDeliveryOption" value="1">
            {l s='Continue' d='Shop.Theme.Actions'}
          </button>
        </div>
      </form>
    {else}
      <p class="alert alert-danger">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</p>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}
