<!-- Block search module TOP -->
<div id="search_widget" data-search-controller-url="{$search_controller_url}" class="d-none d-md-block">
	<form method="get" action="{$search_controller_url}" class="form-inline">
		<input type="hidden" name="controller" value="search">
		<label for="searchBarInput"><i class="material-icons">search</i></label>
		<input type="text" name="s" value="{$search_string}" class="form-control" 
			placeholder="{l s='Search our catalog' d='Shop.Theme.Catalog'}" 
			aria-label="{l s='Search' d='Shop.Theme.Catalog'}"
			id="searchBarInput">
	</form>
</div>
<!-- /Block search module TOP -->
