<div class="container-fluid max-width">
  {block name='hook_footer_before'}
    {hook h='displayFooterBefore'}
    {* Module emailsubscription - DESACTIVADO *}
  {/block}

  {block name='hook_footer'}
    <div class="row">
      {hook h='displayFooter'}
      {* Module linklist *}
      {* Module customeraccountlinks *}
      {* Module contactinfo *}
    </div>
  {/block}

  {block name='hook_footer_after'}
    {hook h='displayFooterAfter'}
    {* Module legalcompliance *}
  {/block}

  {block name='copyright_link'}
    <div class="text-sm-center mb-2 mt-2">
      {* {l s='%copyright% %year% - Ecommerce software by %prestashop%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'} *}
      © 2019 - Nidara Online S.L. - CIF B12938577
    </div>
  {/block}
</div>