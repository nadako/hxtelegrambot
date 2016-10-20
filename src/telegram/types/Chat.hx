package telegram.types;

/**
	This object represents a chat.
**/
typedef Chat = {
	/**
		Unique identifier for this chat. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	var id : Int;
	/**
		Type of chat, can be either “private”, “group”, “supergroup” or “channel”
	**/
	var type : String;
	/**
		Title, for supergroups, channels and group chats
	**/
	@:optional
	var title : String;
	/**
		Username, for private chats, supergroups and channels if available
	**/
	@:optional
	var username : String;
	/**
		First name of the other party in a private chat
	**/
	@:optional
	var first_name : String;
	/**
		Last name of the other party in a private chat
	**/
	@:optional
	var last_name : String;
	/**
		True if a group has ‘All Members Are Admins’ enabled.
	**/
	@:optional
	var all_members_are_administrators : Bool;
}