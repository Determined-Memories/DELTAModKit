con = 0
timer = 0
snd_free_all()
var CH = string(global.chapter)
files_exist = ossafe_file_exists("filech" + CH + "_0") || ossafe_file_exists("filech" + CH + "_1") || ossafe_file_exists("filech" + CH + "_2") || ossafe_file_exists("filech" + CH + "_3")
init = 0
type = 0
