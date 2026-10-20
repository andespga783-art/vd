package com.zyrixen.deob;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

public final class ZyrixenUi {
  public static final int BG=Color.rgb(9,12,23);
  public static final int SURFACE=Color.rgb(20,25,42);
  public static final int RAISED=Color.rgb(29,35,58);
  public static final int WHITE=Color.rgb(239,243,255);
  public static final int MUTED=Color.rgb(148,159,185);
  public static final int ACCENT=Color.rgb(125,99,255);
  public static final int CYAN=Color.rgb(65,220,221);
  public static final int RED=Color.rgb(255,110,128);
  private ZyrixenUi(){}
  public static int dp(Activity a,float d){return (int)(a.getResources().getDisplayMetrics().density*d+0.5f);}
  public static GradientDrawable shape(int color,int radius,Activity a){
    GradientDrawable d=new GradientDrawable();d.setColor(color);d.setCornerRadius(dp(a,radius));return d;
  }
  public static GradientDrawable border(int color,int stroke,Activity a){
    GradientDrawable d=shape(color,18,a);d.setStroke(dp(a,1),stroke);return d;
  }
  public static GradientDrawable grad(Activity a){
    GradientDrawable d=new GradientDrawable(GradientDrawable.Orientation.TL_BR,new int[]{Color.rgb(115,83,248),Color.rgb(58,146,236)});
    d.setCornerRadius(dp(a,17));return d;
  }
  public static LinearLayout vertical(Activity a){
    LinearLayout c=new LinearLayout(a);c.setOrientation(LinearLayout.VERTICAL);return c;
  }
  public static LinearLayout row(Activity a){
    LinearLayout c=new LinearLayout(a);c.setGravity(Gravity.CENTER_VERTICAL);return c;
  }
  public static void pad(View v,Activity a,int l,int t,int r,int b){
    v.setPadding(dp(a,l),dp(a,t),dp(a,r),dp(a,b));
  }
  public static TextView text(Activity a,String s,int sp,int color,boolean bold){
    TextView t=new TextView(a);t.setText(s);t.setTextSize(sp);t.setTextColor(color);
    if(bold)t.setTypeface(Typeface.DEFAULT,Typeface.BOLD);return t;
  }
  public static EditText edit(Activity a,String hint,int lines){
    EditText e=new EditText(a);e.setTextColor(WHITE);e.setHintTextColor(MUTED);e.setTextSize(14);
    e.setHint(hint);e.setGravity(Gravity.TOP|Gravity.START);
    e.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);
    e.setMinLines(lines);e.setMaxLines(Math.max(lines,14));e.setBackground(border(SURFACE,RAISED,a));
    pad(e,a,15,15,15,15);return e;
  }
  public static Button button(Activity a,String label,boolean primary){
    Button b=new Button(a);b.setAllCaps(false);b.setText(label);b.setTextSize(14);
    b.setTypeface(Typeface.DEFAULT,Typeface.BOLD);b.setTextColor(WHITE);
    b.setBackground(primary?grad(a):border(RAISED,Color.rgb(47,54,79),a));
    b.setMinimumHeight(dp(a,54));b.setStateListAnimator(null);return b;
  }
  public static LinearLayout.LayoutParams lp(Activity a,int bottom){
    LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(-1,-2);p.bottomMargin=dp(a,bottom);return p;
  }
  public static LinearLayout.LayoutParams weighted(Activity a,int margin){
    LinearLayout.LayoutParams p=new LinearLayout.LayoutParams(0,-2,1);p.rightMargin=dp(a,margin);return p;
  }
  public static LinearLayout card(Activity a){
    LinearLayout c=vertical(a);c.setBackground(border(SURFACE,Color.rgb(38,45,70),a));pad(c,a,17,18,17,18);return c;
  }
}
