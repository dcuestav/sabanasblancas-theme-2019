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

  <p>
    {block name='copyright_link'}
      <div class="row justify-content-center">© 2019 - Nidara Online S.L. - CIF B12938577</div>
    {/block}
  </p>
</div>