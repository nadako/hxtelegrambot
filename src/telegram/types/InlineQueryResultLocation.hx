package telegram.types;

/**
	Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.
**/
typedef InlineQueryResultLocation = {
	/**
		Type of the result, must be location
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Location latitude in degrees
	**/
	var latitude : Float;
	/**
		Location longitude in degrees
	**/
	var longitude : Float;
	/**
		Location title
	**/
	var title : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the location
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		Url of the thumbnail for the result
	**/
	@:optional
	var thumb_url : String;
	/**
		Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}