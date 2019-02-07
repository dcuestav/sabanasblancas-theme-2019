{foreach from=$listing.products item=product}
    <script type="application/ld+json">
    {
        "@context": "http://schema.org/",
        "@type": "Product",
        "name": "{$product.name}",
        "image": "{$link->getImageLink($product.link_rewrite, $product.id_image, 'large_default')}",
        "sku": "{$product.reference_to_display}",
        "offers": {
            "@type": "Offer",
            "priceCurrency": "{$currency.iso_code}",
            "price": "{$product.price_amount}",
            "availability": "{if $product.quantity>0}https://schema.org/InStock{else}https://schema.org/OutOfStock{/if}",
            "url": "{$product.link}"
        }
    }
    </script>
{/foreach}