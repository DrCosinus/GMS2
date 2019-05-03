///@description Main character state: Jumping 
///@param argument0 State step

switch(argument0)
{
case StateStep.Setup:
    mecInitiateJump(DS_Jump_Height);
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