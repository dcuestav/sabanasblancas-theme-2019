import 'expose-loader?Tether!tether';
import 'bootstrap-touchspin';

import 'bootstrap/js/src/util';
// import 'bootstrap/js/src/alert';
import 'bootstrap/js/src/button';
import 'bootstrap/js/src/carousel';
import 'bootstrap/js/src/collapse';
import 'bootstrap/js/src/dropdown';
import 'bootstrap/js/src/index';
import 'bootstrap/js/src/modal';
// import 'bootstrap/js/src/popover';
// import 'bootstrap/js/src/scrollspy';
// import 'bootstrap/js/src/tab';
import 'bootstrap/js/src/tooltip';

import './classic/responsive';
import './classic/checkout';
import './classic/customer';
import './classic/product';
import './classic/cart';

import Form from './classic/components/form';
import ProductSelect from './classic/components/product-select';

import 'flexslider/jquery.flexslider';
import './sabanasblancas/flexslider';
import './sabanasblancas/main-menu';
import './sabanasblancas/replace-image-effect';
import './sabanasblancas/show-brand-on-product-miniature';

import './sabanasblancas/add-to-cart';
import './sabanasblancas/address-form';
import './sabanasblancas/cart-review';
import './sabanasblancas/checkout';
import './sabanasblancas/product-detail';
import './sabanasblancas/reassurance-tooltip';

import prestashop from 'prestashop';
import EventEmitter from 'events';

import './classic/lib/bootstrap-filestyle.min';
import './classic/lib/jquery.scrollbox.min';

// "inherit" EventEmitter
for (var i in EventEmitter.prototype) {
  prestashop[i] = EventEmitter.prototype[i];
}

$(document).ready(() => {
  const form = new Form();
  let productSelect  = new ProductSelect();
  form.init();
  productSelect.init();
});
