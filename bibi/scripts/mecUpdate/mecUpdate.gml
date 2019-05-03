///@description Update mechanics
///@param canMoveVertically
var dt = delta_time * 0.000001; // delta_time in seconds
var acc = mecGravity;

mec_hspeed = ground_speed_* mcInputHMove();
var dx = mec_hspeed * dt;
x += dx;

if (dx>0)
{ // toward right
    //var topRightTile = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_top) & tile_index_mask;
    var bottomRightTile = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_bottom) & tile_index_mask;
    
    if (/*topRightTile!=0 or*/ bottomRightTile!=0)
    {
        x = (bbox_right div col_tmap_tile_width)*col_tmap_tile_width - 1 - rel_bbox_right_;
    }
}
else if (dx<0)
{ // toward left
    //var topLeftTile = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_top) & tile_index_mask;
    var bottomLeftTile = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_bottom) & tile_index_mask;
    
    if (/*topLeftTile!=0 or*/ bottomLeftTile!=0)
    {
        x = (bbox_left div col_tmap_tile_width)*col_tmap_tile_width + 64 - rel_bbox_left_;
    }
}

if (!mec_grounded)
{
    mec_vspeed += acc * dt;
    var dy = mec_vspeed * dt;
    y += dy;

    if (dy>0)
    { // vers le bas
        var bottomLeftTile = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_bottom) & tile_index_mask;
        var bottomRightTile = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_bottom) & tile_index_mask;
    
        if (bottomLeftTile!=0 or bottomRightTile!=0)
        {
            mec_grounded = true;
        }
    }
}
else
{
    mec_vspeed = 0;
    var bottomLeftTile = tilemap_get_at_pixel(col_tmap_id, bbox_left, bbox_bottom+1) & tile_index_mask;
    var bottomRightTile = tilemap_get_at_pixel(col_tmap_id, bbox_right, bbox_bottom+1) & tile_index_mask;
    
    if (bottomLeftTile==0 and bottomRightTile==0) // should used a script "tileIsGround" instead of "!=0"
    {
        mec_grounded = false;
    }
}
