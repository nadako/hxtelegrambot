package telegram.types;

/**
	Represents a result of an inline query that was chosen by the user and sent to their chat partner.
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
		Sender location, only for bots that require user location
	**/
	@:optional
	var location : Location;
	/**
		Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
	**/
	@:optional
	var inline_message_id : String;
	/**
		The query that was used to obtain the result
	**/
	var query : String;
}