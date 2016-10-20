package telegram.types;

/**
	Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message.
**/
typedef InlineQueryResultCachedVoice = {
	/**
		Type of the result, must be voice
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the voice message
	**/
	var voice_file_id : String;
	/**
		Voice message title
	**/
	var title : String;
	/**
		Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the voice message
	**/
	@:optional
	var input_message_content : InputMessageContent;
}