
{extends file='page.tpl'}

{* {block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block} *}

{block name='page_content_container'}
  <section id="content" class="page-content password-form row">
    <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-2 col-xl-6 offset-xl-3">
      <div class="card bg-light">

        <div class="card-header">
          <h1 class="h3">
            {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
          </h1>
        </div>

        {block name='page_content'}
          <form action="{block name='form_new_password_actionurl'}{$urls.pages.password}{/block}" method="post">
            <div class="card-body">

              {block name='form_new_password_header'}
                <div class="alert alert-primary" role="alert">
                  {l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}
                </div>
              {/block}

              {block name='form_new_password_form_fields'}
                <section class="form-fields">

                  <div class="form-group row">
                    <label for="email" class="col-md-3 col-form-label required">{l s='Email' d='Shop.Forms.Labels'}</label>
                    <div class="col-md-6">
                      <input 
                        id="email"
                        class="form-control"
                        name="email" 
                        type="email" 
                        value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" 
                        required>
                    </div>
                  </div>

                </section>
              {/block}

              {block name='form_new_password_footer'}
                <footer class="form-footer d-flex justify-content-end">
                  <button type="submit" name="submit" class="btn btn-primary">
                    {l s='Send reset link' d='Shop.Theme.Actions'}
                  </button>
                </footer>
              {/block}

            </div>
          </form>
        {/block}
      </div>
    </div>
  </section>
{/block}

{block name='page_footer'}
  <a href="{$urls.pages.authentication}" class="btn btn-light mt-3">
    {l s='Back to Login' d='Shop.Theme.Actions'}
  </a>
{/block}
