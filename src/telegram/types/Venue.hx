package telegram.types;

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
		Foursquare identifier of the venue
	**/
	@:optional
	var foursquare_id : String;
}