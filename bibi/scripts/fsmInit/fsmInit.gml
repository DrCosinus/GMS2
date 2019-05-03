///@description Initialize the state machine of main character

assert(event_type==ev_create, "This script meant to be call only in \"Create\" event!");

state = noone;
fsmChangeState(mcsGrounded);
logWarning("plop")