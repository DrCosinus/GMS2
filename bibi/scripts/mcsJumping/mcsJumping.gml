switch(argument0)
{
case StateStep.Setup:
    mec_vspeed = -mecComputeImpulse(DS_Jump_Height);
    mec_grounded = false;
    break;
    
case StateStep.Update:

    mecUpdate();
    if (mec_vspeed>0)
    {
        mcChangeState(mcsFalling);
        exit;
    }
    break;

case StateStep.Teardown:
    break;
}