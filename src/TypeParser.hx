import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Printer;

enum State {
    Start;
    Doc;
    Fields;
}

class TypeParser {
    public static function process() {
        var state = Start;
        var lines = sys.io.File.getContent("types.txt").split("\n");
        var nameRe = ~/^[A-Z]\w*$/;
        var fieldsRe = ~/^Field\tType\tDescription$/;
        var fieldRe = ~/^(\w+)\t(.*)\t((Optional\. )?(.*))$/;
        var typeRe = ~/^(Array of (.*))|(\w+)$/;
        var curName = null;
        var curDoc = [];
        var fields = new Array<Field>();
        var types = new Array<{d:Array<String>, t:TypeDefinition}>();
        var pos = Context.makePosition({min: 0, max: 0, file: ""});
        function addCurType() {
            if (curName != null) {
                types.push({
                    d: curDoc,
                    t: {
                        pos: pos,
                        pack: ["telegram", "types"],
                        name: curName,
                        kind: TDStructure,
                        fields: fields
                    }
                });
                fields = [];
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
                    if (fieldsRe.match(line)) {
                        state = Fields;
                    } else {
                        curDoc.push(StringTools.trim(line));
                    }
                case Fields:
                    if (nameRe.match(line)) {
                        addCurType();
                        state = Doc;
                        curName = nameRe.matched(0);
                    } else if (fieldRe.match(line)) {
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
                            else
                                return convertType(type);
                        }
                        var type = loop(fieldRe.matched(2));
                        var meta = [];
                        if (fieldRe.matched(4) != null)
                            meta.push({name: ":optional", pos: pos});
                        fields.push({
                            pos: pos,
                            name: fieldRe.matched(1),
                            kind: FVar(type),
                            doc: fieldRe.matched(5),
                            meta: meta,
                        });
                    } else {
                        continue;
                    }
            }
        }
        addCurType();

        var p = new Printer();
        for (type in types) {
            var content = [];
            if (type.t.pack.length > 0)
                content.push('package ${type.t.pack.join(".")};\n');
            if (type.d.length > 0) {
                content.push("/**");
                for (line in type.d) {
                    content.push('\t$line');
                }
                if (content[content.length - 1] == "\t")
                    content.pop();
                content.push("**/");
            }
            content.push(p.printTypeDefinition(type.t, false));
            var filePath = 'src/telegram/types/${type.t.name}.hx';
            sys.io.File.saveContent(filePath, content.join("\n"));
        }
    }
}
