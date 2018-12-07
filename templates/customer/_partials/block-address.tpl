
{block name='address_block_item'}
  <article id="address-{$address.id}" class="address card address-item" data-id-address="{$address.id}" style="max-width:20rem;">
    <header class="card-body">
      <h1 class="h4">{$address.alias}</h1>
      <p>{$address.formatted nofilter}</p>
    </header>

    {block name='address_block_item'}
      <footer class="actions address-actions card-footer d-flex">
        <a
          class="edit-address text-muted icon-adjust mr-auto"
          data-link-action="edit-address"
          href="{url entity=address id=$address.id}"
        >
          <i class="material-icons">edit</i><span>{l s='Edit' d='Shop.Theme.Actions'}</span>
        </a>
        <a
          class="delete-address text-muted icon-adjust"
          data-link-action="delete-address"
          href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}"
        >
          <i class="material-icons">delete</i><span>{l s='Delete' d='Shop.Theme.Actions'}</span>
        </a>
      </footer>
    {/block}
  </article>
{/block}
