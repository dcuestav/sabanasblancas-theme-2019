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
          <div class="pt-2 w-100 row justify-content-between no-gutters" style="font-size: 90%;">
            <div class="col">
              {$cols = 2}
              {$rows = ceil(sizeOf($group.attributes)/$cols) }
              {foreach from=$group.attributes key=id_attribute item=group_attribute name=fr_attributes}
                <div class="form-check radio-option {if $group_attribute.selected}selected{/if} pb-2">
                  <input id="attribute-{$id_attribute_group}-{$id_attribute}" class="form-check-input" type="radio" data-product-attribute="{$id_attribute_group}"
                    name="group[{$id_attribute_group}]" value="{$id_attribute}" {if $group_attribute.selected} checked="checked"{/if}>
                  <label class="form-check-label" for="attribute-{$id_attribute_group}-{$id_attribute}">{$group_attribute.name}</label>
                </div>
                {if 1==($smarty.foreach.fr_attributes.iteration/$rows) }
                  </div> 
                  <div class="col">
                {/if}
              {/foreach}
            </div>  
          </div>
        {/if}

    </div>
    {/if}
  {/foreach}

  {if !empty($supplier_reference)}
    <p class="mb-1">{l s='Medida real' d='Shop.Sabanasblancas'}:  {$supplier_reference}</p>

    {* Tiene que estar aquí porque depende del mismo módulo *}
    {* Si el módulo está deshabilitado el contenido de pack no es correcto *}
    {if $packs|count}
      <p class="mb-1">{l s='Packs disponibles:' d='Shop.Sabanasblancas'}</p>
      <ul class="list-unstyled" style="font-size:90%;margin-top:0;">
      {foreach from=$packs item=pack}
        <li class="ml-3 mb-2 clearfix"><a href="{$pack.link}">{$pack.name}<span style="float:right;">{$pack.displayPrice}</span></a></li>
      {/foreach}
      </ul>
    {/if}

  {/if}

  

</div>