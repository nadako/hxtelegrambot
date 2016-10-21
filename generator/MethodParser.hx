import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Printer;

enum MState {
    Start;
    Doc;
    Params;
}

class MethodParser {
    public static function process() {
        var pos = Context.makePosition({min: 0, max: 0, file: ""});
        var state = Start;
        var lines = ~/\r?\n/g.split(sys.io.File.getContent("generator/methods.txt"));
        var returnTypes = new Map();
        function parseCT(s) {
            return switch (Context.parseInlineString('(_:$s)', pos).expr) {
                case EParenthesis({expr: ECheckType(_, t)}): t;
                default: throw false;
            }
        }
        for (line in ~/\r?\n/g.split(sys.io.File.getContent("generator/returnTypes.txt"))) {
            line = StringTools.trim(line);
            if (line.length > 0) {
                var parts = line.split("::");
                var methodName = parts[0];
                var type = parseCT(parts[1]);
                returnTypes[methodName] = type;
            }
        }
        var nameRe = ~/^[a-z]\w*$/;
        var paramsRe = ~/^Parameters\tType\tRequired\tDescription$/;
        var paramRe = ~/^(\w+)\t(.*)\t(Yes|Optional)\t(.*)$/;
        var typeRe = ~/^(Array of (.*))|((.*) or (.*))|(\w+)$/;
        var curName = null;
        var curDoc = [];
        var params = new Array<Field>();
        // var types = new Array<{d:Array<String>, t:TypeDefinition}>();
        var methods = [];
        function addCurType() {
            if (curName != null) {
                methods.push({
                    name: curName,
                    params: params,
                    doc: StringTools.trim(curDoc.join("\n"))
                });
                params = [];
                curDoc = [];
                curName = null;
            }
        }
        for (line in lines) {
            switch (state) {
                case Start:
                    if (nameRe.match(line)) {
                        state = Doc;
                        curName = nameRe.matched(0);
                    } else
                        throw 'type name expected, got "$line"';
                case Doc:
                    if (nameRe.match(line)) {
                        addCurType();
                        state = Doc;
                        curName = nameRe.matched(0);
                    } else if (paramsRe.match(line)) {
                        state = Params;
                    } else {
                        curDoc.push(StringTools.trim(line));
                    }
                case Params:
                    if (nameRe.match(line)) {
                        addCurType();
                        state = Doc;
                        curName = nameRe.matched(0);
                    } else if (paramRe.match(line)) {
                        function convertType(s) {
                            return TPath({pack: [], name: switch (s) {
                                case "Integer": "Int";
                                case "Boolean": "Bool";
                                case "Float number": "Float";
                                case other: other;
                            }});
                        }
                        function loop(type) {
                            if (!typeRe.match(type))
                                throw 'invalid type format: $type';
                            if (typeRe.matched(1) != null)
                                return TPath({pack: [], name: "Array", params: [TPType(loop(typeRe.matched(2)))]});
                            else if (typeRe.matched(3) != null) {
                                var left = typeRe.matched(4);
                                var right = typeRe.matched(5);
                                return TPath({
                                    pack: [],
                                    name: "EitherType",
                                    params: [
                                        TPType(loop(right)),
                                        TPType(loop(left)),
                                    ]
                                });
                            } else {
                                return convertType(type);
                            }
                        }
                        var type = loop(paramRe.matched(2));
                        var meta = [];
                        if (paramRe.matched(3) == "Optional")
                            meta.push({name: ":optional", pos: pos});
                        params.push({
                            pos: pos,
                            name: paramRe.matched(1),
                            kind: FVar(type),
                            doc: paramRe.matched(4),
                            meta: meta,
                        });
                    } else {
                        curDoc.push(line);
                    }
            }
        }
        addCurType();

        var content = [];
        var printer = new Printer();
        var fields = new Array<Field>();
        for (m in methods) {
            var returnType = returnTypes[m.name];
            if (returnType == null)
                throw 'no return type for ${m.name}';
            var args:Array<FunctionArg> = [{name: "callback", type: macro : Result<$returnType>->Void, opt: true}];
            var paramsExpr;
            if (m.params.length > 0) {
                var paramsName = m.name.substr(0, 1).toUpperCase() + m.name.substr(1) + "Params";
                content.push('/**\n\tParameters for the `${m.name}` method.\n**/');
                content.push(printer.printTypeDefinition({
                    pos: pos,
                    pack: ["telegram"],
                    name: paramsName,
                    kind: TDStructure,
                    fields: m.params,
                }, false));
                args.unshift({name: "params", type: TPath({pack: [], name: paramsName})});
                paramsExpr = macro params;
            } else {
                paramsExpr = macro {};
            }
            fields.push({
                pos: pos,
                name: m.name,
                doc: m.doc,
                access: [APublic,AInline],
                kind: FFun({
                    args: args,
                    expr: macro { connection.execute(${{pos: pos, expr: EConst(CString(m.name))}}, $paramsExpr, callback); },
                    ret: null,
                })
            });
            content.push("");
        }

        fields.unshift({
            pos: pos,
            name: "new",
            doc: "",
            access: [APublic],
            kind: FFun({
                args: [{name: "connection", type: macro : Connection}],
                ret: null,
                expr: macro { this.connection = connection; }
            })
        });

        fields.unshift({
            pos: pos,
            name: "connection",
            kind: FVar(macro : Connection)
        });

        content.unshift("");
        content.unshift(printer.printTypeDefinition({
            pos: pos,
            pack: ["telegram"],
            name: "BotApi",
            kind: TDClass(),
            fields: fields,
        }, false));

        content.unshift("import telegram.types.*;\n");
        content.unshift("import haxe.extern.EitherType;");
        content.unshift("package telegram;\n");

        sys.io.File.saveContent("src/telegram/BotApi.hx", content.join("\n"));

        // for (type in types) {
        //     var content = [];
        //     if (type.t.pack.length > 0)
        //         content.push('package ${type.t.pack.join(".")};\n');
        //     if (type.d.length > 0) {
        //         content.push("/**");
        //         for (line in type.d) {
        //             content.push('\t$line');
        //         }
        //         if (content[content.length - 1] == "\t")
        //             content.pop();
        //         content.push("**/");
        //     }
        //     content.push(p.printTypeDefinition(type.t, false));
        //     var filePath = 'src/telegram/types/${type.t.name}.hx';
        //     sys.io.File.saveContent(filePath, content.join("\n"));
        // }
    }
}
