import haxe.extern.EitherType;

/**
	This object represents an incoming update.At most one of the optional parameters can be present in any given update.
**/
typedef Update = {
	/**
		The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you’re using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.
	**/
	var update_id : Int;
	/**
		Optional. New incoming message of any kind — text, photo, sticker, etc.
	**/
	@:optional
	var message : Message;
	/**
		Optional. New version of a message that is known to the bot and was edited
	**/
	@:optional
	var edited_message : Message;
	/**
		Optional. New incoming channel post of any kind — text, photo, sticker, etc.
	**/
	@:optional
	var channel_post : Message;
	/**
		Optional. New version of a channel post that is known to the bot and was edited
	**/
	@:optional
	var edited_channel_post : Message;
	/**
		Optional. New incoming inline query
	**/
	@:optional
	var inline_query : InlineQuery;
	/**
		Optional. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.
	**/
	@:optional
	var chosen_inline_result : ChosenInlineResult;
	/**
		Optional. New incoming callback query
	**/
	@:optional
	var callback_query : CallbackQuery;
	/**
		Optional. New incoming shipping query. Only for invoices with flexible price
	**/
	@:optional
	var shipping_query : ShippingQuery;
	/**
		Optional. New incoming pre-checkout query. Contains full information about checkout
	**/
	@:optional
	var pre_checkout_query : PreCheckoutQuery;
}

/**
	Parameters object for the `getUpdates` API method.
**/
typedef GetUpdatesParams = {
	/**
		Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will forgotten.
	**/
	@:optional
	var offset : Int;
	/**
		Limits the number of updates to be retrieved. Values between 1—100 are accepted. Defaults to 100.
	**/
	@:optional
	var limit : Int;
	/**
		Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
	**/
	@:optional
	var timeout : Int;
	/**
		List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the getUpdates, so unwanted updates may be received for a short period of time.
	**/
	@:optional
	var allowed_updates : Array<String>;
}

/**
	Parameters object for the `setWebhook` API method.
**/
typedef SetWebhookParams = {
	/**
		HTTPS url to send updates to. Use an empty string to remove webhook integration
	**/
	var url : String;
	/**
		Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
	**/
	@:optional
	var certificate : InputFile;
	/**
		Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100. Defaults to 40. Use lower values to limit the load on your bot‘s server, and higher values to increase your bot’s throughput.
	**/
	@:optional
	var max_connections : Int;
	/**
		List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.Please note that this parameter doesn't affect updates created before the call to the setWebhook, so unwanted updates may be received for a short period of time.
	**/
	@:optional
	var allowed_updates : Array<String>;
}

/**
	Contains information about the current status of a webhook.
**/
typedef WebhookInfo = {
	/**
		Webhook URL, may be empty if webhook is not set up
	**/
	var url : String;
	/**
		True, if a custom certificate was provided for webhook certificate checks
	**/
	var has_custom_certificate : Bool;
	/**
		Number of updates awaiting delivery
	**/
	var pending_update_count : Int;
	/**
		Optional. Unix time for the most recent error that happened when trying to deliver an update via webhook
	**/
	@:optional
	var last_error_date : Int;
	/**
		Optional. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
	**/
	@:optional
	var last_error_message : String;
	/**
		Optional. Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
	**/
	@:optional
	var max_connections : Int;
	/**
		Optional. A list of update types the bot is subscribed to. Defaults to all update types
	**/
	@:optional
	var allowed_updates : Array<String>;
}

/**
	This object represents a Telegram user or bot.
**/
typedef User = {
	/**
		Unique identifier for this user or bot
	**/
	var id : Int;
	/**
		True, if this user is a bot
	**/
	var is_bot : Bool;
	/**
		User‘s or bot’s first name
	**/
	var first_name : String;
	/**
		Optional. User‘s or bot’s last name
	**/
	@:optional
	var last_name : String;
	/**
		Optional. User‘s or bot’s username
	**/
	@:optional
	var username : String;
	/**
		Optional. IETF language tag of the user's language
	**/
	@:optional
	var language_code : String;
}

/**
	This object represents a chat.
**/
typedef Chat = {
	/**
		Unique identifier for this chat. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	var id : Int;
	/**
		Type of chat, can be either “private”, “group”, “supergroup” or “channel”
	**/
	var type : String;
	/**
		Optional. Title, for supergroups, channels and group chats
	**/
	@:optional
	var title : String;
	/**
		Optional. Username, for private chats, supergroups and channels if available
	**/
	@:optional
	var username : String;
	/**
		Optional. First name of the other party in a private chat
	**/
	@:optional
	var first_name : String;
	/**
		Optional. Last name of the other party in a private chat
	**/
	@:optional
	var last_name : String;
	/**
		Optional. True if a group has ‘All Members Are Admins’ enabled.
	**/
	@:optional
	var all_members_are_administrators : Bool;
	/**
		Optional. Chat photo. Returned only in getChat.
	**/
	@:optional
	var photo : ChatPhoto;
	/**
		Optional. Description, for supergroups and channel chats. Returned only in getChat.
	**/
	@:optional
	var description : String;
	/**
		Optional. Chat invite link, for supergroups and channel chats. Returned only in getChat.
	**/
	@:optional
	var invite_link : String;
	/**
		Optional. Pinned message, for supergroups. Returned only in getChat.
	**/
	@:optional
	var pinned_message : Message;
	/**
		Optional. For supergroups, name of group sticker set. Returned only in getChat.
	**/
	@:optional
	var sticker_set_name : String;
	/**
		Optional. True, if the bot can change the group sticker set. Returned only in getChat.
	**/
	@:optional
	var can_set_sticker_set : Bool;
}

/**
	This object represents a message.
**/
typedef Message = {
	/**
		Unique message identifier inside this chat
	**/
	var message_id : Int;
	/**
		Optional. Sender, empty for messages sent to channels
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
		Optional. For forwarded messages, sender of the original message
	**/
	@:optional
	var forward_from : User;
	/**
		Optional. For messages forwarded from channels, information about the original channel
	**/
	@:optional
	var forward_from_chat : Chat;
	/**
		Optional. For messages forwarded from channels, identifier of the original message in the channel
	**/
	@:optional
	var forward_from_message_id : Int;
	/**
		Optional. For messages forwarded from channels, signature of the post author if present
	**/
	@:optional
	var forward_signature : String;
	/**
		Optional. For forwarded messages, date the original message was sent in Unix time
	**/
	@:optional
	var forward_date : Int;
	/**
		Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
	**/
	@:optional
	var reply_to_message : Message;
	/**
		Optional. Date the message was last edited in Unix time
	**/
	@:optional
	var edit_date : Int;
	/**
		Optional. The unique identifier of a media message group this message belongs to
	**/
	@:optional
	var media_group_id : String;
	/**
		Optional. Signature of the post author for messages in channels
	**/
	@:optional
	var author_signature : String;
	/**
		Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters.
	**/
	@:optional
	var text : String;
	/**
		Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
	**/
	@:optional
	var entities : Array<MessageEntity>;
	/**
		Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption
	**/
	@:optional
	var caption_entities : Array<MessageEntity>;
	/**
		Optional. Message is an audio file, information about the file
	**/
	@:optional
	var audio : Audio;
	/**
		Optional. Message is a general file, information about the file
	**/
	@:optional
	var document : Document;
	/**
		Optional. Message is a game, information about the game. More about games »
	**/
	@:optional
	var game : Game;
	/**
		Optional. Message is a photo, available sizes of the photo
	**/
	@:optional
	var photo : Array<PhotoSize>;
	/**
		Optional. Message is a sticker, information about the sticker
	**/
	@:optional
	var sticker : Sticker;
	/**
		Optional. Message is a video, information about the video
	**/
	@:optional
	var video : Video;
	/**
		Optional. Message is a voice message, information about the file
	**/
	@:optional
	var voice : Voice;
	/**
		Optional. Message is a video note, information about the video message
	**/
	@:optional
	var video_note : VideoNote;
	/**
		Optional. Caption for the audio, document, photo, video or voice, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Message is a shared contact, information about the contact
	**/
	@:optional
	var contact : Contact;
	/**
		Optional. Message is a shared location, information about the location
	**/
	@:optional
	var location : Location;
	/**
		Optional. Message is a venue, information about the venue
	**/
	@:optional
	var venue : Venue;
	/**
		Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
	**/
	@:optional
	var new_chat_members : Array<User>;
	/**
		Optional. A member was removed from the group, information about them (this member may be the bot itself)
	**/
	@:optional
	var left_chat_member : User;
	/**
		Optional. A chat title was changed to this value
	**/
	@:optional
	var new_chat_title : String;
	/**
		Optional. A chat photo was change to this value
	**/
	@:optional
	var new_chat_photo : Array<PhotoSize>;
	/**
		Optional. Service message: the chat photo was deleted
	**/
	@:optional
	var delete_chat_photo : Bool;
	/**
		Optional. Service message: the group has been created
	**/
	@:optional
	var group_chat_created : Bool;
	/**
		Optional. Service message: the supergroup has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
	**/
	@:optional
	var supergroup_chat_created : Bool;
	/**
		Optional. Service message: the channel has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
	**/
	@:optional
	var channel_chat_created : Bool;
	/**
		Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	@:optional
	var migrate_to_chat_id : Int;
	/**
		Optional. The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	@:optional
	var migrate_from_chat_id : Int;
	/**
		Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
	**/
	@:optional
	var pinned_message : Message;
	/**
		Optional. Message is an invoice for a payment, information about the invoice. More about payments »
	**/
	@:optional
	var invoice : Invoice;
	/**
		Optional. Message is a service message about a successful payment, information about the payment. More about payments »
	**/
	@:optional
	var successful_payment : SuccessfulPayment;
}

