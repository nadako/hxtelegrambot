package telegram.bot.types;

/**
	This object represents a video message (available in Telegram apps as of v.4.0).
**/
typedef VideoNote = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Video width and height as defined by sender
	**/
	var length : Int;
	/**
		Duration of the video in seconds as defined by sender
	**/
	var duration : Int;
	/**
		Video thumbnail
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		File size
	**/
	@:optional
	var file_size : Int;
}