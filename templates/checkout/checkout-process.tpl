{foreach from=$steps item="step" key="index"}
  <li class="list-group-item">
    {render identifier  =  $step.identifier
            position    =  ($index + 1)
            ui          =  $step.ui
    }
  </li>
{/foreach}
