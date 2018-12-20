{extends file='page.tpl'}

{block name='page_header_container'}{/block}

{block name='left_column'}
  <div id="left-column" class="d-none d-md-inline-block col-md-4 col-lg-3">
    {widget name="ps_contactinfo" hook='displayLeftColumn'}
  </div>
{/block}

{block name='page_content'}
  {widget name="contactform"}
{/block}