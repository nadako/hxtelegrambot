package telegram.bot.types;

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