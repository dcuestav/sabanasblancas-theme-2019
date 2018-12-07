
{block name='order_messages_table'}
  {if $order.messages}
    <section class="order-messages-list mb-4">
      <h4>{l s='Messages' d='Shop.Theme.Customeraccount'}</h4>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>{l s='From' d='Shop.Forms.Labels'}</th>
            <th>{l s='Message' d='Shop.Forms.Labels'}</th>
          </tr>
        </thead>
        <tbody>
        {foreach from=$order.messages item=message}
          <tr>
            <td>
              {$message.name}<br>
              {$message.message_date}
            </td>
            <td>{$message.message nofilter}</td>
          </tr>
        {/foreach}
        </tbody>
      </table>
    </section>
  {/if}
{/block}

{block name='order_message_form'}
  <section class="order-message-form" style="max-width:40rem;">
    <form action="{$urls.pages.order_detail}" method="post">

      <header>
        <h1 class="h4">{l s='Add a message' d='Shop.Theme.Customeraccount'}</h1>
        <p>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}</p>
      </header>

      <section class="form-fields">

        <div class="form-group row">
          <label for="id_product" class="col-sm-2 col-form-label">{l s='Product' d='Shop.Forms.Labels'}</label>
          <div class="col-sm-10">
            <select name="id_product" id="id_product" class="form-control">
              <option value="0">{l s='-- Choose --' d='Shop.Forms.Labels'}</option>
              {foreach from=$order.products item=product}
                <option value="{$product.product_id}">{$product.product_name}</option>
              {/foreach}
            </select>
          </div>
        </div>

        <div class="form-group">
          <textarea class="form-control" rows="3" name="msgText" placeholder="{l s='Escriba su mensaje...' d='Shop.Theme.Customeraccount'}"></textarea>
        </div>

      </section>

      <div class="form-footer d-flex justify-content-end">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button type="submit" name="submitMessage" class="btn btn-primary">
          {l s='Send' d='Shop.Theme.Actions'}
        </button>
      </div>

    </form>
  </section>
{/block}
