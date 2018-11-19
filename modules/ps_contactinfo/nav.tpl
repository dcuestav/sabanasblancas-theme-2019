<div id="contact-with-whatsapp">
	<a href="https://api.whatsapp.com/send?phone=34{$contact_infos.phone}" method="get" target="_blank" class="icon-adjust">
		<img class="icon" alt="" src="{$urls.theme_assets}img/whatsapp.png" style="width:26px;"> 
		<span class="d-none d-sm-inline">Whatsapp</span> 
	</a>
	<span class="separator"> | </span>
	<a href="tel:+34 {$contact_infos.phone}" class="icon-adjust">
		<i class="material-icons">call</i>
		<span class="d-none d-sm-inline">{$contact_infos.phone}</span>
	</a>
	<span class="separator"> | </span> 
	<a href="mailto:{$contact_infos.email}" class="icon-adjust">
		<i class="material-icons">email</i>
		<span class="d-none d-sm-inline">{* {$contact_infos.email} *}</span>
	</a>
	<span class="separator"> | </span>
	<span>L a V de 9h a 13h y de 15h a 17h</span>
</div>
