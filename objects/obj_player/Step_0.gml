/// Get Player Input
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space) or keyboard_check(ord("W"));

// Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//Horizontal Collision
if (tile_meeting_precise(x+hsp, y, "TileCollision"))
{
	while(!tile_meeting_precise(x+sign(hsp), y, "TileCollision"))
	{
		x = x + sign(hsp);	
	}
	hsp = 0;
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

y = y + vsp;


//Jumping
if (tile_meeting_precise(x, y+1, "TileCollision")) and (key_jump)
{
	vsp = jump_ht;
}


//Animation
if (!tile_meeting_precise(x, y+1, "TileCollision"))
{
	sprite_index = spr_playerJump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_playerIdle;
	}
	else
	{
		sprite_index = spr_playerRun;
	}
}

if (hsp != 0) image_xscale = sign(hsp);