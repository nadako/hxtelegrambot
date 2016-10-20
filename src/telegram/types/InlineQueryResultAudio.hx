package telegram.types;

/**
	Represents a link to an mp3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
**/
typedef InlineQueryResultAudio = {
	/**
		Type of the result, must be audio
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the audio file
	**/
	var audio_url : String;
	/**
		Title
	**/
	var title : String;
	/**
		Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Performer
	**/
	@:optional
	var performer : String;
	/**
		Audio duration in seconds
	**/
	@:optional
	var audio_duration : Int;
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