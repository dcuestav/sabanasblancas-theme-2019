{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav">
    <div class="d-flex container-fluid max-width">
        <div class="d-flex mr-auto">
          {hook h='displayNav1'}
          {* Module contact info *}
        </div>
        <div class="d-flex">
          {hook h='displayNav2'}
          {* Module language selector *}
          {* Module customer sign in *}
          {* Module language selector *}
        </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  <div class="header-top">
    <div class="container-fluid max-width position-relative">
      <div class="row">
        <div class="col text-center" id="_desktop_logo">
          {if $page.page_name == 'index'}
            <h1 class="text-center mb-0">
              <a href="{$urls.base_url}">
                <img class="logo img-fluid" src="{$urls.theme_assets}img/sabanasblancas_white_397_60.png" alt="{$shop.name}">
              </a>
            </h1>
          {else}
            <a href="{$urls.base_url}">
              <img class="logo img-fluid" src="{$urls.theme_assets}img/sabanasblancas_white_397_60.png" alt="{$shop.name}">
            </a>
          {/if}
        </div>
        <div class="searchbar-space d-none d-md-block d-xl-none"></div>
      </div>
    <div class="row">
      <div class="col position-static">
        {hook h='displayTop'}
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'}
{/block}
