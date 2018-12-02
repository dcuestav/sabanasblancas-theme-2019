import $ from 'jquery';
import prestashop from 'prestashop';

prestashop.blockcart = prestashop.blockcart || {};
prestashop.blockcart.showModal = function(modal) {
    $('body').append(modal);
    $('#blockcart-modal').siblings().addClass('blurred');
    $('#blockcart-modal')
        .modal() // Mostrar la ventana
        .on('hidden.bs.modal', function (e) { // Destruirla completamente al ocultarla
            $('.blurred').removeClass('blurred');
            $(this)
                .modal('dispose')
                .remove();
        });
    $('[data-button-action="add-to-cart"]')
        .removeClass('spinner')
        .removeAttr('disabled');
}

$('[data-button-action="add-to-cart"]').click(function() {
    var me = this;
    setTimeout(function() { // Tiene que ejecutarse después del envío del formulario
        $(me).attr('disabled', true);
        $(me).addClass('spinner');
    }, 0);
})