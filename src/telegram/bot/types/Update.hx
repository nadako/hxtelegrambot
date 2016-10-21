package telegram.bot.types;

/**
	This object represents an incoming update.
	Only one of the optional parameters can be present in any given update.
**/
typedef Update = {
	/**
		The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you’re using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order.
	**/
	var update_id : Int;
	/**
		New incoming message of any kind — text, photo, sticker, etc.
	**/
	@:optional
	var message : Message;
	/**
		New version of a message that is known to the bot and was edited
	**/
	@:optional
	var edited_message : Message;
	/**
		New incoming inline query
	**/
	@:optional
	var inline_query : InlineQuery;
	/**
		The result of an inline query that was chosen by a user and sent to their chat partner.
	**/
	@:optional
	var chosen_inline_result : ChosenInlineResult;
	/**
		New incoming callback query
	**/
	@:optional
	var callback_query : CallbackQuery;
}