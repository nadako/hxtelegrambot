package telegram.bot.types;

/**
	This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.
**/
typedef InlineQuery = {
	/**
		Unique identifier for this query
	**/
	var id : String;
	/**
		Sender
	**/
	var from : User;
	/**
		Sender location, only for bots that request user location
	**/
	@:optional
	var location : Location;
	/**
		Text of the query (up to 512 characters)
	**/
	var query : String;
	/**
		Offset of the results to be returned, can be controlled by the bot
	**/
	var offset : String;
}