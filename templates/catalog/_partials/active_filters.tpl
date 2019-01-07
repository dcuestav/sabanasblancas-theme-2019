{* NO SE USA. Facets deshabilitado *}
<section id="js-active-search-filters" class="active_filters">
  <h1 class="h3">{l s='Active filters' d='Shop.Theme.Global'}</h1>
  {if $activeFilters|count}
    <ul>
      {foreach from=$activeFilters item="filter"}
        <li>{l s='%facet_label%: %facet_value%' sprintf=['%facet_label%' => $filter.facetLabel, '%facet_value%' => $filter.label] d='Shop.Theme.Catalog'} <a  class="js-search-link" href="{$filter.nextEncodedFacetsURL}">{l s='Remove' d='Shop.Theme.Actions'}</a></li>
      {/foreach}
    </ul>
  {/if}
  <p><a href="{$clear_all_link}">{l s='Reset all filter' d='Shop.Theme.Actions'}</a></p>
</section>
