package telegram.types;

/**
	Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
**/
typedef InlineQueryResultCachedPhoto = {
	/**
		Type of the result, must be photo
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier of the photo
	**/
	var photo_file_id : String;
	/**
		Title for the result
	**/
	@:optional
	var title : String;
	/**
		Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Caption of the photo to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the photo
	**/
	@:optional
	var input_message_content : InputMessageContent;
}