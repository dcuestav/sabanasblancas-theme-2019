
{block name='form_errors'}
  {if $errors|count}
    <ul class='form-errors list-unstyled'>
      {foreach $errors as $error}
        <li class="alert alert-danger">{$error}</li>
      {/foreach}
    </ul>
  {/if}
{/block}
