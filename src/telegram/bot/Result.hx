package telegram.bot;

typedef Error = {
    message:String
}

typedef Result<T> = haxe.ds.Either<Error,T>
