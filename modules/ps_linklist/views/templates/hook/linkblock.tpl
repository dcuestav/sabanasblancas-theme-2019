{* themes/sabanasblancas/modules/ps_linklist *}

<div id="link_block_footer" class="col">
  <div class="row">
  {foreach $linkBlocks as $linkBlock}
    <div class="col">
      <h4>{$linkBlock.title}</h4>
      <ul class="list-unstyled">
        {foreach $linkBlock.links as $link}
          <li>
            <a
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class}"
                href="{$link.url}"
                title="{$link.description}"
                {if !empty($link.target)} target="{$link.target}" {/if}
            >
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/foreach}
  </div>
</div>
