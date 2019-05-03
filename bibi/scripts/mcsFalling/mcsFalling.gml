///@description Main character state: Falling 
///@param argument0 State step

switch(argument0)
{
case StateStep.Setup:
    break;
    
case StateStep.Update:
    if (mec_grounded)
    {
        fsmChangeState(mcsGrounded);
        exit;
    }

    break;
    
case StateStep.Teardown:
    mecSnapBottom();
    break;
}