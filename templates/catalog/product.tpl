{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    {* DEBUG *}
    {* <div id="product-debug" class="hidden" data-product="{$product|json_encode}"></div>
    <script>productDebug = JSON.parse(document.getElementById('product-debug').dataset.product);console.log(productDebug);</script> *}
    {* FIN DEBUG *}

    <div class="row">
      <div class="col-md-6 col-lg-7">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}

              <div class="d-flex justify-content-center">
                {block name='product_cover_thumbnails'}
                  {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                {/block}
                {* Se incluye dos veces. Aquí se muestra como iconos por el parámetro mode *}
                {include file='catalog/_partials/product-details-constant.tpl' mode='icons'}
              </div>

              {block name='product_description'}
                {if $product.description}
                  <div class="product-description d-none d-md-block mb-md-3">
                    <h4 class="section-title">{l s='Description' d='Shop.Theme.Catalog'}</h4>
                    {$product.description nofilter}
                  </div>
                {/if}
              {/block}

            {/block}
          </section>
        {/block}
      </div>

      <div class="col-md-6 col-lg-5">

        <div class="card product-details-card bg-light mb-3">
          <div class="card-header">
            {* {if isset($manufacturer_image_url)}
              <a href="{$product_brand_url}" class="brand-logo">
                <img src="{$manufacturer_image_url}"/>
              </a>
            {/if} *}
            {block name='page_header_container'}
              {block name='page_header'}
                <h1 class="h3 d-inline" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
              {/block}
            {/block}
            {block name='product_flags'}
              <ul class="product-flags list-unstyled h5 d-inline-block ml-2 mt-2 mb-0">
                {foreach from=$product.flags item=flag}
                  <li class="badge badge-success {$flag.type}">{$flag.label}</li>
                {/foreach}
              </ul>
            {/block}
          </div>

          <div class="card-body">

            {block name='product_prices'}
              {include file='catalog/_partials/product-prices.tpl'}
            {/block}
            
            <div class="product-actions">

              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <p class="h6">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                        <ul class="list-unstyled pl-3">
                          {foreach from=$packItems item=product key=index}
                            <li class="mb-1">
                              <div class="" style="font-size:90%;">{$product.pack_quantity}x {$product.legend}</div>
                              {foreach from=$product.attributes item=attribute}
                                <div class="d-inline-block text-muted pl-3" style="font-size:80%;">
                                    {$attribute['group']}: {$attribute['name']}
                                </div>
                              {/foreach}
                              {if !empty($pack_items_supplier_references) && $pack_items_supplier_references[$index]}
                                <div class="d-inline-block text-muted pl-3" style="font-size:80%;">
                                    {l s='Medida real' d='Shop.Theme.Catalog'}: {$pack_items_supplier_references[$index]}
                                </div>
                              {/if}
                            </li>
                          {/foreach}
                        </ul>
                      </section>
                    {/if}
                  {/block}

                  {* {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block} *}

                  <hr class="mb-4 mt-4">

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}
                </form>
              {/block}

            </div>
          </div>
        </div>

        {block name='hook_display_reassurance'}
          {hook h='displayReassurance'}
        {/block}

        {if $product.description}
          <div class="product-description d-md-none mb-xs-3 mb-sm-3">
            <h4 class="section-title">{l s='Description' d='Shop.Theme.Catalog'}</h4>
            {$product.description nofilter}
          </div>
        {/if}

        <div class="product-information">

          {* {block name='product_description_short'}
            <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
          {/block} *}

          {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
              {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
            {/block}
          {/if}

          {block name='product_details'}
            {include file='catalog/_partials/product-details.tpl'}
            {include file='catalog/_partials/product-details-constant.tpl' mode='text'}
          {/block}

          {block name='product_attachments'}
            {if $product.attachments}
              <div class="tab-pane fade in" id="attachments" role="tabpanel">
                <section class="product-attachments">
                  <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                  {foreach from=$product.attachments item=attachment}
                    <div class="attachment">
                      <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                      <p>{$attachment.description}</p
                      <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                        {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                      </a>
                    </div>
                  {/foreach}
                </section>
              </div>
            {/if}
          {/block}

          {block name='product_additional_info'}
            {include file='catalog/_partials/product-additional-info.tpl'}
          {/block}

          {* Hook extra content deshabilitado *}
          {* {foreach from=$product.extraContent item=extra key=extraKey}
            <div class="{$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}" {/foreach}>
              {$extra.content nofilter}
            </div>
          {/foreach} *}

        </div>
      </div>
    </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <h4 class="section-title">
            {l s='You might also like' d='Shop.Theme.Catalog'}
          </h4>
          <div id="featuredProductsCarousel" class="flexslider carousel">
            <ul class="slides">
              {foreach from=$accessories item="product_accessory"}
                <li>
                  {include file="catalog/_partials/miniatures/product.tpl" product=$product_accessory}
                </li>
              {/foreach}
            </ul>
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
