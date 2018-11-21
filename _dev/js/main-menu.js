(function() {

    function getOffsetX(toggle) { 
        var $toggle = $(toggle);
        var $dropdown = $toggle.closest('.dropdown');
        return -Math.floor($toggle.position().left); 
    }

    function updateMenuDropdownsOffset() {
        $('#main-menu .dropdown-toggle').each(function() {
            var offset = `${getOffsetX(this)}`;
            $(this).attr('data-offset', offset);
            $(this).data('offset', offset);
        });
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

    $(window).resize(updateMenuDropdownsOffset);
    $(window).load(updateMenuDropdownsOffset);
    $(window).load(openDropdownMenuOnHover);
    
})();