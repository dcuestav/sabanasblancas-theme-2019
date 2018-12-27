{* Se recarga por ajax al cambiar la combinación *}

<div class="images-container">

  {block name='product_cover'}
    <div class="product-cover">
      {if $product.cover}
        <img class="js-qv-product-cover" src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" style="width:100%;" itemprop="image">
        <div class="layer d-none d-md-flex" data-toggle="modal" data-target="#product-modal">
          <i class="material-icons zoom-in">&#xE8FF;</i>
        </div>
      {else}
        <img src="{$urls.no_picture_image.bySize.large_default.url}" style="width:100%;">
      {/if}
    </div>
  {/block}

  {block name='product_images'}
    {if $product.images|count > 1 }
    <div class="js-qv-mask mask">
      <ul class="product-images js-qv-product-images list-unstyled">
        {foreach from=$product.images item=image}
          <li class="thumb-container d-inline-block mr-2 mb-2">
            <img
              class="thumb js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
              data-image-medium-src="{$image.bySize.home_default.url}"
              data-image-large-src="{$image.bySize.large_default.url}"
              src="{$image.bySize.small_default.url}"
              alt="{$image.legend}"
              title="{$image.legend}"
              width="100"
              itemprop="image"
            >
          </li>
        {/foreach}
      </ul>
    </div>
    {/if}
  {/block}
  {hook h='displayAfterProductThumbs'}

  <div class="scroll-box-arrows">
    <i class="material-icons left">keyboard_arrow_left</i>
    <i class="material-icons right">keyboard_arrow_right</i>
  </div>

</div>
