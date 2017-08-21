package telegram.bot.types;

/**
	This object represents a chat photo.
**/
typedef ChatPhoto = {
	/**
		Unique file identifier of small (160x160) chat photo. This file_id can be used only for photo download.
	**/
	var small_file_id : String;
	/**
		Unique file identifier of big (640x640) chat photo. This file_id can be used only for photo download.
	**/
	var big_file_id : String;
}