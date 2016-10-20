package telegram.types;

/**
	Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only pdf-files and zip archives can be sent using this method.
**/
typedef InlineQueryResultCachedDocument = {
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
		A valid file identifier for the file
	**/
	var document_file_id : String;
	/**
		Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Caption of the document to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
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
}