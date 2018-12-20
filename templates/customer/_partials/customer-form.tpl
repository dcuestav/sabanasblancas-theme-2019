{block name='customer_form'}

  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" method="post">

    <section class="form-fields">
      {block "form_fields"}
        {foreach from=$formFields item="field"}
          {block "form_field"}
            {form_field field=$field}
          {/block}
        {/foreach}
      {/block}
    </section>

    {block name='customer_form_footer'}
      <footer class="form-footer">
        <input type="hidden" name="submitCreate" value="1">
        <div class="row">
          <div class="col-md-9 text-right">
            {block "form_buttons"}
              <button data-link-action="save-customer" type="submit" class="btn btn-primary">
                {l s='Save' d='Shop.Theme.Actions'}
              </button>
            {/block}
          </div>
        </div>
      </footer>
    {/block}

  </form>
{/block}
