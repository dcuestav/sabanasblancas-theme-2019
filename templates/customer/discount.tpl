
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your vouchers' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}

  {if $cart_rules}
    <table class="table">
      <thead>
        <tr>
          <th>{l s='Code' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Description' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Quantity' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Value' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Minimum' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Cumulative' d='Shop.Theme.Checkout'}</th>
          <th>{l s='Expiration date' d='Shop.Theme.Checkout'}</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$cart_rules item=cart_rule}
          <tr>
            <td>{$cart_rule.code}</td>
            <td>{$cart_rule.name}</td>
            <td>{$cart_rule.quantity_for_user}</td>
            <td>{$cart_rule.value}</td>
            <td>{$cart_rule.voucher_minimal}</td>
            <td>{$cart_rule.voucher_cumulable}</td>
            <td>{$cart_rule.voucher_date}</td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  {/if}

{/block}
