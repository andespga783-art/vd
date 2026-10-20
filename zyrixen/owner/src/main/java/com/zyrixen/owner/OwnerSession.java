package com.zyrixen.owner;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;

import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/** Device-bound refresh token storage. No owner secret is baked into the APK. */
public final class OwnerSession {
  private static final String ALIAS="zyrixen_owner_refresh_v1";
  private static final String PREF="zyrixen_owner_private";
  private OwnerSession(){}

  private static SecretKey key() throws Exception {
    KeyStore keys=KeyStore.getInstance("AndroidKeyStore");
    keys.load(null);
    if(keys.containsAlias(ALIAS)){
      return ((KeyStore.SecretKeyEntry)keys.getEntry(ALIAS,null)).getSecretKey();
    }
    KeyGenerator generator=KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES,"AndroidKeyStore");
    generator.init(new KeyGenParameterSpec.Builder(
      ALIAS,KeyProperties.PURPOSE_ENCRYPT|KeyProperties.PURPOSE_DECRYPT)
      .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
      .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
      .setKeySize(256)
      .build());
    return generator.generateKey();
  }

  public static void save(Context context,String refreshToken) throws Exception {
    if(refreshToken==null||refreshToken.isEmpty())throw new IllegalArgumentException("Empty session");
    Cipher cipher=Cipher.getInstance("AES/GCM/NoPadding");
    cipher.init(Cipher.ENCRYPT_MODE,key());
    byte[] encrypted=cipher.doFinal(refreshToken.getBytes(StandardCharsets.UTF_8));
    context.getSharedPreferences(PREF,Context.MODE_PRIVATE).edit()
      .putString("encrypted",Base64.encodeToString(encrypted,Base64.NO_WRAP))
      .putString("iv",Base64.encodeToString(cipher.getIV(),Base64.NO_WRAP))
      .apply();
  }

  public static String load(Context context) {
    SharedPreferences prefs=context.getSharedPreferences(PREF,Context.MODE_PRIVATE);
    String enc=prefs.getString("encrypted",null),iv=prefs.getString("iv",null);
    if(enc==null||iv==null)return null;
    try {
      Cipher cipher=Cipher.getInstance("AES/GCM/NoPadding");
      cipher.init(Cipher.DECRYPT_MODE,key(),
        new GCMParameterSpec(128,Base64.decode(iv,Base64.NO_WRAP)));
      byte[] plain=cipher.doFinal(Base64.decode(enc,Base64.NO_WRAP));
      return new String(plain,StandardCharsets.UTF_8);
    }catch(Exception e){
      clear(context);
      return null;
    }
  }

  public static void clear(Context context){
    context.getSharedPreferences(PREF,Context.MODE_PRIVATE).edit().clear().apply();
  }
}
