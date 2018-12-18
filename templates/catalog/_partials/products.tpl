<div id="js-product-list">
  <ul class="product-grid list-unstyled">
    {foreach from=$listing.products item="product"}
      <li>
        {block name='product_miniature'}
          {include file='catalog/_partials/miniatures/product.tpl' product=$product hide_images=$category.level_depth>=4}
        {/block}
      </li>
    {/foreach}
  </ul>

  {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}

  {block name='back_to_top'}
    <div class="text-center mt-3 mb-3 d-block d-md-none">
      <a href="#header" role="button" class="btn btn-light">
        <i class="material-icons">keyboard_arrow_up</i>
        <span class="">{l s='Back to top' d='Shop.Theme.Actions'}</span>
      </a>
    </div>
  {/block}
</div>
