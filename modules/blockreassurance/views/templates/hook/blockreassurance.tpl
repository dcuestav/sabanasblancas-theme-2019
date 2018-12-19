
{* {if $elements}
  <div id="block-reassurance" class="mb-3">
    <ul class="list-group">
      {foreach from=$elements item=element}
        <li class="list-group-item list-group-item-primary text-center">
          <div class="block-reassurance-item">
            <img src="{$element.image}" alt="{$element.text}">
            <span class="h6">{$element.text}</span>
          </div>
        </li>
      {/foreach}
    </ul>
  </div>
{/if} *}


<div id="block-reassurance" class="mb-3">
  <ul class="list-group">
    <li class="list-group-item list-group-item-action text-center">
      <p><strong>{l s='Envío gratis 24/48h' d='Shop.Theme.blockreassurance'}</strong> {l s='por 50€ de compra' d='Shop.Theme.blockreassurance'}</p>
      <img class="img-fluid" src="{$urls.theme_assets}img/logos-envio.png" alt="MRW UPS Click Canarias">

      <i class="material-icons more-info-icon" 
        data-toggle="tooltip" data-html="true" data-placement="left"
        title="<p>{l s='3,90€ para pedidos de menos de 50€' d='Shop.Theme.blockreassurance'}</p><p>{l s='Válido para España penínsular y Baleares. Sólo días laborables' d='Shop.Theme.blockreassurance'}</p><p>{l s='También enviamos a Canarias y Europa' d='Shop.Theme.blockreassurance'}</p><p>{l s='Clic para más info...' d='Shop.Theme.blockreassurance'}</p>"
      >error_outline</i>
    </li>
    <li class="list-group-item list-group-item-action text-center icon-adjust">
      <i class="material-icons">swap_horiz</i>
      <span><strong>{l s='14 días' d='Shop.Theme.blockreassurance'}</strong> {l s='para cambios y devoluciones' d='Shop.Theme.blockreassurance'}</span>

      <i class="material-icons more-info-icon" 
        data-toggle="tooltip" data-html="true" data-placement="left"
        title="<p>{l s='Conserve el embalaje original' d='Shop.Theme.blockreassurance'}</p><p>{l s='El transporte de vuelta es por cuenta del cliente, excepto defectos de fabricación' d='Shop.Theme.blockreassurance'}</p><p>{l s='Clic para más info...' d='Shop.Theme.blockreassurance'}</p>"
        {* onclick="window.location.href={$urls.pages}" *}
      >error_outline</i>
    </li>
    <li class="list-group-item list-group-item-action text-center">
      <img class="img-fluid" src="{$urls.theme_assets}img/logos-pago.png" alt="Visa Mastercard Paypal Sabadell">
    </li>
  </ul>
</div>

