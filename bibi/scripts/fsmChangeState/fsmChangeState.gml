///@description Change the main character state
///@arg state_name The new state name

var new_state = argument0;

if (!script_exists(new_state))
{
    show_error("State \""+script_get_name(new_state)+"\" does not exist!", true);
}

if (state != noone)
{
    show_debug_message("Leaving state \""+ script_get_name(state) +"\".");
    script_execute(state, StateStep.Teardown);
}

state = new_state;

script_execute(state, StateStep.Setup);
show_debug_message("Entering state \""+ script_get_name(state) +"\".");

