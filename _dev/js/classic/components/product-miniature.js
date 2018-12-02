// CSS dinámico para miniaturas de producto
// NO SE USA

import $ from 'jquery';

export default class ProductMinitature {
  init(){
    $('.js-product-miniature').each((index, element) => {
      const FLAG_MARGIN = 10;
      let $discount = $(element).find('.discount-product');
      let $onsale =  $(element).find('.on-sale');
      let $new = $(element).find('.new');
      if($discount.length){
        $new.css('top', $discount.height() * 2 + FLAG_MARGIN);
        $discount.css('top',-$(element).find('.thumbnail-container').height() + $(element).find('.product-description').height() + FLAG_MARGIN);
      }
      if($onsale.length){
        $discount.css('top', parseFloat($discount.css('top')) + $onsale.height() + FLAG_MARGIN);
        $new.css('top', ($discount.height() * 2 + $onsale.height()) + FLAG_MARGIN * 2);
      }
      if($(element).find('.color').length > 5){
        let count = 0;
        $(element).find('.color').each((index, element) =>{
          if(index > 4){
            $(element).hide();
            count ++;
          }
        });
        $(element).find('.js-count').append(`+${count}`);
      }
    });
  }
}
