
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}

  <h1 class="display-4">{$category.name}</h1>
  {if $category.image}
    <div class="category-cover">
      <img src="{$category.image.large.url}" alt="{$category.image.legend}">
    </div>
  {/if}
  <div id="category-description" class="lead">{$category.description nofilter}</div>

  {block name='category_subcategories'}
    <aside>
      {if $subcategories|count}
        <nav class="subcategories">
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
