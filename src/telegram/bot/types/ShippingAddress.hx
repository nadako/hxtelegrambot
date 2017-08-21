package telegram.bot.types;

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