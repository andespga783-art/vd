import re

def readable_lua(source):
 """Conservatively decode decimal and hexadecimal Lua string escapes."""
 count=0
 def process(m):
  global count
  raw=m.group(0)
  quote=raw[0]
  inside=raw[1:-1]
  def dec_escape(x):
   global count
   val=int(x.group(1),10) if x.group(1) is not None else int(x.group(2),16)
   if val>255:return x.group(0)
   if val in (10,13,34,39,92) or val<32:return x.group(0)
   count+=1
   return chr(val)
  result=re.sub(r"\\([0-9]{1,3})|\\x([a-fA-F0-9]{2})",dec_escape,inside)
  return quote+result+quote
 result=re.sub(r'("(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\')',process,source)
 return result,count
