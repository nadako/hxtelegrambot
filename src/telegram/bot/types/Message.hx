package telegram.bot.types;

/**
	This object represents a message.
**/
typedef Message = {
	/**
		Unique message identifier inside this chat
	**/
	var message_id : Int;
	/**
		Sender, can be empty for messages sent to channels
	**/
	@:optional
	var from : User;
	/**
		Date the message was sent in Unix time
	**/
	var date : Int;
	/**
		Conversation the message belongs to
	**/
	var chat : Chat;
	/**
		For forwarded messages, sender of the original message
	**/
	@:optional
	var forward_from : User;
	/**
		For messages forwarded from a channel, information about the original channel
	**/
	@:optional
	var forward_from_chat : Chat;
	/**
		For forwarded channel posts, identifier of the original message in the channel
	**/
	@:optional
	var forward_from_message_id : Int;
	/**
		For forwarded messages, date the original message was sent in Unix time
	**/
	@:optional
	var forward_date : Int;
	/**
		For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
	**/
	@:optional
	var reply_to_message : Message;
	/**
		Date the message was last edited in Unix time
	**/
	@:optional
	var edit_date : Int;
	/**
		For text messages, the actual UTF-8 text of the message, 0-4096 characters.
	**/
	@:optional
	var text : String;
	/**
		For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
	**/
	@:optional
	var entities : Array<MessageEntity>;
	/**
		Message is an audio file, information about the file
	**/
	@:optional
	var audio : Audio;
	/**
		Message is a general file, information about the file
	**/
	@:optional
	var document : Document;
	/**
		Message is a game, information about the game. More about games »
	**/
	@:optional
	var game : Game;
	/**
		Message is a photo, available sizes of the photo
	**/
	@:optional
	var photo : Array<PhotoSize>;
	/**
		Message is a sticker, information about the sticker
	**/
	@:optional
	var sticker : Sticker;
	/**
		Message is a video, information about the video
	**/
	@:optional
	var video : Video;
	/**
		Message is a voice message, information about the file
	**/
	@:optional
	var voice : Voice;
	/**
		Message is a video note, information about the video message
	**/
	@:optional
	var video_note : VideoNote;
	/**
		New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
	**/
	@:optional
	var new_chat_members : Array<User>;
	/**
		Caption for the document, photo or video, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Message is a shared contact, information about the contact
	**/
	@:optional
	var contact : Contact;
	/**
		Message is a shared location, information about the location
	**/
	@:optional
	var location : Location;
	/**
		Message is a venue, information about the venue
	**/
	@:optional
	var venue : Venue;
	/**
		A new member was added to the group, information about them (this member may be the bot itself)
	**/
	@:optional
	var new_chat_member : User;
	/**
		A member was removed from the group, information about them (this member may be the bot itself)
	**/
	@:optional
	var left_chat_member : User;
	/**
		A chat title was changed to this value
	**/
	@:optional
	var new_chat_title : String;
	/**
		A chat photo was change to this value
	**/
	@:optional
	var new_chat_photo : Array<PhotoSize>;
	/**
		Service message: the chat photo was deleted
	**/
	@:optional
	var delete_chat_photo : True;
	/**
		Service message: the group has been created
	**/
	@:optional
	var group_chat_created : True;
	/**
		Service message: the supergroup has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
	**/
	@:optional
	var supergroup_chat_created : True;
	/**
		Service message: the channel has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
	**/
	@:optional
	var channel_chat_created : True;
	/**
		The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	@:optional
	var migrate_to_chat_id : Int;
	/**
		The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	@:optional
	var migrate_from_chat_id : Int;
	/**
		Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
	**/
	@:optional
	var pinned_message : Message;
	/**
		Message is an invoice for a payment, information about the invoice.
	**/
	@:optional
	var invoice : Invoice;
	/**
		Message is a service message about a successful payment, information about the payment.
	**/
	@:optional
	var successful_payment : SuccessfulPayment;
}