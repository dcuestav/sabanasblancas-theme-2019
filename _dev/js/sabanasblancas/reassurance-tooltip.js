import $ from 'jquery';
import prestashop from 'prestashop';
import Tooltip from 'bootstrap/js/src/tooltip';
import isTouchDevice from './utils';

if ($('body#product,body#cart,body#checkout').length) {

    // Cargar el tooltip de Bootstrap con otro nombre porque tooltip está ocupado por JQueryUI
    const NAME = 'bstooltip';
    $.fn[NAME] = Tooltip._jQueryInterface;
    $.fn[NAME].Constructor = Tooltip;

    function enableTooltips() {
        $('[data-toggle="tooltip"]').bstooltip({ container: 'body' });
    }

    function loadCmsInfo() {
        $('#block-reassurance .more-info-icon').on('click', (event) => {
            event.preventDefault();
            var anchor = $(event.target).parent();
            var url = anchor.attr('href');
            if (url) {
                // TODO: Handle request if no pretty URL
                url += `?content_only=1`;
    
                $('#cms-modal').find('.js-modal-content')
                    .empty()
                    .addClass('spinner');
    
                $('#cms-modal').find('.modal-title').text(anchor.attr('title'));
    
                $('#cms-modal').modal('show');
    
                $.get(url, (content) => {
                    $('#cms-modal').find('.js-modal-content')
                    .removeClass('spinner')
                    .html($(content).find('.page-cms').contents());
    
                }).fail((resp) => {
                    prestashop.emit('handleError', {eventType: 'clickTerms', resp: resp});
                });
            } else {
                console.error('cms url not found');
            }
        });
    }

    $(document).ready(()=>{

        loadCmsInfo();

        if (!isTouchDevice()) {
            enableTooltips();
        }
        
    });
    
}