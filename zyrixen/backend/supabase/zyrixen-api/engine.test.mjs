import assert from "node:assert/strict";
import {decodeLua,detectPatterns} from "./engine.ts";
const cases=[
 ["escapes",'local s="\\72\\101\\x6C\\108\\111"','local s="Hello"',5],
 ["quoted_comment",'-- "\\72"\nlocal a="\\72"','-- "\\72"\nlocal a="H"',1],
 ["long_comment",'--[[ \\72 ]]\nlocal s="\\72"','--[[ \\72 ]]\nlocal s="H"',1],
 ["escaped_backslash",'local s="\\\\72"','local s="\\\\72"',0],
 ["char",'local name=string.char(90,89,88)','local name="ZYX"',1],
 ["char_binary",'return string.char(0,65,10)','return "\\000A\\010"',1],
 ["char_unsafe",'local string={} return string.char(72)','local string={} return string.char(72)',0],
 ["join",'return "Z" .. \'Y\' .. "X"','return "ZYX"',2],
 ["reverse",'return string.reverse("cba")','return "abc"',1],
 ["reverse_shadow",'local string={} return string.reverse("abc")','local string={} return string.reverse("abc")',0],
 ["table_join",'return table.concat({"A","B","C"})','return "ABC"',1],
 ["table_separator",'return table.concat({"A","B","C"},"-")','return "A-B-C"',1],
 ["table_dynamic",'return table.concat({someVariable,"X"})','return table.concat({someVariable,"X"})',0],
 ["table_shadow",'local table={} return table.concat({"A","B"})','local table={} return table.concat({"A","B"})',0],
 ["nested",'return string.reverse("cba") .. table.concat({"D","E"})','return "abcDE"',3],
 ["join_escaped",'return "\\57" .. "9"','return "99"',2],
 ["unrelated",'local data={1,2,3};print(data[1])','local data={1,2,3};print(data[1])',0],
 ["protected",'-- MoonVeil\nloadstring("abc")()','-- MoonVeil\nloadstring("abc")()',0],
 ["large","a".repeat(350001),"a".repeat(350001),0],
 ["large_escape","-- huge\n"+"a".repeat(350000)+'local s="\\72"',"-- huge\n"+"a".repeat(350000)+'local s="H"',1]
];
let failures=0;
for(const [name,src,expected,count] of cases){
 const got=decodeLua(src);
 try{
  assert.equal(got.result,expected,"output mismatch");
  assert.equal(got.transformations,count,"change-count mismatch");
  console.log("PASS",name,JSON.stringify(got.stages));
 }catch(e){failures++;console.error("FAIL",name,e.message,JSON.stringify({got:got.result.slice(0,200),expected:expected.slice(0,200)}));}
}
assert.deepEqual(detectPatterns("Protected by Luraph | MoonVeil | PvM Obfuscator | loadstring()"),["luraph","moonveil","prometheus","dynamic_loader"]);
if(failures)process.exitCode=1;else console.log("PASS ALL",cases.length,"cases");
