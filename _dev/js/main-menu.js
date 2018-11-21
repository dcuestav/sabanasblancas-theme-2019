(function() {

    function createMainMenuDropdowns() {
        $('#main-menu .dropdown-toggle').each(function() {
            reference = $(this).closest('ul')[0];
            boundary = $('#wrapper')[0];
            $(this).dropdown({
                boundary: boundary,
                reference: reference,
                flip: false,
                display: 'dynamic',
                offset: 0
            });
        })
    }

    function openDropdownMenuOnHover() {
        $('body').on('mouseenter mouseleave','#main-menu .dropdown', function(e){

            var $dropdown = $(e.target).closest('.dropdown');
            var $toggle = $dropdown.children('.dropdown-toggle');
            var $menu = $dropdown.children('.dropdown-menu');

            if (e.type === 'mouseleave' && !$dropdown.hasClass('show')) {
                return;
            }

            if (!$dropdown.hasClass('show')) {
                $toggle.dropdown('toggle');
            }

            setTimeout(function(){
                var isHover = $toggle.is(':hover') || $menu.is(':hover');
                if (isHover != $menu.hasClass('show')) {
                    $toggle.dropdown('toggle');
                }
            }, 300);
        });
    }

    $(window).load(createMainMenuDropdowns);
    $(window).load(openDropdownMenuOnHover);
    
})();