switch(argument0)
{
case StateStep.Setup:
    break;
    
case StateStep.Update:

    var dt = delta_time * 0.000001; // delta_time en secondes
    var acc = gravity_;
    vspeed_ += acc * dt;
    dy = vspeed_ * dt;
    dx = ground_speed_* mcInputHMove() * dt;

    // déplacement vertical
    y += dy;
    if (dy>0)
    { // vers le bas
        var t1 = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_bottom) & tile_index_mask;
        var t2 = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_bottom) & tile_index_mask;
    
        if (t1!=0 or t2!=0)
        {
            mcChangeState(mcsGrounded);
            exit;
        }
    }
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
    y = (bbox_bottom div col_tmap_tile_height)*col_tmap_tile_height - 1 - rel_bbox_bottom_;
    vspeed_ = 0;
    break;
}