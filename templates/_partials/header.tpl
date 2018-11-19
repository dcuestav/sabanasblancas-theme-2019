{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
  <nav class="header-nav container-fluid max-width">
    <div class="d-flex pt-1 pb-1">
      <div class="mr-auto">
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
              <h1 class="text-center">
                <a href="{$urls.base_url}">
                  <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}">
                </a>
              </h1>
            {else}
              <a href="{$urls.base_url}">
                <img class="logo img-fluid" src="{$shop.logo}" alt="{$shop.name}">
              </a>
            {/if}
        </div>
      </div>
      <div class="row">
        <div class="col position-static">
          {hook h='displayTop'}
          <div class="clearfix"></div>
        </div>
      </div>
      <div id="mobile_top_menu_wrapper" class="row d-lg-none" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'}
{/block}
