package com.zyrixen.deob;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.view.View;
import android.view.Gravity;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.text.TextWatcher;
import android.text.Editable;
import android.text.InputFilter;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class MainActivity extends Activity {
  private static final int OPEN_LUA=101, SAVE_LUA=102;
  private final String api=BuildConfig.BACKEND_URL.trim().replaceAll("/+$","");
  private EditText input;
  private TextView output;
  private TextView service, serviceDetail, resultInfo, modeLabel;
  private Button pasteTab, linkTab, fileTab, run;
  private int mode=0;
  private String savedResult="";
  private volatile String sourceBuffer="", fullResult="";
  private boolean bufferedPaste=false, suppressEdit=false;
  private static final int MAX_BYTES=8000000, PREVIEW=12000, CLIPBOARD_SAFE=250000;
  private volatile boolean running=false;

  void notifyUser(String t){runOnUiThread(()->Toast.makeText(this,t,Toast.LENGTH_LONG).show());}
  void put(LinearLayout l,View v,int bottom){l.addView(v,ZyrixenUi.lp(this,bottom));}
  TextView label(String s,int size,int color,boolean bold){return ZyrixenUi.text(this,s,size,color,bold);}
  void modeSelect(int newMode){
    mode=newMode;
    pasteTab.setTextColor(newMode==0?ZyrixenUi.WHITE:ZyrixenUi.MUTED);
    linkTab.setTextColor(newMode==1?ZyrixenUi.WHITE:ZyrixenUi.MUTED);
    fileTab.setTextColor(newMode==2?ZyrixenUi.WHITE:ZyrixenUi.MUTED);
    pasteTab.setBackground(ZyrixenUi.shape(newMode==0?ZyrixenUi.ACCENT:ZyrixenUi.RAISED,13,this));
    linkTab.setBackground(ZyrixenUi.shape(newMode==1?ZyrixenUi.ACCENT:ZyrixenUi.RAISED,13,this));
    fileTab.setBackground(ZyrixenUi.shape(newMode==2?ZyrixenUi.ACCENT:ZyrixenUi.RAISED,13,this));
    input.setVisibility(newMode==2?View.GONE:View.VISIBLE);
    modeLabel.setText(newMode==0?"SOURCE LUA":newMode==1?"RAW HTTPS URL":"FILE LUA");
    if(newMode==0) input.setHint("Tempel kode Lua di sini...\n\nlocal example = \"\\\\72\\\\101...\"");
    if(newMode==1) input.setHint("https://raw.githubusercontent.com/.../script.lua");
    if(newMode==2) chooseFile();
  }
  @Override public void onCreate(Bundle state){
    super.onCreate(state);
    getWindow().setStatusBarColor(ZyrixenUi.BG);getWindow().setNavigationBarColor(ZyrixenUi.BG);
    getWindow().getDecorView().setSystemUiVisibility(0);
    ScrollView sc=new ScrollView(this);sc.setFillViewport(true);sc.setBackgroundColor(ZyrixenUi.BG);
    LinearLayout root=ZyrixenUi.vertical(this);ZyrixenUi.pad(root,this,20,24,20,30);
    if(android.os.Build.VERSION.SDK_INT>=30){
      root.setOnApplyWindowInsetsListener((v,insets)->{
        android.graphics.Insets bars=insets.getInsets(android.view.WindowInsets.Type.systemBars());
        v.setPadding(ZyrixenUi.dp(this,20),ZyrixenUi.dp(this,24)+bars.top,
          ZyrixenUi.dp(this,20),ZyrixenUi.dp(this,30)+bars.bottom);
        return insets;
      });
    }else{root.setFitsSystemWindows(true);}sc.addView(root);setContentView(sc);

    TextView brand=label("◈  Z Y R I X E N",16,ZyrixenUi.CYAN,true);put(root,brand,21);
    TextView hero=label("Deobfuscate.\nUnderstand. Build.",29,ZyrixenUi.WHITE,true);
    hero.setLineSpacing(ZyrixenUi.dp(this,4),1);put(root,hero,8);
    put(root,label("LUA ANALYSIS STUDIO  •  VERSION 0.6",11,ZyrixenUi.MUTED,false),20);

    LinearLayout online=ZyrixenUi.card(this);
    service=label(api.isEmpty()?"●  MODE OFFLINE":"●  MENYAMBUNG KE SERVER",13,api.isEmpty()?ZyrixenUi.CYAN:ZyrixenUi.MUTED,true);
    put(online,service,5);
    serviceDetail=label(api.isEmpty()?"Decoder ringan dapat dipakai tanpa server.":"Status layanan dicek otomatis saat aplikasi dibuka.",12,ZyrixenUi.MUTED,false);
    online.addView(serviceDetail);put(root,online,22);

    put(root,label("WORKSPACE",12,ZyrixenUi.MUTED,true),10);
    LinearLayout selector=ZyrixenUi.row(this);
    selector.setBackground(ZyrixenUi.shape(ZyrixenUi.RAISED,16,this));ZyrixenUi.pad(selector,this,5,5,0,5);
    pasteTab=ZyrixenUi.button(this,"⌘ Paste",false);
    linkTab=ZyrixenUi.button(this,"↗ URL",false);
    fileTab=ZyrixenUi.button(this,"▤ File",false);
    selector.addView(pasteTab,ZyrixenUi.weighted(this,5));selector.addView(linkTab,ZyrixenUi.weighted(this,5));selector.addView(fileTab,ZyrixenUi.weighted(this,5));
    put(root,selector,18);
    pasteTab.setOnClickListener(v->{modeSelect(0);pasteFromClipboard();});
    linkTab.setOnClickListener(v->modeSelect(1));
    fileTab.setOnClickListener(v->modeSelect(2));

    modeLabel=label("SOURCE LUA",11,ZyrixenUi.MUTED,true);put(root,modeLabel,9);
    input=ZyrixenUi.edit(this,"Tempel kode Lua di sini...",9);
    input.setTypeface(Typeface.MONOSPACE);
    input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(120000)});
    input.addTextChangedListener(new TextWatcher(){
      public void beforeTextChanged(CharSequence t,int start,int count,int after){}
      public void onTextChanged(CharSequence t,int start,int before,int count){}
      public void afterTextChanged(Editable e){if(!suppressEdit&&mode==0)bufferedPaste=false;}
    });
    put(root,input,16);

    run=ZyrixenUi.button(this,"✦   PROSES DEOBFUSCATE",true);put(root,run,22);
    run.setOnClickListener(v->process());

    LinearLayout resultCard=ZyrixenUi.card(this);
    LinearLayout head=ZyrixenUi.row(this);
    head.addView(label("HASIL ANALISIS",14,ZyrixenUi.WHITE,true),new LinearLayout.LayoutParams(0,-2,1));
    TextView tag=label("LUA",11,ZyrixenUi.CYAN,true);head.addView(tag);put(resultCard,head,10);
    resultInfo=label("Belum ada hasil. Proses kode Lua untuk memulai.",12,ZyrixenUi.MUTED,false);put(resultCard,resultInfo,12);
    output=label("Hasil kode muncul di sini...",13,ZyrixenUi.MUTED,false);
    output.setTypeface(Typeface.MONOSPACE);output.setTextIsSelectable(true);
    output.setMinHeight(ZyrixenUi.dp(this,180));
    output.setBackground(ZyrixenUi.border(ZyrixenUi.SURFACE,ZyrixenUi.RAISED,this));
    ZyrixenUi.pad(output,this,14,14,14,14);put(resultCard,output,13);
    LinearLayout buttons=ZyrixenUi.row(this);
    Button copy=ZyrixenUi.button(this,"⧉  Copy All",false);
    Button save=ZyrixenUi.button(this,"⇩  Download",false);
    buttons.addView(copy,ZyrixenUi.weighted(this,7));buttons.addView(save,ZyrixenUi.weighted(this,0));resultCard.addView(buttons);
    copy.setOnClickListener(v->{
      String text=fullResult;
      if(text.isEmpty()){notifyUser("Belum ada hasil");return;}
      if(text.length()>CLIPBOARD_SAFE){notifyUser("Hasil besar: gunakan Download untuk menyimpan semuanya tanpa crash");return;}
      try{
        ((ClipboardManager)getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("Zyrixen Lua",text));
        notifyUser("Seluruh hasil tersalin");
      }catch(Exception e){notifyUser("Clipboard tidak cukup besar, gunakan Download");}
    });
    save.setOnClickListener(v->{
      savedResult=fullResult;
      if(savedResult.isEmpty()){notifyUser("Belum ada hasil");return;}
      Intent i=new Intent(Intent.ACTION_CREATE_DOCUMENT);i.addCategory(Intent.CATEGORY_OPENABLE);
      i.setType("text/plain");i.putExtra(Intent.EXTRA_TITLE,"zyrixen_deobsefactor.lua");startActivityForResult(i,SAVE_LUA);
    });
    put(root,resultCard,23);
    TextView footer=label("ZYRIXEN  •  ANALYZE AUTHORIZED LUA ONLY",11,ZyrixenUi.MUTED,true);
    footer.setGravity(Gravity.CENTER);root.addView(footer);
    modeSelect(0);
    checkStatus();
  }

  private void chooseFile(){
    Intent i=new Intent(Intent.ACTION_OPEN_DOCUMENT);i.addCategory(Intent.CATEGORY_OPENABLE);
    i.setType("*/*");startActivityForResult(i,OPEN_LUA);
  }
  @Override protected void onActivityResult(int request,int result,Intent data){
    super.onActivityResult(request,result,data);
    if(result!=RESULT_OK||data==null||data.getData()==null)return;
    Uri uri=data.getData();
    if(request==OPEN_LUA){
      new Thread(()->{
        try(InputStream in=getContentResolver().openInputStream(uri)){
          if(in==null)throw new Exception("File tidak tersedia");
          String code=readLimited(in,MAX_BYTES);
          sourceBuffer=code;bufferedPaste=false;
          runOnUiThread(()->{
            mode=2;input.setVisibility(View.GONE);
            modeLabel.setText("FILE LUA • "+code.length()+" karakter • siap diproses");
            resultInfo.setText("File siap diproses. Source tidak dimuat penuh ke editor untuk menjaga performa.");
          });
        }catch(Exception e){notifyUser("Gagal membaca file: "+e.getMessage());}
      }).start();
    }
    if(request==SAVE_LUA){
      final String toSave=savedResult;
      new Thread(()->{
        try(OutputStream out=getContentResolver().openOutputStream(uri)){
          if(out==null)throw new Exception("Tidak bisa menulis file");
          byte[] buffer=toSave.getBytes(StandardCharsets.UTF_8);
          out.write(buffer);out.flush();notifyUser("File Lua lengkap disimpan");
        }catch(Exception e){notifyUser("Gagal menyimpan: "+e.getMessage());}
      }).start();
    }
  }
  private static String preview(String value){
    if(value.length()<=PREVIEW)return value;
    return value.substring(0,PREVIEW)+"\n\n… CUPLIKAN "+PREVIEW+" karakter. Download menyimpan hasil lengkap ("+value.length()+" karakter).";
  }
  void pasteFromClipboard(){
    new Thread(()->{
      try{
        ClipboardManager cm=(ClipboardManager)getSystemService(CLIPBOARD_SERVICE);
        ClipData clip=cm.getPrimaryClip();
        if(clip==null||clip.getItemCount()==0)throw new Exception("Clipboard kosong");
        CharSequence c=clip.getItemAt(0).coerceToText(this);
        if(c==null)throw new Exception("Clipboard kosong");
        String content=c.toString();
        if(content.getBytes(StandardCharsets.UTF_8).length>MAX_BYTES)throw new Exception("Source di atas 8 MB: pilih file yang lebih kecil");
        sourceBuffer=content;bufferedPaste=true;
        runOnUiThread(()->{
          suppressEdit=true;
          try{input.setText(preview(content));}finally{suppressEdit=false;}
          modeLabel.setText("SOURCE LUA • "+content.length()+" karakter tersimpan penuh");
          notifyUser("Source tersimpan • siap diproses");
        });
      }catch(Exception e){notifyUser("Tidak bisa paste: "+e.getMessage());}
    }).start();
  }
  static String readLimited(InputStream in,int max)throws Exception {
    ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buf=new byte[4096];int n;
    while((n=in.read(buf))!=-1){if(bytes.size()+n>max)throw new Exception("Batas file "+max+" byte");bytes.write(buf,0,n);}
    return bytes.toString("UTF-8");
  }
  JSONObject request(String path,String method,JSONObject payload)throws Exception{
    if(!api.startsWith("https://"))throw new Exception("Server Zyrixen belum dikonfigurasi");
    HttpURLConnection c=(HttpURLConnection)new URL(api+path).openConnection();
    try{
      c.setConnectTimeout(9000);c.setReadTimeout(20000);c.setRequestMethod(method);
      if(payload!=null){
        c.setDoOutput(true);c.setRequestProperty("Content-Type","application/json; charset=utf-8");
        try(OutputStream out=c.getOutputStream()){out.write(payload.toString().getBytes(StandardCharsets.UTF_8));}
      }
      int code=c.getResponseCode();
      try(InputStream in=code<400?c.getInputStream():c.getErrorStream()){
        String text=readLimited(in,MAX_BYTES+2000000);
        if(code>=400)throw new Exception("Server "+code+": "+text);
        return new JSONObject(text);
      }
    }finally{c.disconnect();}
  }
  void checkStatus(){
    if(api.isEmpty())return;
    new Thread(()->{
      try{
        JSONObject config=request("/config","GET",null);
        boolean available=config.optInt("maintenance",0)==0&&config.optInt("enabled",1)==1;
        runOnUiThread(()->{
          service.setText(available?"●  SERVER ONLINE":"●  MAINTENANCE");
          service.setTextColor(available?ZyrixenUi.CYAN:ZyrixenUi.RED);
          serviceDetail.setText(config.optString("notice",available?"Mesin Zyrixen siap.":"Layanan ditangguhkan."));
        });
      }catch(Exception e){
        runOnUiThread(()->{service.setText("●  KONEKSI TERPUTUS");service.setTextColor(ZyrixenUi.RED);
          serviceDetail.setText("Mode offline tersedia untuk decode dasar.");});
      }
    }).start();
  }
  String localDecode(String source){
    StringBuilder out=new StringBuilder();char quote=0;
    for(int i=0;i<source.length();i++){
      char c=source.charAt(i);
      if(quote==0){out.append(c);if(c=='"'||c=='\'')quote=c;continue;}
      if(c==quote){out.append(c);quote=0;continue;}
      if(c!='\\'){out.append(c);continue;}
      if(i+1>=source.length()){out.append(c);continue;}
      int j=i+1,value=-1;
      if(source.charAt(j)=='x'&&j+2<source.length()){
        try{value=Integer.parseInt(source.substring(j+1,j+3),16);j+=3;}
        catch(NumberFormatException ignored){}
      } else if(Character.isDigit(source.charAt(j))){
        int start=j;while(j<source.length()&&j<start+3&&source.charAt(j)>='0'&&source.charAt(j)<='9')j++;
        try{value=Integer.parseInt(source.substring(start,j));}catch(NumberFormatException ignored){}
      }
      if(value>=32&&value<=126&&value!='\\'&&value!=quote){
        out.append((char)value);i=j-1;
      }else{out.append(c);out.append(source.charAt(++i));}
    }
    return out.toString();
  }
  void process(){
    if(running)return;
    final int selectedMode=mode;
    final String text=(selectedMode==2||selectedMode==0&&bufferedPaste)?sourceBuffer:input.getText().toString();
    if(text.trim().isEmpty()){notifyUser("Masukkan source atau URL dahulu");return;}
    running=true;run.setText("◌  MEMPROSES...");run.setEnabled(false);
    new Thread(()->{
      try{
        String source=text;
        if(selectedMode==1){
          if(!source.startsWith("https://"))throw new Exception("URL harus HTTPS");
          HttpURLConnection c=(HttpURLConnection)new URL(source).openConnection();
          c.setConnectTimeout(10000);c.setReadTimeout(15000);c.setInstanceFollowRedirects(false);
          try{if(c.getResponseCode()!=200)throw new Exception("Raw URL tidak tersedia");
            try(InputStream in=c.getInputStream()){source=readLimited(in,MAX_BYTES);}
          }finally{c.disconnect();}
        }
        if(source.isEmpty())throw new Exception("Source masih kosong");
        final String result;final String info;
        if(api.isEmpty()){
          result=localDecode(source);info="Decoded lokal • belum menjamin semua obfuscation terbuka";
        }else{
          JSONObject json;
          try{json=request("/deobfuscate","POST",new JSONObject().put("source",source));}
          catch(Exception e){
            if(!e.getMessage().contains("413"))throw e;
            result=localDecode(source);
            info="Source terlalu besar untuk server; decoder ringan offline digunakan. Full source tetap tersimpan.";
            runOnUiThread(()->{fullResult=result;output.setText(preview(result));resultInfo.setText(info);});
            return;
          }
          result=json.optString("result",source);
          int changes=json.optInt("transformations",0);
          info=changes==0?"Belum ada lapisan obfuscation yang berhasil dibuka pada percobaan ini.":"Zyrixen Engine "+json.optString("engine_version","")+" • "+changes+" transformasi";
        }
        runOnUiThread(()->{
          fullResult=result;
          output.setText(preview(result));
          resultInfo.setText(info+" • output "+result.length()+" karakter");
        });
      }catch(Exception e){notifyUser(e.getMessage());}
      finally{running=false;runOnUiThread(()->{run.setEnabled(true);run.setText("✦   PROSES DEOBFUSCATE");});}
    }).start();
  }
}
