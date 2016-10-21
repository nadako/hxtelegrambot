package telegram.bot.types;

/**
	This object contains information about one member of the chat.
**/
typedef ChatMember = {
	/**
		Information about the user
	**/
	var user : User;
	/**
		The member's status in the chat. Can be “creator”, “administrator”, “member”, “left” or “kicked”
	**/
	var status : String;
}