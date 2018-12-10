{block name='category_miniature_item'}
  <a href="{$category.url}" class="category-miniature d-flex flex-column justify-content-center align-items-left">

    <img src="{$category.image.medium.url}" alt="{$category.image.legend}" class="image-link">

    <h3 class="category-miniature-title">{$category.name}</h3>
    <div class="view-button">
      <button class="btn btn-sm btn-outline-primary">{l s='Ver productos' d='Shop.Theme.Catalog'}</button>
    </div>

  </a>
{/block}
