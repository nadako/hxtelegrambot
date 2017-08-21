package telegram.bot.types;

/**
	This object contains information about an incoming pre-checkout query.
**/
typedef PreCheckoutQuery = {
	/**
		Unique query identifier
	**/
	var id : String;
	/**
		User who sent the query
	**/
	var from : User;
	/**
		Three-letter ISO 4217 currency code
	**/
	var currency : String;
	/**
		Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	**/
	var total_amount : Int;
	/**
		Bot specified invoice payload
	**/
	var invoice_payload : String;
	/**
		Identifier of the shipping option chosen by the user
	**/
	@:optional
	var shipping_option_id : String;
	/**
		Order info provided by the user
	**/
	@:optional
	var order_info : OrderInfo;
}