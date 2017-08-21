package telegram.bot.types;

/**
	This object represents information about an order.
**/
typedef OrderInfo = {
	/**
		User name
	**/
	@:optional
	var name : String;
	/**
		User's phone number
	**/
	@:optional
	var phone_number : String;
	/**
		User email
	**/
	@:optional
	var email : String;
	/**
		User shipping address
	**/
	@:optional
	var shipping_address : ShippingAddress;
}