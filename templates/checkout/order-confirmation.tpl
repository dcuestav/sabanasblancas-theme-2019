{extends file='page.tpl'}

{block name='gtm_data_layer' append}
  <script>
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
      'transactionId': '{$order.details.id}',
      'transactionTotal': parseFloat({$order.totals.total_paid.amount}) - parseFloat({$order.amounts.subtotals.tax.amount}) - parseFloat({$order.shipping[0].shipping_cost_tax_incl}),
      'transactionTax': parseFloat({$order.amounts.subtotals.tax.amount}),
      'transactionShipping': parseFloat({$order.shipping[0].shipping_cost_tax_incl}),
      'transactionProducts': [
        {foreach from=$order.products item=product}
          {
          'sku': '{$product.product_reference}',
          'name': '{$product.name}',
          'category': '{$product.reference}'.substr(0,8),
          'price': parseFloat({$product.total_price_tax_excl}),
          'quantity': parseInt({$product.quantity})
          },
        {/foreach}
      ]
    });
  </script>
{/block}

{block name='page_content_container' prepend}
    <section id="content-hook_order_confirmation" class="alert alert-primary mb-3">

      {block name='order_confirmation_header'}
        <h3 class="h1 mb-3 icon-adjust" id="order-confirmation-title">
          <i class="material-icons">done</i>
          <span>{l s='Your order is confirmed' d='Shop.Theme.Checkout'}</span>
        </h3>
      {/block}

      <p class="mb-0">
        {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
        {if $order.details.invoice_url}
          {* [1][/1] is for a HTML tag. *}
          {l
            s='You can also [1]download your invoice[/1]'
            d='Shop.Theme.Checkout'
            sprintf=[
              '[1]' => "<a href='{$order.details.invoice_url}'>",
              '[/1]' => "</a>"
            ]
          }
        {/if}
      </p>

      {block name='hook_order_confirmation'}
        {$HOOK_ORDER_CONFIRMATION nofilter}
      {/block}

    </section>
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-order-confirmation card mb-3">
    <div class="card-body">
      <div class="row">

        {* Variable para que Google Ads obtenga el valor de la transacción *}
        <script>
          window.gtm_orderValueTaxExcl = {$order.subtotals.products.amount - $order.subtotals.tax.amount};
        </script>

        {block name='order_confirmation_table'}
          {include
            file='checkout/_partials/order-confirmation-table.tpl'
            products=$order.products
            subtotals=$order.subtotals
            totals=$order.totals
            labels=$order.labels
            add_product_link=false
          }
        {/block}

        {block name='order_details'}
          <div id="order-details" class="offset-lg-1 col-md-4">
            <h3 class="h3 card-title">{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
            <ul class="list-unstyled">
              <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
              <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
              {if !$order.details.is_virtual}
                <li>
                  {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}<br>
                  <em>{$order.carrier.delay}</em>
                </li>
              {/if}
            </ul>
          </div>
        {/block}

      </div>
    </div>
  </section>

  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <section id="content-hook_payment_return" class="card definition-list mb-3">
      <div class="card-body">
        <div class="row">
          <div class="col-md-12">
            {$HOOK_PAYMENT_RETURN nofilter}
          </div>
        </div>
      </div>
    </section>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
      <div id="registration-form" class="card mb-3">
        <div class="card-body">
          <h4 class="h4">{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
          {render file='customer/_partials/customer-form.tpl' ui=$register_form}
        </div>
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <section id="content-hook-order-confirmation-footer">
      {hook h='displayOrderConfirmation2'}
    </section>
  {/block}
{/block}
