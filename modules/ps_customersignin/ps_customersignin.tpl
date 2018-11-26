<div class="user-info header-nav-item ml-3">
  {if $logged}
    <a
      class="logout icon-adjust only-icon-on-mobile"
      href="{$logout_url}"
      rel="nofollow"
      class="icon-adjust only-icon-on-mobile"
    >
      <i class="material-icons">exit_to_app</i>
      <span>{l s='Sign out' d='Shop.Theme.Actions'}</span>
    </a>
    <a
      class="account icon-adjust only-icon-on-mobile ml-3"
      href="{$my_account_url}"
      title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
      rel="nofollow"
      class="icon-adjust only-icon-on-mobile"
    >
      <i class="material-icons">person_outline</i>
      <span>{$customerName}</span>
    </a>
  {else}
    <a
      href="{$my_account_url}"
      title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
      rel="nofollow"
      class="icon-adjust only-icon-on-mobile"
    >
      <i class="material-icons">person</i>
      <span>{l s='Sign in' d='Shop.Theme.Actions'}</span>
    </a>
  {/if}
</div>
