package telegram.bot.types;

/**
	This object represents a video file.
**/
typedef Video = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Video width as defined by sender
	**/
	var width : Int;
	/**
		Video height as defined by sender
	**/
	var height : Int;
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
		Mime type of a file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		File size
	**/
	@:optional
	var file_size : Int;
}