{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {hook h='displayPaymentTop'}

  {if $is_free}
    <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
  {/if}
  <div class="payment-options mb-5{if $is_free} d-none{/if}">
    {foreach from=$payment_options item="module_options"}
      {foreach from=$module_options item="option"}

        <div class="card js-selectable-card">
          <div class="card-body">
            <div id="{$option.id}-container" class="form-check payment-option">
              {* TODO: Añadir logos *}
              {* <img src="{$option.logo}" class="img-fluid" alt="{$option.call_to_action_text}"> *}
              <input 
                  type="radio" 
                  class="ps-shown-by-js form-check-input {if $option.binary} binary {/if}"
                  name="payment-option" 
                  id="{$option.id}"
                  data-module-name="{$option.module_name}"
                  required
                  {if $selected_payment_option == $option.id || $is_free} checked {/if}
              >
              <label class="form-check-label" for="{$option.id}">
                <div class="h5">{$option.call_to_action_text}</div>
              </label>
              {if $option.additionalInformation}
                <div id="{$option.id}-additional-information"
                  class="js-additional-information definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if}">
                  {$option.additionalInformation nofilter}
                </div>
              {/if}

            </div>
            
          </div>
        </div>

        <div
          id="pay-with-{$option.id}-form"
          class="js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
        >
          {if $option.form}
            {$option.form nofilter}
          {else}
            <form id="payment-form" method="POST" action="{$option.action nofilter}">
              {foreach from=$option.inputs item=input}
                <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
              {/foreach}
              <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
            </form>
          {/if}
        </div>
      {/foreach}
    {foreachelse}
      <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
    {/foreach}
  </div>

  {if $conditions_to_approve|count}
    {* <p class="ps-hidden-by-js"> *}
      {* At the moment, we're not showing the checkboxes when JS is disabled
         because it makes ensuring they were checked very tricky and overcomplicates
         the template. Might change later.
      *}
      {* {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
    </p> *}

    <form id="conditions-to-approve" method="GET">
      <ul class="list-unstyled">
        {foreach from=$conditions_to_approve item="condition" key="condition_name"}
          <li>
            <div class="form-check">
              <input id="conditions_to_approve[{$condition_name}]"
                        name  = "conditions_to_approve[{$condition_name}]"
                        required
                        type  = "checkbox"
                        value = "1"
                        class = "ps-shown-by-js form-check-input"
                >
              <label class="js-terms form-check-label" for="conditions_to_approve[{$condition_name}]">
                {$condition nofilter}
              </label>
            </div>
          </li>
        {/foreach}
      </ul>
    </form>
  {/if}

  {if $show_final_summary}
    {include file='checkout/_partials/order-final-summary.tpl'}
  {/if}

  <div id="payment-confirmation">
    <div class="ps-shown-by-js d-flex justify-content-center">
      <button type="submit" {if !$selected_payment_option} disabled {/if} class="btn btn-lg btn-primary center-block icon-adjust">
        <i class="material-icons">done</i>
        <span>{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</span>
      </button>

      {if $show_final_summary}
        <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert" data-alert="danger">
          {l
            s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
            sprintf=[
              '[1]' => '<a href="#checkout-payment-step">',
              '[/1]' => '</a>',
              '[2]' => '<a href="#conditions-to-approve">',
              '[/2]' => '</a>'
            ]
            d='Shop.Theme.Checkout'
          }
        </article>
      {/if}
    </div>
    {* <div class="ps-hidden-by-js">
      {if $selected_payment_option and $all_conditions_approved}
        <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
      {/if}
    </div> *}
  </div>

  {hook h='displayPaymentByBinaries'}

{/block}
