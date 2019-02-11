
{block name='step'}
  <section  id    = "{$identifier}"
            class = "{[
                        'card'            => true,
                        'checkout-step'   => true,
                        '-current'        => $step_is_current,
                        '-reachable'      => $step_is_reachable,
                        '-complete'       => $step_is_complete,
                        'js-current-step' => $step_is_current
                    ]|classnames}"
  >
    <h1 class="card-header step-title h4" data-toggle="collapse" data-target="#{$identifier} .collapse">
      <span class="step-number">{$position}.</span>
      {$title}
      {if $step_is_complete}<i class="material-icons rtl-no-flip step-done-check">done</i>{/if}
      <a href="#" class="step-edit text-muted icon-adjust float-right d-none">
        <i class="material-icons">edit</i>
        <span>{l s='Edit' d='Shop.Theme.Actions'}</span>
      </a>
    </h1>
    <div class="collapse{if $step_is_current} show{/if}" data-parent="#accordion">
      <div class="card-body content">
        {block name='step_content'}DUMMY STEP CONTENT{/block}
      </div>
    </div>
  </section>
{/block}
