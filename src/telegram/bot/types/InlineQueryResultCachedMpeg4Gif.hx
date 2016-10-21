package telegram.bot.types;

/**
	Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
**/
typedef InlineQueryResultCachedMpeg4Gif = {
	/**
		Type of the result, must be mpeg4_gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the MP4 file
	**/
	var mpeg4_file_id : String;
	/**
		Title for the result
	**/
	@:optional
	var title : String;
	/**
		Caption of the MPEG-4 file to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the video animation
	**/
	@:optional
	var input_message_content : InputMessageContent;
}