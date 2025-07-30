if (con != 0) return;

if (obj_mainchara.bbox_right > bbox_left && obj_mainchara.bbox_top < bbox_bottom && obj_mainchara.bbox_bottom > bbox_top && obj_mainchara.bbox_left < bbox_right) {
	con = 1;
	
	scr_battle(DREncounter.TestEnemies, 0);
}