package com.zyrixen.owner;

import android.app.AlertDialog;
import android.graphics.Typeface;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicBoolean;

/** Protected Owner-only user controls: balances, unlimited, ban/unban. */
public final class OwnerUsersPanel {
  private final MainActivity activity;
  private final LinearLayout wrapper;
  private final LinearLayout list;
  private final EditText search;
  private final TextView status;
  private final Button previous, next;
  private final AtomicBoolean updating=new AtomicBoolean(false);
  private int page=0;

  public OwnerUsersPanel(MainActivity owner){
    activity=owner;
    wrapper=ZyrixenUi.card(owner);
    wrapper.setId(View.generateViewId());
    attach(ZyrixenUi.text(owner,"PENGGUNA ZYRIXEN",16,ZyrixenUi.WHITE,true),9);
    attach(ZyrixenUi.text(owner,"Kelola username, kredit, unlimited, dan ban.",12,ZyrixenUi.MUTED,false),12);
    search=ZyrixenUi.edit(owner,"Cari username...",1);
    search.setSingleLine(true);
    attach(search,8);
    Button query=ZyrixenUi.button(owner,"⌕  Cari / Segarkan Pengguna",false);
    query.setOnClickListener(v->{page=0;load();});
    attach(query,12);
    status=ZyrixenUi.text(owner,"Daftar pengguna akan muncul di sini.",12,ZyrixenUi.MUTED,false);
    attach(status,10);
    list=ZyrixenUi.vertical(owner);
    attach(list,8);
    LinearLayout pager=ZyrixenUi.row(owner);
    previous=ZyrixenUi.button(owner,"‹ Sebelumnya",false);
    next=ZyrixenUi.button(owner,"Berikutnya ›",false);
    pager.addView(previous,ZyrixenUi.weighted(owner,7));
    pager.addView(next,new LinearLayout.LayoutParams(0,-2,1));
    previous.setOnClickListener(v->{if(page>0){page--;load();}});
    next.setOnClickListener(v->{page++;load();});
    attach(pager,0);
    previous.setEnabled(false);next.setEnabled(false);
  }

