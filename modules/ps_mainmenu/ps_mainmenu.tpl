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

{$sabanas_basic_premium="category-32-33"}
{$sabanas_basic_premium_label="Sábanas"}

{$bed_complements_pages=["category-13","category-15","category-16","category-17","category-19"]}
{$bed_complements="bed-complements"}
{$bed_complements_label="Complementos de cama"}

{$more_products="more-products"}
{$more_products_label="Más productos"}

<div id="main-menu" class="">
  <ul class="nav nav-pills nav-fill position-relative">

    {* Menu BASIC + PREMIUM para pantalla SM, MD y LG *}

    <li class="nav-item dropdown d-xl-none">
      <a id="{$sabanas_basic_premium}"
        class="nav-link dropdown-toggle" 
        href="#"
        role="button" data-toggle="dropdown" data-offset="0" {* Se actualiza en main-menu.js *} 
        data-aria-haspopup="true" aria-expanded="false">{$sabanas_basic_premium_label}</a>
        <!-- submenu -->
      <div class="dropdown-menu p-3" aria-labelledby="{$sabanas_basic_premium}">
        <div class="row">
          {foreach from=$menu.children item=node}
            {if $node.children|count}
              {foreach from=$node.children item=child}
                <a class="col dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                  <h4>{$child.label}</h4>
                  <p>Económicas y fáciles de planchar</p>
                </a>
              {/foreach}
            {/if}
          {/foreach}
        </div>
      </div>
    </li>

    {* Menu OTROS PRODUCTOS para pantalla SM y MD *}

    <li class="nav-item dropdown position-static d-none d-sm-inline-block d-lg-none">
      <a id="{$bed_complements}"
        class="nav-link dropdown-toggle" 
        href="#"
        role="button" data-toggle="dropdown" data-offset="0" {* Se actualiza en main-menu.js *} 
        data-aria-haspopup="true" aria-expanded="false">{$bed_complements_label}</a>
        <!-- submenu -->
      <div class="dropdown-menu w-100 p-3" aria-labelledby="{$bed_complements}">
        <div class="row">
          {foreach from=$menu.children item=child}
            {if in_array($child.page_identifier, $bed_complements_pages)}
              <a class="col dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                <h4>{$child.label}</h4>
                <p>Económicas y fáciles de planchar</p>
              </a>
            {/if}
          {/foreach}
        </div>
      </div>
    </li>

    {* Menu MAS PRODUCTOS (todo excepto sábanas) para pantalla XS *}

    <li class="nav-item dropdown position-static d-sm-none">
      <a id="{$more_products}"
        class="nav-link dropdown-toggle" 
        href="#"
        role="button" data-toggle="dropdown" data-offset="0" {* Se actualiza en main-menu.js *} 
        data-aria-haspopup="true" aria-expanded="false">{$more_products_label}</a>
        <!-- submenu -->
      <div class="dropdown-menu w-100 p-3" aria-labelledby="{$more_products}">
        <div class="row">
          {foreach from=$menu.children item=child}
            {if count($child.children) === 0}
              <a class="col dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                <h4>{$child.label}</h4>
                <p>Económicas y fáciles de planchar</p>
              </a>
            {/if}
          {/foreach}
        </div>
      </div>
    </li>

    {* Menu completo estándar BASIC y PREMIUM separados para pantalla XL*}

    {foreach from=$menu.children item=node}
      
      {* BASIC y PREMIUM separados para pantalla XL *}

      {if $node.children|count} 
        <li class="nav-item dropdown position-static d-none d-xl-inline-block">
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

      {* Toallas para pantalla SM, MD, LG y XL *}
      {* Todo lo demás para pantalla LG y XL *}

      {else}
        <li class="nav-item d-none {if in_array($node.page_identifier, $bed_complements_pages)}d-lg-inline-block{else}d-sm-inline-block{/if}">
          <a id="{$node.page_identifier}"
            class="nav-link {if $node.current} active {/if}" 
            href="{$node.url}" 
            {if $node.open_in_new_window} target="_blank" {/if} 
            role="button">{$node.label}</a>
        </li>
      {/if}

    {/foreach}

  </ul>
</div>
