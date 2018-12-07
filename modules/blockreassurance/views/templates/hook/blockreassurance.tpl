
{if $elements}
  <div id="block-reassurance" class="mb-3">
    <ul class="list-group">
      {foreach from=$elements item=element}
        <li class="list-group-item list-group-item-primary text-center">
          <div class="block-reassurance-item">
            <img src="{$element.image}" alt="{$element.text}">
            <span class="h6">{$element.text}</span>
          </div>
        </li>
      {/foreach}
    </ul>
  </div>
{/if}
