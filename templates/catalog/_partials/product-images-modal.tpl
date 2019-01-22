{* Se recarga por ajax al cambiar la combinación *}

<div class="modal fade js-product-images-modal" id="product-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        {assign var=imagesCount value=$product.images|count}
        <figure>
          <img class="js-modal-product-cover product-cover-modal" width="{$product.cover.large.width}" 
            src="{$product.cover.large.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}"
            data-toggle="modal" data-target="#product-modal">
          {* <figcaption class="image-caption">
          {block name='product_description_short'}
            <div id="product-description-short">{$product.description_short nofilter}</div>
          {/block}
        </figcaption> *}
        </figure>
        <aside id="thumbnails" class="thumbnails js-thumbnails text-sm-center">
          {block name='product_images'}
            <div class="js-modal-mask mask {if $imagesCount <= 5} nomargin {/if}">
              <ul class="product-images js-modal-product-images list-unstyled">
                {foreach from=$product.images item=image}
                  <li class="thumb-container">
                    <img data-image-large-src="{$image.large.url}" class="thumb js-modal-thumb" src="{$image.medium.url}" alt="{$image.legend}" title="{$image.legend}" width="{$image.medium.width}">
                  </li>
                {/foreach}
              </ul>
            </div>
          {/block}
          {if $imagesCount > 5}
            <div class="arrows js-modal-arrows">
              <i class="material-icons arrow-up js-modal-arrow-up">arrow_drop_up</i>
              <i class="material-icons arrow-down js-modal-arrow-down">arrow_drop_down</i>
            </div>
          {/if}
        </aside>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
