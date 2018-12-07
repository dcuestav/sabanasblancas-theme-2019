
{block name='order_products_table'}
  <div class="table-responsive mb-4">
  <table id="order-products" class="table table-bordered">
    <thead class="thead-light">
      <tr>
        <th>{l s='Reference' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Product' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Unit price' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Total price' d='Shop.Theme.Catalog'}</th>
      </tr>
    </thead>

    {foreach from=$order.products item=product}
      <tr>
        <td>{$product.reference}</td>
        <td>
          {$product.name}
          {if $product.customizations}
            <br />
            {foreach $product.customizations  as $customization}
              <ul>
                {foreach from=$customization.fields item=field}
                  {if $field.type == 'image'}
                    <li><img src="{$field.image.small.url}" alt=""></li>
                  {elseif $field.type == 'text'}
                    <li>{$field.label} : {if (int)$field.id_module}{$field.text nofilter}{else}{$field.text}{/if}</li>
                  {/if}
                {/foreach}
              </ul>
            {/foreach}
          {/if}
        </td>
        <td>
        {if $product.customizations}
          {foreach $product.customizations  as $customization}
            {$customization.quantity}
          {/foreach}
        {else}
          {$product.quantity}
        {/if}
        </td>
        <td>{$product.price}</td>
        <td>{$product.total}</td>
      </tr>
    {/foreach}

    <tfoot class="col-md-6">
      {foreach $order.subtotals as $line}
        <tr class="line-{$line.type}">
          <td colspan="3" class="table-offset"></td>
          <td>{$line.label}</td>
          <td>{$line.value}</td>
        </tr>
      {/foreach}

      <tr class="text-xs-right line-{$order.totals.total.type}">
        <td colspan="3" class="table-offset"></td>
        <td>{$order.totals.total.label}</td>
        <td>{$order.totals.total.value}</td>
      </tr>
    </tfoot>
  </table>
  </div>
{/block}
