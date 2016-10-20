package telegram.types;

/**
	This object represents one size of a photo or a file / sticker thumbnail.
**/
typedef PhotoSize = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Photo width
	**/
	var width : Int;
	/**
		Photo height
	**/
	var height : Int;
	/**
		File size
	**/
	@:optional
	var file_size : Int;
}