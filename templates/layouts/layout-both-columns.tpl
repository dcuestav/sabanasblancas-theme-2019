<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    {block name='order_confirmation_transaction_details'}
    {/block}

    {include file='_partials/google-tag-body.tpl'}

    <main>

      {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
      {/block}

      <header id="header">
        {block name='header'}
          {include file='_partials/header.tpl'}
        {/block}
      </header>

      {block name='notifications'}
        {include file='_partials/notifications.tpl'}
      {/block}

      <section id="wrapper" class="container-fluid max-width pt-3 pb-3 position-relative">
        {hook h="displayWrapperTop"}

        <div id="menu-backdrop" style="display:none;"></div>

        {block name='breadcrumb'}
          {include file='_partials/breadcrumb.tpl'}
        {/block}

        <div class="row">

        {block name="left_column"}
          <div id="left-column" class="col-md-3">
            {if $page.page_name == 'product'}
              {hook h='displayLeftColumnProduct'}
            {else}
              {hook h="displayLeftColumn"}
            {/if}
          </div>
        {/block}

        {block name="content_wrapper"}
          <div id="content-wrapper" class="left-column right-column col-md-6">
            {hook h="displayContentWrapperTop"}
            {block name="content"}
              <p>Hello world! This is HTML5 Boilerplate.</p>
            {/block}
            {hook h="displayContentWrapperBottom"}
          </div>
        {/block}

        {block name="right_column"}
          <div id="right-column" class="col-md-3">
            {if $page.page_name == 'product'}
              {hook h='displayRightColumnProduct'}
            {else}
              {hook h="displayRightColumn"}
            {/if}
          </div>
        {/block}

        </div>

        {hook h="displayWrapperBottom"}
      </section>

      <footer id="footer">
        {block name="footer"}
          {include file="_partials/footer.tpl"}
        {/block}
      </footer>

    </main>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

</html>
