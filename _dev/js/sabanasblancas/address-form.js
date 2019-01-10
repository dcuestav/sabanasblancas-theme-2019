import $ from 'jquery';

$(document).ready(()=>{

    if (!$('.js-address-form')) {
        return;
    }

    const CURRENT_LANGUAGE_ISO_CODE = prestashop.language.iso_code;
    const SPANISH = 'es';
    const ENGLISH = 'en';

    $('.js-address-form form').removeAttr('novalidate');

    class CustomizedField {
        constructor(name) {
            this.$field = $('[name="'+name+'"]');
        }
        setRequired() {
            this.$field.attr('required', '').closest('.form-group').find('label').addClass('required');
            return this;
        }
        setMinLength(length) {
            this.$field.attr('minlength', length);
        }
        setPlaceholder(isoCode, placeholderString) {
            if (isoCode === CURRENT_LANGUAGE_ISO_CODE) {
                this.$field.attr('placeholder', placeholderString);
            }
            return this;
        }
    }

    new CustomizedField('alias')
        .setPlaceholder(SPANISH, "(opcional) Título de esta dirección. Ej. 'Casa'")
        .setPlaceholder(ENGLISH, "(optional) Title of this address. Eg. 'Home'");

    new CustomizedField('company')
        .setPlaceholder(SPANISH, '(opcional) Si el pedido es para una empresa')
        .setPlaceholder(ENGLISH, '(optional) If the order is for a company');

    new CustomizedField('dni')
        .setPlaceholder(SPANISH, '(opcional) Aparecerá en la factura')
        .setPlaceholder(ENGLISH, '(optional) Will appear in the invoice');

    new CustomizedField('address2')
        .setPlaceholder(SPANISH, '(opcional)')
        .setPlaceholder(ENGLISH, '(optional)');

    new CustomizedField('phone')
        .setRequired()
        .setMinLength(9)
        .setPlaceholder(SPANISH, 'Por si necesitamos contactar contigo')
        .setPlaceholder(ENGLISH, 'In case we need to contact you');
   

});