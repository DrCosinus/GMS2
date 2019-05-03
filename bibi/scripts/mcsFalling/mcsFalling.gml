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
    y = (bbox_bottom div col_tmap_tile_height)*col_tmap_tile_height - 1 - rel_bbox_bottom_;
    vspeed_ = 0;
    break;
}