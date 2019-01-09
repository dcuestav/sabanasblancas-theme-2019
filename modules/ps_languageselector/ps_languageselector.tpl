<div class="language-selector">
  <div class="dropdown header-nav-item ml-3">
    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" 
      aria-haspopup="true" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">
      <img src="{$urls.theme_assets}img/flags/{$language.iso_code}.png" height="18" alt="{$current_language.name_simple}">
    </a>
    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="language-selector-label">
      {foreach from=$languages item=language}
        <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
          <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item icon-adjust">
            <img src="{$urls.theme_assets}img/flags/{$language.iso_code}.png" alt="{$language.name}">
            <span>{$language.name}</span>
          </a>
        </li>
      {/foreach}
    </ul>
  </div>
</div>
