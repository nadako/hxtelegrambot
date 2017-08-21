package telegram.bot.types;

/**
	Contains information about the current status of a webhook.
**/
typedef WebhookInfo = {
	/**
		Webhook URL, may be empty if webhook is not set up
	**/
	var url : String;
	/**
		True, if a custom certificate was provided for webhook certificate checks
	**/
	var has_custom_certificate : Bool;
	/**
		Number of updates awaiting delivery
	**/
	var pending_update_count : Int;
	/**
		Unix time for the most recent error that happened when trying to deliver an update via webhook
	**/
	@:optional
	var last_error_date : Int;
	/**
		Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook
	**/
	@:optional
	var last_error_message : String;
	/**
		Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery
	**/
	@:optional
	var max_connections : Int;
	/**
		A list of update types the bot is subscribed to. Defaults to all update types
	**/
	@:optional
	var allowed_updates : Array<String>;
}