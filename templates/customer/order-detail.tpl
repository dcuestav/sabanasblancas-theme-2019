
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}

  {block name='order_infos'}
    <div class="card bg-light mb-4" style="max-width:40rem;">
      <div id="order-infos" class="card-body pb-0">
        <p>
          {l
            s='Order Reference %reference% - placed on %date%'
            d='Shop.Theme.Customeraccount'
            sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
          }
        </p>
        {* {if $order.details.reorder_url}
          <a href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
        {/if} *}

        <p>{l s='Carrier' d='Shop.Theme.Checkout'} {$order.carrier.name}</p>
        <p>{l s='Payment method' d='Shop.Theme.Checkout'} {$order.details.payment}</p>

        {if $order.details.invoice_url}
          <p><a href="{$order.details.invoice_url}">{l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}</a></p>
        {/if}

        {if $order.details.recyclable}
          <p>{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}</p>
        {/if}

        {if $order.details.gift_message}
          <p>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</p>
          <p>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</p>
        {/if}
      </div>
    </div>
  {/block}

  {block name='order_history'}
    <section id="order-history" class="mb-4">
      <h4 class="mb-3">{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h4>
      <table class="table table-bordered" style="max-width:40rem;">
        <thead class="thead-light">
          <tr>
            <th>{l s='Date' d='Shop.Theme.Global'}</th>
            <th>{l s='Status' d='Shop.Theme.Global'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$order.history item=state}
            <tr>
              <td>{$state.history_date}</td>
              <td><span class="order-status-label {$state.contrast}" style="background-color:{$state.color}">{$state.ostate_name}</span></td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </section>
  {/block}

  {block name='order_follow_up'}
    {if $order.follow_up}
      <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
      <a href="{$order.follow_up}">{$order.follow_up}</a>
    {/if}
  {/block}

  {block name='addresses'}
    <div class="card-deck mb-4">

      <article id="invoice-address" class="address card" style="max-width:40rem;">
        <header class="card-header">
          <h1 class="h4">{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</h1>
        </header>
        <div class="card-body">
          {$order.addresses.invoice.formatted nofilter}
        </div>
      </article>

      {if $order.addresses.delivery}
        <article id="delivery-address" class="address card">
          <header class="card-header">
            <h1 class="h4">{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</h1>
          </header>
          <div class="card-body">
            {$order.addresses.delivery.formatted nofilter}
          </div>
        </article>
      {/if}
      
    </div>
  {/block}

  {block name='order_detail'}
    {$HOOK_DISPLAYORDERDETAIL nofilter}
  {/block}

  {block name='order_detail'}
    {if $order.details.is_returnable}
      {include file='customer/_partials/order-detail-return.tpl'}
    {else}
      {include file='customer/_partials/order-detail-no-return.tpl'}
    {/if}
  {/block}

  {block name='order_carriers'}
    {if $order.shipping}
      <div class="table-responsive mb-4">
        <table class="table table-bordered">
          <thead class="thead-light">
            <tr>
              <th>{l s='Date' d='Shop.Theme.Global'}</th>
              <th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
              <th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
              <th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
              <th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$order.shipping item=line}
              <tr>
                <td>{$line.shipping_date}</td>
                <td>{$line.carrier_name}</td>
                <td>{$line.shipping_weight}</td>
                <td>{$line.shipping_cost}</td>
                <td>{$line.tracking nofilter}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    {/if}
  {/block}

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}

{/block}
