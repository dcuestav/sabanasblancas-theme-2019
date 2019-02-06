
{assign descuentos 5}

<div id="block_myaccount_infos" class="col">
  <h4>
    {l s='Your account' d='Shop.Theme.Customeraccount'}
  </h4>
  <ul class="list-unstyled">
    {foreach key=key from=$my_account_urls item=my_account_url}
        {if $key!=$descuentos}
            <li>
              <a href="{$my_account_url.url}" title="{$my_account_url.title}" rel="nofollow">{$my_account_url.title}</a>
            </li>
        {/if}
    {/foreach}
    {hook h='displayMyAccountBlock'}
	</ul>
</div>
