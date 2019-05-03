///@description Main character state: Jumping 
///@param argument0 State step

switch(argument0)
{
case StateStep.Setup:
    mec_vspeed = -mecComputeImpulse(DS_Jump_Height);
    mec_grounded = false;
    break;
    
case StateStep.Update:

    if (mec_vspeed>0)
    {
        fsmChangeState(mcsFalling);
        exit;
    }
    break;

case StateStep.Teardown:
    break;
}