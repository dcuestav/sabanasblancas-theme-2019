
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}

  {if $category.level_depth > 3}
    {$prev_category = $breadcrumb.links[$category.level_depth-2]}
    <a class="btn btn-light icon-adjust mb-3" href="{$prev_category.url}" role="button">
      <i class="material-icons">arrow_back</i>
      <span>{l s='Volver a %prev_category%' d='Shop.Sabanasblancas' sprintf=['%prev_category%' => $prev_category.title]}</span>
    </a>
  {/if}

  <div class="d-flex flex-column flex-sm-row mb-3">
    {if $category.image}
      <div class="category-cover text-center">
        <img src="{$category.image.large.url}" alt="{$category.image.legend}">
      </div>
    {/if}
    <div class="category-text">
      <h1 class="display-4">{$category.name}</h1>
      <div id="category-description" class="lead mb-4">{$category.description nofilter}</div>
    </div>
  </div>

  {block name='category_subcategories'}
    <aside>
      {if $subcategories|count}
        <nav class="subcategories mb-5">
          <ul class="category-grid list-unstyled">
            {foreach from=$subcategories item="subcategory"}
              <li>
                {block name='category_miniature'}
                  {include file='catalog/_partials/miniatures/category.tpl' category=$subcategory}
                {/block}
              </li>
            {/foreach}
          </ul>
        </nav>
      {/if}
    </aside>
  {/block}

{/block}
