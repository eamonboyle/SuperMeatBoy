hsp = 0;
vsp = 0;
grv = 0.35;
walksp = 4;
jump_speed = -9;
walljumping = 0;
endingwalljump = 0;
wall_side = 0;

if (variable_global_exists("spawn_x")) {
	x = global.spawn_x;
	y = global.spawn_y;
}
