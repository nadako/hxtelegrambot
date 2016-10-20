class Main {
    static function main() {
        var api = new telegram.Methods(new Connection(sys.io.File.getContent("bottoken.txt")));
        var lastUpdate = -1;
        function update() {
            api.getUpdates({offset: lastUpdate + 1}, function(result) {
                switch result {
                    case Left(error):
                        trace("OMG ERROR: " + error);

                    case Right(updates):
                        for (update in updates) {
                            lastUpdate = update.update_id;
                            if (update.message != null && update.message.text != null) {
                                api.sendMessage({
                                    text: 'Я тут',
                                    reply_to_message_id: update.message.message_id,
                                    chat_id: update.message.chat.id,
                                });
                            }
                        }
                }
                haxe.Timer.delay(update, 1000);
            });
        }
        update();
    }
}
