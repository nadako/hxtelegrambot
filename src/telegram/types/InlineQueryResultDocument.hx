package telegram.types;

/**
	Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.
**/
typedef InlineQueryResultDocument = {
	/**
		Type of the result, must be document
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		Caption of the document to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		A valid URL for the file
	**/
	var document_url : String;
	/**
		Mime type of the content of the file, either “application/pdf” or “application/zip”
	**/
	var mime_type : String;
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
		Content of the message to be sent instead of the file
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		URL of the thumbnail (jpeg only) for the file
	**/
	@:optional
	var thumb_url : String;
	/**
		Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}