{* HOME *}

{extends file='page.tpl'}

{block name='page_header_container'}
  {* Vacío para evitar que haya dos h1 *}
{/block}

{block name='page_content'}
  {block name='hook_home'}
    {$HOOK_HOME nofilter}
  {/block}
{/block}
