///@description Main character state: Grounded 
///@param argument0 State step

switch(argument0)
{
case StateStep.Setup:
    break;

case StateStep.Update:

    // exit condition: no ground beneath feet
    if (!mec_grounded)
    {
        mcChangeState(mcsFalling);
        exit;
    }

    // if jump button is pressed then go to jump state
    if (keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0, gp_face1))
    {
        mcChangeState(mcsJumping);
        exit;
    }

    break;

case StateStep.Teardown:
    break;
}