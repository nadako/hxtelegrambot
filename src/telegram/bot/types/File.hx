package telegram.bot.types;

/**
	This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.

	Maximum file size to download is 20 MB
**/
typedef File = {
	/**
		Unique identifier for this file
	**/
	var file_id : String;
	/**
		File size, if known
	**/
	@:optional
	var file_size : Int;
	/**
		File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
	**/
	@:optional
	var file_path : String;
}