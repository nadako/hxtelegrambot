package telegram.bot.types;

/**
	This object represents the contents of a file to be uploaded. Must be posted using multipart/form-data in the usual way that files are uploaded via the browser.
	
	Sending files
	There are three ways to send files (photos, stickers, audio, media, etc.):
	
	If the file is already stored somewhere on the Telegram servers, you don't need to reupload it: each file object has a file_id field, simply pass this file_id as a parameter instead of uploading. There are no limits for files sent this way.
	Provide Telegram with an HTTP URL for the file to be sent. Telegram will download and send the file. 5 MB max size for photos and 20 MB max for other types of content.
	Post the file using multipart/form-data in the usual way that files are uploaded via the browser. 10 MB max size for photos, 50 MB for other files.
	Note:
	
	It is not possible to change the file type when resending by file_id. I.e. a video can't be sent as a photo, a photo can't be sent as a document, etc.
	It is not possible to resend thumbnails.
	Resending a photo by file_id will send all of its sizes.
	file_id can't be transferred from one bot to another.
**/
typedef InputFile = {

}