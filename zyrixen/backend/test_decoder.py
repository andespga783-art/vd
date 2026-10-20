import unittest
from decoder import readable_lua

class DecoderTests(unittest.TestCase):
 def test_decimal_escape(self):
  out,count=readable_lua('local s="\\72\\101\\108\\108\\111"')
  self.assertEqual(out,'local s="Hello"')
  self.assertEqual(count,5)
 def test_hex_escape(self):
  out,count=readable_lua('print("\\x48\\x69")')
  self.assertEqual(out,'print("Hi")')
  self.assertEqual(count,2)
 def test_passthrough(self):
  data='print("already plain")'
  self.assertEqual(readable_lua(data),(data,0))
 def test_protect_quote(self):
  data='local s="\\34"'
  self.assertEqual(readable_lua(data),(data,0))
if __name__=="__main__":unittest.main()
