package telegram.bot.types;

/**
	This object contains information about one member of a chat.
**/
typedef ChatMember = {
	/**
		Information about the user
	**/
	var user : User;
	/**
		The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
	**/
	var status : String;
	/**
		Restictred and kicked only. Date when restrictions will be lifted for this user, unix time
	**/
	@:optional
	var until_date : Int;
	/**
		Administrators only. True, if the bot is allowed to edit administrator privileges of that user
	**/
	@:optional
	var can_be_edited : Bool;
	/**
		Administrators only. True, if the administrator can change the chat title, photo and other settings
	**/
	@:optional
	var can_change_info : Bool;
	/**
		Administrators only. True, if the administrator can post in the channel, channels only
	**/
	@:optional
	var can_post_messages : Bool;
	/**
		Administrators only. True, if the administrator can edit messages of other users, channels only
	**/
	@:optional
	var can_edit_messages : Bool;
	/**
		Administrators only. True, if the administrator can delete messages of other users
	**/
	@:optional
	var can_delete_messages : Bool;
	/**
		Administrators only. True, if the administrator can invite new users to the chat
	**/
	@:optional
	var can_invite_users : Bool;
	/**
		Administrators only. True, if the administrator can restrict, ban or unban chat members
	**/
	@:optional
	var can_restrict_members : Bool;
	/**
		Administrators only. True, if the administrator can pin messages, supergroups only
	**/
	@:optional
	var can_pin_messages : Bool;
	/**
		Administrators only. True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
	**/
	@:optional
	var can_promote_members : Bool;
	/**
		Restricted only. True, if the user can send text messages, contacts, locations and venues
	**/
	@:optional
	var can_send_messages : Bool;
	/**
		Restricted only. True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
	**/
	@:optional
	var can_send_media_messages : Bool;
	/**
		Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages
	**/
	@:optional
	var can_send_other_messages : Bool;
	/**
		Restricted only. True, if user may add web page previews to his messages, implies can_send_media_messages
	**/
	@:optional
	var can_add_web_page_previews : Bool;
}