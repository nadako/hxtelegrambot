package telegram.types;

/**
	Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.
**/
typedef InlineQueryResultVenue = {
	/**
		Type of the result, must be venue
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Latitude of the venue location in degrees
	**/
	var latitude : Float;
	/**
		Longitude of the venue location in degrees
	**/
	var longitude : Float;
	/**
		Title of the venue
	**/
	var title : String;
	/**
		Address of the venue
	**/
	var address : String;
	/**
		Foursquare identifier of the venue if known
	**/
	@:optional
	var foursquare_id : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Content of the message to be sent instead of the venue
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