import haxe.macro.Context;
using StringTools;

class ReturnTypes {
	public static macro function read() {
		var exprs = [];
		var lines = sys.io.File.getContent("return_types.txt").split("\n");
		for (line in lines) {
			line = line.trim();
			if (line.length == 0 || line.charAt(0) == "#")
				continue;
			var parts = line.split("::");
			var name = parts[0];
			var type = switch Context.parseInlineString('(_ : ${parts[1]})', Context.currentPos()) { case macro (_ : $ct): ct; default: throw "assert"; };
			exprs.push(macro m.set($v{name}, $v{type}));
		}
		return macro {
			var m = new Map();
			$b{exprs};
			m;
		}
	}
}