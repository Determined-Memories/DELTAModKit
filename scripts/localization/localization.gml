function scr_change_language()
{
    if (global.lang == "en")
    {
        global.lang = "ja";
    }
    else
    {
        global.lang = "en";
    }
    
    ossafe_ini_open("true_config.ini");
    ini_write_string("LANG", "LANG", global.lang);
    ossafe_ini_close();
    ossafe_savedata_save();
	scr_84_init_localization()
}

function scr_84_init_localization() {
if (ossafe_file_exists("true_config.ini"))
    {
        ossafe_ini_open("true_config.ini");
        var _locale = os_get_language();
        var _lang;
        
        //if (scr_is_switch_os())
        //{
        //    _lang = substr(switch_language_get_desired_language(), 1, 2);
        //}
        //else
        {
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        }
        
        global.lang = ini_read_string("LANG", "LANG", _lang);
        ossafe_ini_close();
        ossafe_savedata_save();
    }
    
    if (!variable_global_exists("lang_loaded"))
    {
        global.lang_loaded = "";
    }
    
    if (!variable_global_exists("lang"))
    {
        var _locale = os_get_language();
        var _lang;
        
        if (scr_is_switch_os())
        {
            _lang = substr(switch_language_get_desired_language(), 1, 2);
        }
        else
        {
            _lang = (substr(_locale, 1, 2) != "ja") ? "en" : "ja";
        }
        
        global.lang = _lang;
    }	
}