package telegram.bot.types;

/**
	Represents a link to an article or web page.
**/
typedef InlineQueryResultArticle = {
	/**
		Type of the result, must be article
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Title of the result
	**/
	var title : String;
	/**
		Content of the message to be sent
	**/
	var input_message_content : InputMessageContent;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		URL of the result
	**/
	@:optional
	var url : String;
	/**
		Pass True, if you don't want the URL to be shown in the message
	**/
	@:optional
	var hide_url : Bool;
	/**
		Short description of the result
	**/
	@:optional
	var description : String;
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