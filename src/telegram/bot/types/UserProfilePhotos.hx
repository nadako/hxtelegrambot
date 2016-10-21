package telegram.bot.types;

/**
	This object represent a user's profile pictures.
**/
typedef UserProfilePhotos = {
	/**
		Total number of profile pictures the target user has
	**/
	var total_count : Int;
	/**
		Requested profile pictures (in up to 4 sizes each)
	**/
	var photos : Array<Array<PhotoSize>>;
}