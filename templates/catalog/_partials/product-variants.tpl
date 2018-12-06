{* Se recarga por ajax al cambiar la combinación *}

<div class="product-variants mb-3">

  {foreach from=$groups key=id_attribute_group item=group}
    {if !empty($group.attributes)}
    <div class="product-variants-item form-group d-flex flex-row mb-1">
      <label class="col-form-label mr-3">{$group.name}:</label>

        {if $group.group_type == 'select'}
          <div>
          <select
            class="form-control form-control-select"
            id="group_{$id_attribute_group}"
            data-product-attribute="{$id_attribute_group}"
            name="group[{$id_attribute_group}]">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <option value="{$id_attribute}" title="{$group_attribute.name}"{if $group_attribute.selected} selected="selected"{/if}>{$group_attribute.name}</option>
            {/foreach}
          </select>
          </div>

        {elseif $group.group_type == 'color'}
          <div class="d-flex flex-wrap">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <div class="form-check form-check-inline color-option {if $group_attribute.selected}selected{/if}">
                <input id="attribute-{$id_attribute_group}-{$id_attribute}" class="form-check-input input-color" type="radio" data-product-attribute="{$id_attribute_group}"
                  name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked"{/if}>
                <span
                    {if $group_attribute.html_color_code}class="color" style="background-color: {$group_attribute.html_color_code}" {/if}
                    {if $group_attribute.texture}class="color texture" style="background-image: url({$group_attribute.texture})" {/if}
                  ></span>
                <label class="form-check-label" for="attribute-{$id_attribute_group}-{$id_attribute}">{$group_attribute.name}</label>
              </div>
            {/foreach}
          </div>
          
        {elseif $group.group_type == 'radio'}
          <div class="pt-2">
            {foreach from=$group.attributes key=id_attribute item=group_attribute}
              <div class="form-check radio-option {if $group_attribute.selected}selected{/if}">
                <input id="attribute-{$id_attribute_group}-{$id_attribute}" class="form-check-input" type="radio" data-product-attribute="{$id_attribute_group}"
                  name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked"{/if}>
                <label class="form-check-label" for="attribute-{$id_attribute_group}-{$id_attribute}">{$group_attribute.name}</label>
              </div>
            {/foreach}
          </div>
        {/if}

    </div>
    {/if}
  {/foreach}

  {if !empty($supplier_reference)}
  <div class="alert alert-secondary mt-3">
    {l s='Medida real' d='Shop.Theme.Catalog'}: <strong>{$supplier_reference}</strong>
  </div>
  {/if}

</div>