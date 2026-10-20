import os, sqlite3, time
from contextlib import closing
from fastapi import FastAPI, HTTPException, Header
from pydantic import BaseModel, Field
from decoder import readable_lua

DB = os.getenv("ZYRIXEN_DB","zyrixen.db")
ADMIN_TOKEN=os.getenv("ZYRIXEN_ADMIN_TOKEN","")
app=FastAPI(title="Zyrixen API")

def connect():
 c=sqlite3.connect(DB);c.row_factory=sqlite3.Row
 c.execute("CREATE TABLE IF NOT EXISTS config(id INTEGER PRIMARY KEY CHECK(id=1),maintenance INTEGER,enabled INTEGER,notice TEXT,max_chars INTEGER)")
 c.execute("INSERT OR IGNORE INTO config VALUES(1,0,1,'Selamat datang di Zyrixen',100000)")
 c.execute("CREATE TABLE IF NOT EXISTS jobs(id INTEGER PRIMARY KEY,created INTEGER,size INTEGER,status TEXT)")
 c.commit();return c

def configuration():
 with closing(connect()) as c:return dict(c.execute("SELECT maintenance,enabled,notice,max_chars FROM config WHERE id=1").fetchone())
def auth(header):
 if not ADMIN_TOKEN:raise HTTPException(503,"Owner token belum dikonfigurasi")
 if not header or not header.startswith("Bearer ") or header[7:]!=ADMIN_TOKEN:raise HTTPException(401,"Unauthorized")

class Source(BaseModel):source:str=Field(min_length=1)
class ConfigPatch(BaseModel):
 maintenance:bool
 enabled:bool
 notice:str=Field(max_length=300)
 max_chars:int=Field(ge=100,le=500000)

@app.get("/health")
def health():return {"ok":True}
@app.get("/config")
def cfg():return configuration()
@app.post("/deobfuscate")
def deob(req:Source):
 c=configuration()
 if c["maintenance"] or not c["enabled"]:raise HTTPException(503,"Layanan nonaktif")
 if len(req.source)>c["max_chars"]:raise HTTPException(413,"Input terlalu panjang")
 result,changes=readable_lua(req.source)
 with closing(connect()) as db:
  db.execute("INSERT INTO jobs(created,size,status) VALUES(?,?,?)",(int(time.time()),len(req.source),"ok"));db.commit()
 return {"result":result,"transformations":changes,"note":"Decoder statis tahap awal; belum full deobfuscation"}
@app.get("/admin/stats")
def stats(authorization:str|None=Header(None)):
 auth(authorization)
 with closing(connect()) as c:return dict(c.execute("SELECT COUNT(*) count,COALESCE(SUM(size),0) total_chars FROM jobs").fetchone())
@app.get("/admin/config")
def admin_read(authorization:str|None=Header(None)):
 auth(authorization);return configuration()
@app.put("/admin/config")
def admin_update(patch:ConfigPatch,authorization:str|None=Header(None)):
 auth(authorization)
 with closing(connect()) as c:
  c.execute("UPDATE config SET maintenance=?,enabled=?,notice=?,max_chars=? WHERE id=1",(int(patch.maintenance),int(patch.enabled),patch.notice,patch.max_chars));c.commit()
 return configuration()
