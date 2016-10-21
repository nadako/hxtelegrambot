import telegram.bot.types.*;
import telegram.bot.*;

class Main {
    static function main() {
        var token = Sys.getEnv("BOT_TOKEN");
        if (token == null)
            token = sys.io.File.getContent("bottoken.txt");
        var api = new BotApi(new Connection(token));

        function onUpdate(update:Update) {
            if (update.message != null) {
                api.sendMessage({
                    text: 'Я тут',
                    reply_to_message_id: update.message.message_id,
                    chat_id: update.message.chat.id,
                });
            }
        }

        new PollUpdateListener(api, onUpdate, 10).start(function() {
            trace('Bot started');
        });
    }
}
