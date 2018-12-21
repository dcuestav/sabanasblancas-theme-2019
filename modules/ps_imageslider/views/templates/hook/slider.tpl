
{if $homeslider.slides}
  <div class="homeslider-container" data-interval="{$homeslider.speed}" data-wrap="{$homeslider.wrap}" data-pause="{$homeslider.pause}">
    <ul class="rslides">
      {foreach from=$homeslider.slides item=slide}
        <li class="slide">
          {* El módulo le añade 'http://' a la ruta introducida *}
          <a href="{$urls.current_url}{$slide.url|replace:'http://':''}" style="overflow:hidden;">
            <img src="{$slide.image_url}" alt="{$slide.legend|escape}" />
            {if $slide.description }
              <span class="caption">
                {* <h2>{$slide.title}</h2> *}
                <div>{$slide.description nofilter}</div>
              </span>
            {/if}
          </a>
        </li>
      {/foreach}
    </ul>
  </div>
{/if}
