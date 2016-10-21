package telegram.bot;

typedef Response<T> = {
    var ok:Bool;
    var description:String;
    @:optional var result:T;
}

class Connection {
    var token:String;

    public function new(token) {
        this.token = token;
    }

    public function execute<TParams,TResult>(name:String, params:TParams, callback:Result<TResult>->Void) {
        var req = new haxe.Http('https://api.telegram.org/bot$token/$name');
        if (callback != null) {
            req.onData = function(s) {
                var res:Response<Any> =
                    try haxe.Json.parse(s)
                    catch (e:Any) {
                        return callback(Left({message: Std.string(e)}));
                    };
                if (res.ok) {
                    callback(Right(cast res.result));
                } else {
                    callback(Left({message: res.description}));
                }

            }
            req.onError = function(e) {
                callback(Left({message: e}));
            }
        }
        req.setPostData(haxe.Json.stringify(params));
        req.setHeader("Content-Type", "application/json");
        req.request(true);
    }
}