/**
	This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
**/
typedef MessageEntity = {
	/**
		Type of the entity. Can be mention (@username), hashtag, bot_command, url, email, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs), text_mention (for users without usernames)
	**/
	var type : String;
	/**
		Offset in UTF-16 code units to the start of the entity
	**/
	var offset : Int;
	/**
		Length of the entity in UTF-16 code units
	**/
	var length : Int;
	/**
		Optional. For “text_link” only, url that will be opened after user taps on the text
	**/
	@:optional
	var url : String;
	/**
		Optional. For “text_mention” only, the mentioned user
	**/
	@:optional
	var user : User;
}

/**
	This object represents one size of a photo or a file / sticker thumbnail.
**/
typedef PhotoSize = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Photo width
	**/
	var width : Int;
	/**
		Photo height
	**/
	var height : Int;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	This object represents an audio file to be treated as music by the Telegram clients.
**/
typedef Audio = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Duration of the audio in seconds as defined by sender
	**/
	var duration : Int;
	/**
		Optional. Performer of the audio as defined by sender or by audio tags
	**/
	@:optional
	var performer : String;
	/**
		Optional. Title of the audio as defined by sender or by audio tags
	**/
	@:optional
	var title : String;
	/**
		Optional. MIME type of the file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	This object represents a general file (as opposed to photos, voice messages and audio files).
**/
typedef Document = {
	/**
		Unique file identifier
	**/
	var file_id : String;
	/**
		Optional. Document thumbnail as defined by sender
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Optional. Original filename as defined by sender
	**/
	@:optional
	var file_name : String;
	/**
		Optional. MIME type of the file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	This object represents a video file.
**/
typedef Video = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Video width as defined by sender
	**/
	var width : Int;
	/**
		Video height as defined by sender
	**/
	var height : Int;
	/**
		Duration of the video in seconds as defined by sender
	**/
	var duration : Int;
	/**
		Optional. Video thumbnail
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Optional. Mime type of a file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	This object represents a voice note.
**/
typedef Voice = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Duration of the audio in seconds as defined by sender
	**/
	var duration : Int;
	/**
		Optional. MIME type of the file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	This object represents a video message (available in Telegram apps as of v.4.0).
**/
typedef VideoNote = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Video width and height as defined by sender
	**/
	var length : Int;
	/**
		Duration of the video in seconds as defined by sender
	**/
	var duration : Int;
	/**
		Optional. Video thumbnail
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

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
		Optional. Contact's last name
	**/
	@:optional
	var last_name : String;
	/**
		Optional. Contact's user identifier in Telegram
	**/
	@:optional
	var user_id : Int;
}

/**
	This object represents a point on the map.
**/
typedef Location = {
	/**
		Longitude as defined by sender
	**/
	var longitude : Float;
	/**
		Latitude as defined by sender
	**/
	var latitude : Float;
}

/**
	This object represents a venue.
**/
typedef Venue = {
	/**
		Venue location
	**/
	var location : Location;
	/**
		Name of the venue
	**/
	var title : String;
	/**
		Address of the venue
	**/
	var address : String;
	/**
		Optional. Foursquare identifier of the venue
	**/
	@:optional
	var foursquare_id : String;
}

/**
	This object represent a user's profile pictures.
**/
typedef UserProfilePhotos = {
	/**
		Total number of profile pictures the target user has
	**/
	var total_count : Int;
	/**
		Requested profile pictures (in up to 4 sizes each)
	**/
	var photos : Array<Array<PhotoSize>>;
}

/**
	This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.
	
	Maximum file size to download is 20 MB
**/
typedef File = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Optional. File size, if known
	**/
	@:optional
	var file_size : Int;
	/**
		Optional. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
	**/
	@:optional
	var file_path : String;
}

/**
	This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).
**/
typedef ReplyKeyboardMarkup = {
	/**
		Array of button rows, each represented by an Array of KeyboardButton objects
	**/
	var keyboard : Array<Array<KeyboardButton>>;
	/**
		Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to false, in which case the custom keyboard is always of the same height as the app's standard keyboard.
	**/
	@:optional
	var resize_keyboard : Bool;
	/**
		Optional. Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again. Defaults to false.
	**/
	@:optional
	var one_time_keyboard : Bool;
	/**
		Optional. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user requests to change the bot‘s language, bot replies to the request with a keyboard to select the new language. Other users in the group don’t see the keyboard.
	**/
	@:optional
	var selective : Bool;
}

/**
	This object represents one button of the reply keyboard. For simple text buttons String can be used instead of this object to specify text of the button. Optional fields are mutually exclusive.
	
	Note: request_contact and request_location options will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef KeyboardButton = {
	/**
		Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed
	**/
	var text : String;
	/**
		Optional. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only
	**/
	@:optional
	var request_contact : Bool;
	/**
		Optional. If True, the user's current location will be sent when the button is pressed. Available in private chats only
	**/
	@:optional
	var request_location : Bool;
}

/**
	Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup).
**/
typedef ReplyKeyboardRemove = {
	/**
		Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use one_time_keyboard in ReplyKeyboardMarkup)
	**/
	var remove_keyboard : Bool;
	/**
		Optional. Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet.
	**/
	@:optional
	var selective : Bool;
}

/**
	This object represents an inline keyboard that appears right next to the message it belongs to.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will display unsupported message.
**/
typedef InlineKeyboardMarkup = {
	/**
		Array of button rows, each represented by an Array of InlineKeyboardButton objects
	**/
	var inline_keyboard : Array<Array<InlineKeyboardButton>>;
}

/**
	This object represents one button of an inline keyboard. You must use exactly one of the optional fields.
**/
typedef InlineKeyboardButton = {
	/**
		Label text on the button
	**/
	var text : String;
	/**
		Optional. HTTP url to be opened when button is pressed
	**/
	@:optional
	var url : String;
	/**
		Optional. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
	**/
	@:optional
	var callback_data : String;
	/**
		Optional. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.Note: This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with switch_pm… actions – in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.
	**/
	@:optional
	var switch_inline_query : String;
	/**
		Optional. If set, pressing the button will insert the bot‘s username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot’s username will be inserted.This offers a quick way for the user to open your bot in inline mode in the same chat – good for selecting something from multiple options.
	**/
	@:optional
	var switch_inline_query_current_chat : String;
	/**
		Optional. Description of the game that will be launched when the user presses the button.NOTE: This type of button must always be the first button in the first row.
	**/
	@:optional
	var callback_game : CallbackGame;
	/**
		Optional. Specify True, to send a Pay button.NOTE: This type of button must always be the first button in the first row.
	**/
	@:optional
	var pay : Bool;
}

/**
	This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.
	
	NOTE: After the user presses a callback button, Telegram clients will display a progress bar until you call answerCallbackQuery. It is, therefore, necessary to react by calling answerCallbackQuery even if no notification to the user is needed (e.g., without specifying any of the optional parameters).
**/
typedef CallbackQuery = {
	/**
		Unique identifier for this query
	**/
	var id : String;
	/**
		Sender
	**/
	var from : User;
	/**
		Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old
	**/
	@:optional
	var message : Message;
	/**
		Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
	**/
	@:optional
	var inline_message_id : String;
	/**
		Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
	**/
	var chat_instance : String;
	/**
		Optional. Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.
	**/
	@:optional
	var data : String;
	/**
		Optional. Short name of a Game to be returned, serves as the unique identifier for the game
	**/
	@:optional
	var game_short_name : String;
}

/**
	Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.
	
	Example: A poll bot for groups runs in privacy mode (only receives commands, replies to its messages and mentions). There could be two ways to create a new poll:
	
	The last option is definitely more attractive. And if you use ForceReply in your bot‘s questions, it will receive the user’s answers even if it only receives replies, commands and mentions — without any extra work for the user.
**/
typedef ForceReply = {
	/**
		Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
	**/
	var force_reply : Bool;
	/**
		Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
	**/
	@:optional
	var selective : Bool;
}

