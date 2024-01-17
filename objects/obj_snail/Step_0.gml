/// @description Movement Logic for Enemies

vsp = vsp + grv;



//Checking to see if enemy is about to fall, and turns around if so
if (!tile_meeting(bbox_right+20, bbox_bottom+1, "TileCollision")) or (!tile_meeting(bbox_left-20, bbox_bottom+1, "TileCollision"))
{
    hsp = -hsp;

}
else if (tile_meeting_precise(x+hsp, y, "TileCollision"))
{
	while(!tile_meeting_precise(x+sign(hsp), y, "TileCollision"))
	{
		x = x + sign(hsp);	
	}
	hsp = -hsp;
}
x = x + hsp;

//Vertical Collision
if (tile_meeting_precise(x, y+vsp, "TileCollision"))
{
	while(!tile_meeting_precise(x, y+sign(vsp), "TileCollision"))
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}
y = y + vsp

//Animations
image_speed = 1;
if (hsp == 0)
{
	sprite_index = spr_snail;
}
else
{
	sprite_index = spr_snail_walk;
}
if (hsp > 0) image_xscale = -1; else image_xscale = 1;


