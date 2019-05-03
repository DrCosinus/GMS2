/// @description 



#macro gravity_ 587
hspeed_ = 0;
vspeed_ = 0;
ground_jump_impulse_ = sqrt(2*gravity_*jump_height_);

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

mcInitState();
