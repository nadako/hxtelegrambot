package telegram.bot.types;

@:enum
abstract True(Bool) to Bool {
    public static inline var True:True = cast true;
}
