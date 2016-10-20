package telegram.types;

/**
	You can provide an animation for your game so that it looks stylish in chats (check out Lumberjack for an example). This object represents an animation file to be displayed in the message containing a game.
**/
typedef Animation = {
	/**
		Unique file identifier
	**/
	var file_id : String;
	/**
		Animation thumbnail as defined by sender
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Original animation filename as defined by sender
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