{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div class="block_newsletter col-lg-8 col-md-12 col-sm-12">
  <div class="row">
    <p id="block-newsletter-label" class="col-md-5 col-xs-12">{l s='Get our latest news and special sales' d='Shop.Theme.Global'}</p>
    <div class="col-md-7 col-xs-12">
      <form action="{$urls.pages.index}#footer" method="post">
        <input type="hidden" name="action" value="0">
        <div class="form-group">
          <div class="input-group">
            <input
              class="form-control {if $msg}{if $nw_error}is-invalid{else}is-valid{/if}{/if}"
              name="email"
              type="email"
              value="{$value}"
              placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
              aria-labelledby="block-newsletter-label"
            >
            <div class="input-group-append">
              <input
                class="btn btn-primary"
                name="submitNewsletter"
                type="submit"
                value="{l s='Subscribe' d='Shop.Theme.Actions'}"
              >
            </div>
            {if $msg}
              <p class="{if $nw_error}invalid-feedback{else}valid-feedback{/if}">
                {$msg}
              </p>
            {/if}
          </div>
        </div>
        <div class="form-group">
          {if isset($id_module)}
            <div class="gdpr-consent">
              {hook h='displayGDPRConsent' id_module=$id_module}
            </div>
          {/if}
          {if $conditions}
            <p>{$conditions}</p>
          {/if}           
        </div>
      </form>
    </div>
  </div>
</div>
