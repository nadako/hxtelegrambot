package telegram.types;

/**
	This object represents a sticker.
**/
typedef Sticker = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		Sticker width
	**/
	var width : Int;
	/**
		Sticker height
	**/
	var height : Int;
	/**
		Sticker thumbnail in .webp or .jpg format
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Emoji associated with the sticker
	**/
	@:optional
	var emoji : String;
	/**
		File size
	**/
	@:optional
	var file_size : Int;
}