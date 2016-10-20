package telegram.types;

/**
	Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.
**/
typedef InlineQueryResultContact = {
	/**
		Type of the result, must be contact
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Contact's phone number
	**/
	var phone_number : String;
	/**
		Contact's first name
	**/
	var first_name : String;
	/**
		Contact's last name
	**/
	@:optional
	var last_name : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the contact
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		Url of the thumbnail for the result
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