package telegram.bot.types;

/**
	This object represents a sticker set.
**/
typedef StickerSet = {
	/**
		Sticker set name
	**/
	var name : String;
	/**
		Sticker set title
	**/
	var title : String;
	/**
		True, if the sticker set contains masks
	**/
	var contains_masks : Bool;
	/**
		List of all set stickers
	**/
	var stickers : Array<Sticker>;
}