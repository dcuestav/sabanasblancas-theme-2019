{$random_number = rand()}
{if $field.type === 'select'}

  {block name='form_field_item_select'}
    <div class="form-group row">
      <label for="{$field.name}{$random_number}" class='select-field col-md-3 {if $field.required}required{/if}'>{$field.label}</label>
      <div class="col-md-6">
        <select 
          id="{$field.name}{$random_number}"
          class="form-control"
          name="{$field.name}" 
          {if $field.required}required{/if} 
          >
          <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
          {foreach from=$field.availableValues item="label" key="value"}
            <option value="{$value}" {if $value eq $field.value}selected{/if}>{$label}</option>
          {/foreach}
        </select>
      </div>
    </div>
  {/block}

{elseif $field.type === 'countrySelect'}

  {block name='form_field_item_country'}
    <div class="form-group row">
      <label for="{$field.name}{$random_number}" class='select-field col-md-3 {if $field.required}required{/if}'>{$field.label}</label>
      <div class="col-md-6">
        <select 
          id="{$field.name}{$random_number}"
          class="js-country form-control" 
          name="{$field.name}" 
          {if $field.required}required{/if} 
          >
          <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
          {foreach from=$field.availableValues item="label" key="value"}
            <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
          {/foreach}
        </select>
      </div>
    </div>
  {/block}

{elseif $field.type === 'radio-buttons'}

  {block name='form_field_item_radio'}
    <div class="form-group row">
      <label class='radio-field col-md-3 {if $field.required}required{/if}'>{$field.label}</label>
      <div class="col-md-6">
        {foreach from=$field.availableValues item="label" key="value"}
          <div class="form-check">
            <input
              id="{$field.name}{$random_number}-{$value}"
              class="form-check-input"
              name="{$field.name}"
              type="radio"
              value="{$value}"
              {if $field.required}required{/if}
              {if $value eq $field.value}checked{/if}
            >
            <label class="form-check-label" for="{$field.name}{$random_number}-{$value}">{$label}</label>
          </div>
        {/foreach}
      </div>
    </div>
  {/block}

{elseif $field.type === 'checkbox'}

  {block name='form_field_item_checkbox'}
    <div class="form-group row">
      <div class="offset-md-3 col-md-6">
        <div class="form-check">
          <input
            id="{$field.value}{$random_number}"
            class="form-check-input {if $field.errors|count}is-invalid{/if}"
            name="{$field.name}"
            type="checkbox"
            value="1"
            {if $field.required}required{/if}
            {if $field.value}checked{/if}
          >
          <label class="form-check-label" for="{$field.value}{$random_number}">{$field.label nofilter}</label>
          {if $field.errors|count}
            <ul class='invalid-feedback list-unstyled'>
              {foreach $field.errors as $error}
                <li>{$error}</li>
              {/foreach}
            </ul>
          {/if}
        </div>
      </div>
    </div>
  {/block}

{elseif $field.type === 'password'}
  
  {block name='form_field_item_password'}
    <div class="form-group row mb-0">
      <label for="{$field.name}{$random_number}" class='col-md-3 col-form-label {if $field.required}required{/if}'>{$field.label}</label>
      <div class="col-md-6 input-group">
        <input
          id="{$field.name}{$random_number}"
          class="form-control js-visible-password {if $field.errors|count}is-invalid{/if}"
          name="{$field.name}"
          type="password"
          value=""
          pattern=".{literal}{{/literal}5,{literal}}{/literal}"
          {if $field.required}required{/if}
        >
        <div class="input-group-append">
          <button
            class="input-group-text"
            type="button"
            data-action="show-password"
            data-text-show="{l s='Show' d='Shop.Theme.Actions'}"
            data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}"
          >
            {l s='Show' d='Shop.Theme.Actions'}
          </button>
        </div>
        {if $field.errors|count}
          <ul class='invalid-feedback list-unstyled'>
            {foreach $field.errors as $error}
              <li>{$error}</li>
            {/foreach}
          </ul>
        {/if}
      </div>
    </div>
    <div class="form-group row">
      <div class="col-md-6 offset-md-3">
        <small class="text-muted">
          {l s='Al menos 5 caracteres' d='Shop.Forms.Help'}
        </small>
      </div> 
    </div>
  {/block}

{elseif $field.type === 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}

{else}

  {block name='form_field_item_other'}
    <div class="form-group row">
      <label for="{$field.name}{$random_number}" class="col-md-3 col-form-label {if $field.required}required{/if}">{$field.label}</label>
      <div class="col-md-6">
        <input 
          id="{$field.name}{$random_number}"
          class="form-control {if $field.errors|count}is-invalid{/if}"
          name="{$field.name}" 
          type="{$field.type}" 
          value="{$field.value}" 
          {if $field.required}required{/if}>
        {if $field.errors|count}
          <ul class='invalid-feedback list-unstyled'>
            {foreach $field.errors as $error}
              <li>{$error}</li>
            {/foreach}
          </ul>
        {/if}
      </div>
      
    </div>
  {/block}

{/if}

{* {block name='form_field_errors'}
  {include file='_partials/form-errors.tpl' errors=$field.errors}
{/block} *}

{* form-errors.tpl *}
{* {block name='form_errors'}
  {if $errors|count}
    <ul class='form-errors list-unstyled'>
      {foreach $errors as $error}
        <li class="alert alert-danger">{$error}</li>
      {/foreach}
    </ul>
  {/if}
{/block} *}