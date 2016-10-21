package telegram.bot.types;

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
		Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
	**/
	@:optional
	var text : String;
	/**
		Special entities that appear in text, such as usernames, URLs, bot commands, etc.
	**/
	@:optional
	var text_entities : Array<MessageEntity>;
	/**
		Animation that will be displayed in the game message in chats. Upload via BotFather
	**/
	@:optional
	var animation : Animation;
}