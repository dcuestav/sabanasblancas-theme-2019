{* Aparece en el lateral de la página de contacto *}

<div class="contact-rich card">

  <div class="card-header">
    <h4>{l s='Store information' d='Shop.Theme.Global'}</h4>
  </div>

  <ul class="list-group list-group-flush">
    <li class="list-group-item d-flex">
      <div class=""><i class="material-icons">location_on</i></div>
      <div class="pl-3">{$contact_infos.address.formatted nofilter}</div>
    </li>

    <li class="list-group-item d-flex">
      <div class=""><i class="material-icons">call</i></div>
      <div class="pl-3">
        {l s='Call us:' d='Shop.Theme.Global'}<br/>
        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
      </div>
    </li>

    <li class="list-group-item d-flex">
      <div class=""><i class="material-icons">email</i></div>
      <div class="pl-3">
        {l s='Email us:' d='Shop.Theme.Global'}<br/>
        <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
      </div>
      
    </li>
  </ul>
  
</div>
