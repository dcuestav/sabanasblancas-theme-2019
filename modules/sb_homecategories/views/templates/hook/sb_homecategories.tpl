<!-- Block SB homecategories -->
<section id="sb-home-categories" class="mb-3">
  <h4 class="section-title">
    {l s='Categorías principales' d='Shop.Sabanasblancas'}
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
<!-- /Block SB homecategories -->