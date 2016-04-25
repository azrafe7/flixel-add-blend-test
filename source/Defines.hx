// https://gist.github.com/jcward/fd94f5752c2855e0af9f

import haxe.macro.Expr;
import haxe.macro.Context;

// Note: Context.getDefines() requires Haxe 3.2 or later
class Defines {

  // - - - - - - - - - - - - - - - - - - - - - - - - - -
  macro public static function get_defines():Expr {
    var rtn = "Defines ("+
      (Context.defined("macro")?"macro":"standard")+" pass):\n";
    var defines:Map<String,String> = Context.getDefines();
    for (key in defines.keys()) {
      rtn += "-D "+key+"="+defines.get(key)+"\n";
    }
    trace(rtn); // compile-time trace
    return {expr: EConst(CString(rtn)) , pos : Context.currentPos()};
  };
  private static var __invoke_defines = get_defines();
  // - - - - - - - - - - - - - - - - - - - - - - - - - -

  static function main() {
  }
}