package telegram.types;

/**
	This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following 4 types:
	
	InputTextMessageContent
	InputLocationMessageContent
	InputVenueMessageContent
	InputContactMessageContent
	InputTextMessageContent
	Represents the content of a text message to be sent as the result of an inline query.
**/
typedef InputMessageContent = {
	/**
		Text of the message to be sent, 1-4096 characters
	**/
	var message_text : String;
	/**
		Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	**/
	@:optional
	var parse_mode : String;
	/**
		Disables link previews for links in the sent message
	**/
	@:optional
	var disable_web_page_preview : Bool;
}