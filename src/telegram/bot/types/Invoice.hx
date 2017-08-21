package telegram.bot.types;

/**
	This object contains basic information about an invoice.
**/
typedef Invoice = {
	/**
		Product name
	**/
	var title : String;
	/**
		Product description
	**/
	var description : String;
	/**
		Unique bot deep-linking parameter that can be used to generate this invoice
	**/
	var start_parameter : String;
	/**
		Three-letter ISO 4217 currency code
	**/
	var currency : String;
	/**
		Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
	**/
	var total_amount : Int;
}