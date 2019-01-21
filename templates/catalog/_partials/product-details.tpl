{* Se recarga por ajax al cambiar la combinación *}
{* La información de esta sección es igual para todo el producto, así que la dejaremos en blanco y usaremos otro archivo *}
{* Solo datos estucturados *}
<div id="product-details">
    {if $product.condition}
        <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
    {/if}
    {if $product.reference_to_display}
        <meta itemprop="sku" content="{$product.reference_to_display}" />
    {/if}
</div>