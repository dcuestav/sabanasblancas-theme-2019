{block name='category_miniature_item'}
  <div class="category-miniature d-flex flex-column justify-content-center align-items-left">

    <a href="{$category.url}" class="image-link">
      <img src="{$category.image.medium.url}" alt="{$category.image.legend}">
    </a>

    <h4 class="h4">
      <a href="{$category.url}">{$category.name}</a>
    </h4>
    <div>
      <a href="{$category.url}" role="button" class="btn btn-sm btn-secondary">{l s='Ver productos' d='Shop.Theme.Catalog'}</a>
    </div>

    {* <div class="category-description">{$category.description nofilter}</div> *}
  </div>
{/block}
