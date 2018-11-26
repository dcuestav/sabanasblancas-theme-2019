
{block name='address_selector_blocks'}
  {foreach $addresses as $address}
    <div class="col-md-6 mb-3">
      <article
        class="card address-item{if $address.id == $selected} selected{/if}"
        id="{$name|classname}-address-{$address.id}"
      >
        <header class="card-body">

          <div class="form-check">
            <input
                id="address-{$address.id}"
                class="form-check-input"
                type="radio"
                name="{$name}"
                value="{$address.id}"
                {if $address.id == $selected}checked{/if}
              >
            <label class="form-check-label" for="address-{$address.id}">
              <span class="address-alias h4">{$address.alias}</span>
              <div class="address">{$address.formatted nofilter}</div>
            </label>
          </div>
        </header>
        <footer class="address-footer card-footer d-flex">
          {if $interactive}
            <a
              class="edit-address text-muted icon-adjust mr-auto"
              data-link-action="edit-address"
              href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}"
            >
              <i class="material-icons">edit</i><span>{l s='Edit' d='Shop.Theme.Actions'}</span>
            </a>
            <a
              class="delete-address text-muted icon-adjust"
              data-link-action="delete-address"
              href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}"
            >
              <i class="material-icons">delete</i><span>{l s='Delete' d='Shop.Theme.Actions'}</span>
            </a>
          {/if}
        </footer>
      </article>
    </div>
  {/foreach}
  {if $interactive}
    <p>
      <button class="ps-hidden-by-js form-control-submit center-block" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
    </p>
  {/if}
{/block}
