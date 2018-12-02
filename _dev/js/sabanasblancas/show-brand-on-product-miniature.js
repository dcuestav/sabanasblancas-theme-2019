(function() {

    $(window).load(function() {
        $('.show-brand-on-product-miniature').each(function(){
            $this = $(this);
            var brandId = parseInt($this.data('brand-id'));
            var brandName = $this.data('brand-name');
            var baseUrl = prestashop.urls.img_manu_url;
            if (brandId && brandName) {
                $this.append(`<img src="${baseUrl}${brandId}-small_default.jpg" alt="${brandName} logo" class="img-fluid"/>`);
            }
        });
    });

})();