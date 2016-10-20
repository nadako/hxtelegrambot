package telegram.types;

/**
	Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
**/
typedef InlineQueryResultVideo = {
	/**
		Type of the result, must be video
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the embedded video player or video file
	**/
	var video_url : String;
	/**
		Mime type of the content of video url, “text/html” or “video/mp4”
	**/
	var mime_type : String;
	/**
		URL of the thumbnail (jpeg only) for the video
	**/
	var thumb_url : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		Caption of the video to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Video width
	**/
	@:optional
	var video_width : Int;
	/**
		Video height
	**/
	@:optional
	var video_height : Int;
	/**
		Video duration in seconds
	**/
	@:optional
	var video_duration : Int;
	/**
		Short description of the result
	**/
	@:optional
	var description : String;
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