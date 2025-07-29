variable_global_set("%%METHODLIST%%", {}) // Stuff in Scripts are always Ran First (For initilizing every function), So that's why I have this outside of a function inside of a script.

function scr_getmethodbykey(methodkey, failreturn = function() {}){ // Gives the Method created by with the Key (Or returns what's given as a fallback input.) Which will run from the POV of the instance that called this function
    var methodlist = variable_global_get("%%METHODLIST%%")
    if variable_struct_exists(methodlist, string(methodkey))
        return method(id, variable_struct_get(methodlist, string(methodkey)))
    else
        return failreturn
}

function scr_createmethodforkey(methodkey, method) { // Adds the Method with the Key
    variable_struct_set(variable_global_get("%%METHODLIST%%"), string(methodkey), method)
}

scr_createmethodforkey("METHOD_NPCTEST", function() { // Something Creating a Test Method, METHOD_NPCTEST
    show_debug_message(string(id) + ": ... Function?")
    
        if !variable_instance_exists(id, "CHATAMOUNT")
            CHATAMOUNT = 0;
        switch CHATAMOUNT
        {
            case 1:
            case 0:
                global.msg[0] = "* .../%"    
            break
            case 2:
                global.msg[0] = "* ...?/%"
            break
            case 3:
                global.msg[0] = "* ..??/%"
            break
            case 4:
                global.msg[0] = "* .???/%"
            break
            case 5:
                global.msg[0] = "* ????/%"
            break
            default:
                global.msg[0] = "* ????//"
                global.msg[1] = "* ?../%"
        }
        CHATAMOUNT++
})