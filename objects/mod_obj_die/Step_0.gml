if con == 0 && (obj_mainchara.x > bbox_left && obj_mainchara.y < bbox_bottom && obj_mainchara.y > bbox_top && obj_mainchara.x < bbox_right) {
	con = 2;
	scr_tempsave()
	scr_gameover();
}