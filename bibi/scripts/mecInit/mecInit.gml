///@description Initialize mechanics

mec_hspeed = 0;
mec_vspeed = 0;
mec_grounded = false;
mec_JumpImpulseSpeed = -mecComputeImpulse(DS_Jump_Height); // depends on design variable

// Should be called at each room begin
var col_layer_id = layer_get_id("Collisions");
col_tmap_id = layer_tilemap_get_id(col_layer_id);
col_tmap_tile_height = tilemap_get_tile_height(col_tmap_id);
col_tmap_tile_width = tilemap_get_tile_width(col_tmap_id);
layer_set_visible(col_layer_id, false);

// bbox position relative to origin
rel_bbox_left_ = sprite_get_bbox_left(sprite_index) - sprite_xoffset;
rel_bbox_right_ = sprite_get_bbox_right(sprite_index) - sprite_xoffset;
rel_bbox_top_ = sprite_get_bbox_top(sprite_index) - sprite_yoffset;
rel_bbox_bottom_ = sprite_get_bbox_bottom(sprite_index) - sprite_yoffset;

