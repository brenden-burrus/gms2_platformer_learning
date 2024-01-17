/// @description Insert description here
// You can write your code in this editor
var snail_col_box_top = sprite_get_bbox_top(sprite_index) * image_yscale;
var player_col_box_bot = sprite_get_bbox_bottom(obj_player.sprite_index) * obj_player.image_yscale;

var snail_top = y - sprite_yoffset + snail_col_box_top;
var player_bottom = obj_player.y - obj_player.sprite_yoffset + player_col_box_bot;

var vertical_collision = (player_bottom - snail_top) < obj_player.vsp


if (vertical_collision) 
{
	with(obj_player){
		bounce()
	}
	instance_create_layer(x, y, layer, obj_snail_dead);
	instance_destroy();
}else{
	instance_create_layer(obj_player.x, obj_player.y, layer, obj_player_dead);
	with(obj_player){
		instance_destroy()
	}
	obj_game.alarm[0] = 120;
}



