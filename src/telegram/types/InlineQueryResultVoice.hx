package telegram.types;

/**
	Represents a link to a voice recording in an .ogg container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.
**/
typedef InlineQueryResultVoice = {
	/**
		Type of the result, must be voice
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the voice recording
	**/
	var voice_url : String;
	/**
		Recording title
	**/
	var title : String;
	/**
		Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Recording duration in seconds
	**/
	@:optional
	var voice_duration : Int;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the voice recording
	**/
	@:optional
	var input_message_content : InputMessageContent;
}