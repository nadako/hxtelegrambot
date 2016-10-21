package telegram.bot.types;

/**
	Represents a Game.
**/
typedef InlineQueryResultGame = {
	/**
		Type of the result, must be game
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		Short name of the game
	**/
	var game_short_name : String;
	/**
		Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}