///@description Process the state machine of main character

if (!variable_instance_exists(id, "state"))
{
    show_error("Missing instance variable \"state\"", true);
}

if (event_type!=ev_step)
{
    show_error("This script meant to be call only in \"Step\" event!", true);
}


if (!script_exists(state))
{
    show_error("The state script \"" + script_get_name(state) + "\" is not valid!", true);
}

script_execute(state, StateStep.Update);