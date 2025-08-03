function safe_string_hash_to_newline(str){
	str = string(str)
	return string_replace_all(str, "#", "\n")
}