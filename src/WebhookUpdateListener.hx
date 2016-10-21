import telegram.BotApi;
import telegram.types.Update;

class WebhookUpdateListener {
    var api:BotApi;
    var lastUpdate:Int;
    var handler:Update->Void;
    var url:String;

    public function new(api:BotApi, handler:Update->Void, url:String) {
        this.api = api;
        this.handler = handler;
        this.lastUpdate = -1;
        this.url = url;
    }

    public inline function start(cb:Void->Void) {
        api.setWebhook({url: url}, function(result) switch result {
            case Left(error): throw haxe.Json.stringify(error);
            case Right(msg): cb();
        });
    }

    public inline function stop(cb:Void->Void) {
        api.setWebhook({url: ""}, function(result) switch result {
            case Left(error): throw haxe.Json.stringify(error);
            case Right(msg): cb();
        });
    }
}