// get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));




// calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y + 1, oWall) && (key_jump))
{
	vsp = -7;
}


walljumping = 0;
walljumpframes = 360;
walljumpframe = 0;



// horizontal collision
if (place_meeting(x + hsp, y, oWall)) 
{
	// if not hitting wall
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	
	if(place_meeting(x + sign(hsp), y, oWall) && !place_meeting(x, y + 1, oWall) && key_jump)
	{
		walljumping = 1;
		show_debug_message("WALL JUMP");	
		x = x - sign(hsp);
	}
	
	while (walljumping)
	{
			
	}
	
	
	hsp = 0;
}
x = x + hsp;





// vertical collision
if (place_meeting(x, y + vsp, oWall)) 
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;