// Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump_pressed = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
key_jump_held = keyboard_check(vk_space) || keyboard_check(ord("W"));

var move = key_right - key_left;
hsp = move * walksp;
vsp += grv;

var on_ground = place_meeting(x, y + 1, oWall);
if (on_ground && key_jump_pressed) {
	vsp = jump_speed;
}

// Horizontal collision (before wall jump uses wall contact)
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = 0;
}

// Wall contact: operator precedence fixed — (left wall OR right wall) AND airborne
var wall_left = place_meeting(x - 1, y, oWall);
var wall_right = place_meeting(x + 1, y, oWall);
var on_wall = (wall_left || wall_right) && !on_ground;

if (on_wall && key_jump_pressed && !walljumping && !endingwalljump) {
	walljumping = 1;
	endingwalljump = 1;
	wall_side = wall_right ? 1 : -1;
	vsp = jump_speed * 0.85;
	hsp = -wall_side * walksp * 1.2;
	alarm[0] = 14;
	alarm[1] = 28;
}

// Movement during wall jump arc
if (!walljumping) {
	if (!endingwalljump) {
		x += hsp;
	} else {
		x -= wall_side * 2;
	}
} else {
	x += hsp;
}

// Vertical collision
if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}

if (!walljumping) {
	y += vsp;
} else {
	y += vsp * 0.35;
}

// Pit respawn
if (y > room_height + 64) {
	x = global.spawn_x;
	y = global.spawn_y;
	hsp = 0;
	vsp = 0;
	walljumping = 0;
	endingwalljump = 0;
}
