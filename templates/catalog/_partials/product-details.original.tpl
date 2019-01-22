{* Se recarga por ajax al cambiar la combinación *}

{* <div id="product-details" data-product="{$product|json_encode}"> *}
<div id="product-details">

  <section class="mb-3">
  <h4 class="section-title">{l s='Product Details' d='Shop.Theme.Catalog'}</h4>
  {block name='product_reference'}
    {if isset($product_manufacturer->id)}
      <div>
        <label>{l s='Brand' d='Shop.Theme.Catalog'}</label>
        <span>
          <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
        </span>
      </div>
    {/if}
    {if $product.reference}
      <div>
        <label>{l s='Reference' d='Shop.Theme.Catalog'} </label>
        <span>{$product.reference}</span>
      </div>
    {/if}
  {/block}

  {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
        <span>{$product.condition.label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_quantities'}
    {if $product.show_quantities}
      <div>
        <label>{l s='In stock' d='Shop.Theme.Catalog'}</label>
        <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_availability_date'}
    {if $product.availability_date}
      <div>
        <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
        <span>{$product.availability_date}</span>
      </div>
    {/if}
  {/block}

  {block name='product_out_of_stock'}
    <div>
      {hook h='actionProductOutOfStock' product=$product}
    </div>
  {/block}

  </section>

  {block name='product_features'}
    {if $product.grouped_features}
      <section class="mb-3">
        <h4 class="section-title">{l s='Información adicional' d='Shop.Sabanasblancas'}</h4>
        <div class="list-group">
          {foreach from=$product.grouped_features item=feature}
            <div class="list-group-item list-group-item-action">
              <div class="d-inline-block w-50">{$feature.name}</div>
              <div class="d-inline-block"><strong>{$feature.value|escape:'htmlall'|nl2br nofilter}</strong></div>
            </div>
          {/foreach}
        </div>
      </section>
    {/if}
  {/block}

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
