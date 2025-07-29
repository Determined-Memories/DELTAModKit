if (con != 0) return;

if (obj_mainchara.x > bbox_left && obj_mainchara.y < bbox_bottom && obj_mainchara.y > bbox_top && obj_mainchara.x < bbox_right) {
	con = 1;
	
	scr_battle(DREncounter.TestEnemies, 0);
}