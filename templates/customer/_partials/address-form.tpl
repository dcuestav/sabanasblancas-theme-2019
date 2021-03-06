{* customer/_partials/address-form.tpl *}

{block name="address-form"}
  <div class="js-address-form mt-3">
    {include file='_partials/form-errors.tpl' errors=$errors['']}

    {block name="address_form_url"}
      <form
        method="POST"
        action="{url entity='address' params=['id_address' => $id_address]}"
        data-id-address="{$id_address}"
        data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
        novalidate
      >
    {/block}

      {block name="address-form-fields"}
        <section class="form-fields">
          {block name='form_fields'}
            {foreach from=$formFields item="field"}
              {block name='form_field'}
                {form_field field=$field}
              {/block}
            {/foreach}
          {/block}
          <p>
            <span class="required"></span> {l s='Campos obligatorios' d='Shop.Sabanasblancas'}
          </p>
        </section>
      {/block}

      {block name="address-form-footer"}
        <footer class="form-footer d-flex justify-content-end">
          <input type="hidden" name="submitAddress" value="1">
          {block name='form_buttons'}
            <button type="submit" class="btn btn-primary">{l s='Save' d='Shop.Theme.Actions'}</button>
          {/block}
        </footer>
      {/block}
    </form>
  </div>
{/block}
