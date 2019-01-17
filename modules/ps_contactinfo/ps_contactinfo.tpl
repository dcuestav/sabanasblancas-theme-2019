{* Aparece a la derecha del footer *}

<div id="block_contact_footer" class="col">

  <div class="mb-3">
		<h4>{l s='L - V: 9h - 13h y 15h - 17h' d='Shop.Sabanasblancas'}</h4>
	</div>

  <div class="mb-3">
		<a href="https://api.whatsapp.com/send?phone=34{$contact_infos.phone}" target="_blank" class="position-relative">
			<img alt="" src="{$urls.theme_assets}img/whatsapp.png" class="position-absolute" style="width:24px;top:0;"> 
			<span style="margin-left: 2rem;">Whatsapp</span>
		</a>
	</div>

	<div class="mb-3">
		<a href="tel:+34{$contact_infos.phone}" class="icon-adjust">
			<i class="material-icons">call</i>
			<span>{$contact_infos.phone}</span>
		</a>
	</div>

	<div class="mb-3">
		<a href="mailto:{$contact_infos.email}" class="icon-adjust">
			<i class="material-icons">email</i>
			<span>{$contact_infos.email}</span>
		</a>
	</div>

	

</div>
