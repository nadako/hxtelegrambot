package telegram.bot.types;

/**
	This object represents an incoming update.
	At most one of the optional parameters can be present in any given update.
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
		New incoming channel post of any kind — text, photo, sticker, etc.
	**/
	@:optional
	var channel_post : Message;
	/**
		New version of a channel post that is known to the bot and was edited
	**/
	@:optional
	var edited_channel_post : Message;
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
	/**
		New incoming shipping query. Only for invoices with flexible price
	**/
	@:optional
	var shipping_query : ShippingQuery;
	/**
		New incoming pre-checkout query. Contains full information about checkout
	**/
	@:optional
	var pre_checkout_query : PreCheckoutQuery;
}