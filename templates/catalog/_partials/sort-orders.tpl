{* NO SE USA *}

<div class="products-sort-order">
  <span>{if isset($listing.sort_selected)}{$listing.sort_selected}{else}{l s='Sort by:' d='Shop.Theme.Global'}{/if}</span>
  {foreach from=$sort_orders item=sort_order}
    <a
      class="{['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
      href="{$sort_order.url}"
      rel="nofollow"
    >
      {$sort_order.label}
    </a>
  {/foreach}
</div>
