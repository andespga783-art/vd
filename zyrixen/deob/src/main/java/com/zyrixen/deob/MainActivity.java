package com.zyrixen.deob;
import android.app.*; import android.os.*; import android.content.*; import android.widget.*;
import org.json.*; import java.net.*; import java.io.*;
public class MainActivity extends Activity {
 LinearLayout layout; EditText url,input,output; TextView info;
 EditText field(String hint,int lines){ EditText e=new EditText(this);e.setHint(hint);e.setMinLines(lines);layout.addView(e);return e; }
 void button(String title,Runnable r){Button b=new Button(this);b.setText(title);layout.addView(b);b.setOnClickListener(v->r.run());}
 void toast(String s){runOnUiThread(()->Toast.makeText(this,s,Toast.LENGTH_LONG).show());}
 JSONObject req(String path,String method,JSONObject data)throws Exception{
  String base=url.getText().toString().trim().replaceAll("/+$","");
  if(!base.startsWith("https://"))throw new Exception("Gunakan server HTTPS");
  HttpURLConnection c=(HttpURLConnection)new URL(base+path).openConnection();
  try{c.setRequestMethod(method);c.setConnectTimeout(12000);c.setReadTimeout(20000);
  if(data!=null){c.setDoOutput(true);c.setRequestProperty("Content-Type","application/json");try(OutputStream o=c.getOutputStream()){o.write(data.toString().getBytes("UTF-8"));}}
  int code=c.getResponseCode();InputStream stream=code<400?c.getInputStream():c.getErrorStream();
  ByteArrayOutputStream b=new ByteArrayOutputStream();byte[] buf=new byte[4096];int n;while((n=stream.read(buf))!=-1)b.write(buf,0,n);
  String content=b.toString("UTF-8");if(code>=400)throw new Exception("HTTP "+code+" "+content);return new JSONObject(content);
  }finally{c.disconnect();}
 }
 interface Task { void run() throws Exception; }
 void async(Task r){new Thread(()->{try{r.run();}catch(Exception e){toast(e.getMessage());}}).start();}
 public void onCreate(Bundle b){super.onCreate(b); ScrollView sc=new ScrollView(this);layout=new LinearLayout(this);layout.setPadding(24,24,24,24);layout.setOrientation(1);sc.addView(layout);setContentView(sc);
 TextView title=new TextView(this);title.setText("ZYRIXEN DEOBFUSCATOR");title.setTextSize(23);layout.addView(title);
 url=field("URL backend HTTPS",1); info=new TextView(this);info.setText("Hubungkan backend Zyrixen");layout.addView(info);
 button("Cek status",()->async(()->{JSONObject j=req("/config","GET",null);runOnUiThread(()->info.setText(j.toString()));}));
 input=field("Tempel source Lua",10);output=field("Hasil deobfuscasi",10);
 button("DEOBFUSCATE",()->async(()->{JSONObject j=req("/deobfuscate","POST",new JSONObject().put("source",input.getText().toString()));runOnUiThread(()->output.setText(j.optString("result","")));}));
 button("Salin hasil",()->{((android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("Zyrixen",output.getText()));toast("Disalin");});
 }
}