package telegram.types;

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
		For “text_link” only, url that will be opened after user taps on the text
	**/
	@:optional
	var url : String;
	/**
		For “text_mention” only, the mentioned user
	**/
	@:optional
	var user : User;
}