package telegram.bot.types;

/**
	Represents a link to an mp3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
**/
typedef InlineQueryResultCachedAudio = {
	/**
		Type of the result, must be audio
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the audio file
	**/
	var audio_file_id : String;
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
		Content of the message to be sent instead of the audio
	**/
	@:optional
	var input_message_content : InputMessageContent;
}