package telegram.types;

/**
	This object represents one button of an inline keyboard. You must use exactly one of the optional fields.
**/
typedef InlineKeyboardButton = {
	/**
		Label text on the button
	**/
	var text : String;
	/**
		HTTP url to be opened when button is pressed
	**/
	@:optional
	var url : String;
	/**
		Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
	**/
	@:optional
	var callback_data : String;
	/**
		If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.
	**/
	@:optional
	var switch_inline_query : String;
	/**
		If set, pressing the button will insert the bot‘s username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot’s username will be inserted.
	**/
	@:optional
	var switch_inline_query_current_chat : String;
	/**
		Description of the game that will be launched when the user presses the button.
	**/
	@:optional
	var callback_game : CallbackGame;
}