
{$sabanas_basic="category-32"}
{$sabanas_premium="category-33"}

{$sabanas_basic_premium="category-32-33"}
{$sabanas_basic_premium_label="Sábanas"}

{$bed_complements_pages=["category-13","category-15","category-16","category-17","category-19"]}
{$bed_complements="bed-complements"}
{$bed_complements_label="Complementos de cama"}

{$more_products="more-products"}
{$more_products_label="Más productos"}

{$descriptions=['category-12' => 'Económicas y fáciles de planchar',
'category-28' => 'Naturales y confortables',
'category-31' => 'Excelente acabado y resistencia',
'category-29' => 'Frescura y tacto consistente',
'category-34' => 'Tacto suave y ligero brillo']}

{function name="get_category_description" page_identifier=''}
  {if isset($descriptions[$page_identifier])}
    <p>{$descriptions[$page_identifier]}</p>
  {/if}
{/function}

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
      <div class="dropdown-menu w-100 p-3" aria-labelledby="{$sabanas_basic_premium}">
        {foreach from=$menu.children item=node}
          {if $node.children|count}
            <h3 class="section-title">{$node.label}</h3>
            <div class="row">
              {foreach from=$node.children item=child}
                <a class="col-sm-6 col-md-4 dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                  <h4>{$child.label}</h4>
                  {get_category_description page_identifier=$child.page_identifier}
                </a>
              {/foreach}
            </div>
          {/if}
        {/foreach}
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
              <a class="col-sm-6 col-md-4 dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                <h4>{$child.label}</h4>
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
              <a class="col-sm-6 col-md-4 dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                <h4>{$child.label}</h4>
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
                <a class="col-sm-6 col-md-4 col-lg-3 dropdown-item {if $child.current} active {/if}" href="{$child.url}">
                  <h4>{$child.label}</h4>
                  {get_category_description page_identifier=$child.page_identifier}
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
