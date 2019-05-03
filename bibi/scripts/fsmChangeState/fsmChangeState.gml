///@description Change the main character state
///@arg state_name The new state name

var new_state = argument0;

assert(script_exists(new_state), "State \""+script_get_name(new_state)+"\" does not exist!");

if (state != noone)
{
    logMessage("Leaving state \""+ script_get_name(state) +"\".");
    script_execute(state, StateStep.Teardown);
}

state = new_state;

script_execute(state, StateStep.Setup);
logMessage("Entering state \""+ script_get_name(state) +"\".");

