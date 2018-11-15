<section class="featured-products clearfix mb-3">
  <h4 class="section-title">
    {l s='Popular Products' d='Shop.Theme.Catalog'}
  </h4>
  <div id="featuredProductsCarousel" class="flexslider carousel">
    <ul class="slides">
      {foreach from=$products item="product"}
        <li>
          {include file="catalog/_partials/miniatures/product.tpl" product=$product}
        </li>
      {/foreach}
    </ul>
  </div>
  <a class="all-product-link float-xs-left float-md-right h4" href="{$allProductsLink}">
    {l s='All products' d='Shop.Theme.Catalog'}<i class="material-icons">&#xE315;</i>
  </a>
</section>
