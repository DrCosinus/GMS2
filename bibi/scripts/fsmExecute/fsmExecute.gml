///@description Process the state machine of main character

assert(variable_instance_exists(id, "state"), "Missing instance variable \"state\"");

assert(event_type==ev_step, "This script meant to be call only in \"Step\" event!");

script_execute(state, StateStep.Update);