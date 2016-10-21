package telegram.bot.types;

/**
	This object represents a voice note.
**/
typedef Voice = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Duration of the audio in seconds as defined by sender
	**/
	var duration : Int;
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