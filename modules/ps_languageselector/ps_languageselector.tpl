
<div class="language-selector">
  <div class="dropdown header-nav-item ml-3">
    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" 
      aria-haspopup="true" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}">{$current_language.name_simple}</a>
    <ul class="dropdown-menu" aria-labelledby="language-selector-label">
      {foreach from=$languages item=language}
        <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
          <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item">{$language.name_simple}</a>
        </li>
      {/foreach}
    </ul>
  </div>
</div>
