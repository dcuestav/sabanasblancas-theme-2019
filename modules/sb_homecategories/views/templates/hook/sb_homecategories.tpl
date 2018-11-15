<!-- Block SB homecategories -->
<section id="sb-home-categories">
  <h4 class="section-title">
    {l s='Main categories' d='Shop.Theme.Catalog'}
  </h4>
  <ul class="category-grid list-unstyled">
    {foreach from=$homecategories item="homecategory"}
      <li>
        {block name='category_miniature'}
          {include file='catalog/_partials/miniatures/category.tpl' category=$homecategory}
        {/block}
      </li>
    {/foreach}
  </ul>
</section>
{* {debug} *}
<!-- /Block SB homecategories -->