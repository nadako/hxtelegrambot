package telegram.types;

/**
	This object represents an inline keyboard that appears right next to the message it belongs to.
**/
typedef InlineKeyboardMarkup = {
	/**
		Array of button rows, each represented by an Array of InlineKeyboardButton objects
	**/
	var inline_keyboard : Array<Array<InlineKeyboardButton>>;
}