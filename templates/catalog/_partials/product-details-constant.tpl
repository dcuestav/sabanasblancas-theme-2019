{* No se recarga por ajax, a diferencia de product-details.tpl *}

{if $product.grouped_features|count || isset($product_manufacturer->id)}

<div class="product-details-constant {$mode}">

  <section class="mb-3">
    <h4 class="section-title">{l s='Información adicional' d='Shop.Theme.Catalog'}</h4>

    <div class="list-group">

        {if isset($product_manufacturer->id)}
          <div class="list-group-item list-group-item-action brand">
            {if $mode=='icons'}
              <img src="{$manufacturer_image_url}" title="{l s='Brand' d='Shop.Theme.Catalog'} {$product_manufacturer->name}"/>
            {elseif $mode=='text'}
              <div class="label">{l s='Brand' d='Shop.Theme.Catalog'}</div>
              <div class="value"><strong>{$product_manufacturer->name}</strong></div>
            {/if}
          </div>
        {/if}

        {foreach from=$product.grouped_features item=feature}
          <div class="list-group-item list-group-item-action">
            {if $mode=='icons'}
              <i class="material-icons icon" style="transform:rotate(180deg);">error_outline</i>
            {/if}
            <div class="label">{$feature.name}</div>
            <div class="value"><strong>{$feature.value|escape:'htmlall'|nl2br nofilter}</strong></div>
          </div>
        {/foreach}

    </div>

  </section>


  {* TODO: Averiguar que es esto *}
  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {if isset($product.specific_references)}
      <section class="mb-3">
        <h4 class="section-title">{l s='Specific References' d='Shop.Theme.Catalog'}</h4>
        <div class="list-group">
          {foreach from=$product.specific_references item=reference key=key}
            <div class="list-group-item list-group-item-action">
              <div class="d-inline-block w-50">{$key}</div>
              <div class="d-inline-block"><strong>{$reference}</strong></div>
            </div>
          {/foreach}
        </div>
      </section>
    {/if}
  {/block}

</div>

{/if}