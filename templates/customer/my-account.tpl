{extends file='page.tpl'}

{block name='page_title'}
  {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-my-account">

    <p>{l s='Welcome to your account. Here you can manage all of your personal information and orders.' d='Shop.Theme.Customeraccount'}</p>

    <div class="row">
      <div class="col-md-6">

        {block name="account_link_list"}
          <div class="link-list list-group">

            {if $customer.addresses|count}
              <a id="addresses-link" href="{$urls.pages.addresses}" class="list-group-item list-group-item-action">
              {l s='Addresses' d='Shop.Theme.Customeraccount'}</a>
            {else}
              <a id="address-link" href="{$urls.pages.address}" class="list-group-item list-group-item-action">
              {l s='Add first address' d='Shop.Theme.Customeraccount'}</a>
            {/if}

            <a id="identity-link" href="{$urls.pages.identity}" class="list-group-item list-group-item-action">
            {l s='Information' d='Shop.Theme.Customeraccount'}</a>

            {if !$configuration.is_catalog}
              <a id="history-link" href="{$urls.pages.history}" class="list-group-item list-group-item-action">
              {l s='Order history and details' d='Shop.Theme.Customeraccount'}</a>
            {/if}

            {if !$configuration.is_catalog}
              <a id="order-slips-link" href="{$urls.pages.order_slip}" class="list-group-item list-group-item-action">
              {l s='Credit slips' d='Shop.Theme.Customeraccount'}</a>
            {/if}

            {* {if $configuration.voucher_enabled && !$configuration.is_catalog}
              <a id="discounts-link" href="{$urls.pages.discount}" class="list-group-item list-group-item-action">
              {l s='Vouchers' d='Shop.Theme.Customeraccount'}</a>
            {/if} *}

            {if $configuration.return_enabled && !$configuration.is_catalog}
              <a id="returns-link" href="{$urls.pages.order_follow}" class="list-group-item list-group-item-action">
              {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}</a>
            {/if}

            {block name='display_customer_account'}
              {hook h='displayCustomerAccount'}
            {/block}

          </div>
        </div>

      </div>
    {/block}

  </section>
{/block}
