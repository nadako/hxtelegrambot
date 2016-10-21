package telegram.bot.types;

/**
	This object represents a general file (as opposed to photos, voice messages and audio files).
**/
typedef Document = {
	/**
		Unique file identifier
	**/
	var file_id : String;
	/**
		Document thumbnail as defined by sender
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Original filename as defined by sender
	**/
	@:optional
	var file_name : String;
	/**
		MIME type of the file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		File size
	**/
	@:optional
	var file_size : Int;
}