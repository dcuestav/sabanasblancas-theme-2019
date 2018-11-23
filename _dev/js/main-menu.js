(function() {

    function createMainMenuDropdowns() {

        function showBlur() {
            $('#menu-backdrop').show();
            $('#wrapper').addClass('blurred');
        }
    
        function hideBlur() {
            $('#menu-backdrop').hide();
            $('#wrapper').removeClass('blurred');
        }

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
            var $dropdown = $(this).closest('.dropdown');
            $dropdown.on('show.bs.dropdown', showBlur);
            $dropdown.on('hide.bs.dropdown', hideBlur);
        })
    }

    function openDropdownMenuOnHover() {

        function showMenu($dropdown) {
            if (!$dropdown.hasClass('show')) {
                $dropdown.children('.dropdown-toggle').dropdown('toggle');
            }
        }
    
        function hideMenu($dropdown) {
            if ($dropdown.hasClass('show')) {
                $dropdown.children('.dropdown-toggle').dropdown('toggle');
            }
        }
        
        $('body').on('mouseenter mouseleave','#main-menu .dropdown', function(e){
            var $dropdown = $(e.target).closest('.dropdown');

            if (e.type === 'mouseleave' && !$dropdown.hasClass('show')) {
                return;
            }

            showMenu($dropdown);

            setTimeout(function(){
                var $toggle = $dropdown.children('.dropdown-toggle');
                var $menu = $dropdown.children('.dropdown-menu');
                var isHover = $toggle.is(':hover') || $menu.is(':hover');
                isHover ? showMenu($dropdown) : hideMenu($dropdown);
            }, 300);
        });
    }

    $(window).load(createMainMenuDropdowns);
    $(window).load(openDropdownMenuOnHover);
    
})();