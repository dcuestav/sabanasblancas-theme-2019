{if $product.show_price}
  <div class="product-prices mb-3">

    <div class="d-flex justify-content-around">

      {* PRECIO FINAL Y ORIGINAL *}
      {block name='product_price'}
        <div class="price-info-column main-price">
          <div
            class="product-price"
            itemprop="offers"
            itemscope
            itemtype="https://schema.org/Offer"
          >
            <link itemprop="availability" href="{$product.seo_availability}"/>
            <meta itemprop="priceCurrency" content="{$currency.iso_code}">
            <div class="current-price">
              <span itemprop="price" content="{$product.price_amount}">{$product.price}</span>
            </div>
          </div>
          {if $configuration.display_taxes_label}
            <div class="price-info-column-text">
              {$product.labels.tax_long}
            </div>
          {/if}
        </div>

        {if $product.has_discount}
          <div class="price-info-column">
            <div class="price-info-column-text">{l s='Before' d='Shop.Theme.Catalog'}</div>
            <div class="price-info-column-data">
              {hook h='displayProductPriceBlock' product=$product type="old_price"}
              <span class="regular-price"><s>{$product.regular_price}</s></span>
            </div>
          </div>
        {/if}
      {/block}

      {* DESCUENTO *}
      {block name='product_discount'}
        {if $product.has_discount}
          <div class="price-info-column">
            <div class="price-info-column-text">{l s='Discount' d='Shop.Theme.Catalog'}</div>
            <div class="price-info-column-data">
              {if $product.discount_type === 'percentage'}
                <span class="discount discount-percentage">{$product.discount_percentage_absolute}</span>
              {else}
                <span class="discount discount-amount">{$product.discount_to_display}</span>
              {/if}
            </div>
          </div>
        {/if}
      {/block}

      {* PRECIO UNITARIO *}
      {block name='product_unit_price'}
        {if $displayUnitPrice}
          <div class="price-info-column">
            <div class="price-info-column-text">{l s='Per unit' d='Shop.Theme.Catalog'}</div>
            <div class="price-info-column-data">
              <span class="product-unit-price sub">{$product.unit_price_full}</span>
            </div>
          </div>
        {/if}
      {/block}

      {* PRECIO SIN IMPUESTOS *}
      {block name='product_without_taxes'}
        {if $priceDisplay == 2}
          <div class="price-info-column">
            <div class="price-info-column-text">{l s='Tax. excl.' d='Shop.Theme.Catalog'}</div>
            <div class="price-info-column-data">
              <span class="product-without-taxes">{$product.price_tax_exc}</span>
            </div>
          </div>
        {/if}
      {/block}

      {* PRECIO PACK *}
      {block name='product_pack_price'}
        {if $displayPackPrice}
          <div class="price-info-column">
            <div class="price-info-column-text">{l s='Separate' d='Shop.Theme.Catalog'}</div>
            <div class="price-info-column-data">
              <span>{$noPackPrice}</span>
            </div>
          </div>
        {/if}
      {/block}

      {* ECOTASA *}
      {* {block name='product_ecotax'}
        {if $product.ecotax.amount > 0}
          <div class="price-info-column">
            <p class="price-ecotax price-info-column-text">{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
              {if $product.has_discount}
                {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
              {/if}
            </p>
          </div>
        {/if}
      {/block} *}

    </div>

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}
    {hook h='displayProductPriceBlock' product=$product type="price"}
    {hook h='displayProductPriceBlock' product=$product type="after_price"}

    

    {* <div class="debug text-muted">
      show_availability: {$product.show_availability}<br>
      availability: {$product.availability}<br>
      availability_message: {$product.availability_message}<br>
      additional_delivery_times: {$product.additional_delivery_times}<br>
      delivery_information: {$product.delivery_information}<br>
      quantity: {$product.quantity}<br>
      delivery_in_stock: {$product.delivery_in_stock}<br>
      delivery_out_stock: {$product.delivery_out_stock}<br>
    </div> *}

    {* {debug} *}

    {* DISPONIBILIDAD *}

    {* <div class="d-flex justify-content-around">
      <div class="">
          {if $product.show_availability && $product.availability_message}
            {if $product.availability == 'available'}
              {if $product.quantity == 0}
                <span id="product-availability" class="icon-adjust">
                  <i class="material-icons">error_outline</i>
                  <span>{$product.availability_message}</span>
                </span>
              {else}
                <span id="product-availability" class="text-success icon-adjust">
                  <i class="material-icons">check_circle</i>
                  <span>{$product.availability_message}</span>
                </span>
              {/if}
            {elseif $product.availability == 'last_remaining_items'}
              <span id="product-availability" class="icon-adjust">
                <i class="material-icons">error_outline</i>
                <span>{$product.availability_message}</span>
              </span>
            {else}
              <span id="product-availability" class="text-danger icon-adjust">
                <i class="material-icons">warning</i>
                <span>{$product.availability_message}</span>
              </span>
            {/if}
          {/if}
        
      </div>
    

      {if $product.additional_delivery_times == 1}
        {if $product.delivery_information}
          {if $product.quantity > 0}
            <div class="text-success icon-adjust">
              <i class="material-icons">check_circle</i>
              <span>{$product.delivery_information}</span>
            </div>
          {elseif $product.quantity == 0 && $product.add_to_cart_url}
            <div class="icon-adjust">
              <i class="material-icons">error_outline</i>
              <span>{$product.delivery_information}</span>
            </div>
          {/if}
        {/if}
        
      {elseif $product.additional_delivery_times == 2}
        {if $product.quantity > 0}
          <div class="text-success icon-adjust">
            <i class="material-icons">check_circle</i>
            <span>{$product.delivery_in_stock}</span>
          </div>
        <!-- Out of stock message should not be displayed if customer can't order the product. -->
        {elseif $product.quantity == 0 && $product.add_to_cart_url}
          <div class="icon-adjust">
            <i class="material-icons">error_outline</i>
            <span>{$product.delivery_out_stock}</span>
          </div>
        {/if}
      {/if}

    </div> *}

    {* FIN DISPONIBILIDAD *}

    {* DISPONIBILIDAD v2 *}
    {* TODO: Tener en cuenta $product.show_availability *}

    <div id="availability-delivery-help" data-partial-delivery-from="10" data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">

      {if $product.allow_oosp}
        <!-- Pedidos sin stock habilitados -->

        {if $product.quantity<=0}

          <div class="out-of-stock text-center">
            <div class="text-black icon-adjust" 
              data-toggle="tooltip" data-placement="bottom" title="{l s='Este producto estará disponible en los próximos días. Le avisaremos cuando hagamos el envío' d='Shop.Theme.Availability'}">
              <i class="material-icons">error_outline</i>
              <span>{l s='Out of stock' d='Shop.Theme.Availability'}</span>
            </div>
            <div class="d-md-none">
              <small>{l s='Este producto estará disponible en los próximos días. Le avisaremos cuando hagamos el envío' d='Shop.Theme.Availability'}</small>
            </div>
          </div>

        {else if $product.quantity_wanted > $product.quantity and $product.quantity < 10}

          <div class="quantity-wanted-greater-than-stock text-center">
            <div class="text-black icon-adjust" 
              data-toggle="tooltip" data-placement="bottom" title="{l s='Consultenos el plazo de entrega si necesita una cantidad mayor' d='Shop.Theme.Availability'}">
              <i class="material-icons">error_outline</i>
              <span>{l s='Solo quedan %quantity% en stock' d='Shop.Theme.Availability'
                sprintf=['%quantity%' => $product.quantity]}</span>
            </div>
            <div class="d-md-none">
              <small>{l s='Consultenos el plazo de entrega si necesita una cantidad mayor' d='Shop.Theme.Availability'}</small>
            </div>
          </div>

        {else if $product.quantity_wanted > $product.quantity and $product.quantity >= 10}

          <div class="quantity-wanted-greater-than-stock-with-partial-delivery text-center">
            <div class="text-black icon-adjust" 
              data-toggle="tooltip" data-placement="bottom" title="{l s='Consultenos la posibilidad de hacer un envío parcial' d='Shop.Theme.Availability'}">
              <i class="material-icons">error_outline</i>
              <span>{l s='Solo quedan %quantity% en stock' d='Shop.Theme.Availability'
                sprintf=['%quantity%' => $product.quantity]}</span>
            </div>
            <div class="d-md-none">
              <small>{l s='Consultenos la posibilidad de hacer un envío parcial' d='Shop.Theme.Availability'}</small>
            </div>
          </div>

        {else if $product.quantity_wanted <= $product.quantity}

          <div class="quantity-wanted-lower-than-stock text-center">
            <div class="text-success icon-adjust" 
              data-toggle="tooltip" data-placement="bottom" title="{l s='El producto está disponible y lo enviaremos en un plazo de 24 horas (de lunes a viernes)' d='Shop.Theme.Availability'}">
              <i class="material-icons">check_circle</i>
              <span>{l s='En stock, envío en 24 horas' d='Shop.Theme.Availability'}</span>
            </div>
            <div class="d-md-none">
              <small>{l s='El producto está disponible y lo enviaremos en un plazo de 24 horas (de lunes a viernes)' d='Shop.Theme.Availability'}</small>
            </div>
          </div>
          
        {/if}

      {else}
        <!-- Pedidos sin stock deshabilitados -->

        {if $product.quantity<=0}

          <div class="out-of-stock text-center">
            <div class="text-black icon-adjust" 
              data-toggle="tooltip" data-placement="bottom" title="{l s='Este producto ha dejado de estar a la venta' d='Shop.Theme.Availability'}">
              <i class="material-icons">error_outline</i>
              <span>{l s='No disponible' d='Shop.Theme.Availability'}</span>
            </div>
            <div class="d-md-none">
              <small>{l s='Este producto ha dejado de estar a la venta' d='Shop.Theme.Availability'}</small>
            </div>
          </div>

        {else}

          <div class="quantity-wanted-greater-than-stock 
            quantity-wanted-greater-than-stock-with-partial-delivery 
            quantity-wanted-lower-than-stock text-center">
            <div class="text-black icon-adjust" 
              data-toggle="tooltip" data-placement="bottom" title="{l s='Últimas unidades a la venta' d='Shop.Theme.Availability'}">
              <i class="material-icons">error_outline</i>
              <span>{l s='Solo quedan %quantity% en stock' d='Shop.Theme.Availability'
                sprintf=['%quantity%' => $product.quantity]}</span>
            </div>
            <div class="d-md-none">
              <small>{l s='Últimas unidades a la venta' d='Shop.Theme.Availability'}</small>
            </div>
          </div>
          
        {/if}

      {/if}
    </div>

    



    {* FIN DISPONIBILIDAD v2 *}

    <hr>

    

  </div>

{/if}