/**
	This object represents a chat photo.
**/
typedef ChatPhoto = {
	/**
		Unique file identifier of small (160x160) chat photo. This file_id can be used only for photo download.
	**/
	var small_file_id : String;
	/**
		Unique file identifier of big (640x640) chat photo. This file_id can be used only for photo download.
	**/
	var big_file_id : String;
}

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
		Optional. Restricted and kicked only. Date when restrictions will be lifted for this user, unix time
	**/
	@:optional
	var until_date : Int;
	/**
		Optional. Administrators only. True, if the bot is allowed to edit administrator privileges of that user
	**/
	@:optional
	var can_be_edited : Bool;
	/**
		Optional. Administrators only. True, if the administrator can change the chat title, photo and other settings
	**/
	@:optional
	var can_change_info : Bool;
	/**
		Optional. Administrators only. True, if the administrator can post in the channel, channels only
	**/
	@:optional
	var can_post_messages : Bool;
	/**
		Optional. Administrators only. True, if the administrator can edit messages of other users and can pin messages, channels only
	**/
	@:optional
	var can_edit_messages : Bool;
	/**
		Optional. Administrators only. True, if the administrator can delete messages of other users
	**/
	@:optional
	var can_delete_messages : Bool;
	/**
		Optional. Administrators only. True, if the administrator can invite new users to the chat
	**/
	@:optional
	var can_invite_users : Bool;
	/**
		Optional. Administrators only. True, if the administrator can restrict, ban or unban chat members
	**/
	@:optional
	var can_restrict_members : Bool;
	/**
		Optional. Administrators only. True, if the administrator can pin messages, supergroups only
	**/
	@:optional
	var can_pin_messages : Bool;
	/**
		Optional. Administrators only. True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
	**/
	@:optional
	var can_promote_members : Bool;
	/**
		Optional. Restricted only. True, if the user can send text messages, contacts, locations and venues
	**/
	@:optional
	var can_send_messages : Bool;
	/**
		Optional. Restricted only. True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
	**/
	@:optional
	var can_send_media_messages : Bool;
	/**
		Optional. Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages
	**/
	@:optional
	var can_send_other_messages : Bool;
	/**
		Optional. Restricted only. True, if user may add web page previews to his messages, implies can_send_media_messages
	**/
	@:optional
	var can_add_web_page_previews : Bool;
}

/**
	Contains information about why a request was unsuccessful.
**/
typedef ResponseParameters = {
	/**
		Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
	**/
	@:optional
	var migrate_to_chat_id : Int;
	/**
		Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
	**/
	@:optional
	var retry_after : Int;
}

/**
	This object represents the content of a media message to be sent. It should be one of
**/
typedef InputMedia = {

}

/**
	Represents a photo to be sent.
**/
typedef InputMediaPhoto = {
	/**
		Type of the result, must be photo
	**/
	var type : String;
	/**
		File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass "attach://<file_attach_name>" to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »
	**/
	var media : String;
	/**
		Optional. Caption of the photo to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
}

/**
	Represents a video to be sent.
**/
typedef InputMediaVideo = {
	/**
		Type of the result, must be video
	**/
	var type : String;
	/**
		File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass "attach://<file_attach_name>" to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »
	**/
	var media : String;
	/**
		Optional. Caption of the video to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Video width
	**/
	@:optional
	var width : Int;
	/**
		Optional. Video height
	**/
	@:optional
	var height : Int;
	/**
		Optional. Video duration
	**/
	@:optional
	var duration : Int;
}

/**
	This object represents the contents of a file to be uploaded. Must be posted using multipart/form-data in the usual way that files are uploaded via the browser.
**/
typedef InputFile = {

}

/**
	Parameters object for the `sendMessage` API method.
**/
typedef SendMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Text of the message to be sent
	**/
	var text : String;
	/**
		Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	**/
	@:optional
	var parse_mode : String;
	/**
		Disables link previews for links in this message
	**/
	@:optional
	var disable_web_page_preview : Bool;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `forwardMessage` API method.
**/
typedef ForwardMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
	**/
	var from_chat_id : EitherType<Int, String>;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		Message identifier in the chat specified in from_chat_id
	**/
	var message_id : Int;
}

/**
	Parameters object for the `sendPhoto` API method.
**/
typedef SendPhotoParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a photo from the Internet, or upload a new photo using multipart/form-data. More info on Sending Files »
	**/
	var photo : EitherType<InputFile, String>;
	/**
		Photo caption (may also be used when resending photos by file_id), 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendAudio` API method.
**/
typedef SendAudioParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Audio file to send. Pass a file_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	**/
	var audio : EitherType<InputFile, String>;
	/**
		Audio caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Duration of the audio in seconds
	**/
	@:optional
	var duration : Int;
	/**
		Performer
	**/
	@:optional
	var performer : String;
	/**
		Track name
	**/
	@:optional
	var title : String;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendDocument` API method.
**/
typedef SendDocumentParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		File to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	**/
	var document : EitherType<InputFile, String>;
	/**
		Document caption (may also be used when resending documents by file_id), 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendVideo` API method.
**/
typedef SendVideoParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Video to send. Pass a file_id as String to send a video that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a video from the Internet, or upload a new video using multipart/form-data. More info on Sending Files »
	**/
	var video : EitherType<InputFile, String>;
	/**
		Duration of sent video in seconds
	**/
	@:optional
	var duration : Int;
	/**
		Video width
	**/
	@:optional
	var width : Int;
	/**
		Video height
	**/
	@:optional
	var height : Int;
	/**
		Video caption (may also be used when resending videos by file_id), 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendVoice` API method.
**/
typedef SendVoiceParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Audio file to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	**/
	var voice : EitherType<InputFile, String>;
	/**
		Voice message caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Duration of the voice message in seconds
	**/
	@:optional
	var duration : Int;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendVideoNote` API method.
**/
typedef SendVideoNoteParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Video note to send. Pass a file_id as String to send a video note that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. More info on Sending Files ». Sending video notes by a URL is currently unsupported
	**/
	var video_note : EitherType<InputFile, String>;
	/**
		Duration of sent video in seconds
	**/
	@:optional
	var duration : Int;
	/**
		Video width and height
	**/
	@:optional
	var length : Int;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendMediaGroup` API method.
**/
typedef SendMediaGroupParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		A JSON-serialized array describing photos and videos to be sent, must include 2–10 items
	**/
	var media : Array<InputMedia>;
	/**
		Sends the messages silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the messages are a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
}

/**
	Parameters object for the `sendLocation` API method.
**/
typedef SendLocationParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Latitude of the location
	**/
	var latitude : Float;
	/**
		Longitude of the location
	**/
	var longitude : Float;
	/**
		Period in seconds for which the location will be updated (see Live Locations, should be between 60 and 86400.
	**/
	@:optional
	var live_period : Int;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `editMessageLiveLocation` API method.
