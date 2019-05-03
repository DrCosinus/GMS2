///@description Main character state: grounded 
///@param argument0 State step

switch(argument0)
{
case StateStep.Setup:
    break;

case StateStep.Update:

    if (!variable_instance_exists(id, "col_tmap_id"))
    {
        show_error("Missing instance variable \"col_tmap_id\"", true);
    }

    if (event_type!=ev_step)
    {
        show_error("This script meant to be call only in \"Step\" event!", true);
    }

    // exit condition: no ground beneath feet
    var tileLeft = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_bottom+1) & tile_index_mask;
    var tileRight = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_bottom+1) & tile_index_mask;
    if (tileLeft==0 and tileRight==0) // should used a script "tileIsGround" instead of "!=0"
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


    var dt = delta_time * 0.000001; // delta_time en secondes
    var acc = gravity_;
    //vspeed_ += acc * dt;
    dy = vspeed_ * dt;
    dx = ground_speed_* mcInputHMove() * dt;

    vspeed_ = 0;

    x += dx;
    if (dx>0)
    { // vers la droite
        //var t1 = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_top) & tile_index_mask;
        var t2 = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_bottom) & tile_index_mask;
    
        if (/*t1!=0 or*/ t2!=0)
        {
            x = (bbox_right div col_tmap_tile_width)*col_tmap_tile_width - 1 - rel_bbox_right_;
        }
    }
    else if (dx<0)
    { // vers la gauche
        //var t1 = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_top) & tile_index_mask;
        var t2 = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_bottom) & tile_index_mask;
    
        if (/*t1!=0 or*/ t2!=0)
        {
            x = (bbox_left div col_tmap_tile_width)*col_tmap_tile_width + 64 - rel_bbox_left_;
        }
    }
    break;

case StateStep.Teardown:
    break;
}