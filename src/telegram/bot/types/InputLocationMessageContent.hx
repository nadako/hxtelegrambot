package telegram.bot.types;

/**
	Represents the content of a location message to be sent as the result of an inline query.
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
}