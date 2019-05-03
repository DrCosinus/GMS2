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
        fsmChangeState(mcsFalling);
        exit;
    }

    if (mcInputJumpPressed())
    {
        fsmChangeState(mcsJumping);
        exit;
    }

    break;

case StateStep.Teardown:
    break;
}