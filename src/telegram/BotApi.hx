package telegram;

import haxe.extern.EitherType;
import telegram.types.*;

class BotApi {
	var connection : Connection;
	public function new(connection:Connection) {
		this.connection = connection;
	}
	/**
		Use this method to receive incoming updates using long polling (wiki). An Array of Update objects is returned.
		
		Notes
		1. This method will not work if an outgoing webhook is set up.
		2. In order to avoid getting duplicate updates, recalculate offset after each server response.
	**/
	public inline function getUpdates(params:GetUpdatesParams, ?callback:Result<Array<Update>> -> Void) connection.execute("getUpdates", params, callback);
	/**
		Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts.
		
		If you'd like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. https://www.example.com/<token>. Since nobody else knows your bot‘s token, you can be pretty sure it’s us.
		
		Notes
		1. You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
		2. To use a self-signed certificate, you need to upload your public key certificate using certificate parameter. Please upload as InputFile, sending a String will not work.
		3. Ports currently supported for Webhooks: 443, 80, 88, 8443.
		
		NEW! If you're having any trouble setting up webhooks, please check out this amazing guide to Webhooks.
	**/
	public inline function setWebhook(params:SetWebhookParams, ?callback:Result<Any> -> Void) connection.execute("setWebhook", params, callback);
	/**
		Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
	**/
	public inline function getWebhookInfo(?callback:Result<WebhookInfo> -> Void) connection.execute("getWebhookInfo", { }, callback);
	/**
		A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a User object.
	**/
	public inline function getMe(?callback:Result<User> -> Void) connection.execute("getMe", { }, callback);
	/**
		Use this method to send text messages. On success, the sent Message is returned.
	**/
	public inline function sendMessage(params:SendMessageParams, ?callback:Result<Message> -> Void) connection.execute("sendMessage", params, callback);
	/**
		Use this method to forward messages of any kind. On success, the sent Message is returned.
	**/
	public inline function forwardMessage(params:ForwardMessageParams, ?callback:Result<Message> -> Void) connection.execute("forwardMessage", params, callback);
	/**
		Use this method to send photos. On success, the sent Message is returned.
	**/
	public inline function sendPhoto(params:SendPhotoParams, ?callback:Result<Message> -> Void) connection.execute("sendPhoto", params, callback);
	/**
		Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .mp3 format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
		
		For sending voice messages, use the sendVoice method instead.
	**/
	public inline function sendAudio(params:SendAudioParams, ?callback:Result<Message> -> Void) connection.execute("sendAudio", params, callback);
	/**
		Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.
	**/
	public inline function sendDocument(params:SendDocumentParams, ?callback:Result<Message> -> Void) connection.execute("sendDocument", params, callback);
	/**
		Use this method to send .webp stickers. On success, the sent Message is returned.
	**/
	public inline function sendSticker(params:SendStickerParams, ?callback:Result<Message> -> Void) connection.execute("sendSticker", params, callback);
	/**
		Use this method to send video files, Telegram clients support mp4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future.
	**/
	public inline function sendVideo(params:SendVideoParams, ?callback:Result<Message> -> Void) connection.execute("sendVideo", params, callback);
	/**
		Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .ogg file encoded with OPUS (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future.
	**/
	public inline function sendVoice(params:SendVoiceParams, ?callback:Result<Message> -> Void) connection.execute("sendVoice", params, callback);
	/**
		Use this method to send point on the map. On success, the sent Message is returned.
	**/
	public inline function sendLocation(params:SendLocationParams, ?callback:Result<Message> -> Void) connection.execute("sendLocation", params, callback);
	/**
		Use this method to send information about a venue. On success, the sent Message is returned.
	**/
	public inline function sendVenue(params:SendVenueParams, ?callback:Result<Message> -> Void) connection.execute("sendVenue", params, callback);
	/**
		Use this method to send phone contacts. On success, the sent Message is returned.
	**/
	public inline function sendContact(params:SendContactParams, ?callback:Result<Message> -> Void) connection.execute("sendContact", params, callback);
	/**
		Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status).
		
		Example: The ImageBot needs some time to process a request and upload the image. Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use sendChatAction with action = upload_photo. The user will see a “sending photo” status for the bot.
		We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.
	**/
	public inline function sendChatAction(params:SendChatActionParams, ?callback:Result<Any> -> Void) connection.execute("sendChatAction", params, callback);
	/**
		Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object.
	**/
	public inline function getUserProfilePhotos(params:GetUserProfilePhotosParams, ?callback:Result<UserProfilePhotos> -> Void) connection.execute("getUserProfilePhotos", params, callback);
	/**
		Use this method to get basic info about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
		
		Note: This function may not preserve the original file name. The MIME type of the file and its name (if available) should be saved when the File object is received.
	**/
	public inline function getFile(params:GetFileParams, ?callback:Result<File> -> Void) connection.execute("getFile", params, callback);
	/**
		Use this method to kick a user from a group or a supergroup. In the case of supergroups, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the group for this to work. Returns True on success.
		
		Note: This will method only work if the ‘All Members Are Admins’ setting is off in the target group. Otherwise members may only be removed by the group's creator or by the member that added them.
	**/
	public inline function kickChatMember(params:KickChatMemberParams, ?callback:Result<True> -> Void) connection.execute("kickChatMember", params, callback);
	/**
		Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
	**/
	public inline function leaveChat(params:LeaveChatParams, ?callback:Result<True> -> Void) connection.execute("leaveChat", params, callback);
	/**
		Use this method to unban a previously kicked user in a supergroup. The user will not return to the group automatically, but will be able to join via link, etc. The bot must be an administrator in the group for this to work. Returns True on success.
	**/
	public inline function unbanChatMember(params:UnbanChatMemberParams, ?callback:Result<True> -> Void) connection.execute("unbanChatMember", params, callback);
	/**
		Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.
	**/
	public inline function getChat(params:GetChatParams, ?callback:Result<Chat> -> Void) connection.execute("getChat", params, callback);
	/**
		Use this method to get a list of administrators in a chat. On success, returns an Array of ChatMember objects that contains information about all chat administrators except other bots. If the chat is a group or a supergroup and no administrators were appointed, only the creator will be returned.
	**/
	public inline function getChatAdministrators(params:GetChatAdministratorsParams, ?callback:Result<Array<ChatMember>> -> Void) connection.execute("getChatAdministrators", params, callback);
	/**
		Use this method to get the number of members in a chat. Returns Int on success.
	**/
	public inline function getChatMembersCount(params:GetChatMembersCountParams, ?callback:Result<Int> -> Void) connection.execute("getChatMembersCount", params, callback);
	/**
		Use this method to get information about a member of a chat. Returns a ChatMember object on success.
	**/
	public inline function getChatMember(params:GetChatMemberParams, ?callback:Result<ChatMember> -> Void) connection.execute("getChatMember", params, callback);
	/**
		Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
		
		Alternatively, the user can be redirected to the specified Game URL. For this option to work, you must first create a game for your bot via BotFather and accept the terms. Otherwise, you may use links like telegram.me/your_bot?start=XXXX that open your bot with a parameter.
		
		Otherwise, you may use links like telegram.me/your_bot?start=XXXX that open your bot with a parameter.
	**/
	public inline function answerCallbackQuery(params:AnswerCallbackQueryParams, ?callback:Result<True> -> Void) connection.execute("answerCallbackQuery", params, callback);
	/**
		Use this method to edit text and game messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	public inline function editMessageText(params:EditMessageTextParams, ?callback:Result<EitherType<Message, True>> -> Void) connection.execute("editMessageText", params, callback);
	/**
		Use this method to edit captions of messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	public inline function editMessageCaption(params:EditMessageCaptionParams, ?callback:Result<EitherType<Message, True>> -> Void) connection.execute("editMessageCaption", params, callback);
	/**
		Use this method to edit only the reply markup of messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.
	**/
	public inline function editMessageReplyMarkup(params:EditMessageReplyMarkupParams, ?callback:Result<EitherType<Message, True>> -> Void) connection.execute("editMessageReplyMarkup", params, callback);
	/**
		Use this method to send answers to an inline query. On success, True is returned.
		No more than 50 results per query are allowed.
		
		
		Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a ‘Connect your YouTube account’ button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an oauth link. Once done, the bot can offer a switch_inline button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.
	**/
	public inline function answerInlineQuery(params:AnswerInlineQueryParams, ?callback:Result<True> -> Void) connection.execute("answerInlineQuery", params, callback);
	/**
		Use this method to send a game. On success, the sent Message is returned.
	**/
	public inline function sendGame(params:SendGameParams, ?callback:Result<Message> -> Void) connection.execute("sendGame", params, callback);
	/**
		Use this method to set the score of the specified user in a game. On success, if the message was sent by the bot, returns the edited Message, otherwise returns True. Returns an error, if the new score is not greater than the user's current score in the chat.
	**/
	public inline function setGameScore(params:SetGameScoreParams, ?callback:Result<EitherType<Message, True>> -> Void) connection.execute("setGameScore", params, callback);
	/**
		Use this method to get data for high score tables. Will return the score of the specified user and several of his neighbors in a game. On success, returns an Array of GameHighScore objects.
		
		This method will currently return scores for the target user, plus two of his closest neighbors on each side. Will also return the top three users if the user and his neighbors are not among them. Please note that this behavior is subject to change.
	**/
	public inline function getGameHighScores(params:GetGameHighScoresParams, ?callback:Result<Array<GameHighScore>> -> Void) connection.execute("getGameHighScores", params, callback);
}

