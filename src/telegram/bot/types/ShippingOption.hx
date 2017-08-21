package telegram.bot.types;

/**
	This object represents one shipping option.
**/
typedef ShippingOption = {
	/**
		Shipping option identifier
	**/
	var id : String;
	/**
		Option title
	**/
	var title : String;
	/**
		List of price portions
	**/
	var prices : Array<LabeledPrice>;
}