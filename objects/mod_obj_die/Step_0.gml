if con == 0 && (obj_mainchara.bbox_right > bbox_left && obj_mainchara.bbox_top < bbox_bottom && obj_mainchara.bbox_bottom > bbox_top && obj_mainchara.bbox_left < bbox_right) {
	con = 2;
	scr_tempsave()
	scr_gameover();
}