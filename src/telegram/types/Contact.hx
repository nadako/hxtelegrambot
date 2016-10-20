package telegram.types;

/**
	This object represents a phone contact.
**/
typedef Contact = {
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
	/**
		Contact's user identifier in Telegram
	**/
	@:optional
	var user_id : Int;
}