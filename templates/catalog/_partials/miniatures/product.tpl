{block name='product_miniature_item'}
  <article class="card product-miniature-card" data-id-product="{$product.id_product}" 
  data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">

    {block name='product_thumbnail'}
      <a href="{$product.url}" class="card-img-top position-relative">
        <img
          class="img-fluid"
          src = "{$product.cover.medium.url}"
          alt = "{$product.cover.legend}"
          data-full-size-image-url = "{$product.cover.large.url}"
          {if count($product.images) >= 2}
            {if $product.images[0].id_image != $product.cover.id_image }
              data-alternative-image = "{$product.images[0].medium.url}"
            {else}
              data-alternative-image = "{$product.images[1].medium.url}"
            {/if}
          {/if}
        >
        <span class="show-brand-on-product-miniature"
          data-brand-id = "{$product.embedded_attributes.id_manufacturer}"
          data-brand-name = "{$product.manufacturer_name}"></span>
      </a>
    {/block}

    {block name='product_flags'}
      {if count($product.flags)}
        <ul class="product-flags list-unstyled h4">
          {foreach from=$product.flags item=flag}
            <li class="badge badge-success {$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
      {/if}
    {/block}

    <div class="card-body text-center">
      {block name='product_name'}
        <h5 class="card-title mb-3" itemprop="name"><a href="{$product.url}">{$product.name}</a></h5>
      {/block}

      {block name='product_description_short'}
        <div class="card-text mb-2" itemprop="description" hidden>{$product.description_short nofilter}</div>
      {/block}

      {* {block name='product_list_actions'}
        <div class="product-list-actions">
          {if $product.add_to_cart_url}
              <a
                class = "add-to-cart"
                href  = "{$product.add_to_cart_url}"
                rel   = "nofollow"
                data-id-product="{$product.id_product}"
                data-id-product-attribute="{$product.id_product_attribute}"
                data-link-action="add-to-cart"
              >{l s='Add to cart' d='Shop.Theme.Actions'}</a>
          {/if}
          {hook h='displayProductListFunctionalButtons' product=$product}
        </div>
      {/block} *}

      {* {block name='product_quick_view'}
      {/block} *}

      {block name='product_variants'}
        {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
      {/block}

      {block name='product_price_and_shipping'}
        {if $product.show_price}
          <div class="product-price-and-shipping mb-2">

            {hook h='displayProductPriceBlock' product=$product type="before_price"} {* Desde *}

            <span itemprop="price" class="price">{$product.price}</span>

            {if $product.has_discount}
              {hook h='displayProductPriceBlock' product=$product type="old_price"}
              <span class="regular-price text-muted"><s>{$product.regular_price}</s></span>
            {/if}

            {hook h='displayProductPriceBlock' product=$product type="unit_price"}

            {hook h='displayProductPriceBlock' product=$product type="weight"}
          </div>
        {/if}
      {/block}

      {* NO SE MUESTRA LA DISPONBINILIDAD EN EL LISTADO DE PRODUCTOS *}
      {* Solo hay datos de la variante por defecto *}

      {* 
      {block name='product_availability'}
        {if $product.show_availability && $product.availability_message}
          {if $product.availability == 'available'}
            {if $product.quantity > 0}
              <small class="text-success">{$product.availability_message}</small>
            {/if}
          {elseif $product.availability == 'last_remaining_items'}
            <small>{$product.availability_message}</small>
          {/if}
        {/if}
      {/block}
       *}

      {hook h='displayProductListReviews' product=$product}
    </div>

  </article>
{/block}
