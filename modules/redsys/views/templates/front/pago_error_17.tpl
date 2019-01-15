{extends file='page.tpl'}

{block name='page_content'}
	<div class="redsys_ko">
	<h1>{l s='Your credit card payment could not be accomplished' mod='redsys'}</h1>
	<p>
		{l s='Puede que se haya interrumpido el proceso o que haya algún problema con la tarjeta. 
		En cualquier caso, [1]no se descontará el dinero de tu cuenta[/1].' d='Modules.Redsys.Shop' sprintf=['[1]' => "<strong>", '[/1]' => '</strong>']}
	</p>
	<p>
		{l s='Vuelve a intentarlo o elige una forma de pago diferente.' d='Modules.Redsys.Shop'}
	</p>
	<div>
		<a href="{$urls.pages.order}" class="btn btn-lg btn-primary pl-4 pr-4 icon-adjust">
			<i class="material-icons">payment</i>
			<span>{l s='Volver a pasar por caja' d='Modules.Redsys.Shop'}</span>
		</a>
	</div>
	{hook h='displayExpressCheckout'}
{/block}


