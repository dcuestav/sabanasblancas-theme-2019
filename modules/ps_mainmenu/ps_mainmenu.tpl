{* {function name="print_category_level_one" category=null}
  <li class="nav-item">
    <a id="{$category.page_identifier}" class="nav-link " href="{$category.url}" role="button">{$category.label}</a>
  </li>
{/function}

{function name="find_and_print_category_level_one" categories=[] page_identifier=''}
  {foreach from=$categories item=category}
    {if $category.page_identifier==$page_identifier}
      {print_category_level_one category=$category}
      {break}
    {/if}
  {/foreach}
{/function} *}

{* {find_and_print_category_level_one categories=$menu.children page_identifier="category-13"}
    {find_and_print_category_level_one categories=$menu.children page_identifier="category-15"}
    {find_and_print_category_level_one categories=$menu.children page_identifier="category-16"}
    {find_and_print_category_level_one categories=$menu.children page_identifier="category-17"}
    {find_and_print_category_level_one categories=$menu.children page_identifier="category-18"}
    {find_and_print_category_level_one categories=$menu.children page_identifier="category-19"} *}

{$base_url = $breadcrumb.links[0].url}

{$sabanas_basic="category-32"}
{$sabanas_premium="category-33"}

<div id="main-menu" class="d-none d-md-block">
  <ul class="nav nav-pills nav-fill position-relative">

    {* Menu estándar BASIC y PREMIUM separados para pantalla XL*}

    {foreach from=$menu.children item=node}
        
      {if $node.children|count}
        <li class="nav-item dropdown position-static">
          <a id="{$node.page_identifier}"
            class="nav-link dropdown-toggle {if $node.current} active {/if}" 
            href="#" {if $node.open_in_new_window} target="_blank" {/if} 
            role="button" data-toggle="dropdown" data-offset="0" {* Se actualiza en main-menu.js *} 
            data-aria-haspopup="true" aria-expanded="false">{$node.label}</a>
            <!-- submenu -->
          <div class="dropdown-menu w-100 p-3" aria-labelledby="{$node.page_identifier}">
            <div class="row">
              {foreach from=$node.children item=child}
                <a class="col dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                  <h4>{$child.label}</h4>
                  <p>Económicas y fáciles de planchar</p>
                </a>
              {/foreach}
            </div>
          </div>
        </li>
      {else}
        <li class="nav-item">
          <a id="{$node.page_identifier}"
            class="nav-link {if $node.current} active {/if}" 
            href="{$node.url}" 
            {if $node.open_in_new_window} target="_blank" {/if} 
            role="button">{$node.label}</a>
        </li>
      {/if}

    {/foreach}

    {* Menu BASIC + PREMIUM para pantalla grande *}

    {* Construir menu OTROS PRODUCTOS para pantalla pequeña*}

  </ul>
</div>
