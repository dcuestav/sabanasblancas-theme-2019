<div class="user-info header-nav-item ml-3">
  {if $logged}
    <a
      class="logout"
      href="{$logout_url}"
      rel="nofollow"
      class="icon-adjust"
    >
      <i class="material-icons">exit_to_app</i>
      <span>{l s='Sign out' d='Shop.Theme.Actions'}</span>
    </a>
    <a
      class="account"
      href="{$my_account_url}"
      title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
      rel="nofollow"
      class="icon-adjust"
    >
      <i class="material-icons">logged</i>
      <span>{$customerName}</span>
    </a>
  {else}
    <a
      href="{$my_account_url}"
      title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
      rel="nofollow"
      class="icon-adjust"
    >
      <i class="material-icons">person</i>
      <span>{l s='Sign in' d='Shop.Theme.Actions'}</span>
    </a>
  {/if}
</div>
