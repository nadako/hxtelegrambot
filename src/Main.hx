import haxe.macro.Expr;
import haxe.macro.Printer;

using StringTools;

@:jsRequire("cheerio")
extern class Cheerio implements ArrayAccess<CheerioNode> {
	static function load(html:String):Cheerio;

	@:selfCall
	@:overload(function(q:CheerioNode):Cheerio {})
	function q(selector:String):Cheerio;

	var length:Int;
	function first():Cheerio;

	function text():String;
	function nextUntil(selector:String, filter:String):Cheerio;
	function next(selector:String):Cheerio;
	function nextAll():Cheerio;
	function find(selector:String):Cheerio;

	function toArray():Array<CheerioNode>;
}

extern class CheerioNode {
	var tagName:String;
	var parentNode:CheerioNode;
	var previousSibling:CheerioNode;
	var nextSibling:CheerioNode;
	var firstChild:CheerioNode;
	var lastChild:CheerioNode;
	var childNodes:Array<CheerioNode>;
	var nodeValue:String;
}

enum Mode {
	Method;
	Object;
}

typedef ObjectRow = {
	var Field:String;
	var Type:String;
	var Description:String;
}

typedef MethodRow = {
	var Parameters:String;
	var Type:String;
	var Required:String;
	var Description:String;
}

class Main {
	static var reMethod = ~/^[a-z]\w+$/;
	static var reObject = ~/^[A-Z]\w+$/;

	static function main() {
		fetch("https://core.telegram.org/bots/api", process);
	}

	static function fetch(url, callback) {
		var req = new haxe.Http(url);
		req.onData = callback;
		req.request();
	}

	static function process(html:String) {
		var c = Cheerio.load(html);

		var methods = new Array<Field>();
		var types = new Array<TypeDefinition>();

		for (h4 in c.q("h4").toArray()) {
			var h4 = c.q(h4);
			var name = h4.text();

			var mode = if (reMethod.match(name)) Method else if (reObject.match(name)) Object else continue;

			var docNodes = h4.nextUntil("h4", "p, blockquote");
			var doc = docNodes.toArray().map(n -> c.q(n).text().trim()).filter(x -> x.length > 0).join("\n\n");

			function getTable() {
				var tableNodes = h4.nextUntil("h4", "table");
				return switch tableNodes.length {
					case 0: null;
					case 1: tableNodes.first();
					case _: throw "more than one table per type";
				}
			}

			function parseTable<T>(table:Cheerio, fields:Array<String>):Array<T> {
				var rows = table.find("tr");
				var headRow = rows.first();
				{
					var headCols = headRow.find("td, th");
					if (headCols.length != fields.length) {
						throw 'Invalid number of columns (expected ${fields.join(", ")}): ${table.text()}';
					}
					for (i in 0...fields.length) {
						var expected = fields[i];
						var actual = c.q(headCols[i]).text();
						if (actual != expected)
							throw 'Unexpected head column $i ($actual != $expected)';
					}
				}

				var result = [];
				var rows = headRow.nextAll();
				for (row in rows.toArray()) {
					var row = c.q(row);
					var cols = row.find("td");
					if (cols.length != fields.length) {
						throw 'Invalid number of columns (expected ${fields.join(", ")}): ${table.text()}';
					}
					var object:Dynamic = {};
					for (i in 0...fields.length) {
						var field = fields[i];
						var actual = c.q(cols[i]).text();
						Reflect.setField(object, field, actual);
					}
					result.push(object);
				}
				return result;
			}

			var ARRAY_OF = "Array of ";
			var OR = " or ";

			function parseType(t:String):ComplexType {
				return switch t {
					case "Integer":
						macro : Int;
					case "Boolean" | "True" /* TODO: true abstract */:
						macro : Bool;
					case "Float number":
						macro : Float;
					case _ if (t.startsWith(ARRAY_OF)):
						var elemType = parseType(t.substring(ARRAY_OF.length));
						macro : Array<$elemType>;
					case _:
						var orIdx = t.indexOf(OR);
						if (orIdx != -1) {
							var t1 = parseType(t.substring(0, orIdx));
							var t2 = parseType(t.substring(orIdx + OR.length));
							macro : EitherType<$t1, $t2>;
						} else {
							TPath({pack: [], name: t});
						}
				}
			}

			function parseMethod() {
				var args = new Array<FunctionArg>();

				var table = getTable();
				if (table != null) {
					var rows:Array<MethodRow> = parseTable(table, ["Parameters", "Type", "Required", "Description"]);
					var paramsName = name.charAt(0).toUpperCase() + name.substring(1) + "Params";
					var paramsFields = new Array<Field>();
					for (row in rows) {
						var optional = switch row.Required {
							case "Yes": false;
							case "Optional": true;
							case other: throw 'Unexpected value for the Required field: $other';
						}
						paramsFields.push({
							pos: null,
							name: row.Parameters,
							doc: row.Description,
							meta: if (optional) [{name: ":optional", pos: null}] else [],
							kind: FVar(parseType(row.Type))
						});
					}
					types.push({
						pos: null,
						pack: [],
						doc: 'Parameters object for the `$name` API method.',
						name: paramsName,
						kind: TDStructure,
						fields: paramsFields,
					});
					args.push({
						name: "params",
						type: TPath({pack: [], name: paramsName})
					});
				}

				methods.push({
					pos: null,
					name: name,
					doc: doc,
					kind: FFun({
						args: args,
						ret: macro : Void,
						expr: macro {}
					})
				});
			}

			function parseObject() {
				var fields = new Array<Field>();
				var table = getTable();
				if (table != null) {
					var rows:Array<ObjectRow> = parseTable(table, ["Field", "Type", "Description"]);
					for (row in rows) {
						var optional = row.Description.startsWith("Optional.");
						fields.push({
							pos: null,
							name: row.Field,
							doc: row.Description,
							meta: if (optional) [{name: ":optional", pos: null}] else [],
							kind: FVar(parseType(row.Type))
						});
					}
				}

				types.push({
					pos: null,
					pack: [],
					name: name,
					doc: doc,
					kind: TDStructure,
					fields: fields,
				});
			}

			switch mode {
				case Method: parseMethod();
				case Object: parseObject();
			}
		}

		types.push({
			pos: null,
			pack: [],
			name: "BotApi",
			kind: TDClass(),
			fields: methods,
		});

		var printer = new Printer();
		var content = [
			"import haxe.extern.EitherType;"
		].concat(types.map(t -> printer.printTypeDefinition(t, false))).join("\n\n");
		sys.io.File.saveContent("Telegram.hx", content);
	}
}
