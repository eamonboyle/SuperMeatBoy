/// @description Advance level or restart after winning
if (room == room_last) {
	game_restart();
} else {
	room_goto_next();
}
