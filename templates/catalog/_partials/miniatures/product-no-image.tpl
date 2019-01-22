{* Es una copia modificada de catalog\_partials\miniatures\product.tpl *}
{* Tarjeta de producto sin imagen y con la descripción en lugar del nombre *}
{** Se utiliza en 
* themes\sabanasblancas\templates\catalog\_partials\products.tpl 
* modules\sb_productsincategory\views\templates\hook\productscategory.tpl
*}

{block name='product_miniature_item'}
  <article class="card product-miniature-card" data-id-product="{$product.id_product}" 
  data-id-product-attribute="{$product.id_product_attribute}" onclick="window.location.href='{$product.url}'">

    <div class="card-body d-flex flex-column justify-content-between text-center">
      {block name='product_name'}
        {if empty($product.description)}
            <h5 class="mb-3"><a href="{$product.url}">{$product.name}</a></h5>
        {else}
            <h4 class="mb-3"><a href="{$product.url}">{$product.description|truncate:30|replace:'<p>':''|replace:'</p>':''}</a></h4>
        {/if}
      {/block}

      {block name='product_description_short'}
        <div class="card-text mb-2" hidden>{$product.description_short nofilter}</div>
      {/block}

      {block name='product_variants'}
        {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
      {/block}

      {block name='product_price_and_shipping'}
        {if $product.show_price}
          <div class="product-price-and-shipping mb-2">

            {hook h='displayProductPriceBlock' product=$product type="before_price"} {* Desde *}

            <span class="price">{$product.price}</span>

            {if $product.has_discount}
              {hook h='displayProductPriceBlock' product=$product type="old_price"}
              <span class="regular-price text-muted"><s>{$product.regular_price}</s></span>
            {/if}

            {hook h='displayProductPriceBlock' product=$product type="unit_price"}

            {hook h='displayProductPriceBlock' product=$product type="weight"}
          </div>
        {/if}
      {/block}

      {block name='product_sizes'}
        {if isset($product.number_of_sizes) && $product.number_of_sizes > 1}
          <small class="text-success">{l s='%sizes_count% tallas disponibles' d='Shop.Sabanasblancas' sprintf=['%sizes_count%' => $product.number_of_sizes]}</small>
        {/if}
      {/block}

      {block name='pack_product_stock'}
        {if $product.pack && $product.quantity_all_versions>0}
          <small class="text-success">{l s='In stock' d='Shop.Theme.Catalog'}</small>
        {/if}
      {/block}

      {hook h='displayProductListReviews' product=$product}
    </div>

  </article>
{/block}