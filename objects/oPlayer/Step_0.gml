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

// horizontal collision
if (place_meeting(x + hsp, y, oWall))
{	
    while (!place_meeting(x + sign(hsp), y, oWall))
    {
        x += sign(hsp);
    }
	
    hsp = 0;
}


// walljump code
if (place_meeting(x + 1, y, oWall) || place_meeting(x - 1, y, oWall) && !place_meeting(x, y + 1, oWall))
{
	
	if (key_jump && !walljumping && !endingwalljump)
	{
		walljumping = 1;
		endingwalljump = 1;
		alarm[0] = 18;
		alarm[1] = 40;
	}
}


// figure out here, minus if going right, plus if going left
if (!walljumping) {
	if (!endingwalljump)
		x = x + hsp;
	else
		x = x - 2;
}
else
{
	x = x - 4;
}




// vertical collision
if (place_meeting(x, y + vsp, oWall)) 
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

if (!walljumping)
	y = y + vsp;
else
	y = y - 4;