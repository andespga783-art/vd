import { createClient } from "npm:@supabase/supabase-js@2";

const supabaseUrl = Deno.env.get("SUPABASE_URL") ?? "";
const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";
const anonKey = Deno.env.get("SUPABASE_ANON_KEY") ?? "";
if (!supabaseUrl || !serviceKey || !anonKey) throw new Error("Supabase configuration missing");
const adminDb = createClient(supabaseUrl, serviceKey, { auth: { autoRefreshToken: false, persistSession: false } });
const publicAuth = createClient(supabaseUrl, anonKey, { auth: { autoRefreshToken: false, persistSession: false } });

const headers = { "Content-Type": "application/json; charset=utf-8", "Access-Control-Allow-Origin": "*", "Access-Control-Allow-Headers": "authorization,content-type", "Access-Control-Allow-Methods": "GET,POST,PUT,OPTIONS", "Cache-Control": "no-store" };
const json = (body: unknown, status=200) => new Response(JSON.stringify(body), { status, headers });
const fail = (message: string, status=400) => json({ error: message }, status);

async function readBody(req: Request, limit=8000000): Promise<Record<string,unknown>> {
  const declared = Number(req.headers.get("content-length") || 0);
  if (declared > limit) throw new Error("Payload terlalu besar");
  const reader = req.body?.getReader();
  if (!reader) throw new Error("Body diperlukan");
  const decoder = new TextDecoder();
  const fragments: string[] = [];
  let bytes = 0;
  while (true) {
    const { value, done } = await reader.read();
    if (done) break;
    bytes += value.byteLength;
    if (bytes > limit) {
      await reader.cancel();
      throw new Error("Payload terlalu besar");
    }
    fragments.push(decoder.decode(value,{stream:true}));
  }
  fragments.push(decoder.decode());
  const text = fragments.join("");
  const parsed: unknown = JSON.parse(text);
  if (!parsed || typeof parsed !== "object" || Array.isArray(parsed)) throw new Error("JSON object diperlukan");
  return parsed as Record<string,unknown>;
}
async function config() {
  const { data, error } = await adminDb.from("zyrixen_config").select("enabled,maintenance,notice,max_chars").eq("id",1).single();
  if (error || !data) throw new Error("Konfigurasi backend tidak tersedia");
  return data;
}
async function sha256(s: string): Promise<string> {
  const raw=await crypto.subtle.digest("SHA-256",new TextEncoder().encode(s));
  return Array.from(new Uint8Array(raw), b=>b.toString(16).padStart(2,"0")).join("");
}
function randomHex() {
  return Array.from(crypto.getRandomValues(new Uint8Array(32)), b=>b.toString(16).padStart(2,"0")).join("");
}
function userPublic(u: Record<string,unknown>) {
  return {id:u.id,username:u.username,credits:u.credits,unlimited:u.unlimited,
    banned:u.banned,deob_count:u.deob_count,created_at:u.created_at,last_seen:u.last_seen};
}
async function requireUser(req: Request) {
  const auth=req.headers.get("Authorization") ?? "";
  const token=auth.startsWith("Bearer ") ? auth.slice(7).trim() : "";
  if(!/^zyxu_[a-f0-9]{64}$/.test(token))return null;
  const hash=await sha256(token);
  const {data,error}=await adminDb.from("zyrixen_users")
    .select("id,username,credits,unlimited,banned,deob_count,created_at,last_seen")
    .eq("token_hash",hash).maybeSingle();
  if(error)throw error;
  return data;
}
async function requireOwner(req: Request) {
  const auth = req.headers.get("Authorization") || "";
  const token = auth.startsWith("Bearer ") ? auth.slice(7).trim() : "";
  if (!token) return null;
  if(token.startsWith("zyx_")){
    const hash=await sha256(token);
    const row=await adminDb.from("zyrixen_owner_devices").select("id").eq("token_hash",hash).eq("active",true).maybeSingle();
    return row.data ? {id:row.data.id} : null;
  }
  const { data, error } = await adminDb.auth.getUser(token);
  if (error || !data.user) return null;
  const owner = await adminDb.from("zyrixen_owners").select("user_id").eq("user_id",data.user.id).maybeSingle();
  return owner.data ? data.user : null;
}
function decodeLua(source: string): {result:string;transformations:number} {
  let changes = 0;
  const result = source.replace(/("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*')/g, literal => {
    const quote = literal[0];
    const body = literal.slice(1,-1).replace(/\\(?:([0-9]{1,3})|x([0-9a-fA-F]{2}))/g,(raw,decimal,hex) => {
      const value = decimal ? Number(decimal) : parseInt(hex,16);
      if (value < 32 || value > 126 || value===34 || value===39 || value===92 || String.fromCharCode(value)===quote) return raw;
      changes++;
      return String.fromCharCode(value);
    });
    return quote+body+quote;
  });
  return {result,transformations:changes};
}
Deno.serve(async req => {
  if (req.method === "OPTIONS") return new Response(null, {status:204,headers});
  const path = new URL(req.url).pathname.replace(/^.*\/zyrixen-api(?=\/|$)/,"") || "/";
  try {
    if (req.method==="GET" && path==="/health") return json({ok:true,service:"Zyrixen Online",version:"0.9"});
    if (req.method==="GET" && path==="/config") return json({...await config(),engine_version:"0.9",max_source_bytes:8000000});
    if(req.method==="POST" && path==="/user/register"){
      const payload=await readBody(req,2048);
      const username=typeof payload.username==="string"?payload.username.trim():"";
      if(!/^[A-Za-z][A-Za-z0-9_]{2,19}$/.test(username))
        return fail("Nama pengguna harus 3–20 karakter: huruf, angka, underscore, diawali huruf",422);
      const token="zyxu_"+randomHex();
      const {data,error}=await adminDb.from("zyrixen_users")
        .insert({username,token_hash:await sha256(token)})
        .select("id,username,credits,unlimited,banned,deob_count,created_at,last_seen").single();
      if(error){
        if(error.code==="23505")return fail("Username sudah digunakan. Pilih nama berbeda.",409);
        throw error;
      }
      return json({access_token:token,user:userPublic(data)},201);
    }
    if(req.method==="GET" && path==="/user/me"){
      const user=await requireUser(req);
      if(!user)return fail("Perangkat belum terdaftar. Masukkan username sekali.",401);
      return json({user:userPublic(user)});
    }
    if (req.method==="POST" && path==="/deobfuscate") {
      const user=await requireUser(req);
      if(!user)return fail("Daftarkan username untuk memakai Zyrixen.",401);
      if(user.banned)return fail("Akun ini diblokir oleh Owner.",403);
      const cfg = await config();
      if (!cfg.enabled || cfg.maintenance) return fail("Layanan sedang tidak tersedia",503);
      const body=await readBody(req);
      const source=body.source;
      const requestId=body.request_id;
      if (typeof source!=="string" || !source.trim()) return fail("Source Lua diperlukan",422);
      if (source.length>cfg.max_chars) return fail("Batas source terlalu besar",413);
      if(typeof requestId!=="string" || !/^[a-f0-9]{8}-[a-f0-9]{4}-[1-8][a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$/i.test(requestId))
        return fail("Request ID tidak valid",422);
      const {result,transformations}=decodeLua(source);
      const {data:charged,error:chargeError}=await adminDb.rpc("zyrixen_complete_job",{
        p_user_id:user.id,p_request_id:requestId,
        p_source_chars:source.length,p_transformations:transformations,
        p_source_digest:await sha256(source)
      });
      if(chargeError)throw chargeError;
      if(!charged || charged.ok!==true){
        const reason=charged?.reason;
        if(reason==="banned")return fail("Akun ini diblokir Owner.",403);
        if(reason==="maintenance")return fail("Layanan sedang maintenance.",503);
        if(reason==="no_credits")return fail("Kredit habis. Hubungi Owner untuk isi kredit.",402);
        if(reason==="request_id_conflict")return fail("ID permintaan sudah digunakan untuk source berbeda.",409);
        return fail("Akun pengguna tidak tersedia",401);
      }
      return json({result,transformations,engine_version:"0.9",
        charged:charged.charged,replayed:charged.replayed===true,credits:charged.credits,unlimited:charged.unlimited,
        obfuscator:source.includes("PvM Obfuscator")?"PvM":undefined,
        note:charged.replayed===true?"Permintaan ulang: tidak ada kredit tambahan yang dipotong.":transformations===0?"Tidak ada transformasi: kredit tidak dipotong. Mesin belum mendukung obfuscation ini.":charged.charged===0?"Berhasil diproses dengan unlimited kredit.":"Sukses diproses. Satu kredit digunakan."});
    }
    if (req.method==="POST" && path==="/owner/login") {
      const body=await readBody(req,8192);
      const email=body.email, password=body.password;
      if (typeof email!=="string" || typeof password!=="string" || email.length>320 || password.length>512) return fail("Email/password tidak valid",422);
      const {data,error}=await publicAuth.auth.signInWithPassword({email,password});
      if (error || !data.user || !data.session) return fail("Kredensial tidak valid",401);
      const allowed=await adminDb.from("zyrixen_owners").select("user_id").eq("user_id",data.user.id).maybeSingle();
      if (!allowed.data) return fail("Akses Owner tidak diberikan",403);
      return json({access_token:data.session.access_token,refresh_token:data.session.refresh_token,expires_at:data.session.expires_at,email:data.user.email});
    }
    if (req.method==="POST" && path==="/owner/activate") {
      const payload=await readBody(req,4096);
      const code=typeof payload.code==="string"?payload.code.trim().toLowerCase():"";
      if(!/^[a-f0-9]{64}$/.test(code))return fail("Kode aktivasi tidak valid",401);
      const hash=await sha256(code);
      const now=new Date().toISOString();
      const redeemed=await adminDb.from("zyrixen_owner_activation")
        .update({used_at:now}).eq("code_hash",hash).is("used_at",null)
        .gt("expires_at",now).select("code_hash").maybeSingle();
      if(redeemed.error||!redeemed.data)return fail("Kode sudah dipakai atau kedaluwarsa",401);
      const token="zyx_"+randomHex();
      const created=await adminDb.from("zyrixen_owner_devices").insert({
        token_hash:await sha256(token),label:"Zyrixen Owner Android"
      });
      if(created.error)throw created.error;
      return json({access_token:token,refresh_token:token,device_paired:true});
    }
    if (req.method==="POST" && path==="/owner/refresh") {
      const body=await readBody(req,8192);
      const refresh=body.refresh_token;
      if(typeof refresh!=="string" || refresh.length<10 || refresh.length>4096) return fail("Sesi tidak valid",401);
      if(refresh.startsWith("zyx_")){
        const hashed=await sha256(refresh);
        const dev=await adminDb.from("zyrixen_owner_devices").select("id").eq("token_hash",hashed).eq("active",true).maybeSingle();
        if(!dev.data)return fail("Perangkat tidak diaktifkan",401);
        return json({access_token:refresh,refresh_token:refresh,device_paired:true});
      }
      const {data,error}=await publicAuth.auth.refreshSession({refresh_token:refresh});
      if(error || !data.session || !data.user)return fail("Sesi kedaluwarsa",401);
      const allowed=await adminDb.from("zyrixen_owners").select("user_id").eq("user_id",data.user.id).maybeSingle();
      if(!allowed.data)return fail("Akses Owner tidak tersedia",403);
      return json({access_token:data.session.access_token,refresh_token:data.session.refresh_token,expires_at:data.session.expires_at});
    }
    if (path.startsWith("/admin/")) {
      if (!await requireOwner(req)) return fail("Akses Owner tidak valid",401);
      if(req.method==="GET" && path==="/admin/users"){
        const url=new URL(req.url);
        const query=(url.searchParams.get("q")??"").trim();
        const page=Math.max(0,Math.min(100,Number(url.searchParams.get("page")??"0")||0));
        let builder=adminDb.from("zyrixen_users")
          .select("id,username,credits,unlimited,banned,deob_count,created_at,last_seen",{count:"exact"})
          .order("created_at",{ascending:false}).range(page*40,page*40+39);
        if(query)builder=builder.ilike("username",`%${query.replace(/[%_,]/g,"")}%`);
        const {data,error,count}=await builder;
        if(error)throw error;
        return json({users:data??[],count:count??0,page});
      }
      const creditMatch=path.match(/^\/admin\/users\/([a-f0-9-]{36})\/credits$/i);
      if(req.method==="POST" && creditMatch){
        const body=await readBody(req,4096);
        const delta=body.delta;
        if(typeof delta!=="number"||!Number.isInteger(delta)||delta===0||Math.abs(delta)>100000)
          return fail("Jumlah kredit harus antara -100000 sampai 100000 (bukan nol)",422);
        const {data,error}=await adminDb.rpc("zyrixen_adjust_credits",{p_user_id:creditMatch[1],p_delta:delta});
        if(error)throw error;
        if(!data?.ok)return fail("Kredit tidak boleh kurang dari 0 atau akun tidak ditemukan",409);
        return json(data);
      }
      const userMatch=path.match(/^\/admin\/users\/([a-f0-9-]{36})$/i);
      if(req.method==="PUT" && userMatch){
        const body=await readBody(req,4096);
        if(typeof body.banned!=="boolean" && typeof body.unlimited!=="boolean")
          return fail("Pengaturan akun harus mencakup banned atau unlimited",422);
        if(body.banned!==undefined && typeof body.banned!=="boolean")return fail("Nilai banned tidak valid",422);
        if(body.unlimited!==undefined && typeof body.unlimited!=="boolean")return fail("Nilai unlimited tidak valid",422);
        const update:Record<string,boolean>={};
        if(typeof body.banned==="boolean")update.banned=body.banned;
        if(typeof body.unlimited==="boolean")update.unlimited=body.unlimited;
        const {data,error}=await adminDb.from("zyrixen_users").update(update)
          .eq("id",userMatch[1]).select("id,username,credits,unlimited,banned,deob_count,created_at,last_seen").maybeSingle();
        if(error)throw error;
        if(!data)return fail("Pengguna tidak ditemukan",404);
        return json({user:userPublic(data)});
      }
      if (req.method==="GET" && path==="/admin/config") return json(await config());
      if (req.method==="GET" && path==="/admin/stats"){
        const {count,error}=await adminDb.from("zyrixen_jobs").select("id",{count:"exact",head:true});
        if (error) throw error;
        const {data,error:sumErr}=await adminDb.from("zyrixen_jobs").select("source_chars").order("id",{ascending:false}).limit(10000);
        if (sumErr) throw sumErr;
        return json({count:count??0,total_chars:(data||[]).reduce((sum,row)=>sum+row.source_chars,0)});
      }
      if (req.method==="PUT" && path==="/admin/config") {
        const body=await readBody(req,8192);
        if (typeof body.enabled!=="boolean" || typeof body.maintenance!=="boolean" || typeof body.notice!=="string" || typeof body.max_chars!=="number" || body.notice.length>300 || !Number.isInteger(body.max_chars) || body.max_chars<100 || body.max_chars>5000000) return fail("Pengaturan tidak valid",422);
        const {data,error}=await adminDb.from("zyrixen_config").update({enabled:body.enabled,maintenance:body.maintenance,notice:body.notice,max_chars:body.max_chars,updated_at:new Date().toISOString()}).eq("id",1).select("enabled,maintenance,notice,max_chars").single();
        if (error) throw error;
        return json(data);
      }
    }
    return fail("Endpoint tidak ditemukan",404);
  } catch (error) {
    const message=error instanceof Error?error.message:"Permintaan gagal";
    if (message.includes("Payload terlalu besar"))return fail(message,413);
    if (message.includes("JSON"))return fail("Format JSON tidak valid",400);
    console.error("Zyrixen API error",message);
    return fail("Kesalahan internal backend",500);
  }
});
