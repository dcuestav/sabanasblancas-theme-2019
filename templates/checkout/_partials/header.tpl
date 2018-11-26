{block name='header'}
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
    <div class="header-top pb-3 pt-3">
      <div class="container-fluid max-width text-center">
        <a href="{$urls.base_url}">
          <img class="logo img-fluid" src="{$urls.theme_assets}img/sabanasblancas_white_397_60.png" alt="{$shop.name}">
        </a>
      </div>
    </div>
    {hook h='displayNavFullWidth'}
  {/block}
{/block}
