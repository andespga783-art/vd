package com.zyrixen.owner;
import android.app.*;import android.os.*;import android.widget.*;import java.net.*;import java.io.*;import org.json.*;
public class MainActivity extends Activity {
 LinearLayout layout;EditText url,token,notice,limit;CheckBox active,maintenance;TextView info;
 EditText field(String name){EditText e=new EditText(this);e.setHint(name);layout.addView(e);return e;}
 void button(String title,Runnable action){Button b=new Button(this);b.setText(title);layout.addView(b);b.setOnClickListener(v->action.run());}
 void toast(String s){runOnUiThread(()->Toast.makeText(this,s,Toast.LENGTH_LONG).show());}
 JSONObject request(String path,String method,JSONObject data)throws Exception{
 String base=url.getText().toString().trim().replaceAll("/+$","");if(!base.startsWith("https://"))throw new Exception("Gunakan HTTPS");
 HttpURLConnection c=(HttpURLConnection)new URL(base+path).openConnection();try{c.setRequestMethod(method);c.setConnectTimeout(12000);c.setReadTimeout(20000);c.setRequestProperty("Authorization","Bearer "+token.getText().toString().trim());
 if(data!=null){c.setDoOutput(true);c.setRequestProperty("Content-Type","application/json");try(OutputStream out=c.getOutputStream()){out.write(data.toString().getBytes("UTF-8"));}}
 int status=c.getResponseCode();InputStream s=status<400?c.getInputStream():c.getErrorStream();ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buff=new byte[4096];int n;while((n=s.read(buff))!=-1)bytes.write(buff,0,n);String text=bytes.toString("UTF-8");if(status>=400)throw new Exception("HTTP "+status+": "+text);return new JSONObject(text);
 }finally{c.disconnect();}}
 interface Task { void run() throws Exception; }
 void work(Task job){new Thread(()->{try{job.run();}catch(Exception e){toast(e.getMessage());}}).start();}
 public void onCreate(Bundle b){super.onCreate(b);ScrollView sc=new ScrollView(this);layout=new LinearLayout(this);layout.setPadding(24,24,24,24);layout.setOrientation(1);sc.addView(layout);setContentView(sc);TextView title=new TextView(this);title.setText("ZYRIXEN OWNER PANEL");title.setTextSize(23);layout.addView(title);
 url=field("Backend HTTPS");token=field("Owner token");token.setInputType(129);notice=field("Pengumuman");limit=field("Batas karakter");limit.setText("100000");active=new CheckBox(this);active.setText("Deobfuscator aktif");active.setChecked(true);layout.addView(active);maintenance=new CheckBox(this);maintenance.setText("Mode maintenance");layout.addView(maintenance);info=new TextView(this);layout.addView(info);
 button("Lihat statistik",()->work(()->{JSONObject j=request("/admin/stats","GET",null);runOnUiThread(()->info.setText(j.toString(2)));}));
 button("Simpan konfigurasi",()->work(()->{JSONObject body=new JSONObject();body.put("enabled",active.isChecked());body.put("maintenance",maintenance.isChecked());body.put("notice",notice.getText().toString());if(!limit.getText().toString().isEmpty())body.put("max_chars",Integer.parseInt(limit.getText().toString()));JSONObject j=request("/admin/config","PUT",body);runOnUiThread(()->info.setText(j.toString()));toast("Tersimpan");}));
 }
}