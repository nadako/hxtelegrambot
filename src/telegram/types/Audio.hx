package telegram.types;

/**
	This object represents an audio file to be treated as music by the Telegram clients.
**/
typedef Audio = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Duration of the audio in seconds as defined by sender
	**/
	var duration : Int;
	/**
		Performer of the audio as defined by sender or by audio tags
	**/
	@:optional
	var performer : String;
	/**
		Title of the audio as defined by sender or by audio tags
	**/
	@:optional
	var title : String;
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