import assert from "node:assert/strict";
import { mkdtemp, readFile, writeFile, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { pathToFileURL } from "node:url";
import { createHash, randomUUID } from "node:crypto";

// Run the actual Edge route with a fake DB, never production accounts or credits.
const token="zyxu_"+"a".repeat(64);
const digest=s=>createHash("sha256").update(s).digest("hex");
let user={id:randomUUID(),username:"fixture_user",credits:0,unlimited:false,banned:false,deob_count:0};
let cfg={enabled:true,maintenance:false,notice:"owner notice",max_chars:5000000};
let rpcCalls=[];
const db={
  from(table){
    const filters={};
    return {
      select(){return this;},eq(k,v){filters[k]=v;return this;},
      async single(){assert.equal(table,"zyrixen_config");return {data:cfg,error:null};},
      async maybeSingle(){return {data:table==="zyrixen_users"&&filters.token_hash===digest(token)?user:null,error:null};},
    };
  },
  async rpc(name,args){
    rpcCalls.push({name,args});
    assert.equal(name,"zyrixen_complete_job","trial must never consume AI quota or credit RPC");
    return {data:{ok:true,charged:args.p_transformations>0?1:0,replayed:false,credits:5,unlimited:false},error:null};
  },
  auth:{async getUser(){return {data:{user:null},error:null};}},
};
globalThis.__zyrixenTestClient=()=>db;
let handler;
const env=new Map([["SUPABASE_URL","https://unit.invalid"],["SUPABASE_SERVICE_ROLE_KEY","unit-placeholder"],["SUPABASE_ANON_KEY","unit-placeholder"]]);
globalThis.Deno={env:{get:k=>env.get(k)},serve:fn=>{handler=fn;}};
const directory=await mkdtemp(join(tmpdir(),"zyrixen-route-"));
try {
  await writeFile(join(directory,"client.mjs"),"export const createClient=globalThis.__zyrixenTestClient;");
  let source=await readFile(new URL("./index.ts",import.meta.url),"utf8");
  source=source.replace('"npm:@supabase/supabase-js@2"',JSON.stringify(pathToFileURL(join(directory,"client.mjs")).href));
  for(const dependency of ["engine.ts","moonveil-trial.ts"]){
    source=source.replace(JSON.stringify("./"+dependency),JSON.stringify(new URL("./"+dependency,import.meta.url).href));
  }
  await writeFile(join(directory,"index.ts"),source);
  await import(pathToFileURL(join(directory,"index.ts")).href);
  async function send(path,body,auth=true){
    return handler(new Request("https://unit.invalid/functions/v1/zyrixen-api"+path,{
      method:body===undefined?"GET":"POST",
      headers:{"Content-Type":"application/json",...(auth?{Authorization:"Bearer "+token}:{})},
      ...(body===undefined?{}:{body:JSON.stringify(body)}),
    }));
  }
  const health=await (await send("/health")).json();
  assert.equal(health.version,"1.1");
  assert.equal(health.moonveil_v5.mode,"exact_input_analysis_cache");
  assert.equal(health.moonveil_v5.arbitrary_source_supported,false);
  const config=await (await send("/config")).json();
  assert.equal(config.notice,"owner notice");
  assert.equal(config.engine_version,"1.1");
  assert.equal((await send("/deobfuscate",{source:"print(1)",request_id:randomUUID()},false)).status,401);
  user.banned=true;
  assert.equal((await send("/deobfuscate",{source:"print(1)",request_id:randomUUID()})).status,403);
  user.banned=false;cfg.maintenance=true;
  assert.equal((await send("/deobfuscate",{source:"print(1)",request_id:randomUUID()})).status,503);
  cfg.maintenance=false;
  assert.equal((await send("/deobfuscate",{source:"print(1)"})).status,422);
  assert.equal(rpcCalls.length,0);
  const plain=await (await send("/deobfuscate",{source:'return "\\72"',request_id:randomUUID()})).json();
  assert.equal(plain.result,'return "H"');
  assert.equal(plain.charged,1);
  assert.equal(rpcCalls.length,1);
  assert.equal(rpcCalls[0].args.p_source_digest,digest('return "\\72"'));

  if(process.env.ZYRIXEN_MOONVEIL_FIXTURE){
    const fixture=await readFile(process.env.ZYRIXEN_MOONVEIL_FIXTURE,"utf8");
    rpcCalls=[];
    const requestId=randomUUID();
    for(let retry=0;retry<2;retry++){
      const response=await send("/deobfuscate",{source:fixture,request_id:requestId,ai:true});
      assert.equal(response.status,200);
      const body=await response.json();
      assert.equal(body.result_status,"partial_analysis");
      assert.equal(body.engine_version,"1.1-PARTIAL");
      assert.equal(body.transformations,0);
      assert.equal(body.charged,0);
      assert.equal(body.credits,0,"analysis works without spending credit");
      assert.equal(body.analysis.cache_match,"sha256_exact");
      assert.equal(body.analysis.executable_source,false);
      assert.ok(body.result.includes("PARTIAL / PERCOBAAN"));
      assert.equal(body.ai,undefined);
    }
    assert.equal(rpcCalls.length,0,"read-only analysis must not record or bill a job");
    user.banned=true;
    assert.equal((await send("/deobfuscate",{source:fixture,request_id:randomUUID()})).status,403);
    user.banned=false;
    cfg.maintenance=true;
    assert.equal((await send("/deobfuscate",{source:fixture,request_id:randomUUID()})).status,503);
    cfg.maintenance=false;
    const changed=await (await send("/deobfuscate",{source:fixture+"\n",request_id:randomUUID()})).json();
    assert.equal(changed.analysis,undefined);
    assert.equal(rpcCalls.length,1,"changed input returns to normal static engine");
    console.log("PASS actual MoonVeil route, free retries, auth, bans, maintenance and changed-source fallback");
  }
  console.log("PASS public config, auth gates and existing static decode route");
} finally {
  delete globalThis.__zyrixenTestClient;
  await rm(directory,{recursive:true,force:true});
}
