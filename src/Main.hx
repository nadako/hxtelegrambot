import telegram.types.Update;

class Main {
    static function main() {
        var token = sys.io.File.getContent("bottoken.txt");
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

        var listener = new PollUpdateListener(api, onUpdate, 1000);
        listener.start();
    }
}
