package com.zyrixen.owner;

import android.app.Activity;
import android.os.Bundle;
import android.graphics.Typeface;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class MainActivity extends Activity {
  private final String api=BuildConfig.BACKEND_URL.trim().replaceAll("/+$","");
  private String sessionToken="";
  private LinearLayout root, signIn, admin;
  private TextView server, serverDesc, jobs, characters, lastAction;
  private EditText secret, notice, limit;
  private CheckBox enabled, maintenance;
  private Button login, save;
  private volatile boolean busy=false;

  void add(LinearLayout parent,View child,int bottom){parent.addView(child,ZyrixenUi.lp(this,bottom));}
  TextView text(String s,int sp,int color,boolean bold){return ZyrixenUi.text(this,s,sp,color,bold);}
  void toast(String s){runOnUiThread(()->Toast.makeText(this,s,Toast.LENGTH_LONG).show());}
  void status(String message,int color){runOnUiThread(()->{server.setText(message);server.setTextColor(color);});}
  @Override public void onCreate(Bundle state){
    super.onCreate(state);getWindow().setStatusBarColor(ZyrixenUi.BG);getWindow().setNavigationBarColor(ZyrixenUi.BG);
    ScrollView scroll=new ScrollView(this);scroll.setFillViewport(true);scroll.setBackgroundColor(ZyrixenUi.BG);
    root=ZyrixenUi.vertical(this);ZyrixenUi.pad(root,this,20,24,20,30);
    if(android.os.Build.VERSION.SDK_INT>=30){
      root.setOnApplyWindowInsetsListener((v,insets)->{
        android.graphics.Insets bars=insets.getInsets(android.view.WindowInsets.Type.systemBars());
        v.setPadding(ZyrixenUi.dp(this,20),ZyrixenUi.dp(this,24)+bars.top,
            ZyrixenUi.dp(this,20),ZyrixenUi.dp(this,30)+bars.bottom);
        return insets;
      });
    }else{root.setFitsSystemWindows(true);}scroll.addView(root);setContentView(scroll);

    TextView brand=text("◈  Z Y R I X E N",16,ZyrixenUi.CYAN,true);add(root,brand,21);
    add(root,text("Owner Control",29,ZyrixenUi.WHITE,true),7);
    add(root,text("CONTROL CENTER  •  VERSION 0.3",11,ZyrixenUi.MUTED,false),22);

    LinearLayout serverCard=ZyrixenUi.card(this);
    server=text(api.isEmpty()?"●  SERVER BELUM TERHUBUNG":"●  MENGHUBUNGKAN...",13,ZyrixenUi.MUTED,true);
    add(serverCard,server,6);
    serverDesc=text(api.isEmpty()?"Backend otomatis sedang disiapkan. Tidak perlu mengisi alamat server.":"Memeriksa layanan Zyrixen...",12,ZyrixenUi.MUTED,false);
    serverCard.addView(serverDesc);add(root,serverCard,22);

    signIn=ZyrixenUi.card(this);
    add(signIn,text("OWNER ACCESS",16,ZyrixenUi.WHITE,true),7);
    add(signIn,text("Panel ini hanya untuk pemilik Zyrixen. Masukkan token akses Owner untuk masuk.",12,ZyrixenUi.MUTED,false),14);
    secret=ZyrixenUi.edit(this,"Owner access token",1);
    secret.setSingleLine(true);secret.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);
    add(signIn,secret,13);
    login=ZyrixenUi.button(this,"↗  Masuk sebagai Owner",true);signIn.addView(login);
    login.setOnClickListener(v->authenticate());
    add(root,signIn,18);

    admin=ZyrixenUi.vertical(this);
    TextView title=text("OVERVIEW",12,ZyrixenUi.MUTED,true);add(admin,title,10);
    LinearLayout stats=ZyrixenUi.row(this);
    LinearLayout jobsCard=ZyrixenUi.card(this);
    add(jobsCard,text("TOTAL PROSES",11,ZyrixenUi.MUTED,true),9);
    jobs=text("—",28,ZyrixenUi.WHITE,true);jobsCard.addView(jobs);
    stats.addView(jobsCard,ZyrixenUi.weighted(this,9));
    LinearLayout usageCard=ZyrixenUi.card(this);
    add(usageCard,text("KARAKTER",11,ZyrixenUi.MUTED,true),9);
    characters=text("—",28,ZyrixenUi.CYAN,true);usageCard.addView(characters);
    stats.addView(usageCard,new LinearLayout.LayoutParams(0,-2,1));
    add(admin,stats,18);

    LinearLayout settings=ZyrixenUi.card(this);
    add(settings,text("SERVICE CONTROL",16,ZyrixenUi.WHITE,true),8);
    add(settings,text("Perubahan langsung diterapkan setelah disimpan.",12,ZyrixenUi.MUTED,false),17);
    enabled=new CheckBox(this);
    enabled.setText("Deobfuscator Aktif");enabled.setTextColor(ZyrixenUi.WHITE);
    enabled.setButtonTintList(android.content.res.ColorStateList.valueOf(ZyrixenUi.CYAN));enabled.setChecked(true);
    add(settings,enabled,6);
    maintenance=new CheckBox(this);
    maintenance.setText("Mode Maintenance");maintenance.setTextColor(ZyrixenUi.WHITE);
    maintenance.setButtonTintList(android.content.res.ColorStateList.valueOf(ZyrixenUi.ACCENT));
    add(settings,maintenance,19);
    add(settings,text("PENGUMUMAN",11,ZyrixenUi.MUTED,true),9);
    notice=ZyrixenUi.edit(this,"Pengumuman untuk pengguna Zyrixen",3);add(settings,notice,17);
    add(settings,text("BATAS INPUT (KARAKTER)",11,ZyrixenUi.MUTED,true),9);
    limit=ZyrixenUi.edit(this,"100000",1);limit.setSingleLine(true);limit.setInputType(InputType.TYPE_CLASS_NUMBER);
    limit.setText("100000");add(settings,limit,19);
    save=ZyrixenUi.button(this,"✓  Simpan Pengaturan",true);add(settings,save,12);
    save.setOnClickListener(v->saveSettings());
    lastAction=text("Menunggu aktivitas Owner.",12,ZyrixenUi.MUTED,false);settings.addView(lastAction);
    add(admin,settings,14);
    Button reload=ZyrixenUi.button(this,"↻  Refresh Dashboard",false);add(admin,reload,10);
    reload.setOnClickListener(v->refresh());
    Button logout=ZyrixenUi.button(this,"Keluar dari Owner",false);add(admin,logout,17);
    logout.setOnClickListener(v->{sessionToken="";secret.setText("");signIn.setVisibility(View.VISIBLE);admin.setVisibility(View.GONE);});
    TextView foot=text("ZYRIXEN  •  SECURED OWNER PANEL",11,ZyrixenUi.MUTED,true);
    foot.setGravity(Gravity.CENTER);admin.addView(foot);
    add(root,admin,0);admin.setVisibility(View.GONE);
    if(!api.isEmpty())new Thread(()->{
      try{JSONObject c=request("/health","GET",null,false);status(c.optBoolean("ok",false)?"●  SERVER ONLINE":"●  STATUS TIDAK DIKENAL",ZyrixenUi.CYAN);
       runOnUiThread(()->serverDesc.setText("Kontrol Owner tersedia setelah login."));
      }catch(Exception e){status("●  SERVER TIDAK TERJANGKAU",ZyrixenUi.RED);
       runOnUiThread(()->serverDesc.setText("Periksa koneksi internet atau tunggu server aktif."));}
    }).start();
  }
  JSONObject request(String path,String method,JSONObject payload,boolean owner)throws Exception{
    if(!api.startsWith("https://"))throw new Exception("Server Zyrixen belum tersedia");
    HttpURLConnection c=(HttpURLConnection)new URL(api+path).openConnection();
    try{
      c.setConnectTimeout(12000);c.setReadTimeout(20000);c.setRequestMethod(method);
      if(owner)c.setRequestProperty("Authorization","Bearer "+sessionToken);
      if(payload!=null){
        c.setDoOutput(true);c.setRequestProperty("Content-Type","application/json; charset=utf-8");
        try(OutputStream out=c.getOutputStream()){out.write(payload.toString().getBytes(StandardCharsets.UTF_8));}
      }
      int code=c.getResponseCode();
      try(InputStream in=code<400?c.getInputStream():c.getErrorStream()){
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] b=new byte[4096];int n;
        while((n=in.read(b))!=-1){if(bytes.size()+n>200000)throw new Exception("Respons terlalu panjang");bytes.write(b,0,n);}
        String data=bytes.toString("UTF-8");if(code>=400)throw new Exception("HTTP "+code+" — "+(code==401?"akses tidak valid":data));
        return new JSONObject(data);
      }
    }finally{c.disconnect();}
  }
  void authenticate(){
    if(busy)return;
    final String key=secret.getText().toString().trim();
    if(key.isEmpty()){toast("Token Owner harus diisi");return;}
    busy=true;login.setEnabled(false);login.setText("Memverifikasi...");
    new Thread(()->{
      try{
        sessionToken=key;
        JSONObject stats=request("/admin/stats","GET",null,true);
        JSONObject config=request("/admin/config","GET",null,true);
        runOnUiThread(()->{
          render(stats,config);signIn.setVisibility(View.GONE);admin.setVisibility(View.VISIBLE);
          server.setText("●  OWNER TERHUBUNG");server.setTextColor(ZyrixenUi.CYAN);
          serverDesc.setText("Selamat datang di Zyrixen Control Center.");
          secret.setText("");
        });
      }catch(Exception e){sessionToken="";toast("Login gagal: "+e.getMessage());}
      finally{busy=false;runOnUiThread(()->{login.setEnabled(true);login.setText("↗  Masuk sebagai Owner");});}
    }).start();
  }
  void render(JSONObject stats,JSONObject config){
    jobs.setText(String.valueOf(stats.optInt("count",0)));
    characters.setText(String.valueOf(stats.optLong("total_chars",0)));
    enabled.setChecked(config.optInt("enabled",1)!=0);
    maintenance.setChecked(config.optInt("maintenance",0)!=0);
    notice.setText(config.optString("notice",""));
    limit.setText(String.valueOf(config.optInt("max_chars",100000)));
  }
  void refresh(){
    if(busy||sessionToken.isEmpty())return;busy=true;
    new Thread(()->{
      try{
        JSONObject stats=request("/admin/stats","GET",null,true);
        JSONObject config=request("/admin/config","GET",null,true);
        runOnUiThread(()->{render(stats,config);lastAction.setText("Data terbaru berhasil dimuat.");});
      }catch(Exception e){toast("Refresh gagal: "+e.getMessage());}
      finally{busy=false;}
    }).start();
  }
  void saveSettings(){
    if(busy||sessionToken.isEmpty())return;
    final boolean on=enabled.isChecked(),maint=maintenance.isChecked();
    final String ann=notice.getText().toString();
    final int max;
    try{max=Integer.parseInt(limit.getText().toString());if(max<100||max>500000)throw new Exception("Batas 100–500000");}
    catch(Exception e){toast("Batas karakter harus 100–500000");return;}
    busy=true;save.setEnabled(false);save.setText("Menyimpan...");
    new Thread(()->{
      try{
        JSONObject params=new JSONObject().put("enabled",on).put("maintenance",maint).put("notice",ann).put("max_chars",max);
        JSONObject c=request("/admin/config","PUT",params,true);
        runOnUiThread(()->{lastAction.setText("✓  Pengaturan disimpan ke server.");notice.setText(c.optString("notice",ann));});
      }catch(Exception e){toast("Gagal simpan: "+e.getMessage());}
      finally{busy=false;runOnUiThread(()->{save.setEnabled(true);save.setText("✓  Simpan Pengaturan");});}
    }).start();
  }
}
