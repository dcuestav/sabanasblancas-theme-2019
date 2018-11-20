{* modules/ps_contactinfo/nav.tpl *}

<div class="d-none d-md-flex">

	<div class="header-nav-item">
		<a href="https://api.whatsapp.com/send?phone=34{$contact_infos.phone}" method="get" target="_blank" class="position-relative">
			<img alt="" src="{$urls.theme_assets}img/whatsapp.png" class="position-absolute" style="width:24px;top:6px;"> 
			<span style="margin-left: 2rem;">Whatsapp</span>
		</a>
	</div>

	<div class="header-nav-item">
		<a href="tel:+34 {$contact_infos.phone}" class="icon-adjust">
			<i class="material-icons">call</i>
			<span>{$contact_infos.phone}</span>
		</a>
	</div>

	<div class="header-nav-item">
		<a href="mailto:{$contact_infos.email}" class="icon-adjust">
			<i class="material-icons" style="left:calc(50% - 10px);">email</i>
			<span>&nbsp;</span>
		</a>
	</div>

	<div class="header-nav-item d-none d-lg-flex">
		<span>L - V: 9h - 13h y 15h - 17h</span>
	</div>
	
</div>
{* Botón único que abre un desplegable con la info de contacto *}
<div class="dropdown d-md-none header-nav-item">

	<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
		<span>{l s='Contact us' d='Shop.Theme.Global'}</span>
	</a>
	<div class="dropdown-menu p-3">
		<div class="mb-3">
			<a href="https://api.whatsapp.com/send?phone=34{$contact_infos.phone}" method="get" target="_blank" class="position-relative">
				<img alt="" src="{$urls.theme_assets}img/whatsapp.png" class="position-absolute" style="width:24px;top:-2px;"> 
				<span style="margin-left: 2rem;">Whatsapp</span>
			</a>
		</div>
		<div class="mb-3">
			<a href="tel:+34 {$contact_infos.phone}" class="icon-adjust">
				<i class="material-icons">call</i>
				<span>{$contact_infos.phone}</span>
			</a>
		</div>
		<div>
			L - V: 9h - 13h y 15h - 17h
		</div>
	</div>
</div>


