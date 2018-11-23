<nav class="pagination-block d-flex justify-content-center">
  {* {block name='pagination_summary'}
    {l s='Showing %from%-%to% of %total% item(s)' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items] d='Shop.Theme.Catalog'}
  {/block} *}

  {block name='pagination_page_list'}
    {if $pagination.should_be_displayed}
    {debug}
    <ul class="pagination">
      {foreach from=$pagination.pages item="page"}
        <li class="page-item {if $page.current} active {/if}">
          {if $page.type === 'spacer'}
            <span class="page-link">&hellip;</span>
          {else}
            <a
              rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
              href="{$page.url}"
              class="page-link {['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
            >
              {if $page.type === 'previous'}
                <i class="material-icons navigate-before">navigate_before</i>
              {elseif $page.type === 'next'}
                <i class="material-icons navigate-next">navigate_next</i>
              {else}
                {$page.page}
              {/if}
            </a>
          {/if}
        </li>
      {/foreach}
    </ul>
    {/if}
  {/block}

</nav>
