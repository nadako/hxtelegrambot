package telegram.bot.types;

/**
	This object represents one row of the high scores table for a game.
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