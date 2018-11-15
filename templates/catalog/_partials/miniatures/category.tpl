{block name='category_miniature_item'}
  <a href="{$category.url}" class="category-miniature d-flex flex-column justify-content-center align-items-left">

    <div class="image-link">
      <img src="{$category.image.medium.url}" alt="{$category.image.legend}">
    </div>

    <h4 class="h4">{$category.name}</h4>
    <div class="view-button">
      <button class="btn btn-sm btn-secondary">{l s='View products' d='Shop.Theme.Catalog'}</button>
    </div>

  </a>
{/block}
