import $ from 'jquery';
import prestashop from 'prestashop';
import Tooltip from 'bootstrap/js/src/tooltip';

if ($('body#product,body#cart,body#checkout').length) {

    // Cargar el tooltip de Bootstrap con otro nombre porque tooltip está ocupado por JQueryUI
    const NAME = 'bstooltip';
    $.fn[NAME] = Tooltip._jQueryInterface;
    $.fn[NAME].Constructor = Tooltip;

    function enableTooltips() {
        $('[data-toggle="tooltip"]').bstooltip({ container: 'body' });
    }

    $(document).ready(()=>{
        enableTooltips();
    });

    $('#block-reassurance a>i').on('click', (event) => {
        event.preventDefault();
        var url = $(event.target).parent().attr('href');
        if (url) {
          // TODO: Handle request if no pretty URL
          url += `?content_only=1`;
          $.get(url, (content) => {
            $('#modal').find('.js-modal-content').html($(content).find('.page-cms').contents());
          }).fail((resp) => {
            prestashop.emit('handleError', {eventType: 'clickTerms', resp: resp});
          });
        }
    
        $('#modal').modal('show');
    });
}