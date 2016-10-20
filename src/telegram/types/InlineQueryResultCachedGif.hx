package telegram.types;

/**
	Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation.
**/
typedef InlineQueryResultCachedGif = {
	/**
		Type of the result, must be gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the GIF file
	**/
	var gif_file_id : String;
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