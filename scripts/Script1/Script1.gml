// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_meeting(x_loc, y_loc, layer_name){
	var _layer = layer_name,
    _tm = layer_tilemap_get_id(_layer);

	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (x_loc - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (y_loc - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (x_loc - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (y_loc - y));

	for(var _x = _x1; _x <= _x2; _x++){
	 for(var _y = _y1; _y <= _y2; _y++){
	    if(tile_get_index(tilemap_get(_tm, _x, _y))){
	    return true;
	    }
	 }
	}

	return false;
}