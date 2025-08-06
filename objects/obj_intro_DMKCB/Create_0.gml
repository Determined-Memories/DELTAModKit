con = 0;
timer = 0;
snd_free_all();
var CH = string(global.chapter);
files_exist = ossafe_file_exists("filech" + CH + "_0") || ossafe_file_exists("filech" + CH + "_1") || ossafe_file_exists("filech" + CH + "_2") || ossafe_file_exists("filech" + CH + "_3");
nextroom = PLACE_MENU
logotimer = 0;
init = false;
type = 0;
alpha = 1;


OB_DEPTH = 0;
obacktimer = 0;
OBM = 0.5
OBMADE = false