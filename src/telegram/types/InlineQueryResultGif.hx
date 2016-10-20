package telegram.types;

/**
	Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
**/
typedef InlineQueryResultGif = {
	/**
		Type of the result, must be gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the GIF file. File size must not exceed 1MB
	**/
	var gif_url : String;
	/**
		Width of the GIF
	**/
	@:optional
	var gif_width : Int;
	/**
		Height of the GIF
	**/
	@:optional
	var gif_height : Int;
	/**
		URL of the static thumbnail for the result (jpeg or gif)
	**/
	var thumb_url : String;
	/**
		Title for the result
	**/
	@:optional
	var title : String;
	/**
		Caption of the GIF file to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the GIF animation
	**/
	@:optional
	var input_message_content : InputMessageContent;
}