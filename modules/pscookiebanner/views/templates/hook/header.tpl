{* LOAD EXTERNAL CSS *}
{* <link href="https://fonts.googleapis.com/css?family={$CB_FONT_STYLE|escape:'htmlall':'UTF-8'}" rel="stylesheet" type="text/css" media="all"> *}

{literal}
<script type="text/javascript">
    var cb_settings = {
        cb_bg_color:"{/literal}{$CB_BG_COLOR|escape:'htmlall':'UTF-8'}{literal}",
        cb_font_style:"inherit",
        cb_text_color:"{/literal}{$CB_TEXT_COLOR|escape:'htmlall':'UTF-8'}{literal}",
        cb_inf_text_color:"{/literal}{$CB_MORE_INF_LINK_COLOR|escape:'htmlall':'UTF-8'}{literal}",
        cb_loop:"{/literal}{$CB_FONT_LOOP|escape:'htmlall':'UTF-8'}{literal}",
        cb_font_size:"{/literal}{$CB_FONT_SIZE|escape:'htmlall':'UTF-8'}{literal}",
        cb_button_bg_color:"{/literal}{$CB_BUTTON_BG_COLOR|escape:'htmlall':'UTF-8'}{literal}",
        cb_button_bg_color_hover:"{/literal}{$CB_BUTTON_BG_COLOR_HOVER|escape:'htmlall':'UTF-8'}{literal}",
        cb_button_text_color:"{/literal}{$CB_BUTTON_TEXT_COLOR|escape:'htmlall':'UTF-8'}{literal}",
    };

    var cb_cms_url = "{/literal}{$CB_CMS_URL}{literal}";
    var cb_position = "{/literal}{$CB_POSITION|escape:'htmlall':'UTF-8'}{literal}";
    var cb_text = "{/literal}{$CB_TEXT.$current_language|escape:'htmlall':'UTF-8'}{literal}";
    var cb_link_text = "{/literal}{$CB_LINK_TEXT.$current_language|escape:'htmlall':'UTF-8'}{literal}";
    var cd_button_text = "{/literal}{$CB_BUTTON_TEXT.$current_language|escape:'htmlall':'UTF-8'}{literal}";
</script>
{/literal}