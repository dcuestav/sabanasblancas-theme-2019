{if $categoryProducts}
<section class="category-products clearfix">
	<h4 class="section-title">
	{l s='Más %category_name%' d='Shop.Sabanasblancas' sprintf=['%category_name%'=>$categoryName|lower]}
	</h4>
	<div id="featuredProductsCarousel" class="flexslider carousel">
		<ul class="slides">
			{foreach from=$categoryProducts item="product_category"}
			<li>
				{if $categoryDepth>=4}
					{include file="catalog/_partials/miniatures/product-no-image.tpl" product=$product_category}
				{else}
					{include file="catalog/_partials/miniatures/product.tpl" product=$product_category}
				{/if}
			</li>
			{/foreach}
		</ul>
	</div>
</section>
{/if}
