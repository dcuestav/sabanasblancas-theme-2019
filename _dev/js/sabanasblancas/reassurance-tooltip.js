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
        prestashop.on('updatedProduct', enableTooltips);
    });
}