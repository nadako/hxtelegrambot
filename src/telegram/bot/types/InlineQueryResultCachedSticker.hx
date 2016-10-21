package telegram.bot.types;

/**
	Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker.
**/
typedef InlineQueryResultCachedSticker = {
	/**
		Type of the result, must be sticker
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier of the sticker
	**/
	var sticker_file_id : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the sticker
	**/
	@:optional
	var input_message_content : InputMessageContent;
}