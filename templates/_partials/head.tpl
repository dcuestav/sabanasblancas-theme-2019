{block name='head_charset'}
  <meta charset="utf-8">
{/block}
{block name='head_ie_compatibility'}
  <meta http-equiv="x-ua-compatible" content="ie=edge">
{/block}

{block name='head_seo'}
  <title>{block name='head_seo_title'}{$page.meta.title}{/block}</title>
  <meta name="description" content="{block name='head_seo_description'}{$page.meta.description}{/block}">
  <meta name="keywords" content="{block name='head_seo_keywords'}{$page.meta.keywords}{/block}">
  {if $page.meta.robots !== 'index'}
    <meta name="robots" content="{$page.meta.robots}">
  {/if}
  {if $page.canonical}
    <link rel="canonical" href="{$page.canonical}">
  {/if}
{/block}

{block name='head_hreflang'}
  {assign "alternative_langs" $urls.alternative_langs|default:[]}
  {foreach from=$alternative_langs item=pageUrl key=code}
    <link rel="alternate" href="{$pageUrl}" hreflang="{$code}">
  {/foreach}
{/block}

{block name='head_viewport'}
  <meta name="viewport" content="width=device-width, initial-scale=1">
{/block}

{block name='head_icons'}
  <link rel="icon" type="image/vnd.microsoft.icon" href="{$urls.theme_assets}img/favicon.ico?{$shop.favicon_update_time}">
  <link rel="shortcut icon" type="image/x-icon" href="{$urls.theme_assets}img/favicon.ico?{$shop.favicon_update_time}">
{/block}

{block name='stylesheets'}
  {include file="_partials/stylesheets.tpl" stylesheets=$stylesheets}
{/block}

{block name='javascript_head'}
  {block name='gtm_data_layer'}
    {* Utilizarlo siempre con append porque puede haber más de uno *}
  {/block}
  {include file='_partials/google-tag-head.tpl'}
  {include file="_partials/javascript.tpl" javascript=$javascript.head vars=$js_custom_vars}
{/block}

{block name='structured_data'}
    <script type="application/ld+json">
      {
        "@context" : "http://schema.org",
        "@type" : "Organization",
        "name" : "{$shop.name}",
        "url" : "{$urls.shop_domain_url}",
        "logo" : {
          "@type": "ImageObject",
          "url": "{$urls.shop_domain_url}{$shop.logo}"
        },
        "contactPoint": [{
          "@type": "ContactPoint",
          "telephone": "+34{$shop.phone}",
          "contactType": "customer service"
        }]
      }
    </script>
    <script type="application/ld+json">
      {
        "@context":	"http://schema.org",
        "@type": "WebSite",
        "url": "{$urls.shop_domain_url}",
        "name": "{$shop.name}",
        "image": {
          "@type": "ImageObject",
          "url": "{$urls.shop_domain_url}{$shop.logo}"
        }
      }
    </script>
    <script type="application/ld+json">
      {
        "@context":"http://schema.org",
        "@type":"WebPage",
        "isPartOf": {
          "@type":"WebSite",
          "url":  "{$urls.shop_domain_url}",
          "name": "{$shop.name}"
        },
        "name": "{$page.meta.title}",
        "description": "{$page.meta.description}",
        "url":  "{$urls.current_url}"
      }
    </script>
{/block}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
{/block}

{block name='hook_extra'}{/block}
