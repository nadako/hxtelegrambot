import telegram.Methods;
import telegram.types.Update;

class PollUpdateListener {
    var api:Methods;
    var interval:Int;
    var stopped:Bool;
    var lastUpdate:Int;
    var handler:Update->Void;

    public function new(api:Methods, handler:Update->Void, interval:Int) {
        this.api = api;
        this.handler = handler;
        this.interval = interval;
        this.stopped = false;
        this.lastUpdate = -1;
    }

    public inline function start() {
        stopped = false;
        loop();
    }

    public inline function stop() {
        stopped = true;
    }

    function loop() {
        api.getUpdates({offset: lastUpdate + 1}, function(result) {
            if (stopped)
                return;
            switch (result) {
                case Left(error):
                    throw haxe.Json.stringify(error);
                case Right(updates):
                    for (update in updates) {
                        lastUpdate = update.update_id;
                        handler(update);
                    }
            }
            haxe.Timer.delay(loop, interval);
        });
    }
}