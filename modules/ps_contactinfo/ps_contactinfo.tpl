
<div id="block_contact_footer" class="col">
  <h4>{l s='Store information' d='Shop.Theme.Global'}</h4>
  <div>
    {$contact_infos.address.formatted nofilter}
    {if $contact_infos.phone}
      <br>
      {* [1][/1] is for a HTML tag. *}
      {l s='Call us: [1]%phone%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%phone%' => $contact_infos.phone
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    {if $contact_infos.fax}
      <br>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Fax: [1]%fax%[/1]'
        sprintf=[
          '[1]' => '<span>',
          '[/1]' => '</span>',
          '%fax%' => $contact_infos.fax
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    {if $contact_infos.email}
      <br>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Email us: [1]%email%[/1]'
        sprintf=[
          '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
          '[/1]' => '</a>',
          '%email%' => $contact_infos.email
        ]
        d='Shop.Theme.Global'
      }
    {/if}
  </div>
</div>
