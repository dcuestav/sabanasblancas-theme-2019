 <li class="list-group-item cart-summary-totals">

  {block name='cart_summary_total'}
    <div class="cart-summary-line cart-total">
      <span class="label">{$cart.totals.total.label} {$cart.labels.tax_short}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div>
  {/block}

  {block name='cart_summary_tax'}
    <div class="cart-summary-line">
      <small class="label sub">{$cart.subtotals.tax.label}</small>
      <small class="value sub">{$cart.subtotals.tax.value}</small>
    </div>
  {/block}

</li>
