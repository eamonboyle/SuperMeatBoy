/// @description Camera follows player
var p = instance_find(oPlayer, 0);
if (p != noone) {
	var vw = camera_get_view_width(view_camera[0]);
	var vh = camera_get_view_height(view_camera[0]);
	var tx = clamp(p.x - vw * 0.5, 0, room_width - vw);
	var ty = clamp(p.y - vh * 0.5, 0, room_height - vh);
	camera_set_view_pos(view_camera[0], tx, ty);
}
