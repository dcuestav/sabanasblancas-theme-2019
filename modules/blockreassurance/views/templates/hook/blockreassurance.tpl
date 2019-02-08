
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

<div id="block-reassurance" class="mb-md-3">
  <ul class="list-group">
    <li class="list-group-item list-group-item-action text-center">
      <p><strong>{l s='Envío gratis 24/48h' d='Shop.Sbreassurance'}</strong> {l s='por 50€ de compra' d='Shop.Sbreassurance'}</p>
      <img class="img-fluid" src="{$urls.theme_assets}img/logos-envio.png" alt="MRW UPS Click Canarias">

      <a href="{$urls.pages.cms}&id_cms=1" title="{l s='Condiciones de envío' d='Shop.Sbreassurance'}" rel="nofollow">
        <i class="material-icons more-info-icon" 
          data-toggle="tooltip" data-html="true" data-placement="left"
          title="<p>{l s='3,90€ para pedidos de menos de 50€' d='Shop.Sbreassurance'}</p><p>{l s='Válido para España penínsular y Baleares. Sólo días laborables' d='Shop.Sbreassurance'}</p><p>{l s='También enviamos a Canarias y Europa' d='Shop.Sbreassurance'}</p><p>{l s='Clic para más info...' d='Shop.Sbreassurance'}</p>"
        >error_outline</i>
      </a>
    </li>
    <li class="list-group-item list-group-item-action text-center icon-adjust">
      <i class="material-icons">swap_horiz</i>
      <span><strong>{l s='14 días' d='Shop.Sbreassurance'}</strong> {l s='para cambios y devoluciones' d='Shop.Sbreassurance'}</span>

      <a href="{$urls.pages.cms}&id_cms=6" title="{l s='Política de devoluciones' d='Shop.Sbreassurance'}" rel="nofollow">
        <i class="material-icons more-info-icon" 
          data-toggle="tooltip" data-html="true" data-placement="left"
          title="<p>{l s='Conserve el embalaje original' d='Shop.Sbreassurance'}</p><p>{l s='El transporte de vuelta es por cuenta del cliente, excepto defectos de fabricación' d='Shop.Sbreassurance'}</p><p>{l s='Clic para más info...' d='Shop.Sbreassurance'}</p>"
        >error_outline</i>
      </a>
    </li>
    <li class="list-group-item list-group-item-action text-center">
      <img class="img-fluid" src="{$urls.theme_assets}img/logos-pago.png" alt="Visa Mastercard Paypal Sabadell">
    </li>
  </ul>
</div>

