package telegram.bot.types;

/**
	Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
**/
typedef InlineQueryResultMpeg4Gif = {
	/**
		Type of the result, must be mpeg4_gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the MP4 file. File size must not exceed 1MB
	**/
	var mpeg4_url : String;
	/**
		Video width
	**/
	@:optional
	var mpeg4_width : Int;
	/**
		Video height
	**/
	@:optional
	var mpeg4_height : Int;
	/**
		URL of the static thumbnail (jpeg or gif) for the result
	**/
	var thumb_url : String;
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