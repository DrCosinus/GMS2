///@description Initialize the state machine of main character

if (event_type!=ev_create)
{
    show_error("This script meant to be call only in \"Create\" event!", true);
}

state = noone;
fsmChangeState(mcsGrounded);