  private void attach(View child,int margin){wrapper.addView(child,ZyrixenUi.lp(activity,margin));}
  public View view(){return wrapper;}
  private void alert(String message){
    activity.runOnUiThread(()->Toast.makeText(activity,message,Toast.LENGTH_LONG).show());
  }
  public void load(){
    if(activity.sessionToken.isEmpty()||!updating.compareAndSet(false,true))return;
    status.setText("Memuat data pengguna...");
    final int requestedPage=page;
    String keyword=search.getText().toString().trim();
    new Thread(()->{
      try{
        String query=URLEncoder.encode(keyword, StandardCharsets.UTF_8.name());
        JSONObject data=activity.authenticatedRequest("/admin/users?page="+requestedPage+"&q="+query,"GET",null);
        activity.runOnUiThread(()->render(data));
      }catch(Exception e){alert("Gagal memuat pengguna: "+e.getMessage());}
      finally{updating.set(false);}
    }).start();
  }
  private void render(JSONObject response){
    JSONArray users=response.optJSONArray("users");
    int total=response.optInt("count",0);
    list.removeAllViews();
    status.setText(total+" pengguna • halaman "+(page+1));
    previous.setEnabled(page>0);
    next.setEnabled((page+1)*40<total);
    if(users==null||users.length()==0){
      attachPlaceholder("Belum ada pengguna pada halaman ini.");
      return;
    }
    for(int i=0;i<users.length();i++){
      JSONObject u=users.optJSONObject(i);
      if(u!=null)drawUser(u);
    }
  }
  private void attachPlaceholder(String message){
    list.addView(ZyrixenUi.text(activity,message,12,ZyrixenUi.MUTED,false));
  }
  private void drawUser(JSONObject u){
    String id=u.optString("id","");
    String username=u.optString("username","?");
    int balance=u.optInt("credits",0);
    boolean unlimited=u.optBoolean("unlimited",false);
    boolean banned=u.optBoolean("banned",false);
    int count=u.optInt("deob_count",0);
    LinearLayout card=ZyrixenUi.card(activity);
    TextView name=ZyrixenUi.text(activity,"@"+username,17,ZyrixenUi.WHITE,true);
    card.addView(name,ZyrixenUi.lp(activity,6));
    TextView summary=ZyrixenUi.text(activity,
      (unlimited?"∞ UNLIMITED":balance+" kredit")+
        "  •  "+count+" proses"+(banned?"  •  BANNED":""),
      12,banned?ZyrixenUi.RED:ZyrixenUi.CYAN,false);
    card.addView(summary,ZyrixenUi.lp(activity,13));

    TextView hint=ZyrixenUi.text(activity,"TAMBAH / KURANGI KREDIT",11,ZyrixenUi.MUTED,true);
    card.addView(hint,ZyrixenUi.lp(activity,7));
    EditText amount=ZyrixenUi.edit(activity,"Jumlah",1);
    amount.setSingleLine(true);amount.setInputType(InputType.TYPE_CLASS_NUMBER);
    amount.setText("5");card.addView(amount,ZyrixenUi.lp(activity,8));
    LinearLayout actions=ZyrixenUi.row(activity);
    Button add=ZyrixenUi.button(activity,"+ Tambah",true);
    Button subtract=ZyrixenUi.button(activity,"− Kurangi",false);
    actions.addView(add,ZyrixenUi.weighted(activity,8));
    actions.addView(subtract,new LinearLayout.LayoutParams(0,-2,1));
    card.addView(actions,ZyrixenUi.lp(activity,10));
    add.setOnClickListener(v->adjust(id,amount,1));
    subtract.setOnClickListener(v->adjust(id,amount,-1));

    CheckBox infinity=new CheckBox(activity);
    infinity.setText("Unlimited kredit");
    infinity.setTextColor(ZyrixenUi.WHITE);
    infinity.setButtonTintList(android.content.res.ColorStateList.valueOf(ZyrixenUi.CYAN));
    infinity.setChecked(unlimited);
    card.addView(infinity,ZyrixenUi.lp(activity,5));
    infinity.setOnCheckedChangeListener((v,value)->changeFlag(id,"unlimited",value,()->infinity.setChecked(!value)));

    CheckBox blocked=new CheckBox(activity);
    blocked.setText("Ban pengguna (blokir proses)");
    blocked.setTextColor(ZyrixenUi.WHITE);
    blocked.setButtonTintList(android.content.res.ColorStateList.valueOf(ZyrixenUi.RED));
    blocked.setChecked(banned);
    card.addView(blocked);
    blocked.setOnCheckedChangeListener((v,value)->{
      if(!value){changeFlag(id,"banned",false,()->blocked.setChecked(true));return;}
      new AlertDialog.Builder(activity).setTitle("Ban @"+username+"?")
        .setMessage("Pengguna ini tidak bisa deobfuscate sampai Owner membuka ban.")
        .setPositiveButton("Ban", (dialog,which)->changeFlag(id,"banned",true,()->blocked.setChecked(false)))
        .setNegativeButton("Batal",(dialog,which)->blocked.setChecked(false))
        .setOnCancelListener(dialog->blocked.setChecked(false)).show();
    });
    list.addView(card,ZyrixenUi.lp(activity,12));
  }
  private void adjust(String id,EditText amount,int sign){
    int delta;
    try{
      delta=Integer.parseInt(amount.getText().toString().trim());
      if(delta<=0||delta>100000)throw new IllegalArgumentException();
    }catch(Exception e){alert("Isi jumlah 1–100000 kredit");return;}
    final int change=delta*sign;
    send("/admin/users/"+id+"/credits","POST","delta",change);
  }
  private void changeFlag(String id,String key,boolean value,Runnable revert){
    send("/admin/users/"+id,"PUT",key,value);
  }
  private void send(String path,String method,String key,Object value){
    if(!updating.compareAndSet(false,true)){alert("Tunggu perubahan sebelumnya selesai");return;}
    new Thread(()->{
      try{
        JSONObject body=new JSONObject().put(key,value);
        activity.authenticatedRequest(path,method,body);
        activity.runOnUiThread(()->{
          status.setText("Perubahan pengguna tersimpan di server.");
        });
      }catch(Exception e){alert("Perubahan gagal: "+e.getMessage());}
      finally{
        updating.set(false);
        activity.runOnUiThread(()->load());
      }
    }).start();
  }
}
