{function product_combination}{foreach from=$data.attributes_values item=attribute key=code} - {$attribute}{/foreach}{/function}
{function product_color}{foreach from=$data.attributes_values item=attribute key=code}{if $code==3}{$attribute}{/if}{/foreach}{/function}

{if $combinations|count}
    {foreach from=$combinations item=combination key=combination_id}
        <script type="application/ld+json">
        {
            "@context": "http://schema.org/",
            "@type": "Product",
            "name": "{$product.name}{product_combination data=$combination}",
            "image": "{$link->getImageLink($product.link_rewrite, $combination.id_image, 'large_default')}",
            "description": "{$page.meta.description}",
            "sku": "{$combination.reference}",
            "color": "{product_color data=$combination}",
            "brand": "{if strpos($product_brand_url,'mash')}Mash{else}SabanasBlancas.es{/if}",
            "offers": {
                "@type": "Offer",
                "priceCurrency": "{$currency.iso_code}",
                "price": "{($combination.price * 1.21)|number_format:2:".":","}",
                "availability": "{if $combination.quantity>0}https://schema.org/InStock{else}https://schema.org/OutOfStock{/if}",
                "url": "{$link->getProductLink($product.id, $product.link_rewrite, $product.category, null, $language.id, $customer.id_shop, $combination_id)|escape:'htmlall':'UTF-8'}"
            }
        }
        </script>
    {/foreach}
{else}
    <script type="application/ld+json">
    {
        "@context": "http://schema.org/",
        "@type": "Product",
        "name": "{$product.name}",
        "image": "{$product.cover_images.main.url}", {* Ojo! Viene de un módulo SB *}
        "description": "{$page.meta.description}",
        "sku": "{$product.reference}",
        "brand": "{if strpos($product_brand_url,'mash')}Mash{else}SabanasBlancas.es{/if}",
        "offers": {
            "@type": "Offer",
            "priceCurrency": "{$currency.iso_code}",
            "price": "{$product.price_amount}",
            "availability": "{$product.seo_availability}",
            "url": "{$product.canonical_url}"
        }
    }
    </script>
{/if}