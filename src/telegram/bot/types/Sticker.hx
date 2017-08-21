package telegram.bot.types;

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
		Sticker thumbnail in the .webp or .jpg format
	**/
	@:optional
	var thumb : PhotoSize;
	/**
		Emoji associated with the sticker
	**/
	@:optional
	var emoji : String;
	/**
		Name of the sticker set to which the sticker belongs
	**/
	@:optional
	var set_name : String;
	/**
		For mask stickers, the position where the mask should be placed
	**/
	@:optional
	var mask_position : MaskPosition;
	/**
		File size
	**/
	@:optional
	var file_size : Int;
}