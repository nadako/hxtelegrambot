package telegram.bot.types;

/**
	Represents the content of a contact message to be sent as the result of an inline query.
**/
typedef InputContactMessageContent = {
	/**
		Contact's phone number
	**/
	var phone_number : String;
	/**
		Contact's first name
	**/
	var first_name : String;
	/**
		Contact's last name
	**/
	@:optional
	var last_name : String;
}