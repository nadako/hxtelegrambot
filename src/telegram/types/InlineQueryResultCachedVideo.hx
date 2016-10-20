package telegram.types;

/**
	Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
**/
typedef InlineQueryResultCachedVideo = {
	/**
		Type of the result, must be video
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the video file
	**/
	var video_file_id : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Caption of the video to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the video
	**/
	@:optional
	var input_message_content : InputMessageContent;
}