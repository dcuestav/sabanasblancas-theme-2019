{foreach from=$steps item="step" key="index"}
  <div class="card">
    {render identifier  =  $step.identifier
            position    =  ($index + 1)
            ui          =  $step.ui
    }
  </div>
{/foreach}
