
{* Esta página debería ser tipo checkout, sin menús ni pie. Sólo el formulario *}

{extends file='page.tpl'}

{block name='page_header_container'}{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-authentication row">
    <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
      <div class="card bg-light">
        {block name='register_form_container'}
          <header class="card-header">
            <h1 class="h1">{l s='Create an account' d='Shop.Theme.Customeraccount'}</h1>
            <p>{l s='Already have an account?' d='Shop.Theme.Customeraccount'} <a href="{$urls.pages.authentication}">{l s='Log in instead!' d='Shop.Theme.Customeraccount'}</a></p>
          </header>
          <div class="card-body">
            {$hook_create_account_top nofilter}
            <section class="register-form">
              {render file='customer/_partials/customer-form.tpl' ui=$register_form}
            </section>
          </div>
        {/block}
      </div>
    </div>
  </section>
{/block}
