/// @description HUD
var msg = "Arrows / WASD — Space jump — Wall jump on vertical walls";
if (room == room_last) {
	msg = "You cleared the demo! R to restart from level 1.";
} else {
	msg += " — Touch green goal to finish the level";
}
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(8, 8, msg);
draw_text(8, 28, "R restart run");
