
<aside id="notifications" class="container-fluid max-width">

  {if $notifications.error || $notifications.warning || $notifications.success || $notifications.info}

  <div class="container" style="width:100%;max-width:none;padding:15px 0 0;">

    {if $notifications.error}
      {block name='notifications_error'}
        <article class="notification notification-danger" role="alert" data-alert="danger">
          <ul class="list-unstyled">
            {foreach $notifications.error as $notif}
              <li class="alert alert-danger">{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.warning}
      {block name='notifications_warning'}
        <article class="notification notification-warning" role="alert" data-alert="warning">
          <ul class="list-unstyled">
            {foreach $notifications.warning as $notif}
              <li class="alert alert-warning">{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.success}
      {block name='notifications_success'}
        <article class="notification notification-success" role="alert" data-alert="success">
          <ul class="list-unstyled">
            {foreach $notifications.success as $notif}
              <li class="alert alert-success">{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.info}
      {block name='notifications_info'}
        <article class="notification notification-info" role="alert" data-alert="info">
          <ul class="list-unstyled">
            {foreach $notifications.info as $notif}
              <li class="alert alert-info">{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {/if}

  </div>

</aside>
