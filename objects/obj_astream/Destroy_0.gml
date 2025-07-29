show_debug_message("Stream")
debug_message("songname")
show_debug_message(mystream)
if mystream != snd_nosound
	audio_destroy_stream(mystream);
