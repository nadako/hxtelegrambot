package telegram.types;

/**
	This object represents a Telegram user or bot.
**/
typedef User = {
	/**
		Unique identifier for this user or bot
	**/
	var id : Int;
	/**
		User‘s or bot’s first name
	**/
	var first_name : String;
	/**
		User‘s or bot’s last name
	**/
	@:optional
	var last_name : String;
	/**
		User‘s or bot’s username
	**/
	@:optional
	var username : String;
}