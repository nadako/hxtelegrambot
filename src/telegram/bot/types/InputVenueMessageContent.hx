package telegram.bot.types;

/**
	Represents the content of a venue message to be sent as the result of an inline query.
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
		Foursquare identifier of the venue, if known
	**/
	@:optional
	var foursquare_id : String;
}