/**
	Parameters for the `getUpdates` method.
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
}

/**
	Parameters for the `setWebhook` method.
**/
typedef SetWebhookParams = {
	/**
		HTTPS url to send updates to. Use an empty string to remove webhook integration
	**/
	@:optional
	var url : String;
	/**
		Upload your public key certificate so that the root certificate in use can be checked. See our self-signed guide for details.
	**/
	@:optional
	var certificate : InputFile;
}



/**
	Parameters for the `sendMessage` method.
**/
typedef SendMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
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
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `forwardMessage` method.
**/
typedef ForwardMessageParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
	**/
	var from_chat_id : EitherType<String, Int>;
	/**
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		Unique message identifier
	**/
	var message_id : Int;
}

/**
	Parameters for the `sendPhoto` method.
**/
typedef SendPhotoParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a photo from the Internet, or upload a new photo using multipart/form-data.
	**/
	var photo : EitherType<String, InputFile>;
	/**
		Photo caption (may also be used when resending photos by file_id), 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendAudio` method.
**/
typedef SendAudioParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Audio file to send. Pass a file_id as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data.
	**/
	var audio : EitherType<String, InputFile>;
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
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendDocument` method.
**/
typedef SendDocumentParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		File to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data.
	**/
	var document : EitherType<String, InputFile>;
	/**
		Document caption (may also be used when resending documents by file_id), 0-200 characters
	**/
	@:optional
	var caption : String;
	/**
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendSticker` method.
**/
typedef SendStickerParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Sticker to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .webp file from the Internet, or upload a new one using multipart/form-data.
	**/
	var sticker : EitherType<String, InputFile>;
	/**
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendVideo` method.
**/
typedef SendVideoParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Video to send. Pass a file_id as String to send a video that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a video from the Internet, or upload a new video using multipart/form-data.
	**/
	var video : EitherType<String, InputFile>;
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
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendVoice` method.
**/
typedef SendVoiceParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Audio file to send. Pass a file_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data.
	**/
	var voice : EitherType<String, InputFile>;
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
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendLocation` method.
**/
typedef SendLocationParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Latitude of location
	**/
	var latitude : Float;
	/**
		Longitude of location
	**/
	var longitude : Float;
	/**
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendVenue` method.
**/
typedef SendVenueParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
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
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide reply keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendContact` method.
**/
typedef SendContactParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
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
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
	**/
	@:optional
	var disable_notification : Bool;
	/**
		If the message is a reply, ID of the original message
	**/
	@:optional
	var reply_to_message_id : Int;
	/**
		Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
	**/
	@:optional
	var reply_markup : EitherType<ForceReply, EitherType<ReplyKeyboardHide, EitherType<ReplyKeyboardMarkup, InlineKeyboardMarkup>>>;
}

/**
	Parameters for the `sendChatAction` method.
**/
typedef SendChatActionParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_audio or upload_audio for audio files, upload_document for general files, find_location for location data.
	**/
	var action : String;
}

/**
	Parameters for the `getUserProfilePhotos` method.
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
	Parameters for the `getFile` method.
**/
typedef GetFileParams = {
	/**
		File identifier to get info about
	**/
	var file_id : String;
}

/**
	Parameters for the `kickChatMember` method.
**/
typedef KickChatMemberParams = {
	/**
		Unique identifier for the target group or username of the target supergroup (in the format @supergroupusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
}

/**
	Parameters for the `leaveChat` method.
**/
typedef LeaveChatParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
}

/**
	Parameters for the `unbanChatMember` method.
**/
typedef UnbanChatMemberParams = {
	/**
		Unique identifier for the target group or username of the target supergroup (in the format @supergroupusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
}

/**
	Parameters for the `getChat` method.
**/
typedef GetChatParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
}

/**
	Parameters for the `getChatAdministrators` method.
**/
typedef GetChatAdministratorsParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
}

/**
	Parameters for the `getChatMembersCount` method.
**/
typedef GetChatMembersCountParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
}

/**
	Parameters for the `getChatMember` method.
**/
typedef GetChatMemberParams = {
	/**
		Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Unique identifier of the target user
	**/
	var user_id : Int;
}

/**
	Parameters for the `answerCallbackQuery` method.
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
		URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @Botfather, specify the URL that opens your game – note that this will only work if the query comes from a callback_game button.
	**/
	@:optional
	var url : String;
}

/**
	Parameters for the `editMessageText` method.
**/
typedef EditMessageTextParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<String, Int>;
	/**
		Required if inline_message_id is not specified. Unique identifier of the sent message
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
	Parameters for the `editMessageCaption` method.
**/
typedef EditMessageCaptionParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<String, Int>;
	/**
		Required if inline_message_id is not specified. Unique identifier of the sent message
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
	Parameters for the `editMessageReplyMarkup` method.
**/
typedef EditMessageReplyMarkupParams = {
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<String, Int>;
	/**
		Required if inline_message_id is not specified. Unique identifier of the sent message
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
	Parameters for the `answerInlineQuery` method.
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
		Parameter for the start message sent to the bot when user presses the switch button
	**/
	@:optional
	var switch_pm_parameter : String;
}

/**
	Parameters for the `sendGame` method.
**/
typedef SendGameParams = {
	/**
		Unique identifier for the target chat or username of the target channel (in the format @channelusername)
	**/
	var chat_id : EitherType<String, Int>;
	/**
		Short name of the game, serves as the unique identifier for the game. Set up your games via Botfather.
	**/
	var game_short_name : String;
	/**
		Sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound.
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
	Parameters for the `setGameScore` method.
**/
typedef SetGameScoreParams = {
	/**
		User identifier
	**/
	var user_id : Int;
	/**
		New score, must be positive
	**/
	var score : Int;
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat (or username of the target channel in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<String, Int>;
	/**
		Required if inline_message_id is not specified. Unique identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
	/**
		Pass True, if the game message should be automatically edited to include the current scoreboard
	**/
	@:optional
	var edit_message : Bool;
}

/**
	Parameters for the `getGameHighScores` method.
**/
typedef GetGameHighScoresParams = {
	/**
		Target user id
	**/
	var user_id : Int;
	/**
		Required if inline_message_id is not specified. Unique identifier for the target chat (or username of the target channel in the format @channelusername)
	**/
	@:optional
	var chat_id : EitherType<String, Int>;
	/**
		Required if inline_message_id is not specified. Unique identifier of the sent message
	**/
	@:optional
	var message_id : Int;
	/**
		Required if chat_id and message_id are not specified. Identifier of the inline message
	**/
	@:optional
	var inline_message_id : String;
}
