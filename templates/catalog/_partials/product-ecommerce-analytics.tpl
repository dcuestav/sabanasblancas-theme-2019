  {* Comercio electrónico mejorada para Analytics *}
  {* Visualización de detalles de un producto *}
  {* Carga al cambiar de variante desde catalog/_partials/product-details.tpl *}
  
  {function product_combination}{foreach from=$data.attributes_values item=attribute key=code} - {$attribute}{/foreach}{/function}

  <script>
    window.dataLayer = window.dataLayer || [];
    {if $combinations|count}
      {literal}
        window.dataLayer.push({
          'event': 'productVariantView',
          'ecommerce': {
            'detail': {
              'products': [{
                {/literal}
                  'id': '{$combinations[$product.id_product_attribute].reference}',
                  'name': '{$product.name}',
                  'price': '{$product.price_amount}',
                  'brand': '{if strpos($product_brand_url,"mash")}Mash{else}{if strpos($product_brand_url,"mimar")}Mimar Textil{else}SabanasBlancas.es{/if}{/if}',
                  'category': '{$product.category_name}',
                  'variant': '{product_combination data=$combinations[$product.id_product_attribute]}'
                {literal}
              }]
            }
          }
        });
      {/literal}
    {else}
      {literal}
        window.dataLayer.push({
          'event': 'productVariantView',
          'ecommerce': {
            'detail': {
              'products': [{
                {/literal}
                  'id': '{$product.reference}',
                  'price': '{$product.price_amount}',
                  'brand': '{if strpos($product_brand_url,"mash")}Mash{else}{if strpos($product_brand_url,"mimar")}Mimar Textil{else}SabanasBlancas.es{/if}{/if}',
                  {if strpos($product.reference, 'PACK-J')==0}
                    'name': '{$product.category_name}',
                    'category': '{$breadcrumb.links.2.title}',
                    'variant': '{$product.name}'
                  {else}
                    'name': '{$product.name}',
                    'category': '{$product.category_name}'
                  {/if}
                {literal}
              }]
            }
          }
        });
      {/literal}
    {/if}
  </script>