import telegram.types.Update;

class Main {
    static function main() {
        var token = Sys.getEnv("BOT_TOKEN");
        if (token == null)
            token = sys.io.File.getContent("bottoken.txt");
        var api = new telegram.Methods(new Connection(token));

        function onUpdate(update:Update) {
            if (update.message != null) {
                api.sendMessage({
                    text: 'Я тут',
                    reply_to_message_id: update.message.message_id,
                    chat_id: update.message.chat.id,
                });
            }
        }
        new PollUpdateListener(api, onUpdate, 1000).start();

        // var server = js.node.Http.createServer(function(req, res) {
        //     req.on("data", function(data) {
        //         trace(data);
        //     });
        //     res.end("hi");
        // });

        // var port = Sys.getEnv("PORT");
        // var port = if (port == null) 80 else Std.parseInt(port);
        // server.listen(port);

        // var listener = new WebhookUpdateListener(api, onUpdate, "https://95.55.124.126:8443/");
        // listener.start(function() {

        // });
    }
}