**/
typedef EditMessageLiveLocationParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<Int, String>;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
	/**
		Latitude of new location
	**/
	var latitude : Float;
	/**
		Longitude of new location
	**/
	var longitude : Float;
	/**
		A JSON-serialized object for a new inline keyboard.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Parameters object for the `stopMessageLiveLocation` API method.
**/
typedef StopMessageLiveLocationParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<Int, String>;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
	/**
		A JSON-serialized object for a new inline keyboard.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Parameters object for the `sendVenue` API method.
**/
typedef SendVenueParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Latitude of the venue
	**/
	var latitude : Float;
	/**
		Longitude of the venue
	**/
	var longitude : Float;
	/**
		Name of the venue
	**/
	var title : String;
	/**
		Address of the venue
	**/
	var address : String;
	/**
		Foursquare identifier of the venue
	**/
	@:optional
	var foursquare_id : String;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendContact` API method.
**/
typedef SendContactParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
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
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `sendChatAction` API method.
**/
typedef SendChatActionParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_audio or upload_audio for audio files, upload_document for general files, find_location for location data, record_video_note or upload_video_note for video notes.
	**/
	var action : String;
}

/**
	Parameters object for the `getUserProfilePhotos` API method.
**/
typedef GetUserProfilePhotosParams = {
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
	/**
		Sequential number of the first photo to be returned. By default, all photos are returned.
	**/
	@:optional
	var offset : Int;
	/**
		Limits the number of photos to be retrieved. Values between 1—100 are accepted. Defaults to 100.
	**/
	@:optional
	var limit : Int;
}

/**
	Parameters object for the `getFile` API method.
**/
typedef GetFileParams = {
	/**
		File identifier to get info about
	**/
	var file_id : String;
}

/**
	Parameters object for the `kickChatMember` API method.
**/
typedef KickChatMemberParams = {
	/**
		Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
	/**
		Date when the user will be unbanned, unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever
	**/
	@:optional
	var until_date : Int;
}

/**
	Parameters object for the `unbanChatMember` API method.
**/
typedef UnbanChatMemberParams = {
	/**
		Unique identifier for the target group or username of the target supergroup or channel (in the format @username)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
}

/**
	Parameters object for the `restrictChatMember` API method.
**/
typedef RestrictChatMemberParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
	/**
		Date when restrictions will be lifted for the user, unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever
	**/
	@:optional
	var until_date : Int;
	/**
		Pass True, if the user can send text messages, contacts, locations and venues
	**/
	@:optional
	var can_send_messages : Bool;
	/**
		Pass True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
	**/
	@:optional
	var can_send_media_messages : Bool;
	/**
		Pass True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages
	**/
	@:optional
	var can_send_other_messages : Bool;
	/**
		Pass True, if the user may add web page previews to their messages, implies can_send_media_messages
	**/
	@:optional
	var can_add_web_page_previews : Bool;
}

/**
	Parameters object for the `promoteChatMember` API method.
**/
typedef PromoteChatMemberParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
	/**
		Pass True, if the administrator can change chat title, photo and other settings
	**/
	@:optional
	var can_change_info : Bool;
	/**
		Pass True, if the administrator can create channel posts, channels only
	**/
	@:optional
	var can_post_messages : Bool;
	/**
		Pass True, if the administrator can edit messages of other users and can pin messages, channels only
	**/
	@:optional
	var can_edit_messages : Bool;
	/**
		Pass True, if the administrator can delete messages of other users
	**/
	@:optional
	var can_delete_messages : Bool;
	/**
		Pass True, if the administrator can invite new users to the chat
	**/
	@:optional
	var can_invite_users : Bool;
	/**
		Pass True, if the administrator can restrict, ban or unban chat members
	**/
	@:optional
	var can_restrict_members : Bool;
	/**
		Pass True, if the administrator can pin messages, supergroups only
	**/
	@:optional
	var can_pin_messages : Bool;
	/**
		Pass True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by him)
	**/
	@:optional
	var can_promote_members : Bool;
}

/**
	Parameters object for the `exportChatInviteLink` API method.
**/
typedef ExportChatInviteLinkParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `setChatPhoto` API method.
**/
typedef SetChatPhotoParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		New chat photo, uploaded using multipart/form-data
	**/
	var photo : InputFile;
}

/**
	Parameters object for the `deleteChatPhoto` API method.
**/
typedef DeleteChatPhotoParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `setChatTitle` API method.
**/
typedef SetChatTitleParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		New chat title, 1-255 characters
	**/
	var title : String;
}

/**
	Parameters object for the `setChatDescription` API method.
**/
typedef SetChatDescriptionParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		New chat description, 0-255 characters
	**/
	@:optional
	var description : String;
}

/**
	Parameters object for the `pinChatMessage` API method.
**/
typedef PinChatMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Identifier of a message to pin
	**/
	var message_id : Int;
	/**
		Pass True, if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels.
	**/
	@:optional
	var disable_notification : Bool;
}

/**
	Parameters object for the `unpinChatMessage` API method.
**/
typedef UnpinChatMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `leaveChat` API method.
**/
typedef LeaveChatParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `getChat` API method.
**/
typedef GetChatParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `getChatAdministrators` API method.
**/
typedef GetChatAdministratorsParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `getChatMembersCount` API method.
**/
typedef GetChatMembersCountParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `getChatMember` API method.
**/
typedef GetChatMemberParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
}

/**
	Parameters object for the `setChatStickerSet` API method.
**/
typedef SetChatStickerSetParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Name of the sticker set to be set as the group sticker set
	**/
	var sticker_set_name : String;
}

/**
	Parameters object for the `deleteChatStickerSet` API method.
**/
typedef DeleteChatStickerSetParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
	**/
	var chat_id : EitherType<Int, String>;
}

/**
	Parameters object for the `answerCallbackQuery` API method.
**/
typedef AnswerCallbackQueryParams = {
	/**
		Unique identifier for the query to be answered
	**/
	var callback_query_id : String;
	/**
		Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
	**/
	@:optional
	var text : String;
	/**
		If true, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
	**/
	@:optional
	var show_alert : Bool;
	/**
		URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @Botfather, specify the URL that opens your game – note that this will only work if the query comes from a callback_game button.Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
	**/
	@:optional
	var url : String;
	/**
		The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
	**/
	@:optional
	var cache_time : Int;
}

/**
	Parameters object for the `editMessageText` API method.
**/
typedef EditMessageTextParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<Int, String>;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
	/**
		New text of the message
	**/
	var text : String;
	/**
		Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	**/
	@:optional
	var parse_mode : String;
	/**
		Disables link previews for links in this message
	**/
	@:optional
	var disable_web_page_preview : Bool;
	/**
		A JSON-serialized object for an inline keyboard.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Parameters object for the `editMessageCaption` API method.
**/
typedef EditMessageCaptionParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<Int, String>;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
	/**
		New caption of the message
	**/
	@:optional
	var caption : String;
	/**
		A JSON-serialized object for an inline keyboard.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Parameters object for the `editMessageReplyMarkup` API method.
**/
typedef EditMessageReplyMarkupParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<Int, String>;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
	/**
		A JSON-serialized object for an inline keyboard.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Parameters object for the `deleteMessage` API method.
**/
typedef DeleteMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Identifier of the message to delete
	**/
	var message_id : Int;
}

/**
	This object represents a sticker.
**/
typedef Sticker = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Sticker width
	**/
	var width : Int;
	/**
		Sticker height
	**/
	var height : Int;
	/**
		Optional. Sticker thumbnail in the .webp or .jpg format
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Optional. Emoji associated with the sticker
	**/
	@:optional
	var emoji : String;
	/**
		Optional. Name of the sticker set to which the sticker belongs
	**/
	@:optional
	var set_name : String;
	/**
		Optional. For mask stickers, the position where the mask should be placed
	**/
	@:optional
	var mask_position : MaskPosition;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	This object represents a sticker set.
**/
typedef StickerSet = {
	/**
		Sticker set name
	**/
	var name : String;
	/**
		Sticker set title
	**/
	var title : String;
	/**
		True, if the sticker set contains masks
	**/
	var contains_masks : Bool;
	/**
		List of all set stickers
	**/
	var stickers : Array<Sticker>;
}

/**
	This object describes the position on faces where a mask should be placed by default.
**/
typedef MaskPosition = {
	/**
		The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
	**/
	var point : String;
	/**
		Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
	**/
	var x_shift : Float;
	/**
		Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
	**/
	var y_shift : Float;
	/**
		Mask scaling coefficient. For example, 2.0 means double size.
	**/
	var scale : Float;
}

/**
	Parameters object for the `sendSticker` API method.
**/
typedef SendStickerParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<Int, String>;
	/**
		Sticker to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .webp file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	**/
	var sticker : EitherType<InputFile, String>;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<InlineKeyboardMarkup, EitherType<ReplyKeyboardMarkup, EitherType<ReplyKeyboardRemove, ForceReply>>>;
}

/**
	Parameters object for the `getStickerSet` API method.
**/
typedef GetStickerSetParams = {
	/**
		Name of the sticker set
	**/
	var name : String;
}

/**
	Parameters object for the `uploadStickerFile` API method.
**/
typedef UploadStickerFileParams = {
	/**
		User identifier of sticker file owner
	**/
	var user_id : Int;
	/**
		Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. More info on Sending Files »
	**/
	var png_sticker : InputFile;
}

/**
	Parameters object for the `createNewStickerSet` API method.
**/
typedef CreateNewStickerSetParams = {
	/**
		User identifier of created sticker set owner
	**/
	var user_id : Int;
	/**
		Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only english letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in “_by_<bot username>”. <bot_username> is case insensitive. 1-64 characters.
	**/
	var name : String;
	/**
		Sticker set title, 1-64 characters
	**/
	var title : String;
	/**
		Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	**/
	var png_sticker : EitherType<InputFile, String>;
	/**
		One or more emoji corresponding to the sticker
	**/
	var emojis : String;
	/**
		Pass True, if a set of mask stickers should be created
	**/
	@:optional
	var contains_masks : Bool;
	/**
		A JSON-serialized object for position where the mask should be placed on faces
	**/
	@:optional
	var mask_position : MaskPosition;
}

/**
	Parameters object for the `addStickerToSet` API method.
**/
typedef AddStickerToSetParams = {
	/**
		User identifier of sticker set owner
	**/
	var user_id : Int;
	/**
		Sticker set name
	**/
	var name : String;
	/**
		Png image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More info on Sending Files »
	**/
	var png_sticker : EitherType<InputFile, String>;
	/**
		One or more emoji corresponding to the sticker
	**/
	var emojis : String;
	/**
		A JSON-serialized object for position where the mask should be placed on faces
	**/
	@:optional
	var mask_position : MaskPosition;
}

/**
	Parameters object for the `setStickerPositionInSet` API method.
**/
typedef SetStickerPositionInSetParams = {
	/**
		File identifier of the sticker
	**/
	var sticker : String;
	/**
		New sticker position in the set, zero-based
	**/
	var position : Int;
}

/**
	Parameters object for the `deleteStickerFromSet` API method.
**/
typedef DeleteStickerFromSetParams = {
	/**
		File identifier of the sticker
	**/
	var sticker : String;
}

/**
	This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.
**/
typedef InlineQuery = {
	/**
		Unique identifier for this query
	**/
	var id : String;
	/**
		Sender
	**/
	var from : User;
	/**
		Optional. Sender location, only for bots that request user location
	**/
	@:optional
	var location : Location;
	/**
		Text of the query (up to 512 characters)
	**/
	var query : String;
	/**
		Offset of the results to be returned, can be controlled by the bot
	**/
	var offset : String;
}

/**
	Parameters object for the `answerInlineQuery` API method.
**/
typedef AnswerInlineQueryParams = {
	/**
		Unique identifier for the answered query
	**/
	var inline_query_id : String;
	/**
		A JSON-serialized array of results for the inline query
	**/
	var results : Array<InlineQueryResult>;
	/**
		The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
	**/
	@:optional
	var cache_time : Int;
	/**
		Pass True, if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query
	**/
	@:optional
	var is_personal : Bool;
	/**
		Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don‘t support pagination. Offset length can’t exceed 64 bytes.
	**/
	@:optional
	var next_offset : String;
	/**
		If passed, clients will display a button with specified text that switches the user to a private chat with the bot and sends the bot a start message with the parameter switch_pm_parameter
	**/
	@:optional
	var switch_pm_text : String;
	/**
		Deep-linking parameter for the /start message sent to the bot when user presses the switch button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed.Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a ‘Connect your YouTube account’ button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an oauth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.
	**/
	@:optional
	var switch_pm_parameter : String;
}

/**
	This object represents one result of an inline query. Telegram clients currently support results of the following 20 types:
**/
typedef InlineQueryResult = {

}

/**
	Represents a link to an article or web page.
**/
typedef InlineQueryResultArticle = {
	/**
		Type of the result, must be article
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Title of the result
	**/
	var title : String;
	/**
		Content of the message to be sent
	**/
	var input_message_content : InputMessageContent;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. URL of the result
	**/
	@:optional
	var url : String;
	/**
		Optional. Pass True, if you don't want the URL to be shown in the message
	**/
	@:optional
	var hide_url : Bool;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Url of the thumbnail for the result
	**/
	@:optional
	var thumb_url : String;
	/**
		Optional. Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Optional. Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}

/**
	Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
**/
typedef InlineQueryResultPhoto = {
	/**
		Type of the result, must be photo
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL of the photo. Photo must be in jpeg format. Photo size must not exceed 5MB
	**/
	var photo_url : String;
	/**
		URL of the thumbnail for the photo
	**/
	var thumb_url : String;
	/**
		Optional. Width of the photo
	**/
	@:optional
	var photo_width : Int;
	/**
		Optional. Height of the photo
	**/
	@:optional
	var photo_height : Int;
	/**
		Optional. Title for the result
	**/
	@:optional
	var title : String;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Caption of the photo to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the photo
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
**/
typedef InlineQueryResultGif = {
	/**
		Type of the result, must be gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the GIF file. File size must not exceed 1MB
	**/
	var gif_url : String;
	/**
		Optional. Width of the GIF
	**/
	@:optional
	var gif_width : Int;
	/**
		Optional. Height of the GIF
	**/
	@:optional
	var gif_height : Int;
	/**
		Optional. Duration of the GIF
	**/
	@:optional
	var gif_duration : Int;
	/**
		URL of the static thumbnail for the result (jpeg or gif)
	**/
	var thumb_url : String;
	/**
		Optional. Title for the result
	**/
	@:optional
	var title : String;
	/**
		Optional. Caption of the GIF file to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the GIF animation
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
**/
typedef InlineQueryResultMpeg4Gif = {
	/**
		Type of the result, must be mpeg4_gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the MP4 file. File size must not exceed 1MB
	**/
	var mpeg4_url : String;
	/**
		Optional. Video width
	**/
	@:optional
	var mpeg4_width : Int;
	/**
		Optional. Video height
	**/
	@:optional
	var mpeg4_height : Int;
	/**
		Optional. Video duration
	**/
	@:optional
	var mpeg4_duration : Int;
	/**
		URL of the static thumbnail (jpeg or gif) for the result
	**/
	var thumb_url : String;
	/**
		Optional. Title for the result
	**/
	@:optional
	var title : String;
	/**
		Optional. Caption of the MPEG-4 file to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the video animation
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
	
	If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube), you must replace its content using input_message_content.
**/
typedef InlineQueryResultVideo = {
	/**
		Type of the result, must be video
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the embedded video player or video file
	**/
	var video_url : String;
	/**
		Mime type of the content of video url, “text/html” or “video/mp4”
	**/
	var mime_type : String;
	/**
		URL of the thumbnail (jpeg only) for the video
	**/
	var thumb_url : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		Optional. Caption of the video to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Video width
	**/
	@:optional
	var video_width : Int;
	/**
		Optional. Video height
	**/
	@:optional
	var video_height : Int;
	/**
		Optional. Video duration in seconds
	**/
	@:optional
	var video_duration : Int;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video).
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to an mp3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultAudio = {
	/**
		Type of the result, must be audio
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the audio file
	**/
	var audio_url : String;
	/**
		Title
	**/
	var title : String;
	/**
		Optional. Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Performer
	**/
	@:optional
	var performer : String;
	/**
		Optional. Audio duration in seconds
	**/
	@:optional
	var audio_duration : Int;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the audio
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a voice recording in an .ogg container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultVoice = {
	/**
		Type of the result, must be voice
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid URL for the voice recording
	**/
	var voice_url : String;
	/**
		Recording title
	**/
	var title : String;
	/**
		Optional. Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Recording duration in seconds
	**/
	@:optional
	var voice_duration : Int;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the voice recording
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultDocument = {
	/**
		Type of the result, must be document
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		Optional. Caption of the document to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		A valid URL for the file
	**/
	var document_url : String;
	/**
		Mime type of the content of the file, either “application/pdf” or “application/zip”
	**/
	var mime_type : String;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the file
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		Optional. URL of the thumbnail (jpeg only) for the file
	**/
	@:optional
	var thumb_url : String;
	/**
		Optional. Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Optional. Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}

/**
	Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultLocation = {
	/**
		Type of the result, must be location
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Location latitude in degrees
	**/
	var latitude : Float;
	/**
		Location longitude in degrees
	**/
	var longitude : Float;
	/**
		Location title
	**/
	var title : String;
	/**
		Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	**/
	@:optional
	var live_period : Int;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the location
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		Optional. Url of the thumbnail for the result
	**/
	@:optional
	var thumb_url : String;
	/**
		Optional. Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Optional. Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}

/**
	Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultVenue = {
	/**
		Type of the result, must be venue
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Latitude of the venue location in degrees
	**/
	var latitude : Float;
	/**
		Longitude of the venue location in degrees
	**/
	var longitude : Float;
	/**
		Title of the venue
	**/
	var title : String;
	/**
		Address of the venue
	**/
	var address : String;
	/**
		Optional. Foursquare identifier of the venue if known
	**/
	@:optional
	var foursquare_id : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the venue
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		Optional. Url of the thumbnail for the result
	**/
	@:optional
	var thumb_url : String;
	/**
		Optional. Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Optional. Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}

/**
	Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultContact = {
	/**
		Type of the result, must be contact
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 Bytes
	**/
	var id : String;
	/**
		Contact's phone number
	**/
	var phone_number : String;
	/**
		Contact's first name
	**/
	var first_name : String;
	/**
		Optional. Contact's last name
	**/
	@:optional
	var last_name : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the contact
	**/
	@:optional
	var input_message_content : InputMessageContent;
	/**
		Optional. Url of the thumbnail for the result
	**/
	@:optional
	var thumb_url : String;
	/**
		Optional. Thumbnail width
	**/
	@:optional
	var thumb_width : Int;
	/**
		Optional. Thumbnail height
	**/
	@:optional
	var thumb_height : Int;
}

/**
	Represents a Game.
	
	Note: This will only work in Telegram versions released after October 1, 2016. Older clients will not display any inline results if a game result is among them.
**/
typedef InlineQueryResultGame = {
	/**
		Type of the result, must be game
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		Short name of the game
	**/
	var game_short_name : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo.
**/
typedef InlineQueryResultCachedPhoto = {
	/**
		Type of the result, must be photo
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier of the photo
	**/
	var photo_file_id : String;
	/**
		Optional. Title for the result
	**/
	@:optional
	var title : String;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Caption of the photo to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the photo
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation.
**/
typedef InlineQueryResultCachedGif = {
	/**
		Type of the result, must be gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the GIF file
	**/
	var gif_file_id : String;
	/**
		Optional. Title for the result
	**/
	@:optional
	var title : String;
	/**
		Optional. Caption of the GIF file to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the GIF animation
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
**/
typedef InlineQueryResultCachedMpeg4Gif = {
	/**
		Type of the result, must be mpeg4_gif
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the MP4 file
	**/
	var mpeg4_file_id : String;
	/**
		Optional. Title for the result
	**/
	@:optional
	var title : String;
	/**
		Optional. Caption of the MPEG-4 file to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the video animation
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultCachedSticker = {
	/**
		Type of the result, must be sticker
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier of the sticker
	**/
	var sticker_file_id : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the sticker
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultCachedDocument = {
	/**
		Type of the result, must be document
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		A valid file identifier for the file
	**/
	var document_file_id : String;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Caption of the document to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the file
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video.
**/
typedef InlineQueryResultCachedVideo = {
	/**
		Type of the result, must be video
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the video file
	**/
	var video_file_id : String;
	/**
		Title for the result
	**/
	var title : String;
	/**
		Optional. Short description of the result
	**/
	@:optional
	var description : String;
	/**
		Optional. Caption of the video to be sent, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the video
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultCachedVoice = {
	/**
		Type of the result, must be voice
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the voice message
	**/
	var voice_file_id : String;
	/**
		Voice message title
	**/
	var title : String;
	/**
		Optional. Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the voice message
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	Represents a link to an mp3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InlineQueryResultCachedAudio = {
	/**
		Type of the result, must be audio
	**/
	var type : String;
	/**
		Unique identifier for this result, 1-64 bytes
	**/
	var id : String;
	/**
		A valid file identifier for the audio file
	**/
	var audio_file_id : String;
	/**
		Optional. Caption, 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Optional. Inline keyboard attached to the message
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
	/**
		Optional. Content of the message to be sent instead of the audio
	**/
	@:optional
	var input_message_content : InputMessageContent;
}

/**
	This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following 4 types:
**/
typedef InputMessageContent = {

}

/**
	Represents the content of a text message to be sent as the result of an inline query.
**/
typedef InputTextMessageContent = {
	/**
		Text of the message to be sent, 1-4096 characters
	**/
	var message_text : String;
	/**
		Optional. Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
	**/
	@:optional
	var parse_mode : String;
	/**
		Optional. Disables link previews for links in the sent message
	**/
	@:optional
	var disable_web_page_preview : Bool;
}

/**
	Represents the content of a location message to be sent as the result of an inline query.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InputLocationMessageContent = {
	/**
		Latitude of the location in degrees
	**/
	var latitude : Float;
	/**
		Longitude of the location in degrees
	**/
	var longitude : Float;
	/**
		Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
	**/
	@:optional
	var live_period : Int;
}

/**
	Represents the content of a venue message to be sent as the result of an inline query.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
**/
typedef InputVenueMessageContent = {
	/**
		Latitude of the venue in degrees
	**/
	var latitude : Float;
	/**
		Longitude of the venue in degrees
	**/
	var longitude : Float;
	/**
		Name of the venue
	**/
	var title : String;
	/**
		Address of the venue
	**/
	var address : String;
	/**
		Optional. Foursquare identifier of the venue, if known
	**/
	@:optional
	var foursquare_id : String;
}

/**
	Represents the content of a contact message to be sent as the result of an inline query.
	
	Note: This will only work in Telegram versions released after 9 April, 2016. Older clients will ignore them.
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
		Optional. Contact's last name
	**/
	@:optional
	var last_name : String;
}

/**
	Represents a result of an inline query that was chosen by the user and sent to their chat partner.
	
	Note: It is necessary to enable inline feednack via @Botfather in order to receive these objects in updates.
**/
typedef ChosenInlineResult = {
	/**
		The unique identifier for the result that was chosen
	**/
	var result_id : String;
	/**
		The user that chose the result
	**/
	var from : User;
	/**
		Optional. Sender location, only for bots that require user location
	**/
	@:optional
	var location : Location;
	/**
		Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
	**/
	@:optional
	var inline_message_id : String;
	/**
		The query that was used to obtain the result
	**/
	var query : String;
}

/**
	Parameters object for the `sendInvoice` API method.
**/
typedef SendInvoiceParams = {
	/**
		Unique identifier for the target private chat
	**/
	var chat_id : Int;
	/**
		Product name, 1-32 characters
	**/
	var title : String;
	/**
		Product description, 1-255 characters
	**/
	var description : String;
	/**
		Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
	**/
	var payload : String;
	/**
		Payments provider token, obtained via Botfather
	**/
	var provider_token : String;
	/**
		Unique deep-linking parameter that can be used to generate this invoice when used as a start parameter
	**/
	var start_parameter : String;
	/**
		Three-letter ISO 4217 currency code, see more on currencies
	**/
	var currency : String;
	/**
		Price breakdown, a list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
	**/
	var prices : Array<LabeledPrice>;
	/**
		JSON-encoded data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
	**/
	@:optional
	var provider_data : String;
	/**
		URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
	**/
	@:optional
	var photo_url : String;
	/**
		Photo size
	**/
	@:optional
	var photo_size : Int;
	/**
		Photo width
	**/
	@:optional
	var photo_width : Int;
	/**
		Photo height
	**/
	@:optional
	var photo_height : Int;
	/**
		Pass True, if you require the user's full name to complete the order
	**/
	@:optional
	var need_name : Bool;
	/**
		Pass True, if you require the user's phone number to complete the order
	**/
	@:optional
	var need_phone_number : Bool;
	/**
		Pass True, if you require the user's email to complete the order
	**/
	@:optional
	var need_email : Bool;
	/**
		Pass True, if you require the user's shipping address to complete the order
	**/
	@:optional
	var need_shipping_address : Bool;
	/**
		Pass True, if the final price depends on the shipping method
	**/
	@:optional
	var is_flexible : Bool;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	Parameters object for the `answerShippingQuery` API method.
**/
typedef AnswerShippingQueryParams = {
	/**
		Unique identifier for the query to be answered
	**/
	var shipping_query_id : String;
	/**
		Specify True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
	**/
	var ok : Bool;
	/**
		Required if ok is True. A JSON-serialized array of available shipping options.
	**/
	@:optional
	var shipping_options : Array<ShippingOption>;
	/**
		Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. "Sorry, delivery to your desired address is unavailable'). Telegram will display this message to the user.
	**/
	@:optional
	var error_message : String;
}

/**
	Parameters object for the `answerPreCheckoutQuery` API method.
**/
typedef AnswerPreCheckoutQueryParams = {
	/**
		Unique identifier for the query to be answered
	**/
	var pre_checkout_query_id : String;
	/**
		Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
	**/
	var ok : Bool;
	/**
		Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
	**/
	@:optional
	var error_message : String;
}

/**
	This object represents a portion of the price for goods or services.
**/
typedef LabeledPrice = {
	/**
		Portion label
	**/
	var label : String;
	/**
		Price of the product in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	**/
	var amount : Int;
}

/**
	This object contains basic information about an invoice.
**/
typedef Invoice = {
	/**
		Product name
	**/
	var title : String;
	/**
		Product description
	**/
	var description : String;
	/**
		Unique bot deep-linking parameter that can be used to generate this invoice
	**/
	var start_parameter : String;
	/**
		Three-letter ISO 4217 currency code
	**/
	var currency : String;
	/**
		Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	**/
	var total_amount : Int;
}

/**
	This object represents a shipping address.
**/
typedef ShippingAddress = {
	/**
		ISO 3166-1 alpha-2 country code
	**/
	var country_code : String;
	/**
		State, if applicable
	**/
	var state : String;
	/**
		City
	**/
	var city : String;
	/**
		First line for the address
	**/
	var street_line1 : String;
	/**
		Second line for the address
	**/
	var street_line2 : String;
	/**
		Address post code
	**/
	var post_code : String;
}

/**
	This object represents information about an order.
**/
typedef OrderInfo = {
	/**
		Optional. User name
	**/
	@:optional
	var name : String;
	/**
		Optional. User's phone number
	**/
	@:optional
	var phone_number : String;
	/**
		Optional. User email
	**/
	@:optional
	var email : String;
	/**
		Optional. User shipping address
	**/
	@:optional
	var shipping_address : ShippingAddress;
}

/**
	This object represents one shipping option.
**/
typedef ShippingOption = {
	/**
		Shipping option identifier
	**/
	var id : String;
	/**
		Option title
	**/
	var title : String;
	/**
		List of price portions
	**/
	var prices : Array<LabeledPrice>;
}

/**
	This object contains basic information about a successful payment.
**/
typedef SuccessfulPayment = {
	/**
		Three-letter ISO 4217 currency code
	**/
	var currency : String;
	/**
		Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	**/
	var total_amount : Int;
	/**
		Bot specified invoice payload
	**/
	var invoice_payload : String;
	/**
		Optional. Identifier of the shipping option chosen by the user
	**/
	@:optional
	var shipping_option_id : String;
	/**
		Optional. Order info provided by the user
	**/
	@:optional
	var order_info : OrderInfo;
	/**
		Telegram payment identifier
	**/
	var telegram_payment_charge_id : String;
	/**
		Provider payment identifier
	**/
	var provider_payment_charge_id : String;
}

/**
	This object contains information about an incoming shipping query.
**/
typedef ShippingQuery = {
	/**
		Unique query identifier
	**/
	var id : String;
	/**
		User who sent the query
	**/
	var from : User;
	/**
		Bot specified invoice payload
	**/
	var invoice_payload : String;
	/**
		User specified shipping address
	**/
	var shipping_address : ShippingAddress;
}

/**
	This object contains information about an incoming pre-checkout query.
**/
typedef PreCheckoutQuery = {
	/**
		Unique query identifier
	**/
	var id : String;
	/**
		User who sent the query
	**/
	var from : User;
	/**
		Three-letter ISO 4217 currency code
	**/
	var currency : String;
	/**
		Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	**/
	var total_amount : Int;
	/**
		Bot specified invoice payload
	**/
	var invoice_payload : String;
	/**
		Optional. Identifier of the shipping option chosen by the user
	**/
	@:optional
	var shipping_option_id : String;
	/**
		Optional. Order info provided by the user
	**/
	@:optional
	var order_info : OrderInfo;
}

/**
	Parameters object for the `sendGame` API method.
**/
typedef SendGameParams = {
	/**
		Unique identifier for the target chat
	**/
	var chat_id : Int;
	/**
		Short name of the game, serves as the unique identifier for the game. Set up your games via Botfather.
	**/
	var game_short_name : String;
	/**
		Sends the message silently. Users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		A JSON-serialized object for an inline keyboard. If empty, one ‘Play game_title’ button will be shown. If not empty, the first button must launch the game.
	**/
	@:optional
	var reply_markup : InlineKeyboardMarkup;
}

/**
	This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
**/
typedef Game = {
	/**
		Title of the game
	**/
	var title : String;
	/**
		Description of the game
	**/
	var description : String;
	/**
		Photo that will be displayed in the game message in chats.
	**/
	var photo : Array<PhotoSize>;
	/**
		Optional. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
	**/
	@:optional
	var text : String;
	/**
		Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
	**/
	@:optional
	var text_entities : Array<MessageEntity>;
	/**
		Optional. Animation that will be displayed in the game message in chats. Upload via BotFather
	**/
	@:optional
	var animation : Animation;
}

/**
	You can provide an animation for your game so that it looks stylish in chats (check out Lumberjack for an example). This object represents an animation file to be displayed in the message containing a game.
**/
typedef Animation = {
	/**
		Unique file identifier
	**/
	var file_id : String;
	/**
		Optional. Animation thumbnail as defined by sender
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Optional. Original animation filename as defined by sender
	**/
	@:optional
	var file_name : String;
	/**
		Optional. MIME type of the file as defined by sender
	**/
	@:optional
	var mime_type : String;
	/**
		Optional. File size
	**/
	@:optional
	var file_size : Int;
}

/**
	A placeholder, currently holds no information. Use BotFather to set up your game.
**/
typedef CallbackGame = {

}

/**
	Parameters object for the `setGameScore` API method.
**/
typedef SetGameScoreParams = {
	/**
		User identifier
	**/
	var user_id : Int;
	/**
		New score, must be non-negative
	**/
	var score : Int;
	/**
		Pass True, if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
	**/
	@:optional
	var force : Bool;
	/**
		Pass True, if the game message should not be automatically edited to include the current scoreboard
	**/
	@:optional
	var disable_edit_message : Bool;
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat
	**/
	@:optional
	var chat_id : Int;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
}

/**
	Parameters object for the `getGameHighScores` API method.
**/
typedef GetGameHighScoresParams = {
	/**
		Target user id
	**/
	var user_id : Int;
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat
	**/
	@:optional
	var chat_id : Int;
	/**
		Required if inline_message_id is not specified. Identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
}

/**
	This object represents one row of the high scores table for a game.
	
	And that‘s about all we’ve got for now.If you've got any questions, please check out our Bot FAQ »
**/
typedef GameHighScore = {
	/**
		Position in high score table for the game
	**/
	var position : Int;
	/**
		User
	**/
	var user : User;
	/**
		Score
	**/
	var score : Int;
}

class BotApi {
	/**
		Use this method to receive incoming updates using long polling (wiki). An Array of Update objects is returned.
		
		Notes1. This method will not work if an outgoing webhook is set up.2. In order to avoid getting duplicate updates, recalculate offset after each server response.
	**/
	function getUpdates(params:GetUpdatesParams, callback:Array<Update> -> Void):Void { }
	/**
		Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns true.
		
		If you'd like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. https://www.example.com/<token>. Since nobody else knows your bot‘s token, you can be pretty sure it’s us.
		
		Notes1. You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.2. To use a self-signed certificate, you need to upload your public key certificate using certificate parameter. Please upload as InputFile, sending a String will not work.3. Ports currently supported for Webhooks: 443, 80, 88, 8443.
		NEW! If you're having any trouble setting up webhooks, please check out this amazing guide to Webhooks.
	**/
	function setWebhook(params:SetWebhookParams, callback:Bool -> Void):Void { }
	/**
		Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success. Requires no parameters.
	**/
	function deleteWebhook(callback:Bool -> Void):Void { }
	/**
		Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
	**/
	function getWebhookInfo(callback:WebhookInfo -> Void):Void { }
	/**
		A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a User object.
	**/
	function getMe(callback:User -> Void):Void { }
	/**
		Use this method to send text messages. On success, the sent Message is returned.
	**/
	function sendMessage(params:SendMessageParams, callback:Message -> Void):Void { }
	/**
		Use this method to forward messages of any kind. On success, the sent Message is returned.
	**/
	function forwardMessage(params:ForwardMessageParams, callback:Message -> Void):Void { }
	/**
		Use this method to send photos. On success, the sent Message is returned.
	**/
	function sendPhoto(params:SendPhotoParams, callback:Message -> Void):Void { }
	/**
		Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .mp3 format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
		
		For sending voice messages, use the sendVoice method instead.
	**/
	function sendAudio(params:SendAudioParams, callback:Message -> Void):Void { }
	/**
		Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.
	**/
	function sendDocument(params:SendDocumentParams, callback:Message -> Void):Void { }
	/**
		Use this method to send video files, Telegram clients support mp4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future.
	**/
	function sendVideo(params:SendVideoParams, callback:Message -> Void):Void { }
	/**
		Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .ogg file encoded with OPUS (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future.
	**/
	function sendVoice(params:SendVoiceParams, callback:Message -> Void):Void { }
	/**
		As of v.4.0, Telegram clients support rounded square mp4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned.
	**/
	function sendVideoNote(params:SendVideoNoteParams, callback:Message -> Void):Void { }
	/**
		Use this method to send a group of photos or videos as an album. On success, an array of the sent Messages is returned.
	**/
	function sendMediaGroup(params:SendMediaGroupParams, callback:Message -> Void):Void { }
	/**
		Use this method to send point on the map. On success, the sent Message is returned.
	**/
	function sendLocation(params:SendLocationParams, callback:Message -> Void):Void { }
	/**
		Use this method to edit live location messages sent by the bot or via the bot (for inline bots). A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message was sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	function editMessageLiveLocation(params:EditMessageLiveLocationParams, callback:EitherType<Message, Bool> -> Void):Void { }
	/**
		Use this method to stop updating a live location message sent by the bot or via the bot (for inline bots) before live_period expires. On success, if the message was sent by the bot, the sent Message is returned, otherwise True is returned.
	**/
	function stopMessageLiveLocation(params:StopMessageLiveLocationParams, callback:EitherType<Message, Bool> -> Void):Void { }
	/**
		Use this method to send information about a venue. On success, the sent Message is returned.
	**/
	function sendVenue(params:SendVenueParams, callback:Message -> Void):Void { }
	/**
		Use this method to send phone contacts. On success, the sent Message is returned.
	**/
	function sendContact(params:SendContactParams, callback:Message -> Void):Void { }
	/**
		Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success.
		
		Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload_photo. The user will see a “sending photo” status for the bot.
		
		We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.
	**/
	function sendChatAction(params:SendChatActionParams, callback:Bool -> Void):Void { }
	/**
		Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
	**/
	function getUserProfilePhotos(params:GetUserProfilePhotosParams, callback:UserProfilePhotos -> Void):Void { }
	/**
		Use this method to get basic info about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
		
		Note: This function may not preserve the original file name and MIME type. You should save the file's MIME type and name (if available) when the File object is received.
	**/
	function getFile(params:GetFileParams, callback:File -> Void):Void { }
	/**
		Use this method to kick a user from a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
		
		Note: In regular groups (non-supergroups), this method will only work if the ‘All Members Are Admins’ setting is off in the target group. Otherwise members may only be removed by the group's creator or by the member that added them.
	**/
	function kickChatMember(params:KickChatMemberParams, callback:Bool -> Void):Void { }
	/**
		Use this method to unban a previously kicked user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. Returns True on success.
	**/
	function unbanChatMember(params:UnbanChatMemberParams, callback:Bool -> Void):Void { }
	/**
		Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate admin rights. Pass True for all boolean parameters to lift restrictions from a user. Returns True on success.
	**/
	function restrictChatMember(params:RestrictChatMemberParams, callback:Bool -> Void):Void { }
	/**
		Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Pass False for all boolean parameters to demote a user. Returns True on success.
	**/
	function promoteChatMember(params:PromoteChatMemberParams, callback:Bool -> Void):Void { }
	/**
		Use this method to export an invite link to a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns exported invite link as String on success.
	**/
	function exportChatInviteLink(params:ExportChatInviteLinkParams, callback:String -> Void):Void { }
	/**
		Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
		
		Note: In regular groups (non-supergroups), this method will only work if the ‘All Members Are Admins’ setting is off in the target group.
	**/
	function setChatPhoto(params:SetChatPhotoParams, callback:Bool -> Void):Void { }
	/**
		Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
		
		Note: In regular groups (non-supergroups), this method will only work if the ‘All Members Are Admins’ setting is off in the target group.
	**/
	function deleteChatPhoto(params:DeleteChatPhotoParams, callback:Bool -> Void):Void { }
	/**
		Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
		
		Note: In regular groups (non-supergroups), this method will only work if the ‘All Members Are Admins’ setting is off in the target group.
	**/
	function setChatTitle(params:SetChatTitleParams, callback:Bool -> Void):Void { }
	/**
		Use this method to change the description of a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success.
	**/
	function setChatDescription(params:SetChatDescriptionParams, callback:Bool -> Void):Void { }
	/**
		Use this method to pin a message in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success.
	**/
	function pinChatMessage(params:PinChatMessageParams, callback:Bool -> Void):Void { }
	/**
		Use this method to unpin a message in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success.
	**/
	function unpinChatMessage(params:UnpinChatMessageParams, callback:Bool -> Void):Void { }
	/**
		Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
	**/
	function leaveChat(params:LeaveChatParams, callback:Bool -> Void):Void { }
	/**
		Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.
	**/
	function getChat(params:GetChatParams, callback:Chat -> Void):Void { }
	/**
		Use this method to get a list of administrators in a chat. On success, returns an Array of ChatMember objects that contains information about all chat administrators except other bots. If the chat is a group or a supergroup and no administrators were appointed, only the creator will be returned.
	**/
	function getChatAdministrators(params:GetChatAdministratorsParams, callback:Array<ChatMember> -> Void):Void { }
	/**
		Use this method to get the number of members in a chat. Returns Int on success.
	**/
	function getChatMembersCount(params:GetChatMembersCountParams, callback:Int -> Void):Void { }
	/**
		Use this method to get information about a member of a chat. Returns a ChatMember object on success.
	**/
	function getChatMember(params:GetChatMemberParams, callback:ChatMember -> Void):Void { }
	/**
		Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
	**/
	function setChatStickerSet(params:SetChatStickerSetParams, callback:Bool -> Void):Void { }
	/**
		Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
	**/
	function deleteChatStickerSet(params:DeleteChatStickerSetParams, callback:Bool -> Void):Void { }
	/**
		Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
		
		Alternatively, the user can be redirected to the specified Game URL. For this option to work, you must first create a game for your bot via @Botfather and accept the terms. Otherwise, you may use links like t.me/your_bot?start=XXXX that open your bot with a parameter.
	**/
	function answerCallbackQuery(params:AnswerCallbackQueryParams, callback:Bool -> Void):Void { }
	/**
		Use this method to edit text and game messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	function editMessageText(params:EditMessageTextParams, callback:EitherType<Message, Bool> -> Void):Void { }
	/**
		Use this method to edit captions of messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	function editMessageCaption(params:EditMessageCaptionParams, callback:EitherType<Message, Bool> -> Void):Void { }
	/**
		Use this method to edit only the reply markup of messages sent by the bot or via the bot (for inline bots).  On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	function editMessageReplyMarkup(params:EditMessageReplyMarkupParams, callback:EitherType<Message, Bool> -> Void):Void { }
	/**
		Use this method to delete a message, including service messages, with the following limitations:- A message can only be deleted if it was sent less than 48 hours ago.- Bots can delete outgoing messages in groups and supergroups.- Bots granted can_post_messages permissions can delete outgoing messages in channels.- If the bot is an administrator of a group, it can delete any message there.- If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.Returns True on success.
	**/
	function deleteMessage(params:DeleteMessageParams, callback:Bool -> Void):Void { }
	/**
		Use this method to send .webp stickers. On success, the sent Message is returned.
	**/
	function sendSticker(params:SendStickerParams, callback:Message -> Void):Void { }
	/**
		Use this method to get a sticker set. On success, a StickerSet object is returned.
	**/
	function getStickerSet(params:GetStickerSetParams, callback:StickerSet -> Void):Void { }
	/**
		Use this method to upload a .png file with a sticker for later use in createNewStickerSet and addStickerToSet methods (can be used multiple times). Returns the uploaded File on success.
	**/
	function uploadStickerFile(params:UploadStickerFileParams, callback:File -> Void):Void { }
	/**
		Use this method to create new sticker set owned by a user. The bot will be able to edit the created sticker set. Returns True on success.
	**/
	function createNewStickerSet(params:CreateNewStickerSetParams, callback:Bool -> Void):Void { }
	/**
		Use this method to add a new sticker to a set created by the bot. Returns True on success.
	**/
	function addStickerToSet(params:AddStickerToSetParams, callback:Bool -> Void):Void { }
	/**
		Use this method to move a sticker in a set created by the bot to a specific position . Returns True on success.
	**/
	function setStickerPositionInSet(params:SetStickerPositionInSetParams, callback:Bool -> Void):Void { }
	/**
		Use this method to delete a sticker from a set created by the bot. Returns True on success.
	**/
	function deleteStickerFromSet(params:DeleteStickerFromSetParams, callback:Bool -> Void):Void { }
	/**
		Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed.
	**/
	function answerInlineQuery(params:AnswerInlineQueryParams, callback:Bool -> Void):Void { }
	/**
		Use this method to send invoices. On success, the sent Message is returned.
	**/
	function sendInvoice(params:SendInvoiceParams, callback:Message -> Void):Void { }
	/**
		If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot. Use this method to reply to shipping queries. On success, True is returned.
	**/
	function answerShippingQuery(params:AnswerShippingQueryParams, callback:Bool -> Void):Void { }
	/**
		Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
	**/
	function answerPreCheckoutQuery(params:AnswerPreCheckoutQueryParams, callback:Bool -> Void):Void { }
	/**
		Use this method to send a game. On success, the sent Message is returned.
	**/
	function sendGame(params:SendGameParams, callback:Message -> Void):Void { }
	/**
		Use this method to set the score of the specified user in a game. On success, if the message was sent by the bot, returns the edited Message, otherwise returns True. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.
	**/
	function setGameScore(params:SetGameScoreParams, callback:EitherType<Message, Bool> -> Void):Void { }
	/**
		Use this method to get data for high score tables. Will return the score of the specified user and several of his neighbors in a game. On success, returns an Array of GameHighScore objects.
		
		This method will currently return scores for the target user, plus two of his closest neighbors on each side. Will also return the top three users if the user and his neighbors are not among them. Please note that this behavior is subject to change.
	**/
	function getGameHighScores(params:GetGameHighScoresParams, callback:Array<GameHighScore> -> Void):Void { }
}