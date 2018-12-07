
{block name='order_products_table'}
  <form action="{$urls.pages.order_follow}" method="post" class="mb-4">

    <table id="order-products" class="table table-bordered mb-4">
      <thead class="thead-light">
        <tr>
          <th><input type="checkbox"></th>
          <th>{l s='Reference' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Product' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Returned' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Unit price' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Total price' d='Shop.Theme.Catalog'}</th>
        </tr>
      </thead>

      {foreach from=$order.products item=product name=products}
        <tr>
          <td>
            {if !$product.customizedDatas}
              <input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
            {else}
              {foreach $product.customizations  as $customization}
                <input type="checkbox" id="cb_{$product.id_order_detail}" name="customization_ids[{$product.id_order_detail}][]" value="{$customization.id_customization}">
              {/foreach}
            {/if}
          </td>
          <td>{$product.reference}</td>
          <td>{$product.name}
            {if $product.customizations}
              <br />
              {foreach $product.customizations as $customization}
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
          <td class="pt-1 pb-1">
            {if !$product.customizedDatas}

              <div class="form-group row mb-0">
                <label class="col col-form-label">{$product.quantity}</label>
                <div class="col">
                  <select name="order_qte_input[{$product.id_order_detail}]" class="form-control">
                    {section name=quantity start=1 loop=$product.product_quantity+1}
                      <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                    {/section}
                  </select>
                </div>
              </div>

            {else}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
                <select name="customization_qty_input[{$customization.id_customization}]">
                  {section name=quantity start=1 loop=$customization.quantity+1}
                    <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                  {/section}
                </select>
              {/foreach}
            {/if}
          </td>
          <td>{$product.qty_returned}</td>
          <td>{$product.price}</td>
          <td>{$product.total}</td>
        </tr>
      {/foreach}

      <tfoot class="col-md-6">
        {foreach $order.subtotals as $line}
          <tr class="line-{$line.type}">
            <td colspan="3" class="table-offset"></td>
            <td colspan="3">{$line.label}</td>
            <td colspan="1">{$line.value}</td>
          </tr>
        {/foreach}

        <tr class="line-{$order.totals.total.type}">
          <td colspan="3" class="table-offset"></td>
          <td colspan="3">{$order.totals.total.label}</td>
          <td colspan="1">{$order.totals.total.value}</td>
        </tr>
      </tfoot>
    </table>

    <div style="max-width:40rem;">

      <header>
        <h4>{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h4>
        <p>{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
      </header>

      <section class="form-fields">

        <div class="form-group">
          <textarea class="form-control" rows="3" name="returnText" placeholder="{l s='Escriba su mensaje...' d='Shop.Theme.Customeraccount'}"></textarea>
        </div>

        <div class="form-footer d-flex justify-content-end">
          <input type="hidden" name="id_order" value="{$order.details.id}">
          <button type="submit" name="submitReturnMerchandise" class="btn btn-primary">
            {l s='Request a return' d='Shop.Theme.Customeraccount'}
          </button>
        </div>

      </section>

    </div>

  </form>
{/block}
