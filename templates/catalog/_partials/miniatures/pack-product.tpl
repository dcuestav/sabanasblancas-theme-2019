{* NO SE USA *}
{block name='pack_miniature_item'}
  <article>
      <h1>{$product.name}</h1>
      <img
        src = "{$product.cover.small.url}"
        alt = "{$product.cover.legend}"
        data-full-size-image-url = "{$product.cover.large.url}"
      >
      {$product.description_short}
      {$product.description}
  </article>
{/block}
