-- deobsefactor by zyrixen
local env = getfenv()
local unpackValues = table.unpack or unpack
local function packValues(...) return {n=select("#",...), ...} end
local functions = {}

functions[1] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n = math.max(0, args.n - 0)}
    for i=1,varargs.n do varargs[i]=args[0+i] end
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            -- Original encrypted constants integrity verified during recovery.
            r[31]=(193770)
            r[32]=(293740)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=36 end
        elseif block == 36 then
            r[23]=r[8] / r[18]
            r[5]=r[16] < r[15]
            block=50
        elseif block == 50 then
            r[34] = env[("game")]
            r[33]=r[34]
            r[32] = r[33][("GetService")]
            r[34]=("Players")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]={[7]=r[32]}
            r[35] = env[("game")]
            r[34]=r[35]
            r[33] = r[34][("GetService")]
            r[35]=("RunService")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]={[7]=r[33]}
            r[34]=(216668)
            r[34]=r[31] == r[34]
            if not r[34] then block=169 else block=155 end
        elseif block == 155 then
            r[8]=r[23] * r[20]
            r[0]=r[16] / r[1]
            block=169
        elseif block == 169 then
            r[36] = env[("game")]
            r[35]=r[36]
            r[34] = r[35][("GetService")]
            r[36]=("ReplicatedStorage")
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=r[32][7]
            r[35] = r[35][("LocalPlayer")]
            r[35]={[7]=r[35]}
            r[36]={}
            r[39] = env[("getgenv")]
            r[38]=r[39]
            if not r[38] then block=281 else block=253 end
        elseif block == 253 then
            r[40] = env[("getgenv")]
            r[39]=r[40]
            do local f=r[39]; local n=0; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            block=281
        elseif block == 281 then
            r[37]=r[38]
            if r[37] then block=309 else block=295 end
        elseif block == 295 then
            r[38] = env[("_G")]
            r[37]=r[38]
            block=309
        elseif block == 309 then
            r[36][("genv")]=r[37]
            r[37]=(false)
            r[36][("cleaned")]=r[37]
            r[36]={[7]=r[36]}
            r[37]=r[36][7]
            r[37] = r[37][("genv")]
            r[37] = r[37][("AzureUnload")]
            if not r[37] then block=414 else block=365 end
        elseif block == 365 then
            r[38] = env[("pcall")]
            r[37]=r[38]
            r[38]=r[36][7]
            r[38] = r[38][("genv")]
            r[38] = r[38][("AzureUnload")]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=414
        elseif block == 414 then
            r[38]=r[34]
            r[37] = r[38][("WaitForChild")]
            r[39]=("ChickenOrHero")
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=(212195)
            r[38]=r[31] == r[38]
            if not r[38] then block=477 else block=463 end
        elseif block == 463 then
            r[3]=r[19] + r[9]
            r[8]=(false)
            block=477
        elseif block == 477 then
            r[39]=r[37]
            r[38] = r[39][("WaitForChild")]
            r[40]=("Movement")
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[40] = env[("require")]
            r[39]=r[40]
            r[41]=r[38]
            r[40] = r[41][("WaitForChild")]
            r[42]=("MovementProfiles")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=-1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            do local f=r[39]; local n=-1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[39]={[7]=r[39]}
            r[41] = env[("require")]
            r[40]=r[41]
            r[42]=r[38]
            r[41] = r[42][("WaitForChild")]
            r[43]=("BoostInput")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=-1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            do local f=r[40]; local n=-1; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[40]={[7]=r[40]}
            r[42]=r[37]
            r[41] = r[42][("WaitForChild")]
            r[43]=("Game")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41]={[7]=r[41]}
            r[44]=r[41][7]
            r[43]=r[44]
            r[42] = r[43][("WaitForChild")]
            r[44]=("Session")
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]={[7]=r[42]}
            r[44] = env[("require")]
            r[43]=r[44]
            r[46]=r[41][7]
            r[45]=r[46]
            r[44] = r[45][("WaitForChild")]
            r[46]=("ContactCatchConfig")
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=-1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            do local f=r[43]; local n=-1; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[43]={[7]=r[43]}
            r[45] = env[("require")]
            r[44]=r[45]
            r[47]=r[41][7]
            r[46]=r[47]
            r[45] = r[46][("WaitForChild")]
            r[47]=("TacklePrediction")
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=-1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            do local f=r[44]; local n=-1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[44]={[7]=r[44]}
            r[45]=(255485)
            r[45]=r[31] == r[45]
            if not r[45] then block=869 else block=841 end
        elseif block == 841 then
            r[0]=r[5] * r[3]
            r[9]=r[15]
            r[3]=r[1][(216668)]
            r[23]=r[1] * r[19]
            block=869
        elseif block == 869 then
            r[47]=r[41][7]
            r[46]=r[47]
            r[45] = r[46][("WaitForChild")]
            r[47]=("MeleeEvent")
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[45]={[7]=r[45]}
            r[47] = env[("require")]
            r[46]=r[47]
            r[49]=r[41][7]
            r[48]=r[49]
            r[47] = r[48][("WaitForChild")]
            r[49]=("RescueConfig")
            do local f=r[47]; local n=2; if n<0 then n=top-47-1 end; local m=-1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            do local f=r[46]; local n=-1; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[47]=(203066)
            r[47]=r[31] == r[47]
            if not r[47] then block=995 else block=988 end
        elseif block == 988 then
            r[4]=r[20] == r[11]
            block=995
        elseif block == 995 then
            r[48] = env[("math")]
            r[48] = r[48][("max")]
            r[47]=r[48]
            r[48]=(3)
            r[51] = env[("tonumber")]
            r[50]=r[51]
            r[51] = r[46][("Range")]
            do local f=r[50]; local n=1; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[49]=r[50]
            if r[49] then block=1079 else block=1065 end
        elseif block == 1065 then
            r[50]=(6)
            r[49]=r[50]
            block=1079
        elseif block == 1079 then
            do local f=r[47]; local n=2; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[47] = r[47] - (0.25)
            r[47]={[7]=r[47]}
            r[49] = env[("math")]
            r[49] = r[49][("max")]
            r[48]=r[49]
            r[49]=(0.1)
            r[52] = env[("tonumber")]
            r[51]=r[52]
            r[52] = r[46][("HoldSeconds")]
            do local f=r[51]; local n=1; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[50]=r[51]
            if r[50] then block=1184 else block=1170 end
        elseif block == 1170 then
            r[51]=(1.2)
            r[50]=r[51]
            block=1184
        elseif block == 1184 then
            do local f=r[48]; local n=2; if n<0 then n=top-48-1 end; local m=1; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            r[48]={[7]=r[48]}
            r[49]=(244390)
            r[49]=r[31] == r[49]
            if not r[49] then block=1233 else block=1219 end
        elseif block == 1219 then
            r[20]=r[4] + r[7]
            r[14]=r[24] == r[17]
            block=1233
        elseif block == 1233 then
            r[50] = env[("math")]
            r[50] = r[50][("max")]
            r[49]=r[50]
            r[50]=(0.1)
            r[53] = env[("tonumber")]
            r[52]=r[53]
            r[53] = r[46][("FinishGrace")]
            do local f=r[52]; local n=1; if n<0 then n=top-52-1 end; local m=1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            r[51]=r[52]
            if r[51] then block=1317 else block=1303 end
        elseif block == 1303 then
            r[52]=(0.5)
            r[51]=r[52]
            block=1317
        elseif block == 1317 then
            do local f=r[49]; local n=2; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[49]={[7]=r[49]}
            r[50]=(264368)
            r[50]=r[31] == r[50]
            if not r[50] then block=1366 else block=1352 end
        elseif block == 1352 then
            r[18]=env[("_G")]
            r[14]=r[24][("_G")]
            block=1366
        elseif block == 1366 then
            r[52]=r[41][7]
            r[51]=r[52]
            r[50] = r[51][("WaitForChild")]
            r[52]=("RescueEvent")
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[50]={[7]=r[50]}
            r[52]=r[37]
            r[51] = r[52][("WaitForChild")]
            r[53]=("Gear")
            do local f=r[51]; local n=2; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[53] = env[("require")]
            r[52]=r[53]
            r[54]=r[51]
            r[53] = r[54][("WaitForChild")]
            r[55]=("GearCatalog")
            do local f=r[53]; local n=2; if n<0 then n=top-53-1 end; local m=-1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            do local f=r[52]; local n=-1; if n<0 then n=top-52-1 end; local m=1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            r[53]=(274774)
            r[53]=r[31] == r[53]
            if not r[53] then block=1513 else block=1506 end
        elseif block == 1506 then
            r[10][r[25]]=r[8]
            block=1513
        elseif block == 1513 then
            r[56]=r[37]
            r[55] = r[56][("WaitForChild")]
            r[57]=("Weapons")
            do local f=r[55]; local n=2; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[54]=r[55]
            r[53] = r[54][("WaitForChild")]
            r[55]=("ArmoryEvent")
            do local f=r[53]; local n=2; if n<0 then n=top-53-1 end; local m=1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            r[53]={[7]=r[53]}
            r[54]=(219746)
            r[54]=r[31] == r[54]
            if not r[54] then block=1625 else block=1597 end
        elseif block == 1597 then
            r[12]=r[19] < r[18]
            r[19]=env[("ReplicatedStorage")]
            r[24]=r[2]
            do local f=r[14]; local n=11; if n<0 then n=top-14-1 end; local m=20; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            block=1625
        elseif block == 1625 then
            r[54]={}
            r[55]=(true)
            r[54][("runnerEnabled")]=r[55]
            r[55]=(false)
            r[54][("customSpeed")]=r[55]
            r[55]=(1)
            r[54][("speedMultiplier")]=r[55]
            r[55]=(true)
            r[54][("autoGems")]=r[55]
            r[55]=(0.25)
            r[54][("gemScanInterval")]=r[55]
            r[55]=(220)
            r[54][("gemMaxDistance")]=r[55]
            r[55]=(4.5)
            r[54][("gemCollectDistance")]=r[55]
            r[55]=(true)
            r[54][("autoRevive")]=r[55]
            r[55]=(true)
            r[54][("reviveBeforeGems")]=r[55]
            r[55]=(220)
            r[54][("reviveMaxDistance")]=r[55]
            r[55]=(true)
            r[54][("avoidCatchers")]=r[55]
            r[55]=(0.65)
            r[54][("predictionTime")]=r[55]
            r[55]=(2.2)
            r[54][("avoidStrength")]=r[55]
            r[55]=(15)
            r[54][("panicDistance")]=r[55]
            r[55]=(0.52)
            r[54][("safezoneDepthRatio")]=r[55]
            r[55]=(0.44)
            r[54][("safezoneValidationRatio")]=r[55]
            r[55]=(4.5)
            r[54][("safezoneEdgeMargin")]=r[55]
            r[55]=(12)
            r[54][("edgeRayHeight")]=r[55]
            r[55]=(52)
            r[54][("edgeRayDepth")]=r[55]
            r[55]=(14)
            r[54][("edgeLookAhead")]=r[55]
            r[55]=(28)
            r[54][("edgeSecondLookAhead")]=r[55]
            r[55]=(true)
            r[54][("autoDash")]=r[55]
            r[55]=(0.85)
            r[54][("dashCooldown")]=r[55]
            r[55]=(true)
            r[54][("smoothMovement")]=r[55]
            r[55]=(9)
            r[54][("turnRate")]=r[55]
            r[55]=(true)
            r[54][("emergencySafeZone")]=r[55]
            r[55]=(true)
            r[54][("showGoal")]=r[55]
            r[55]=(true)
            r[54][("showThreats")]=r[55]
            r[55]=(true)
            r[54][("showHitboxes")]=r[55]
            r[55]=(true)
            r[54][("catcherChase")]=r[55]
            r[55]=(false)
            r[54][("catcherCustomSpeed")]=r[55]
            r[55]=(1)
            r[54][("catcherSpeedMultiplier")]=r[55]
            r[55]=(0.45)
            r[54][("catcherPrediction")]=r[55]
            r[55]=(6)
            r[54][("catcherSmoothing")]=r[55]
            r[55]=(true)
            r[54][("smartPriority")]=r[55]
            r[55]=("Smart")
            r[54][("catcherAttackPriority")]=r[55]
            r[55]=(true)
            r[54][("autoTackle")]=r[55]
            r[55]=(12)
            r[54][("tackleRange")]=r[55]
            r[55]=(1.2)
            r[54][("tackleCooldown")]=r[55]
            r[55]=(true)
            r[54][("autoMelee")]=r[55]
            r[55]=(9)
            r[54][("meleeRange")]=r[55]
            r[55]=(0.35)
            r[54][("meleeCooldown")]=r[55]
            r[55]=(true)
            r[54][("smoothTurn")]=r[55]
            r[55]=(14)
            r[54][("turnRateCatcher")]=r[55]
            r[55]=(true)
            r[54][("followTarget")]=r[55]
            r[55]=(0.25)
            r[54][("cameraResponse")]=r[55]
            r[55]=(true)
            r[54][("notifications")]=r[55]
            r[54]={[7]=r[54]}
            r[55]=(215851)
            r[55]=r[31] == r[55]
            if not r[55] then block=2339 else block=2318 end
        elseif block == 2318 then
            r[20]=("_G")
            r[8]=r[17] - r[6]
            r[18]=r[14] < r[2]
            block=2339
        elseif block == 2339 then
            r[55]={}
            r[56]=nil
            r[55][("profile")]=r[56]
            r[56]=nil
            r[55][("profileRole")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("safeCheckAt")]=r[56]
            r[56]=nil
            r[55][("safeCheckPosition")]=r[56]
            r[56]=(false)
            r[55][("safeCheckA")]=r[56]
            r[56]=(false)
            r[55][("safeCheckB")]=r[56]
            r[56]=(false)
            r[55][("routeActive")]=r[56]
            r[56]=(false)
            r[55][("routeComplete")]=r[56]
            r[56]=nil
            r[55][("routeStartSide")]=r[56]
            r[56]=nil
            r[55][("routeTargetSide")]=r[56]
            r[56]=nil
            r[55][("routeCompletePosition")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("routeCompleteAt")]=r[56]
            r[56]=nil
            r[55][("goal")]=r[56]
            r[56]=nil
            r[55][("goalSide")]=r[56]
            r[56]=("SafeZone")
            r[55][("goalMode")]=r[56]
            r[56]=nil
            r[55][("assistMode")]=r[56]
            r[56]=nil
            r[55][("assistTarget")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("assistSince")]=r[56]
            r[56]=nil
            r[55][("gemTarget")]=r[56]
            r[56]={}
            r[55][("gemIgnored")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("gemScanAt")]=r[56]
            r[56]=nil
            r[55][("reviveTarget")]=r[56]
            r[56]=(false)
            r[55][("reviveStarted")]=r[56]
            r[56]=(0)
            r[55][("reviveStartAt")]=r[56]
            r[56]={}
            r[55][("catchers")]=r[56]
            r[56]=(0)
            r[55][("catcherCacheAt")]=r[56]
            r[56]={}
            r[55][("threats")]=r[56]
            r[56]=(0)
            r[55][("threatAt")]=r[56]
            r[56]={}
            r[55][("threatHistory")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("dashAt")]=r[56]
            r[56]=("idle")
            r[55][("dashStatus")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("dashLastRequestAt")]=r[56]
            r[56]=nil
            r[55][("dashLastCount")]=r[56]
            r[56]=(0)
            r[55][("ping")]=r[56]
            r[56]=(0)
            r[55][("pingAt")]=r[56]
            r[56]={}
            r[57]=(false)
            r[56][("loaded")]=r[57]
            r[57]={}
            r[56][("abilities")]=r[57]
            r[55][("armory")]=r[56]
            r[56]={}
            r[55][("catcherTargets")]=r[56]
            r[56]=(0)
            r[55][("catcherTargetAt")]=r[56]
            r[56]=nil
            r[55][("catcherTarget")]=r[56]
            r[56]=(false)
            r[55][("edgeRisk")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("edgeDirection")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("edgeCheckAt")]=r[56]
            r[56]=nil
            r[55][("edgeCheckPosition")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("edgeCheckDirection")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("edgeCheckGoal")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("edgeRecoveryAt")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("edgeRecoveryDirection")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("edgeRecoveryUntil")]=r[56]
            r[56]=(false)
            r[55][("stuck")]=r[56]
            r[57] = env[("os")]
            r[57] = r[57][("clock")]
            r[56]=r[57]
            do local f=r[56]; local n=0; if n<0 then n=top-56-1 end; local m=1; if m==1 then r[56]=f(unpackValues(r,57,56+n)); top=57 elseif m==0 then f(unpackValues(r,57,56+n)); top=56 else local result=packValues(f(unpackValues(r,57,56+n))); if m<0 then m=result.n end; for i=1,m do r[56+i-1]=result[i] end; top=56+m end end
            r[55][("lastMove")]=r[56]
            r[56]=nil
            r[55][("lastMovePosition")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("stuckRecoveryUntil")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("stuckRecoveryDirection")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("catcherPath")]=r[56]
            r[56]={}
            r[55][("catcherVelocity")]=r[56]
            r[56]=(0)
            r[55][("meleeId")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("lastMelee")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("lastTackle")]=r[56]
            r[56] = env[("Vector3")]
            r[56] = r[56][("zero")]
            r[55][("path")]=r[56]
            r[56] = env[("math")]
            r[56] = r[56][("huge")]
            r[56]=-r[56]
            r[55][("mapCacheAt")]=r[56]
            r[56]=nil
            r[55][("mapCache")]=r[56]
            r[56]=(0)
            r[55][("utilityTick")]=r[56]
            r[55]={[7]=r[55]}
            r[56]={}
            r[57]=nil
            r[56][("map")]=r[57]
            r[57]=nil
            r[56][("a")]=r[57]
            r[57]=nil
            r[56][("b")]=r[57]
            r[57]=(false)
            r[56][("cached")]=r[57]
            r[56]={[7]=r[56]}
            r[57]={}
            r[58]=nil
            r[57][("goal")]=r[58]
            r[58]={}
            r[57][("threats")]=r[58]
            r[58]={}
            r[57][("hitboxes")]=r[58]
            r[57]={[7]=r[57]}
            r[58]={[7]=r[58]}
            do local captures = {}
            r[59]=function(...) return functions[2](captures, ...) end
            end
            r[58][7]=r[59]
            r[59]={[7]=r[59]}
            do local captures = {}
            captures[1] = r[35]
            r[60]=function(...) return functions[3](captures, ...) end
            end
            r[59][7]=r[60]
            r[60]={[7]=r[60]}
            do local captures = {}
            captures[1] = r[59]
            r[61]=function(...) return functions[4](captures, ...) end
            end
            r[60][7]=r[61]
            r[61]={[7]=r[61]}
            do local captures = {}
            captures[1] = r[59]
            r[62]=function(...) return functions[5](captures, ...) end
            end
            r[61][7]=r[62]
            r[62]={[7]=r[62]}
            do local captures = {}
            captures[1] = r[35]
            r[63]=function(...) return functions[6](captures, ...) end
            end
            r[62][7]=r[63]
            r[63]={[7]=r[63]}
            do local captures = {}
            captures[1] = r[35]
            r[64]=function(...) return functions[7](captures, ...) end
            end
            r[63][7]=r[64]
            r[64]=(274109)
            r[64]=r[31] == r[64]
            if not r[64] then block=3795 else block=3774 end
        elseif block == 3774 then
            r[9]=r[14] .. r[23]
            r[14][r[17]]=r[20]
            r[5]=r[13][r[18]]
            block=3795
        elseif block == 3795 then
            r[64]={[7]=r[64]}
            do local captures = {}
            captures[1] = r[35]
            captures[2] = r[62]
            captures[3] = r[63]
            r[65]=function(...) return functions[8](captures, ...) end
            end
            r[64][7]=r[65]
            r[65]={[7]=r[65]}
            do local captures = {}
            captures[1] = r[35]
            captures[2] = r[62]
            captures[3] = r[63]
            r[66]=function(...) return functions[9](captures, ...) end
            end
            r[65][7]=r[66]
            r[66]={[7]=r[66]}
            do local captures = {}
            captures[1] = r[35]
            captures[2] = r[42]
            captures[3] = r[59]
            captures[4] = r[60]
            r[67]=function(...) return functions[10](captures, ...) end
            end
            r[66][7]=r[67]
            r[67]={[7]=r[67]}
            do local captures = {}
            captures[1] = r[62]
            captures[2] = r[55]
            captures[3] = r[39]
            captures[4] = r[35]
            r[68]=function(...) return functions[11](captures, ...) end
            end
            r[67][7]=r[68]
            r[68]={[7]=r[68]}
            do local captures = {}
            captures[1] = r[67]
            captures[2] = r[54]
            r[69]=function(...) return functions[12](captures, ...) end
            end
            r[68][7]=r[69]
            r[69]=(234414)
            r[69]=r[31] == r[69]
            if not r[69] then block=3942 else block=3921 end
        elseif block == 3921 then
            r[17]=r[7] - r[15]
            r[19]=env[(293740)]
            r[22]=r[19] == r[4]
            block=3942
        elseif block == 3942 then
            r[69]={[7]=r[69]}
            do local captures = {}
            captures[1] = r[67]
            captures[2] = r[54]
            r[70]=function(...) return functions[13](captures, ...) end
            end
            r[69][7]=r[70]
            r[70]={[7]=r[70]}
            do local captures = {}
            captures[1] = r[60]
            captures[2] = r[59]
            r[71]=function(...) return functions[14](captures, ...) end
            end
            r[70][7]=r[71]
            r[71]={[7]=r[71]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[35]
            r[72]=function(...) return functions[15](captures, ...) end
            end
            r[71][7]=r[72]
            r[72]={[7]=r[72]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[41]
            r[73]=function(...) return functions[17](captures, ...) end
            end
            r[72][7]=r[73]
            r[73]={}
            r[74]=nil
            r[73][("map")]=r[74]
            r[74]=nil
            r[73][("field")]=r[74]
            r[74]=nil
            r[73][("invisWall")]=r[74]
            r[74]=nil
            r[73][("params")]=r[74]
            r[74]=nil
            r[73][("wallParams")]=r[74]
            r[73]={[7]=r[73]}
            r[74]={[7]=r[74]}
            do local captures = {}
            r[75]=function(...) return functions[18](captures, ...) end
            end
            r[74][7]=r[75]
            r[75]={[7]=r[75]}
            do local captures = {}
            r[76]=function(...) return functions[19](captures, ...) end
            end
            r[75][7]=r[76]
            r[76]=(203467)
            r[76]=r[31] == r[76]
            if not r[76] then block=4187 else block=4173 end
        elseif block == 4173 then
            r[6]=r[7] < r[12]
            r[17]=r[16][r[19]]
            block=4187
        elseif block == 4187 then
            r[76]={[7]=r[76]}
            do local captures = {}
            captures[1] = r[72]
            captures[2] = r[74]
            captures[3] = r[75]
            captures[4] = r[73]
            r[77]=function(...) return functions[20](captures, ...) end
            end
            r[76][7]=r[77]
            r[77]={[7]=r[77]}
            do local captures = {}
            captures[1] = r[76]
            captures[2] = r[73]
            r[78]=function(...) return functions[21](captures, ...) end
            end
            r[77][7]=r[78]
            r[78]={[7]=r[78]}
            do local captures = {}
            captures[1] = r[76]
            captures[2] = r[73]
            r[79]=function(...) return functions[22](captures, ...) end
            end
            r[78][7]=r[79]
            r[79]={[7]=r[79]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[78]
            r[80]=function(...) return functions[23](captures, ...) end
            end
            r[79][7]=r[80]
            r[80]={[7]=r[80]}
            do local captures = {}
            captures[1] = r[72]
            captures[2] = r[77]
            captures[3] = r[54]
            r[81]=function(...) return functions[24](captures, ...) end
            end
            r[80][7]=r[81]
            r[81]={[7]=r[81]}
            do local captures = {}
            captures[1] = r[80]
            r[82]=function(...) return functions[25](captures, ...) end
            end
            r[81][7]=r[82]
            r[82]={[7]=r[82]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[81]
            r[83]=function(...) return functions[26](captures, ...) end
            end
            r[82][7]=r[83]
            r[83]={[7]=r[83]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[79]
            captures[3] = r[82]
            r[84]=function(...) return functions[27](captures, ...) end
            end
            r[83][7]=r[84]
            r[84]={[7]=r[84]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[83]
            captures[3] = r[54]
            r[85]=function(...) return functions[28](captures, ...) end
            end
            r[84][7]=r[85]
            r[85]={[7]=r[85]}
            do local captures = {}
            r[86]=function(...) return functions[29](captures, ...) end
            end
            r[85][7]=r[86]
            r[86]={[7]=r[86]}
            do local captures = {}
            captures[1] = r[56]
            r[87]=function(...) return functions[30](captures, ...) end
            end
            r[86][7]=r[87]
            r[87]={[7]=r[87]}
            do local captures = {}
            captures[1] = r[79]
            captures[2] = r[81]
            captures[3] = r[58]
            captures[4] = r[82]
            r[88]=function(...) return functions[31](captures, ...) end
            end
            r[87][7]=r[88]
            r[88]={[7]=r[88]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[55]
            captures[3] = r[87]
            captures[4] = r[84]
            captures[5] = r[86]
            captures[6] = r[85]
            captures[7] = r[82]
            r[89]=function(...) return functions[32](captures, ...) end
            end
            r[88][7]=r[89]
            r[89]={[7]=r[89]}
            do local captures = {}
            r[90]=function(...) return functions[34](captures, ...) end
            end
            r[89][7]=r[90]
            r[90]={[7]=r[90]}
            do local captures = {}
            r[91]=function(...) return functions[35](captures, ...) end
            end
            r[90][7]=r[91]
            r[91]={[7]=r[91]}
            do local captures = {}
            captures[1] = r[90]
            r[92]=function(...) return functions[37](captures, ...) end
            end
            r[91][7]=r[92]
            r[92]={[7]=r[92]}
            do local captures = {}
            captures[1] = r[72]
            captures[2] = r[56]
            captures[3] = r[91]
            captures[4] = r[89]
            r[93]=function(...) return functions[38](captures, ...) end
            end
            r[92][7]=r[93]
            r[93]=(228655)
            r[93]=r[31] == r[93]
            if not r[93] then block=4593 else block=4565 end
        elseif block == 4565 then
            r[15][r[5]]=r[16]
            r[22]=r[22][r[10]]
            r[20]=("Session")
            r[12]=r[8] < r[25]
            block=4593
        elseif block == 4593 then
            r[93]={[7]=r[93]}
            do local captures = {}
            r[94]=function(...) return functions[39](captures, ...) end
            end
            r[93][7]=r[94]
            r[94]={[7]=r[94]}
            do local captures = {}
            captures[1] = r[58]
            r[95]=function(...) return functions[40](captures, ...) end
            end
            r[94][7]=r[95]
            r[95]={[7]=r[95]}
            do local captures = {}
            r[96]=function(...) return functions[41](captures, ...) end
            end
            r[95][7]=r[96]
            r[96]={[7]=r[96]}
            do local captures = {}
            captures[1] = r[94]
            captures[2] = r[95]
            captures[3] = r[54]
            captures[4] = r[83]
            r[97]=function(...) return functions[42](captures, ...) end
            end
            r[96][7]=r[97]
            r[97]={[7]=r[97]}
            do local captures = {}
            captures[1] = r[93]
            captures[2] = r[94]
            captures[3] = r[95]
            captures[4] = r[54]
            captures[5] = r[58]
            captures[6] = r[81]
            r[98]=function(...) return functions[43](captures, ...) end
            end
            r[97][7]=r[98]
            r[98]={[7]=r[98]}
            do local captures = {}
            r[99]=function(...) return functions[44](captures, ...) end
            end
            r[98][7]=r[99]
            r[99]={[7]=r[99]}
            do local captures = {}
            captures[1] = r[93]
            captures[2] = r[58]
            r[100]=function(...) return functions[45](captures, ...) end
            end
            r[99][7]=r[100]
            r[100]={[7]=r[100]}
            do local captures = {}
            captures[1] = r[92]
            captures[2] = r[56]
            captures[3] = r[55]
            captures[4] = r[99]
            captures[5] = r[96]
            captures[6] = r[98]
            r[101]=function(...) return functions[46](captures, ...) end
            end
            r[100][7]=r[101]
            r[101]={[7]=r[101]}
            do local captures = {}
            captures[1] = r[92]
            captures[2] = r[56]
            captures[3] = r[55]
            captures[4] = r[100]
            captures[5] = r[58]
            captures[6] = r[97]
            captures[7] = r[96]
            captures[8] = r[98]
            r[102]=function(...) return functions[47](captures, ...) end
            end
            r[101][7]=r[102]
            r[102]={[7]=r[102]}
            do local captures = {}
            captures[1] = r[92]
            captures[2] = r[56]
            captures[3] = r[55]
            captures[4] = r[93]
            captures[5] = r[96]
            captures[6] = r[98]
            r[103]=function(...) return functions[48](captures, ...) end
            end
            r[102][7]=r[103]
            r[103]={[7]=r[103]}
            do local captures = {}
            r[104]=function(...) return functions[49](captures, ...) end
            end
            r[103][7]=r[104]
            r[104]=(212418)
            r[104]=r[31] == r[104]
            if not r[104] then block=4873 else block=4845 end
        elseif block == 4845 then
            r[24][r[6]]=r[23]
            r[1]=("genv")
            r[1]=r[0] < r[24]
            r[18]=r[7] == r[8]
            block=4873
        elseif block == 4873 then
            r[104]={[7]=r[104]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[54]
            captures[3] = r[103]
            captures[4] = r[58]
            r[105]=function(...) return functions[50](captures, ...) end
            end
            r[104][7]=r[105]
            r[105]={[7]=r[105]}
            do local captures = {}
            captures[1] = r[32]
            captures[2] = r[35]
            captures[3] = r[58]
            captures[4] = r[54]
            r[106]=function(...) return functions[52](captures, ...) end
            end
            r[105][7]=r[106]
            r[106]={[7]=r[106]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[50]
            r[107]=function(...) return functions[53](captures, ...) end
            end
            r[106][7]=r[107]
            r[107]={[7]=r[107]}
            do local captures = {}
            captures[1] = r[61]
            r[108]=function(...) return functions[55](captures, ...) end
            end
            r[107][7]=r[108]
            r[108]={[7]=r[108]}
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[106]
            captures[3] = r[55]
            captures[4] = r[61]
            captures[5] = r[105]
            captures[6] = r[58]
            captures[7] = r[47]
            captures[8] = r[107]
            captures[9] = r[50]
            captures[10] = r[48]
            captures[11] = r[49]
            r[109]=function(...) return functions[57](captures, ...) end
            end
            r[108][7]=r[109]
            r[109]={[7]=r[109]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[32]
            captures[3] = r[35]
            r[110]=function(...) return functions[60](captures, ...) end
            end
            r[109][7]=r[110]
            r[110]=(247512)
            r[110]=r[31] == r[110]
            if not r[110] then block=5034 else block=5020 end
        elseif block == 5020 then
            do local f=r[20]; local n=10; if n<0 then n=top-20-1 end; local m=14; if m==1 then r[20]=f(unpackValues(r,21,20+n)); top=21 elseif m==0 then f(unpackValues(r,21,20+n)); top=20 else local result=packValues(f(unpackValues(r,21,20+n))); if m<0 then m=result.n end; for i=1,m do r[20+i-1]=result[i] end; top=20+m end end
            r[15]=r[3] - r[24]
            block=5034
        elseif block == 5034 then
            r[110]={[7]=r[110]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[61]
            captures[3] = r[58]
            captures[4] = r[68]
            captures[5] = r[54]
            captures[6] = r[43]
            r[111]=function(...) return functions[61](captures, ...) end
            end
            r[110][7]=r[111]
            r[111]={[7]=r[111]}
            do local captures = {}
            r[112]=function(...) return functions[64](captures, ...) end
            end
            r[111][7]=r[112]
            r[112]={[7]=r[112]}
            do local captures = {}
            captures[1] = r[68]
            captures[2] = r[58]
            r[113]=function(...) return functions[65](captures, ...) end
            end
            r[112][7]=r[113]
            r[113]={[7]=r[113]}
            do local captures = {}
            captures[1] = r[58]
            r[114]=function(...) return functions[66](captures, ...) end
            end
            r[113][7]=r[114]
            r[114]={[7]=r[114]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[54]
            captures[3] = r[113]
            captures[4] = r[111]
            captures[5] = r[55]
            captures[6] = r[86]
            captures[7] = r[112]
            captures[8] = r[79]
            r[115]=function(...) return functions[67](captures, ...) end
            end
            r[114][7]=r[115]
            r[115]={[7]=r[115]}
            do local captures = {}
            captures[1] = r[58]
            captures[2] = r[61]
            captures[3] = r[113]
            captures[4] = r[111]
            captures[5] = r[112]
            r[116]=function(...) return functions[68](captures, ...) end
            end
            r[115][7]=r[116]
            r[116]=(259352)
            r[116]=r[31] == r[116]
            if not r[116] then block=5188 else block=5181 end
        elseif block == 5181 then
            r[14]=#r[10]
            block=5188
        elseif block == 5188 then
            r[116]={[7]=r[116]}
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[64]
            captures[3] = r[59]
            captures[4] = r[61]
            captures[5] = r[55]
            captures[6] = r[40]
            captures[7] = r[35]
            captures[8] = r[60]
            captures[9] = r[58]
            r[117]=function(...) return functions[69](captures, ...) end
            end
            r[116][7]=r[117]
            r[117]={[7]=r[117]}
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[64]
            captures[3] = r[55]
            r[118]=function(...) return functions[70](captures, ...) end
            end
            r[117][7]=r[118]
            r[118]={[7]=r[118]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[101]
            captures[3] = r[54]
            captures[4] = r[102]
            r[119]=function(...) return functions[71](captures, ...) end
            end
            r[118][7]=r[119]
            r[119]={[7]=r[119]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[58]
            r[120]=function(...) return functions[72](captures, ...) end
            end
            r[119][7]=r[120]
            r[120]={[7]=r[120]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[58]
            captures[3] = r[54]
            r[121]=function(...) return functions[73](captures, ...) end
            end
            r[120][7]=r[121]
            r[121]={[7]=r[121]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[61]
            captures[3] = r[58]
            captures[4] = r[54]
            captures[5] = r[105]
            captures[6] = r[104]
            r[122]=function(...) return functions[74](captures, ...) end
            end
            r[121][7]=r[122]
            r[122]={[7]=r[122]}
            do local captures = {}
            captures[1] = r[64]
            captures[2] = r[55]
            captures[3] = r[106]
            captures[4] = r[54]
            captures[5] = r[61]
            captures[6] = r[60]
            captures[7] = r[66]
            captures[8] = r[71]
            captures[9] = r[92]
            captures[10] = r[109]
            captures[11] = r[118]
            captures[12] = r[56]
            captures[13] = r[58]
            captures[14] = r[93]
            captures[15] = r[102]
            captures[16] = r[121]
            captures[17] = r[47]
            captures[18] = r[108]
            captures[19] = r[119]
            captures[20] = r[110]
            captures[21] = r[120]
            captures[22] = r[101]
            captures[23] = r[114]
            captures[24] = r[111]
            captures[25] = r[112]
            captures[26] = r[88]
            captures[27] = r[86]
            captures[28] = r[85]
            captures[29] = r[82]
            captures[30] = r[117]
            captures[31] = r[115]
            captures[32] = r[116]
            r[123]=function(...) return functions[75](captures, ...) end
            end
            r[122][7]=r[123]
            r[123]=(282212)
            r[123]=r[31] == r[123]
            if not r[123] then block=5377 else block=5356 end
        elseif block == 5356 then
            r[11]=r[2] .. r[7]
            r[22]=r[0] .. r[25]
            r[14][r[8]]=r[16]
            block=5377
        elseif block == 5377 then
            r[123]={[7]=r[123]}
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[32]
            captures[3] = r[35]
            r[124]=function(...) return functions[76](captures, ...) end
            end
            r[123][7]=r[124]
            r[124]={[7]=r[124]}
            do local captures = {}
            captures[1] = r[61]
            captures[2] = r[55]
            captures[3] = r[58]
            captures[4] = r[54]
            r[125]=function(...) return functions[77](captures, ...) end
            end
            r[124][7]=r[125]
            r[125]=(256302)
            r[125]=r[31] == r[125]
            if not r[125] then block=5461 else block=5440 end
        elseif block == 5440 then
            r[21]=r[0][r[17]]
            r[25]=env[("ReplicatedStorage")]
            r[13]=r[25] + r[24]
            block=5461
        elseif block == 5461 then
            r[125]={[7]=r[125]}
            do local captures = {}
            captures[1] = r[92]
            captures[2] = r[61]
            captures[3] = r[93]
            captures[4] = r[56]
            r[126]=function(...) return functions[78](captures, ...) end
            end
            r[125][7]=r[126]
            r[126]={[7]=r[126]}
            do local captures = {}
            captures[1] = r[123]
            captures[2] = r[55]
            captures[3] = r[69]
            captures[4] = r[61]
            captures[5] = r[124]
            captures[6] = r[54]
            captures[7] = r[58]
            captures[8] = r[125]
            r[127]=function(...) return functions[79](captures, ...) end
            end
            r[126][7]=r[127]
            r[127]={[7]=r[127]}
            do local captures = {}
            captures[1] = r[59]
            r[128]=function(...) return functions[80](captures, ...) end
            end
            r[127][7]=r[128]
            r[128]=(293278)
            r[128]=r[31] == r[128]
            if not r[128] then block=5566 else block=5545 end
        elseif block == 5545 then
            r[7]=r[20] - r[14]
            r[7]=r[24] < r[9]
            r[0][r[7]]=r[23]
            block=5566
        elseif block == 5566 then
            r[128]={[7]=r[128]}
            do local captures = {}
            captures[1] = r[127]
            captures[2] = r[61]
            captures[3] = r[124]
            captures[4] = r[43]
            captures[5] = r[55]
            captures[6] = r[54]
            captures[7] = r[58]
            captures[8] = r[44]
            captures[9] = r[45]
            r[129]=function(...) return functions[81](captures, ...) end
            end
            r[128][7]=r[129]
            r[129]={[7]=r[129]}
            do local captures = {}
            captures[1] = r[65]
            captures[2] = r[55]
            captures[3] = r[61]
            captures[4] = r[60]
            captures[5] = r[71]
            captures[6] = r[126]
            captures[7] = r[124]
            captures[8] = r[54]
            captures[9] = r[58]
            captures[10] = r[128]
            r[130]=function(...) return functions[82](captures, ...) end
            end
            r[129][7]=r[130]
            r[130]={[7]=r[130]}
            do local captures = {}
            r[131]=function(...) return functions[83](captures, ...) end
            end
            r[130][7]=r[131]
            r[131]={[7]=r[131]}
            do local captures = {}
            captures[1] = r[57]
            r[132]=function(...) return functions[84](captures, ...) end
            end
            r[131][7]=r[132]
            r[132]=(194769)
            r[132]=r[31] == r[132]
            if not r[132] then block=5685 else block=5671 end
        elseif block == 5671 then
            r[25]=r[20] / r[22]
            r[10]=r[6] * r[10]
            block=5685
        elseif block == 5685 then
            r[132]={[7]=r[132]}
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[64]
            captures[3] = r[61]
            captures[4] = r[110]
            captures[5] = r[130]
            captures[6] = r[57]
            captures[7] = r[55]
            captures[8] = r[62]
            captures[9] = r[32]
            captures[10] = r[35]
            captures[11] = r[43]
            r[133]=function(...) return functions[85](captures, ...) end
            end
            r[132][7]=r[133]
            r[135]=r[53][7]
            r[135] = r[135][("OnClientEvent")]
            r[134]=r[135]
            r[133] = r[134][("Connect")]
            do local captures = {}
            captures[1] = r[55]
            r[135]=function(...) return functions[86](captures, ...) end
            end
            do local f=r[133]; local n=2; if n<0 then n=top-133-1 end; local m=0; if m==1 then r[133]=f(unpackValues(r,134,133+n)); top=134 elseif m==0 then f(unpackValues(r,134,133+n)); top=133 else local result=packValues(f(unpackValues(r,134,133+n))); if m<0 then m=result.n end; for i=1,m do r[133+i-1]=result[i] end; top=133+m end end
            r[133]=(273286)
            r[133]=r[31] == r[133]
            if not r[133] then block=5797 else block=5769 end
        elseif block == 5769 then
            r[14][("Game")]=r[25]
            r[17]=("getgenv")
            r[25]=r[12] .. r[15]
            r[12]=r[13] + r[14]
            block=5797
        elseif block == 5797 then
            r[135]=r[50][7]
            r[135] = r[135][("OnClientEvent")]
            r[134]=r[135]
            r[133] = r[134][("Connect")]
            do local captures = {}
            captures[1] = r[55]
            r[135]=function(...) return functions[87](captures, ...) end
            end
            do local f=r[133]; local n=2; if n<0 then n=top-133-1 end; local m=0; if m==1 then r[133]=f(unpackValues(r,134,133+n)); top=134 elseif m==0 then f(unpackValues(r,134,133+n)); top=133 else local result=packValues(f(unpackValues(r,134,133+n))); if m<0 then m=result.n end; for i=1,m do r[133+i-1]=result[i] end; top=133+m end end
            r[135]=r[35][7]
            r[135] = r[135][("CharacterAdded")]
            r[134]=r[135]
            r[133] = r[134][("Connect")]
            do local captures = {}
            captures[1] = r[55]
            r[135]=function(...) return functions[88](captures, ...) end
            end
            do local f=r[133]; local n=2; if n<0 then n=top-133-1 end; local m=0; if m==1 then r[133]=f(unpackValues(r,134,133+n)); top=134 elseif m==0 then f(unpackValues(r,134,133+n)); top=133 else local result=packValues(f(unpackValues(r,134,133+n))); if m<0 then m=result.n end; for i=1,m do r[133+i-1]=result[i] end; top=133+m end end
            r[133]=(257942)
            r[133]=r[31] == r[133]
            if not r[133] then block=5930 else block=5902 end
        elseif block == 5902 then
            r[25]=r[25][("Movement")]
            r[16]=r[16] / r[19]
            r[7]=r[3] < r[24]
            r[23]=r[20] == r[14]
            block=5930
        elseif block == 5930 then
            r[134] = env[("pcall")]
            r[133]=r[134]
            do local captures = {}
            captures[1] = r[53]
            r[134]=function(...) return functions[89](captures, ...) end
            end
            do local f=r[133]; local n=1; if n<0 then n=top-133-1 end; local m=0; if m==1 then r[133]=f(unpackValues(r,134,133+n)); top=134 elseif m==0 then f(unpackValues(r,134,133+n)); top=133 else local result=packValues(f(unpackValues(r,134,133+n))); if m<0 then m=result.n end; for i=1,m do r[133+i-1]=result[i] end; top=133+m end end
            r[133]=("https://raw.githubusercontent.com/PookiePepelsss/Airflow-UI/refs/heads/main/Source.luau")
            do local captures = {}
            r[134]=function(...) return functions[90](captures, ...) end
            end
            r[137] = env[("loadstring")]
            r[136]=r[137]
            r[137]=r[134]
            r[138]=r[133]
            do local f=r[137]; local n=1; if n<0 then n=top-137-1 end; local m=-1; if m==1 then r[137]=f(unpackValues(r,138,137+n)); top=138 elseif m==0 then f(unpackValues(r,138,137+n)); top=137 else local result=packValues(f(unpackValues(r,138,137+n))); if m<0 then m=result.n end; for i=1,m do r[137+i-1]=result[i] end; top=137+m end end
            do local f=r[136]; local n=-1; if n<0 then n=top-136-1 end; local m=1; if m==1 then r[136]=f(unpackValues(r,137,136+n)); top=137 elseif m==0 then f(unpackValues(r,137,136+n)); top=136 else local result=packValues(f(unpackValues(r,137,136+n))); if m<0 then m=result.n end; for i=1,m do r[136+i-1]=result[i] end; top=136+m end end
            r[135]=r[136]
            do local f=r[135]; local n=0; if n<0 then n=top-135-1 end; local m=1; if m==1 then r[135]=f(unpackValues(r,136,135+n)); top=136 elseif m==0 then f(unpackValues(r,136,135+n)); top=135 else local result=packValues(f(unpackValues(r,136,135+n))); if m<0 then m=result.n end; for i=1,m do r[135+i-1]=result[i] end; top=135+m end end
            r[136]=(249344)
            r[136]=r[31] == r[136]
            if not r[136] then block=6063 else block=6049 end
        elseif block == 6049 then
            r[16][("game")]=r[13]
            r[2]=r[4] / r[3]
            block=6063
        elseif block == 6063 then
            r[136]=not r[135]
            if not r[136] then block=6119 else block=6077 end
        elseif block == 6077 then
            r[137] = env[("warn")]
            r[136]=r[137]
            r[137]=("[Azure] Flow UI failed to load")
            do local f=r[136]; local n=1; if n<0 then n=top-136-1 end; local m=0; if m==1 then r[136]=f(unpackValues(r,137,136+n)); top=137 elseif m==0 then f(unpackValues(r,137,136+n)); top=136 else local result=packValues(f(unpackValues(r,137,136+n))); if m<0 then m=result.n end; for i=1,m do r[136+i-1]=result[i] end; top=136+m end end
            return unpackValues(r, 0, -1)
        elseif block == 6112 then
            block=6119
        elseif block == 6119 then
            r[137]=r[135]
            r[136] = r[137][("CreateWindow")]
            r[138]={}
            r[139]=("Azure")
            r[138][("Name")]=r[139]
            r[139]=("by Noxi")
            r[138][("LoadingSubtitle")]=r[139]
            r[139]=("wind")
            r[138][("Icon")]=r[139]
            r[139]=("RightShift")
            r[138][("ToggleUIKeybind")]=r[139]
            r[140] = env[("UDim2")]
            r[140] = r[140][("fromOffset")]
            r[139]=r[140]
            r[140]=(520)
            r[141]=(720)
            do local f=r[139]; local n=2; if n<0 then n=top-139-1 end; local m=1; if m==1 then r[139]=f(unpackValues(r,140,139+n)); top=140 elseif m==0 then f(unpackValues(r,140,139+n)); top=139 else local result=packValues(f(unpackValues(r,140,139+n))); if m<0 then m=result.n end; for i=1,m do r[139+i-1]=result[i] end; top=139+m end end
            r[138][("Size")]=r[139]
            r[140] = env[("Vector2")]
            r[140] = r[140][("new")]
            r[139]=r[140]
            r[140]=(440)
            r[141]=(500)
            do local f=r[139]; local n=2; if n<0 then n=top-139-1 end; local m=1; if m==1 then r[139]=f(unpackValues(r,140,139+n)); top=140 elseif m==0 then f(unpackValues(r,140,139+n)); top=139 else local result=packValues(f(unpackValues(r,140,139+n))); if m<0 then m=result.n end; for i=1,m do r[139+i-1]=result[i] end; top=139+m end end
            r[138][("MinSize")]=r[139]
            r[140] = env[("Vector2")]
            r[140] = r[140][("new")]
            r[139]=r[140]
            r[140]=(900)
            r[141]=(900)
            do local f=r[139]; local n=2; if n<0 then n=top-139-1 end; local m=1; if m==1 then r[139]=f(unpackValues(r,140,139+n)); top=140 elseif m==0 then f(unpackValues(r,140,139+n)); top=139 else local result=packValues(f(unpackValues(r,140,139+n))); if m<0 then m=result.n end; for i=1,m do r[139+i-1]=result[i] end; top=139+m end end
            r[138][("MaxSize")]=r[139]
            r[139]=(true)
            r[138][("KeepOnScreen")]=r[139]
            r[139]={}
            r[140]=(true)
            r[139][("Enabled")]=r[140]
            r[140]=("Azure")
            r[139][("Title")]=r[140]
            r[140]=("Starting")
            r[139][("Text")]=r[140]
            r[140]={}
            r[141]=("Preparing interface")
            r[140][(1)]=r[141]
            r[141]=("Loading modules")
            r[140][(2)]=r[141]
            r[141]=("Ready")
            r[140][(3)]=r[141]
            r[139][("Steps")]=r[140]
            r[140]=(1.4)
            r[139][("Duration")]=r[140]
            r[138][("Loading")]=r[139]
            r[139]={}
            r[140]=(true)
            r[139][("Enabled")]=r[140]
            r[140]=("AzureConfigs")
            r[139][("FolderName")]=r[140]
            r[140]=("default")
            r[139][("FileName")]=r[140]
            r[138][("ConfigurationSaving")]=r[139]
            r[141] = env[("game")]
            r[140]=r[141]
            r[139] = r[140][("GetService")]
            r[141]=("CoreGui")
            do local f=r[139]; local n=2; if n<0 then n=top-139-1 end; local m=1; if m==1 then r[139]=f(unpackValues(r,140,139+n)); top=140 elseif m==0 then f(unpackValues(r,140,139+n)); top=139 else local result=packValues(f(unpackValues(r,140,139+n))); if m<0 then m=result.n end; for i=1,m do r[139+i-1]=result[i] end; top=139+m end end
            r[138][("Parent")]=r[139]
            do local f=r[136]; local n=2; if n<0 then n=top-136-1 end; local m=1; if m==1 then r[136]=f(unpackValues(r,137,136+n)); top=137 elseif m==0 then f(unpackValues(r,137,136+n)); top=136 else local result=packValues(f(unpackValues(r,137,136+n))); if m<0 then m=result.n end; for i=1,m do r[136+i-1]=result[i] end; top=136+m end end
            r[136]={[7]=r[136]}
            r[137]=r[136][7]
            r[137] = r[137][("Notify")]
            r[137]={[7]=r[137]}
            r[138]=(245881)
            r[138]=r[31] == r[138]
            if not r[138] then block=6658 else block=6637 end
        elseif block == 6637 then
            r[25]=("ReplicatedStorage")
            r[0]=("getgenv")
            r[3]=r[15] * r[24]
            block=6658
        elseif block == 6658 then
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[137]
            r[138]=function(...) return functions[92](captures, ...) end
            end
            r[139]=r[136][7]
            r[139][("Notify")]=r[138]
            r[138]=(283669)
            r[138]=r[31] == r[138]
            if not r[138] then block=6728 else block=6700 end
        elseif block == 6700 then
            r[3]=("AzureUnload")
            r[25]=r[23] < r[23]
            r[15]=("require")
            do local f=r[23]; local n=5; if n<0 then n=top-23-1 end; local m=7; if m==1 then r[23]=f(unpackValues(r,24,23+n)); top=24 elseif m==0 then f(unpackValues(r,24,23+n)); top=23 else local result=packValues(f(unpackValues(r,24,23+n))); if m<0 then m=result.n end; for i=1,m do r[23+i-1]=result[i] end; top=23+m end end
            block=6728
        elseif block == 6728 then
            r[140]=r[136][7]
            r[139]=r[140]
            r[138] = r[139][("CreateTab")]
            r[140]={}
            r[141]=("Runner")
            r[140][("Name")]=r[141]
            r[141]=("footprints")
            r[140][("Icon")]=r[141]
            do local f=r[138]; local n=2; if n<0 then n=top-138-1 end; local m=1; if m==1 then r[138]=f(unpackValues(r,139,138+n)); top=139 elseif m==0 then f(unpackValues(r,139,138+n)); top=138 else local result=packValues(f(unpackValues(r,139,138+n))); if m<0 then m=result.n end; for i=1,m do r[138+i-1]=result[i] end; top=138+m end end
            r[139]=(254378)
            r[139]=r[31] == r[139]
            if not r[139] then block=6840 else block=6812 end
        elseif block == 6812 then
            r[13]=r[1] * r[21]
            r[1]=r[14][("_G")]
            r[2]=env[("AzureUnload")]
            r[22][("BoostInput")]=r[14]
            block=6840
        elseif block == 6840 then
            r[141]=r[136][7]
            r[140]=r[141]
            r[139] = r[140][("CreateTab")]
            r[141]={}
            r[142]=("Catcher")
            r[141][("Name")]=r[142]
            r[142]=("crosshair")
            r[141][("Icon")]=r[142]
            do local f=r[139]; local n=2; if n<0 then n=top-139-1 end; local m=1; if m==1 then r[139]=f(unpackValues(r,140,139+n)); top=140 elseif m==0 then f(unpackValues(r,140,139+n)); top=139 else local result=packValues(f(unpackValues(r,140,139+n))); if m<0 then m=result.n end; for i=1,m do r[139+i-1]=result[i] end; top=139+m end end
            r[142]=r[136][7]
            r[141]=r[142]
            r[140] = r[141][("CreateTab")]
            r[142]={}
            r[143]=("Utilities")
            r[142][("Name")]=r[143]
            r[143]=("wrench")
            r[142][("Icon")]=r[143]
            do local f=r[140]; local n=2; if n<0 then n=top-140-1 end; local m=1; if m==1 then r[140]=f(unpackValues(r,141,140+n)); top=141 elseif m==0 then f(unpackValues(r,141,140+n)); top=140 else local result=packValues(f(unpackValues(r,141,140+n))); if m<0 then m=result.n end; for i=1,m do r[140+i-1]=result[i] end; top=140+m end end
            r[141]=(276773)
            r[141]=r[31] == r[141]
            if not r[141] then block=6994 else block=6987 end
        elseif block == 6987 then
            r[1]=env[("Movement")]
            block=6994
        elseif block == 6994 then
            r[143]=r[136][7]
            r[142]=r[143]
            r[141] = r[142][("CreateTab")]
            r[143]={}
            r[144]=("Settings")
            r[143][("Name")]=r[144]
            r[144]=("settings")
            r[143][("Icon")]=r[144]
            do local f=r[141]; local n=2; if n<0 then n=top-141-1 end; local m=1; if m==1 then r[141]=f(unpackValues(r,142,141+n)); top=142 elseif m==0 then f(unpackValues(r,142,141+n)); top=141 else local result=packValues(f(unpackValues(r,142,141+n))); if m<0 then m=result.n end; for i=1,m do r[141+i-1]=result[i] end; top=141+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSection")]
            r[144]=("Status")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateLabel")]
            r[144]={}
            r[145]=("Runner: idle")
            r[144][("Text")]=r[145]
            r[145]=(0.5)
            r[144][("UpdateRate")]=r[145]
            do local captures = {}
            captures[1] = r[62]
            captures[2] = r[63]
            captures[3] = r[55]
            r[145]=function(...) return functions[93](captures, ...) end
            end
            r[144][("Update")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSection")]
            r[144]=("Movement")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Run")
            r[144][("Name")]=r[145]
            r[145]=("Travel between Safe Zones with threat and edge checks.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AutoRun")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[55]
            captures[3] = r[106]
            r[145]=function(...) return functions[94](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Runner Speed Override")
            r[144][("Name")]=r[145]
            r[145]=("Multiply native Runner speed without replacing the game's movement.")
            r[144][("Desc")]=r[145]
            r[145]=(false)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_RunnerSpeedOn")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[70]
            r[145]=function(...) return functions[95](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Runner Speed Multiplier")
            r[144][("Name")]=r[145]
            r[145]=("1.0x native, max 2.0x.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(1)
            r[145][(1)]=r[146]
            r[146]=(2)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.05)
            r[144][("Increment")]=r[145]
            r[145]=("x")
            r[144][("Suffix")]=r[145]
            r[145]=(1)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_RunnerSpeedMult")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[96](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSection")]
            r[144]=("Collection")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(219011)
            r[142]=r[31] == r[142]
            if not r[142] then block=7624 else block=7596 end
        elseif block == 7596 then
            r[4]=env[("WaitForChild")]
            r[13]=r[16] - r[23]
            r[23]=(nil)
            r[15]=r[2] * r[10]
            block=7624
        elseif block == 7624 then
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Collect Gems")
            r[144][("Name")]=r[145]
            r[145]=("Collect visible Runner gems, then return to the safe route.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AutoGems")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[55]
            r[145]=function(...) return functions[97](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Revive Players")
            r[144][("Name")]=r[145]
            r[145]=("Move to a downed Runner and complete the real revive hold.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AutoRevive")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[106]
            r[145]=function(...) return functions[98](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(283877)
            r[142]=r[31] == r[142]
            if not r[142] then block=7848 else block=7841 end
        elseif block == 7841 then
            r[3][(293740)]=r[15]
            block=7848
        elseif block == 7848 then
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Revive Before Gems")
            r[144][("Name")]=r[145]
            r[145]=("Prioritize downed players over gem collection.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_ReviveFirst")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[99](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSection")]
            r[144]=("Avoidance")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Avoid Catchers")
            r[144][("Name")]=r[145]
            r[145]=("Predict Catcher paths and bend the route away from danger.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_Avoid")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[100](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Dash")
            r[144][("Name")]=r[145]
            r[145]=("Use the equipped Runner ability before Catchers reach collision range.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AutoDash")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[101](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Threat Prediction")
            r[144][("Name")]=r[145]
            r[145]=("How far ahead Catcher movement is predicted.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(0.25)
            r[145][(1)]=r[146]
            r[146]=(1.1)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.05)
            r[144][("Increment")]=r[145]
            r[145]=("s")
            r[144][("Suffix")]=r[145]
            r[145]=(0.65)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_Prediction")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[102](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Avoidance Strength")
            r[144][("Name")]=r[145]
            r[145]=("How strongly the route bends away from Catchers.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(0.5)
            r[145][(1)]=r[146]
            r[146]=(2.5)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.1)
            r[144][("Increment")]=r[145]
            r[145]=("x")
            r[144][("Suffix")]=r[145]
            r[145]=(2.2)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AvoidStrength")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[103](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Panic Distance")
            r[144][("Name")]=r[145]
            r[145]=("Distance where emergency avoidance kicks in.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(8)
            r[145][(1)]=r[146]
            r[146]=(25)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(1)
            r[144][("Increment")]=r[145]
            r[145]=(" studs")
            r[144][("Suffix")]=r[145]
            r[145]=(15)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_Panic")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[104](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateSection")]
            r[144]=("Movement Feel")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(229905)
            r[142]=r[31] == r[142]
            if not r[142] then block=8730 else block=8723 end
        elseif block == 8723 then
            r[19]=r[14][r[6]]
            block=8730
        elseif block == 8730 then
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Smooth Direction Changes")
            r[144][("Name")]=r[145]
            r[145]=("Blend turns to reduce sudden movement swings.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_Smooth")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[105](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[138]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Emergency Safe Zone")
            r[144][("Name")]=r[145]
            r[145]=("When stalled under pressure, favor the nearest Safe Zone.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_EmergencySafe")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[106](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateSection")]
            r[144]=("Status")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateLabel")]
            r[144]={}
            r[145]=("Catcher: idle")
            r[144][("Text")]=r[145]
            r[145]=(0.5)
            r[144][("UpdateRate")]=r[145]
            do local captures = {}
            captures[1] = r[55]
            captures[2] = r[62]
            captures[3] = r[63]
            r[145]=function(...) return functions[107](captures, ...) end
            end
            r[144][("Update")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateSection")]
            r[144]=("Combat")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Chase")
            r[144][("Name")]=r[145]
            r[145]=("Move toward the best active Runner.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_CatcherChase")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[55]
            r[145]=function(...) return functions[108](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateDropdown")]
            r[144]={}
            r[145]=("Attack Priority")
            r[144][("Name")]=r[145]
            r[145]=("Which attack to prefer when both are in range.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=("Smart")
            r[145][(1)]=r[146]
            r[146]=("Tackle First")
            r[145][(2)]=r[146]
            r[146]=("Melee First")
            r[145][(3)]=r[146]
            r[144][("Options")]=r[145]
            r[145]=("Smart")
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AttackPriority")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[109](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(201561)
            r[142]=r[31] == r[142]
            if not r[142] then block=9353 else block=9325 end
        elseif block == 9325 then
            r[11]=r[18] + r[7]
            r[3]=r[12]
            r[11]=(193770)
            r[18]=r[3] - r[8]
            block=9353
        elseif block == 9353 then
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Smart Targeting")
            r[144][("Name")]=r[145]
            r[145]=("Prefer interceptable targets instead of just the nearest.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_SmartTarget")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[110](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(288901)
            r[142]=r[31] == r[142]
            if not r[142] then block=9486 else block=9472 end
        elseif block == 9472 then
            r[5]=r[25][r[16]]
            r[14][r[7]]=r[4]
            block=9486
        elseif block == 9486 then
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Tackle")
            r[144][("Name")]=r[145]
            r[145]=("Tackle when predicted position enters range.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AutoTackle")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[55]
            r[145]=function(...) return functions[111](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(275160)
            r[142]=r[31] == r[142]
            if not r[142] then block=9619 else block=9605 end
        elseif block == 9605 then
            r[7]=r[15]
            r[15]=r[1][("pcall")]
            block=9619
        elseif block == 9619 then
            r[143]=r[139]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Tackle Range")
            r[144][("Name")]=r[145]
            r[145]=("Distance for automatic tackle.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(5)
            r[145][(1)]=r[146]
            r[146]=(25)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.5)
            r[144][("Increment")]=r[145]
            r[145]=(" studs")
            r[144][("Suffix")]=r[145]
            r[145]=(12)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_TackleRange")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[112](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Auto Melee")
            r[144][("Name")]=r[145]
            r[145]=("Melee when predicted position enters range.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AutoMelee")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[55]
            r[145]=function(...) return functions[113](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Melee Range")
            r[144][("Name")]=r[145]
            r[145]=("Distance for automatic melee.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(3)
            r[145][(1)]=r[146]
            r[146]=(15)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.5)
            r[144][("Increment")]=r[145]
            r[145]=(" studs")
            r[144][("Suffix")]=r[145]
            r[145]=(9)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_MeleeRange")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[114](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(208714)
            r[142]=r[31] == r[142]
            if not r[142] then block=10102 else block=10074 end
        elseif block == 10074 then
            r[14]=#r[6]
            r[8]=r[2] + r[22]
            r[18]=r[14] .. r[7]
            r[7]=env[("RunService")]
            block=10102
        elseif block == 10102 then
            r[143]=r[139]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Target Prediction")
            r[144][("Name")]=r[145]
            r[145]=("How far ahead the Catcher predicts the target.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(0.1)
            r[145][(1)]=r[146]
            r[146]=(1)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.05)
            r[144][("Increment")]=r[145]
            r[145]=("s")
            r[144][("Suffix")]=r[145]
            r[145]=(0.45)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_CatcherPrediction")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[115](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(202347)
            r[142]=r[31] == r[142]
            if not r[142] then block=10298 else block=10291 end
        elseif block == 10291 then
            r[23]=r[4] - r[2]
            block=10298
        elseif block == 10298 then
            r[143]=r[139]
            r[142] = r[143][("CreateSection")]
            r[144]=("Movement")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Catcher Speed Override")
            r[144][("Name")]=r[145]
            r[145]=("Multiply native Catcher speed.")
            r[144][("Desc")]=r[145]
            r[145]=(false)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_CatcherSpeedOn")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[70]
            r[145]=function(...) return functions[116](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(223558)
            r[142]=r[31] == r[142]
            if not r[142] then block=10466 else block=10445 end
        elseif block == 10445 then
            r[5]=(293740)
            r[24]=r[0] == r[13]
            r[17]=r[2][r[12]]
            block=10466
        elseif block == 10466 then
            r[143]=r[139]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Catcher Speed Multiplier")
            r[144][("Name")]=r[145]
            r[145]=("1.0x native, max 2.0x.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(1)
            r[145][(1)]=r[146]
            r[146]=(2)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(0.05)
            r[144][("Increment")]=r[145]
            r[145]=("x")
            r[144][("Suffix")]=r[145]
            r[145]=(1)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_CatcherSpeedMult")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[117](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Smooth Turning")
            r[144][("Name")]=r[145]
            r[145]=("Rotate toward the target without snapping.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_SmoothTurn")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[118](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateSlider")]
            r[144]={}
            r[145]=("Turn Response")
            r[144][("Name")]=r[145]
            r[145]=("How fast the Catcher turns toward the target.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=(5)
            r[145][(1)]=r[146]
            r[146]=(30)
            r[145][(2)]=r[146]
            r[144][("Range")]=r[145]
            r[145]=(1)
            r[144][("Increment")]=r[145]
            r[145]=(14)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_TurnRate")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[119](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[139]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Follow Target")
            r[144][("Name")]=r[145]
            r[145]=("Point the camera toward the active target.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_Follow")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[120](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[140]
            r[142] = r[143][("CreateSection")]
            r[144]=("Visual Helpers")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(214836)
            r[142]=r[31] == r[142]
            if not r[142] then block=11040 else block=11033 end
        elseif block == 11033 then
            r[3]=#r[18]
            block=11040
        elseif block == 11040 then
            r[143]=r[140]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Show Goal")
            r[144][("Name")]=r[145]
            r[145]=("Show the current destination (Safe Zone, gem, revive target).")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_ShowGoal")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[57]
            r[145]=function(...) return functions[121](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(199363)
            r[142]=r[31] == r[142]
            if not r[142] then block=11187 else block=11159 end
        elseif block == 11159 then
            r[24]=r[22] + r[1]
            r[22]=#r[0]
            r[16]=env[("getgenv")]
            r[13]=r[9] / r[0]
            block=11187
        elseif block == 11187 then
            r[143]=r[140]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Show Threats")
            r[144][("Name")]=r[145]
            r[145]=("Show predicted danger areas used by avoidance.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_ShowThreats")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[57]
            r[145]=function(...) return functions[122](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[140]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Show Hitboxes")
            r[144][("Name")]=r[145]
            r[145]=("Show spheres around relevant players.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_ShowHitboxes")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            captures[2] = r[57]
            r[145]=function(...) return functions[123](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[140]
            r[142] = r[143][("CreateSection")]
            r[144]=("Lobby")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(236118)
            r[142]=r[31] == r[142]
            if not r[142] then block=11460 else block=11432 end
        elseif block == 11432 then
            r[5]=r[13] - r[18]
            r[5]=r[21][r[0]]
            r[10]=r[6] + r[12]
            r[24]=env[("getgenv")]
            block=11460
        elseif block == 11460 then
            r[143]=r[140]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Anti Idle Kick")
            r[144][("Name")]=r[145]
            r[145]=("Prevent Roblox from kicking you after 20 minutes idle.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_AntiIdle")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[36]
            captures[2] = r[35]
            r[145]=function(...) return functions[124](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[140]
            r[142] = r[143][("CreateButton")]
            r[144]={}
            r[145]=("Rejoin Server")
            r[144][("Name")]=r[145]
            r[145]=("Teleport back into this same place.")
            r[144][("Desc")]=r[145]
            r[145]=("refresh-cw")
            r[144][("Icon")]=r[145]
            do local captures = {}
            captures[1] = r[32]
            captures[2] = r[35]
            r[145]=function(...) return functions[127](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(270725)
            r[142]=r[31] == r[142]
            if not r[142] then block=11691 else block=11663 end
        elseif block == 11663 then
            r[15]=r[5] - r[21]
            r[5]=r[2] / r[15]
            r[24]=r[8] < r[4]
            r[4]=r[8] * r[12]
            block=11691
        elseif block == 11691 then
            r[144]=r[35][7]
            r[144] = r[144][("Idled")]
            r[143]=r[144]
            r[142] = r[143][("Connect")]
            do local captures = {}
            r[144]=function(...) return functions[129](captures, ...) end
            end
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=1; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[36][7]
            r[143][("idleConn")]=r[142]
            r[142]=(239622)
            r[142]=r[31] == r[142]
            if not r[142] then block=11789 else block=11768 end
        elseif block == 11768 then
            r[11]=r[16][r[1]]
            r[2]=#r[12]
            r[10]=("BoostInput")
            block=11789
        elseif block == 11789 then
            r[143]=r[141]
            r[142] = r[143][("CreateSection")]
            r[144]=("Interface")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[141]
            r[142] = r[143][("CreateDropdown")]
            r[144]={}
            r[145]=("Toggle UI Key")
            r[144][("Name")]=r[145]
            r[145]=("Key used to show or hide this window.")
            r[144][("Desc")]=r[145]
            r[145]={}
            r[146]=("RightShift")
            r[145][(1)]=r[146]
            r[146]=("LeftAlt")
            r[145][(2)]=r[146]
            r[146]=("RightAlt")
            r[145][(3)]=r[146]
            r[146]=("RightControl")
            r[145][(4)]=r[146]
            r[146]=("Insert")
            r[145][(5)]=r[146]
            r[146]=("Home")
            r[145][(6)]=r[146]
            r[146]=("End")
            r[145][(7)]=r[146]
            r[146]=("Delete")
            r[145][(8)]=r[146]
            r[146]=("F6")
            r[145][(9)]=r[146]
            r[146]=("F7")
            r[145][(10)]=r[146]
            r[146]=("F8")
            r[145][(11)]=r[146]
            r[144][("Options")]=r[145]
            r[145]=("RightShift")
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_ToggleKey")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[136]
            r[145]=function(...) return functions[131](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[141]
            r[142] = r[143][("CreateToggle")]
            r[144]={}
            r[145]=("Notifications")
            r[144][("Name")]=r[145]
            r[145]=("Show toast notifications.")
            r[144][("Desc")]=r[145]
            r[145]=(true)
            r[144][("CurrentValue")]=r[145]
            r[145]=("Azure_Notifications")
            r[144][("Flag")]=r[145]
            do local captures = {}
            captures[1] = r[54]
            r[145]=function(...) return functions[133](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(269288)
            r[142]=r[31] == r[142]
            if not r[142] then block=12223 else block=12202 end
        elseif block == 12202 then
            r[17]=r[7] + r[19]
            r[21]=r[24] / r[20]
            r[25]=r[14] + r[3]
            block=12223
        elseif block == 12223 then
            r[143]=r[141]
            r[142] = r[143][("CreateSection")]
            r[144]=("Configuration")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[141]
            r[142] = r[143][("CreateButton")]
            r[144]={}
            r[145]=("Save Config")
            r[144][("Name")]=r[145]
            r[145]=("save")
            r[144][("Icon")]=r[145]
            do local captures = {}
            captures[1] = r[136]
            r[145]=function(...) return functions[134](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[141]
            r[142] = r[143][("CreateButton")]
            r[144]={}
            r[145]=("Load Config")
            r[144][("Name")]=r[145]
            r[145]=("folder-open")
            r[144][("Icon")]=r[145]
            do local captures = {}
            captures[1] = r[136]
            r[145]=function(...) return functions[135](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[141]
            r[142] = r[143][("CreateButton")]
            r[144]={}
            r[145]=("Delete Config")
            r[144][("Name")]=r[145]
            r[145]=("trash-2")
            r[144][("Icon")]=r[145]
            do local captures = {}
            captures[1] = r[136]
            r[145]=function(...) return functions[136](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[143]=r[141]
            r[142] = r[143][("CreateSection")]
            r[144]=("About")
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(291262)
            r[142]=r[31] == r[142]
            if not r[142] then block=12524 else block=12510 end
        elseif block == 12510 then
            r[12]=r[20] .. r[6]
            r[25]=r[20] + r[23]
            block=12524
        elseif block == 12524 then
            r[143]=r[141]
            r[142] = r[143][("CreateParagraph")]
            r[144]={}
            r[145]=("Azure")
            r[144][("Title")]=r[145]
            r[145]=("Chicken or Hero helper.\010by Noxi\010Toggle: RightShift")
            r[144][("Content")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(245752)
            r[142]=r[31] == r[142]
            if not r[142] then block=12615 else block=12601 end
        elseif block == 12601 then
            r[10]=r[4][r[25]]
            r[0]=r[18][r[19]]
            block=12615
        elseif block == 12615 then
            r[143]=r[141]
            r[142] = r[143][("CreateButton")]
            r[144]={}
            r[145]=("Unload Script")
            r[144][("Name")]=r[145]
            r[145]=("Stop everything, remove visuals and close the window.")
            r[144][("Desc")]=r[145]
            r[145]=("power")
            r[144][("Icon")]=r[145]
            do local captures = {}
            captures[1] = r[36]
            r[145]=function(...) return functions[137](captures, ...) end
            end
            r[144][("Callback")]=r[145]
            do local f=r[142]; local n=2; if n<0 then n=top-142-1 end; local m=0; if m==1 then r[142]=f(unpackValues(r,143,142+n)); top=143 elseif m==0 then f(unpackValues(r,143,142+n)); top=142 else local result=packValues(f(unpackValues(r,143,142+n))); if m<0 then m=result.n end; for i=1,m do r[142+i-1]=result[i] end; top=142+m end end
            r[142]=(209136)
            r[142]=r[31] == r[142]
            if not r[142] then block=12741 else block=12720 end
        elseif block == 12720 then
            r[1][("WaitForChild")]=r[23]
            r[5][("GetService")]=r[20]
            r[13]=r[19][r[4]]
            block=12741
        elseif block == 12741 then
            r[142]=("Azure_SpeedOverride")
            r[142]={[7]=r[142]}
            r[145]=r[33][7]
            r[144]=r[145]
            r[143] = r[144][("UnbindFromRenderStep")]
            r[145]=r[142][7]
            do local f=r[143]; local n=2; if n<0 then n=top-143-1 end; local m=0; if m==1 then r[143]=f(unpackValues(r,144,143+n)); top=144 elseif m==0 then f(unpackValues(r,144,143+n)); top=143 else local result=packValues(f(unpackValues(r,144,143+n))); if m<0 then m=result.n end; for i=1,m do r[143+i-1]=result[i] end; top=143+m end end
            r[143]=(258486)
            r[143]=r[31] == r[143]
            if not r[143] then block=12839 else block=12811 end
        elseif block == 12811 then
            r[3][("pcall")]=r[13]
            r[5]=#r[0]
            r[2]=r[19] / r[22]
            r[9]=r[23] - r[19]
            block=12839
        elseif block == 12839 then
            r[145]=r[33][7]
            r[144]=r[145]
            r[143] = r[144][("BindToRenderStep")]
            r[145]=r[142][7]
            r[146] = env[("Enum")]
            r[146] = r[146][("RenderPriority")]
            r[146] = r[146][("Input")]
            r[146] = r[146][("Value")]
            r[146] = r[146] + (2)
            do local captures = {}
            captures[1] = r[62]
            captures[2] = r[59]
            captures[3] = r[60]
            captures[4] = r[54]
            r[147]=function(...) return functions[138](captures, ...) end
            end
            do local f=r[143]; local n=4; if n<0 then n=top-143-1 end; local m=0; if m==1 then r[143]=f(unpackValues(r,144,143+n)); top=144 elseif m==0 then f(unpackValues(r,144,143+n)); top=143 else local result=packValues(f(unpackValues(r,144,143+n))); if m<0 then m=result.n end; for i=1,m do r[143+i-1]=result[i] end; top=143+m end end
            r[143]=("Azure_StableController")
            r[143]={[7]=r[143]}
            r[146]=r[33][7]
            r[145]=r[146]
            r[144] = r[145][("UnbindFromRenderStep")]
            r[146]=r[143][7]
            do local f=r[144]; local n=2; if n<0 then n=top-144-1 end; local m=0; if m==1 then r[144]=f(unpackValues(r,145,144+n)); top=145 elseif m==0 then f(unpackValues(r,145,144+n)); top=144 else local result=packValues(f(unpackValues(r,145,144+n))); if m<0 then m=result.n end; for i=1,m do r[144+i-1]=result[i] end; top=144+m end end
            r[146]=r[33][7]
            r[145]=r[146]
            r[144] = r[145][("BindToRenderStep")]
            r[146]=r[143][7]
            r[147] = env[("Enum")]
            r[147] = r[147][("RenderPriority")]
            r[147] = r[147][("Input")]
            r[147] = r[147][("Value")]
            do local captures = {}
            captures[1] = r[122]
            captures[2] = r[129]
            captures[3] = r[55]
            captures[4] = r[132]
            r[148]=function(...) return functions[139](captures, ...) end
            end
            do local f=r[144]; local n=4; if n<0 then n=top-144-1 end; local m=0; if m==1 then r[144]=f(unpackValues(r,145,144+n)); top=145 elseif m==0 then f(unpackValues(r,145,144+n)); top=144 else local result=packValues(f(unpackValues(r,145,144+n))); if m<0 then m=result.n end; for i=1,m do r[144+i-1]=result[i] end; top=144+m end end
            do local captures = {}
            captures[1] = r[36]
            captures[2] = r[54]
            captures[3] = r[106]
            captures[4] = r[33]
            captures[5] = r[143]
            captures[6] = r[142]
            captures[7] = r[70]
            captures[8] = r[131]
            captures[9] = r[136]
            r[144]=function(...) return functions[140](captures, ...) end
            end
            r[145]=r[36][7]
            r[145][("cleanup")]=r[144]
            r[144]=r[36][7]
            r[144] = r[144][("cleanup")]
            r[145]=r[36][7]
            r[145] = r[145][("genv")]
            r[145][("AzureUnload")]=r[144]
            r[146]=r[136][7]
            r[145]=r[146]
            r[144] = r[145][("LoadConfig")]
            do local f=r[144]; local n=1; if n<0 then n=top-144-1 end; local m=0; if m==1 then r[144]=f(unpackValues(r,145,144+n)); top=145 elseif m==0 then f(unpackValues(r,145,144+n)); top=144 else local result=packValues(f(unpackValues(r,145,144+n))); if m<0 then m=result.n end; for i=1,m do r[144+i-1]=result[i] end; top=144+m end end
            r[146]=r[136][7]
            r[145]=r[146]
            r[144] = r[145][("Notify")]
            r[146]={}
            r[147]=("Azure")
            r[146][("Title")]=r[147]
            r[147]=("Loaded. Auto Run enabled by default.")
            r[146][("Content")]=r[147]
            r[147]=("wind")
            r[146][("Icon")]=r[147]
            r[147]=("Success")
            r[146][("Type")]=r[147]
            r[147]=(4)
            r[146][("Duration")]=r[147]
            do local f=r[144]; local n=2; if n<0 then n=top-144-1 end; local m=0; if m==1 then r[144]=f(unpackValues(r,145,144+n)); top=145 elseif m==0 then f(unpackValues(r,145,144+n)); top=144 else local result=packValues(f(unpackValues(r,145,144+n))); if m<0 then m=result.n end; for i=1,m do r[144+i-1]=result[i] end; top=144+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[2] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(148235)
            r[34] = env[("Vector3")]
            r[34] = r[34][("new")]
            r[33]=r[34]
            r[34] = r[31][("X")]
            r[35]=(0)
            r[36] = r[31][("Z")]
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=-1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 33, top-1)
        elseif block == 64 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[3] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(978106)
            r[33]=(1012541)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[6]=r[14] / r[10]
            r[15]=r[11] == r[12]
            r[0]=r[20] * r[24]
            block=50
        elseif block == 50 then
            r[33]=r[31]
            if r[33] then block=78 else block=64 end
        elseif block == 64 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            block=78
        elseif block == 78 then
            r[33] = r[33][("Character")]
            return r[33]
        elseif block == 92 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[4] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(228656)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[34]=r[31]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=r[33]
            if not r[35] then block=85 else block=50 end
        elseif block == 50 then
            r[37]=r[33]
            r[36] = r[37][("FindFirstChildOfClass")]
            r[38]=("Humanoid")
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            block=85
        elseif block == 85 then
            r[34]=r[35]
            if r[34] then block=113 else block=99 end
        elseif block == 99 then
            r[35]=nil
            r[34]=r[35]
            block=113
        elseif block == 113 then
            return r[34]
        elseif block == 120 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[5] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(754049)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[34]=r[31]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=r[33]
            if not r[35] then block=85 else block=50 end
        elseif block == 50 then
            r[37]=r[33]
            r[36] = r[37][("FindFirstChild")]
            r[38]=("HumanoidRootPart")
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            block=85
        elseif block == 85 then
            r[34]=r[35]
            if r[34] then block=113 else block=99 end
        elseif block == 99 then
            r[35]=nil
            r[34]=r[35]
            block=113
        elseif block == 113 then
            return r[34]
        elseif block == 120 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[6] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(907904)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("GetAttribute")]
            r[35]=("GameRole")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[32]=r[33]
            if r[32] then block=71 else block=57 end
        elseif block == 57 then
            r[33]=("Lobby")
            r[32]=r[33]
            block=71
        elseif block == 71 then
            return r[32]
        elseif block == 78 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[7] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(746099)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("GetAttribute")]
            r[35]=("RunState")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[32]=r[33]
            if r[32] then block=71 else block=57 end
        elseif block == 57 then
            r[33]=("Idle")
            r[32]=r[33]
            block=71
        elseif block == 71 then
            return r[32]
        elseif block == 78 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[8] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(46773)
            r[32]=(73574)
            r[32]=r[31] == r[32]
            if not r[32] then block=57 else block=29 end
        elseif block == 29 then
            r[21][r[1]]=r[17]
            r[15]=r[19] / r[2]
            do local f=r[10]; local n=19; if n<0 then n=top-10-1 end; local m=15; if m==1 then r[10]=f(unpackValues(r,11,10+n)); top=11 elseif m==0 then f(unpackValues(r,11,10+n)); top=10 else local result=packValues(f(unpackValues(r,11,10+n))); if m<0 then m=result.n end; for i=1,m do r[10+i-1]=result[i] end; top=10+m end end
            r[5]=r[19] / r[10]
            block=57
        elseif block == 57 then
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("GetAttribute")]
            r[35]=("InMatch")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(true)
            r[33] = r[33] == r[34]
            r[32]=r[33]
            if not r[32] then block=204 else block=120 end
        elseif block == 120 then
            r[35]=upvalues[2][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34] = r[34] == ("Runner")
            r[33]=r[34]
            if not r[33] then block=197 else block=162 end
        elseif block == 162 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34] = r[34] == ("Active")
            r[33]=r[34]
            block=197
        elseif block == 197 then
            r[32]=r[33]
            block=204
        elseif block == 204 then
            return r[32]
        elseif block == 211 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[9] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(842084)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("GetAttribute")]
            r[35]=("InMatch")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(true)
            r[33] = r[33] == r[34]
            r[32]=r[33]
            if not r[32] then block=155 else block=71 end
        elseif block == 71 then
            r[35]=upvalues[2][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34] = r[34] == ("Catcher")
            r[33]=r[34]
            if not r[33] then block=148 else block=113 end
        elseif block == 113 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34] = r[34] == ("Active")
            r[33]=r[34]
            block=148
        elseif block == 148 then
            r[32]=r[33]
            block=155
        elseif block == 155 then
            return r[32]
        elseif block == 162 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[10] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(518992)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("GetAttribute")]
            r[34]=("ClientReady")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(true)
            if not (r[32] ~= r[33]) then block=78 else block=57 end
        elseif block == 57 then
            r[32]=(false)
            return r[32]
        elseif block == 71 then
            block=78
        elseif block == 78 then
            r[32]=(602149)
            r[32]=r[31] == r[32]
            if not r[32] then block=120 else block=99 end
        elseif block == 99 then
            r[21]=r[5] + r[10]
            r[5]=r[13][r[15]]
            r[24]=env[(true)]
            block=120
        elseif block == 120 then
            r[34]=upvalues[2][7]
            r[33]=r[34]
            r[32] = r[33][("GetAttribute")]
            r[34]=("GlobalPaused")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(true)
            if not (r[32] == r[33]) then block=190 else block=169 end
        elseif block == 169 then
            r[32]=(false)
            return r[32]
        elseif block == 183 then
            block=190
        elseif block == 190 then
            r[32]=(581338)
            r[32]=r[31] == r[32]
            if not r[32] then block=225 else block=211 end
        elseif block == 211 then
            r[16]=r[5]
            r[20][("PlatformStand")]=r[14]
            block=225
        elseif block == 225 then
            r[34]=upvalues[2][7]
            r[33]=r[34]
            r[32] = r[33][("GetAttribute")]
            r[34]=("MapChanging")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(true)
            if not (r[32] == r[33]) then block=337 else block=274 end
        elseif block == 274 then
            r[32]=(576761)
            r[32]=r[31] == r[32]
            if not r[32] then block=316 else block=295 end
        elseif block == 295 then
            r[2][r[13]]=r[22]
            r[10]=r[5] * r[1]
            r[3]=r[17] + r[14]
            block=316
        elseif block == 316 then
            r[32]=(false)
            return r[32]
        elseif block == 330 then
            block=337
        elseif block == 337 then
            r[32]=(578087)
            r[32]=r[31] == r[32]
            if not r[32] then block=379 else block=358 end
        elseif block == 358 then
            r[16][r[12]]=r[13]
            r[23]=r[0]
            r[6]=r[6] < r[4]
            block=379
        elseif block == 379 then
            r[33]=upvalues[3][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(533952)
            r[33]=r[31] == r[33]
            if not r[33] then block=449 else block=421 end
        elseif block == 421 then
            r[18]=r[1][r[8]]
            r[0]=r[3]
            r[0]=r[4] + r[18]
            r[23]=r[8]
            block=449
        elseif block == 449 then
            r[33]=not r[32]
            if not r[33] then block=484 else block=463 end
        elseif block == 463 then
            r[33]=(false)
            return r[33]
        elseif block == 477 then
            block=484
        elseif block == 484 then
            r[34]=r[32]
            r[33] = r[34][("GetAttribute")]
            r[35]=("Ragdolled")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(true)
            if not (r[33] == r[34]) then block=547 else block=526 end
        elseif block == 526 then
            r[33]=(false)
            return r[33]
        elseif block == 540 then
            block=547
        elseif block == 547 then
            r[34]=r[32]
            r[33] = r[34][("GetAttribute")]
            r[35]=("GearMotion")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(true)
            if not (r[33] == r[34]) then block=610 else block=589 end
        elseif block == 589 then
            r[33]=(false)
            return r[33]
        elseif block == 603 then
            block=610
        elseif block == 610 then
            r[34]=r[32]
            r[33] = r[34][("GetAttribute")]
            r[35]=("MovementLocked")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(true)
            if not (r[33] == r[34]) then block=722 else block=652 end
        elseif block == 652 then
            r[33]=(587784)
            r[33]=r[31] == r[33]
            if not r[33] then block=701 else block=673 end
        elseif block == 673 then
            r[20]=r[9][r[3]]
            r[16]=r[17] < r[11]
            r[1]=env[(602149)]
            r[7]=r[23][(533952)]
            block=701
        elseif block == 701 then
            r[33]=(false)
            return r[33]
        elseif block == 715 then
            block=722
        elseif block == 722 then
            r[34]=upvalues[4][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=not r[33]
            r[34]=r[35]
            if r[34] then block=785 else block=764 end
        elseif block == 764 then
            r[35] = r[33][("Health")]
            r[35] = r[35] <= (0)
            r[34]=r[35]
            block=785
        elseif block == 785 then
            if not r[34] then block=813 else block=792 end
        elseif block == 792 then
            r[34]=(false)
            return r[34]
        elseif block == 806 then
            block=813
        elseif block == 813 then
            r[35] = r[33][("PlatformStand")]
            r[34]=r[35]
            if r[34] then block=848 else block=834 end
        elseif block == 834 then
            r[35] = r[33][("Sit")]
            r[34]=r[35]
            block=848
        elseif block == 848 then
            if not r[34] then block=876 else block=855 end
        elseif block == 855 then
            r[34]=(false)
            return r[34]
        elseif block == 869 then
            block=876
        elseif block == 876 then
            r[34]=(true)
            return r[34]
        elseif block == 890 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[11] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(968996)
            r[33]=r[31]
            if r[33] then block=50 else block=22 end
        elseif block == 22 then
            r[35]=upvalues[1][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33]=r[34]
            block=50
        elseif block == 50 then
            r[31]=r[33]
            r[33]=(990764)
            r[33]=r[32] == r[33]
            if not r[33] then block=85 else block=78 end
        elseif block == 78 then
            r[2]=r[10] * r[4]
            block=85
        elseif block == 85 then
            r[34]=upvalues[2][7]
            r[34] = r[34][("profile")]
            r[33]=r[34]
            if not r[33] then block=141 else block=113 end
        elseif block == 113 then
            r[34]=upvalues[2][7]
            r[34] = r[34][("profileRole")]
            r[34] = r[34] == r[31]
            r[33]=r[34]
            block=141
        elseif block == 141 then
            if not r[33] then block=211 else block=148 end
        elseif block == 148 then
            r[34]=upvalues[2][7]
            r[34] = r[34][("profile")]
            r[34] = r[34][("MaxSpeed")]
            r[33]=r[34]
            if r[33] then block=197 else block=183 end
        elseif block == 183 then
            r[34]=(16)
            r[33]=r[34]
            block=197
        elseif block == 197 then
            return r[33]
        elseif block == 204 then
            block=211
        elseif block == 211 then
            r[34] = env[("pcall")]
            r[33]=r[34]
            r[34]=upvalues[3][7]
            r[34] = r[34][("get")]
            r[35]=r[31]
            r[36]=upvalues[4][7]
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=2; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=(998912)
            r[35]=r[32] == r[35]
            if not r[35] then block=309 else block=281 end
        elseif block == 281 then
            r[17]=r[20] .. r[24]
            r[24]=r[23] < r[7]
            r[16]=r[24]
            r[11]=env[("MaxSpeed")]
            block=309
        elseif block == 309 then
            r[35]=r[33]
            if not r[35] then block=330 else block=323 end
        elseif block == 323 then
            r[35]=r[34]
            block=330
        elseif block == 330 then
            if not r[35] then block=428 else block=337 end
        elseif block == 337 then
            r[35]=r[34]
            r[36]=upvalues[2][7]
            r[36][("profile")]=r[35]
            r[35]=r[31]
            r[36]=upvalues[2][7]
            r[36][("profileRole")]=r[35]
            r[36] = r[34][("MaxSpeed")]
            r[35]=r[36]
            if r[35] then block=414 else block=400 end
        elseif block == 400 then
            r[36]=(16)
            r[35]=r[36]
            block=414
        elseif block == 414 then
            return r[35]
        elseif block == 421 then
            block=428
        elseif block == 428 then
            r[35]=(16)
            return r[35]
        elseif block == 442 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[12] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(712310)
            r[33] = env[("math")]
            r[33] = r[33][("max")]
            r[32]=r[33]
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[34]=("Runner")
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(1)
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(774228)
            r[33]=r[31] == r[33]
            if not r[33] then block=99 else block=92 end
        elseif block == 92 then
            do local f=r[14]; local n=6; if n<0 then n=top-14-1 end; local m=3; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            block=99
        elseif block == 99 then
            r[33]=upvalues[2][7]
            r[33] = r[33][("customSpeed")]
            if not r[33] then block=239 else block=120 end
        elseif block == 120 then
            r[33]=(760254)
            r[33]=r[31] == r[33]
            if not r[33] then block=162 else block=141 end
        elseif block == 141 then
            do local f=r[15]; local n=2; if n<0 then n=top-15-1 end; local m=15; if m==1 then r[15]=f(unpackValues(r,16,15+n)); top=16 elseif m==0 then f(unpackValues(r,16,15+n)); top=15 else local result=packValues(f(unpackValues(r,16,15+n))); if m<0 then m=result.n end; for i=1,m do r[15+i-1]=result[i] end; top=15+m end end
            r[20]=r[20] == r[24]
            r[23]=#r[20]
            block=162
        elseif block == 162 then
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=upvalues[2][7]
            r[34] = r[34][("speedMultiplier")]
            r[35]=(1)
            r[36]=(2)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34] = r[32] * r[33]
            r[32]=r[34]
            block=239
        elseif block == 239 then
            return r[32]
        elseif block == 246 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[13] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(134633)
            r[32]=(171964)
            r[32]=r[31] == r[32]
            if not r[32] then block=43 else block=29 end
        elseif block == 29 then
            r[11]=env[(nil)]
            r[4]=r[8] * r[13]
            block=43
        elseif block == 43 then
            r[33] = env[("math")]
            r[33] = r[33][("max")]
            r[32]=r[33]
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[34]=("Catcher")
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(1)
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=upvalues[2][7]
            r[33] = r[33][("catcherCustomSpeed")]
            if not r[33] then block=204 else block=127 end
        elseif block == 127 then
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=upvalues[2][7]
            r[34] = r[34][("catcherSpeedMultiplier")]
            r[35]=(1)
            r[36]=(2)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34] = r[32] * r[33]
            r[32]=r[34]
            block=204
        elseif block == 204 then
            return r[32]
        elseif block == 211 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[14] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(728638)
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[34]=upvalues[2][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=not r[32]
            r[34]=r[35]
            if r[34] then block=85 else block=71 end
        elseif block == 71 then
            r[35]=not r[33]
            r[34]=r[35]
            block=85
        elseif block == 85 then
            if not r[34] then block=134 else block=92 end
        elseif block == 92 then
            r[34]=(797064)
            r[34]=r[31] == r[34]
            if not r[34] then block=120 else block=113 end
        elseif block == 113 then
            r[1]=r[3] < r[16]
            block=120
        elseif block == 120 then
            return unpackValues(r, 0, -1)
        elseif block == 127 then
            block=134
        elseif block == 134 then
            r[34]=(742693)
            r[34]=r[31] == r[34]
            if not r[34] then block=176 else block=155 end
        elseif block == 155 then
            r[8]=r[9]
            r[23]=r[19] * r[10]
            r[13]=r[8] * r[16]
            block=176
        elseif block == 176 then
            r[35] = env[("tonumber")]
            r[34]=r[35]
            r[36]=r[33]
            r[35] = r[36][("GetAttribute")]
            r[37]=("MovementSpeed")
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local f=r[34]; local n=-1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=r[34]
            if not r[35] then block=253 else block=239 end
        elseif block == 239 then
            r[36] = r[34] > (0)
            r[35]=r[36]
            block=253
        elseif block == 253 then
            if not r[35] then block=281 else block=260 end
        elseif block == 260 then
            r[35]=r[34]
            r[32][("WalkSpeed")]=r[35]
            block=281
        elseif block == 281 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[15] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(743860)
            r[33]=(771946)
            r[33]=r[32] == r[33]
            if not r[33] then block=43 else block=29 end
        elseif block == 29 then
            r[0]=r[13]
            do local f=r[3]; local n=4; if n<0 then n=top-3-1 end; local m=22; if m==1 then r[3]=f(unpackValues(r,4,3+n)); top=4 elseif m==0 then f(unpackValues(r,4,3+n)); top=3 else local result=packValues(f(unpackValues(r,4,3+n))); if m<0 then m=result.n end; for i=1,m do r[3+i-1]=result[i] end; top=3+m end end
            block=43
        elseif block == 43 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("pingAt")]
            r[33] = r[31] - r[33]
            if not (r[33] < (0.5)) then block=85 else block=71 end
        elseif block == 71 then
            return unpackValues(r, 0, -1)
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[33]=r[31]
            r[34]=upvalues[1][7]
            r[34][("pingAt")]=r[33]
            r[33]=(0)
            r[33]={[7]=r[33]}
            r[35] = env[("pcall")]
            r[34]=r[35]
            do local captures = {}
            captures[1] = upvalues[2]
            captures[2] = r[33]
            r[35]=function(...) return functions[16](captures, ...) end
            end
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=(763227)
            r[34]=r[32] == r[34]
            if not r[34] then block=183 else block=169 end
        elseif block == 169 then
            r[25]=env[(nil)]
            r[12]=r[12] / r[20]
            block=183
        elseif block == 183 then
            r[35] = env[("math")]
            r[35] = r[35][("max")]
            r[34]=r[35]
            r[35]=r[33][7]
            r[36]=(0)
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=upvalues[1][7]
            r[35][("ping")]=r[34]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[16] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(713449)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("GetNetworkPing")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32] = r[32] * (0.5)
            upvalues[2][7]=r[32]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[17] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(911248)
            r[33] = env[("os")]
            r[33] = r[33][("clock")]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=upvalues[1][7]
            r[33] = r[33][("mapCacheAt")]
            r[33] = r[32] - r[33]
            if not (r[33] < (0.35)) then block=92 else block=64 end
        elseif block == 64 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("mapCache")]
            return r[33]
        elseif block == 85 then
            block=92
        elseif block == 92 then
            r[33]=r[32]
            r[34]=upvalues[1][7]
            r[34][("mapCacheAt")]=r[33]
            r[35]=upvalues[2][7]
            r[34]=r[35]
            r[33] = r[34][("FindFirstChild")]
            r[35]=("ActiveMap")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=r[33]
            if not r[34] then block=281 else block=162 end
        elseif block == 162 then
            r[37]=r[33]
            r[36] = r[37][("IsA")]
            r[38]=("ObjectValue")
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            if not r[35] then block=274 else block=204 end
        elseif block == 204 then
            r[37] = r[33][("Value")]
            r[36]=r[37]
            if not r[36] then block=267 else block=225 end
        elseif block == 225 then
            r[39] = r[33][("Value")]
            r[38]=r[39]
            r[37] = r[38][("IsDescendantOf")]
            r[39] = env[("workspace")]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            block=267
        elseif block == 267 then
            r[35]=r[36]
            block=274
        elseif block == 274 then
            r[34]=r[35]
            block=281
        elseif block == 281 then
            if not r[34] then block=337 else block=288 end
        elseif block == 288 then
            r[34] = r[33][("Value")]
            r[35]=upvalues[1][7]
            r[35][("mapCache")]=r[34]
            r[34]=upvalues[1][7]
            r[34] = r[34][("mapCache")]
            return r[34]
        elseif block == 330 then
            block=337
        elseif block == 337 then
            r[34]=nil
            r[36] = env[("ipairs")]
            r[35]=r[36]
            r[38] = env[("workspace")]
            r[37]=r[38]
            r[36] = r[37][("GetChildren")]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=-1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            do local f=r[35]; local n=-1; if n<0 then n=top-35-1 end; local m=3; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            block=505
        elseif block == 400 then
            r[41]=r[39]
            r[40] = r[41][("FindFirstChild")]
            r[42]=("Field")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            if not r[40] then block=505 else block=435 end
        elseif block == 435 then
            r[40]=r[39]
            r[34]=r[40]
            r[40]=(989619)
            r[40]=r[31] == r[40]
            if not r[40] then block=491 else block=470 end
        elseif block == 470 then
            r[23]=r[11] - r[14]
            r[24]=#r[2]
            r[22]=r[19] + r[2]
            block=491
        elseif block == 491 then
            block=519
        elseif block == 498 then
            block=505
        elseif block == 505 then
            r[38], r[39]=r[35](r[36],r[37])
            if r[38]~=nil then r[37]=r[38]; block=400 else block=519 end
        elseif block == 519 then
            r[35]=(922634)
            r[35]=r[31] == r[35]
            if not r[35] then block=561 else block=540 end
        elseif block == 540 then
            r[15]=r[15] .. r[23]
            do local f=r[14]; local n=13; if n<0 then n=top-14-1 end; local m=10; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            r[24]=#r[10]
            block=561
        elseif block == 561 then
            r[35]=r[34]
            r[36]=upvalues[1][7]
            r[36][("mapCache")]=r[35]
            return r[34]
        elseif block == 589 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[18] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(631800)
            r[33]=not r[31]
            if not r[33] then block=85 else block=22 end
        elseif block == 22 then
            r[33]=(725506)
            r[33]=r[32] == r[33]
            if not r[33] then block=64 else block=43 end
        elseif block == 43 then
            r[5][r[23]]=r[17]
            r[0]=r[12] == r[19]
            r[15]=r[7][r[23]]
            block=64
        elseif block == 64 then
            r[33]=nil
            return r[33]
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[34]=r[31]
            r[33] = r[34][("FindFirstChild")]
            r[35]=("Field")
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=r[33]
            if r[34] then block=169 else block=127 end
        elseif block == 127 then
            r[36]=r[31]
            r[35] = r[36][("FindFirstChild")]
            r[37]=("Field")
            r[38]=(true)
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34]=r[35]
            block=169
        elseif block == 169 then
            return r[34]
        elseif block == 176 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[19] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(526548)
            r[33]=not r[31]
            if not r[33] then block=85 else block=22 end
        elseif block == 22 then
            r[33]=(616960)
            r[33]=r[32] == r[33]
            if not r[33] then block=64 else block=43 end
        elseif block == 43 then
            r[5][(nil)]=r[12]
            r[5]=r[5] * r[16]
            r[4]=r[12] / r[20]
            block=64
        elseif block == 64 then
            r[33]=nil
            return r[33]
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[33]=(586795)
            r[33]=r[32] == r[33]
            if not r[33] then block=113 else block=106 end
        elseif block == 106 then
            r[5]=r[5] / r[13]
            block=113
        elseif block == 113 then
            r[34]=r[31]
            r[33] = r[34][("FindFirstChild")]
            r[35]=("InvisWall")
            r[36]=(true)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=-1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 33, top-1)
        elseif block == 155 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[20] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(941158)
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[34]=upvalues[2][7]
            r[33]=r[34]
            r[34]=r[32]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(996617)
            r[34]=r[31] == r[34]
            if not r[34] then block=99 else block=78 end
        elseif block == 78 then
            r[11]=r[17] + r[6]
            r[3]=env[(996617)]
            r[19]=env[("new")]
            block=99
        elseif block == 99 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            r[35]=r[33]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=r[33]
            if r[35] then block=148 else block=141 end
        elseif block == 141 then
            r[35]=r[32]
            block=148
        elseif block == 148 then
            r[37]=upvalues[4][7]
            r[37] = r[37][("map")]
            r[37] = r[37] == r[32]
            r[36]=r[37]
            if not r[36] then block=288 else block=183 end
        elseif block == 183 then
            r[38]=upvalues[4][7]
            r[38] = r[38][("field")]
            r[38] = r[38] == r[33]
            r[37]=r[38]
            if not r[37] then block=281 else block=218 end
        elseif block == 218 then
            r[39]=upvalues[4][7]
            r[39] = r[39][("invisWall")]
            r[39] = r[39] == r[34]
            r[38]=r[39]
            if not r[38] then block=274 else block=253 end
        elseif block == 253 then
            r[39]=upvalues[4][7]
            r[39] = r[39][("params")]
            r[38]=r[39]
            block=274
        elseif block == 274 then
            r[37]=r[38]
            block=281
        elseif block == 281 then
            r[36]=r[37]
            block=288
        elseif block == 288 then
            if not r[36] then block=309 else block=295 end
        elseif block == 295 then
            return unpackValues(r, 0, -1)
        elseif block == 302 then
            block=309
        elseif block == 309 then
            r[37] = env[("RaycastParams")]
            r[37] = r[37][("new")]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37] = env[("Enum")]
            r[37] = r[37][("RaycastFilterType")]
            r[37] = r[37][("Include")]
            r[36][("FilterType")]=r[37]
            r[38]=r[35]
            if not r[38] then block=400 else block=379 end
        elseif block == 379 then
            r[39]={}
            r[39][(1)]=r[35]
            r[38]=r[39]
            block=400
        elseif block == 400 then
            r[37]=r[38]
            if r[37] then block=428 else block=414 end
        elseif block == 414 then
            r[38]={}
            r[37]=r[38]
            block=428
        elseif block == 428 then
            r[36][("FilterDescendantsInstances")]=r[37]
            r[37]=(true)
            r[36][("IgnoreWater")]=r[37]
            r[37]=r[32]
            r[38]=upvalues[4][7]
            r[38][("map")]=r[37]
            r[37]=r[33]
            r[38]=upvalues[4][7]
            r[38][("field")]=r[37]
            r[37]=(964176)
            r[37]=r[31] == r[37]
            if not r[37] then block=540 else block=512 end
        elseif block == 512 then
            r[10]=r[18]
            r[23]=("invisWall")
            r[3]=r[25] == r[22]
            r[18]=r[16]
            block=540
        elseif block == 540 then
            r[37]=r[34]
            r[38]=upvalues[4][7]
            r[38][("invisWall")]=r[37]
            r[37]=r[36]
            r[38]=upvalues[4][7]
            r[38][("params")]=r[37]
            r[37]=nil
            r[38]=upvalues[4][7]
            r[38][("wallParams")]=r[37]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[21] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(387328)
            r[32]=(422199)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=29 end
        elseif block == 29 then
            r[5][r[15]]=r[25]
            r[13]=r[9] - r[4]
            r[25]=#r[19]
            block=50
        elseif block == 50 then
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]=upvalues[2][7]
            r[32] = r[32][("params")]
            return r[32]
        elseif block == 92 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[22] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(233731)
            r[32]=(277115)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=29 end
        elseif block == 29 then
            r[13]=r[6] * r[23]
            r[8][("invisWall")]=r[21]
            r[19]=#r[6]
            block=50
        elseif block == 50 then
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]=(298930)
            r[32]=r[31] == r[32]
            if not r[32] then block=120 else block=92 end
        elseif block == 92 then
            r[8]=r[11] - r[7]
            r[0]=r[20][r[20]]
            r[5]=r[0] * r[5]
            r[12]=#r[23]
            block=120
        elseif block == 120 then
            r[32]=upvalues[2][7]
            r[32] = r[32][("invisWall")]
            r[34]=not r[32]
            r[33]=r[34]
            if r[33] then block=197 else block=155 end
        elseif block == 155 then
            r[35]=r[32]
            r[34] = r[35][("IsDescendantOf")]
            r[36] = env[("workspace")]
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=not r[34]
            r[33]=r[34]
            block=197
        elseif block == 197 then
            if not r[33] then block=337 else block=204 end
        elseif block == 204 then
            r[33]=(256078)
            r[33]=r[31] == r[33]
            if not r[33] then block=239 else block=225 end
        elseif block == 225 then
            r[9][r[22]]=r[0]
            r[2]=r[9][(254330)]
            block=239
        elseif block == 239 then
            r[33]=nil
            r[34]=upvalues[2][7]
            r[34][("invisWall")]=r[33]
            r[33]=nil
            r[34]=upvalues[2][7]
            r[34][("wallParams")]=r[33]
            r[33]=(254330)
            r[33]=r[31] == r[33]
            if not r[33] then block=316 else block=302 end
        elseif block == 302 then
            r[25]=r[15] == r[7]
            r[4]=r[1][r[7]]
            block=316
        elseif block == 316 then
            r[33]=nil
            return r[33]
        elseif block == 330 then
            block=337
        elseif block == 337 then
            r[33]=(289992)
            r[33]=r[31] == r[33]
            if not r[33] then block=365 else block=358 end
        elseif block == 358 then
            r[20]=#r[0]
            block=365
        elseif block == 365 then
            r[33]=upvalues[2][7]
            r[33] = r[33][("wallParams")]
            if not r[33] then block=414 else block=386 end
        elseif block == 386 then
            r[33]=upvalues[2][7]
            r[33] = r[33][("wallParams")]
            return r[33]
        elseif block == 407 then
            block=414
        elseif block == 414 then
            r[33]=(264040)
            r[33]=r[31] == r[33]
            if not r[33] then block=449 else block=435 end
        elseif block == 435 then
            r[12]=r[15][r[22]]
            r[24]=r[17] .. r[15]
            block=449
        elseif block == 449 then
            r[34] = env[("RaycastParams")]
            r[34] = r[34][("new")]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34] = env[("Enum")]
            r[34] = r[34][("RaycastFilterType")]
            r[34] = r[34][("Include")]
            r[33][("FilterType")]=r[34]
            r[34]={}
            r[34][(1)]=r[32]
            r[33][("FilterDescendantsInstances")]=r[34]
            r[34]=(312701)
            r[34]=r[31] == r[34]
            if not r[34] then block=568 else block=547 end
        elseif block == 547 then
            r[25]=(289992)
            r[15]=r[5] < r[5]
            r[7]=#r[21]
            block=568
        elseif block == 568 then
            r[34]=(true)
            r[33][("IgnoreWater")]=r[34]
            r[34]=r[33]
            r[35]=upvalues[2][7]
            r[35][("wallParams")]=r[34]
            return r[33]
        elseif block == 610 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[23] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(605476)
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[32]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36] = r[35][("Magnitude")]
            if not (r[36] < (0.05)) then block=71 else block=50 end
        elseif block == 50 then
            r[36]=nil
            return r[36]
        elseif block == 64 then
            block=71
        elseif block == 71 then
            r[37]=upvalues[2][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=not r[36]
            if not r[37] then block=176 else block=106 end
        elseif block == 106 then
            r[37]=(692820)
            r[37]=r[34] == r[37]
            if not r[37] then block=155 else block=127 end
        elseif block == 127 then
            r[2][r[7]]=r[10]
            r[11]=r[16] < r[18]
            r[5]=r[13] - r[10]
            r[0]=r[23] + r[10]
            block=155
        elseif block == 155 then
            r[37]=nil
            return r[37]
        elseif block == 169 then
            block=176
        elseif block == 176 then
            r[37] = r[35][("Unit")]
            r[35]=r[37]
            r[38] = env[("Vector3")]
            r[38] = r[38][("new")]
            r[37]=r[38]
            r[38] = r[31][("X")]
            r[39] = r[31][("Y")]
            r[39] = r[39] + (2.5)
            r[40] = r[31][("Z")]
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[40] = env[("workspace")]
            r[39]=r[40]
            r[38] = r[39][("Raycast")]
            r[40]=r[37]
            r[41] = r[35] * r[33]
            r[42]=r[36]
            do local f=r[38]; local n=4; if n<0 then n=top-38-1 end; local m=-1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            return unpackValues(r, 38, top-1)
        elseif block == 302 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[24] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(58404)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=not r[34]
            if not r[35] then block=64 else block=43 end
        elseif block == 43 then
            r[35]=(true)
            return r[35]
        elseif block == 57 then
            block=64
        elseif block == 64 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=not r[35]
            r[36]=r[37]
            if r[36] then block=134 else block=106 end
        elseif block == 106 then
            r[37] = r[35][("FilterDescendantsInstances")]
            r[37]=#r[37]
            r[37] = r[37] == (0)
            r[36]=r[37]
            block=134
        elseif block == 134 then
            if not r[36] then block=204 else block=141 end
        elseif block == 141 then
            r[36]=(121702)
            r[36]=r[33] == r[36]
            if not r[36] then block=183 else block=162 end
        elseif block == 162 then
            r[18]=("Raycast")
            r[16]=r[16] .. r[9]
            r[7]=env[(133719)]
            block=183
        elseif block == 183 then
            r[36]=(false)
            return r[36]
        elseif block == 197 then
            block=204
        elseif block == 204 then
            r[37] = env[("Vector3")]
            r[37] = r[37][("new")]
            r[36]=r[37]
            r[37] = r[31][("X")]
            r[39] = env[("math")]
            r[39] = r[39][("max")]
            r[38]=r[39]
            r[39] = r[32] + (12)
            r[40] = r[31][("Y")]
            r[40] = r[40] + (10)
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39] = r[31][("Z")]
            do local f=r[36]; local n=3; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = env[("Vector3")]
            r[38] = r[38][("new")]
            r[37]=r[38]
            r[38]=(0)
            r[39]=upvalues[3][7]
            r[39] = r[39][("edgeRayHeight")]
            r[40]=upvalues[3][7]
            r[40] = r[40][("edgeRayDepth")]
            r[39] = r[39] + r[40]
            r[39]=-r[39]
            r[40]=(0)
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[40] = env[("workspace")]
            r[39]=r[40]
            r[38] = r[39][("Raycast")]
            r[40]=r[36]
            r[41]=r[37]
            r[42]=r[35]
            do local f=r[38]; local n=4; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39]=(133719)
            r[39]=r[33] == r[39]
            if not r[39] then block=456 else block=449 end
        elseif block == 449 then
            r[2]=r[0] * r[15]
            block=456
        elseif block == 456 then
            r[40]=nil
            r[40] = r[38] ~= r[40]
            r[39]=r[40]
            if not r[39] then block=512 else block=484 end
        elseif block == 484 then
            r[40] = r[38][("Normal")]
            r[40] = r[40][("Y")]
            r[40] = r[40] >= (0.35)
            r[39]=r[40]
            block=512
        elseif block == 512 then
            return r[39]
        elseif block == 519 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[25] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(586135)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[35]=r[31]
            r[36]=r[32]
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=-1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            return unpackValues(r, 34, top-1)
        elseif block == 50 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[26] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(601952)
            r[35]=(642120)
            r[35]=r[34] == r[35]
            if not r[35] then block=43 else block=29 end
        elseif block == 29 then
            r[16]=r[22] / r[19]
            r[4]=#r[18]
            block=43
        elseif block == 43 then
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[32]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36] = r[35][("Magnitude")]
            if not (r[36] < (0.05)) then block=106 else block=85 end
        elseif block == 85 then
            r[36]=(0)
            return r[36]
        elseif block == 99 then
            block=106
        elseif block == 106 then
            r[36] = r[35][("Unit")]
            r[35]=r[36]
            r[37] = env[("Vector3")]
            r[37] = r[37][("new")]
            r[36]=r[37]
            r[37] = r[35][("Z")]
            r[37]=-r[37]
            r[38]=(0)
            r[39] = r[35][("X")]
            do local f=r[36]; local n=3; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=(634513)
            r[37]=r[34] == r[37]
            if not r[37] then block=204 else block=197 end
        elseif block == 197 then
            r[4]=r[9] - r[16]
            block=204
        elseif block == 204 then
            r[37]=(0)
            r[38]=(634625)
            r[38]=r[34] == r[38]
            if not r[38] then block=246 else block=232 end
        elseif block == 232 then
            r[1]=env[(0)]
            r[6]=#r[23]
            block=246
        elseif block == 246 then
            r[39]=upvalues[2][7]
            r[38]=r[39]
            r[39] = r[35] * (6)
            r[39] = r[31] + r[39]
            r[40]=r[33]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not r[38] then block=358 else block=295 end
        elseif block == 295 then
            r[38]=(607467)
            r[38]=r[34] == r[38]
            if not r[38] then block=330 else block=316 end
        elseif block == 316 then
            r[0]=r[4] == r[19]
            r[10]=env[(601952)]
            block=330
        elseif block == 330 then
            r[38]=(2)
            r[39] = r[37] + r[38]
            r[37]=r[39]
            block=358
        elseif block == 358 then
            r[39]=upvalues[2][7]
            r[38]=r[39]
            r[39] = r[35] * (14)
            r[39] = r[31] + r[39]
            r[40]=r[33]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not r[38] then block=477 else block=407 end
        elseif block == 407 then
            r[38]=(630001)
            r[38]=r[34] == r[38]
            if not r[38] then block=449 else block=428 end
        elseif block == 428 then
            r[22][r[18]]=r[25]
            r[19]=(3)
            r[3]=("Unit")
            block=449
        elseif block == 449 then
            r[38]=(2)
            r[39] = r[37] + r[38]
            r[37]=r[39]
            block=477
        elseif block == 477 then
            r[38]=(698555)
            r[38]=r[34] == r[38]
            if not r[38] then block=526 else block=498 end
        elseif block == 498 then
            r[7]=r[0] / r[24]
            r[8]=r[3] + r[1]
            do local f=r[19]; local n=18; if n<0 then n=top-19-1 end; local m=6; if m==1 then r[19]=f(unpackValues(r,20,19+n)); top=20 elseif m==0 then f(unpackValues(r,20,19+n)); top=19 else local result=packValues(f(unpackValues(r,20,19+n))); if m<0 then m=result.n end; for i=1,m do r[19+i-1]=result[i] end; top=19+m end end
            r[15]=r[23] / r[12]
            block=526
        elseif block == 526 then
            r[39]=upvalues[2][7]
            r[38]=r[39]
            r[39] = r[35] * (24)
            r[39] = r[31] + r[39]
            r[40]=r[33]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not r[38] then block=631 else block=575 end
        elseif block == 575 then
            r[38]=(619001)
            r[38]=r[34] == r[38]
            if not r[38] then block=603 else block=596 end
        elseif block == 596 then
            r[7]=r[11] < r[16]
            block=603
        elseif block == 603 then
            r[38]=(1)
            r[39] = r[37] + r[38]
            r[37]=r[39]
            block=631
        elseif block == 631 then
            r[39]=upvalues[2][7]
            r[38]=r[39]
            r[39] = r[35] * (14)
            r[39] = r[31] + r[39]
            r[40] = r[36] * (3)
            r[39] = r[39] + r[40]
            r[40]=r[33]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not r[38] then block=764 else block=694 end
        elseif block == 694 then
            r[38]=(636751)
            r[38]=r[34] == r[38]
            if not r[38] then block=736 else block=715 end
        elseif block == 715 then
            r[20]=r[22]
            r[15]=r[18] .. r[18]
            r[18]=(0)
            block=736
        elseif block == 736 then
            r[38]=(1)
            r[39] = r[37] + r[38]
            r[37]=r[39]
            block=764
        elseif block == 764 then
            r[39]=upvalues[2][7]
            r[38]=r[39]
            r[39] = r[35] * (14)
            r[39] = r[31] + r[39]
            r[40] = r[36] * (3)
            r[39] = r[39] - r[40]
            r[40]=r[33]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not r[38] then block=855 else block=827 end
        elseif block == 827 then
            r[38]=(1)
            r[39] = r[37] + r[38]
            r[37]=r[39]
            block=855
        elseif block == 855 then
            return r[37]
        elseif block == 862 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[27] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    r[34] = args[4]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[35]=(671325)
            r[37]=upvalues[1][7]
            r[36]=r[37]
            r[37]=r[32]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37] = r[36][("Magnitude")]
            if not (r[37] < (0.05)) then block=71 else block=50 end
        elseif block == 50 then
            r[37]=(false)
            return r[37]
        elseif block == 64 then
            block=71
        elseif block == 71 then
            r[37]=(745436)
            r[37]=r[35] == r[37]
            if not r[37] then block=106 else block=92 end
        elseif block == 92 then
            r[10]=r[1] == r[24]
            r[21][(4)]=r[15]
            block=106
        elseif block == 106 then
            r[37] = r[36][("Unit")]
            r[36]=r[37]
            r[37]=(691013)
            r[37]=r[35] == r[37]
            if not r[37] then block=155 else block=141 end
        elseif block == 141 then
            r[13]=r[6] * r[6]
            do local f=r[11]; local n=1; if n<0 then n=top-11-1 end; local m=19; if m==1 then r[11]=f(unpackValues(r,12,11+n)); top=12 elseif m==0 then f(unpackValues(r,12,11+n)); top=11 else local result=packValues(f(unpackValues(r,12,11+n))); if m<0 then m=result.n end; for i=1,m do r[11+i-1]=result[i] end; top=11+m end end
            block=155
        elseif block == 155 then
            r[38]=upvalues[2][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[36]
            r[41] = env[("math")]
            r[41] = r[41][("max")]
            r[40]=r[41]
            r[41]=(8)
            r[42]=r[34]
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=-1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            do local f=r[37]; local n=-1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            if not r[37] then block=302 else block=239 end
        elseif block == 239 then
            r[37]=(739444)
            r[37]=r[35] == r[37]
            if not r[37] then block=281 else block=260 end
        elseif block == 260 then
            r[7][r[17]]=r[12]
            r[3]=r[1] * r[12]
            r[13][r[22]]=r[13]
            block=281
        elseif block == 281 then
            r[37]=(false)
            return r[37]
        elseif block == 295 then
            block=302
        elseif block == 302 then
            r[38]=upvalues[3][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[36]
            r[40]=r[33]
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            if not (r[34] <= (14)) then block=372 else block=351 end
        elseif block == 351 then
            r[38] = r[37] >= (4)
            return r[38]
        elseif block == 365 then
            block=372
        elseif block == 372 then
            r[38] = r[37] >= (5)
            return r[38]
        elseif block == 386 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[28] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(335765)
            r[35]=(361066)
            r[35]=r[34] == r[35]
            if not r[35] then block=50 else block=29 end
        elseif block == 29 then
            r[19]=env[(nil)]
            r[11]=r[17] < r[22]
            r[21][r[18]]=r[22]
            block=50
        elseif block == 50 then
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[32]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36] = r[35][("Magnitude")]
            if not (r[36] < (0.05)) then block=113 else block=92 end
        elseif block == 92 then
            r[36]=(true)
            return r[36]
        elseif block == 106 then
            block=113
        elseif block == 113 then
            r[36] = r[35][("Unit")]
            r[35]=r[36]
            r[38]=upvalues[2][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[35]
            r[40]=r[33]
            r[41]=upvalues[3][7]
            r[41] = r[41][("edgeLookAhead")]
            do local f=r[37]; local n=4; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=not r[37]
            r[36]=r[37]
            if r[36] then block=274 else block=204 end
        elseif block == 204 then
            r[38]=upvalues[2][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[35]
            r[40]=r[33]
            r[41]=upvalues[3][7]
            r[41] = r[41][("edgeSecondLookAhead")]
            do local f=r[37]; local n=4; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=not r[37]
            r[36]=r[37]
            block=274
        elseif block == 274 then
            return r[36]
        elseif block == 281 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[29] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(490584)
            r[34]=(554458)
            r[34]=r[33] == r[34]
            if not r[34] then block=50 else block=29 end
        elseif block == 29 then
            r[13]=#r[20]
            do local f=r[0]; local n=4; if n<0 then n=top-0-1 end; local m=11; if m==1 then r[0]=f(unpackValues(r,1,0+n)); top=1 elseif m==0 then f(unpackValues(r,1,0+n)); top=0 else local result=packValues(f(unpackValues(r,1,0+n))); if m<0 then m=result.n end; for i=1,m do r[0+i-1]=result[i] end; top=0+m end end
            r[25]=r[20][r[9]]
            block=50
        elseif block == 50 then
            r[35] = env[("math")]
            r[35] = r[35][("rad")]
            r[34]=r[35]
            r[35]=r[32]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36] = env[("math")]
            r[36] = r[36][("cos")]
            r[35]=r[36]
            r[36]=r[34]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37] = env[("math")]
            r[37] = r[37][("sin")]
            r[36]=r[37]
            r[37]=r[34]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = env[("Vector3")]
            r[38] = r[38][("new")]
            r[37]=r[38]
            r[38] = r[31][("X")]
            r[38] = r[38] * r[35]
            r[39] = r[31][("Z")]
            r[39] = r[39] * r[36]
            r[38] = r[38] - r[39]
            r[39]=(0)
            r[40] = r[31][("X")]
            r[40] = r[40] * r[36]
            r[41] = r[31][("Z")]
            r[41] = r[41] * r[35]
            r[40] = r[40] + r[41]
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=-1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            return unpackValues(r, 37, top-1)
        elseif block == 267 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[30] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(869301)
            r[33]=upvalues[1][7]
            r[33] = r[33][("a")]
            r[32]=r[33]
            if not r[32] then block=57 else block=36 end
        elseif block == 36 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("b")]
            r[32]=r[33]
            block=57
        elseif block == 57 then
            if not r[32] then block=169 else block=64 end
        elseif block == 64 then
            r[32]=(905010)
            r[32]=r[31] == r[32]
            if not r[32] then block=99 else block=85 end
        elseif block == 85 then
            r[22]=r[8] .. r[25]
            r[20][(nil)]=r[14]
            block=99
        elseif block == 99 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("a")]
            r[32] = r[32][("center")]
            r[33]=upvalues[1][7]
            r[33] = r[33][("b")]
            r[33] = r[33][("center")]
            r[32] = r[32] + r[33]
            r[32] = r[32] * (0.5)
            return r[32]
        elseif block == 162 then
            block=169
        elseif block == 169 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("a")]
            if not r[32] then block=253 else block=190 end
        elseif block == 190 then
            r[32]=(963089)
            r[32]=r[31] == r[32]
            if not r[32] then block=218 else block=211 end
        elseif block == 211 then
            r[0]=r[4][(nil)]
            block=218
        elseif block == 218 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("a")]
            r[32] = r[32][("center")]
            return r[32]
        elseif block == 246 then
            block=253
        elseif block == 253 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("b")]
            if not r[32] then block=309 else block=274 end
        elseif block == 274 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("b")]
            r[32] = r[32][("center")]
            return r[32]
        elseif block == 302 then
            block=309
        elseif block == 309 then
            r[32]=(891972)
            r[32]=r[31] == r[32]
            if not r[32] then block=344 else block=330 end
        elseif block == 330 then
            r[8]=r[22][r[6]]
            r[18]=r[7] - r[11]
            block=344
        elseif block == 344 then
            r[32]=nil
            return r[32]
        elseif block == 358 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[31] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(789399)
            r[34]=(865635)
            r[34]=r[33] == r[34]
            if not r[34] then block=43 else block=29 end
        elseif block == 29 then
            r[5][(3)]=r[3]
            r[14]=r[8] + r[14]
            block=43
        elseif block == 43 then
            r[34]={}
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[36]=(1)
            r[37]=(0)
            r[38]=(0)
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34][(1)]=r[35]
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[36]=(-1)
            r[37]=(0)
            r[38]=(0)
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34][(2)]=r[35]
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[36]=(0)
            r[37]=(0)
            r[38]=(1)
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34][(3)]=r[35]
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[36]=(0)
            r[37]=(0)
            r[38]=(-1)
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local n=-1; if n<0 then n=top-34-1 end; for i=1,n do r[34][3+i]=r[34+i] end end
            r[35] = env[("Vector3")]
            r[35] = r[35][("zero")]
            r[36]=(0)
            r[37]=(844020)
            r[37]=r[33] == r[37]
            if not r[37] then block=344 else block=316 end
        elseif block == 316 then
            r[14][(nil)]=r[6]
            r[4]=env[(nil)]
            r[11]=r[4] * r[19]
            r[5]=r[3] / r[21]
            block=344
        elseif block == 344 then
            r[38] = env[("ipairs")]
            r[37]=r[38]
            r[38]=r[34]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=3; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=540
        elseif block == 379 then
            r[44]=upvalues[1][7]
            r[43]=r[44]
            r[44]=r[31]
            r[45]=r[41]
            r[46]=(9)
            do local f=r[43]; local n=3; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[42]=r[43]
            if r[42] then block=491 else block=435 end
        elseif block == 435 then
            r[44]=upvalues[2][7]
            r[43]=r[44]
            r[44] = r[41] * (7)
            r[44] = r[31] + r[44]
            r[45]=r[32]
            do local f=r[43]; local n=2; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[43]=not r[43]
            r[42]=r[43]
            block=491
        elseif block == 491 then
            if not r[42] then block=540 else block=498 end
        elseif block == 498 then
            r[42] = r[35] + r[41]
            r[35]=r[42]
            r[42]=(1)
            r[43] = r[36] + r[42]
            r[36]=r[43]
            block=540
        elseif block == 540 then
            r[40], r[41]=r[37](r[38],r[39])
            if r[40]~=nil then r[39]=r[40]; block=379 else block=554 end
        elseif block == 554 then
            r[38] = r[36] == (0)
            r[37]=r[38]
            if r[37] then block=596 else block=575 end
        elseif block == 575 then
            r[38] = r[35][("Magnitude")]
            r[38] = r[38] < (0.05)
            r[37]=r[38]
            block=596
        elseif block == 596 then
            if not r[37] then block=631 else block=603 end
        elseif block == 603 then
            r[37] = env[("Vector3")]
            r[37] = r[37][("zero")]
            return r[37]
        elseif block == 624 then
            block=631
        elseif block == 631 then
            r[37]=(813883)
            r[37]=r[33] == r[37]
            if not r[37] then block=659 else block=652 end
        elseif block == 652 then
            r[0]=r[8] .. r[22]
            block=659
        elseif block == 659 then
            r[38]=upvalues[3][7]
            r[37]=r[38]
            r[38]=-r[35]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38] = r[37][("Magnitude")]
            if not (r[38] < (0.05)) then block=757 else block=701 end
        elseif block == 701 then
            r[38]=(884497)
            r[38]=r[33] == r[38]
            if not r[38] then block=729 else block=722 end
        elseif block == 722 then
            r[22]=r[25][r[25]]
            block=729
        elseif block == 729 then
            r[38] = env[("Vector3")]
            r[38] = r[38][("zero")]
            return r[38]
        elseif block == 750 then
            block=757
        elseif block == 757 then
            r[38]=(886077)
            r[38]=r[33] == r[38]
            if not r[38] then block=806 else block=778 end
        elseif block == 778 then
            r[15]=env[(884497)]
            r[22]=r[20][(7)]
            r[0]=r[8] == r[9]
            r[12]=#r[23]
            block=806
        elseif block == 806 then
            r[38] = r[37][("Unit")]
            r[37]=r[38]
            r[39]=upvalues[4][7]
            r[38]=r[39]
            r[39]=r[31]
            r[40]=r[37]
            r[41]=r[32]
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not (r[38] < (3)) then block=925 else block=869 end
        elseif block == 869 then
            r[38]=(838998)
            r[38]=r[33] == r[38]
            if not r[38] then block=897 else block=890 end
        elseif block == 890 then
            r[25]=r[17] == r[4]
            block=897
        elseif block == 897 then
            r[38] = env[("Vector3")]
            r[38] = r[38][("zero")]
            return r[38]
        elseif block == 918 then
            block=925
        elseif block == 925 then
            return r[37]
        elseif block == 932 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[32] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    r[34] = args[4]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[35]=(527570)
            r[36]=(621128)
            r[36]=r[35] == r[36]
            if not r[36] then block=57 else block=29 end
        elseif block == 29 then
            r[22]=r[19] .. r[24]
            r[4]=r[23] / r[7]
            r[1]=r[15] * r[25]
            r[13]=r[1]
            block=57
        elseif block == 57 then
            r[37]=upvalues[1][7]
            r[36]=r[37]
            r[37]=r[32]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=(595427)
            r[37]=r[35] == r[37]
            if not r[37] then block=127 else block=106 end
        elseif block == 106 then
            r[22]=r[16][(0.96)]
            r[13]=r[3] .. r[5]
            r[14]=r[21] * r[15]
            block=127
        elseif block == 127 then
            r[37] = r[36][("Magnitude")]
            if not (r[37] < (0.05)) then block=211 else block=141 end
        elseif block == 141 then
            r[37]=(583994)
            r[37]=r[35] == r[37]
            if not r[37] then block=176 else block=162 end
        elseif block == 162 then
            r[1]=r[18] + r[14]
            r[3]=r[20] == r[19]
            block=176
        elseif block == 176 then
            r[37] = env[("Vector3")]
            r[37] = r[37][("zero")]
            r[38]=(false)
            return unpackValues(r, 37, 38)
        elseif block == 204 then
            block=211
        elseif block == 211 then
            r[37] = r[36][("Unit")]
            r[36]=r[37]
            r[38] = env[("os")]
            r[38] = r[38][("clock")]
            r[37]=r[38]
            do local f=r[37]; local n=0; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=(610613)
            r[38]=r[35] == r[38]
            if not r[38] then block=302 else block=274 end
        elseif block == 274 then
            do local f=r[15]; local n=18; if n<0 then n=top-15-1 end; local m=6; if m==1 then r[15]=f(unpackValues(r,16,15+n)); top=16 elseif m==0 then f(unpackValues(r,16,15+n)); top=15 else local result=packValues(f(unpackValues(r,16,15+n))); if m<0 then m=result.n end; for i=1,m do r[15+i-1]=result[i] end; top=15+m end end
            r[13]=r[23] + r[16]
            r[17]=r[10] * r[3]
            r[0]=env[(569223)]
            block=302
        elseif block == 302 then
            r[39]=upvalues[2][7]
            r[39] = r[39][("edgeCheckPosition")]
            r[38]=r[39]
            if not r[38] then block=561 else block=330 end
        elseif block == 330 then
            r[40]=upvalues[2][7]
            r[40] = r[40][("edgeCheckDirection")]
            r[40] = r[40][("Magnitude")]
            r[40] = r[40] > (0.05)
            r[39]=r[40]
            if not r[39] then block=554 else block=372 end
        elseif block == 372 then
            r[41]=upvalues[2][7]
            r[41] = r[41][("edgeCheckAt")]
            r[41] = r[37] - r[41]
            r[41] = r[41] < (0.055)
            r[40]=r[41]
            if not r[40] then block=547 else block=414 end
        elseif block == 414 then
            r[43]=upvalues[1][7]
            r[42]=r[43]
            r[43]=upvalues[2][7]
            r[43] = r[43][("edgeCheckPosition")]
            r[43] = r[31] - r[43]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42] = r[42][("Magnitude")]
            r[42] = r[42] < (2.5)
            r[41]=r[42]
            if not r[41] then block=540 else block=484 end
        elseif block == 484 then
            r[44]=upvalues[2][7]
            r[44] = r[44][("edgeCheckDirection")]
            r[43]=r[44]
            r[42] = r[43][("Dot")]
            r[44]=r[36]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42] = r[42] > (0.96)
            r[41]=r[42]
            block=540
        elseif block == 540 then
            r[40]=r[41]
            block=547
        elseif block == 547 then
            r[39]=r[40]
            block=554
        elseif block == 554 then
            r[38]=r[39]
            block=561
        elseif block == 561 then
            if not r[38] then block=638 else block=568 end
        elseif block == 568 then
            r[38]=(569223)
            r[38]=r[35] == r[38]
            if not r[38] then block=596 else block=589 end
        elseif block == 589 then
            r[24]=r[23] < r[17]
            block=596
        elseif block == 596 then
            r[38]=upvalues[2][7]
            r[38] = r[38][("edgeDirection")]
            r[39]=upvalues[2][7]
            r[39] = r[39][("edgeRisk")]
            return unpackValues(r, 38, 39)
        elseif block == 631 then
            block=638
        elseif block == 638 then
            r[38]=(603597)
            r[38]=r[35] == r[38]
            if not r[38] then block=680 else block=659 end
        elseif block == 659 then
            r[9]=r[4] < r[11]
            r[2]=r[12] + r[19]
            r[19][("edgeCheckAt")]=r[14]
            block=680
        elseif block == 680 then
            r[39]=upvalues[3][7]
            r[38]=r[39]
            r[39]=r[31]
            r[40]=r[34]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[40]=upvalues[4][7]
            r[39]=r[40]
            r[40]=r[31]
            r[41]=r[36]
            r[42]=r[34]
            do local f=r[39]; local n=3; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=(603618)
            r[40]=r[35] == r[40]
            if not r[40] then block=799 else block=778 end
        elseif block == 778 then
            r[19][r[10]]=r[13]
            r[1]=r[5] * r[22]
            r[10]=r[22] == r[12]
            block=799
        elseif block == 799 then
            r[41] = r[38][("Magnitude")]
            r[41] = r[41] > (0.05)
            r[40]=r[41]
            if not r[40] then block=869 else block=827 end
        elseif block == 827 then
            r[42]=r[38]
            r[41] = r[42][("Dot")]
            r[43]=r[36]
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[41] < (0.35)
            r[40]=r[41]
            block=869
        elseif block == 869 then
            r[41]=r[37]
            r[42]=upvalues[2][7]
            r[42][("edgeCheckAt")]=r[41]
            r[41]=r[31]
            r[42]=upvalues[2][7]
            r[42][("edgeCheckPosition")]=r[41]
            r[41]=r[36]
            r[42]=upvalues[2][7]
            r[42][("edgeCheckDirection")]=r[41]
            r[41]=(531536)
            r[41]=r[35] == r[41]
            if not r[41] then block=974 else block=953 end
        elseif block == 953 then
            r[16]=env[("clock")]
            r[5]=r[19] < r[21]
            r[24]=r[8][(527570)]
            block=974
        elseif block == 974 then
            r[42]=upvalues[1][7]
            r[41]=r[42]
            r[42]=r[33]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[42]=upvalues[2][7]
            r[42][("edgeCheckGoal")]=r[41]
            r[41]=(600272)
            r[41]=r[35] == r[41]
            if not r[41] then block=1044 else block=1037 end
        elseif block == 1037 then
            r[8]=#r[12]
            block=1044
        elseif block == 1044 then
            r[42]=not r[39]
            r[41]=r[42]
            if not r[41] then block=1079 else block=1065 end
        elseif block == 1065 then
            r[42]=not r[40]
            r[41]=r[42]
            block=1079
        elseif block == 1079 then
            if not r[41] then block=1233 else block=1086 end
        elseif block == 1086 then
            r[41]=r[36]
            r[42]=upvalues[2][7]
            r[42][("edgeDirection")]=r[41]
            r[41]=(528055)
            r[41]=r[35] == r[41]
            if not r[41] then block=1135 else block=1128 end
        elseif block == 1128 then
            r[19]=#r[20]
            block=1135
        elseif block == 1135 then
            r[41]=(false)
            r[42]=upvalues[2][7]
            r[42][("edgeRisk")]=r[41]
            r[41]=(567544)
            r[41]=r[35] == r[41]
            if not r[41] then block=1205 else block=1177 end
        elseif block == 1177 then
            r[8]=r[19]
            r[20]=r[18] + r[0]
            r[25]=r[4] + r[23]
            do local f=r[14]; local n=11; if n<0 then n=top-14-1 end; local m=22; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            block=1205
        elseif block == 1205 then
            r[41]=r[36]
            r[42]=(false)
            return unpackValues(r, 41, 42)
        elseif block == 1226 then
            block=1233
        elseif block == 1233 then
            r[42]=upvalues[1][7]
            r[41]=r[42]
            r[42] = r[33] - r[31]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[42] = r[41][("Magnitude")]
            if not (r[42] < (0.05)) then block=1296 else block=1275 end
        elseif block == 1275 then
            r[42]=r[36]
            r[41]=r[42]
            block=1310
        elseif block == 1296 then
            r[42] = r[41][("Unit")]
            r[41]=r[42]
            block=1310
        elseif block == 1310 then
            r[42]=r[38]
            r[43] = r[42][("Magnitude")]
            if not (r[43] < (0.05)) then block=1485 else block=1331 end
        elseif block == 1331 then
            r[43]=(599906)
            r[43]=r[35] == r[43]
            if not r[43] then block=1373 else block=1352 end
        elseif block == 1352 then
            r[4]=r[2] / r[25]
            r[6]=r[19] < r[19]
            r[11]=r[14] - r[7]
            block=1373
        elseif block == 1373 then
            r[44]=upvalues[5][7]
            r[43]=r[44]
            do local f=r[43]; local n=0; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            if not r[43] then block=1478 else block=1401 end
        elseif block == 1401 then
            r[45]=upvalues[1][7]
            r[44]=r[45]
            r[45] = r[43] - r[31]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[42]=r[44]
            r[44] = r[42][("Magnitude")]
            if not (r[44] > (0.05)) then block=1471 else block=1450 end
        elseif block == 1450 then
            r[44] = r[42][("Unit")]
            r[42]=r[44]
            block=1471
        elseif block == 1471 then
            block=1478
        elseif block == 1478 then
            block=1485
        elseif block == 1485 then
            r[43]={}
            r[43]={[7]=r[43]}
            do local captures = {}
            captures[1] = upvalues[1]
            captures[2] = r[43]
            r[44]=function(...) return functions[33](captures, ...) end
            end
            r[45]=r[44]
            r[46]=r[42]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=0; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[45]=r[44]
            r[46]=r[41]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=0; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[45]=r[44]
            r[46]=r[36]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=0; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[47] = r[42][("Magnitude")]
            r[47] = r[47] > (0.05)
            r[46]=r[47]
            if not r[46] then block=1604 else block=1597 end
        elseif block == 1597 then
            r[46]=r[42]
            block=1604
        elseif block == 1604 then
            r[45]=r[46]
            if r[45] then block=1625 else block=1618 end
        elseif block == 1618 then
            r[45]=r[36]
            block=1625
        elseif block == 1625 then
            r[47] = env[("ipairs")]
            r[46]=r[47]
            r[47]={}
            r[48]=(-35)
            r[47][(1)]=r[48]
            r[48]=(35)
            r[47][(2)]=r[48]
            r[48]=(-70)
            r[47][(3)]=r[48]
            r[48]=(70)
            r[47][(4)]=r[48]
            r[48]=(90)
            r[47][(5)]=r[48]
            r[48]=(-90)
            r[47][(6)]=r[48]
            r[48]=(135)
            r[47][(7)]=r[48]
            r[48]=(-135)
            r[47][(8)]=r[48]
            r[48]=(180)
            r[47][(9)]=r[48]
            do local f=r[46]; local n=1; if n<0 then n=top-46-1 end; local m=3; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            block=1835
        elseif block == 1786 then
            r[51]=r[44]
            r[53]=upvalues[6][7]
            r[52]=r[53]
            r[53]=r[45]
            r[54]=r[50]
            do local f=r[52]; local n=2; if n<0 then n=top-52-1 end; local m=-1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            do local f=r[51]; local n=-1; if n<0 then n=top-51-1 end; local m=0; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            block=1835
        elseif block == 1835 then
            r[49], r[50]=r[46](r[47],r[48])
            if r[49]~=nil then r[48]=r[49]; block=1786 else block=1849 end
        elseif block == 1849 then
            r[46]=nil
            r[47] = env[("math")]
            r[47] = r[47][("huge")]
            r[47]=-r[47]
            r[48]=(617015)
            r[48]=r[35] == r[48]
            if not r[48] then block=1912 else block=1898 end
        elseif block == 1898 then
            r[2]=r[14][r[25]]
            r[6]=r[14][("edgeCheckPosition")]
            block=1912
        elseif block == 1912 then
            r[49] = env[("ipairs")]
            r[48]=r[49]
            r[49]=r[43][7]
            do local f=r[48]; local n=1; if n<0 then n=top-48-1 end; local m=3; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            block=2444
        elseif block == 1947 then
            r[53]=(561478)
            r[53]=r[35] == r[53]
            if not r[53] then block=1989 else block=1968 end
        elseif block == 1968 then
            r[13]=r[3] == r[17]
            do local f=r[7]; local n=9; if n<0 then n=top-7-1 end; local m=23; if m==1 then r[7]=f(unpackValues(r,8,7+n)); top=8 elseif m==0 then f(unpackValues(r,8,7+n)); top=7 else local result=packValues(f(unpackValues(r,8,7+n))); if m<0 then m=result.n end; for i=1,m do r[7+i-1]=result[i] end; top=7+m end end
            r[3]=r[6]
            block=1989
        elseif block == 1989 then
            r[54]=upvalues[7][7]
            r[53]=r[54]
            r[54]=r[31]
            r[55]=r[52]
            r[56]=r[34]
            do local f=r[53]; local n=3; if n<0 then n=top-53-1 end; local m=1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            r[54]=(571677)
            r[54]=r[35] == r[54]
            if not r[54] then block=2073 else block=2052 end
        elseif block == 2052 then
            r[5]=r[1][r[22]]
            r[12][r[21]]=r[25]
            r[18]=("zero")
            block=2073
        elseif block == 2073 then
            if not (r[53] >= (6)) then block=2444 else block=2080 end
        elseif block == 2080 then
            r[54] = r[53] * (4.5)
            r[56]=r[52]
            r[55] = r[56][("Dot")]
            r[57]=r[41]
            do local f=r[55]; local n=2; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[55] = r[55] * (5)
            r[54] = r[54] + r[55]
            r[55] = r[42][("Magnitude")]
            if not (r[55] > (0.05)) then block=2304 else block=2143 end
        elseif block == 2143 then
            r[55]=(547709)
            r[55]=r[35] == r[55]
            if not r[55] then block=2192 else block=2164 end
        elseif block == 2164 then
            do local f=r[10]; local n=12; if n<0 then n=top-10-1 end; local m=25; if m==1 then r[10]=f(unpackValues(r,11,10+n)); top=11 elseif m==0 then f(unpackValues(r,11,10+n)); top=10 else local result=packValues(f(unpackValues(r,11,10+n))); if m<0 then m=result.n end; for i=1,m do r[10+i-1]=result[i] end; top=10+m end end
            r[1][("clock")]=r[21]
            r[2]=r[21] + r[8]
            r[9]=r[7] * r[3]
            block=2192
        elseif block == 2192 then
            r[56]=r[52]
            r[55] = r[56][("Dot")]
            r[57]=r[42]
            do local f=r[55]; local n=2; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[57]=r[40]
            if not r[57] then block=2248 else block=2234 end
        elseif block == 2234 then
            r[58]=(10)
            r[57]=r[58]
            block=2248
        elseif block == 2248 then
            r[56]=r[57]
            if r[56] then block=2276 else block=2262 end
        elseif block == 2262 then
            r[57]=(5)
            r[56]=r[57]
            block=2276
        elseif block == 2276 then
            r[55] = r[55] * r[56]
            r[56] = r[54] + r[55]
            r[54]=r[56]
            block=2304
        elseif block == 2304 then
            r[56]=r[52]
            r[55] = r[56][("Dot")]
            r[57]=r[36]
            do local f=r[55]; local n=2; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            if not (r[55] > (0)) then block=2367 else block=2339 end
        elseif block == 2339 then
            r[55]=(2)
            r[56] = r[54] + r[55]
            r[54]=r[56]
            block=2367
        elseif block == 2367 then
            r[55]=(571147)
            r[55]=r[35] == r[55]
            if not r[55] then block=2395 else block=2388 end
        elseif block == 2388 then
            r[0]=r[22] + r[1]
            block=2395
        elseif block == 2395 then
            if not (r[54] > r[47]) then block=2437 else block=2402 end
        elseif block == 2402 then
            r[55]=r[54]
            r[47]=r[55]
            r[55]=r[52]
            r[46]=r[55]
            block=2437
        elseif block == 2437 then
            block=2444
        elseif block == 2444 then
            r[51], r[52]=r[48](r[49],r[50])
            if r[51]~=nil then r[50]=r[51]; block=1947 else block=2458 end
        elseif block == 2458 then
            if not r[46] then block=2619 else block=2465 end
        elseif block == 2465 then
            r[48]=r[46]
            r[49]=upvalues[2][7]
            r[49][("edgeDirection")]=r[48]
            r[48]=(581256)
            r[48]=r[35] == r[48]
            if not r[48] then block=2521 else block=2507 end
        elseif block == 2507 then
            r[17]=#r[4]
            r[16]=r[13] == r[25]
            block=2521
        elseif block == 2521 then
            r[48]=(true)
            r[49]=upvalues[2][7]
            r[49][("edgeRisk")]=r[48]
            r[48]=r[37]
            r[49]=upvalues[2][7]
            r[49][("edgeRecoveryAt")]=r[48]
            r[48]=(625665)
            r[48]=r[35] == r[48]
            if not r[48] then block=2591 else block=2584 end
        elseif block == 2584 then
            r[2]=r[23] + r[0]
            block=2591
        elseif block == 2591 then
            r[48]=r[46]
            r[49]=(true)
            return unpackValues(r, 48, 49)
        elseif block == 2612 then
            block=2619
        elseif block == 2619 then
            r[48] = r[42][("Magnitude")]
            if not (r[48] > (0.05)) then block=2738 else block=2633 end
        elseif block == 2633 then
            r[48]=(590776)
            r[48]=r[35] == r[48]
            if not r[48] then block=2668 else block=2654 end
        elseif block == 2654 then
            r[18][r[10]]=r[20]
            r[18][r[7]]=r[2]
            block=2668
        elseif block == 2668 then
            r[48]=r[42]
            r[49]=upvalues[2][7]
            r[49][("edgeDirection")]=r[48]
            r[48]=(true)
            r[49]=upvalues[2][7]
            r[49][("edgeRisk")]=r[48]
            r[48]=r[42]
            r[49]=(true)
            return unpackValues(r, 48, 49)
        elseif block == 2731 then
            block=2738
        elseif block == 2738 then
            r[48]=(605728)
            r[48]=r[35] == r[48]
            if not r[48] then block=2787 else block=2759 end
        elseif block == 2759 then
            r[12]=r[23][(nil)]
            r[12]=#r[4]
            r[13]=#r[7]
            r[17]=(603597)
            block=2787
        elseif block == 2787 then
            r[48]=-r[36]
            r[49]=upvalues[2][7]
            r[49][("edgeDirection")]=r[48]
            r[48]=(true)
            r[49]=upvalues[2][7]
            r[49][("edgeRisk")]=r[48]
            r[48]=-r[36]
            r[49]=(true)
            return unpackValues(r, 48, 49)
        elseif block == 2850 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[33] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(928441)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[34]=r[31]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[31]=r[33]
            r[33]=(984986)
            r[33]=r[32] == r[33]
            if not r[33] then block=78 else block=64 end
        elseif block == 64 then
            r[24]=#r[14]
            r[15]=env[(nil)]
            block=78
        elseif block == 78 then
            r[33] = r[31][("Magnitude")]
            if not (r[33] < (0.05)) then block=106 else block=92 end
        elseif block == 92 then
            return unpackValues(r, 0, -1)
        elseif block == 99 then
            block=106
        elseif block == 106 then
            r[33]=(1028005)
            r[33]=r[32] == r[33]
            if not r[33] then block=134 else block=127 end
        elseif block == 127 then
            r[2]=r[11][r[8]]
            block=134
        elseif block == 134 then
            r[33] = r[31][("Unit")]
            r[31]=r[33]
            r[34] = env[("ipairs")]
            r[33]=r[34]
            r[34]=upvalues[2][7]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=260
        elseif block == 183 then
            r[38]=(1023198)
            r[38]=r[32] == r[38]
            if not r[38] then block=211 else block=204 end
        elseif block == 204 then
            r[4]=r[23][r[21]]
            block=211
        elseif block == 211 then
            r[39]=r[37]
            r[38] = r[39][("Dot")]
            r[40]=r[31]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not (r[38] > (0.985)) then block=260 else block=246 end
        elseif block == 246 then
            return unpackValues(r, 0, -1)
        elseif block == 253 then
            block=260
        elseif block == 260 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=183 else block=274 end
        elseif block == 274 then
            r[33]=r[31]
            r[34]=upvalues[2][7]
            r[35]=upvalues[2][7]
            r[35]=#r[35]
            r[35] = r[35] + (1)
            r[34][r[35]]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[34] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(61882)
            r[35] = env[("ipairs")]
            r[34]=r[35]
            r[35]=r[32]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=3; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            block=92
        elseif block == 43 then
            r[40]=r[31]
            r[39] = r[40][("FindFirstChild")]
            r[41]=r[38]
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            if not r[39] then block=92 else block=78 end
        elseif block == 78 then
            return r[39]
        elseif block == 85 then
            block=92
        elseif block == 92 then
            r[37], r[38]=r[34](r[35],r[36])
            if r[37]~=nil then r[36]=r[37]; block=43 else block=106 end
        elseif block == 106 then
            r[35] = env[("ipairs")]
            r[34]=r[35]
            r[36]=r[31]
            r[35] = r[36][("GetDescendants")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local f=r[34]; local n=-1; if n<0 then n=top-34-1 end; local m=3; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            block=337
        elseif block == 155 then
            r[41] = r[38][("Name")]
            r[40]=r[41]
            r[39] = r[40][("lower")]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[41] = env[("ipairs")]
            r[40]=r[41]
            r[41]=r[32]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=3; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            block=323
        elseif block == 218 then
            r[45]=(119015)
            r[45]=r[33] == r[45]
            if not r[45] then block=246 else block=239 end
        elseif block == 239 then
            r[11]=r[23] * r[23]
            block=246
        elseif block == 246 then
            r[46]=r[44]
            r[45] = r[46][("lower")]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            if not (r[39] == r[45]) then block=323 else block=274 end
        elseif block == 274 then
            r[45]=(109797)
            r[45]=r[33] == r[45]
            if not r[45] then block=309 else block=295 end
        elseif block == 295 then
            r[12]=r[19] - r[21]
            r[23]=r[18] * r[8]
            block=309
        elseif block == 309 then
            return r[38]
        elseif block == 316 then
            block=323
        elseif block == 323 then
            r[43], r[44]=r[40](r[41],r[42])
            if r[43]~=nil then r[42]=r[43]; block=218 else block=337 end
        elseif block == 337 then
            r[37], r[38]=r[34](r[35],r[36])
            if r[37]~=nil then r[36]=r[37]; block=155 else block=351 end
        elseif block == 351 then
            r[34]=nil
            return r[34]
        elseif block == 365 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[35] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(164195)
            r[33]=not r[31]
            if not r[33] then block=43 else block=22 end
        elseif block == 22 then
            r[33]=nil
            return r[33]
        elseif block == 36 then
            block=43
        elseif block == 43 then
            r[34] = env[("Vector3")]
            r[34] = r[34][("new")]
            r[33]=r[34]
            r[34] = env[("math")]
            r[34] = r[34][("huge")]
            r[35] = env[("math")]
            r[35] = r[35][("huge")]
            r[36] = env[("math")]
            r[36] = r[36][("huge")]
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]={[7]=r[33]}
            r[35] = env[("Vector3")]
            r[35] = r[35][("new")]
            r[34]=r[35]
            r[35] = env[("math")]
            r[35] = r[35][("huge")]
            r[35]=-r[35]
            r[36] = env[("math")]
            r[36] = r[36][("huge")]
            r[36]=-r[36]
            r[37] = env[("math")]
            r[37] = r[37][("huge")]
            r[37]=-r[37]
            do local f=r[34]; local n=3; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]={[7]=r[34]}
            r[35]=(false)
            r[35]={[7]=r[35]}
            do local captures = {}
            captures[1] = r[33]
            captures[2] = r[34]
            captures[3] = r[35]
            r[36]=function(...) return functions[36](captures, ...) end
            end
            r[38]=r[31]
            r[37] = r[38][("IsA")]
            r[39]=("BasePart")
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            if not r[37] then block=302 else block=274 end
        elseif block == 274 then
            r[37]=r[36]
            r[38]=r[31]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=302
        elseif block == 302 then
            r[38] = env[("ipairs")]
            r[37]=r[38]
            r[39]=r[31]
            r[38] = r[39][("GetDescendants")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=-1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            do local f=r[37]; local n=-1; if n<0 then n=top-37-1 end; local m=3; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=414
        elseif block == 351 then
            r[43]=r[41]
            r[42] = r[43][("IsA")]
            r[44]=("BasePart")
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            if not r[42] then block=414 else block=386 end
        elseif block == 386 then
            r[42]=r[36]
            r[43]=r[41]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            block=414
        elseif block == 414 then
            r[40], r[41]=r[37](r[38],r[39])
            if r[40]~=nil then r[39]=r[40]; block=351 else block=428 end
        elseif block == 428 then
            r[37]=r[35][7]
            r[37]=not r[37]
            if not r[37] then block=505 else block=449 end
        elseif block == 449 then
            r[37]=(232408)
            r[37]=r[32] == r[37]
            if not r[37] then block=484 else block=470 end
        elseif block == 470 then
            do local f=r[3]; local n=21; if n<0 then n=top-3-1 end; local m=18; if m==1 then r[3]=f(unpackValues(r,4,3+n)); top=4 elseif m==0 then f(unpackValues(r,4,3+n)); top=3 else local result=packValues(f(unpackValues(r,4,3+n))); if m<0 then m=result.n end; for i=1,m do r[3+i-1]=result[i] end; top=3+m end end
            r[12]=r[15][r[11]]
            block=484
        elseif block == 484 then
            r[37]=nil
            return r[37]
        elseif block == 498 then
            block=505
        elseif block == 505 then
            r[37]=(253873)
            r[37]=r[32] == r[37]
            if not r[37] then block=533 else block=526 end
        elseif block == 526 then
            r[5]=r[9][(nil)]
            block=533
        elseif block == 533 then
            r[37]=r[33][7]
            r[38]=r[34][7]
            return unpackValues(r, 37, 38)
        elseif block == 554 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[36] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(103788)
            r[33]=(115345)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[17]=r[13] + r[2]
            r[22]=r[17][(148485)]
            r[0]=#r[17]
            block=50
        elseif block == 50 then
            r[33] = r[31][("Position")]
            r[34] = r[31][("Size")]
            r[34] = r[34] * (0.5)
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[37] = env[("math")]
            r[37] = r[37][("min")]
            r[36]=r[37]
            r[37]=upvalues[1][7]
            r[37] = r[37][("X")]
            r[38] = r[33][("X")]
            r[39] = r[34][("X")]
            r[38] = r[38] - r[39]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = env[("math")]
            r[38] = r[38][("min")]
            r[37]=r[38]
            r[38]=upvalues[1][7]
            r[38] = r[38][("Y")]
            r[39] = r[33][("Y")]
            r[40] = r[34][("Y")]
            r[39] = r[39] - r[40]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[39] = env[("math")]
            r[39] = r[39][("min")]
            r[38]=r[39]
            r[39]=upvalues[1][7]
            r[39] = r[39][("Z")]
            r[40] = r[33][("Z")]
            r[41] = r[34][("Z")]
            r[40] = r[40] - r[41]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=-1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            do local f=r[35]; local n=-1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            upvalues[1][7]=r[35]
            r[35]=(132701)
            r[35]=r[32] == r[35]
            if not r[35] then block=323 else block=316 end
        elseif block == 316 then
            r[25]=r[4] .. r[24]
            block=323
        elseif block == 323 then
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[37] = env[("math")]
            r[37] = r[37][("max")]
            r[36]=r[37]
            r[37]=upvalues[2][7]
            r[37] = r[37][("X")]
            r[38] = r[33][("X")]
            r[39] = r[34][("X")]
            r[38] = r[38] + r[39]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = env[("math")]
            r[38] = r[38][("max")]
            r[37]=r[38]
            r[38]=upvalues[2][7]
            r[38] = r[38][("Y")]
            r[39] = r[33][("Y")]
            r[40] = r[34][("Y")]
            r[39] = r[39] + r[40]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[39] = env[("math")]
            r[39] = r[39][("max")]
            r[38]=r[39]
            r[39]=upvalues[2][7]
            r[39] = r[39][("Z")]
            r[40] = r[33][("Z")]
            r[41] = r[34][("Z")]
            r[40] = r[40] + r[41]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=-1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            do local f=r[35]; local n=-1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            upvalues[2][7]=r[35]
            r[35]=(148485)
            r[35]=r[32] == r[35]
            if not r[35] then block=589 else block=568 end
        elseif block == 568 then
            r[12]=r[25][("max")]
            r[21]=r[15] + r[14]
            r[2]=r[7] .. r[9]
            block=589
        elseif block == 589 then
            r[35]=(true)
            upvalues[3][7]=r[35]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[37] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(655932)
            r[33]=(713464)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[25][r[9]]=r[23]
            r[13]=r[24]
            r[17]=#r[16]
            block=50
        elseif block == 50 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[34]=r[31]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=2; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=not r[33]
            if not r[35] then block=113 else block=92 end
        elseif block == 92 then
            r[35]=nil
            return r[35]
        elseif block == 106 then
            block=113
        elseif block == 113 then
            r[35]={}
            r[35][("instance")]=r[31]
            r[36] = r[31][("Name")]
            r[35][("name")]=r[36]
            r[35][("min")]=r[33]
            r[35][("max")]=r[34]
            r[36] = r[33] + r[34]
            r[36] = r[36] * (0.5)
            r[35][("center")]=r[36]
            return r[35]
        elseif block == 183 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[38] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(508708)
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[34]=upvalues[2][7]
            r[34] = r[34][("cached")]
            r[33]=r[34]
            if not r[33] then block=337 else block=57 end
        elseif block == 57 then
            r[35]=upvalues[2][7]
            r[35] = r[35][("map")]
            r[35] = r[35] == r[32]
            r[34]=r[35]
            if not r[34] then block=330 else block=92 end
        elseif block == 92 then
            r[36]=upvalues[2][7]
            r[36] = r[36][("a")]
            r[35]=r[36]
            if not r[35] then block=323 else block=120 end
        elseif block == 120 then
            r[37]=upvalues[2][7]
            r[37] = r[37][("b")]
            r[36]=r[37]
            if not r[36] then block=316 else block=148 end
        elseif block == 148 then
            r[38]=upvalues[2][7]
            r[38] = r[38][("a")]
            r[38] = r[38][("instance")]
            r[37]=r[38]
            if not r[37] then block=309 else block=183 end
        elseif block == 183 then
            r[39]=upvalues[2][7]
            r[39] = r[39][("a")]
            r[39] = r[39][("instance")]
            r[39] = r[39][("Parent")]
            r[38]=r[39]
            if not r[38] then block=302 else block=225 end
        elseif block == 225 then
            r[40]=upvalues[2][7]
            r[40] = r[40][("b")]
            r[40] = r[40][("instance")]
            r[39]=r[40]
            if not r[39] then block=295 else block=260 end
        elseif block == 260 then
            r[40]=upvalues[2][7]
            r[40] = r[40][("b")]
            r[40] = r[40][("instance")]
            r[40] = r[40][("Parent")]
            r[39]=r[40]
            block=295
        elseif block == 295 then
            r[38]=r[39]
            block=302
        elseif block == 302 then
            r[37]=r[38]
            block=309
        elseif block == 309 then
            r[36]=r[37]
            block=316
        elseif block == 316 then
            r[35]=r[36]
            block=323
        elseif block == 323 then
            r[34]=r[35]
            block=330
        elseif block == 330 then
            r[33]=r[34]
            block=337
        elseif block == 337 then
            if not r[33] then block=358 else block=344 end
        elseif block == 344 then
            return unpackValues(r, 0, -1)
        elseif block == 351 then
            block=358
        elseif block == 358 then
            r[33]=(521166)
            r[33]=r[31] == r[33]
            if not r[33] then block=386 else block=379 end
        elseif block == 379 then
            r[21]=env[("b")]
            block=386
        elseif block == 386 then
            r[33]=r[32]
            r[34]=upvalues[2][7]
            r[34][("map")]=r[33]
            r[33]=nil
            r[34]=nil
            r[35]=(true)
            r[36]=upvalues[2][7]
            r[36][("a")]=r[33]
            r[37]=upvalues[2][7]
            r[37][("b")]=r[34]
            r[38]=upvalues[2][7]
            r[38][("cached")]=r[35]
            r[33]=r[32]
            if not r[33] then block=519 else block=484 end
        elseif block == 484 then
            r[35]=r[32]
            r[34] = r[35][("FindFirstChild")]
            r[36]=("Field")
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33]=r[34]
            block=519
        elseif block == 519 then
            r[34]=not r[33]
            if not r[34] then block=547 else block=533 end
        elseif block == 533 then
            return unpackValues(r, 0, -1)
        elseif block == 540 then
            block=547
        elseif block == 547 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            r[36]=upvalues[4][7]
            r[35]=r[36]
            r[36]=r[33]
            r[37]={}
            r[38]=("SafezoneASide")
            r[37][(1)]=r[38]
            r[38]=("SafeZoneASide")
            r[37][(2)]=r[38]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local f=r[34]; local n=-1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=upvalues[2][7]
            r[35][("a")]=r[34]
            r[35]=upvalues[3][7]
            r[34]=r[35]
            r[36]=upvalues[4][7]
            r[35]=r[36]
            r[36]=r[33]
            r[37]={}
            r[38]=("SafezoneBSide")
            r[37][(1)]=r[38]
            r[38]=("SafeZoneBSide")
            r[37][(2)]=r[38]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local f=r[34]; local n=-1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=upvalues[2][7]
            r[35][("b")]=r[34]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[39] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(423017)
            r[34]=not r[32]
            if not r[34] then block=92 else block=22 end
        elseif block == 22 then
            r[34]=(516466)
            r[34]=r[33] == r[34]
            if not r[34] then block=71 else block=43 end
        elseif block == 43 then
            r[10]=r[5][("max")]
            r[18]=#r[11]
            r[17][r[17]]=r[5]
            r[8]=(nil)
            block=71
        elseif block == 71 then
            r[34]=(false)
            return r[34]
        elseif block == 85 then
            block=92
        elseif block == 92 then
            r[34]=(471627)
            r[34]=r[33] == r[34]
            if not r[34] then block=134 else block=113 end
        elseif block == 113 then
            r[6]=r[8] < r[7]
            r[17][r[24]]=r[7]
            r[22][r[2]]=r[11]
            block=134
        elseif block == 134 then
            r[35] = r[31][("X")]
            r[36] = r[32][("min")]
            r[36] = r[36][("X")]
            r[35] = r[35] >= r[36]
            r[34]=r[35]
            if not r[34] then block=421 else block=176 end
        elseif block == 176 then
            r[36] = r[31][("X")]
            r[37] = r[32][("max")]
            r[37] = r[37][("X")]
            r[36] = r[36] <= r[37]
            r[35]=r[36]
            if not r[35] then block=414 else block=218 end
        elseif block == 218 then
            r[37] = r[31][("Z")]
            r[38] = r[32][("min")]
            r[38] = r[38][("Z")]
            r[37] = r[37] >= r[38]
            r[36]=r[37]
            if not r[36] then block=407 else block=260 end
        elseif block == 260 then
            r[38] = r[31][("Z")]
            r[39] = r[32][("max")]
            r[39] = r[39][("Z")]
            r[38] = r[38] <= r[39]
            r[37]=r[38]
            if not r[37] then block=400 else block=302 end
        elseif block == 302 then
            r[39] = r[31][("Y")]
            r[40] = r[32][("min")]
            r[40] = r[40][("Y")]
            r[40] = r[40] - (8)
            r[39] = r[39] >= r[40]
            r[38]=r[39]
            if not r[38] then block=393 else block=351 end
        elseif block == 351 then
            r[39] = r[31][("Y")]
            r[40] = r[32][("max")]
            r[40] = r[40][("Y")]
            r[40] = r[40] + (8)
            r[39] = r[39] <= r[40]
            r[38]=r[39]
            block=393
        elseif block == 393 then
            r[37]=r[38]
            block=400
        elseif block == 400 then
            r[36]=r[37]
            block=407
        elseif block == 407 then
            r[35]=r[36]
            block=414
        elseif block == 414 then
            r[34]=r[35]
            block=421
        elseif block == 421 then
            return r[34]
        elseif block == 428 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[40] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(387095)
            r[34]=not r[31]
            if not r[34] then block=50 else block=22 end
        elseif block == 22 then
            r[34] = env[("Vector3")]
            r[34] = r[34][("zero")]
            return r[34]
        elseif block == 43 then
            block=50
        elseif block == 50 then
            r[35]=r[32]
            if not r[35] then block=113 else block=64 end
        elseif block == 64 then
            r[37]=upvalues[1][7]
            r[36]=r[37]
            r[37] = r[31][("center")]
            r[38] = r[32][("center")]
            r[37] = r[37] - r[38]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            block=113
        elseif block == 113 then
            r[34]=r[35]
            if r[34] then block=148 else block=127 end
        elseif block == 127 then
            r[35] = env[("Vector3")]
            r[35] = r[35][("zero")]
            r[34]=r[35]
            block=148
        elseif block == 148 then
            r[35] = r[34][("Magnitude")]
            if not (r[35] > (0.05)) then block=491 else block=162 end
        elseif block == 162 then
            r[36] = env[("math")]
            r[36] = r[36][("abs")]
            r[35]=r[36]
            r[36] = r[34][("X")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37] = env[("math")]
            r[37] = r[37][("abs")]
            r[36]=r[37]
            r[37] = r[34][("Z")]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            if not (r[35] >= r[36]) then block=365 else block=239 end
        elseif block == 239 then
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[38] = r[34][("X")]
            r[38] = r[38] >= (0)
            r[37]=r[38]
            if not r[37] then block=302 else block=288 end
        elseif block == 288 then
            r[38]=(1)
            r[37]=r[38]
            block=302
        elseif block == 302 then
            r[36]=r[37]
            if r[36] then block=330 else block=316 end
        elseif block == 316 then
            r[37]=(-1)
            r[36]=r[37]
            block=330
        elseif block == 330 then
            r[37]=(0)
            r[38]=(0)
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            return unpackValues(r, 35, top-1)
        elseif block == 358 then
            block=365
        elseif block == 365 then
            r[36] = env[("Vector3")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            r[36]=(0)
            r[37]=(0)
            r[40] = r[34][("Z")]
            r[40] = r[40] >= (0)
            r[39]=r[40]
            if not r[39] then block=442 else block=428 end
        elseif block == 428 then
            r[40]=(1)
            r[39]=r[40]
            block=442
        elseif block == 442 then
            r[38]=r[39]
            if r[38] then block=470 else block=456 end
        elseif block == 456 then
            r[39]=(-1)
            r[38]=r[39]
            block=470
        elseif block == 470 then
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            return unpackValues(r, 35, top-1)
        elseif block == 484 then
            block=491
        elseif block == 491 then
            r[35] = env[("Vector3")]
            r[35] = r[35][("zero")]
            return r[35]
        elseif block == 512 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[41] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(302152)
            r[34]=(390382)
            r[34]=r[33] == r[34]
            if not r[34] then block=36 else block=29 end
        elseif block == 29 then
            r[22]=r[8] * r[7]
            block=36
        elseif block == 36 then
            r[34]=not r[31]
            if not r[34] then block=71 else block=50 end
        elseif block == 50 then
            r[34]=(0)
            return r[34]
        elseif block == 64 then
            block=71
        elseif block == 71 then
            r[34] = r[31][("max")]
            r[35] = r[31][("min")]
            r[34] = r[34] - r[35]
            r[35]=(355423)
            r[35]=r[33] == r[35]
            if not r[35] then block=127 else block=113 end
        elseif block == 113 then
            r[16]=r[11] + r[14]
            r[10]=r[2] * r[10]
            block=127
        elseif block == 127 then
            r[36] = env[("math")]
            r[36] = r[36][("abs")]
            r[35]=r[36]
            r[36] = r[32][("X")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37] = env[("math")]
            r[37] = r[37][("abs")]
            r[36]=r[37]
            r[37] = r[32][("Z")]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            if not (r[35] >= r[36]) then block=260 else block=204 end
        elseif block == 204 then
            r[36] = env[("math")]
            r[36] = r[36][("abs")]
            r[35]=r[36]
            r[36] = r[34][("X")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35] = r[35] * (0.5)
            return r[35]
        elseif block == 253 then
            block=260
        elseif block == 260 then
            r[35]=(381039)
            r[35]=r[33] == r[35]
            if not r[35] then block=302 else block=281 end
        elseif block == 281 then
            r[18]=r[19] == r[0]
            r[18][(nil)]=r[13]
            r[8]=r[20] + r[17]
            block=302
        elseif block == 302 then
            r[36] = env[("math")]
            r[36] = r[36][("abs")]
            r[35]=r[36]
            r[36] = r[34][("Z")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35] = r[35] * (0.5)
            return r[35]
        elseif block == 351 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[42] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(638436)
            r[35]=(666135)
            r[35]=r[34] == r[35]
            if not r[35] then block=50 else block=29 end
        elseif block == 29 then
            r[6]=(0.5)
            do local f=r[20]; local n=14; if n<0 then n=top-20-1 end; local m=8; if m==1 then r[20]=f(unpackValues(r,21,20+n)); top=21 elseif m==0 then f(unpackValues(r,21,20+n)); top=20 else local result=packValues(f(unpackValues(r,21,20+n))); if m<0 then m=result.n end; for i=1,m do r[20+i-1]=result[i] end; top=20+m end end
            r[14]=#r[24]
            block=50
        elseif block == 50 then
            r[35]=not r[31]
            if not r[35] then block=85 else block=64 end
        elseif block == 64 then
            r[35]=nil
            return r[35]
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[35]=(643476)
            r[35]=r[34] == r[35]
            if not r[35] then block=120 else block=106 end
        elseif block == 106 then
            r[25]=(2)
            r[16]=r[17] < r[1]
            block=120
        elseif block == 120 then
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[31]
            r[37]=r[32]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=upvalues[2][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38]=r[35]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=(695418)
            r[37]=r[34] == r[37]
            if not r[37] then block=239 else block=211 end
        elseif block == 211 then
            r[14]=r[22] * r[13]
            r[17][("X")]=r[21]
            r[11]=env[(nil)]
            r[17]=r[24] - r[8]
            block=239
        elseif block == 239 then
            r[38] = env[("math")]
            r[38] = r[38][("min")]
            r[37]=r[38]
            r[38]=upvalues[3][7]
            r[38] = r[38][("safezoneEdgeMargin")]
            r[40] = env[("math")]
            r[40] = r[40][("max")]
            r[39]=r[40]
            r[40]=(0)
            r[41] = r[36] - (0.75)
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=-1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            do local f=r[37]; local n=-1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[39] = env[("math")]
            r[39] = r[39][("min")]
            r[38]=r[39]
            r[39]=r[37]
            r[41] = env[("math")]
            r[41] = r[41][("max")]
            r[40]=r[41]
            r[41]=(0)
            r[42] = r[31][("max")]
            r[42] = r[42][("X")]
            r[43] = r[31][("min")]
            r[43] = r[43][("X")]
            r[42] = r[42] - r[43]
            r[42] = r[42] * (0.5)
            r[42] = r[42] - (0.75)
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=-1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            do local f=r[38]; local n=-1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39]=(652496)
            r[39]=r[34] == r[39]
            if not r[39] then block=477 else block=463 end
        elseif block == 463 then
            r[18]=r[2] / r[0]
            r[4]=r[2] - r[11]
            block=477
        elseif block == 477 then
            r[40] = env[("math")]
            r[40] = r[40][("min")]
            r[39]=r[40]
            r[40]=r[37]
            r[42] = env[("math")]
            r[42] = r[42][("max")]
            r[41]=r[42]
            r[42]=(0)
            r[43] = r[31][("max")]
            r[43] = r[43][("Z")]
            r[44] = r[31][("min")]
            r[44] = r[44][("Z")]
            r[43] = r[43] - r[44]
            r[43] = r[43] * (0.5)
            r[43] = r[43] - (0.75)
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=-1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            do local f=r[39]; local n=-1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[41] = env[("ipairs")]
            r[40]=r[41]
            r[41]={}
            r[42]=upvalues[3][7]
            r[42] = r[42][("safezoneDepthRatio")]
            r[41][(1)]=r[42]
            r[42]=(0.46)
            r[41][(2)]=r[42]
            r[42]=(0.4)
            r[41][(3)]=r[42]
            r[42]=(0.34)
            r[41][(4)]=r[42]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=3; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            block=1156
        elseif block == 694 then
            r[46] = env[("math")]
            r[46] = r[46][("min")]
            r[45]=r[46]
            r[47] = env[("math")]
            r[47] = r[47][("max")]
            r[46]=r[47]
            r[47]=(0)
            r[48] = r[36] - r[37]
            do local f=r[46]; local n=2; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[47] = r[36] * r[44]
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[46] = r[31][("center")]
            r[47] = r[35] * r[45]
            r[46] = r[46] + r[47]
            r[48] = env[("Vector3")]
            r[48] = r[48][("new")]
            r[47]=r[48]
            r[49] = env[("math")]
            r[49] = r[49][("clamp")]
            r[48]=r[49]
            r[49] = r[46][("X")]
            r[50] = r[31][("min")]
            r[50] = r[50][("X")]
            r[50] = r[50] + r[38]
            r[51] = r[31][("max")]
            r[51] = r[51][("X")]
            r[51] = r[51] - r[38]
            do local f=r[48]; local n=3; if n<0 then n=top-48-1 end; local m=1; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            r[49]=r[33]
            r[51] = env[("math")]
            r[51] = r[51][("clamp")]
            r[50]=r[51]
            r[51] = r[46][("Z")]
            r[52] = r[31][("min")]
            r[52] = r[52][("Z")]
            r[52] = r[52] + r[39]
            r[53] = r[31][("max")]
            r[53] = r[53][("Z")]
            r[53] = r[53] - r[39]
            do local f=r[50]; local n=3; if n<0 then n=top-50-1 end; local m=-1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            do local f=r[47]; local n=-1; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[46]=r[47]
            r[47]=(716439)
            r[47]=r[34] == r[47]
            if not r[47] then block=1016 else block=1009 end
        elseif block == 1009 then
            r[11]=#r[17]
            block=1016
        elseif block == 1016 then
            r[49]=upvalues[4][7]
            r[48]=r[49]
            r[49]=r[46]
            r[50]=r[35]
            r[51]=r[33]
            r[52]=(6)
            do local f=r[48]; local n=4; if n<0 then n=top-48-1 end; local m=1; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            r[47]=r[48]
            if not r[47] then block=1135 else block=1079 end
        elseif block == 1079 then
            r[49]=upvalues[4][7]
            r[48]=r[49]
            r[49]=r[46]
            r[50]=-r[35]
            r[51]=r[33]
            r[52]=(4)
            do local f=r[48]; local n=4; if n<0 then n=top-48-1 end; local m=1; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            r[47]=r[48]
            block=1135
        elseif block == 1135 then
            if not r[47] then block=1156 else block=1142 end
        elseif block == 1142 then
            return r[46]
        elseif block == 1149 then
            block=1156
        elseif block == 1156 then
            r[43], r[44]=r[40](r[41],r[42])
            if r[43]~=nil then r[42]=r[43]; block=694 else block=1170 end
        elseif block == 1170 then
            r[40]=(721712)
            r[40]=r[34] == r[40]
            if not r[40] then block=1212 else block=1191 end
        elseif block == 1191 then
            r[23][r[9]]=r[9]
            do local f=r[14]; local n=14; if n<0 then n=top-14-1 end; local m=11; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            r[0]=#r[23]
            block=1212
        elseif block == 1212 then
            r[40] = r[31][("center")]
            r[42] = env[("math")]
            r[42] = r[42][("min")]
            r[41]=r[42]
            r[43] = env[("math")]
            r[43] = r[43][("max")]
            r[42]=r[43]
            r[43]=(0)
            r[44] = r[36] - r[37]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[43]=upvalues[3][7]
            r[43] = r[43][("safezoneDepthRatio")]
            r[43] = r[36] * r[43]
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[35] * r[41]
            r[40] = r[40] + r[41]
            r[42] = env[("Vector3")]
            r[42] = r[42][("new")]
            r[41]=r[42]
            r[43] = env[("math")]
            r[43] = r[43][("clamp")]
            r[42]=r[43]
            r[43] = r[40][("X")]
            r[44] = r[31][("min")]
            r[44] = r[44][("X")]
            r[44] = r[44] + r[38]
            r[45] = r[31][("max")]
            r[45] = r[45][("X")]
            r[45] = r[45] - r[38]
            do local f=r[42]; local n=3; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[43]=r[33]
            r[45] = env[("math")]
            r[45] = r[45][("clamp")]
            r[44]=r[45]
            r[45] = r[40][("Z")]
            r[46] = r[31][("min")]
            r[46] = r[46][("Z")]
            r[46] = r[46] + r[39]
            r[47] = r[31][("max")]
            r[47] = r[47][("Z")]
            r[47] = r[47] - r[39]
            do local f=r[44]; local n=3; if n<0 then n=top-44-1 end; local m=-1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            do local f=r[41]; local n=-1; if n<0 then n=top-41-1 end; local m=-1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            return unpackValues(r, 41, top-1)
        elseif block == 1520 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[43] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(991270)
            r[36]=not r[32]
            r[35]=r[36]
            if r[35] then block=78 else block=29 end
        elseif block == 29 then
            r[37]=upvalues[1][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38]=r[32]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36]=not r[36]
            r[35]=r[36]
            block=78
        elseif block == 78 then
            if not r[35] then block=148 else block=85 end
        elseif block == 85 then
            r[35]=(1077513)
            r[35]=r[34] == r[35]
            if not r[35] then block=127 else block=106 end
        elseif block == 106 then
            r[17]=r[1] == r[25]
            r[7][("safezoneValidationRatio")]=r[9]
            r[15]=r[12] .. r[20]
            block=127
        elseif block == 127 then
            r[35]=(false)
            return r[35]
        elseif block == 141 then
            block=148
        elseif block == 148 then
            r[35]=(1084512)
            r[35]=r[34] == r[35]
            if not r[35] then block=183 else block=169 end
        elseif block == 169 then
            r[4]=env[(nil)]
            r[15]=r[5] * r[17]
            block=183
        elseif block == 183 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[36]=r[32]
            r[37]=r[33]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36]=(1003794)
            r[36]=r[34] == r[36]
            if not r[36] then block=246 else block=239 end
        elseif block == 239 then
            r[9][("Y")]=r[23]
            block=246
        elseif block == 246 then
            r[36] = r[35][("Magnitude")]
            if not (r[36] < (0.05)) then block=281 else block=260 end
        elseif block == 260 then
            r[36]=(false)
            return r[36]
        elseif block == 274 then
            block=281
        elseif block == 281 then
            r[37]=upvalues[3][7]
            r[36]=r[37]
            r[37]=r[32]
            r[38]=r[35]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = env[("math")]
            r[38] = r[38][("min")]
            r[37]=r[38]
            r[38]=upvalues[4][7]
            r[38] = r[38][("safezoneEdgeMargin")]
            r[40] = env[("math")]
            r[40] = r[40][("max")]
            r[39]=r[40]
            r[40]=(0)
            r[41] = r[36] - (0.75)
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=-1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            do local f=r[37]; local n=-1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[39] = r[31][("X")]
            r[40] = r[32][("min")]
            r[40] = r[40][("X")]
            r[40] = r[40] + r[37]
            r[39] = r[39] < r[40]
            r[38]=r[39]
            if r[38] then block=491 else block=449 end
        elseif block == 449 then
            r[39] = r[31][("X")]
            r[40] = r[32][("max")]
            r[40] = r[40][("X")]
            r[40] = r[40] - r[37]
            r[39] = r[39] > r[40]
            r[38]=r[39]
            block=491
        elseif block == 491 then
            if not r[38] then block=519 else block=498 end
        elseif block == 498 then
            r[38]=(false)
            return r[38]
        elseif block == 512 then
            block=519
        elseif block == 519 then
            r[39] = r[31][("Z")]
            r[40] = r[32][("min")]
            r[40] = r[40][("Z")]
            r[40] = r[40] + r[37]
            r[39] = r[39] < r[40]
            r[38]=r[39]
            if r[38] then block=610 else block=568 end
        elseif block == 568 then
            r[39] = r[31][("Z")]
            r[40] = r[32][("max")]
            r[40] = r[40][("Z")]
            r[40] = r[40] - r[37]
            r[39] = r[39] > r[40]
            r[38]=r[39]
            block=610
        elseif block == 610 then
            if not r[38] then block=638 else block=617 end
        elseif block == 617 then
            r[38]=(false)
            return r[38]
        elseif block == 631 then
            block=638
        elseif block == 638 then
            r[38]=(1019078)
            r[38]=r[34] == r[38]
            if not r[38] then block=666 else block=659 end
        elseif block == 659 then
            r[11][r[25]]=r[3]
            block=666
        elseif block == 666 then
            r[41]=upvalues[5][7]
            r[40]=r[41]
            r[41] = r[32][("center")]
            r[41] = r[31] - r[41]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[39]=r[40]
            r[38] = r[39][("Dot")]
            r[40]=r[35]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[40] = env[("math")]
            r[40] = r[40][("min")]
            r[39]=r[40]
            r[41] = env[("math")]
            r[41] = r[41][("max")]
            r[40]=r[41]
            r[41]=(0)
            r[42] = r[36] - r[37]
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41]=upvalues[4][7]
            r[41] = r[41][("safezoneValidationRatio")]
            r[41] = r[36] * r[41]
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=(1010258)
            r[40]=r[34] == r[40]
            if not r[40] then block=855 else block=841 end
        elseif block == 841 then
            r[5]=r[1][r[10]]
            r[11]=r[16] * r[17]
            block=855
        elseif block == 855 then
            r[41] = r[38] >= r[39]
            r[40]=r[41]
            if not r[40] then block=918 else block=876 end
        elseif block == 876 then
            r[42]=upvalues[6][7]
            r[41]=r[42]
            r[42]=r[31]
            r[43] = r[31][("Y")]
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[40]=r[41]
            block=918
        elseif block == 918 then
            return r[40]
        elseif block == 925 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[44] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(128535)
            r[34]=not r[31]
            if not r[34] then block=85 else block=22 end
        elseif block == 22 then
            r[34]=(165365)
            r[34]=r[33] == r[34]
            if not r[34] then block=64 else block=43 end
        elseif block == 43 then
            r[4][(nil)]=r[19]
            r[18]=#r[14]
            r[21][r[2]]=r[6]
            block=64
        elseif block == 64 then
            r[34]=nil
            return r[34]
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[35] = env[("Vector3")]
            r[35] = r[35][("new")]
            r[34]=r[35]
            r[35] = r[31][("center")]
            r[35] = r[35][("X")]
            r[36]=r[32]
            r[37] = r[31][("center")]
            r[37] = r[37][("Z")]
            do local f=r[34]; local n=3; if n<0 then n=top-34-1 end; local m=-1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            return unpackValues(r, 34, top-1)
        elseif block == 155 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[45] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(498393)
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[31]
            r[37]=r[32]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=upvalues[1][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38]=r[33]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=r[35]
            if not r[37] then block=106 else block=92 end
        elseif block == 92 then
            r[38]=not r[36]
            r[37]=r[38]
            block=106
        elseif block == 106 then
            if not r[37] then block=127 else block=113 end
        elseif block == 113 then
            return r[32]
        elseif block == 120 then
            block=127
        elseif block == 127 then
            r[37]=r[36]
            if not r[37] then block=155 else block=141 end
        elseif block == 141 then
            r[38]=not r[35]
            r[37]=r[38]
            block=155
        elseif block == 155 then
            if not r[37] then block=204 else block=162 end
        elseif block == 162 then
            r[37]=(578576)
            r[37]=r[34] == r[37]
            if not r[37] then block=190 else block=183 end
        elseif block == 183 then
            r[14]=env[(nil)]
            block=190
        elseif block == 190 then
            return r[33]
        elseif block == 197 then
            block=204
        elseif block == 204 then
            r[40]=upvalues[2][7]
            r[39]=r[40]
            r[40] = r[32][("center")]
            r[40] = r[31] - r[40]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[39] = r[39][("Magnitude")]
            r[41]=upvalues[2][7]
            r[40]=r[41]
            r[41] = r[33][("center")]
            r[41] = r[31] - r[41]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[40] = r[40][("Magnitude")]
            r[39] = r[39] <= r[40]
            r[38]=r[39]
            if not r[38] then block=316 else block=309 end
        elseif block == 309 then
            r[38]=r[32]
            block=316
        elseif block == 316 then
            r[37]=r[38]
            if r[37] then block=337 else block=330 end
        elseif block == 330 then
            r[37]=r[33]
            block=337
        elseif block == 337 then
            return r[37]
        elseif block == 344 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[46] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(264765)
            r[33]=(348853)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[20]=env[("routeTargetSide")]
            r[5]=r[14] == r[24]
            r[22][r[17]]=r[8]
            block=50
        elseif block == 50 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]=upvalues[2][7]
            r[33] = r[33][("a")]
            r[34]=upvalues[2][7]
            r[34] = r[34][("b")]
            r[36]=not r[33]
            r[35]=r[36]
            if r[35] then block=134 else block=120 end
        elseif block == 120 then
            r[36]=not r[34]
            r[35]=r[36]
            block=134
        elseif block == 134 then
            if not r[35] then block=295 else block=141 end
        elseif block == 141 then
            r[35]=(false)
            r[36]=upvalues[3][7]
            r[36][("routeActive")]=r[35]
            r[35]=(288117)
            r[35]=r[32] == r[35]
            if not r[35] then block=204 else block=183 end
        elseif block == 183 then
            r[10]=r[24] / r[18]
            r[9]=r[17] .. r[17]
            r[1]=#r[6]
            block=204
        elseif block == 204 then
            r[35]=(false)
            r[36]=upvalues[3][7]
            r[36][("routeComplete")]=r[35]
            r[35]=nil
            r[36]=upvalues[3][7]
            r[36][("goalSide")]=r[35]
            r[35]=nil
            r[36]=upvalues[3][7]
            r[36][("goal")]=r[35]
            r[35]=nil
            r[36]=nil
            return unpackValues(r, 35, 36)
        elseif block == 288 then
            block=295
        elseif block == 295 then
            r[36]=upvalues[4][7]
            r[35]=r[36]
            r[36]=r[31]
            r[37]=r[33]
            r[38]=r[34]
            do local f=r[35]; local n=3; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[38] = r[35] == r[33]
            r[37]=r[38]
            if not r[37] then block=365 else block=358 end
        elseif block == 358 then
            r[37]=r[34]
            block=365
        elseif block == 365 then
            r[36]=r[37]
            if r[36] then block=386 else block=379 end
        elseif block == 379 then
            r[36]=r[33]
            block=386
        elseif block == 386 then
            r[37]=(true)
            r[38]=upvalues[3][7]
            r[38][("routeActive")]=r[37]
            r[37]=(false)
            r[38]=upvalues[3][7]
            r[38][("routeComplete")]=r[37]
            r[37] = r[35][("name")]
            r[38]=upvalues[3][7]
            r[38][("routeStartSide")]=r[37]
            r[37] = r[36][("name")]
            r[38]=upvalues[3][7]
            r[38][("routeTargetSide")]=r[37]
            r[37]=(338770)
            r[37]=r[32] == r[37]
            if not r[37] then block=505 else block=491 end
        elseif block == 491 then
            do local f=r[20]; local n=18; if n<0 then n=top-20-1 end; local m=3; if m==1 then r[20]=f(unpackValues(r,21,20+n)); top=21 elseif m==0 then f(unpackValues(r,21,20+n)); top=20 else local result=packValues(f(unpackValues(r,21,20+n))); if m<0 then m=result.n end; for i=1,m do r[20+i-1]=result[i] end; top=20+m end end
            r[9]=r[7] .. r[14]
            block=505
        elseif block == 505 then
            r[37]=nil
            r[38]=upvalues[3][7]
            r[38][("routeCompletePosition")]=r[37]
            r[37] = env[("math")]
            r[37] = r[37][("huge")]
            r[37]=-r[37]
            r[38]=upvalues[3][7]
            r[38][("routeCompleteAt")]=r[37]
            r[37] = r[36][("name")]
            r[38]=upvalues[3][7]
            r[38][("goalSide")]=r[37]
            r[39]=upvalues[5][7]
            r[38]=r[39]
            r[39]=r[36]
            r[40]=r[35]
            r[41] = r[31][("Y")]
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[37]=r[38]
            if r[37] then block=680 else block=638 end
        elseif block == 638 then
            r[39]=upvalues[6][7]
            r[38]=r[39]
            r[39]=r[36]
            r[40] = r[31][("Y")]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[37]=r[38]
            block=680
        elseif block == 680 then
            r[38]=upvalues[3][7]
            r[38][("goal")]=r[37]
            r[37] = env[("math")]
            r[37] = r[37][("huge")]
            r[37]=-r[37]
            r[38]=upvalues[3][7]
            r[38][("safeCheckAt")]=r[37]
            r[37]=nil
            r[38]=upvalues[3][7]
            r[38][("safeCheckPosition")]=r[37]
            r[37]=upvalues[3][7]
            r[37] = r[37][("goal")]
            r[38]=r[36]
            return unpackValues(r, 37, 38)
        elseif block == 778 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[47] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(924145)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]=upvalues[2][7]
            r[33] = r[33][("a")]
            r[34]=upvalues[2][7]
            r[34] = r[34][("b")]
            r[35]=(1010245)
            r[35]=r[32] == r[35]
            if not r[35] then block=99 else block=78 end
        elseif block == 78 then
            do local f=r[6]; local n=7; if n<0 then n=top-6-1 end; local m=21; if m==1 then r[6]=f(unpackValues(r,7,6+n)); top=7 elseif m==0 then f(unpackValues(r,7,6+n)); top=6 else local result=packValues(f(unpackValues(r,7,6+n))); if m<0 then m=result.n end; for i=1,m do r[6+i-1]=result[i] end; top=6+m end end
            r[23]=r[10][r[3]]
            r[20]=r[15][r[17]]
            block=99
        elseif block == 99 then
            r[36]=not r[33]
            r[35]=r[36]
            if r[35] then block=134 else block=120 end
        elseif block == 120 then
            r[36]=not r[34]
            r[35]=r[36]
            block=134
        elseif block == 134 then
            if not r[35] then block=246 else block=141 end
        elseif block == 141 then
            r[35]=nil
            r[36]=upvalues[3][7]
            r[36][("goal")]=r[35]
            r[35]=(false)
            r[36]=upvalues[3][7]
            r[36][("routeActive")]=r[35]
            r[35]=(942746)
            r[35]=r[32] == r[35]
            if not r[35] then block=218 else block=204 end
        elseif block == 204 then
            r[15]=r[10] == r[1]
            r[20]=r[8] / r[25]
            block=218
        elseif block == 218 then
            r[35]=nil
            r[36]=nil
            return unpackValues(r, 35, 36)
        elseif block == 239 then
            block=246
        elseif block == 246 then
            r[36]=upvalues[3][7]
            r[36] = r[36][("routeActive")]
            r[36]=not r[36]
            r[35]=r[36]
            if r[35] then block=309 else block=281 end
        elseif block == 281 then
            r[36]=upvalues[3][7]
            r[36] = r[36][("routeTargetSide")]
            r[36]=not r[36]
            r[35]=r[36]
            block=309
        elseif block == 309 then
            if not r[35] then block=358 else block=316 end
        elseif block == 316 then
            r[36]=upvalues[4][7]
            r[35]=r[36]
            r[36]=r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            return unpackValues(r, 35, top-1)
        elseif block == 351 then
            block=358
        elseif block == 358 then
            r[35]=(944401)
            r[35]=r[32] == r[35]
            if not r[35] then block=386 else block=379 end
        elseif block == 379 then
            r[6]=r[11] + r[25]
            block=386
        elseif block == 386 then
            r[35]=upvalues[3][7]
            r[35] = r[35][("routeComplete")]
            if not r[35] then block=435 else block=407 end
        elseif block == 407 then
            r[35]=nil
            r[36]=nil
            return unpackValues(r, 35, 36)
        elseif block == 428 then
            block=435
        elseif block == 435 then
            r[35]=(997907)
            r[35]=r[32] == r[35]
            if not r[35] then block=463 else block=456 end
        elseif block == 456 then
            r[1]=#r[14]
            block=463
        elseif block == 463 then
            r[36] = env[("os")]
            r[36] = r[36][("clock")]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=upvalues[3][7]
            r[37] = r[37][("safeCheckPosition")]
            r[37]=not r[37]
            r[36]=r[37]
            if r[36] then block=638 else block=526 end
        elseif block == 526 then
            r[38]=upvalues[3][7]
            r[38] = r[38][("safeCheckAt")]
            r[38] = r[35] - r[38]
            r[38] = r[38] >= (0.08)
            r[37]=r[38]
            if r[37] then block=631 else block=568 end
        elseif block == 568 then
            r[39]=upvalues[5][7]
            r[38]=r[39]
            r[39]=upvalues[3][7]
            r[39] = r[39][("safeCheckPosition")]
            r[39] = r[31] - r[39]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[38] = r[38][("Magnitude")]
            r[38] = r[38] >= (2)
            r[37]=r[38]
            block=631
        elseif block == 631 then
            r[36]=r[37]
            block=638
        elseif block == 638 then
            if not r[36] then block=855 else block=645 end
        elseif block == 645 then
            r[36]=(997748)
            r[36]=r[32] == r[36]
            if not r[36] then block=694 else block=666 end
        elseif block == 666 then
            r[12]=r[10] * r[18]
            r[8]=r[7] * r[3]
            r[10]=r[23] .. r[2]
            r[1]=r[23] + r[14]
            block=694
        elseif block == 694 then
            r[36]=r[35]
            r[37]=upvalues[3][7]
            r[37][("safeCheckAt")]=r[36]
            r[36]=r[31]
            r[37]=upvalues[3][7]
            r[37][("safeCheckPosition")]=r[36]
            r[37]=upvalues[6][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38]=r[33]
            r[39]=r[34]
            do local f=r[36]; local n=3; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=upvalues[3][7]
            r[37][("safeCheckA")]=r[36]
            r[37]=upvalues[6][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38]=r[34]
            r[39]=r[33]
            do local f=r[36]; local n=3; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=upvalues[3][7]
            r[37][("safeCheckB")]=r[36]
            block=855
        elseif block == 855 then
            r[38]=upvalues[3][7]
            r[38] = r[38][("routeTargetSide")]
            r[39] = r[33][("name")]
            r[38] = r[38] == r[39]
            r[37]=r[38]
            if not r[37] then block=904 else block=897 end
        elseif block == 897 then
            r[37]=r[33]
            block=904
        elseif block == 904 then
            r[36]=r[37]
            if r[36] then block=925 else block=918 end
        elseif block == 918 then
            r[36]=r[34]
            block=925
        elseif block == 925 then
            r[39] = r[36] == r[33]
            r[38]=r[39]
            if not r[38] then block=953 else block=946 end
        elseif block == 946 then
            r[38]=r[34]
            block=953
        elseif block == 953 then
            r[37]=r[38]
            if r[37] then block=974 else block=967 end
        elseif block == 967 then
            r[37]=r[33]
            block=974
        elseif block == 974 then
            r[40] = r[36] == r[33]
            r[39]=r[40]
            if not r[39] then block=1016 else block=995 end
        elseif block == 995 then
            r[40]=upvalues[3][7]
            r[40] = r[40][("safeCheckA")]
            r[39]=r[40]
            block=1016
        elseif block == 1016 then
            r[38]=r[39]
            if r[38] then block=1079 else block=1030 end
        elseif block == 1030 then
            r[40] = r[36] == r[34]
            r[39]=r[40]
            if not r[39] then block=1072 else block=1051 end
        elseif block == 1051 then
            r[40]=upvalues[3][7]
            r[40] = r[40][("safeCheckB")]
            r[39]=r[40]
            block=1072
        elseif block == 1072 then
            r[38]=r[39]
            block=1079
        elseif block == 1079 then
            if not r[38] then block=1338 else block=1086 end
        elseif block == 1086 then
            r[38]=(true)
            r[39]=upvalues[3][7]
            r[39][("routeComplete")]=r[38]
            r[38]=r[31]
            r[39]=upvalues[3][7]
            r[39][("routeCompletePosition")]=r[38]
            r[38]=(945365)
            r[38]=r[32] == r[38]
            if not r[38] then block=1170 else block=1149 end
        elseif block == 1149 then
            r[22][("Magnitude")]=r[7]
            r[14]=r[6] < r[8]
            r[13]=r[6] + r[22]
            block=1170
        elseif block == 1170 then
            r[38]=r[35]
            r[39]=upvalues[3][7]
            r[39][("routeCompleteAt")]=r[38]
            r[38]=(926144)
            r[38]=r[32] == r[38]
            if not r[38] then block=1233 else block=1212 end
        elseif block == 1212 then
            r[7]=r[0][(0.08)]
            r[0]=r[3] / r[18]
            r[17]=(944401)
            block=1233
        elseif block == 1233 then
            r[38]=nil
            r[39]=upvalues[3][7]
            r[39][("goal")]=r[38]
            r[38]=(938751)
            r[38]=r[32] == r[38]
            if not r[38] then block=1289 else block=1275 end
        elseif block == 1275 then
            r[4]=("b")
            r[20]=r[11] .. r[1]
            block=1289
        elseif block == 1289 then
            r[38] = r[36][("name")]
            r[39]=upvalues[3][7]
            r[39][("goalSide")]=r[38]
            r[38]=nil
            r[39]=r[36]
            return unpackValues(r, 38, 39)
        elseif block == 1331 then
            block=1338
        elseif block == 1338 then
            r[38] = r[36][("name")]
            r[39]=upvalues[3][7]
            r[39][("goalSide")]=r[38]
            r[38]=upvalues[3][7]
            r[38] = r[38][("goal")]
            r[38]=not r[38]
            if not r[38] then block=1506 else block=1387 end
        elseif block == 1387 then
            r[40]=upvalues[7][7]
            r[39]=r[40]
            r[40]=r[36]
            r[41]=r[37]
            r[42] = r[31][("Y")]
            do local f=r[39]; local n=3; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            if r[38] then block=1485 else block=1443 end
        elseif block == 1443 then
            r[40]=upvalues[8][7]
            r[39]=r[40]
            r[40]=r[36]
            r[41] = r[31][("Y")]
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            block=1485
        elseif block == 1485 then
            r[39]=upvalues[3][7]
            r[39][("goal")]=r[38]
            block=1597
        elseif block == 1506 then
            r[39] = env[("Vector3")]
            r[39] = r[39][("new")]
            r[38]=r[39]
            r[39]=upvalues[3][7]
            r[39] = r[39][("goal")]
            r[39] = r[39][("X")]
            r[40] = r[31][("Y")]
            r[41]=upvalues[3][7]
            r[41] = r[41][("goal")]
            r[41] = r[41][("Z")]
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39]=upvalues[3][7]
            r[39][("goal")]=r[38]
            block=1597
        elseif block == 1597 then
            r[38]=upvalues[3][7]
            r[38] = r[38][("goal")]
            r[39]=r[36]
            return unpackValues(r, 38, 39)
        elseif block == 1625 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[48] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(672391)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]=(702481)
            r[33]=r[32] == r[33]
            if not r[33] then block=57 else block=50 end
        elseif block == 50 then
            r[13]=r[6][("Y")]
            block=57
        elseif block == 57 then
            r[33]=upvalues[2][7]
            r[33] = r[33][("a")]
            r[34]=upvalues[2][7]
            r[34] = r[34][("b")]
            r[35]=(740589)
            r[35]=r[32] == r[35]
            if not r[35] then block=134 else block=106 end
        elseif block == 106 then
            r[15]=r[1] == r[0]
            r[0]=r[15] .. r[25]
            r[5]=#r[18]
            r[20]=r[15]
            block=134
        elseif block == 134 then
            r[36]=not r[33]
            r[35]=r[36]
            if r[35] then block=169 else block=155 end
        elseif block == 155 then
            r[36]=not r[34]
            r[35]=r[36]
            block=169
        elseif block == 169 then
            if not r[35] then block=197 else block=176 end
        elseif block == 176 then
            r[35]=nil
            return r[35]
        elseif block == 190 then
            block=197
        elseif block == 197 then
            r[35]=(745385)
            r[35]=r[32] == r[35]
            if not r[35] then block=232 else block=218 end
        elseif block == 218 then
            r[14]=r[20][r[15]]
            r[2][r[23]]=r[3]
            block=232
        elseif block == 232 then
            r[35]=nil
            r[36]=upvalues[3][7]
            r[36] = r[36][("routeTargetSide")]
            r[37] = r[33][("name")]
            if not (r[36] == r[37]) then block=330 else block=267 end
        elseif block == 267 then
            r[36]=(687877)
            r[36]=r[32] == r[36]
            if not r[36] then block=309 else block=288 end
        elseif block == 288 then
            r[17]=env[("Y")]
            r[10][r[22]]=r[5]
            r[0]=#r[7]
            block=309
        elseif block == 309 then
            r[36]=r[33]
            r[35]=r[36]
            block=799
        elseif block == 330 then
            r[36]=upvalues[3][7]
            r[36] = r[36][("routeTargetSide")]
            r[37] = r[34][("name")]
            if not (r[36] == r[37]) then block=407 else block=358 end
        elseif block == 358 then
            r[36]=(710446)
            r[36]=r[32] == r[36]
            if not r[36] then block=386 else block=379 end
        elseif block == 379 then
            r[5]=r[1] / r[21]
            block=386
        elseif block == 386 then
            r[36]=r[34]
            r[35]=r[36]
            block=799
        elseif block == 407 then
            r[36]=upvalues[3][7]
            r[36] = r[36][("goalSide")]
            r[37] = r[33][("name")]
            if not (r[36] == r[37]) then block=456 else block=435 end
        elseif block == 435 then
            r[36]=r[33]
            r[35]=r[36]
            block=799
        elseif block == 456 then
            r[36]=upvalues[3][7]
            r[36] = r[36][("goalSide")]
            r[37] = r[34][("name")]
            if not (r[36] == r[37]) then block=533 else block=484 end
        elseif block == 484 then
            r[36]=(750639)
            r[36]=r[32] == r[36]
            if not r[36] then block=512 else block=505 end
        elseif block == 505 then
            r[8]=r[23] * r[19]
            block=512
        elseif block == 512 then
            r[36]=r[34]
            r[35]=r[36]
            block=799
        elseif block == 533 then
            r[38]=upvalues[4][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[33]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            if not r[36] then block=631 else block=582 end
        elseif block == 582 then
            r[38]=upvalues[4][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[34]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=not r[37]
            r[36]=r[37]
            block=631
        elseif block == 631 then
            if not r[36] then block=659 else block=638 end
        elseif block == 638 then
            r[36]=r[34]
            r[35]=r[36]
            block=799
        elseif block == 659 then
            r[38]=upvalues[4][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[34]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            if not r[36] then block=757 else block=708 end
        elseif block == 708 then
            r[38]=upvalues[4][7]
            r[37]=r[38]
            r[38]=r[31]
            r[39]=r[33]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=not r[37]
            r[36]=r[37]
            block=757
        elseif block == 757 then
            if not r[36] then block=785 else block=764 end
        elseif block == 764 then
            r[36]=r[33]
            r[35]=r[36]
            block=799
        elseif block == 785 then
            r[36]=r[34]
            r[35]=r[36]
            block=799
        elseif block == 799 then
            r[38]=upvalues[5][7]
            r[37]=r[38]
            r[38]=r[35]
            r[41] = r[35] == r[33]
            r[40]=r[41]
            if not r[40] then block=848 else block=841 end
        elseif block == 841 then
            r[40]=r[34]
            block=848
        elseif block == 848 then
            r[39]=r[40]
            if r[39] then block=869 else block=862 end
        elseif block == 862 then
            r[39]=r[33]
            block=869
        elseif block == 869 then
            r[40] = r[31][("Y")]
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            if r[36] then block=939 else block=897 end
        elseif block == 897 then
            r[38]=upvalues[6][7]
            r[37]=r[38]
            r[38]=r[35]
            r[39] = r[31][("Y")]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            block=939
        elseif block == 939 then
            return r[36]
        elseif block == 946 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[49] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(54003)
            r[35] = r[31][("Name")]
            r[34]=r[35]
            r[33] = r[34][("lower")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[36]=r[31]
            r[35] = r[36][("IsA")]
            r[37]=("BasePart")
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34]=r[35]
            if not r[34] then block=260 else block=78 end
        elseif block == 78 then
            r[37]=r[33]
            r[36] = r[37][("sub")]
            r[38]=(1)
            r[39]=(4)
            do local f=r[36]; local n=3; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36] = r[36] == ("gem_")
            r[35]=r[36]
            if r[35] then block=253 else block=134 end
        elseif block == 134 then
            r[37] = r[33] == ("gem")
            r[36]=r[37]
            if r[36] then block=246 else block=155 end
        elseif block == 155 then
            r[38] = r[33] == ("gems")
            r[37]=r[38]
            if r[37] then block=239 else block=176 end
        elseif block == 176 then
            r[39]=r[33]
            r[38] = r[39][("find")]
            r[40]=("gempickup")
            r[41]=(1)
            r[42]=(true)
            do local f=r[38]; local n=4; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39]=nil
            r[38] = r[38] ~= r[39]
            r[37]=r[38]
            block=239
        elseif block == 239 then
            r[36]=r[37]
            block=246
        elseif block == 246 then
            r[35]=r[36]
            block=253
        elseif block == 253 then
            r[34]=r[35]
            block=260
        elseif block == 260 then
            return r[34]
        elseif block == 267 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[50] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]={[7]=r[31]}
            r[32]={[7]=r[32]}
            r[33]=(883220)
            r[34]=r[31][7]
            r[35]=upvalues[1][7]
            r[35] = r[35][("gemScanAt")]
            r[34] = r[34] - r[35]
            r[35]=upvalues[2][7]
            r[35] = r[35][("gemScanInterval")]
            if not (r[34] < r[35]) then block=85 else block=71 end
        elseif block == 71 then
            return unpackValues(r, 0, -1)
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[34]=r[31][7]
            r[35]=upvalues[1][7]
            r[35][("gemScanAt")]=r[34]
            r[34]=(939479)
            r[34]=r[33] == r[34]
            if not r[34] then block=134 else block=127 end
        elseif block == 127 then
            r[0]=r[17] .. r[12]
            block=134
        elseif block == 134 then
            r[34]=nil
            r[35]=nil
            r[34]={[7]=r[34]}
            r[35]={[7]=r[35]}
            do local captures = {}
            captures[1] = upvalues[3]
            captures[2] = upvalues[4]
            captures[3] = r[32]
            captures[4] = upvalues[1]
            captures[5] = upvalues[2]
            captures[6] = r[31]
            captures[7] = r[35]
            captures[8] = r[34]
            r[36]=function(...) return functions[51](captures, ...) end
            end
            r[37]=r[36]
            r[40] = env[("workspace")]
            r[39]=r[40]
            r[38] = r[39][("FindFirstChild")]
            r[40]=("LocalRunnerGems")
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=-1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            do local f=r[37]; local n=-1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=r[34][7]
            r[37]=not r[37]
            if not r[37] then block=351 else block=239 end
        elseif block == 239 then
            r[37]=r[36]
            r[41] = env[("workspace")]
            r[40]=r[41]
            r[39] = r[40][("FindFirstChild")]
            r[41]=("Gems")
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            if r[38] then block=337 else block=295 end
        elseif block == 295 then
            r[41] = env[("workspace")]
            r[40]=r[41]
            r[39] = r[40][("FindFirstChild")]
            r[41]=("Gem")
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            block=337
        elseif block == 337 then
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=351
        elseif block == 351 then
            r[37]=r[34][7]
            r[38]=upvalues[1][7]
            r[38][("gemTarget")]=r[37]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[51] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(749152)
            r[33]=not r[31]
            if not r[33] then block=36 else block=22 end
        elseif block == 22 then
            return unpackValues(r, 0, -1)
        elseif block == 29 then
            block=36
        elseif block == 36 then
            r[34] = env[("ipairs")]
            r[33]=r[34]
            r[35]=r[31]
            r[34] = r[35][("GetDescendants")]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=-1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            do local f=r[33]; local n=-1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=477
        elseif block == 85 then
            r[40]=upvalues[1][7]
            r[39]=r[40]
            r[40]=r[37]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            if not r[38] then block=141 else block=127 end
        elseif block == 127 then
            r[39] = r[37][("Parent")]
            r[38]=r[39]
            block=141
        elseif block == 141 then
            if not r[38] then block=477 else block=148 end
        elseif block == 148 then
            r[39]=upvalues[2][7]
            r[38]=r[39]
            r[39] = r[37][("Position")]
            r[40]=upvalues[3][7]
            r[39] = r[39] - r[40]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[38] = r[38][("Magnitude")]
            r[39]=(772083)
            r[39]=r[32] == r[39]
            if not r[39] then block=225 else block=218 end
        elseif block == 218 then
            r[2]=r[7] / r[4]
            block=225
        elseif block == 225 then
            r[39]=upvalues[4][7]
            r[39] = r[39][("gemIgnored")]
            r[39] = r[39][r[37]]
            r[41]=upvalues[5][7]
            r[41] = r[41][("gemMaxDistance")]
            r[41] = r[38] <= r[41]
            r[40]=r[41]
            if not r[40] then block=330 else block=281 end
        elseif block == 281 then
            r[42]=not r[39]
            r[41]=r[42]
            if r[41] then block=323 else block=302 end
        elseif block == 302 then
            r[42]=upvalues[6][7]
            r[42] = r[42] >= r[39]
            r[41]=r[42]
            block=323
        elseif block == 323 then
            r[40]=r[41]
            block=330
        elseif block == 330 then
            if not r[40] then block=470 else block=337 end
        elseif block == 337 then
            r[41]=upvalues[7][7]
            r[41]=not r[41]
            r[40]=r[41]
            if r[40] then block=386 else block=365 end
        elseif block == 365 then
            r[41]=upvalues[7][7]
            r[41] = r[38] < r[41]
            r[40]=r[41]
            block=386
        elseif block == 386 then
            if not r[40] then block=463 else block=393 end
        elseif block == 393 then
            r[40]=(793314)
            r[40]=r[32] == r[40]
            if not r[40] then block=428 else block=414 end
        elseif block == 414 then
            r[14]=r[6] < r[14]
            r[6]=r[16] + r[24]
            block=428
        elseif block == 428 then
            r[40]=r[37]
            upvalues[8][7]=r[40]
            r[40]=r[38]
            upvalues[7][7]=r[40]
            block=463
        elseif block == 463 then
            block=470
        elseif block == 470 then
            block=477
        elseif block == 477 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=85 else block=491 end
        elseif block == 491 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[52] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(901696)
            r[33]=nil
            r[34]=nil
            r[36] = env[("ipairs")]
            r[35]=r[36]
            r[38]=upvalues[1][7]
            r[37]=r[38]
            r[36] = r[37][("GetPlayers")]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=-1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            do local f=r[35]; local n=-1; if n<0 then n=top-35-1 end; local m=3; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            block=659
        elseif block == 78 then
            r[40]=(907231)
            r[40]=r[32] == r[40]
            if not r[40] then block=120 else block=99 end
        elseif block == 99 then
            do local f=r[10]; local n=23; if n<0 then n=top-10-1 end; local m=18; if m==1 then r[10]=f(unpackValues(r,11,10+n)); top=11 elseif m==0 then f(unpackValues(r,11,10+n)); top=10 else local result=packValues(f(unpackValues(r,11,10+n))); if m<0 then m=result.n end; for i=1,m do r[10+i-1]=result[i] end; top=10+m end end
            r[9]=r[20] / r[4]
            r[11]=r[2][r[3]]
            block=120
        elseif block == 120 then
            r[41]=upvalues[2][7]
            r[41] = r[39] ~= r[41]
            r[40]=r[41]
            if not r[40] then block=162 else block=148 end
        elseif block == 148 then
            r[41] = r[39][("Parent")]
            r[40]=r[41]
            block=162
        elseif block == 162 then
            if not r[40] then block=659 else block=169 end
        elseif block == 169 then
            r[40] = r[39][("Character")]
            r[41]=r[40]
            if not r[41] then block=225 else block=190 end
        elseif block == 190 then
            r[43]=r[40]
            r[42] = r[43][("FindFirstChild")]
            r[44]=("HumanoidRootPart")
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[41]=r[42]
            block=225
        elseif block == 225 then
            r[42]=r[41]
            if not r[42] then block=351 else block=239 end
        elseif block == 239 then
            r[45]=r[40]
            r[44] = r[45][("GetAttribute")]
            r[46]=("RescueAvailable")
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(true)
            r[44] = r[44] == r[45]
            r[43]=r[44]
            if not r[43] then block=344 else block=295 end
        elseif block == 295 then
            r[45]=r[40]
            r[44] = r[45][("GetAttribute")]
            r[46]=("Ragdolled")
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(true)
            r[44] = r[44] == r[45]
            r[43]=r[44]
            block=344
        elseif block == 344 then
            r[42]=r[43]
            block=351
        elseif block == 351 then
            if not r[42] then block=652 else block=358 end
        elseif block == 358 then
            r[43]=r[40]
            r[42] = r[43][("GetAttribute")]
            r[44]=("RescueHelperId")
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[44]=nil
            r[44] = r[42] == r[44]
            r[43]=r[44]
            if r[43] then block=442 else block=414 end
        elseif block == 414 then
            r[44]=upvalues[2][7]
            r[44] = r[44][("UserId")]
            r[44] = r[42] == r[44]
            r[43]=r[44]
            block=442
        elseif block == 442 then
            if not r[43] then block=645 else block=449 end
        elseif block == 449 then
            r[44]=upvalues[3][7]
            r[43]=r[44]
            r[44] = r[41][("Position")]
            r[44] = r[44] - r[31]
            do local f=r[43]; local n=1; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[43] = r[43][("Magnitude")]
            r[45]=upvalues[4][7]
            r[45] = r[45][("reviveMaxDistance")]
            r[45] = r[43] <= r[45]
            r[44]=r[45]
            if not r[44] then block=568 else block=526 end
        elseif block == 526 then
            r[46]=not r[34]
            r[45]=r[46]
            if r[45] then block=561 else block=547 end
        elseif block == 547 then
            r[46] = r[43] < r[34]
            r[45]=r[46]
            block=561
        elseif block == 561 then
            r[44]=r[45]
            block=568
        elseif block == 568 then
            if not r[44] then block=638 else block=575 end
        elseif block == 575 then
            r[44]=(1000008)
            r[44]=r[32] == r[44]
            if not r[44] then block=603 else block=596 end
        elseif block == 596 then
            r[9]=r[7] .. r[8]
            block=603
        elseif block == 603 then
            r[44]=r[39]
            r[33]=r[44]
            r[44]=r[43]
            r[34]=r[44]
            block=638
        elseif block == 638 then
            block=645
        elseif block == 645 then
            block=652
        elseif block == 652 then
            block=659
        elseif block == 659 then
            r[38], r[39]=r[35](r[36],r[37])
            if r[38]~=nil then r[37]=r[38]; block=78 else block=673 end
        elseif block == 673 then
            return r[33]
        elseif block == 680 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[53] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(795388)
            r[32]=(887984)
            r[32]=r[31] == r[32]
            if not r[32] then block=57 else block=29 end
        elseif block == 29 then
            r[16]=r[8][r[10]]
            r[24]=r[8] .. r[0]
            r[10][r[22]]=r[12]
            r[23]=r[14] .. r[25]
            block=57
        elseif block == 57 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("reviveTarget")]
            r[32]=r[33]
            if not r[32] then block=106 else block=85 end
        elseif block == 85 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("reviveStarted")]
            r[32]=r[33]
            block=106
        elseif block == 106 then
            if not r[32] then block=148 else block=113 end
        elseif block == 113 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            captures[1] = upvalues[2]
            captures[2] = upvalues[1]
            r[33]=function(...) return functions[54](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            block=148
        elseif block == 148 then
            r[32]=nil
            r[33]=upvalues[1][7]
            r[33][("reviveTarget")]=r[32]
            r[32]=(879663)
            r[32]=r[31] == r[32]
            if not r[32] then block=204 else block=190 end
        elseif block == 190 then
            r[11]=r[17] * r[22]
            r[22]=(nil)
            block=204
        elseif block == 204 then
            r[32]=(false)
            r[33]=upvalues[1][7]
            r[33][("reviveStarted")]=r[32]
            r[32]=(812492)
            r[32]=r[31] == r[32]
            if not r[32] then block=260 else block=246 end
        elseif block == 246 then
            r[13]=r[10] < r[1]
            r[12]=env[(nil)]
            block=260
        elseif block == 260 then
            r[32]=(0)
            r[33]=upvalues[1][7]
            r[33][("reviveStartAt")]=r[32]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[54] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(506269)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("FireServer")]
            r[34]=("Cancel")
            r[35]=upvalues[2][7]
            r[35] = r[35][("reviveTarget")]
            r[35] = r[35][("UserId")]
            do local f=r[32]; local n=3; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[55] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(578827)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]={[7]=r[33]}
            r[34]=r[31]
            if not r[34] then block=85 else block=50 end
        elseif block == 50 then
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34]=r[35]
            block=85
        elseif block == 85 then
            r[34]={[7]=r[34]}
            r[35]=(667182)
            r[35]=r[32] == r[35]
            if not r[35] then block=141 else block=113 end
        elseif block == 113 then
            r[13]=r[12][(nil)]
            r[12]=r[1]
            r[5]=r[25] / r[9]
            r[19]=r[24][("pcall")]
            block=141
        elseif block == 141 then
            r[36]=r[33][7]
            r[36]=not r[36]
            r[35]=r[36]
            if r[35] then block=190 else block=169 end
        elseif block == 169 then
            r[36]=r[34][7]
            r[36]=not r[36]
            r[35]=r[36]
            block=190
        elseif block == 190 then
            if not r[35] then block=253 else block=197 end
        elseif block == 197 then
            r[35]=(653454)
            r[35]=r[32] == r[35]
            if not r[35] then block=232 else block=218 end
        elseif block == 218 then
            r[15]=r[14] + r[14]
            do local f=r[10]; local n=21; if n<0 then n=top-10-1 end; local m=20; if m==1 then r[10]=f(unpackValues(r,11,10+n)); top=11 elseif m==0 then f(unpackValues(r,11,10+n)); top=10 else local result=packValues(f(unpackValues(r,11,10+n))); if m<0 then m=result.n end; for i=1,m do r[10+i-1]=result[i] end; top=10+m end end
            block=232
        elseif block == 232 then
            r[35]=(false)
            return r[35]
        elseif block == 246 then
            block=253
        elseif block == 253 then
            r[36] = env[("RaycastParams")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35]={[7]=r[35]}
            r[36] = env[("Enum")]
            r[36] = r[36][("RaycastFilterType")]
            r[36] = r[36][("Exclude")]
            r[37]=r[35][7]
            r[37][("FilterType")]=r[36]
            r[36]={}
            r[37]=r[33][7]
            r[37] = r[37][("Parent")]
            r[36][(1)]=r[37]
            r[37]=r[34][7]
            r[37] = r[37][("Parent")]
            r[36][(2)]=r[37]
            r[37]=r[35][7]
            r[37][("FilterDescendantsInstances")]=r[36]
            r[36]=(true)
            r[37]=r[35][7]
            r[37][("RespectCanCollide")]=r[36]
            r[37] = env[("pcall")]
            r[36]=r[37]
            do local captures = {}
            captures[1] = r[33]
            captures[2] = r[34]
            captures[3] = r[35]
            r[37]=function(...) return functions[56](captures, ...) end
            end
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=2; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38]=(654978)
            r[38]=r[32] == r[38]
            if not r[38] then block=477 else block=456 end
        elseif block == 456 then
            r[1]=r[24]
            r[6]=r[0] + r[23]
            r[0]=r[7] + r[5]
            block=477
        elseif block == 477 then
            r[38]=r[36]
            if not r[38] then block=512 else block=491 end
        elseif block == 491 then
            r[39]=nil
            r[39] = r[37] == r[39]
            r[38]=r[39]
            block=512
        elseif block == 512 then
            return r[38]
        elseif block == 519 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[56] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(251310)
            r[34] = env[("workspace")]
            r[33]=r[34]
            r[32] = r[33][("Raycast")]
            r[34]=upvalues[1][7]
            r[34] = r[34][("Position")]
            r[35]=upvalues[2][7]
            r[35] = r[35][("Position")]
            r[36]=upvalues[1][7]
            r[36] = r[36][("Position")]
            r[35] = r[35] - r[36]
            r[36]=upvalues[3][7]
            do local f=r[32]; local n=4; if n<0 then n=top-32-1 end; local m=-1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 32, top-1)
        elseif block == 99 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[57] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(794405)
            r[34]=upvalues[1][7]
            r[34] = r[34][("autoRevive")]
            r[34]=not r[34]
            if not r[34] then block=78 else block=36 end
        elseif block == 36 then
            r[35]=upvalues[2][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=nil
            return r[34]
        elseif block == 71 then
            block=78
        elseif block == 78 then
            r[34]=(811916)
            r[34]=r[33] == r[34]
            if not r[34] then block=120 else block=99 end
        elseif block == 99 then
            r[20]=env[("Character")]
            r[22][r[24]]=r[11]
            r[23]=r[24] == r[5]
            block=120
        elseif block == 120 then
            r[34]=upvalues[3][7]
            r[34] = r[34][("reviveTarget")]
            r[34]={[7]=r[34]}
            r[35]=(871132)
            r[35]=r[33] == r[35]
            if not r[35] then block=169 else block=162 end
        elseif block == 162 then
            r[17][r[4]]=r[12]
            block=169
        elseif block == 169 then
            r[36]=r[34][7]
            r[35]=r[36]
            if not r[35] then block=225 else block=190 end
        elseif block == 190 then
            r[37]=upvalues[4][7]
            r[36]=r[37]
            r[37]=r[34][7]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            block=225
        elseif block == 225 then
            r[37]=r[34][7]
            r[37]=not r[37]
            r[36]=r[37]
            if r[36] then block=463 else block=253 end
        elseif block == 253 then
            r[38]=r[34][7]
            r[38] = r[38][("Parent")]
            r[38]=not r[38]
            r[37]=r[38]
            if r[37] then block=456 else block=288 end
        elseif block == 288 then
            r[39]=not r[35]
            r[38]=r[39]
            if r[38] then block=449 else block=309 end
        elseif block == 309 then
            r[42]=r[34][7]
            r[42] = r[42][("Character")]
            r[41]=r[42]
            r[40] = r[41][("GetAttribute")]
            r[42]=("RescueAvailable")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41]=(true)
            r[40] = r[40] ~= r[41]
            r[39]=r[40]
            if r[39] then block=442 else block=379 end
        elseif block == 379 then
            r[42]=r[34][7]
            r[42] = r[42][("Character")]
            r[41]=r[42]
            r[40] = r[41][("GetAttribute")]
            r[42]=("Ragdolled")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41]=(true)
            r[40] = r[40] ~= r[41]
            r[39]=r[40]
            block=442
        elseif block == 442 then
            r[38]=r[39]
            block=449
        elseif block == 449 then
            r[37]=r[38]
            block=456
        elseif block == 456 then
            r[36]=r[37]
            block=463
        elseif block == 463 then
            if not r[36] then block=554 else block=470 end
        elseif block == 470 then
            r[37]=upvalues[2][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=0; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36]=(798185)
            r[36]=r[33] == r[36]
            if not r[36] then block=533 else block=512 end
        elseif block == 512 then
            r[20]=env[("RescueAvailable")]
            r[16]=r[16] < r[17]
            r[23]=r[7] < r[19]
            block=533
        elseif block == 533 then
            r[36]=nil
            r[34][7]=r[36]
            block=554
        elseif block == 554 then
            r[36]=r[34][7]
            r[36]=not r[36]
            if not r[36] then block=708 else block=575 end
        elseif block == 575 then
            r[37]=upvalues[5][7]
            r[36]=r[37]
            r[37]=r[32]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[34][7]=r[36]
            r[36]=r[34][7]
            r[36]=not r[36]
            if not r[36] then block=680 else block=631 end
        elseif block == 631 then
            r[36]=(854798)
            r[36]=r[33] == r[36]
            if not r[36] then block=659 else block=652 end
        elseif block == 652 then
            r[0][(892941)]=r[24]
            block=659
        elseif block == 659 then
            r[36]=nil
            return r[36]
        elseif block == 673 then
            block=680
        elseif block == 680 then
            r[36]=r[34][7]
            r[37]=upvalues[3][7]
            r[37][("reviveTarget")]=r[36]
            block=708
        elseif block == 708 then
            r[36]=(822722)
            r[36]=r[33] == r[36]
            if not r[36] then block=743 else block=729 end
        elseif block == 729 then
            r[4]=r[21] == r[18]
            r[12]=env[(873202)]
            block=743
        elseif block == 743 then
            r[37]=upvalues[4][7]
            r[36]=r[37]
            r[37]=r[34][7]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            r[36]=not r[35]
            if not r[36] then block=834 else block=792 end
        elseif block == 792 then
            r[37]=upvalues[2][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=0; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36]=nil
            return r[36]
        elseif block == 827 then
            block=834
        elseif block == 834 then
            r[36]=("Revive")
            r[37]=upvalues[3][7]
            r[37][("goalMode")]=r[36]
            r[36]=(893310)
            r[36]=r[33] == r[36]
            if not r[36] then block=883 else block=876 end
        elseif block == 876 then
            r[21]=r[10] * r[4]
            block=883
        elseif block == 883 then
            r[37]=upvalues[6][7]
            r[36]=r[37]
            r[37] = r[35][("Position")]
            r[37] = r[37] - r[32]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36] = r[36][("Magnitude")]
            r[37]=(892941)
            r[37]=r[33] == r[37]
            if not r[37] then block=967 else block=946 end
        elseif block == 946 then
            r[4]=env[("Parent")]
            r[9]=r[15][r[3]]
            r[13]=r[23][("RescueAvailable")]
            block=967
        elseif block == 967 then
            r[38] = env[("math")]
            r[38] = r[38][("max")]
            r[37]=r[38]
            r[38]=upvalues[7][7]
            r[39]=upvalues[1][7]
            r[39] = r[39][("reviveMaxDistance")]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            if not (r[36] > r[37]) then block=1065 else block=1023 end
        elseif block == 1023 then
            r[38]=upvalues[2][7]
            r[37]=r[38]
            do local f=r[37]; local n=0; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=nil
            return r[37]
        elseif block == 1058 then
            block=1065
        elseif block == 1065 then
            r[37]=(873202)
            r[37]=r[33] == r[37]
            if not r[37] then block=1107 else block=1086 end
        elseif block == 1086 then
            r[9]=r[9] / r[4]
            r[8]=r[1][r[4]]
            r[2]=#r[25]
            block=1107
        elseif block == 1107 then
            r[37]=upvalues[7][7]
            if not (r[36] <= r[37]) then block=1590 else block=1121 end
        elseif block == 1121 then
            r[38]=upvalues[3][7]
            r[38] = r[38][("reviveStarted")]
            r[38]=not r[38]
            r[37]=r[38]
            if not r[37] then block=1184 else block=1156 end
        elseif block == 1156 then
            r[38]=upvalues[3][7]
            r[38] = r[38][("reviveStartAt")]
            r[38] = r[31] < r[38]
            r[37]=r[38]
            block=1184
        elseif block == 1184 then
            if not r[37] then block=1212 else block=1191 end
        elseif block == 1191 then
            r[37] = r[35][("Position")]
            return r[37]
        elseif block == 1205 then
            block=1212
        elseif block == 1212 then
            r[38]=upvalues[8][7]
            r[37]=r[38]
            r[38]=r[34][7]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            if not r[37] then block=1583 else block=1247 end
        elseif block == 1247 then
            r[37]=upvalues[3][7]
            r[37] = r[37][("reviveStarted")]
            r[37]=not r[37]
            if not r[37] then block=1422 else block=1275 end
        elseif block == 1275 then
            r[37]=(882557)
            r[37]=r[33] == r[37]
            if not r[37] then block=1317 else block=1296 end
        elseif block == 1296 then
            r[24]=r[25] / r[13]
            r[15]=r[21] == r[8]
            r[23]=r[6][r[17]]
            block=1317
        elseif block == 1317 then
            r[37]=(true)
            r[38]=upvalues[3][7]
            r[38][("reviveStarted")]=r[37]
            r[37]=r[31]
            r[38]=upvalues[3][7]
            r[38][("reviveStartAt")]=r[37]
            r[37]=(888222)
            r[37]=r[33] == r[37]
            if not r[37] then block=1387 else block=1380 end
        elseif block == 1380 then
            r[23]=r[2][("Magnitude")]
            block=1387
        elseif block == 1387 then
            r[38] = env[("pcall")]
            r[37]=r[38]
            do local captures = {}
            captures[1] = upvalues[9]
            captures[2] = r[34]
            r[38]=function(...) return functions[58](captures, ...) end
            end
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=1576
        elseif block == 1422 then
            r[37]=upvalues[3][7]
            r[37] = r[37][("reviveStartAt")]
            r[37] = r[31] - r[37]
            r[38]=upvalues[10][7]
            if not (r[37] >= r[38]) then block=1576 else block=1457 end
        elseif block == 1457 then
            r[37]=(844755)
            r[37]=r[33] == r[37]
            if not r[37] then block=1485 else block=1478 end
        elseif block == 1478 then
            r[8]=env[("Parent")]
            block=1485
        elseif block == 1485 then
            r[38] = env[("pcall")]
            r[37]=r[38]
            do local captures = {}
            captures[1] = upvalues[9]
            captures[2] = r[34]
            r[38]=function(...) return functions[59](captures, ...) end
            end
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=(false)
            r[38]=upvalues[3][7]
            r[38][("reviveStarted")]=r[37]
            r[37]=upvalues[11][7]
            r[37] = r[31] + r[37]
            r[37] = r[37] + (0.5)
            r[38]=upvalues[3][7]
            r[38][("reviveStartAt")]=r[37]
            block=1576
        elseif block == 1576 then
            block=1583
        elseif block == 1583 then
            block=1667
        elseif block == 1590 then
            r[37]=upvalues[3][7]
            r[37] = r[37][("reviveStarted")]
            if not r[37] then block=1667 else block=1611 end
        elseif block == 1611 then
            r[37]=(810753)
            r[37]=r[33] == r[37]
            if not r[37] then block=1639 else block=1632 end
        elseif block == 1632 then
            r[8][r[0]]=r[1]
            block=1639
        elseif block == 1639 then
            r[38]=upvalues[2][7]
            r[37]=r[38]
            do local f=r[37]; local n=0; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=1667
        elseif block == 1667 then
            r[37]=(816444)
            r[37]=r[33] == r[37]
            if not r[37] then block=1709 else block=1688 end
        elseif block == 1688 then
            r[6]=r[13] - r[14]
            r[0]=env[("Character")]
            r[1]=r[4] + r[18]
            block=1709
        elseif block == 1709 then
            r[37] = r[35][("Position")]
            return r[37]
        elseif block == 1723 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[58] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(502167)
            r[32]=(558923)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=29 end
        elseif block == 29 then
            r[23]=r[3] - r[6]
            r[10]=(nil)
            r[15]=r[12] + r[7]
            block=50
        elseif block == 50 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("FireServer")]
            r[34]=("Begin")
            r[35]=upvalues[2][7]
            r[35] = r[35][("UserId")]
            do local f=r[32]; local n=3; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[59] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(990995)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("FireServer")]
            r[34]=("Finish")
            r[35]=upvalues[2][7]
            r[35] = r[35][("UserId")]
            do local f=r[32]; local n=3; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[60] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(655003)
            r[33]=(659664)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[14]=r[24] .. r[10]
            r[18]=("Ragdolled")
            r[10]=#r[21]
            block=50
        elseif block == 50 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("catcherCacheAt")]
            r[33] = r[31] - r[33]
            if not (r[33] < (0.12)) then block=92 else block=78 end
        elseif block == 78 then
            return unpackValues(r, 0, -1)
        elseif block == 85 then
            block=92
        elseif block == 92 then
            r[33]=r[31]
            r[34]=upvalues[1][7]
            r[34][("catcherCacheAt")]=r[33]
            r[34] = env[("table")]
            r[34] = r[34][("clear")]
            r[33]=r[34]
            r[34]=upvalues[1][7]
            r[34] = r[34][("catchers")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34] = env[("ipairs")]
            r[33]=r[34]
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[34] = r[35][("GetPlayers")]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=-1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            do local f=r[33]; local n=-1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=736
        elseif block == 211 then
            r[39]=upvalues[3][7]
            r[39] = r[37] ~= r[39]
            r[38]=r[39]
            if not r[38] then block=365 else block=239 end
        elseif block == 239 then
            r[40] = r[37][("Parent")]
            r[39]=r[40]
            if not r[39] then block=358 else block=260 end
        elseif block == 260 then
            r[42]=r[37]
            r[41] = r[42][("GetAttribute")]
            r[43]=("GameRole")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[41] == ("Catcher")
            r[40]=r[41]
            if not r[40] then block=351 else block=309 end
        elseif block == 309 then
            r[42]=r[37]
            r[41] = r[42][("GetAttribute")]
            r[43]=("RunState")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[41] == ("Active")
            r[40]=r[41]
            block=351
        elseif block == 351 then
            r[39]=r[40]
            block=358
        elseif block == 358 then
            r[38]=r[39]
            block=365
        elseif block == 365 then
            if not r[38] then block=736 else block=372 end
        elseif block == 372 then
            r[38] = r[37][("Character")]
            r[39]=r[38]
            if not r[39] then block=428 else block=393 end
        elseif block == 393 then
            r[41]=r[38]
            r[40] = r[41][("FindFirstChildOfClass")]
            r[42]=("Humanoid")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[39]=r[40]
            block=428
        elseif block == 428 then
            r[40]=r[38]
            if not r[40] then block=477 else block=442 end
        elseif block == 442 then
            r[42]=r[38]
            r[41] = r[42][("FindFirstChild")]
            r[43]=("HumanoidRootPart")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[40]=r[41]
            block=477
        elseif block == 477 then
            r[41]=r[39]
            if not r[41] then block=659 else block=491 end
        elseif block == 491 then
            r[43] = r[39][("Health")]
            r[43] = r[43] > (0)
            r[42]=r[43]
            if not r[42] then block=652 else block=519 end
        elseif block == 519 then
            r[43]=r[40]
            if not r[43] then block=645 else block=533 end
        elseif block == 533 then
            r[46]=r[38]
            r[45] = r[46][("GetAttribute")]
            r[47]=("Ragdolled")
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[46]=(true)
            r[45] = r[45] ~= r[46]
            r[44]=r[45]
            if not r[44] then block=638 else block=589 end
        elseif block == 589 then
            r[46]=r[38]
            r[45] = r[46][("GetAttribute")]
            r[47]=("MovementLocked")
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[46]=(true)
            r[45] = r[45] ~= r[46]
            r[44]=r[45]
            block=638
        elseif block == 638 then
            r[43]=r[44]
            block=645
        elseif block == 645 then
            r[42]=r[43]
            block=652
        elseif block == 652 then
            r[41]=r[42]
            block=659
        elseif block == 659 then
            if not r[41] then block=729 else block=666 end
        elseif block == 666 then
            r[41]=r[37]
            r[42]=upvalues[1][7]
            r[42] = r[42][("catchers")]
            r[43]=upvalues[1][7]
            r[43] = r[43][("catchers")]
            r[43]=#r[43]
            r[43] = r[43] + (1)
            r[42][r[43]]=r[41]
            block=729
        elseif block == 729 then
            block=736
        elseif block == 736 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=211 else block=750 end
        elseif block == 750 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[61] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(950876)
            r[34]=upvalues[1][7]
            r[34] = r[34][("threatAt")]
            r[34] = r[31] - r[34]
            if not (r[34] < (0.045)) then block=64 else block=36 end
        elseif block == 36 then
            r[34]=upvalues[1][7]
            r[34] = r[34][("threats")]
            return r[34]
        elseif block == 57 then
            block=64
        elseif block == 64 then
            r[34]=r[31]
            r[35]=upvalues[1][7]
            r[35][("threatAt")]=r[34]
            r[35] = env[("table")]
            r[35] = r[35][("clear")]
            r[34]=r[35]
            r[35]=upvalues[1][7]
            r[35] = r[35][("threats")]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=upvalues[2][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36]=r[34]
            if not r[36] then block=197 else block=162 end
        elseif block == 162 then
            r[38]=upvalues[3][7]
            r[37]=r[38]
            r[38] = r[34][("AssemblyLinearVelocity")]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            block=197
        elseif block == 197 then
            r[35]=r[36]
            if r[35] then block=232 else block=211 end
        elseif block == 211 then
            r[36] = env[("Vector3")]
            r[36] = r[36][("zero")]
            r[35]=r[36]
            block=232
        elseif block == 232 then
            r[36]=(1048356)
            r[36]=r[33] == r[36]
            if not r[36] then block=281 else block=253 end
        elseif block == 253 then
            r[18][("threats")]=r[0]
            r[9][("Unit")]=r[5]
            r[12]=r[9]
            r[25]=r[17] * r[1]
            block=281
        elseif block == 281 then
            r[37] = env[("math")]
            r[37] = r[37][("max")]
            r[36]=r[37]
            r[38]=upvalues[4][7]
            r[37]=r[38]
            do local f=r[37]; local n=0; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=(1)
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = r[35][("Magnitude")]
            r[38] = r[38] < (3)
            r[37]=r[38]
            if not r[37] then block=400 else block=365 end
        elseif block == 365 then
            r[38]=upvalues[1][7]
            r[38] = r[38][("path")]
            r[38] = r[38][("Magnitude")]
            r[38] = r[38] > (0.05)
            r[37]=r[38]
            block=400
        elseif block == 400 then
            if not r[37] then block=449 else block=407 end
        elseif block == 407 then
            r[37]=upvalues[1][7]
            r[37] = r[37][("path")]
            r[37] = r[37][("Unit")]
            r[37] = r[37] * r[36]
            r[35]=r[37]
            block=449
        elseif block == 449 then
            r[37]=(995567)
            r[37]=r[33] == r[37]
            if not r[37] then block=491 else block=470 end
        elseif block == 470 then
            r[5]=r[12] * r[4]
            r[7]=r[12] .. r[3]
            r[23]=r[21] .. r[13]
            block=491
        elseif block == 491 then
            r[37]=(0)
            r[37]={[7]=r[37]}
            r[39] = env[("pcall")]
            r[38]=r[39]
            do local captures = {}
            captures[1] = r[37]
            r[39]=function(...) return functions[62](captures, ...) end
            end
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39] = env[("ipairs")]
            r[38]=r[39]
            r[39]=upvalues[1][7]
            r[39] = r[39][("catchers")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=3; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=4964
        elseif block == 575 then
            r[44]=upvalues[2][7]
            r[43]=r[44]
            r[44]=r[42]
            do local f=r[43]; local n=1; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[44]=(951914)
            r[44]=r[33] == r[44]
            if not r[44] then block=631 else block=624 end
        elseif block == 624 then
            r[17]=r[16] .. r[17]
            block=631
        elseif block == 631 then
            if not r[43] then block=4964 else block=638 end
        elseif block == 638 then
            r[44]=(1017418)
            r[44]=r[33] == r[44]
            if not r[44] then block=687 else block=659 end
        elseif block == 659 then
            r[7][(1048356)]=r[20]
            r[14]=#r[4]
            do local f=r[4]; local n=22; if n<0 then n=top-4-1 end; local m=23; if m==1 then r[4]=f(unpackValues(r,5,4+n)); top=5 elseif m==0 then f(unpackValues(r,5,4+n)); top=4 else local result=packValues(f(unpackValues(r,5,4+n))); if m<0 then m=result.n end; for i=1,m do r[4+i-1]=result[i] end; top=4+m end end
            r[2]=#r[21]
            block=687
        elseif block == 687 then
            r[45]=upvalues[3][7]
            r[44]=r[45]
            r[45] = r[43][("Position")]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(1004300)
            r[45]=r[33] == r[45]
            if not r[45] then block=757 else block=736 end
        elseif block == 736 then
            r[16]=r[19] < r[14]
            r[5]=r[0]
            r[1]=r[3][("threats")]
            block=757
        elseif block == 757 then
            r[45] = r[44] - r[32]
            r[46]=(985637)
            r[46]=r[33] == r[46]
            if not r[46] then block=806 else block=785 end
        elseif block == 785 then
            r[7]=r[16]
            r[4]=("max")
            r[13]=r[14] + r[14]
            block=806
        elseif block == 806 then
            r[46] = r[45][("Magnitude")]
            r[47]=(991426)
            r[47]=r[33] == r[47]
            if not r[47] then block=855 else block=834 end
        elseif block == 834 then
            r[5]=r[20] - r[4]
            r[12]=env[(1048356)]
            do local f=r[25]; local n=11; if n<0 then n=top-25-1 end; local m=23; if m==1 then r[25]=f(unpackValues(r,26,25+n)); top=26 elseif m==0 then f(unpackValues(r,26,25+n)); top=25 else local result=packValues(f(unpackValues(r,26,25+n))); if m<0 then m=result.n end; for i=1,m do r[25+i-1]=result[i] end; top=25+m end end
            block=855
        elseif block == 855 then
            if not (r[46] <= (105)) then block=4957 else block=862 end
        elseif block == 862 then
            r[48]=upvalues[3][7]
            r[47]=r[48]
            r[48] = r[43][("AssemblyLinearVelocity")]
            do local f=r[47]; local n=1; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[48]=(1032343)
            r[48]=r[33] == r[48]
            if not r[48] then block=939 else block=911 end
        elseif block == 911 then
            r[16]=r[14]
            r[13][(1)]=r[8]
            r[22]=r[21] .. r[15]
            r[17]=r[21] .. r[5]
            block=939
        elseif block == 939 then
            r[48]=upvalues[1][7]
            r[48] = r[48][("threatHistory")]
            r[48] = r[48][r[42]]
            r[49]=not r[48]
            if not r[49] then block=1086 else block=974 end
        elseif block == 974 then
            r[49]=(1040226)
            r[49]=r[33] == r[49]
            if not r[49] then block=1016 else block=995 end
        elseif block == 995 then
            do local f=r[19]; local n=3; if n<0 then n=top-19-1 end; local m=5; if m==1 then r[19]=f(unpackValues(r,20,19+n)); top=20 elseif m==0 then f(unpackValues(r,20,19+n)); top=19 else local result=packValues(f(unpackValues(r,20,19+n))); if m<0 then m=result.n end; for i=1,m do r[19+i-1]=result[i] end; top=19+m end end
            r[13]=r[20] < r[25]
            r[23]=r[13] - r[5]
            block=1016
        elseif block == 1016 then
            r[49]={}
            r[49][("position")]=r[44]
            r[49][("velocity")]=r[47]
            r[49][("time")]=r[31]
            r[48]=r[49]
            r[49]=r[48]
            r[50]=upvalues[1][7]
            r[50] = r[50][("threatHistory")]
            r[50][r[42]]=r[49]
            block=1086
        elseif block == 1086 then
            r[49] = r[48][("time")]
            r[49] = r[31] - r[49]
            r[50] = env[("Vector3")]
            r[50] = r[50][("zero")]
            r[52] = r[49] > (0.025)
            r[51]=r[52]
            if not r[51] then block=1149 else block=1135 end
        elseif block == 1135 then
            r[52] = r[49] < (0.25)
            r[51]=r[52]
            block=1149
        elseif block == 1149 then
            if not r[51] then block=1268 else block=1156 end
        elseif block == 1156 then
            r[51]=(1038894)
            r[51]=r[33] == r[51]
            if not r[51] then block=1191 else block=1177 end
        elseif block == 1177 then
            r[17]=r[4] + r[20]
            r[4]=env[(nil)]
            block=1191
        elseif block == 1191 then
            r[51] = r[48][("velocity")]
            r[51] = r[47] - r[51]
            r[51] = r[51] / r[49]
            r[50]=r[51]
            r[51] = r[50][("Magnitude")]
            if not (r[51] > (70)) then block=1261 else block=1233 end
        elseif block == 1233 then
            r[51] = r[50][("Unit")]
            r[51] = r[51] * (70)
            r[50]=r[51]
            block=1261
        elseif block == 1261 then
            block=1268
        elseif block == 1268 then
            r[51]=r[44]
            r[52]=r[47]
            r[53]=r[31]
            r[48][("position")]=r[51]
            r[48][("velocity")]=r[52]
            r[48][("time")]=r[53]
            r[51] = r[44] - r[32]
            r[52]=(984470)
            r[52]=r[33] == r[52]
            if not r[52] then block=1352 else block=1338 end
        elseif block == 1338 then
            r[20]=r[9] .. r[18]
            r[22]=r[20] == r[17]
            block=1352
        elseif block == 1352 then
            r[52] = r[47] - r[35]
            r[54]=r[52]
            r[53] = r[54][("Dot")]
            r[55]=r[52]
            do local f=r[53]; local n=2; if n<0 then n=top-53-1 end; local m=1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            r[54]=(0)
            if not (r[53] > (0.25)) then block=1527 else block=1401 end
        elseif block == 1401 then
            r[55]=(1048348)
            r[55]=r[33] == r[55]
            if not r[55] then block=1429 else block=1422 end
        elseif block == 1422 then
            r[2][r[10]]=r[16]
            block=1429
        elseif block == 1429 then
            r[56] = env[("math")]
            r[56] = r[56][("clamp")]
            r[55]=r[56]
            r[57]=r[51]
            r[56] = r[57][("Dot")]
            r[58]=r[52]
            do local f=r[56]; local n=2; if n<0 then n=top-56-1 end; local m=1; if m==1 then r[56]=f(unpackValues(r,57,56+n)); top=57 elseif m==0 then f(unpackValues(r,57,56+n)); top=56 else local result=packValues(f(unpackValues(r,57,56+n))); if m<0 then m=result.n end; for i=1,m do r[56+i-1]=result[i] end; top=56+m end end
            r[56]=-r[56]
            r[56] = r[56] / r[53]
            r[57]=(0)
            r[58]=(1.8)
            do local f=r[55]; local n=3; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[54]=r[55]
            block=1527
        elseif block == 1527 then
            r[56] = env[("math")]
            r[56] = r[56][("clamp")]
            r[55]=r[56]
            r[56]=upvalues[5][7]
            r[56] = r[56][("predictionTime")]
            r[57]=upvalues[1][7]
            r[57] = r[57][("ping")]
            r[57] = r[57] * (0.85)
            r[56] = r[56] + r[57]
            r[57]=(0.28)
            r[58]=(1.15)
            do local f=r[55]; local n=3; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[57] = env[("math")]
            r[57] = r[57][("clamp")]
            r[56]=r[57]
            r[57] = r[47][("Magnitude")]
            r[59] = env[("math")]
            r[59] = r[59][("max")]
            r[58]=r[59]
            r[59]=r[36]
            r[60]=(1)
            do local f=r[58]; local n=2; if n<0 then n=top-58-1 end; local m=1; if m==1 then r[58]=f(unpackValues(r,59,58+n)); top=59 elseif m==0 then f(unpackValues(r,59,58+n)); top=58 else local result=packValues(f(unpackValues(r,59,58+n))); if m<0 then m=result.n end; for i=1,m do r[58+i-1]=result[i] end; top=58+m end end
            r[57] = r[57] / r[58]
            r[58]=(0.65)
            r[59]=(1.25)
            do local f=r[56]; local n=3; if n<0 then n=top-56-1 end; local m=1; if m==1 then r[56]=f(unpackValues(r,57,56+n)); top=57 elseif m==0 then f(unpackValues(r,57,56+n)); top=56 else local result=packValues(f(unpackValues(r,57,56+n))); if m<0 then m=result.n end; for i=1,m do r[56+i-1]=result[i] end; top=56+m end end
            r[58] = env[("math")]
            r[58] = r[58][("clamp")]
            r[57]=r[58]
            r[58] = r[55] * r[56]
            r[59]=(0.28)
            r[60]=(1.15)
            do local f=r[57]; local n=3; if n<0 then n=top-57-1 end; local m=1; if m==1 then r[57]=f(unpackValues(r,58,57+n)); top=58 elseif m==0 then f(unpackValues(r,58,57+n)); top=57 else local result=packValues(f(unpackValues(r,58,57+n))); if m<0 then m=result.n end; for i=1,m do r[57+i-1]=result[i] end; top=57+m end end
            r[55]=r[57]
            r[57] = r[42][("Character")]
            r[58]=r[57]
            if not r[58] then block=1835 else block=1786 end
        elseif block == 1786 then
            r[60]=r[57]
            r[59] = r[60][("GetAttribute")]
            r[61]=("TackleActive")
            do local f=r[59]; local n=2; if n<0 then n=top-59-1 end; local m=1; if m==1 then r[59]=f(unpackValues(r,60,59+n)); top=60 elseif m==0 then f(unpackValues(r,60,59+n)); top=59 else local result=packValues(f(unpackValues(r,60,59+n))); if m<0 then m=result.n end; for i=1,m do r[59+i-1]=result[i] end; top=59+m end end
            r[60]=(true)
            r[59] = r[59] == r[60]
            r[58]=r[59]
            block=1835
        elseif block == 1835 then
            r[59]=r[57]
            if not r[59] then block=1884 else block=1849 end
        elseif block == 1849 then
            r[61]=r[57]
            r[60] = r[61][("GetAttribute")]
            r[62]=("TackleDirection")
            do local f=r[60]; local n=2; if n<0 then n=top-60-1 end; local m=1; if m==1 then r[60]=f(unpackValues(r,61,60+n)); top=61 elseif m==0 then f(unpackValues(r,61,60+n)); top=60 else local result=packValues(f(unpackValues(r,61,60+n))); if m<0 then m=result.n end; for i=1,m do r[60+i-1]=result[i] end; top=60+m end end
            r[59]=r[60]
            block=1884
        elseif block == 1884 then
            r[60]=(957391)
            r[60]=r[33] == r[60]
            if not r[60] then block=1933 else block=1905 end
        elseif block == 1905 then
            r[10]=r[7] < r[23]
            r[10]=r[16] - r[18]
            r[16]=r[16] - r[13]
            r[0]=r[22] + r[11]
            block=1933
        elseif block == 1933 then
            r[61] = env[("typeof")]
            r[60]=r[61]
            r[61]=r[59]
            do local f=r[60]; local n=1; if n<0 then n=top-60-1 end; local m=1; if m==1 then r[60]=f(unpackValues(r,61,60+n)); top=61 elseif m==0 then f(unpackValues(r,61,60+n)); top=60 else local result=packValues(f(unpackValues(r,61,60+n))); if m<0 then m=result.n end; for i=1,m do r[60+i-1]=result[i] end; top=60+m end end
            if not (r[60] ~= ("Vector3")) then block=1996 else block=1968 end
        elseif block == 1968 then
            r[60] = env[("Vector3")]
            r[60] = r[60][("zero")]
            r[59]=r[60]
            block=1996
        elseif block == 1996 then
            r[61]=upvalues[3][7]
            r[60]=r[61]
            r[61]=r[59]
            do local f=r[60]; local n=1; if n<0 then n=top-60-1 end; local m=1; if m==1 then r[60]=f(unpackValues(r,61,60+n)); top=61 elseif m==0 then f(unpackValues(r,61,60+n)); top=60 else local result=packValues(f(unpackValues(r,61,60+n))); if m<0 then m=result.n end; for i=1,m do r[60+i-1]=result[i] end; top=60+m end end
            r[59]=r[60]
            r[60] = r[59][("Magnitude")]
            if not (r[60] < (0.05)) then block=2108 else block=2045 end
        elseif block == 2045 then
            r[60]=(1047649)
            r[60]=r[33] == r[60]
            if not r[60] then block=2087 else block=2066 end
        elseif block == 2066 then
            do local f=r[24]; local n=16; if n<0 then n=top-24-1 end; local m=7; if m==1 then r[24]=f(unpackValues(r,25,24+n)); top=25 elseif m==0 then f(unpackValues(r,25,24+n)); top=24 else local result=packValues(f(unpackValues(r,25,24+n))); if m<0 then m=result.n end; for i=1,m do r[24+i-1]=result[i] end; top=24+m end end
            r[7]=r[19] - r[11]
            r[3]=r[24] < r[7]
            block=2087
        elseif block == 2087 then
            r[60]=r[47]
            r[59]=r[60]
            block=2108
        elseif block == 2108 then
            r[60] = r[59][("Magnitude")]
            if not (r[60] < (0.05)) then block=2171 else block=2122 end
        elseif block == 2122 then
            r[61]=upvalues[3][7]
            r[60]=r[61]
            r[61] = r[43][("CFrame")]
            r[61] = r[61][("LookVector")]
            do local f=r[60]; local n=1; if n<0 then n=top-60-1 end; local m=1; if m==1 then r[60]=f(unpackValues(r,61,60+n)); top=61 elseif m==0 then f(unpackValues(r,61,60+n)); top=60 else local result=packValues(f(unpackValues(r,61,60+n))); if m<0 then m=result.n end; for i=1,m do r[60+i-1]=result[i] end; top=60+m end end
            r[59]=r[60]
            block=2171
        elseif block == 2171 then
            r[60] = r[59][("Magnitude")]
            if not (r[60] > (0.05)) then block=2255 else block=2185 end
        elseif block == 2185 then
            r[60]=(1049456)
            r[60]=r[33] == r[60]
            if not r[60] then block=2234 else block=2206 end
        elseif block == 2206 then
            r[17]=r[25] * r[1]
            r[24]=("Vector3")
            r[17][r[14]]=r[8]
            r[19][("threats")]=r[15]
            block=2234
        elseif block == 2234 then
            r[60] = r[59][("Unit")]
            r[59]=r[60]
            block=2255
        elseif block == 2255 then
            r[60]=(1039961)
            r[60]=r[33] == r[60]
            if not r[60] then block=2290 else block=2276 end
        elseif block == 2276 then
            r[22]=r[5] - r[10]
            r[9]=r[10] / r[8]
            block=2290
        elseif block == 2290 then
            if not r[58] then block=2353 else block=2297 end
        elseif block == 2297 then
            r[61] = env[("math")]
            r[61] = r[61][("min")]
            r[60]=r[61]
            r[61]=(1.8)
            r[62] = r[55] + (0.32)
            do local f=r[60]; local n=2; if n<0 then n=top-60-1 end; local m=1; if m==1 then r[60]=f(unpackValues(r,61,60+n)); top=61 elseif m==0 then f(unpackValues(r,61,60+n)); top=60 else local result=packValues(f(unpackValues(r,61,60+n))); if m<0 then m=result.n end; for i=1,m do r[60+i-1]=result[i] end; top=60+m end end
            r[55]=r[60]
            block=2353
        elseif block == 2353 then
            r[60]=(993294)
            r[60]=r[33] == r[60]
            if not r[60] then block=2402 else block=2374 end
        elseif block == 2374 then
            r[19]=r[9] .. r[15]
            r[11]=r[7] .. r[18]
            do local f=r[12]; local n=24; if n<0 then n=top-12-1 end; local m=17; if m==1 then r[12]=f(unpackValues(r,13,12+n)); top=13 elseif m==0 then f(unpackValues(r,13,12+n)); top=12 else local result=packValues(f(unpackValues(r,13,12+n))); if m<0 then m=result.n end; for i=1,m do r[12+i-1]=result[i] end; top=12+m end end
            r[18]=#r[15]
            block=2402
        elseif block == 2402 then
            r[60] = r[52] * r[55]
            r[60] = r[51] + r[60]
            r[61] = r[55] * (0.5)
            r[61] = r[61] * r[55]
            r[61] = r[50] * r[61]
            r[60] = r[60] + r[61]
            r[61]=(1049015)
            r[61]=r[33] == r[61]
            if not r[61] then block=2472 else block=2465 end
        elseif block == 2465 then
            r[14]=r[9][r[5]]
            block=2472
        elseif block == 2472 then
            r[61] = r[60][("Magnitude")]
            r[63] = env[("math")]
            r[63] = r[63][("max")]
            r[62]=r[63]
            r[63]=(8)
            r[66] = env[("tonumber")]
            r[65]=r[66]
            r[66]=upvalues[6][7]
            r[66] = r[66][("MinForward")]
            do local f=r[65]; local n=1; if n<0 then n=top-65-1 end; local m=1; if m==1 then r[65]=f(unpackValues(r,66,65+n)); top=66 elseif m==0 then f(unpackValues(r,66,65+n)); top=65 else local result=packValues(f(unpackValues(r,66,65+n))); if m<0 then m=result.n end; for i=1,m do r[65+i-1]=result[i] end; top=65+m end end
            r[64]=r[65]
            if r[64] then block=2570 else block=2556 end
        elseif block == 2556 then
            r[65]=(0)
            r[64]=r[65]
            block=2570
        elseif block == 2570 then
            do local f=r[62]; local n=2; if n<0 then n=top-62-1 end; local m=1; if m==1 then r[62]=f(unpackValues(r,63,62+n)); top=63 elseif m==0 then f(unpackValues(r,63,62+n)); top=62 else local result=packValues(f(unpackValues(r,63,62+n))); if m<0 then m=result.n end; for i=1,m do r[62+i-1]=result[i] end; top=62+m end end
            r[64] = env[("math")]
            r[64] = r[64][("max")]
            r[63]=r[64]
            r[64]=(0)
            r[67] = env[("tonumber")]
            r[66]=r[67]
            r[67]=upvalues[6][7]
            r[67] = r[67][("HandRadius")]
            do local f=r[66]; local n=1; if n<0 then n=top-66-1 end; local m=1; if m==1 then r[66]=f(unpackValues(r,67,66+n)); top=67 elseif m==0 then f(unpackValues(r,67,66+n)); top=66 else local result=packValues(f(unpackValues(r,67,66+n))); if m<0 then m=result.n end; for i=1,m do r[66+i-1]=result[i] end; top=66+m end end
            r[65]=r[66]
            if r[65] then block=2668 else block=2654 end
        elseif block == 2654 then
            r[66]=(0)
            r[65]=r[66]
            block=2668
        elseif block == 2668 then
            do local f=r[63]; local n=2; if n<0 then n=top-63-1 end; local m=1; if m==1 then r[63]=f(unpackValues(r,64,63+n)); top=64 elseif m==0 then f(unpackValues(r,64,63+n)); top=63 else local result=packValues(f(unpackValues(r,64,63+n))); if m<0 then m=result.n end; for i=1,m do r[63+i-1]=result[i] end; top=63+m end end
            r[62] = r[62] + r[63]
            r[64] = env[("math")]
            r[64] = r[64][("max")]
            r[63]=r[64]
            r[64]=(0)
            r[67] = env[("tonumber")]
            r[66]=r[67]
            r[67]=upvalues[6][7]
            r[67] = r[67][("ContactPadding")]
            do local f=r[66]; local n=1; if n<0 then n=top-66-1 end; local m=1; if m==1 then r[66]=f(unpackValues(r,67,66+n)); top=67 elseif m==0 then f(unpackValues(r,67,66+n)); top=66 else local result=packValues(f(unpackValues(r,67,66+n))); if m<0 then m=result.n end; for i=1,m do r[66+i-1]=result[i] end; top=66+m end end
            r[65]=r[66]
            if r[65] then block=2773 else block=2759 end
        elseif block == 2759 then
            r[66]=(0)
            r[65]=r[66]
            block=2773
        elseif block == 2773 then
            do local f=r[63]; local n=2; if n<0 then n=top-63-1 end; local m=1; if m==1 then r[63]=f(unpackValues(r,64,63+n)); top=64 elseif m==0 then f(unpackValues(r,64,63+n)); top=63 else local result=packValues(f(unpackValues(r,64,63+n))); if m<0 then m=result.n end; for i=1,m do r[63+i-1]=result[i] end; top=63+m end end
            r[62] = r[62] + r[63]
            r[64] = env[("math")]
            r[64] = r[64][("max")]
            r[63]=r[64]
            r[64]=(0)
            r[67] = env[("tonumber")]
            r[66]=r[67]
            r[67]=upvalues[6][7]
            r[67] = r[67][("RunnerRadius")]
            do local f=r[66]; local n=1; if n<0 then n=top-66-1 end; local m=1; if m==1 then r[66]=f(unpackValues(r,67,66+n)); top=67 elseif m==0 then f(unpackValues(r,67,66+n)); top=66 else local result=packValues(f(unpackValues(r,67,66+n))); if m<0 then m=result.n end; for i=1,m do r[66+i-1]=result[i] end; top=66+m end end
            r[65]=r[66]
            if r[65] then block=2878 else block=2864 end
        elseif block == 2864 then
            r[66]=(0)
            r[65]=r[66]
            block=2878
        elseif block == 2878 then
            do local f=r[63]; local n=2; if n<0 then n=top-63-1 end; local m=1; if m==1 then r[63]=f(unpackValues(r,64,63+n)); top=64 elseif m==0 then f(unpackValues(r,64,63+n)); top=63 else local result=packValues(f(unpackValues(r,64,63+n))); if m<0 then m=result.n end; for i=1,m do r[63+i-1]=result[i] end; top=63+m end end
            r[62] = r[62] + r[63]
            if not r[58] then block=3095 else block=2899 end
        elseif block == 2899 then
            r[63]=(1025848)
            r[63]=r[33] == r[63]
            if not r[63] then block=2948 else block=2920 end
        elseif block == 2920 then
            do local f=r[18]; local n=5; if n<0 then n=top-18-1 end; local m=25; if m==1 then r[18]=f(unpackValues(r,19,18+n)); top=19 elseif m==0 then f(unpackValues(r,19,18+n)); top=18 else local result=packValues(f(unpackValues(r,19,18+n))); if m<0 then m=result.n end; for i=1,m do r[18+i-1]=result[i] end; top=18+m end end
            r[18]=r[0] + r[9]
            r[17]=#r[3]
            r[10]=env[("table")]
            block=2948
        elseif block == 2948 then
            r[65] = env[("tonumber")]
            r[64]=r[65]
            r[66]=r[57]
            r[65] = r[66][("GetAttribute")]
            r[67]=("TackleReach")
            do local f=r[65]; local n=2; if n<0 then n=top-65-1 end; local m=-1; if m==1 then r[65]=f(unpackValues(r,66,65+n)); top=66 elseif m==0 then f(unpackValues(r,66,65+n)); top=65 else local result=packValues(f(unpackValues(r,66,65+n))); if m<0 then m=result.n end; for i=1,m do r[65+i-1]=result[i] end; top=65+m end end
            do local f=r[64]; local n=-1; if n<0 then n=top-64-1 end; local m=1; if m==1 then r[64]=f(unpackValues(r,65,64+n)); top=65 elseif m==0 then f(unpackValues(r,65,64+n)); top=64 else local result=packValues(f(unpackValues(r,65,64+n))); if m<0 then m=result.n end; for i=1,m do r[64+i-1]=result[i] end; top=64+m end end
            r[63]=r[64]
            if r[63] then block=3025 else block=3011 end
        elseif block == 3011 then
            r[64]=(0)
            r[63]=r[64]
            block=3025
        elseif block == 3025 then
            r[65] = env[("math")]
            r[65] = r[65][("min")]
            r[64]=r[65]
            r[65]=r[63]
            r[66]=(8)
            do local f=r[64]; local n=2; if n<0 then n=top-64-1 end; local m=1; if m==1 then r[64]=f(unpackValues(r,65,64+n)); top=65 elseif m==0 then f(unpackValues(r,65,64+n)); top=64 else local result=packValues(f(unpackValues(r,65,64+n))); if m<0 then m=result.n end; for i=1,m do r[64+i-1]=result[i] end; top=64+m end end
            r[64] = r[64] + (8)
            r[65] = r[62] + r[64]
            r[62]=r[65]
            block=3144
        elseif block == 3095 then
            r[63] = r[47][("Magnitude")]
            r[64] = r[36] * (0.8)
            if not (r[63] > r[64]) then block=3144 else block=3116 end
        elseif block == 3116 then
            r[63]=(2)
            r[64] = r[62] + r[63]
            r[62]=r[64]
            block=3144
        elseif block == 3144 then
            r[63]=(0)
            if not (r[46] > (0.05)) then block=3242 else block=3158 end
        elseif block == 3158 then
            r[65] = env[("math")]
            r[65] = r[65][("max")]
            r[64]=r[65]
            r[65]=(0)
            r[67]=r[47]
            r[66] = r[67][("Dot")]
            r[68] = r[45][("Unit")]
            r[68]=-r[68]
            do local f=r[66]; local n=2; if n<0 then n=top-66-1 end; local m=-1; if m==1 then r[66]=f(unpackValues(r,67,66+n)); top=67 elseif m==0 then f(unpackValues(r,67,66+n)); top=66 else local result=packValues(f(unpackValues(r,67,66+n))); if m<0 then m=result.n end; for i=1,m do r[66+i-1]=result[i] end; top=66+m end end
            do local f=r[64]; local n=-1; if n<0 then n=top-64-1 end; local m=1; if m==1 then r[64]=f(unpackValues(r,65,64+n)); top=65 elseif m==0 then f(unpackValues(r,65,64+n)); top=64 else local result=packValues(f(unpackValues(r,65,64+n))); if m<0 then m=result.n end; for i=1,m do r[64+i-1]=result[i] end; top=64+m end end
            r[63]=r[64]
            block=3242
        elseif block == 3242 then
            r[64] = env[("math")]
            r[64] = r[64][("huge")]
            if not (r[63] > (0.5)) then block=3375 else block=3263 end
        elseif block == 3263 then
            r[65]=(955353)
            r[65]=r[33] == r[65]
            if not r[65] then block=3312 else block=3284 end
        elseif block == 3284 then
            r[12]=r[18] < r[25]
            do local f=r[5]; local n=1; if n<0 then n=top-5-1 end; local m=25; if m==1 then r[5]=f(unpackValues(r,6,5+n)); top=6 elseif m==0 then f(unpackValues(r,6,5+n)); top=5 else local result=packValues(f(unpackValues(r,6,5+n))); if m<0 then m=result.n end; for i=1,m do r[5+i-1]=result[i] end; top=5+m end end
            r[19]=r[9] .. r[25]
            r[14]=r[21]
            block=3312
        elseif block == 3312 then
            r[66] = env[("math")]
            r[66] = r[66][("max")]
            r[65]=r[66]
            r[66]=(0)
            r[67] = r[46] - r[62]
            r[67] = r[67] / r[63]
            do local f=r[65]; local n=2; if n<0 then n=top-65-1 end; local m=1; if m==1 then r[65]=f(unpackValues(r,66,65+n)); top=66 elseif m==0 then f(unpackValues(r,66,65+n)); top=65 else local result=packValues(f(unpackValues(r,66,65+n))); if m<0 then m=result.n end; for i=1,m do r[65+i-1]=result[i] end; top=65+m end end
            r[64]=r[65]
            block=3403
        elseif block == 3375 then
            if not (r[46] <= r[62]) then block=3403 else block=3382 end
        elseif block == 3382 then
            r[65]=(0)
            r[64]=r[65]
            block=3403
        elseif block == 3403 then
            r[66] = env[("math")]
            r[66] = r[66][("min")]
            r[65]=r[66]
            r[66]=r[54]
            r[67]=r[55]
            do local f=r[65]; local n=2; if n<0 then n=top-65-1 end; local m=1; if m==1 then r[65]=f(unpackValues(r,66,65+n)); top=66 elseif m==0 then f(unpackValues(r,66,65+n)); top=65 else local result=packValues(f(unpackValues(r,66,65+n))); if m<0 then m=result.n end; for i=1,m do r[65+i-1]=result[i] end; top=65+m end end
            r[66]=(1029211)
            r[66]=r[33] == r[66]
            if not r[66] then block=3480 else block=3466 end
        elseif block == 3466 then
            r[3]=r[8] - r[9]
            r[17]=#r[14]
            block=3480
        elseif block == 3480 then
            if not (r[64] < r[65]) then block=3508 else block=3487 end
        elseif block == 3487 then
            r[66]=r[64]
            r[65]=r[66]
            block=3508
        elseif block == 3508 then
            r[66] = r[47] * r[65]
            r[66] = r[44] + r[66]
            r[67] = r[65] * (0.5)
            r[67] = r[67] * r[65]
            r[67] = r[50] * r[67]
            r[66] = r[66] + r[67]
            r[67] = r[35] * r[65]
            r[67] = r[32] + r[67]
            r[69]=upvalues[3][7]
            r[68]=r[69]
            r[69] = r[66] - r[67]
            do local f=r[68]; local n=1; if n<0 then n=top-68-1 end; local m=1; if m==1 then r[68]=f(unpackValues(r,69,68+n)); top=69 elseif m==0 then f(unpackValues(r,69,68+n)); top=68 else local result=packValues(f(unpackValues(r,69,68+n))); if m<0 then m=result.n end; for i=1,m do r[68+i-1]=result[i] end; top=68+m end end
            r[68] = r[68][("Magnitude")]
            r[69] = r[47] * r[55]
            r[69] = r[44] + r[69]
            r[70] = r[55] * (0.5)
            r[70] = r[70] * r[55]
            r[70] = r[50] * r[70]
            r[69] = r[69] + r[70]
            r[70]=(1001951)
            r[70]=r[33] == r[70]
            if not r[70] then block=3690 else block=3662 end
        elseif block == 3662 then
            r[14]=r[6] < r[17]
            r[12]=r[16] .. r[1]
            r[22]=r[22] == r[12]
            r[13]=r[5][r[12]]
            block=3690
        elseif block == 3690 then
            r[70]=r[58]
            if not r[70] then block=3725 else block=3704 end
        elseif block == 3704 then
            r[71] = r[59][("Magnitude")]
            r[71] = r[71] > (0.05)
            r[70]=r[71]
            block=3725
        elseif block == 3725 then
            if not r[70] then block=4467 else block=3732 end
        elseif block == 3732 then
            r[72] = env[("tonumber")]
            r[71]=r[72]
            r[73]=r[57]
            r[72] = r[73][("GetAttribute")]
            r[74]=("TackleDuration")
            do local f=r[72]; local n=2; if n<0 then n=top-72-1 end; local m=-1; if m==1 then r[72]=f(unpackValues(r,73,72+n)); top=73 elseif m==0 then f(unpackValues(r,73,72+n)); top=72 else local result=packValues(f(unpackValues(r,73,72+n))); if m<0 then m=result.n end; for i=1,m do r[72+i-1]=result[i] end; top=72+m end end
            do local f=r[71]; local n=-1; if n<0 then n=top-71-1 end; local m=1; if m==1 then r[71]=f(unpackValues(r,72,71+n)); top=72 elseif m==0 then f(unpackValues(r,72,71+n)); top=71 else local result=packValues(f(unpackValues(r,72,71+n))); if m<0 then m=result.n end; for i=1,m do r[71+i-1]=result[i] end; top=71+m end end
            r[70]=r[71]
            if r[70] then block=3809 else block=3795 end
        elseif block == 3795 then
            r[71]=(0.45)
            r[70]=r[71]
            block=3809
        elseif block == 3809 then
            r[73] = env[("tonumber")]
            r[72]=r[73]
            r[74]=r[57]
            r[73] = r[74][("GetAttribute")]
            r[75]=("TackleStartedAt")
            do local f=r[73]; local n=2; if n<0 then n=top-73-1 end; local m=-1; if m==1 then r[73]=f(unpackValues(r,74,73+n)); top=74 elseif m==0 then f(unpackValues(r,74,73+n)); top=73 else local result=packValues(f(unpackValues(r,74,73+n))); if m<0 then m=result.n end; for i=1,m do r[73+i-1]=result[i] end; top=73+m end end
            do local f=r[72]; local n=-1; if n<0 then n=top-72-1 end; local m=1; if m==1 then r[72]=f(unpackValues(r,73,72+n)); top=73 elseif m==0 then f(unpackValues(r,73,72+n)); top=72 else local result=packValues(f(unpackValues(r,73,72+n))); if m<0 then m=result.n end; for i=1,m do r[72+i-1]=result[i] end; top=72+m end end
            r[71]=r[72]
            if r[71] then block=3886 else block=3872 end
        elseif block == 3872 then
            r[72]=(0)
            r[71]=r[72]
            block=3886
        elseif block == 3886 then
            r[74]=r[37][7]
            r[74] = r[74] > (0)
            r[73]=r[74]
            if not r[73] then block=3970 else block=3914 end
        elseif block == 3914 then
            r[75] = env[("math")]
            r[75] = r[75][("max")]
            r[74]=r[75]
            r[75]=(0)
            r[76]=r[37][7]
            r[76] = r[76] - r[71]
            do local f=r[74]; local n=2; if n<0 then n=top-74-1 end; local m=1; if m==1 then r[74]=f(unpackValues(r,75,74+n)); top=75 elseif m==0 then f(unpackValues(r,75,74+n)); top=74 else local result=packValues(f(unpackValues(r,75,74+n))); if m<0 then m=result.n end; for i=1,m do r[74+i-1]=result[i] end; top=74+m end end
            r[73]=r[74]
            block=3970
        elseif block == 3970 then
            r[72]=r[73]
            if r[72] then block=3998 else block=3984 end
        elseif block == 3984 then
            r[73]=(0)
            r[72]=r[73]
            block=3998
        elseif block == 3998 then
            r[74] = env[("math")]
            r[74] = r[74][("clamp")]
            r[73]=r[74]
            r[74] = r[70] - r[72]
            r[75]=(0)
            r[76]=r[55]
            do local f=r[73]; local n=3; if n<0 then n=top-73-1 end; local m=1; if m==1 then r[73]=f(unpackValues(r,74,73+n)); top=74 elseif m==0 then f(unpackValues(r,74,73+n)); top=73 else local result=packValues(f(unpackValues(r,74,73+n))); if m<0 then m=result.n end; for i=1,m do r[73+i-1]=result[i] end; top=73+m end end
            r[74]=(1008931)
            r[74]=r[33] == r[74]
            if not r[74] then block=4089 else block=4068 end
        elseif block == 4068 then
            r[4]=r[8] - r[11]
            r[9]=r[13] - r[22]
            r[0]=r[23] * r[6]
            block=4089
        elseif block == 4089 then
            r[75] = env[("math")]
            r[75] = r[75][("max")]
            r[74]=r[75]
            r[75] = r[47][("Magnitude")]
            r[76] = r[36] * (2.2)
            do local f=r[74]; local n=2; if n<0 then n=top-74-1 end; local m=1; if m==1 then r[74]=f(unpackValues(r,75,74+n)); top=75 elseif m==0 then f(unpackValues(r,75,74+n)); top=74 else local result=packValues(f(unpackValues(r,75,74+n))); if m<0 then m=result.n end; for i=1,m do r[74+i-1]=result[i] end; top=74+m end end
            r[76] = env[("math")]
            r[76] = r[76][("min")]
            r[75]=r[76]
            r[76] = r[74] * r[73]
            r[77] = r[62] + (18)
            do local f=r[75]; local n=2; if n<0 then n=top-75-1 end; local m=1; if m==1 then r[75]=f(unpackValues(r,76,75+n)); top=76 elseif m==0 then f(unpackValues(r,76,75+n)); top=75 else local result=packValues(f(unpackValues(r,76,75+n))); if m<0 then m=result.n end; for i=1,m do r[75+i-1]=result[i] end; top=75+m end end
            r[76] = r[59] * r[75]
            r[76] = r[44] + r[76]
            r[69]=r[76]
            r[76]=(1022691)
            r[76]=r[33] == r[76]
            if not r[76] then block=4243 else block=4215 end
        elseif block == 4215 then
            r[6]=r[11] + r[2]
            r[5]=r[25][r[7]]
            r[20]=r[12] - r[22]
            r[18]=r[13] - r[23]
            block=4243
        elseif block == 4243 then
            r[77] = env[("math")]
            r[77] = r[77][("min")]
            r[76]=r[77]
            r[77]=r[65]
            r[78]=r[73]
            do local f=r[76]; local n=2; if n<0 then n=top-76-1 end; local m=1; if m==1 then r[76]=f(unpackValues(r,77,76+n)); top=77 elseif m==0 then f(unpackValues(r,77,76+n)); top=76 else local result=packValues(f(unpackValues(r,77,76+n))); if m<0 then m=result.n end; for i=1,m do r[76+i-1]=result[i] end; top=76+m end end
            r[77]=(1024815)
            r[77]=r[33] == r[77]
            if not r[77] then block=4320 else block=4306 end
        elseif block == 4306 then
            r[23]=r[1] - r[15]
            r[4]=r[15][(1)]
            block=4320
        elseif block == 4320 then
            r[78] = env[("math")]
            r[78] = r[78][("min")]
            r[77]=r[78]
            r[78] = r[74] * r[76]
            r[79] = r[62] + (18)
            do local f=r[77]; local n=2; if n<0 then n=top-77-1 end; local m=1; if m==1 then r[77]=f(unpackValues(r,78,77+n)); top=78 elseif m==0 then f(unpackValues(r,78,77+n)); top=77 else local result=packValues(f(unpackValues(r,78,77+n))); if m<0 then m=result.n end; for i=1,m do r[77+i-1]=result[i] end; top=77+m end end
            r[77] = r[59] * r[77]
            r[77] = r[44] + r[77]
            r[66]=r[77]
            r[77]=(997006)
            r[77]=r[33] == r[77]
            if not r[77] then block=4418 else block=4404 end
        elseif block == 4404 then
            r[8]=r[23] + r[21]
            r[18]=r[9] == r[21]
            block=4418
        elseif block == 4418 then
            r[78]=upvalues[3][7]
            r[77]=r[78]
            r[78] = r[66] - r[67]
            do local f=r[77]; local n=1; if n<0 then n=top-77-1 end; local m=1; if m==1 then r[77]=f(unpackValues(r,78,77+n)); top=78 elseif m==0 then f(unpackValues(r,78,77+n)); top=77 else local result=packValues(f(unpackValues(r,78,77+n))); if m<0 then m=result.n end; for i=1,m do r[77+i-1]=result[i] end; top=77+m end end
            r[77] = r[77][("Magnitude")]
            r[68]=r[77]
            block=4467
        elseif block == 4467 then
            r[72] = env[("math")]
            r[72] = r[72][("min")]
            r[71]=r[72]
            r[72] = r[55] + (0.04)
            r[73]=(0.72)
            do local f=r[71]; local n=2; if n<0 then n=top-71-1 end; local m=1; if m==1 then r[71]=f(unpackValues(r,72,71+n)); top=72 elseif m==0 then f(unpackValues(r,72,71+n)); top=71 else local result=packValues(f(unpackValues(r,72,71+n))); if m<0 then m=result.n end; for i=1,m do r[71+i-1]=result[i] end; top=71+m end end
            r[71] = r[64] <= r[71]
            r[70]=r[71]
            if r[70] then block=4607 else block=4530 end
        elseif block == 4530 then
            r[72] = r[62] * (1.35)
            r[72] = r[68] <= r[72]
            r[71]=r[72]
            if r[71] then block=4600 else block=4558 end
        elseif block == 4558 then
            r[72]=r[58]
            if not r[72] then block=4593 else block=4572 end
        elseif block == 4572 then
            r[73] = r[62] * (2.15)
            r[73] = r[68] <= r[73]
            r[72]=r[73]
            block=4593
        elseif block == 4593 then
            r[71]=r[72]
            block=4600
        elseif block == 4600 then
            r[70]=r[71]
            block=4607
        elseif block == 4607 then
            r[71]=(992432)
            r[71]=r[33] == r[71]
            if not r[71] then block=4656 else block=4628 end
        elseif block == 4628 then
            r[16][("table")]=r[25]
            r[24]=r[13][r[21]]
            r[14][(995567)]=r[6]
            r[16]=r[24] < r[8]
            block=4656
        elseif block == 4656 then
            r[73] = env[("math")]
            r[73] = r[73][("max")]
            r[72]=r[73]
            r[73]=(6.5)
            r[74] = r[36] * (0.34)
            do local f=r[72]; local n=2; if n<0 then n=top-72-1 end; local m=1; if m==1 then r[72]=f(unpackValues(r,73,72+n)); top=73 elseif m==0 then f(unpackValues(r,73,72+n)); top=72 else local result=packValues(f(unpackValues(r,73,72+n))); if m<0 then m=result.n end; for i=1,m do r[72+i-1]=result[i] end; top=72+m end end
            r[72] = r[63] >= r[72]
            r[71]=r[72]
            if not r[71] then block=4733 else block=4719 end
        elseif block == 4719 then
            r[72] = r[46] <= (50)
            r[71]=r[72]
            block=4733
        elseif block == 4733 then
            r[72]={}
            r[72][("player")]=r[42]
            r[72][("root")]=r[43]
            r[72][("position")]=r[44]
            r[72][("velocity")]=r[47]
            r[72][("acceleration")]=r[50]
            r[72][("distance")]=r[46]
            r[72][("closing")]=r[63]
            r[72][("predicted")]=r[69]
            r[72][("intercept")]=r[66]
            r[72][("interceptRunner")]=r[67]
            r[74] = env[("math")]
            r[74] = r[74][("max")]
            r[73]=r[74]
            r[74]=(0)
            r[75]=r[65]
            do local f=r[73]; local n=2; if n<0 then n=top-73-1 end; local m=1; if m==1 then r[73]=f(unpackValues(r,74,73+n)); top=74 elseif m==0 then f(unpackValues(r,74,73+n)); top=73 else local result=packValues(f(unpackValues(r,74,73+n))); if m<0 then m=result.n end; for i=1,m do r[73+i-1]=result[i] end; top=73+m end end
            r[72][("interceptTime")]=r[73]
            r[72][("interceptGap")]=r[68]
            r[72][("danger")]=r[62]
            r[72][("tackle")]=r[58]
            r[72][("collisionRisk")]=r[70]
            r[72][("preTackle")]=r[71]
            r[72][("timeToDanger")]=r[64]
            r[73]=upvalues[1][7]
            r[73] = r[73][("threats")]
            r[74]=upvalues[1][7]
            r[74] = r[74][("threats")]
            r[74]=#r[74]
            r[74] = r[74] + (1)
            r[73][r[74]]=r[72]
            block=4957
        elseif block == 4957 then
            block=4964
        elseif block == 4964 then
            r[41], r[42]=r[38](r[39],r[40])
            if r[41]~=nil then r[40]=r[41]; block=575 else block=4978 end
        elseif block == 4978 then
            r[39] = env[("table")]
            r[39] = r[39][("sort")]
            r[38]=r[39]
            r[39]=upvalues[1][7]
            r[39] = r[39][("threats")]
            do local captures = {}
            r[40]=function(...) return functions[63](captures, ...) end
            end
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39] = env[("pairs")]
            r[38]=r[39]
            r[39]=upvalues[1][7]
            r[39] = r[39][("threatHistory")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=3; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=5244
        elseif block == 5069 then
            r[43]=(967660)
            r[43]=r[33] == r[43]
            if not r[43] then block=5104 else block=5090 end
        elseif block == 5090 then
            r[11]=r[24] - r[7]
            r[8]=r[2] - r[6]
            block=5104
        elseif block == 5104 then
            r[44] = r[41][("Parent")]
            r[44]=not r[44]
            r[43]=r[44]
            if r[43] then block=5160 else block=5132 end
        elseif block == 5132 then
            r[44] = r[42][("time")]
            r[44] = r[31] - r[44]
            r[44] = r[44] > (1.2)
            r[43]=r[44]
            block=5160
        elseif block == 5160 then
            if not r[43] then block=5244 else block=5167 end
        elseif block == 5167 then
            r[43]=(1023664)
            r[43]=r[33] == r[43]
            if not r[43] then block=5209 else block=5188 end
        elseif block == 5188 then
            r[16]=r[0] / r[11]
            r[16]=r[13] < r[20]
            r[6]=r[18] .. r[9]
            block=5209
        elseif block == 5209 then
            r[43]=nil
            r[44]=upvalues[1][7]
            r[44] = r[44][("threatHistory")]
            r[44][r[41]]=r[43]
            block=5244
        elseif block == 5244 then
            r[41], r[42]=r[38](r[39],r[40])
            if r[41]~=nil then r[40]=r[41]; block=5069 else block=5258 end
        elseif block == 5258 then
            r[38]=(965714)
            r[38]=r[33] == r[38]
            if not r[38] then block=5300 else block=5279 end
        elseif block == 5279 then
            r[21]=r[12] .. r[9]
            do local f=r[19]; local n=0; if n<0 then n=top-19-1 end; local m=5; if m==1 then r[19]=f(unpackValues(r,20,19+n)); top=20 elseif m==0 then f(unpackValues(r,20,19+n)); top=19 else local result=packValues(f(unpackValues(r,20,19+n))); if m<0 then m=result.n end; for i=1,m do r[19+i-1]=result[i] end; top=19+m end end
            r[3]=(1048356)
            block=5300
        elseif block == 5300 then
            r[38]=upvalues[1][7]
            r[38] = r[38][("threats")]
            return r[38]
        elseif block == 5321 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[62] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(601271)
            r[34] = env[("workspace")]
            r[33]=r[34]
            r[32] = r[33][("GetServerTimeNow")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            upvalues[1][7]=r[32]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[63] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(227339)
            r[34]=(247311)
            r[34]=r[33] == r[34]
            if not r[34] then block=43 else block=29 end
        elseif block == 29 then
            r[0]=r[6][("timeToDanger")]
            r[16]=(nil)
            block=43
        elseif block == 43 then
            r[34] = r[31][("collisionRisk")]
            r[35] = r[32][("collisionRisk")]
            if not (r[34] ~= r[35]) then block=85 else block=64 end
        elseif block == 64 then
            r[34] = r[31][("collisionRisk")]
            return r[34]
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[34]=(285189)
            r[34]=r[33] == r[34]
            if not r[34] then block=134 else block=106 end
        elseif block == 106 then
            r[0]=r[6] == r[16]
            r[22]=#r[10]
            r[7][r[8]]=r[11]
            r[19]=r[13] - r[17]
            block=134
        elseif block == 134 then
            r[34] = r[31][("timeToDanger")]
            r[35] = r[32][("timeToDanger")]
            if not (r[34] ~= r[35]) then block=225 else block=155 end
        elseif block == 155 then
            r[34]=(227547)
            r[34]=r[33] == r[34]
            if not r[34] then block=190 else block=176 end
        elseif block == 176 then
            r[8]=r[18] < r[17]
            r[3]=r[15]
            block=190
        elseif block == 190 then
            r[34] = r[31][("timeToDanger")]
            r[35] = r[32][("timeToDanger")]
            r[34] = r[34] < r[35]
            return r[34]
        elseif block == 218 then
            block=225
        elseif block == 225 then
            r[34] = r[31][("tackle")]
            r[35] = r[32][("tackle")]
            if not (r[34] ~= r[35]) then block=302 else block=246 end
        elseif block == 246 then
            r[34]=(295731)
            r[34]=r[33] == r[34]
            if not r[34] then block=281 else block=267 end
        elseif block == 267 then
            r[10]=#r[8]
            r[8]=r[6]
            block=281
        elseif block == 281 then
            r[34] = r[31][("tackle")]
            return r[34]
        elseif block == 295 then
            block=302
        elseif block == 302 then
            r[34] = r[31][("interceptGap")]
            r[35] = r[32][("interceptGap")]
            if not (r[34] ~= r[35]) then block=400 else block=323 end
        elseif block == 323 then
            r[34]=(236421)
            r[34]=r[33] == r[34]
            if not r[34] then block=365 else block=344 end
        elseif block == 344 then
            r[12]=r[6][r[20]]
            r[15]=env[(nil)]
            r[1]=r[5][(285189)]
            block=365
        elseif block == 365 then
            r[34] = r[31][("interceptGap")]
            r[35] = r[32][("interceptGap")]
            r[34] = r[34] < r[35]
            return r[34]
        elseif block == 393 then
            block=400
        elseif block == 400 then
            r[34] = r[31][("distance")]
            r[35] = r[32][("distance")]
            r[34] = r[34] < r[35]
            return r[34]
        elseif block == 428 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[64] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(476965)
            r[35] = env[("math")]
            r[35] = r[35][("rad")]
            r[34]=r[35]
            r[35]=r[32]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36] = env[("math")]
            r[36] = r[36][("cos")]
            r[35]=r[36]
            r[36]=r[34]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37] = env[("math")]
            r[37] = r[37][("sin")]
            r[36]=r[37]
            r[37]=r[34]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = env[("Vector3")]
            r[38] = r[38][("new")]
            r[37]=r[38]
            r[38] = r[31][("X")]
            r[38] = r[38] * r[35]
            r[39] = r[31][("Z")]
            r[39] = r[39] * r[36]
            r[38] = r[38] - r[39]
            r[39]=(0)
            r[40] = r[31][("X")]
            r[40] = r[40] * r[36]
            r[41] = r[31][("Z")]
            r[41] = r[41] * r[35]
            r[40] = r[40] + r[41]
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=-1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            return unpackValues(r, 37, top-1)
        elseif block == 225 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[65] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(498330)
            r[35] = r[32][("Magnitude")]
            if not (r[35] < (0.05)) then block=57 else block=22 end
        elseif block == 22 then
            r[35] = env[("math")]
            r[35] = r[35][("huge")]
            r[35]=-r[35]
            return r[35]
        elseif block == 50 then
            block=57
        elseif block == 57 then
            r[35]=(592713)
            r[35]=r[34] == r[35]
            if not r[35] then block=85 else block=78 end
        elseif block == 78 then
            r[22]=#r[15]
            block=85
        elseif block == 85 then
            r[35] = r[32][("Unit")]
            r[36]=(590259)
            r[36]=r[34] == r[36]
            if not r[36] then block=127 else block=113 end
        elseif block == 113 then
            r[2][("tackle")]=r[22]
            r[4]=("Unit")
            block=127
        elseif block == 127 then
            r[37] = env[("math")]
            r[37] = r[37][("max")]
            r[36]=r[37]
            r[38]=upvalues[1][7]
            r[37]=r[38]
            do local f=r[37]; local n=0; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=(1)
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37] = env[("math")]
            r[37] = r[37][("huge")]
            r[39] = env[("ipairs")]
            r[38]=r[39]
            r[39]={}
            r[40]=(0.1)
            r[39][(1)]=r[40]
            r[40]=(0.22)
            r[39][(2)]=r[40]
            r[40]=(0.36)
            r[39][(3)]=r[40]
            r[40]=(0.52)
            r[39][(4)]=r[40]
            r[40]=(0.7)
            r[39][(5)]=r[40]
            r[40]=(0.9)
            r[39][(6)]=r[40]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=3; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=1023
        elseif block == 316 then
            r[43] = r[35] * r[36]
            r[43] = r[43] * r[42]
            r[43] = r[31] + r[43]
            r[45] = env[("ipairs")]
            r[44]=r[45]
            r[45]=r[33]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=3; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            block=1009
        elseif block == 372 then
            r[49]=nil
            r[51] = r[48][("tackle")]
            r[50]=r[51]
            if not r[50] then block=463 else block=400 end
        elseif block == 400 then
            r[52]=upvalues[2][7]
            r[51]=r[52]
            r[52] = r[48][("intercept")]
            r[53] = r[48][("position")]
            r[52] = r[52] - r[53]
            do local f=r[51]; local n=1; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[51] = r[51][("Magnitude")]
            r[51] = r[51] > (0.05)
            r[50]=r[51]
            block=463
        elseif block == 463 then
            if not r[50] then block=827 else block=470 end
        elseif block == 470 then
            r[50]=(541734)
            r[50]=r[34] == r[50]
            if not r[50] then block=519 else block=491 end
        elseif block == 491 then
            r[0]=r[22] == r[7]
            r[9]=r[24] / r[13]
            r[2][r[10]]=r[1]
            r[12]=r[0][r[17]]
            block=519
        elseif block == 519 then
            r[51]=upvalues[2][7]
            r[50]=r[51]
            r[51] = r[48][("intercept")]
            r[52] = r[48][("position")]
            r[51] = r[51] - r[52]
            do local f=r[50]; local n=1; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[50] = r[50][("Unit")]
            r[52] = env[("math")]
            r[52] = r[52][("min")]
            r[51]=r[52]
            r[52]=r[42]
            r[54] = env[("math")]
            r[54] = r[54][("max")]
            r[53]=r[54]
            r[54] = r[48][("interceptTime")]
            r[55]=(0.12)
            do local f=r[53]; local n=2; if n<0 then n=top-53-1 end; local m=-1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            do local f=r[51]; local n=-1; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[53] = env[("math")]
            r[53] = r[53][("max")]
            r[52]=r[53]
            r[53] = r[48][("velocity")]
            r[53] = r[53][("Magnitude")]
            r[54] = r[36] * (2.2)
            do local f=r[52]; local n=2; if n<0 then n=top-52-1 end; local m=1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            r[53]=(555392)
            r[53]=r[34] == r[53]
            if not r[53] then block=743 else block=715 end
        elseif block == 715 then
            r[10]=#r[8]
            r[20]=(0.1)
            r[22]=r[5] / r[13]
            r[25]=(nil)
            block=743
        elseif block == 743 then
            r[53] = r[48][("position")]
            r[55] = env[("math")]
            r[55] = r[55][("min")]
            r[54]=r[55]
            r[55] = r[52] * r[51]
            r[56] = r[48][("danger")]
            r[56] = r[56] + (18)
            do local f=r[54]; local n=2; if n<0 then n=top-54-1 end; local m=1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            r[54] = r[50] * r[54]
            r[53] = r[53] + r[54]
            r[49]=r[53]
            block=932
        elseif block == 827 then
            r[50]=(596401)
            r[50]=r[34] == r[50]
            if not r[50] then block=862 else block=848 end
        elseif block == 848 then
            r[0]=r[24] - r[0]
            r[17]=r[12] / r[2]
            block=862
        elseif block == 862 then
            r[50] = r[48][("position")]
            r[51] = r[48][("velocity")]
            r[51] = r[51] * r[42]
            r[50] = r[50] + r[51]
            r[51] = r[48][("acceleration")]
            r[52] = r[42] * (0.5)
            r[52] = r[52] * r[42]
            r[51] = r[51] * r[52]
            r[50] = r[50] + r[51]
            r[49]=r[50]
            block=932
        elseif block == 932 then
            r[51]=upvalues[2][7]
            r[50]=r[51]
            r[51] = r[43] - r[49]
            do local f=r[50]; local n=1; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[50] = r[50][("Magnitude")]
            r[51] = r[48][("danger")]
            r[50] = r[50] - r[51]
            if not (r[50] < r[37]) then block=1009 else block=988 end
        elseif block == 988 then
            r[51]=r[50]
            r[37]=r[51]
            block=1009
        elseif block == 1009 then
            r[47], r[48]=r[44](r[45],r[46])
            if r[47]~=nil then r[46]=r[47]; block=372 else block=1023 end
        elseif block == 1023 then
            r[41], r[42]=r[38](r[39],r[40])
            if r[41]~=nil then r[40]=r[41]; block=316 else block=1037 end
        elseif block == 1037 then
            return r[37]
        elseif block == 1044 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[66] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(636933)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[35]=r[32]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[32]=r[34]
            r[34] = r[32][("Magnitude")]
            if not (r[34] < (0.05)) then block=71 else block=57 end
        elseif block == 57 then
            return unpackValues(r, 0, -1)
        elseif block == 64 then
            block=71
        elseif block == 71 then
            r[34]=(666171)
            r[34]=r[33] == r[34]
            if not r[34] then block=99 else block=92 end
        elseif block == 92 then
            r[15]=r[0] / r[24]
            block=99
        elseif block == 99 then
            r[34] = r[32][("Unit")]
            r[32]=r[34]
            r[35] = env[("ipairs")]
            r[34]=r[35]
            r[35]=r[31]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=3; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            block=260
        elseif block == 148 then
            r[39]=(640642)
            r[39]=r[33] == r[39]
            if not r[39] then block=183 else block=169 end
        elseif block == 169 then
            do local f=r[8]; local n=24; if n<0 then n=top-8-1 end; local m=13; if m==1 then r[8]=f(unpackValues(r,9,8+n)); top=9 elseif m==0 then f(unpackValues(r,9,8+n)); top=8 else local result=packValues(f(unpackValues(r,9,8+n))); if m<0 then m=result.n end; for i=1,m do r[8+i-1]=result[i] end; top=8+m end end
            r[12]=r[8] == r[24]
            block=183
        elseif block == 183 then
            r[40]=r[38]
            r[39] = r[40][("Dot")]
            r[41]=r[32]
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            if not (r[39] > (0.985)) then block=260 else block=218 end
        elseif block == 218 then
            r[39]=(679028)
            r[39]=r[33] == r[39]
            if not r[39] then block=246 else block=239 end
        elseif block == 239 then
            r[20]=env[(nil)]
            block=246
        elseif block == 246 then
            return unpackValues(r, 0, -1)
        elseif block == 253 then
            block=260
        elseif block == 260 then
            r[37], r[38]=r[34](r[35],r[36])
            if r[37]~=nil then r[36]=r[37]; block=148 else block=274 end
        elseif block == 274 then
            r[34]=r[32]
            r[35]=#r[31]
            r[35] = r[35] + (1)
            r[31][r[35]]=r[34]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[67] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(859782)
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36] = r[32] - r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36]=(893393)
            r[36]=r[34] == r[36]
            if not r[36] then block=85 else block=57 end
        elseif block == 57 then
            r[18]=r[21] .. r[16]
            r[18]=r[12] / r[9]
            r[20]=r[18] * r[1]
            r[15]=r[22] - r[0]
            block=85
        elseif block == 85 then
            r[36] = r[35][("Magnitude")]
            if not (r[36] < (0.05)) then block=127 else block=99 end
        elseif block == 99 then
            r[36] = env[("Vector3")]
            r[36] = r[36][("zero")]
            return r[36]
        elseif block == 120 then
            block=127
        elseif block == 127 then
            r[36]=(885571)
            r[36]=r[34] == r[36]
            if not r[36] then block=176 else block=148 end
        elseif block == 148 then
            r[20]=r[0][("ipairs")]
            r[11]=r[22] .. r[20]
            r[11]=env[(0)]
            r[3]=r[8]
            block=176
        elseif block == 176 then
            r[36] = r[35][("Unit")]
            r[35]=r[36]
            r[36]=(865864)
            r[36]=r[34] == r[36]
            if not r[36] then block=232 else block=211 end
        elseif block == 211 then
            do local f=r[10]; local n=4; if n<0 then n=top-10-1 end; local m=24; if m==1 then r[10]=f(unpackValues(r,11,10+n)); top=11 elseif m==0 then f(unpackValues(r,11,10+n)); top=10 else local result=packValues(f(unpackValues(r,11,10+n))); if m<0 then m=result.n end; for i=1,m do r[10+i-1]=result[i] end; top=10+m end end
            do local f=r[11]; local n=9; if n<0 then n=top-11-1 end; local m=25; if m==1 then r[11]=f(unpackValues(r,12,11+n)); top=12 elseif m==0 then f(unpackValues(r,12,11+n)); top=11 else local result=packValues(f(unpackValues(r,12,11+n))); if m<0 then m=result.n end; for i=1,m do r[11+i-1]=result[i] end; top=11+m end end
            r[6]=r[23] .. r[16]
            block=232
        elseif block == 232 then
            r[37]=upvalues[2][7]
            r[37] = r[37][("avoidCatchers")]
            r[37]=not r[37]
            r[36]=r[37]
            if r[36] then block=288 else block=267 end
        elseif block == 267 then
            r[37]=#r[33]
            r[37] = r[37] == (0)
            r[36]=r[37]
            block=288
        elseif block == 288 then
            if not r[36] then block=309 else block=295 end
        elseif block == 295 then
            return r[35]
        elseif block == 302 then
            block=309
        elseif block == 309 then
            r[36]=(946755)
            r[36]=r[34] == r[36]
            if not r[36] then block=337 else block=330 end
        elseif block == 330 then
            r[12]=r[7][(3)]
            block=337
        elseif block == 337 then
            r[36]={}
            r[38]=upvalues[3][7]
            r[37]=r[38]
            r[38]=r[36]
            r[39]=r[35]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=(920598)
            r[37]=r[34] == r[37]
            if not r[37] then block=428 else block=400 end
        elseif block == 400 then
            r[15]=r[10][r[8]]
            r[16]=r[7] * r[2]
            r[19]=r[7][r[13]]
            r[25]=r[8]
            block=428
        elseif block == 428 then
            r[38] = env[("ipairs")]
            r[37]=r[38]
            r[38]={}
            r[39]=(10)
            r[38][(1)]=r[39]
            r[39]=(-10)
            r[38][(2)]=r[39]
            r[39]=(22)
            r[38][(3)]=r[39]
            r[39]=(-22)
            r[38][(4)]=r[39]
            r[39]=(34)
            r[38][(5)]=r[39]
            r[39]=(-34)
            r[38][(6)]=r[39]
            r[39]=(48)
            r[38][(7)]=r[39]
            r[39]=(-48)
            r[38][(8)]=r[39]
            r[39]=(62)
            r[38][(9)]=r[39]
            r[39]=(-62)
            r[38][(10)]=r[39]
            r[39]=(76)
            r[38][(11)]=r[39]
            r[39]=(-76)
            r[38][(12)]=r[39]
            r[39]=(88)
            r[38][(13)]=r[39]
            r[39]=(-88)
            r[38][(14)]=r[39]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=3; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=722
        elseif block == 659 then
            r[43]=upvalues[3][7]
            r[42]=r[43]
            r[43]=r[36]
            r[45]=upvalues[4][7]
            r[44]=r[45]
            r[45]=r[35]
            r[46]=r[41]
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=-1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            do local f=r[42]; local n=-1; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            block=722
        elseif block == 722 then
            r[40], r[41]=r[37](r[38],r[39])
            if r[40]~=nil then r[39]=r[40]; block=659 else block=736 end
        elseif block == 736 then
            r[37] = r[33][(1)]
            r[38]=(890866)
            r[38]=r[34] == r[38]
            if not r[38] then block=792 else block=764 end
        elseif block == 764 then
            r[12]=#r[6]
            r[8]=r[17] == r[3]
            r[7]=r[25][r[17]]
            r[20]=#r[13]
            block=792
        elseif block == 792 then
            r[38] = env[("math")]
            r[38] = r[38][("huge")]
            r[39]=(891149)
            r[39]=r[34] == r[39]
            if not r[39] then block=855 else block=827 end
        elseif block == 827 then
            r[17]=r[1] - r[18]
            r[7]=r[20] * r[22]
            r[10][(2)]=r[9]
            r[22][r[7]]=r[4]
            block=855
        elseif block == 855 then
            r[40] = env[("ipairs")]
            r[39]=r[40]
            r[40]=r[33]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=3; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            block=1037
        elseif block == 890 then
            r[45]=upvalues[1][7]
            r[44]=r[45]
            r[45] = r[43][("position")]
            r[45] = r[45] - r[31]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[46]=r[44]
            r[45] = r[46][("Dot")]
            r[47]=r[35]
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[46] = r[44][("Magnitude")]
            r[48] = r[45] > (0)
            r[47]=r[48]
            if not r[47] then block=995 else block=981 end
        elseif block == 981 then
            r[48] = r[46] < r[38]
            r[47]=r[48]
            block=995
        elseif block == 995 then
            if not r[47] then block=1037 else block=1002 end
        elseif block == 1002 then
            r[47]=r[46]
            r[38]=r[47]
            r[47]=r[43]
            r[37]=r[47]
            block=1037
        elseif block == 1037 then
            r[42], r[43]=r[39](r[40],r[41])
            if r[42]~=nil then r[41]=r[42]; block=890 else block=1051 end
        elseif block == 1051 then
            if not r[37] then block=1618 else block=1058 end
        elseif block == 1058 then
            r[39]=(935080)
            r[39]=r[34] == r[39]
            if not r[39] then block=1100 else block=1079 end
        elseif block == 1079 then
            r[13]=r[0] + r[4]
            r[14]=r[21] < r[21]
            do local f=r[9]; local n=21; if n<0 then n=top-9-1 end; local m=12; if m==1 then r[9]=f(unpackValues(r,10,9+n)); top=10 elseif m==0 then f(unpackValues(r,10,9+n)); top=9 else local result=packValues(f(unpackValues(r,10,9+n))); if m<0 then m=result.n end; for i=1,m do r[9+i-1]=result[i] end; top=9+m end end
            block=1100
        elseif block == 1100 then
            r[40]=upvalues[1][7]
            r[39]=r[40]
            r[40] = r[37][("position")]
            r[40] = r[40] - r[31]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40] = r[39][("Magnitude")]
            if not (r[40] > (0.05)) then block=1611 else block=1149 end
        elseif block == 1149 then
            r[41] = env[("Vector3")]
            r[41] = r[41][("new")]
            r[40]=r[41]
            r[41] = r[35][("Z")]
            r[41]=-r[41]
            r[42]=(0)
            r[43] = r[35][("X")]
            do local f=r[40]; local n=3; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[44]=r[39]
            r[43] = r[44][("Dot")]
            r[45]=r[40]
            do local f=r[43]; local n=2; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[43] = r[43] >= (0)
            r[42]=r[43]
            if not r[42] then block=1268 else block=1254 end
        elseif block == 1254 then
            r[43]=(-1)
            r[42]=r[43]
            block=1268
        elseif block == 1268 then
            r[41]=r[42]
            if r[41] then block=1296 else block=1282 end
        elseif block == 1282 then
            r[42]=(1)
            r[41]=r[42]
            block=1296
        elseif block == 1296 then
            r[42]=(870218)
            r[42]=r[34] == r[42]
            if not r[42] then block=1338 else block=1317 end
        elseif block == 1317 then
            r[14]=(865864)
            r[7]=r[10] < r[20]
            r[16]=r[1] == r[8]
            block=1338
        elseif block == 1338 then
            r[43]=upvalues[3][7]
            r[42]=r[43]
            r[43]=r[36]
            r[44] = r[40] * r[41]
            r[44] = r[44] * (0.55)
            r[44] = r[35] + r[44]
            r[44] = r[44][("Unit")]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[43]=upvalues[3][7]
            r[42]=r[43]
            r[43]=r[36]
            r[44] = r[40] * r[41]
            r[44] = r[44] * (0.95)
            r[44] = r[35] + r[44]
            r[44] = r[44][("Unit")]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[43]=upvalues[3][7]
            r[42]=r[43]
            r[43]=r[36]
            r[44] = r[40] * r[41]
            r[44] = r[44] * (0.55)
            r[44] = r[35] - r[44]
            r[44] = r[44][("Unit")]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=(925821)
            r[42]=r[34] == r[42]
            if not r[42] then block=1548 else block=1527 end
        elseif block == 1527 then
            r[10]=r[7][r[1]]
            r[0]=r[24] + r[2]
            r[1]=env[(34)]
            block=1548
        elseif block == 1548 then
            r[43]=upvalues[3][7]
            r[42]=r[43]
            r[43]=r[36]
            r[44] = r[40] * r[41]
            r[44] = r[44] * (0.95)
            r[44] = r[35] - r[44]
            r[44] = r[44][("Unit")]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            block=1611
        elseif block == 1611 then
            block=1618
        elseif block == 1618 then
            r[39]=upvalues[5][7]
            r[39] = r[39][("stuck")]
            if not r[39] then block=2045 else block=1639 end
        elseif block == 1639 then
            r[39]=(929941)
            r[39]=r[34] == r[39]
            if not r[39] then block=1667 else block=1660 end
        elseif block == 1660 then
            do local f=r[6]; local n=12; if n<0 then n=top-6-1 end; local m=19; if m==1 then r[6]=f(unpackValues(r,7,6+n)); top=7 elseif m==0 then f(unpackValues(r,7,6+n)); top=6 else local result=packValues(f(unpackValues(r,7,6+n))); if m<0 then m=result.n end; for i=1,m do r[6+i-1]=result[i] end; top=6+m end end
            block=1667
        elseif block == 1667 then
            r[40] = env[("Vector3")]
            r[40] = r[40][("new")]
            r[39]=r[40]
            r[40] = r[35][("Z")]
            r[40]=-r[40]
            r[41]=(0)
            r[42] = r[35][("X")]
            do local f=r[39]; local n=3; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=(873815)
            r[40]=r[34] == r[40]
            if not r[40] then block=1765 else block=1744 end
        elseif block == 1744 then
            r[9]=env[(1)]
            r[1][(-10)]=r[6]
            r[7]=#r[20]
            block=1765
        elseif block == 1765 then
            r[41]=upvalues[3][7]
            r[40]=r[41]
            r[41]=r[36]
            r[42]=r[39]
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=0; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41]=upvalues[3][7]
            r[40]=r[41]
            r[41]=r[36]
            r[42]=-r[39]
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=0; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[40]=(917889)
            r[40]=r[34] == r[40]
            if not r[40] then block=1877 else block=1856 end
        elseif block == 1856 then
            r[0]=r[16] .. r[18]
            r[13]=r[24] - r[5]
            r[4]=r[5][("Unit")]
            block=1877
        elseif block == 1877 then
            r[41]=upvalues[6][7]
            r[40]=r[41]
            do local f=r[40]; local n=0; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41]=(861568)
            r[41]=r[34] == r[41]
            if not r[41] then block=1933 else block=1919 end
        elseif block == 1919 then
            r[1]=r[11][r[24]]
            r[7][("Magnitude")]=r[0]
            block=1933
        elseif block == 1933 then
            if not r[40] then block=2038 else block=1940 end
        elseif block == 1940 then
            r[41]=(922825)
            r[41]=r[34] == r[41]
            if not r[41] then block=1975 else block=1961 end
        elseif block == 1961 then
            r[9]=r[8] == r[8]
            r[3]=(nil)
            block=1975
        elseif block == 1975 then
            r[42]=upvalues[3][7]
            r[41]=r[42]
            r[42]=r[36]
            r[44]=upvalues[1][7]
            r[43]=r[44]
            r[44] = r[40] - r[31]
            do local f=r[43]; local n=1; if n<0 then n=top-43-1 end; local m=-1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            do local f=r[41]; local n=-1; if n<0 then n=top-41-1 end; local m=0; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            block=2038
        elseif block == 2038 then
            block=2045
        elseif block == 2045 then
            r[39]=r[35]
            r[40] = env[("math")]
            r[40] = r[40][("huge")]
            r[40]=-r[40]
            r[41]=(false)
            r[43] = env[("ipairs")]
            r[42]=r[43]
            r[43]=r[33]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=3; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            block=2332
        elseif block == 2115 then
            r[48] = r[46][("collisionRisk")]
            r[47]=r[48]
            if r[47] then block=2213 else block=2136 end
        elseif block == 2136 then
            r[49] = r[46][("tackle")]
            r[48]=r[49]
            if r[48] then block=2206 else block=2157 end
        elseif block == 2157 then
            r[50] = r[46][("preTackle")]
            r[49]=r[50]
            if not r[49] then block=2199 else block=2178 end
        elseif block == 2178 then
            r[50] = r[46][("closing")]
            r[50] = r[50] > (0)
            r[49]=r[50]
            block=2199
        elseif block == 2199 then
            r[48]=r[49]
            block=2206
        elseif block == 2206 then
            r[47]=r[48]
            block=2213
        elseif block == 2213 then
            if not r[47] then block=2332 else block=2220 end
        elseif block == 2220 then
            r[47]=(946001)
            r[47]=r[34] == r[47]
            if not r[47] then block=2269 else block=2241 end
        elseif block == 2241 then
            r[5][("zero")]=r[5]
            r[24]=r[8] < r[3]
            r[7]=r[8] + r[5]
            r[17]=r[10][("Magnitude")]
            block=2269
        elseif block == 2269 then
            r[47]=(true)
            r[41]=r[47]
            r[47]=(889221)
            r[47]=r[34] == r[47]
            if not r[47] then block=2318 else block=2304 end
        elseif block == 2304 then
            r[3]=env[(34)]
            r[10]=r[20]
            block=2318
        elseif block == 2318 then
            block=2346
        elseif block == 2325 then
            block=2332
        elseif block == 2332 then
            r[45], r[46]=r[42](r[43],r[44])
            if r[45]~=nil then r[44]=r[45]; block=2115 else block=2346 end
        elseif block == 2346 then
            r[43] = env[("ipairs")]
            r[42]=r[43]
            r[43]=r[36]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=3; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            block=3907
        elseif block == 2381 then
            r[48]=r[46]
            r[47] = r[48][("Dot")]
            r[49]=r[35]
            do local f=r[47]; local n=2; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[48]=(864166)
            r[48]=r[34] == r[48]
            if not r[48] then block=2451 else block=2430 end
        elseif block == 2430 then
            r[20]=r[14] + r[8]
            r[17]=r[3] * r[6]
            r[15]=r[11][("Vector3")]
            block=2451
        elseif block == 2451 then
            r[49]=upvalues[7][7]
            r[48]=r[49]
            r[49]=r[31]
            r[50]=r[46]
            r[51]=r[33]
            do local f=r[48]; local n=3; if n<0 then n=top-48-1 end; local m=1; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            r[50]=upvalues[8][7]
            r[49]=r[50]
            r[50]=r[31]
            r[51]=r[46]
            r[52]=(18)
            do local f=r[49]; local n=3; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            if not r[49] then block=2556 else block=2542 end
        elseif block == 2542 then
            block=3907
        elseif block == 2549 then
            block=2556
        elseif block == 2556 then
            r[50]=not r[41]
            r[49]=r[50]
            if not r[49] then block=2591 else block=2577 end
        elseif block == 2577 then
            r[50] = r[47] < (0.04)
            r[49]=r[50]
            block=2591
        elseif block == 2591 then
            if not r[49] then block=2612 else block=2598 end
        elseif block == 2598 then
            block=3907
        elseif block == 2605 then
            block=2612
        elseif block == 2612 then
            r[49] = r[47] * (10)
            r[51] = env[("math")]
            r[51] = r[51][("min")]
            r[50]=r[51]
            r[51]=r[48]
            r[52]=(20)
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[50] = r[50] * (2.4)
            r[51]=upvalues[2][7]
            r[51] = r[51][("avoidStrength")]
            r[50] = r[50] * r[51]
            r[49] = r[49] + r[50]
            if not (r[48] < (0)) then block=2787 else block=2703 end
        elseif block == 2703 then
            r[51] = env[("math")]
            r[51] = r[51][("abs")]
            r[50]=r[51]
            r[51]=r[48]
            do local f=r[50]; local n=1; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[50] = r[50] * (18)
            r[51]=upvalues[2][7]
            r[51] = r[51][("avoidStrength")]
            r[50] = r[50] * r[51]
            r[51] = r[49] - r[50]
            r[49]=r[51]
            block=2857
        elseif block == 2787 then
            if not (r[48] < (5)) then block=2857 else block=2794 end
        elseif block == 2794 then
            r[50]=(5)
            r[50] = r[50] - r[48]
            r[50] = r[50] * (5)
            r[51]=upvalues[2][7]
            r[51] = r[51][("avoidStrength")]
            r[50] = r[50] * r[51]
            r[51] = r[49] - r[50]
            r[49]=r[51]
            block=2857
        elseif block == 2857 then
            r[51] = r[47] > (0.18)
            r[50]=r[51]
            if not r[50] then block=2948 else block=2878 end
        elseif block == 2878 then
            r[52] = env[("math")]
            r[52] = r[52][("abs")]
            r[51]=r[52]
            r[53]=r[46]
            r[52] = r[53][("Dot")]
            r[54]=r[35]
            do local f=r[52]; local n=2; if n<0 then n=top-52-1 end; local m=-1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            do local f=r[51]; local n=-1; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[51] = r[51] < (0.96)
            r[50]=r[51]
            block=2948
        elseif block == 2948 then
            if not r[50] then block=3060 else block=2955 end
        elseif block == 2955 then
            r[51] = env[("math")]
            r[51] = r[51][("min")]
            r[50]=r[51]
            r[52] = env[("math")]
            r[52] = r[52][("max")]
            r[51]=r[52]
            r[52]=r[48]
            r[53]=(0)
            do local f=r[51]; local n=2; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[52]=(8)
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[50] = r[50] * (1.15)
            r[51] = r[49] + r[50]
            r[49]=r[51]
            block=3060
        elseif block == 3060 then
            r[51] = env[("ipairs")]
            r[50]=r[51]
            r[51]=r[33]
            do local f=r[50]; local n=1; if n<0 then n=top-50-1 end; local m=3; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            block=3634
        elseif block == 3095 then
            r[56]=upvalues[1][7]
            r[55]=r[56]
            r[56] = r[54][("intercept")]
            r[56] = r[31] - r[56]
            do local f=r[55]; local n=1; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[56] = r[55][("Magnitude")]
            if not (r[56] > (0.05)) then block=3634 else block=3144 end
        elseif block == 3144 then
            r[56]=(927990)
            r[56]=r[34] == r[56]
            if not r[56] then block=3193 else block=3165 end
        elseif block == 3165 then
            r[22]=env[(865864)]
            r[0]=(1)
            r[2][r[11]]=r[9]
            r[22][r[12]]=r[25]
            block=3193
        elseif block == 3193 then
            r[57] = env[("math")]
            r[57] = r[57][("clamp")]
            r[56]=r[57]
            r[57]=(1)
            r[59] = env[("math")]
            r[59] = r[59][("min")]
            r[58]=r[59]
            r[59] = r[54][("interceptGap")]
            r[60] = r[54][("timeToDanger")]
            r[62] = env[("math")]
            r[62] = r[62][("max")]
            r[61]=r[62]
            r[62] = r[54][("closing")]
            r[63]=(1)
            do local f=r[61]; local n=2; if n<0 then n=top-61-1 end; local m=1; if m==1 then r[61]=f(unpackValues(r,62,61+n)); top=62 elseif m==0 then f(unpackValues(r,62,61+n)); top=61 else local result=packValues(f(unpackValues(r,62,61+n))); if m<0 then m=result.n end; for i=1,m do r[61+i-1]=result[i] end; top=61+m end end
            r[60] = r[60] * r[61]
            do local f=r[58]; local n=2; if n<0 then n=top-58-1 end; local m=1; if m==1 then r[58]=f(unpackValues(r,59,58+n)); top=59 elseif m==0 then f(unpackValues(r,59,58+n)); top=58 else local result=packValues(f(unpackValues(r,59,58+n))); if m<0 then m=result.n end; for i=1,m do r[58+i-1]=result[i] end; top=58+m end end
            r[60] = env[("math")]
            r[60] = r[60][("max")]
            r[59]=r[60]
            r[60] = r[54][("danger")]
            r[60] = r[60] * (3)
            r[61]=(1)
            do local f=r[59]; local n=2; if n<0 then n=top-59-1 end; local m=1; if m==1 then r[59]=f(unpackValues(r,60,59+n)); top=60 elseif m==0 then f(unpackValues(r,60,59+n)); top=59 else local result=packValues(f(unpackValues(r,60,59+n))); if m<0 then m=result.n end; for i=1,m do r[59+i-1]=result[i] end; top=59+m end end
            r[58] = r[58] / r[59]
            r[57] = r[57] - r[58]
            r[58]=(0)
            r[59]=(1)
            do local f=r[56]; local n=3; if n<0 then n=top-56-1 end; local m=1; if m==1 then r[56]=f(unpackValues(r,57,56+n)); top=57 elseif m==0 then f(unpackValues(r,57,56+n)); top=56 else local result=packValues(f(unpackValues(r,57,56+n))); if m<0 then m=result.n end; for i=1,m do r[56+i-1]=result[i] end; top=56+m end end
            r[57]=(879484)
            r[57]=r[34] == r[57]
            if not r[57] then block=3445 else block=3417 end
        elseif block == 3417 then
            do local f=r[3]; local n=12; if n<0 then n=top-3-1 end; local m=18; if m==1 then r[3]=f(unpackValues(r,4,3+n)); top=4 elseif m==0 then f(unpackValues(r,4,3+n)); top=3 else local result=packValues(f(unpackValues(r,4,3+n))); if m<0 then m=result.n end; for i=1,m do r[3+i-1]=result[i] end; top=3+m end end
            r[21][r[19]]=r[12]
            r[24]=r[20] < r[13]
            r[3]=r[5][r[21]]
            block=3445
        elseif block == 3445 then
            r[59] = r[54][("collisionRisk")]
            r[58]=r[59]
            if not r[58] then block=3480 else block=3466 end
        elseif block == 3466 then
            r[59]=(14)
            r[58]=r[59]
            block=3480
        elseif block == 3480 then
            r[57]=r[58]
            if r[57] then block=3508 else block=3494 end
        elseif block == 3494 then
            r[58]=(4.5)
            r[57]=r[58]
            block=3508
        elseif block == 3508 then
            r[58]=upvalues[2][7]
            r[58] = r[58][("avoidStrength")]
            r[57] = r[57] * r[58]
            r[58] = r[54][("tackle")]
            if not r[58] then block=3571 else block=3543 end
        elseif block == 3543 then
            r[58]=(1.45)
            r[59] = r[57] * r[58]
            r[57]=r[59]
            block=3571
        elseif block == 3571 then
            r[59]=r[46]
            r[58] = r[59][("Dot")]
            r[60] = r[55][("Unit")]
            do local f=r[58]; local n=2; if n<0 then n=top-58-1 end; local m=1; if m==1 then r[58]=f(unpackValues(r,59,58+n)); top=59 elseif m==0 then f(unpackValues(r,59,58+n)); top=58 else local result=packValues(f(unpackValues(r,59,58+n))); if m<0 then m=result.n end; for i=1,m do r[58+i-1]=result[i] end; top=58+m end end
            r[58] = r[58] * r[56]
            r[58] = r[58] * r[57]
            r[59] = r[49] + r[58]
            r[49]=r[59]
            block=3634
        elseif block == 3634 then
            r[53], r[54]=r[50](r[51],r[52])
            if r[53]~=nil then r[52]=r[53]; block=3095 else block=3648 end
        elseif block == 3648 then
            r[50]=upvalues[5][7]
            r[50] = r[50][("edgeRisk")]
            if not r[50] then block=3788 else block=3669 end
        elseif block == 3669 then
            r[50]=(888501)
            r[50]=r[34] == r[50]
            if not r[50] then block=3697 else block=3690 end
        elseif block == 3690 then
            r[4]=#r[23]
            block=3697
        elseif block == 3697 then
            r[50]=upvalues[5][7]
            r[50] = r[50][("edgeDirection")]
            r[51] = r[50][("Magnitude")]
            if not (r[51] > (0.05)) then block=3781 else block=3725 end
        elseif block == 3725 then
            r[52]=r[46]
            r[51] = r[52][("Dot")]
            r[53] = r[50][("Unit")]
            do local f=r[51]; local n=2; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[51] = r[51] * (7)
            r[52] = r[49] + r[51]
            r[49]=r[52]
            block=3781
        elseif block == 3781 then
            block=3788
        elseif block == 3788 then
            r[50]=(938752)
            r[50]=r[34] == r[50]
            if not r[50] then block=3823 else block=3809 end
        elseif block == 3809 then
            r[0]=r[21] + r[25]
            r[4]=r[13] .. r[9]
            block=3823
        elseif block == 3823 then
            if not (r[49] > r[40]) then block=3907 else block=3830 end
        elseif block == 3830 then
            r[50]=(958120)
            r[50]=r[34] == r[50]
            if not r[50] then block=3872 else block=3851 end
        elseif block == 3851 then
            r[12]=(2)
            r[0]=#r[15]
            r[23]=r[6][("Vector3")]
            block=3872
        elseif block == 3872 then
            r[50]=r[49]
            r[40]=r[50]
            r[50]=r[46]
            r[39]=r[50]
            block=3907
        elseif block == 3907 then
            r[45], r[46]=r[42](r[43],r[44])
            if r[45]~=nil then r[44]=r[45]; block=2381 else block=3921 end
        elseif block == 3921 then
            r[44] = r[39][("Magnitude")]
            r[44] = r[44] < (0.05)
            r[43]=r[44]
            if not r[43] then block=3956 else block=3949 end
        elseif block == 3949 then
            r[43]=r[35]
            block=3956
        elseif block == 3956 then
            r[42]=r[43]
            if r[42] then block=3984 else block=3970 end
        elseif block == 3970 then
            r[43] = r[39][("Unit")]
            r[42]=r[43]
            block=3984
        elseif block == 3984 then
            return r[42]
        elseif block == 3991 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[68] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(358535)
            r[36]=upvalues[1][7]
            r[35]=r[36]
            r[36]=r[32]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36]=(442420)
            r[36]=r[34] == r[36]
            if not r[36] then block=78 else block=57 end
        elseif block == 57 then
            r[15]=r[14] + r[1]
            do local f=r[3]; local n=8; if n<0 then n=top-3-1 end; local m=19; if m==1 then r[3]=f(unpackValues(r,4,3+n)); top=4 elseif m==0 then f(unpackValues(r,4,3+n)); top=3 else local result=packValues(f(unpackValues(r,4,3+n))); if m<0 then m=result.n end; for i=1,m do r[3+i-1]=result[i] end; top=3+m end end
            r[12]=r[5] / r[3]
            block=78
        elseif block == 78 then
            r[37]=upvalues[2][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38] = r[35][("Magnitude")]
            r[38] = r[38] < (0.05)
            r[37]=r[38]
            if not r[37] then block=134 else block=127 end
        elseif block == 127 then
            r[37]=r[36]
            block=134
        elseif block == 134 then
            if not r[37] then block=190 else block=141 end
        elseif block == 141 then
            r[38]=upvalues[1][7]
            r[37]=r[38]
            r[38] = r[36][("CFrame")]
            r[38] = r[38][("LookVector")]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[35]=r[37]
            block=190
        elseif block == 190 then
            r[37] = r[35][("Magnitude")]
            if not (r[37] < (0.05)) then block=232 else block=204 end
        elseif block == 204 then
            r[37] = env[("Vector3")]
            r[37] = r[37][("zero")]
            return r[37]
        elseif block == 225 then
            block=232
        elseif block == 232 then
            r[37]=(445401)
            r[37]=r[34] == r[37]
            if not r[37] then block=260 else block=253 end
        elseif block == 253 then
            r[4][(442420)]=r[25]
            block=260
        elseif block == 260 then
            r[37] = r[35][("Unit")]
            r[35]=r[37]
            r[37]={}
            r[39]=upvalues[3][7]
            r[38]=r[39]
            r[39]=r[37]
            r[40]=r[35]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39] = env[("ipairs")]
            r[38]=r[39]
            r[39]={}
            r[40]=(18)
            r[39][(1)]=r[40]
            r[40]=(-18)
            r[39][(2)]=r[40]
            r[40]=(32)
            r[39][(3)]=r[40]
            r[40]=(-32)
            r[39][(4)]=r[40]
            r[40]=(48)
            r[39][(5)]=r[40]
            r[40]=(-48)
            r[39][(6)]=r[40]
            r[40]=(64)
            r[39][(7)]=r[40]
            r[40]=(-64)
            r[39][(8)]=r[40]
            r[40]=(82)
            r[39][(9)]=r[40]
            r[40]=(-82)
            r[39][(10)]=r[40]
            r[40]=(90)
            r[39][(11)]=r[40]
            r[40]=(-90)
            r[39][(12)]=r[40]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=3; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=582
        elseif block == 519 then
            r[44]=upvalues[3][7]
            r[43]=r[44]
            r[44]=r[37]
            r[46]=upvalues[4][7]
            r[45]=r[46]
            r[46]=r[35]
            r[47]=r[42]
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=-1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            do local f=r[43]; local n=-1; if n<0 then n=top-43-1 end; local m=0; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            block=582
        elseif block == 582 then
            r[41], r[42]=r[38](r[39],r[40])
            if r[41]~=nil then r[40]=r[41]; block=519 else block=596 end
        elseif block == 596 then
            r[38] = env[("Vector3")]
            r[38] = r[38][("zero")]
            r[39]=(1)
            r[41] = env[("math")]
            r[41] = r[41][("min")]
            r[40]=r[41]
            r[41]=(6)
            r[42]=#r[33]
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41]=(1)
            r[39]=r[39]-r[41]; block=967
        elseif block == 673 then
            r[43] = r[33][r[42]]
            r[45]=upvalues[1][7]
            r[44]=r[45]
            r[45] = r[43][("predicted")]
            r[45] = r[31] - r[45]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45] = r[44][("Magnitude")]
            if not (r[45] > (0.05)) then block=967 else block=729 end
        elseif block == 729 then
            r[46] = env[("math")]
            r[46] = r[46][("clamp")]
            r[45]=r[46]
            r[46]=(1)
            r[47] = r[43][("distance")]
            r[47] = r[47] / (60)
            r[46] = r[46] - r[47]
            r[47]=(0.2)
            r[48]=(1)
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[46] = r[43][("tackle")]
            if not r[46] then block=890 else block=813 end
        elseif block == 813 then
            r[46]=(359075)
            r[46]=r[34] == r[46]
            if not r[46] then block=862 else block=834 end
        elseif block == 834 then
            r[19]=r[14] .. r[15]
            r[19]=r[10] .. r[25]
            r[22]=env[(64)]
            do local f=r[20]; local n=22; if n<0 then n=top-20-1 end; local m=14; if m==1 then r[20]=f(unpackValues(r,21,20+n)); top=21 elseif m==0 then f(unpackValues(r,21,20+n)); top=20 else local result=packValues(f(unpackValues(r,21,20+n))); if m<0 then m=result.n end; for i=1,m do r[20+i-1]=result[i] end; top=20+m end end
            block=862
        elseif block == 862 then
            r[46]=(2.2)
            r[47] = r[45] * r[46]
            r[45]=r[47]
            block=932
        elseif block == 890 then
            r[46] = r[43][("preTackle")]
            if not r[46] then block=932 else block=904 end
        elseif block == 904 then
            r[46]=(1.5)
            r[47] = r[45] * r[46]
            r[45]=r[47]
            block=932
        elseif block == 932 then
            r[46] = r[44][("Unit")]
            r[46] = r[46] * r[45]
            r[47] = r[38] + r[46]
            r[38]=r[47]
            block=967
        elseif block == 967 then
            r[39]=r[39]+r[41]
            if (r[41]>0 and r[39]<=r[40]) or (r[41]<=0 and r[39]>=r[40]) then r[42]=r[39]; block=673 else block=974 end
        elseif block == 974 then
            r[39]=(386094)
            r[39]=r[34] == r[39]
            if not r[39] then block=1023 else block=995 end
        elseif block == 995 then
            r[16][(2)]=r[0]
            r[8]=r[7] .. r[19]
            r[25]=env[(4)]
            r[9]=r[19][r[2]]
            block=1023
        elseif block == 1023 then
            r[39] = r[38][("Magnitude")]
            if not (r[39] > (0.05)) then block=1233 else block=1037 end
        elseif block == 1037 then
            r[39]=(366300)
            r[39]=r[34] == r[39]
            if not r[39] then block=1065 else block=1058 end
        elseif block == 1058 then
            r[14]=r[3] + r[19]
            block=1065
        elseif block == 1065 then
            r[40]=upvalues[3][7]
            r[39]=r[40]
            r[40]=r[37]
            r[41] = r[38][("Unit")]
            do local f=r[39]; local n=2; if n<0 then n=top-39-1 end; local m=0; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=upvalues[3][7]
            r[39]=r[40]
            r[40]=r[37]
            r[42]=upvalues[4][7]
            r[41]=r[42]
            r[42] = r[38][("Unit")]
            r[43]=(28)
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=-1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            do local f=r[39]; local n=-1; if n<0 then n=top-39-1 end; local m=0; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=upvalues[3][7]
            r[39]=r[40]
            r[40]=r[37]
            r[42]=upvalues[4][7]
            r[41]=r[42]
            r[42] = r[38][("Unit")]
            r[43]=(-28)
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=-1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            do local f=r[39]; local n=-1; if n<0 then n=top-39-1 end; local m=0; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            block=1233
        elseif block == 1233 then
            r[39]=r[35]
            r[40] = env[("math")]
            r[40] = r[40][("huge")]
            r[40]=-r[40]
            r[41]=(392106)
            r[41]=r[34] == r[41]
            if not r[41] then block=1310 else block=1282 end
        elseif block == 1282 then
            r[7]=r[20][("CFrame")]
            r[19]=r[17] < r[21]
            r[8]=r[13] == r[16]
            r[24]=r[14] < r[23]
            block=1310
        elseif block == 1310 then
            r[42] = env[("ipairs")]
            r[41]=r[42]
            r[42]=r[37]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=3; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            block=1954
        elseif block == 1345 then
            r[46]=(434035)
            r[46]=r[34] == r[46]
            if not r[46] then block=1380 else block=1366 end
        elseif block == 1366 then
            r[2]=#r[24]
            r[1]=r[9]
            block=1380
        elseif block == 1380 then
            r[47]=upvalues[5][7]
            r[46]=r[47]
            r[47]=r[31]
            r[48]=r[45]
            r[49]=r[33]
            do local f=r[46]; local n=3; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[47]=(455507)
            r[47]=r[34] == r[47]
            if not r[47] then block=1457 else block=1443 end
        elseif block == 1443 then
            r[15]=r[8] - r[7]
            r[4]=#r[23]
            block=1457
        elseif block == 1457 then
            r[48]=r[45]
            r[47] = r[48][("Dot")]
            r[49]=r[35]
            do local f=r[47]; local n=2; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[48] = r[47] * (4.5)
            r[50] = env[("math")]
            r[50] = r[50][("min")]
            r[49]=r[50]
            r[50]=r[46]
            r[51]=(20)
            do local f=r[49]; local n=2; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[49] = r[49] * (5)
            r[48] = r[48] + r[49]
            if not (r[47] < (-0.05)) then block=1583 else block=1555 end
        elseif block == 1555 then
            r[49]=(18)
            r[50] = r[48] - r[49]
            r[48]=r[50]
            block=1583
        elseif block == 1583 then
            if not (r[46] < (0)) then block=1695 else block=1590 end
        elseif block == 1590 then
            r[49]=(427052)
            r[49]=r[34] == r[49]
            if not r[49] then block=1632 else block=1611 end
        elseif block == 1611 then
            r[9]=r[15][r[0]]
            do local f=r[5]; local n=14; if n<0 then n=top-5-1 end; local m=24; if m==1 then r[5]=f(unpackValues(r,6,5+n)); top=6 elseif m==0 then f(unpackValues(r,6,5+n)); top=5 else local result=packValues(f(unpackValues(r,6,5+n))); if m<0 then m=result.n end; for i=1,m do r[5+i-1]=result[i] end; top=5+m end end
            r[0]=#r[16]
            block=1632
        elseif block == 1632 then
            r[50] = env[("math")]
            r[50] = r[50][("abs")]
            r[49]=r[50]
            r[50]=r[46]
            do local f=r[49]; local n=1; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[49] = r[49] * (22)
            r[50] = r[48] - r[49]
            r[48]=r[50]
            block=1772
        elseif block == 1695 then
            if not (r[46] < (5)) then block=1772 else block=1702 end
        elseif block == 1702 then
            r[49]=(365025)
            r[49]=r[34] == r[49]
            if not r[49] then block=1730 else block=1723 end
        elseif block == 1723 then
            r[14]=r[6][("zero")]
            block=1730
        elseif block == 1730 then
            r[49]=(5)
            r[49] = r[49] - r[46]
            r[49] = r[49] * (5)
            r[50] = r[48] - r[49]
            r[48]=r[50]
            block=1772
        elseif block == 1772 then
            r[49] = r[38][("Magnitude")]
            if not (r[49] > (0.05)) then block=1842 else block=1786 end
        elseif block == 1786 then
            r[50]=r[45]
            r[49] = r[50][("Dot")]
            r[51] = r[38][("Unit")]
            do local f=r[49]; local n=2; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[49] = r[49] * (7)
            r[50] = r[48] + r[49]
            r[48]=r[50]
            block=1842
        elseif block == 1842 then
            r[49]=(446038)
            r[49]=r[34] == r[49]
            if not r[49] then block=1877 else block=1863 end
        elseif block == 1863 then
            r[24][("LookVector")]=r[11]
            r[24]=r[14][r[13]]
            block=1877
        elseif block == 1877 then
            if not (r[48] > r[40]) then block=1954 else block=1884 end
        elseif block == 1884 then
            r[49]=r[48]
            r[40]=r[49]
            r[49]=(413714)
            r[49]=r[34] == r[49]
            if not r[49] then block=1933 else block=1919 end
        elseif block == 1919 then
            r[11]=r[15] < r[13]
            r[0]=r[24] / r[23]
            block=1933
        elseif block == 1933 then
            r[49]=r[45]
            r[39]=r[49]
            block=1954
        elseif block == 1954 then
            r[44], r[45]=r[41](r[42],r[43])
            if r[44]~=nil then r[43]=r[44]; block=1345 else block=1968 end
        elseif block == 1968 then
            r[41] = r[39][("Unit")]
            return r[41]
        elseif block == 1982 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[69] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(107322)
            r[35]=upvalues[1][7]
            r[35] = r[35][("autoDash")]
            r[35]=not r[35]
            r[34]=r[35]
            if r[34] then block=78 else block=43 end
        elseif block == 43 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35]=not r[35]
            r[34]=r[35]
            block=78
        elseif block == 78 then
            if not r[34] then block=106 else block=85 end
        elseif block == 85 then
            r[34]=(false)
            return r[34]
        elseif block == 99 then
            block=106
        elseif block == 106 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36]=upvalues[4][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=not r[34]
            r[36]=r[37]
            if r[36] then block=183 else block=169 end
        elseif block == 169 then
            r[37]=not r[35]
            r[36]=r[37]
            block=183
        elseif block == 183 then
            if not r[36] then block=281 else block=190 end
        elseif block == 190 then
            r[36]=("no-character")
            r[37]=upvalues[5][7]
            r[37][("dashStatus")]=r[36]
            r[36]=(182224)
            r[36]=r[33] == r[36]
            if not r[36] then block=260 else block=232 end
        elseif block == 232 then
            r[23]=r[15] - r[1]
            r[0]=r[6] / r[11]
            r[19]=r[24] / r[22]
            r[18]=r[14] / r[11]
            block=260
        elseif block == 260 then
            r[36]=(false)
            return r[36]
        elseif block == 274 then
            block=281
        elseif block == 281 then
            r[36]=(133590)
            r[36]=r[33] == r[36]
            if not r[36] then block=330 else block=302 end
        elseif block == 302 then
            r[4]=r[25]
            r[14]=r[2][(0)]
            r[12]=r[25] / r[24]
            r[19]=(182224)
            block=330
        elseif block == 330 then
            r[37] = env[("pcall")]
            r[36]=r[37]
            r[37]=upvalues[6][7]
            r[37] = r[37][("available")]
            r[38]=upvalues[7][7]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=2; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[39]=not r[36]
            r[38]=r[39]
            if r[38] then block=414 else block=393 end
        elseif block == 393 then
            r[39]=(true)
            r[39] = r[37] ~= r[39]
            r[38]=r[39]
            block=414
        elseif block == 414 then
            if not r[38] then block=498 else block=421 end
        elseif block == 421 then
            r[38]=("not-available")
            r[39]=upvalues[5][7]
            r[39][("dashStatus")]=r[38]
            r[38]=(173423)
            r[38]=r[33] == r[38]
            if not r[38] then block=477 else block=463 end
        elseif block == 463 then
            r[19]=r[8] .. r[2]
            r[2]=r[18][r[25]]
            block=477
        elseif block == 477 then
            r[38]=(false)
            return r[38]
        elseif block == 491 then
            block=498
        elseif block == 498 then
            r[40] = env[("tonumber")]
            r[39]=r[40]
            r[41]=r[34]
            r[40] = r[41][("GetAttribute")]
            r[42]=("DashCooldownUntil")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=-1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            do local f=r[39]; local n=-1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[38]=r[39]
            if r[38] then block=575 else block=561 end
        elseif block == 561 then
            r[39]=(0)
            r[38]=r[39]
            block=575
        elseif block == 575 then
            r[39]=(143614)
            r[39]=r[33] == r[39]
            if not r[39] then block=603 else block=596 end
        elseif block == 596 then
            do local f=r[5]; local n=7; if n<0 then n=top-5-1 end; local m=12; if m==1 then r[5]=f(unpackValues(r,6,5+n)); top=6 elseif m==0 then f(unpackValues(r,6,5+n)); top=5 else local result=packValues(f(unpackValues(r,6,5+n))); if m<0 then m=result.n end; for i=1,m do r[5+i-1]=result[i] end; top=5+m end end
            block=603
        elseif block == 603 then
            r[41] = env[("os")]
            r[41] = r[41][("clock")]
            r[40]=r[41]
            do local f=r[40]; local n=0; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[40] = r[40] < r[38]
            r[39]=r[40]
            if r[39] then block=701 else block=652 end
        elseif block == 652 then
            r[40]=upvalues[5][7]
            r[40] = r[40][("dashAt")]
            r[40] = r[32] - r[40]
            r[41]=upvalues[1][7]
            r[41] = r[41][("dashCooldown")]
            r[40] = r[40] < r[41]
            r[39]=r[40]
            block=701
        elseif block == 701 then
            if not r[39] then block=785 else block=708 end
        elseif block == 708 then
            r[39]=("cooldown")
            r[40]=upvalues[5][7]
            r[40][("dashStatus")]=r[39]
            r[39]=(174281)
            r[39]=r[33] == r[39]
            if not r[39] then block=764 else block=750 end
        elseif block == 750 then
            r[15]=r[16] < r[23]
            r[3]=r[16] .. r[11]
            block=764
        elseif block == 764 then
            r[39]=(false)
            return r[39]
        elseif block == 778 then
            block=785
        elseif block == 785 then
            r[39]=(130166)
            r[39]=r[33] == r[39]
            if not r[39] then block=820 else block=806 end
        elseif block == 806 then
            r[10]=env[("available")]
            r[19][(133590)]=r[3]
            block=820
        elseif block == 820 then
            r[40]=upvalues[8][7]
            r[39]=r[40]
            do local f=r[39]; local n=0; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=(188211)
            r[40]=r[33] == r[40]
            if not r[40] then block=876 else block=862 end
        elseif block == 862 then
            r[16]=r[12] < r[9]
            r[4]=r[9]
            block=876
        elseif block == 876 then
            r[41]=r[39]
            if not r[41] then block=925 else block=890 end
        elseif block == 890 then
            r[43]=upvalues[9][7]
            r[42]=r[43]
            r[43] = r[39][("MoveDirection")]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[41]=r[42]
            block=925
        elseif block == 925 then
            r[40]=r[41]
            if r[40] then block=960 else block=939 end
        elseif block == 939 then
            r[41] = env[("Vector3")]
            r[41] = r[41][("zero")]
            r[40]=r[41]
            block=960
        elseif block == 960 then
            r[41]=(144957)
            r[41]=r[33] == r[41]
            if not r[41] then block=1009 else block=981 end
        elseif block == 981 then
            r[5]=r[14] .. r[25]
            r[23][r[0]]=r[22]
            r[25]=r[22] == r[19]
            r[10]=env[(174281)]
            block=1009
        elseif block == 1009 then
            r[41] = r[40][("Magnitude")]
            if not (r[41] < (0.05)) then block=1065 else block=1023 end
        elseif block == 1023 then
            r[42]=upvalues[9][7]
            r[41]=r[42]
            r[42]=r[31]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[40]=r[41]
            block=1065
        elseif block == 1065 then
            r[41] = r[40][("Magnitude")]
            if not (r[41] < (0.05)) then block=1163 else block=1079 end
        elseif block == 1079 then
            r[41]=(168737)
            r[41]=r[33] == r[41]
            if not r[41] then block=1114 else block=1100 end
        elseif block == 1100 then
            r[5]=r[11][("GetAttribute")]
            r[4]=r[22] .. r[5]
            block=1114
        elseif block == 1114 then
            r[42]=upvalues[9][7]
            r[41]=r[42]
            r[42] = r[35][("CFrame")]
            r[42] = r[42][("LookVector")]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[40]=r[41]
            block=1163
        elseif block == 1163 then
            r[41] = r[40][("Magnitude")]
            if not (r[41] < (0.05)) then block=1219 else block=1177 end
        elseif block == 1177 then
            r[41]=("no-direction")
            r[42]=upvalues[5][7]
            r[42][("dashStatus")]=r[41]
            r[41]=(false)
            return r[41]
        elseif block == 1212 then
            block=1219
        elseif block == 1219 then
            r[41]=(181867)
            r[41]=r[33] == r[41]
            if not r[41] then block=1254 else block=1240 end
        elseif block == 1240 then
            r[8][r[5]]=r[6]
            r[19]=r[4] - r[21]
            block=1254
        elseif block == 1254 then
            r[42] = env[("pcall")]
            r[41]=r[42]
            r[42]=upvalues[6][7]
            r[42] = r[42][("request")]
            r[43]=nil
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=2; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[43]=(119669)
            r[43]=r[33] == r[43]
            if not r[43] then block=1324 else block=1317 end
        elseif block == 1317 then
            r[10]=("dashAt")
            block=1324
        elseif block == 1324 then
            r[43]=r[32]
            r[44]=upvalues[5][7]
            r[44][("dashLastRequestAt")]=r[43]
            r[43]=(154428)
            r[43]=r[33] == r[43]
            if not r[43] then block=1394 else block=1366 end
        elseif block == 1366 then
            r[25][("clock")]=r[18]
            r[25]=("os")
            r[0]=r[1] / r[6]
            r[9]=(188211)
            block=1394
        elseif block == 1394 then
            r[45] = env[("tonumber")]
            r[44]=r[45]
            r[46]=r[34]
            r[45] = r[46][("GetAttribute")]
            r[47]=("DashCount")
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=-1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            do local f=r[44]; local n=-1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[43]=r[44]
            if r[43] then block=1471 else block=1457 end
        elseif block == 1457 then
            r[44]=(0)
            r[43]=r[44]
            block=1471
        elseif block == 1471 then
            r[44]=upvalues[5][7]
            r[44][("dashLastCount")]=r[43]
            r[43]=(161100)
            r[43]=r[33] == r[43]
            if not r[43] then block=1527 else block=1506 end
        elseif block == 1506 then
            r[5]=r[21] == r[0]
            r[6]=r[13][(false)]
            r[1]=r[16]
            block=1527
        elseif block == 1527 then
            r[44]=not r[41]
            r[43]=r[44]
            if r[43] then block=1569 else block=1548 end
        elseif block == 1548 then
            r[44]=(false)
            r[44] = r[42] == r[44]
            r[43]=r[44]
            block=1569
        elseif block == 1569 then
            if not r[43] then block=1618 else block=1576 end
        elseif block == 1576 then
            r[43]=("request-failed")
            r[44]=upvalues[5][7]
            r[44][("dashStatus")]=r[43]
            r[43]=(false)
            return r[43]
        elseif block == 1611 then
            block=1618
        elseif block == 1618 then
            r[43]=r[32]
            r[44]=upvalues[5][7]
            r[44][("dashAt")]=r[43]
            r[43]=("requested")
            r[44]=upvalues[5][7]
            r[44][("dashStatus")]=r[43]
            r[43]=(true)
            return r[43]
        elseif block == 1674 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[70] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(274394)
            r[36]=upvalues[1][7]
            r[36] = r[36][("autoDash")]
            r[36]=not r[36]
            r[35]=r[36]
            if r[35] then block=78 else block=43 end
        elseif block == 43 then
            r[37]=upvalues[2][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36]=not r[36]
            r[35]=r[36]
            block=78
        elseif block == 78 then
            if not r[35] then block=106 else block=85 end
        elseif block == 85 then
            r[35]=(false)
            return r[35]
        elseif block == 99 then
            block=106
        elseif block == 106 then
            r[36] = env[("os")]
            r[36] = r[36][("clock")]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=upvalues[3][7]
            r[37] = r[37][("dashAt")]
            r[37] = r[35] - r[37]
            r[37] = r[37] < (0.28)
            r[36]=r[37]
            if r[36] then block=197 else block=176 end
        elseif block == 176 then
            r[37]=#r[32]
            r[37] = r[37] == (0)
            r[36]=r[37]
            block=197
        elseif block == 197 then
            if not r[36] then block=225 else block=204 end
        elseif block == 204 then
            r[36]=(false)
            return r[36]
        elseif block == 218 then
            block=225
        elseif block == 225 then
            r[36] = env[("math")]
            r[36] = r[36][("huge")]
            r[37]=(false)
            r[38] = env[("math")]
            r[38] = r[38][("huge")]
            r[40] = env[("ipairs")]
            r[39]=r[40]
            r[40]=r[32]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=3; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            block=1128
        elseif block == 295 then
            r[44]=(288580)
            r[44]=r[34] == r[44]
            if not r[44] then block=344 else block=316 end
        elseif block == 316 then
            r[2]=env[(0)]
            r[0]=r[19] < r[25]
            r[7]=r[7][("min")]
            r[7]=r[18][("danger")]
            block=344
        elseif block == 344 then
            r[44] = r[43][("distance")]
            if not (r[44] < r[36]) then block=379 else block=358 end
        elseif block == 358 then
            r[44] = r[43][("distance")]
            r[36]=r[44]
            block=379
        elseif block == 379 then
            r[46] = env[("tonumber")]
            r[45]=r[46]
            r[46] = r[43][("interceptGap")]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[44]=r[45]
            if r[44] then block=442 else block=421 end
        elseif block == 421 then
            r[45] = env[("math")]
            r[45] = r[45][("huge")]
            r[44]=r[45]
            block=442
        elseif block == 442 then
            r[46] = env[("math")]
            r[46] = r[46][("max")]
            r[45]=r[46]
            r[48] = env[("tonumber")]
            r[47]=r[48]
            r[48] = r[43][("danger")]
            do local f=r[47]; local n=1; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[46]=r[47]
            if r[46] then block=519 else block=505 end
        elseif block == 505 then
            r[47]=(4)
            r[46]=r[47]
            block=519
        elseif block == 519 then
            r[47]=(4)
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[47] = env[("math")]
            r[47] = r[47][("min")]
            r[46]=r[47]
            r[47]=r[38]
            r[50] = env[("tonumber")]
            r[49]=r[50]
            r[50] = r[43][("timeToDanger")]
            do local f=r[49]; local n=1; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[48]=r[49]
            if r[48] then block=624 else block=603 end
        elseif block == 603 then
            r[49] = env[("math")]
            r[49] = r[49][("huge")]
            r[48]=r[49]
            block=624
        elseif block == 624 then
            do local f=r[46]; local n=2; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[38]=r[46]
            r[47] = r[43][("tackle")]
            r[46]=r[47]
            if not r[46] then block=785 else block=659 end
        elseif block == 659 then
            r[48] = r[45] * (1.12)
            r[48] = r[44] <= r[48]
            r[47]=r[48]
            if r[47] then block=778 else block=687 end
        elseif block == 687 then
            r[50] = r[43][("timeToDanger")]
            r[49]=r[50]
            if r[49] then block=729 else block=708 end
        elseif block == 708 then
            r[50] = env[("math")]
            r[50] = r[50][("huge")]
            r[49]=r[50]
            block=729
        elseif block == 729 then
            r[49] = r[49] <= (0.38)
            r[48]=r[49]
            if r[48] then block=771 else block=750 end
        elseif block == 750 then
            r[49] = r[43][("distance")]
            r[49] = r[49] <= (10)
            r[48]=r[49]
            block=771
        elseif block == 771 then
            r[47]=r[48]
            block=778
        elseif block == 778 then
            r[46]=r[47]
            block=785
        elseif block == 785 then
            if not r[46] then block=813 else block=792 end
        elseif block == 792 then
            r[46]=(true)
            r[37]=r[46]
            block=1128
        elseif block == 813 then
            r[47] = r[43][("preTackle")]
            r[46]=r[47]
            if not r[46] then block=925 else block=834 end
        elseif block == 834 then
            r[48] = r[45] * (1.05)
            r[48] = r[44] <= r[48]
            r[47]=r[48]
            if not r[47] then block=918 else block=862 end
        elseif block == 862 then
            r[49] = r[43][("timeToDanger")]
            r[48]=r[49]
            if r[48] then block=904 else block=883 end
        elseif block == 883 then
            r[49] = env[("math")]
            r[49] = r[49][("huge")]
            r[48]=r[49]
            block=904
        elseif block == 904 then
            r[48] = r[48] <= (0.48)
            r[47]=r[48]
            block=918
        elseif block == 918 then
            r[46]=r[47]
            block=925
        elseif block == 925 then
            if not r[46] then block=988 else block=932 end
        elseif block == 932 then
            r[46]=(312116)
            r[46]=r[34] == r[46]
            if not r[46] then block=967 else block=953 end
        elseif block == 953 then
            r[23]=r[18] .. r[14]
            do local f=r[15]; local n=24; if n<0 then n=top-15-1 end; local m=8; if m==1 then r[15]=f(unpackValues(r,16,15+n)); top=16 elseif m==0 then f(unpackValues(r,16,15+n)); top=15 else local result=packValues(f(unpackValues(r,16,15+n))); if m<0 then m=result.n end; for i=1,m do r[15+i-1]=result[i] end; top=15+m end end
            block=967
        elseif block == 967 then
            r[46]=(true)
            r[37]=r[46]
            block=1128
        elseif block == 988 then
            r[47] = r[43][("collisionRisk")]
            r[46]=r[47]
            if not r[46] then block=1100 else block=1009 end
        elseif block == 1009 then
            r[48] = r[45] * (1.02)
            r[48] = r[44] <= r[48]
            r[47]=r[48]
            if not r[47] then block=1093 else block=1037 end
        elseif block == 1037 then
            r[49] = r[43][("timeToDanger")]
            r[48]=r[49]
            if r[48] then block=1079 else block=1058 end
        elseif block == 1058 then
            r[49] = env[("math")]
            r[49] = r[49][("huge")]
            r[48]=r[49]
            block=1079
        elseif block == 1079 then
            r[48] = r[48] <= (0.42)
            r[47]=r[48]
            block=1093
        elseif block == 1093 then
            r[46]=r[47]
            block=1100
        elseif block == 1100 then
            if not r[46] then block=1128 else block=1107 end
        elseif block == 1107 then
            r[46]=(true)
            r[37]=r[46]
            block=1128
        elseif block == 1128 then
            r[42], r[43]=r[39](r[40],r[41])
            if r[42]~=nil then r[41]=r[42]; block=295 else block=1142 end
        elseif block == 1142 then
            if not r[37] then block=1170 else block=1149 end
        elseif block == 1149 then
            r[39]=(true)
            return r[39]
        elseif block == 1163 then
            block=1170
        elseif block == 1170 then
            r[40] = r[36] <= (9)
            r[39]=r[40]
            if not r[39] then block=1205 else block=1191 end
        elseif block == 1191 then
            r[40] = r[38] <= (0.45)
            r[39]=r[40]
            block=1205
        elseif block == 1205 then
            if not r[39] then block=1268 else block=1212 end
        elseif block == 1212 then
            r[39]=(335318)
            r[39]=r[34] == r[39]
            if not r[39] then block=1247 else block=1233 end
        elseif block == 1233 then
            r[19]=r[5] < r[6]
            r[0]=r[1] - r[18]
            block=1247
        elseif block == 1247 then
            r[39]=(true)
            return r[39]
        elseif block == 1261 then
            block=1268
        elseif block == 1268 then
            r[39]=(292875)
            r[39]=r[34] == r[39]
            if not r[39] then block=1310 else block=1289 end
        elseif block == 1289 then
            r[22][r[19]]=r[0]
            r[22]=r[24] < r[4]
            r[14]=r[3]
            block=1310
        elseif block == 1310 then
            r[39]=(false)
            return r[39]
        elseif block == 1324 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[71] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(707326)
            r[34]=("SafeZone")
            r[35]=upvalues[1][7]
            r[35][("goalMode")]=r[34]
            r[35] = env[("select")]
            r[34]=r[35]
            r[35]=(1)
            r[37]=upvalues[2][7]
            r[36]=r[37]
            r[37]=r[31]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=-1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            do local f=r[34]; local n=-1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=(726661)
            r[35]=r[33] == r[35]
            if not r[35] then block=120 else block=106 end
        elseif block == 106 then
            r[15]=r[0] .. r[17]
            r[13]=env[(nil)]
            block=120
        elseif block == 120 then
            r[36]=not r[34]
            r[35]=r[36]
            if not r[35] then block=162 else block=141 end
        elseif block == 141 then
            r[36]=upvalues[3][7]
            r[36] = r[36][("emergencySafeZone")]
            r[35]=r[36]
            block=162
        elseif block == 162 then
            if not r[35] then block=211 else block=169 end
        elseif block == 169 then
            r[36]=upvalues[4][7]
            r[35]=r[36]
            r[36]=r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34]=r[35]
            block=211
        elseif block == 211 then
            r[35]=r[34]
            r[36]=upvalues[1][7]
            r[36][("goal")]=r[35]
            return r[34]
        elseif block == 239 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[72] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(545778)
            r[34]=(592268)
            r[34]=r[33] == r[34]
            if not r[34] then block=50 else block=29 end
        elseif block == 29 then
            r[16]=r[19]
            r[7]=r[20] == r[16]
            r[19]=r[12] == r[7]
            block=50
        elseif block == 50 then
            r[34]=upvalues[1][7]
            r[34] = r[34][("lastMovePosition")]
            r[35]=not r[34]
            if not r[35] then block=155 else block=78 end
        elseif block == 78 then
            r[35]=r[32]
            r[36]=r[31]
            r[37]=(false)
            r[38]=upvalues[1][7]
            r[38][("lastMovePosition")]=r[35]
            r[39]=upvalues[1][7]
            r[39][("lastMove")]=r[36]
            r[40]=upvalues[1][7]
            r[40][("stuck")]=r[37]
            return unpackValues(r, 0, -1)
        elseif block == 148 then
            block=155
        elseif block == 155 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[36] = r[32] - r[34]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35] = r[35][("Magnitude")]
            if not (r[35] >= (0.5)) then block=267 else block=197 end
        elseif block == 197 then
            r[35]=r[32]
            r[36]=r[31]
            r[37]=(false)
            r[38]=upvalues[1][7]
            r[38][("lastMovePosition")]=r[35]
            r[39]=upvalues[1][7]
            r[39][("lastMove")]=r[36]
            r[40]=upvalues[1][7]
            r[40][("stuck")]=r[37]
            block=442
        elseif block == 267 then
            r[35]=upvalues[1][7]
            r[35] = r[35][("lastMove")]
            r[35] = r[31] - r[35]
            if not (r[35] > (0.55)) then block=442 else block=295 end
        elseif block == 295 then
            r[35]=(570806)
            r[35]=r[33] == r[35]
            if not r[35] then block=323 else block=316 end
        elseif block == 316 then
            r[25]=r[19] * r[15]
            block=323
        elseif block == 323 then
            r[35]=(true)
            r[36]=upvalues[1][7]
            r[36][("stuck")]=r[35]
            r[35]=(600613)
            r[35]=r[33] == r[35]
            if not r[35] then block=393 else block=365 end
        elseif block == 365 then
            r[13]=r[10] == r[3]
            r[25]=r[9] .. r[12]
            r[1]=r[22][(nil)]
            r[10]=r[11]
            block=393
        elseif block == 393 then
            r[35]=r[31]
            r[36]=r[32]
            r[37]=upvalues[1][7]
            r[37][("lastMove")]=r[35]
            r[38]=upvalues[1][7]
            r[38][("lastMovePosition")]=r[36]
            block=442
        elseif block == 442 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[73] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(422753)
            r[34]=upvalues[1][7]
            r[34] = r[34][("gemTarget")]
            r[35]=(490434)
            r[35]=r[33] == r[35]
            if not r[35] then block=50 else block=43 end
        elseif block == 43 then
            r[25]=r[24]
            block=50
        elseif block == 50 then
            r[36]=not r[34]
            r[35]=r[36]
            if r[35] then block=92 else block=71 end
        elseif block == 71 then
            r[36] = r[34][("Parent")]
            r[36]=not r[36]
            r[35]=r[36]
            block=92
        elseif block == 92 then
            if not r[35] then block=113 else block=99 end
        elseif block == 99 then
            return unpackValues(r, 0, -1)
        elseif block == 106 then
            block=113
        elseif block == 113 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[36] = r[34][("Position")]
            r[36] = r[36] - r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35] = r[35][("Magnitude")]
            r[36]=upvalues[3][7]
            r[36] = r[36][("gemCollectDistance")]
            if not (r[35] <= r[36]) then block=267 else block=176 end
        elseif block == 176 then
            r[35] = r[32] + (0.7)
            r[36]=upvalues[1][7]
            r[36] = r[36][("gemIgnored")]
            r[36][r[34]]=r[35]
            r[35]=(498706)
            r[35]=r[33] == r[35]
            if not r[35] then block=239 else block=225 end
        elseif block == 225 then
            r[18]=r[0] < r[7]
            r[13]=r[18] .. r[21]
            block=239
        elseif block == 239 then
            r[35]=nil
            r[36]=upvalues[1][7]
            r[36][("gemTarget")]=r[35]
            block=267
        elseif block == 267 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[74] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(181869)
            r[35]=not r[32]
            if not r[35] then block=127 else block=22 end
        elseif block == 22 then
            r[35]=nil
            r[36]=nil
            r[37]=upvalues[1][7]
            r[37][("assistMode")]=r[35]
            r[38]=upvalues[1][7]
            r[38][("assistTarget")]=r[36]
            r[35]=(198821)
            r[35]=r[34] == r[35]
            if not r[35] then block=99 else block=85 end
        elseif block == 85 then
            r[25]=r[16] .. r[15]
            r[12]=("autoGems")
            block=99
        elseif block == 99 then
            r[35]=nil
            r[36]=nil
            return unpackValues(r, 35, 36)
        elseif block == 120 then
            block=127
        elseif block == 127 then
            r[35]=(213626)
            r[35]=r[34] == r[35]
            if not r[35] then block=162 else block=148 end
        elseif block == 148 then
            r[12]=r[15] / r[18]
            r[25]=r[6] + r[13]
            block=162
        elseif block == 162 then
            r[35]=upvalues[1][7]
            r[35] = r[35][("assistMode")]
            if not (r[35] == ("Revive")) then block=421 else block=183 end
        elseif block == 183 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("reviveTarget")]
            r[35]=r[36]
            if not r[35] then block=239 else block=211 end
        elseif block == 211 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("reviveTarget")]
            r[36] = r[36][("Parent")]
            r[35]=r[36]
            block=239
        elseif block == 239 then
            if not r[35] then block=372 else block=246 end
        elseif block == 246 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[36]=upvalues[1][7]
            r[36] = r[36][("reviveTarget")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36]=(194698)
            r[36]=r[34] == r[36]
            if not r[36] then block=323 else block=302 end
        elseif block == 302 then
            r[19]=env[("assistMode")]
            r[15]=r[22] < r[6]
            r[1][r[13]]=r[4]
            block=323
        elseif block == 323 then
            if not r[35] then block=365 else block=330 end
        elseif block == 330 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("reviveTarget")]
            r[37]=("Revive")
            return unpackValues(r, 36, 37)
        elseif block == 358 then
            block=365
        elseif block == 365 then
            block=372
        elseif block == 372 then
            r[35]=nil
            r[36]=nil
            r[37]=upvalues[1][7]
            r[37][("assistMode")]=r[35]
            r[38]=upvalues[1][7]
            r[38][("assistTarget")]=r[36]
            block=736
        elseif block == 421 then
            r[35]=upvalues[1][7]
            r[35] = r[35][("assistMode")]
            if not (r[35] == ("Gem")) then block=736 else block=442 end
        elseif block == 442 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("assistTarget")]
            r[35]=r[36]
            if not r[35] then block=498 else block=470 end
        elseif block == 470 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("assistTarget")]
            r[36] = r[36][("Parent")]
            r[35]=r[36]
            block=498
        elseif block == 498 then
            if not r[35] then block=659 else block=505 end
        elseif block == 505 then
            r[35]=(182571)
            r[35]=r[34] == r[35]
            if not r[35] then block=540 else block=526 end
        elseif block == 526 then
            r[16]=r[4] < r[11]
            r[4]=r[0] + r[25]
            block=540
        elseif block == 540 then
            r[36]=upvalues[3][7]
            r[35]=r[36]
            r[36]=upvalues[1][7]
            r[36] = r[36][("assistTarget")]
            r[36] = r[36][("Position")]
            r[36] = r[36] - r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35] = r[35][("Magnitude")]
            r[36]=upvalues[4][7]
            r[36] = r[36][("gemMaxDistance")]
            if not (r[35] <= r[36]) then block=652 else block=617 end
        elseif block == 617 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("assistTarget")]
            r[37]=("Gem")
            return unpackValues(r, 36, 37)
        elseif block == 645 then
            block=652
        elseif block == 652 then
            block=659
        elseif block == 659 then
            r[35]=(247689)
            r[35]=r[34] == r[35]
            if not r[35] then block=687 else block=680 end
        elseif block == 680 then
            r[22]=r[15] .. r[6]
            block=687
        elseif block == 687 then
            r[35]=nil
            r[36]=nil
            r[37]=upvalues[1][7]
            r[37][("assistMode")]=r[35]
            r[38]=upvalues[1][7]
            r[38][("assistTarget")]=r[36]
            block=736
        elseif block == 736 then
            r[35]=nil
            r[36]=(224847)
            r[36]=r[34] == r[36]
            if not r[36] then block=778 else block=764 end
        elseif block == 764 then
            r[25]=r[12] - r[7]
            r[17]=r[3] == r[16]
            block=778
        elseif block == 778 then
            r[36]=upvalues[4][7]
            r[36] = r[36][("autoRevive")]
            if not r[36] then block=1072 else block=799 end
        elseif block == 799 then
            r[37]=upvalues[5][7]
            r[36]=r[37]
            r[37]=r[31]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            if not r[36] then block=1065 else block=834 end
        elseif block == 834 then
            r[38]=upvalues[2][7]
            r[37]=r[38]
            r[38]=r[36]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=(195895)
            r[38]=r[34] == r[38]
            if not r[38] then block=897 else block=883 end
        elseif block == 883 then
            r[19]=r[22] * r[14]
            r[20][(224847)]=r[7]
            block=897
        elseif block == 897 then
            r[38]=r[37]
            if not r[38] then block=981 else block=911 end
        elseif block == 911 then
            r[40]=upvalues[3][7]
            r[39]=r[40]
            r[40] = r[37][("Position")]
            r[40] = r[40] - r[31]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[39] = r[39][("Magnitude")]
            r[40]=upvalues[4][7]
            r[40] = r[40][("reviveMaxDistance")]
            r[39] = r[39] <= r[40]
            r[38]=r[39]
            block=981
        elseif block == 981 then
            if not r[38] then block=1058 else block=988 end
        elseif block == 988 then
            r[38]=(246235)
            r[38]=r[34] == r[38]
            if not r[38] then block=1037 else block=1009 end
        elseif block == 1009 then
            do local f=r[10]; local n=3; if n<0 then n=top-10-1 end; local m=24; if m==1 then r[10]=f(unpackValues(r,11,10+n)); top=11 elseif m==0 then f(unpackValues(r,11,10+n)); top=10 else local result=packValues(f(unpackValues(r,11,10+n))); if m<0 then m=result.n end; for i=1,m do r[10+i-1]=result[i] end; top=10+m end end
            r[0]=r[14] / r[15]
            r[17]=r[23] + r[18]
            r[3]=r[14] + r[14]
            block=1037
        elseif block == 1037 then
            r[38]=r[36]
            r[35]=r[38]
            block=1058
        elseif block == 1058 then
            block=1065
        elseif block == 1065 then
            block=1072
        elseif block == 1072 then
            r[36]=nil
            r[37]=upvalues[4][7]
            r[37] = r[37][("autoGems")]
            if not r[37] then block=1366 else block=1100 end
        elseif block == 1100 then
            r[38]=upvalues[6][7]
            r[37]=r[38]
            r[38]=r[33]
            r[39]=r[31]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[37]=upvalues[1][7]
            r[37] = r[37][("gemTarget")]
            r[38]=r[37]
            if not r[38] then block=1177 else block=1163 end
        elseif block == 1163 then
            r[39] = r[37][("Parent")]
            r[38]=r[39]
            block=1177
        elseif block == 1177 then
            if not r[38] then block=1359 else block=1184 end
        elseif block == 1184 then
            r[38]=(241581)
            r[38]=r[34] == r[38]
            if not r[38] then block=1226 else block=1205 end
        elseif block == 1205 then
            r[9]=r[4] .. r[20]
            r[14]=r[16][(181869)]
            r[19]=#r[21]
            block=1226
        elseif block == 1226 then
            r[39]=upvalues[3][7]
            r[38]=r[39]
            r[39] = r[37][("Position")]
            r[39] = r[39] - r[31]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[38] = r[38][("Magnitude")]
            r[39]=(226936)
            r[39]=r[34] == r[39]
            if not r[39] then block=1310 else block=1289 end
        elseif block == 1289 then
            r[24]=(224847)
            r[12][("reviveBeforeGems")]=r[5]
            r[6]=r[11]
            block=1310
        elseif block == 1310 then
            r[39]=upvalues[4][7]
            r[39] = r[39][("gemMaxDistance")]
            if not (r[38] <= r[39]) then block=1352 else block=1331 end
        elseif block == 1331 then
            r[39]=r[37]
            r[36]=r[39]
            block=1352
        elseif block == 1352 then
            block=1359
        elseif block == 1359 then
            block=1366
        elseif block == 1366 then
            r[38]=upvalues[4][7]
            r[38] = r[38][("reviveBeforeGems")]
            r[37]=r[38]
            if not r[37] then block=1401 else block=1394 end
        elseif block == 1394 then
            r[37]=r[35]
            block=1401
        elseif block == 1401 then
            if not r[37] then block=1499 else block=1408 end
        elseif block == 1408 then
            r[37]=("Revive")
            r[38]=r[35]
            r[39]=r[33]
            r[40]=upvalues[1][7]
            r[40][("assistMode")]=r[37]
            r[41]=upvalues[1][7]
            r[41][("assistTarget")]=r[38]
            r[42]=upvalues[1][7]
            r[42][("assistSince")]=r[39]
            r[37]=r[35]
            r[38]=("Revive")
            return unpackValues(r, 37, 38)
        elseif block == 1492 then
            block=1499
        elseif block == 1499 then
            r[37]=(227563)
            r[37]=r[34] == r[37]
            if not r[37] then block=1548 else block=1520 end
        elseif block == 1520 then
            r[13]=r[9][(213626)]
            r[3]=r[2]
            r[21]=r[4] < r[20]
            do local f=r[12]; local n=5; if n<0 then n=top-12-1 end; local m=14; if m==1 then r[12]=f(unpackValues(r,13,12+n)); top=13 elseif m==0 then f(unpackValues(r,13,12+n)); top=12 else local result=packValues(f(unpackValues(r,13,12+n))); if m<0 then m=result.n end; for i=1,m do r[12+i-1]=result[i] end; top=12+m end end
            block=1548
        elseif block == 1548 then
            if not r[36] then block=1646 else block=1555 end
        elseif block == 1555 then
            r[37]=("Gem")
            r[38]=r[36]
            r[39]=r[33]
            r[40]=upvalues[1][7]
            r[40][("assistMode")]=r[37]
            r[41]=upvalues[1][7]
            r[41][("assistTarget")]=r[38]
            r[42]=upvalues[1][7]
            r[42][("assistSince")]=r[39]
            r[37]=r[36]
            r[38]=("Gem")
            return unpackValues(r, 37, 38)
        elseif block == 1639 then
            block=1646
        elseif block == 1646 then
            if not r[35] then block=1793 else block=1653 end
        elseif block == 1653 then
            r[37]=(244417)
            r[37]=r[34] == r[37]
            if not r[37] then block=1702 else block=1674 end
        elseif block == 1674 then
            r[16]=r[25] == r[4]
            r[24]=r[5] == r[8]
            r[20]=r[24][r[23]]
            r[6]=r[23][(213626)]
            block=1702
        elseif block == 1702 then
            r[37]=("Revive")
            r[38]=r[35]
            r[39]=r[33]
            r[40]=upvalues[1][7]
            r[40][("assistMode")]=r[37]
            r[41]=upvalues[1][7]
            r[41][("assistTarget")]=r[38]
            r[42]=upvalues[1][7]
            r[42][("assistSince")]=r[39]
            r[37]=r[35]
            r[38]=("Revive")
            return unpackValues(r, 37, 38)
        elseif block == 1786 then
            block=1793
        elseif block == 1793 then
            r[37]=nil
            r[38]=nil
            return unpackValues(r, 37, 38)
        elseif block == 1814 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[75] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(54388)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=not r[34]
            if not r[34] then block=414 else block=43 end
        elseif block == 43 then
            r[34] = env[("Vector3")]
            r[34] = r[34][("zero")]
            r[35]=upvalues[2][7]
            r[35][("path")]=r[34]
            r[34]=nil
            r[35]=nil
            r[36]=("SafeZone")
            r[37]=upvalues[2][7]
            r[37][("goal")]=r[34]
            r[38]=upvalues[2][7]
            r[38][("goalSide")]=r[35]
            r[39]=upvalues[2][7]
            r[39][("goalMode")]=r[36]
            r[34]=(84802)
            r[34]=r[33] == r[34]
            if not r[34] then block=176 else block=155 end
        elseif block == 155 then
            r[16]=("edgeRisk")
            r[19]=r[12] == r[2]
            r[24]=#r[2]
            block=176
        elseif block == 176 then
            r[34]=(false)
            r[35]=(false)
            r[36]=upvalues[2][7]
            r[36][("routeActive")]=r[34]
            r[37]=upvalues[2][7]
            r[37][("routeComplete")]=r[35]
            r[34]=(false)
            r[35] = env[("Vector3")]
            r[35] = r[35][("zero")]
            r[36]=upvalues[2][7]
            r[36][("edgeRisk")]=r[34]
            r[37]=upvalues[2][7]
            r[37][("edgeDirection")]=r[35]
            r[34]=(56602)
            r[34]=r[33] == r[34]
            if not r[34] then block=309 else block=288 end
        elseif block == 288 then
            r[0]=("routeComplete")
            r[18]=("edgeDirection")
            r[25]=r[7][r[21]]
            block=309
        elseif block == 309 then
            r[34]=nil
            r[35]=nil
            r[36]=upvalues[2][7]
            r[36][("assistMode")]=r[34]
            r[37]=upvalues[2][7]
            r[37][("assistTarget")]=r[35]
            r[34]=upvalues[2][7]
            r[34] = r[34][("reviveStarted")]
            if not r[34] then block=400 else block=372 end
        elseif block == 372 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            block=400
        elseif block == 400 then
            return unpackValues(r, 0, -1)
        elseif block == 407 then
            block=414
        elseif block == 414 then
            r[34]=(82582)
            r[34]=r[33] == r[34]
            if not r[34] then block=449 else block=435 end
        elseif block == 435 then
            r[10]=("Position")
            r[6]=r[6][r[20]]
            block=449
        elseif block == 449 then
            r[34]=upvalues[4][7]
            r[34] = r[34][("runnerEnabled")]
            r[34]=not r[34]
            if not r[34] then block=519 else block=477 end
        elseif block == 477 then
            r[34]=(111320)
            r[34]=r[33] == r[34]
            if not r[34] then block=505 else block=498 end
        elseif block == 498 then
            r[25][(82582)]=r[24]
            block=505
        elseif block == 505 then
            return unpackValues(r, 0, -1)
        elseif block == 512 then
            block=519
        elseif block == 519 then
            r[35]=upvalues[5][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36]=upvalues[6][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=not r[34]
            r[36]=r[37]
            if r[36] then block=596 else block=582 end
        elseif block == 582 then
            r[37]=not r[35]
            r[36]=r[37]
            block=596
        elseif block == 596 then
            if not r[36] then block=617 else block=603 end
        elseif block == 603 then
            return unpackValues(r, 0, -1)
        elseif block == 610 then
            block=617
        elseif block == 617 then
            r[37]=upvalues[7][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36]=not r[36]
            if not r[36] then block=694 else block=652 end
        elseif block == 652 then
            r[36] = env[("Vector3")]
            r[36] = r[36][("zero")]
            r[37]=upvalues[2][7]
            r[37][("path")]=r[36]
            return unpackValues(r, 0, -1)
        elseif block == 687 then
            block=694
        elseif block == 694 then
            r[37]=upvalues[8][7]
            r[36]=r[37]
            r[37]=r[31]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=0; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=upvalues[9][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=0; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=upvalues[10][7]
            r[36]=r[37]
            r[37]=r[31]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=0; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[36]=(101722)
            r[36]=r[33] == r[36]
            if not r[36] then block=820 else block=792 end
        elseif block == 792 then
            r[12]=#r[23]
            r[14]=r[19][(54388)]
            r[5]=r[15] / r[11]
            r[19]=("assistMode")
            block=820
        elseif block == 820 then
            r[36] = r[34][("Position")]
            r[37]=(144876)
            r[37]=r[33] == r[37]
            if not r[37] then block=862 else block=848 end
        elseif block == 848 then
            r[19][r[25]]=r[12]
            r[3]=r[5] + r[16]
            block=862
        elseif block == 862 then
            r[38]=upvalues[11][7]
            r[37]=r[38]
            r[38]=r[36]
            r[39]=r[31]
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=upvalues[2][7]
            r[38] = r[38][("routeComplete")]
            if not r[38] then block=2003 else block=918 end
        elseif block == 918 then
            r[40]=upvalues[2][7]
            r[40] = r[40][("routeTargetSide")]
            r[42]=upvalues[12][7]
            r[42] = r[42][("a")]
            r[41]=r[42]
            if not r[41] then block=988 else block=960 end
        elseif block == 960 then
            r[42]=upvalues[12][7]
            r[42] = r[42][("a")]
            r[42] = r[42][("name")]
            r[41]=r[42]
            block=988
        elseif block == 988 then
            r[40] = r[40] == r[41]
            r[39]=r[40]
            if not r[39] then block=1030 else block=1009 end
        elseif block == 1009 then
            r[40]=upvalues[12][7]
            r[40] = r[40][("a")]
            r[39]=r[40]
            block=1030
        elseif block == 1030 then
            r[38]=r[39]
            if r[38] then block=1065 else block=1044 end
        elseif block == 1044 then
            r[39]=upvalues[12][7]
            r[39] = r[39][("b")]
            r[38]=r[39]
            block=1065
        elseif block == 1065 then
            r[41]=upvalues[2][7]
            r[41] = r[41][("routeCompletePosition")]
            r[40]=r[41]
            if not r[40] then block=1149 else block=1093 end
        elseif block == 1093 then
            r[42]=upvalues[13][7]
            r[41]=r[42]
            r[42]=upvalues[2][7]
            r[42] = r[42][("routeCompletePosition")]
            r[42] = r[36] - r[42]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[41][("Magnitude")]
            r[40]=r[41]
            block=1149
        elseif block == 1149 then
            r[39]=r[40]
            if r[39] then block=1177 else block=1163 end
        elseif block == 1163 then
            r[40]=(0)
            r[39]=r[40]
            block=1177
        elseif block == 1177 then
            r[40]=r[38]
            if not r[40] then block=1310 else block=1191 end
        elseif block == 1191 then
            r[43]=upvalues[14][7]
            r[42]=r[43]
            r[43]=r[36]
            r[44]=r[38]
            do local f=r[42]; local n=2; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[41]=r[42]
            if not r[41] then block=1303 else block=1240 end
        elseif block == 1240 then
            r[43] = r[39] >= (5)
            r[42]=r[43]
            if not r[42] then block=1296 else block=1261 end
        elseif block == 1261 then
            r[43]=upvalues[2][7]
            r[43] = r[43][("routeCompleteAt")]
            r[43] = r[31] - r[43]
            r[43] = r[43] >= (0.25)
            r[42]=r[43]
            block=1296
        elseif block == 1296 then
            r[41]=r[42]
            block=1303
        elseif block == 1303 then
            r[40]=r[41]
            block=1310
        elseif block == 1310 then
            r[41]=(59596)
            r[41]=r[33] == r[41]
            if not r[41] then block=1352 else block=1331 end
        elseif block == 1331 then
            r[21]=r[12] + r[3]
            r[19]=r[19] * r[20]
            r[0]=env[("Position")]
            block=1352
        elseif block == 1352 then
            if not r[40] then block=1625 else block=1359 end
        elseif block == 1359 then
            r[41]=(115517)
            r[41]=r[33] == r[41]
            if not r[41] then block=1394 else block=1380 end
        elseif block == 1380 then
            r[16]=r[10] * r[4]
            r[14]=(84802)
            block=1394
        elseif block == 1394 then
            r[41]=(false)
            r[42]=(false)
            r[43]=upvalues[2][7]
            r[43][("routeActive")]=r[41]
            r[44]=upvalues[2][7]
            r[44][("routeComplete")]=r[42]
            r[41]=nil
            r[42]=nil
            r[43]=upvalues[2][7]
            r[43][("routeStartSide")]=r[41]
            r[44]=upvalues[2][7]
            r[44][("routeTargetSide")]=r[42]
            r[41]=nil
            r[42] = env[("math")]
            r[42] = r[42][("huge")]
            r[42]=-r[42]
            r[43]=upvalues[2][7]
            r[43][("routeCompletePosition")]=r[41]
            r[44]=upvalues[2][7]
            r[44][("routeCompleteAt")]=r[42]
            r[41]=nil
            r[42]=nil
            r[43]=upvalues[2][7]
            r[43][("goal")]=r[41]
            r[44]=upvalues[2][7]
            r[44][("goalSide")]=r[42]
            r[42]=upvalues[11][7]
            r[41]=r[42]
            r[42]=r[36]
            r[43]=r[31]
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[37]=r[41]
            block=1625
        elseif block == 1625 then
            r[41]=(85539)
            r[41]=r[33] == r[41]
            if not r[41] then block=1660 else block=1646 end
        elseif block == 1646 then
            r[8]=("assistTarget")
            r[14]=env[("goal")]
            block=1660
        elseif block == 1660 then
            r[41]=upvalues[2][7]
            r[41] = r[41][("routeComplete")]
            if not r[41] then block=1996 else block=1681 end
        elseif block == 1681 then
            r[41]=(132552)
            r[41]=r[33] == r[41]
            if not r[41] then block=1709 else block=1702 end
        elseif block == 1702 then
            r[4]=env[("assistMode")]
            block=1709
        elseif block == 1709 then
            r[41] = env[("Vector3")]
            r[41] = r[41][("zero")]
            r[42]=("SafeZone")
            r[43]=upvalues[2][7]
            r[43][("path")]=r[41]
            r[44]=upvalues[2][7]
            r[44][("goalMode")]=r[42]
            r[41]=nil
            r[42]=nil
            r[43]=upvalues[2][7]
            r[43][("assistMode")]=r[41]
            r[44]=upvalues[2][7]
            r[44][("assistTarget")]=r[42]
            r[41]=upvalues[2][7]
            r[41] = r[41][("reviveStarted")]
            if not r[41] then block=1849 else block=1821 end
        elseif block == 1821 then
            r[42]=upvalues[3][7]
            r[41]=r[42]
            do local f=r[41]; local n=0; if n<0 then n=top-41-1 end; local m=0; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            block=1849
        elseif block == 1849 then
            r[41]=(141479)
            r[41]=r[33] == r[41]
            if not r[41] then block=1891 else block=1870 end
        elseif block == 1870 then
            r[14]=r[19] < r[24]
            r[22]=r[11] .. r[19]
            r[10]=env[("goalSide")]
            block=1891
        elseif block == 1891 then
            r[42]=r[35]
            r[41] = r[42][("Move")]
            r[43] = env[("Vector3")]
            r[43] = r[43][("zero")]
            r[44]=(false)
            do local f=r[41]; local n=3; if n<0 then n=top-41-1 end; local m=0; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41]=(69053)
            r[41]=r[33] == r[41]
            if not r[41] then block=1982 else block=1954 end
        elseif block == 1954 then
            r[7]=r[0][(54388)]
            r[24]=r[10]
            r[0]=r[25][r[0]]
            r[5]=r[18][r[20]]
            block=1982
        elseif block == 1982 then
            return unpackValues(r, 0, -1)
        elseif block == 1989 then
            block=1996
        elseif block == 1996 then
            block=2003
        elseif block == 2003 then
            r[38]=(73524)
            r[38]=r[33] == r[38]
            if not r[38] then block=2038 else block=2024 end
        elseif block == 2024 then
            do local f=r[12]; local n=25; if n<0 then n=top-12-1 end; local m=17; if m==1 then r[12]=f(unpackValues(r,13,12+n)); top=13 elseif m==0 then f(unpackValues(r,13,12+n)); top=12 else local result=packValues(f(unpackValues(r,13,12+n))); if m<0 then m=result.n end; for i=1,m do r[12+i-1]=result[i] end; top=12+m end end
            r[2]=#r[7]
            block=2038
        elseif block == 2038 then
            r[38]=not r[37]
            if not r[38] then block=2241 else block=2052 end
        elseif block == 2052 then
            r[39]=upvalues[15][7]
            r[38]=r[39]
            r[39]=r[36]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not r[38] then block=2150 else block=2087 end
        elseif block == 2087 then
            r[39]=r[38]
            r[40]=r[38]
            r[41]=("SafeZone")
            r[37]=r[39]
            r[42]=upvalues[2][7]
            r[42][("goal")]=r[40]
            r[43]=upvalues[2][7]
            r[43][("goalMode")]=r[41]
            block=2234
        elseif block == 2150 then
            r[40]=upvalues[13][7]
            r[39]=r[40]
            r[40] = r[34][("CFrame")]
            r[40] = r[40][("LookVector")]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40] = r[39][("Magnitude")]
            if not (r[40] > (0.05)) then block=2234 else block=2199 end
        elseif block == 2199 then
            r[40] = r[39][("Unit")]
            r[40] = r[40] * (40)
            r[40] = r[36] + r[40]
            r[37]=r[40]
            block=2234
        elseif block == 2234 then
            block=2241
        elseif block == 2241 then
            r[38]=not r[37]
            if not r[38] then block=2339 else block=2255 end
        elseif block == 2255 then
            r[39]=r[35]
            r[38] = r[39][("Move")]
            r[40] = env[("Vector3")]
            r[40] = r[40][("zero")]
            r[41]=(false)
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[38] = env[("Vector3")]
            r[38] = r[38][("zero")]
            r[39]=upvalues[2][7]
            r[39][("path")]=r[38]
            return unpackValues(r, 0, -1)
        elseif block == 2332 then
            block=2339
        elseif block == 2339 then
            r[38]=(59501)
            r[38]=r[33] == r[38]
            if not r[38] then block=2388 else block=2360 end
        elseif block == 2360 then
            r[22]=#r[19]
            r[16]=r[10] .. r[24]
            r[11]=#r[2]
            r[6]=r[23][(54388)]
            block=2388
        elseif block == 2388 then
            r[39]=upvalues[16][7]
            r[38]=r[39]
            r[39]=r[36]
            r[40]=r[37]
            r[41]=r[31]
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=2; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[40]=r[37]
            r[41]=r[38]
            if not r[41] then block=2465 else block=2451 end
        elseif block == 2451 then
            r[42] = r[39] == ("Revive")
            r[41]=r[42]
            block=2465
        elseif block == 2465 then
            if not r[41] then block=2927 else block=2472 end
        elseif block == 2472 then
            r[41]=r[38]
            r[42]=upvalues[2][7]
            r[42][("reviveTarget")]=r[41]
            r[41]=(90552)
            r[41]=r[33] == r[41]
            if not r[41] then block=2528 else block=2514 end
        elseif block == 2514 then
            r[13]=(111320)
            r[5]=r[7] .. r[20]
            block=2528
        elseif block == 2528 then
            r[42]=upvalues[5][7]
            r[41]=r[42]
            r[42]=r[38]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            if not r[41] then block=2920 else block=2563 end
        elseif block == 2563 then
            r[42]=(110397)
            r[42]=r[33] == r[42]
            if not r[42] then block=2598 else block=2584 end
        elseif block == 2584 then
            r[20][r[2]]=r[23]
            r[23]=r[25]
            block=2598
        elseif block == 2598 then
            r[43]=upvalues[13][7]
            r[42]=r[43]
            r[43] = r[41][("Position")]
            r[43] = r[43] - r[36]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42] = r[42][("Magnitude")]
            r[44]=upvalues[17][7]
            r[44] = r[44] + (0.75)
            r[44] = r[42] <= r[44]
            r[43]=r[44]
            if r[43] then block=2696 else block=2675 end
        elseif block == 2675 then
            r[44]=upvalues[2][7]
            r[44] = r[44][("reviveStarted")]
            r[43]=r[44]
            block=2696
        elseif block == 2696 then
            if not r[43] then block=2745 else block=2703 end
        elseif block == 2703 then
            r[44]=upvalues[18][7]
            r[43]=r[44]
            r[44]=r[31]
            r[45]=r[36]
            do local f=r[43]; local n=2; if n<0 then n=top-43-1 end; local m=0; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            block=2745
        elseif block == 2745 then
            r[43]=(78513)
            r[43]=r[33] == r[43]
            if not r[43] then block=2787 else block=2766 end
        elseif block == 2766 then
            r[7][r[14]]=r[23]
            r[18]=r[17] * r[17]
            r[6]=r[3] == r[17]
            block=2787
        elseif block == 2787 then
            r[44]=upvalues[2][7]
            r[44] = r[44][("reviveStarted")]
            r[44]=not r[44]
            r[43]=r[44]
            if not r[43] then block=2843 else block=2822 end
        elseif block == 2822 then
            r[44]=upvalues[17][7]
            r[44] = r[42] > r[44]
            r[43]=r[44]
            block=2843
        elseif block == 2843 then
            if not r[43] then block=2871 else block=2850 end
        elseif block == 2850 then
            r[43] = r[41][("Position")]
            r[40]=r[43]
            block=2913
        elseif block == 2871 then
            r[43]=upvalues[2][7]
            r[43] = r[43][("reviveStarted")]
            if not r[43] then block=2913 else block=2892 end
        elseif block == 2892 then
            r[43] = r[41][("Position")]
            r[40]=r[43]
            block=2913
        elseif block == 2913 then
            block=2920
        elseif block == 2920 then
            block=3102
        elseif block == 2927 then
            r[41]=r[38]
            if not r[41] then block=2983 else block=2941 end
        elseif block == 2941 then
            r[43] = r[39] == ("Gem")
            r[42]=r[43]
            if not r[42] then block=2976 else block=2962 end
        elseif block == 2962 then
            r[43] = r[38][("Parent")]
            r[42]=r[43]
            block=2976
        elseif block == 2976 then
            r[41]=r[42]
            block=2983
        elseif block == 2983 then
            if not r[41] then block=3081 else block=2990 end
        elseif block == 2990 then
            r[41]=(77159)
            r[41]=r[33] == r[41]
            if not r[41] then block=3039 else block=3011 end
        elseif block == 3011 then
            r[7]=r[13] .. r[20]
            r[1]=env[("goal")]
            r[11]=r[7] .. r[0]
            r[14]=r[8] + r[19]
            block=3039
        elseif block == 3039 then
            r[41] = r[38][("Position")]
            r[40]=r[41]
            r[41]=("Gem")
            r[42]=upvalues[2][7]
            r[42][("goalMode")]=r[41]
            block=3102
        elseif block == 3081 then
            r[41]=("SafeZone")
            r[42]=upvalues[2][7]
            r[42][("goalMode")]=r[41]
            block=3102
        elseif block == 3102 then
            r[41]=upvalues[2][7]
            r[41] = r[41][("reviveStarted")]
            if not r[41] then block=3480 else block=3123 end
        elseif block == 3123 then
            r[42]=upvalues[2][7]
            r[42] = r[42][("reviveTarget")]
            r[41]=r[42]
            if not r[41] then block=3193 else block=3151 end
        elseif block == 3151 then
            r[43]=upvalues[5][7]
            r[42]=r[43]
            r[43]=upvalues[2][7]
            r[43] = r[43][("reviveTarget")]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[41]=r[42]
            block=3193
        elseif block == 3193 then
            if not r[41] then block=3452 else block=3200 end
        elseif block == 3200 then
            r[43]=upvalues[13][7]
            r[42]=r[43]
            r[43] = r[41][("Position")]
            r[43] = r[43] - r[36]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42] = r[42][("Magnitude")]
            r[43]=(60137)
            r[43]=r[33] == r[43]
            if not r[43] then block=3270 else block=3263 end
        elseif block == 3263 then
            r[20]=r[11] / r[18]
            block=3270
        elseif block == 3270 then
            r[43]=upvalues[17][7]
            r[43] = r[43] + (1.25)
            if not (r[42] > r[43]) then block=3368 else block=3291 end
        elseif block == 3291 then
            r[43]=(66969)
            r[43]=r[33] == r[43]
            if not r[43] then block=3340 else block=3312 end
        elseif block == 3312 then
            r[24]=r[21] / r[23]
            do local f=r[15]; local n=5; if n<0 then n=top-15-1 end; local m=1; if m==1 then r[15]=f(unpackValues(r,16,15+n)); top=16 elseif m==0 then f(unpackValues(r,16,15+n)); top=15 else local result=packValues(f(unpackValues(r,16,15+n))); if m<0 then m=result.n end; for i=1,m do r[15+i-1]=result[i] end; top=15+m end end
            r[25]=("goalMode")
            r[5]=r[12][("routeActive")]
            block=3340
        elseif block == 3340 then
            r[44]=upvalues[3][7]
            r[43]=r[44]
            do local f=r[43]; local n=0; if n<0 then n=top-43-1 end; local m=0; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            block=3445
        elseif block == 3368 then
            r[44]=r[35]
            r[43] = r[44][("Move")]
            r[45] = env[("Vector3")]
            r[45] = r[45][("zero")]
            r[46]=(false)
            do local f=r[43]; local n=3; if n<0 then n=top-43-1 end; local m=0; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[43] = env[("Vector3")]
            r[43] = r[43][("zero")]
            r[44]=upvalues[2][7]
            r[44][("path")]=r[43]
            return unpackValues(r, 0, -1)
        elseif block == 3445 then
            block=3473
        elseif block == 3452 then
            r[43]=upvalues[3][7]
            r[42]=r[43]
            do local f=r[42]; local n=0; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            block=3473
        elseif block == 3473 then
            block=3480
        elseif block == 3480 then
            r[42]=upvalues[19][7]
            r[41]=r[42]
            r[42]=r[31]
            r[43]=r[36]
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=0; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[42]=upvalues[20][7]
            r[41]=r[42]
            r[42]=r[31]
            r[43]=r[36]
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[42]=(112215)
            r[42]=r[33] == r[42]
            if not r[42] then block=3578 else block=3571 end
        elseif block == 3571 then
            r[12]=r[22] + r[1]
            block=3578
        elseif block == 3578 then
            r[43]=upvalues[13][7]
            r[42]=r[43]
            r[43] = r[40] - r[36]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42] = r[42][("Magnitude")]
            r[43]=(64728)
            r[43]=r[33] == r[43]
            if not r[43] then block=3655 else block=3634 end
        elseif block == 3634 then
            r[16][r[20]]=r[14]
            r[24]=r[8]
            r[3]=("routeComplete")
            block=3655
        elseif block == 3655 then
            r[45]=upvalues[2][7]
            r[45] = r[45][("goalMode")]
            r[45] = r[45] == ("Gem")
            r[44]=r[45]
            if not r[44] then block=3711 else block=3690 end
        elseif block == 3690 then
            r[45]=upvalues[4][7]
            r[45] = r[45][("gemCollectDistance")]
            r[44]=r[45]
            block=3711
        elseif block == 3711 then
            r[43]=r[44]
            if r[43] then block=3739 else block=3725 end
        elseif block == 3725 then
            r[44]=(2.5)
            r[43]=r[44]
            block=3739
        elseif block == 3739 then
            if not (r[42] <= r[43]) then block=4341 else block=3746 end
        elseif block == 3746 then
            r[44]=(151995)
            r[44]=r[33] == r[44]
            if not r[44] then block=3795 else block=3767 end
        elseif block == 3767 then
            r[11]=r[19] .. r[3]
            r[23]=r[15] / r[8]
            r[12]=r[17] * r[9]
            r[1][("edgeDirection")]=r[5]
            block=3795
        elseif block == 3795 then
            r[44]=upvalues[2][7]
            r[44] = r[44][("goalMode")]
            if not (r[44] == ("Gem")) then block=3935 else block=3816 end
        elseif block == 3816 then
            r[45]=upvalues[21][7]
            r[44]=r[45]
            r[45]=r[36]
            r[46]=r[31]
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=0; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[44]=nil
            r[45]=nil
            r[46]=upvalues[2][7]
            r[46][("assistMode")]=r[44]
            r[47]=upvalues[2][7]
            r[47][("assistTarget")]=r[45]
            r[44]=("SafeZone")
            r[45]=upvalues[2][7]
            r[45][("goalMode")]=r[44]
            r[44]=r[37]
            r[40]=r[44]
            block=4334
        elseif block == 3935 then
            r[44]=upvalues[2][7]
            r[44] = r[44][("goalMode")]
            if not (r[44] == ("SafeZone")) then block=4334 else block=3956 end
        elseif block == 3956 then
            r[44]=(79618)
            r[44]=r[33] == r[44]
            if not r[44] then block=3991 else block=3977 end
        elseif block == 3977 then
            r[3]=r[14] .. r[13]
            r[0]=env[("routeComplete")]
            block=3991
        elseif block == 3991 then
            r[45] = env[("select")]
            r[44]=r[45]
            r[45]=(1)
            r[47]=upvalues[22][7]
            r[46]=r[47]
            r[47]=r[36]
            do local f=r[46]; local n=1; if n<0 then n=top-46-1 end; local m=-1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            do local f=r[44]; local n=-1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(62282)
            r[45]=r[33] == r[45]
            if not r[45] then block=4075 else block=4068 end
        elseif block == 4068 then
            r[25][("path")]=r[6]
            block=4075
        elseif block == 4075 then
            r[45]=upvalues[2][7]
            r[45] = r[45][("routeComplete")]
            if not r[45] then block=4180 else block=4096 end
        elseif block == 4096 then
            r[46]=r[35]
            r[45] = r[46][("Move")]
            r[47] = env[("Vector3")]
            r[47] = r[47][("zero")]
            r[48]=(false)
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=0; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[45] = env[("Vector3")]
            r[45] = r[45][("zero")]
            r[46]=upvalues[2][7]
            r[46][("path")]=r[45]
            return unpackValues(r, 0, -1)
        elseif block == 4173 then
            block=4180
        elseif block == 4180 then
            r[45]=(141693)
            r[45]=r[33] == r[45]
            if not r[45] then block=4229 else block=4201 end
        elseif block == 4201 then
            r[23]=#r[2]
            r[17]=env[(144876)]
            r[18]=r[18] + r[0]
            r[24]=#r[2]
            block=4229
        elseif block == 4229 then
            r[45]=r[44]
            if r[45] then block=4250 else block=4243 end
        elseif block == 4243 then
            r[45]=r[37]
            block=4250
        elseif block == 4250 then
            r[40]=r[45]
            r[45]=(74085)
            r[45]=r[33] == r[45]
            if not r[45] then block=4306 else block=4278 end
        elseif block == 4278 then
            r[17]=r[13] - r[22]
            r[1]=r[17]
            r[19]=r[2]
            r[12]=r[23][r[23]]
            block=4306
        elseif block == 4306 then
            r[45]=r[40]
            r[46]=upvalues[2][7]
            r[46][("goal")]=r[45]
            block=4334
        elseif block == 4334 then
            block=4341
        elseif block == 4341 then
            r[44]=not r[40]
            if not r[44] then block=4474 else block=4355 end
        elseif block == 4355 then
            r[44]=(151077)
            r[44]=r[33] == r[44]
            if not r[44] then block=4390 else block=4376 end
        elseif block == 4376 then
            r[8]=r[17] * r[0]
            r[25]=r[21] / r[10]
            block=4390
        elseif block == 4390 then
            r[45]=r[35]
            r[44] = r[45][("Move")]
            r[46] = env[("Vector3")]
            r[46] = r[46][("zero")]
            r[47]=(false)
            do local f=r[44]; local n=3; if n<0 then n=top-44-1 end; local m=0; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[44] = env[("Vector3")]
            r[44] = r[44][("zero")]
            r[45]=upvalues[2][7]
            r[45][("path")]=r[44]
            return unpackValues(r, 0, -1)
        elseif block == 4467 then
            block=4474
        elseif block == 4474 then
            r[44]=(65597)
            r[44]=r[33] == r[44]
            if not r[44] then block=4509 else block=4495 end
        elseif block == 4495 then
            r[20]=r[23][("SafeZone")]
            r[5]=("routeActive")
            block=4509
        elseif block == 4509 then
            r[45]=upvalues[13][7]
            r[44]=r[45]
            r[45] = r[40] - r[36]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(116006)
            r[45]=r[33] == r[45]
            if not r[45] then block=4565 else block=4558 end
        elseif block == 4558 then
            r[17]=r[23] == r[0]
            block=4565
        elseif block == 4565 then
            r[45] = r[44][("Magnitude")]
            if not (r[45] < (0.05)) then block=4782 else block=4579 end
        elseif block == 4579 then
            r[45]=(111533)
            r[45]=r[33] == r[45]
            if not r[45] then block=4621 else block=4600 end
        elseif block == 4600 then
            r[22][r[8]]=r[9]
            r[0]=r[22] * r[23]
            r[10][r[21]]=r[19]
            block=4621
        elseif block == 4621 then
            r[46]=r[35]
            r[45] = r[46][("Move")]
            r[47] = env[("Vector3")]
            r[47] = r[47][("zero")]
            r[48]=(false)
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=0; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[45]=(126122)
            r[45]=r[33] == r[45]
            if not r[45] then block=4691 else block=4684 end
        elseif block == 4684 then
            r[9]=r[21] == r[22]
            block=4691
        elseif block == 4691 then
            r[45] = env[("Vector3")]
            r[45] = r[45][("zero")]
            r[46]=upvalues[2][7]
            r[46][("path")]=r[45]
            r[45]=(121996)
            r[45]=r[33] == r[45]
            if not r[45] then block=4768 else block=4740 end
        elseif block == 4740 then
            r[0]=r[7][r[24]]
            r[12][r[21]]=r[11]
            do local f=r[0]; local n=15; if n<0 then n=top-0-1 end; local m=2; if m==1 then r[0]=f(unpackValues(r,1,0+n)); top=1 elseif m==0 then f(unpackValues(r,1,0+n)); top=0 else local result=packValues(f(unpackValues(r,1,0+n))); if m<0 then m=result.n end; for i=1,m do r[0+i-1]=result[i] end; top=0+m end end
            r[6][("SafeZone")]=r[6]
            block=4768
        elseif block == 4768 then
            return unpackValues(r, 0, -1)
        elseif block == 4775 then
            block=4782
        elseif block == 4782 then
            r[45]=(117037)
            r[45]=r[33] == r[45]
            if not r[45] then block=4824 else block=4803 end
        elseif block == 4803 then
            r[18][("assistTarget")]=r[20]
            r[6]=env[("routeTargetSide")]
            r[19]=r[3] + r[19]
            block=4824
        elseif block == 4824 then
            r[46]=upvalues[2][7]
            r[46] = r[46][("goalMode")]
            r[46] = r[46] == ("SafeZone")
            r[45]=r[46]
            if not r[45] then block=4880 else block=4859 end
        elseif block == 4859 then
            r[46]=upvalues[2][7]
            r[46] = r[46][("goal")]
            r[45]=r[46]
            block=4880
        elseif block == 4880 then
            if not r[45] then block=5426 else block=4887 end
        elseif block == 4887 then
            r[46] = env[("Vector3")]
            r[46] = r[46][("new")]
            r[45]=r[46]
            r[46]=upvalues[2][7]
            r[46] = r[46][("goal")]
            r[46] = r[46][("X")]
            r[47] = r[36][("Y")]
            r[48]=upvalues[2][7]
            r[48] = r[48][("goal")]
            r[48] = r[48][("Z")]
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[40]=r[45]
            r[46]=upvalues[13][7]
            r[45]=r[46]
            r[46] = r[40] - r[36]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[44]=r[45]
            r[45] = r[44][("Magnitude")]
            if not (r[45] < (0.05)) then block=5419 else block=5020 end
        elseif block == 5020 then
            r[46] = env[("select")]
            r[45]=r[46]
            r[46]=(1)
            r[48]=upvalues[22][7]
            r[47]=r[48]
            r[48]=r[36]
            do local f=r[47]; local n=1; if n<0 then n=top-47-1 end; local m=-1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            do local f=r[45]; local n=-1; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[46]=r[45]
            if r[46] then block=5097 else block=5090 end
        elseif block == 5090 then
            r[46]=r[40]
            block=5097
        elseif block == 5097 then
            r[40]=r[46]
            r[46]=(151643)
            r[46]=r[33] == r[46]
            if not r[46] then block=5132 else block=5125 end
        elseif block == 5125 then
            do local f=r[2]; local n=15; if n<0 then n=top-2-1 end; local m=21; if m==1 then r[2]=f(unpackValues(r,3,2+n)); top=3 elseif m==0 then f(unpackValues(r,3,2+n)); top=2 else local result=packValues(f(unpackValues(r,3,2+n))); if m<0 then m=result.n end; for i=1,m do r[2+i-1]=result[i] end; top=2+m end end
            block=5132
        elseif block == 5132 then
            r[46]=r[40]
            r[47]=upvalues[2][7]
            r[47][("goal")]=r[46]
            r[46]=(105822)
            r[46]=r[33] == r[46]
            if not r[46] then block=5202 else block=5174 end
        elseif block == 5174 then
            r[0]=env[("reviveStarted")]
            r[11][("Position")]=r[23]
            r[5]=r[6] * r[12]
            r[5]=("assistMode")
            block=5202
        elseif block == 5202 then
            r[47]=upvalues[13][7]
            r[46]=r[47]
            r[47] = r[40] - r[36]
            do local f=r[46]; local n=1; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[44]=r[46]
            r[46]=(147828)
            r[46]=r[33] == r[46]
            if not r[46] then block=5279 else block=5258 end
        elseif block == 5258 then
            r[12]=r[5] .. r[5]
            r[22][(nil)]=r[24]
            r[8]=#r[14]
            block=5279
        elseif block == 5279 then
            r[46] = r[44][("Magnitude")]
            if not (r[46] < (0.05)) then block=5412 else block=5293 end
        elseif block == 5293 then
            r[46]=(151263)
            r[46]=r[33] == r[46]
            if not r[46] then block=5328 else block=5314 end
        elseif block == 5314 then
            r[21][r[10]]=r[21]
            r[20]=env[(101722)]
            block=5328
        elseif block == 5328 then
            r[47]=r[35]
            r[46] = r[47][("Move")]
            r[48] = env[("Vector3")]
            r[48] = r[48][("zero")]
            r[49]=(false)
            do local f=r[46]; local n=3; if n<0 then n=top-46-1 end; local m=0; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[46] = env[("Vector3")]
            r[46] = r[46][("zero")]
            r[47]=upvalues[2][7]
            r[47][("path")]=r[46]
            return unpackValues(r, 0, -1)
        elseif block == 5405 then
            block=5412
        elseif block == 5412 then
            block=5419
        elseif block == 5419 then
            block=5426
        elseif block == 5426 then
            r[45]=(149616)
            r[45]=r[33] == r[45]
            if not r[45] then block=5461 else block=5447 end
        elseif block == 5447 then
            r[16]=r[15][(84802)]
            r[18]=r[2] .. r[24]
            block=5461
        elseif block == 5461 then
            r[45] = r[44][("Unit")]
            r[44]=r[45]
            r[46]=upvalues[4][7]
            r[46] = r[46][("avoidCatchers")]
            r[45]=r[46]
            if not r[45] then block=5524 else block=5503 end
        elseif block == 5503 then
            r[46]=#r[41]
            r[46] = r[46] > (0)
            r[45]=r[46]
            block=5524
        elseif block == 5524 then
            if not r[45] then block=5629 else block=5531 end
        elseif block == 5531 then
            r[45]=(127532)
            r[45]=r[33] == r[45]
            if not r[45] then block=5573 else block=5552 end
        elseif block == 5552 then
            r[1]=r[2][r[8]]
            r[12][r[10]]=r[20]
            r[17][(54388)]=r[12]
            block=5573
        elseif block == 5573 then
            r[46]=upvalues[23][7]
            r[45]=r[46]
            r[46]=r[36]
            r[47]=r[40]
            r[48]=r[41]
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[44]=r[45]
            block=5629
        elseif block == 5629 then
            r[45] = r[41][(1)]
            r[46]=(70690)
            r[46]=r[33] == r[46]
            if not r[46] then block=5671 else block=5657 end
        elseif block == 5657 then
            r[0]=r[15] - r[23]
            r[22]=r[21] / r[16]
            block=5671
        elseif block == 5671 then
            r[46]=(false)
            r[48]=upvalues[4][7]
            r[48] = r[48][("avoidCatchers")]
            r[47]=r[48]
            if not r[47] then block=5832 else block=5706 end
        elseif block == 5706 then
            r[48]=r[45]
            if not r[48] then block=5825 else block=5720 end
        elseif block == 5720 then
            r[50] = r[45][("collisionRisk")]
            r[49]=r[50]
            if r[49] then block=5818 else block=5741 end
        elseif block == 5741 then
            r[51] = r[45][("tackle")]
            r[50]=r[51]
            if r[50] then block=5811 else block=5762 end
        elseif block == 5762 then
            r[52] = r[45][("preTackle")]
            r[51]=r[52]
            if not r[51] then block=5804 else block=5783 end
        elseif block == 5783 then
            r[52] = r[45][("closing")]
            r[52] = r[52] > (0)
            r[51]=r[52]
            block=5804
        elseif block == 5804 then
            r[50]=r[51]
            block=5811
        elseif block == 5811 then
            r[49]=r[50]
            block=5818
        elseif block == 5818 then
            r[48]=r[49]
            block=5825
        elseif block == 5825 then
            r[47]=r[48]
            block=5832
        elseif block == 5832 then
            if not r[47] then block=6931 else block=5839 end
        elseif block == 5839 then
            r[47]=(142935)
            r[47]=r[33] == r[47]
            if not r[47] then block=5867 else block=5860 end
        elseif block == 5860 then
            r[23]=("runnerEnabled")
            block=5867
        elseif block == 5867 then
            r[48]=upvalues[13][7]
            r[47]=r[48]
            r[48] = r[45][("intercept")]
            r[48] = r[36] - r[48]
            do local f=r[47]; local n=1; if n<0 then n=top-47-1 end; local m=1; if m==1 then r[47]=f(unpackValues(r,48,47+n)); top=48 elseif m==0 then f(unpackValues(r,48,47+n)); top=47 else local result=packValues(f(unpackValues(r,48,47+n))); if m<0 then m=result.n end; for i=1,m do r[47+i-1]=result[i] end; top=47+m end end
            r[48] = r[47][("Magnitude")]
            if not (r[48] > (0.05)) then block=6924 else block=5916 end
        elseif block == 5916 then
            r[48]=(72385)
            r[48]=r[33] == r[48]
            if not r[48] then block=5944 else block=5937 end
        elseif block == 5937 then
            r[21]=r[23] < r[6]
            block=5944
        elseif block == 5944 then
            r[48] = r[47][("Unit")]
            r[49]=(112980)
            r[49]=r[33] == r[49]
            if not r[49] then block=5993 else block=5972 end
        elseif block == 5972 then
            r[6]=r[13][r[1]]
            r[11]=r[4] * r[22]
            do local f=r[21]; local n=8; if n<0 then n=top-21-1 end; local m=20; if m==1 then r[21]=f(unpackValues(r,22,21+n)); top=22 elseif m==0 then f(unpackValues(r,22,21+n)); top=21 else local result=packValues(f(unpackValues(r,22,21+n))); if m<0 then m=result.n end; for i=1,m do r[21+i-1]=result[i] end; top=21+m end end
            block=5993
        elseif block == 5993 then
            r[49]={}
            r[49][(1)]=r[48]
            r[51]=upvalues[24][7]
            r[50]=r[51]
            r[51]=r[48]
            r[52]=(35)
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[49][(2)]=r[50]
            r[51]=upvalues[24][7]
            r[50]=r[51]
            r[51]=r[48]
            r[52]=(-35)
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[49][(3)]=r[50]
            r[51]=upvalues[24][7]
            r[50]=r[51]
            r[51]=r[48]
            r[52]=(70)
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[49][(4)]=r[50]
            r[51]=upvalues[24][7]
            r[50]=r[51]
            r[51]=r[48]
            r[52]=(-70)
            do local f=r[50]; local n=2; if n<0 then n=top-50-1 end; local m=-1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            do local n=-1; if n<0 then n=top-49-1 end; for i=1,n do r[49][4+i]=r[49+i] end end
            r[50]=(54835)
            r[50]=r[33] == r[50]
            if not r[50] then block=6203 else block=6196 end
        elseif block == 6196 then
            r[16]=r[21]
            block=6203
        elseif block == 6203 then
            r[50]=r[44]
            r[51]=(138105)
            r[51]=r[33] == r[51]
            if not r[51] then block=6259 else block=6231 end
        elseif block == 6231 then
            r[6][r[10]]=r[4]
            r[14]=r[13] - r[10]
            r[18]=r[2][(144876)]
            do local f=r[8]; local n=15; if n<0 then n=top-8-1 end; local m=14; if m==1 then r[8]=f(unpackValues(r,9,8+n)); top=9 elseif m==0 then f(unpackValues(r,9,8+n)); top=8 else local result=packValues(f(unpackValues(r,9,8+n))); if m<0 then m=result.n end; for i=1,m do r[8+i-1]=result[i] end; top=8+m end end
            block=6259
        elseif block == 6259 then
            r[52]=upvalues[25][7]
            r[51]=r[52]
            r[52]=r[36]
            r[53]=r[44]
            r[54]=r[41]
            do local f=r[51]; local n=3; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[52]=(106135)
            r[52]=r[33] == r[52]
            if not r[52] then block=6343 else block=6322 end
        elseif block == 6322 then
            r[23]=r[23]
            r[15]=r[13] * r[14]
            do local f=r[13]; local n=8; if n<0 then n=top-13-1 end; local m=25; if m==1 then r[13]=f(unpackValues(r,14,13+n)); top=14 elseif m==0 then f(unpackValues(r,14,13+n)); top=13 else local result=packValues(f(unpackValues(r,14,13+n))); if m<0 then m=result.n end; for i=1,m do r[13+i-1]=result[i] end; top=13+m end end
            block=6343
        elseif block == 6343 then
            r[53]=upvalues[13][7]
            r[52]=r[53]
            r[53] = r[40] - r[36]
            do local f=r[52]; local n=1; if n<0 then n=top-52-1 end; local m=1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            r[55] = r[52][("Magnitude")]
            r[55] = r[55] > (0.05)
            r[54]=r[55]
            if not r[54] then block=6413 else block=6399 end
        elseif block == 6399 then
            r[55] = r[52][("Unit")]
            r[54]=r[55]
            block=6413
        elseif block == 6413 then
            r[53]=r[54]
            if r[53] then block=6434 else block=6427 end
        elseif block == 6427 then
            r[53]=r[44]
            block=6434
        elseif block == 6434 then
            r[54] = r[45][("interceptGap")]
            r[55] = r[45][("danger")]
            r[55] = r[55] * (0.52)
            r[54] = r[54] <= r[55]
            r[56] = env[("ipairs")]
            r[55]=r[56]
            r[56]=r[49]
            do local f=r[55]; local n=1; if n<0 then n=top-55-1 end; local m=3; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            block=6777
        elseif block == 6497 then
            r[61]=r[59]
            r[60] = r[61][("Dot")]
            r[62]=r[53]
            do local f=r[60]; local n=2; if n<0 then n=top-60-1 end; local m=1; if m==1 then r[60]=f(unpackValues(r,61,60+n)); top=61 elseif m==0 then f(unpackValues(r,61,60+n)); top=60 else local result=packValues(f(unpackValues(r,61,60+n))); if m<0 then m=result.n end; for i=1,m do r[60+i-1]=result[i] end; top=60+m end end
            r[61]=(116892)
            r[61]=r[33] == r[61]
            if not r[61] then block=6567 else block=6546 end
        elseif block == 6546 then
            r[2]=env[(84802)]
            r[1]=r[23] < r[13]
            r[10]=r[4][r[23]]
            block=6567
        elseif block == 6567 then
            r[62] = r[60] >= (0.08)
            r[61]=r[62]
            if r[61] then block=6595 else block=6588 end
        elseif block == 6588 then
            r[61]=r[54]
            block=6595
        elseif block == 6595 then
            if not r[61] then block=6777 else block=6602 end
        elseif block == 6602 then
            r[62]=upvalues[25][7]
            r[61]=r[62]
            r[62]=r[36]
            r[63]=r[59]
            r[64]=r[41]
            do local f=r[61]; local n=3; if n<0 then n=top-61-1 end; local m=1; if m==1 then r[61]=f(unpackValues(r,62,61+n)); top=62 elseif m==0 then f(unpackValues(r,62,61+n)); top=61 else local result=packValues(f(unpackValues(r,62,61+n))); if m<0 then m=result.n end; for i=1,m do r[61+i-1]=result[i] end; top=61+m end end
            r[62] = r[60] * (2.5)
            r[62] = r[61] + r[62]
            r[64]=r[50]
            r[63] = r[64][("Dot")]
            r[65]=r[53]
            do local f=r[63]; local n=2; if n<0 then n=top-63-1 end; local m=1; if m==1 then r[63]=f(unpackValues(r,64,63+n)); top=64 elseif m==0 then f(unpackValues(r,64,63+n)); top=63 else local result=packValues(f(unpackValues(r,64,63+n))); if m<0 then m=result.n end; for i=1,m do r[63+i-1]=result[i] end; top=63+m end end
            r[63] = r[63] * (2.5)
            r[63] = r[51] + r[63]
            if not (r[62] > r[63]) then block=6770 else block=6707 end
        elseif block == 6707 then
            r[64]=(72696)
            r[64]=r[33] == r[64]
            if not r[64] then block=6735 else block=6728 end
        elseif block == 6728 then
            r[20]=r[9] == r[22]
            block=6735
        elseif block == 6735 then
            r[64]=r[59]
            r[65]=r[61]
            r[50]=r[64]
            r[51]=r[65]
            block=6770
        elseif block == 6770 then
            block=6777
        elseif block == 6777 then
            r[58], r[59]=r[55](r[56],r[57])
            if r[58]~=nil then r[57]=r[58]; block=6497 else block=6791 end
        elseif block == 6791 then
            r[55]=(88649)
            r[55]=r[33] == r[55]
            if not r[55] then block=6819 else block=6812 end
        elseif block == 6812 then
            r[14]=r[25] - r[13]
            block=6819
        elseif block == 6819 then
            r[56] = r[45][("interceptGap")]
            r[57] = r[45][("danger")]
            r[57] = r[57] * (1.35)
            r[56] = r[56] <= r[57]
            r[55]=r[56]
            if r[55] then block=6875 else block=6861 end
        elseif block == 6861 then
            r[56] = r[51] < (3)
            r[55]=r[56]
            block=6875
        elseif block == 6875 then
            if not r[55] then block=6917 else block=6882 end
        elseif block == 6882 then
            r[55]=r[50]
            r[44]=r[55]
            r[55]=(true)
            r[46]=r[55]
            block=6917
        elseif block == 6917 then
            block=6924
        elseif block == 6924 then
            block=6931
        elseif block == 6931 then
            r[47]=nil
            r[48] = env[("math")]
            r[48] = r[48][("huge")]
            r[50] = env[("ipairs")]
            r[49]=r[50]
            r[50]=r[41]
            do local f=r[49]; local n=1; if n<0 then n=top-49-1 end; local m=3; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            block=7036
        elseif block == 6987 then
            r[54] = r[53][("distance")]
            if not (r[54] < r[48]) then block=7036 else block=7001 end
        elseif block == 7001 then
            r[54] = r[53][("distance")]
            r[55]=r[53]
            r[48]=r[54]
            r[47]=r[55]
            block=7036
        elseif block == 7036 then
            r[52], r[53]=r[49](r[50],r[51])
            if r[52]~=nil then r[51]=r[52]; block=6987 else block=7050 end
        elseif block == 7050 then
            r[50]=upvalues[4][7]
            r[50] = r[50][("emergencySafeZone")]
            r[49]=r[50]
            if not r[49] then block=7162 else block=7078 end
        elseif block == 7078 then
            r[50]=r[47]
            if not r[50] then block=7155 else block=7092 end
        elseif block == 7092 then
            r[52]=upvalues[4][7]
            r[52] = r[52][("panicDistance")]
            r[52] = r[48] <= r[52]
            r[51]=r[52]
            if not r[51] then block=7148 else block=7127 end
        elseif block == 7127 then
            r[52]=upvalues[2][7]
            r[52] = r[52][("stuck")]
            r[51]=r[52]
            block=7148
        elseif block == 7148 then
            r[50]=r[51]
            block=7155
        elseif block == 7155 then
            r[49]=r[50]
            block=7162
        elseif block == 7162 then
            if not r[49] then block=7484 else block=7169 end
        elseif block == 7169 then
            r[49]=(87609)
            r[49]=r[33] == r[49]
            if not r[49] then block=7211 else block=7190 end
        elseif block == 7190 then
            r[20]=r[6] / r[19]
            r[3]=r[14][("assistMode")]
            r[18]=r[5]
            block=7211
        elseif block == 7211 then
            r[50]=upvalues[15][7]
            r[49]=r[50]
            r[50]=r[36]
            do local f=r[49]; local n=1; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            if not r[49] then block=7477 else block=7246 end
        elseif block == 7246 then
            r[51]=upvalues[13][7]
            r[50]=r[51]
            r[51] = r[49] - r[36]
            do local f=r[50]; local n=1; if n<0 then n=top-50-1 end; local m=1; if m==1 then r[50]=f(unpackValues(r,51,50+n)); top=51 elseif m==0 then f(unpackValues(r,51,50+n)); top=50 else local result=packValues(f(unpackValues(r,51,50+n))); if m<0 then m=result.n end; for i=1,m do r[50+i-1]=result[i] end; top=50+m end end
            r[51] = r[50][("Magnitude")]
            if not (r[51] > (0.05)) then block=7470 else block=7288 end
        elseif block == 7288 then
            r[51] = r[50][("Unit")]
            r[52]=r[49]
            r[44]=r[51]
            r[40]=r[52]
            r[51]=(87712)
            r[51]=r[33] == r[51]
            if not r[51] then block=7358 else block=7337 end
        elseif block == 7337 then
            do local f=r[13]; local n=17; if n<0 then n=top-13-1 end; local m=12; if m==1 then r[13]=f(unpackValues(r,14,13+n)); top=14 elseif m==0 then f(unpackValues(r,14,13+n)); top=13 else local result=packValues(f(unpackValues(r,14,13+n))); if m<0 then m=result.n end; for i=1,m do r[13+i-1]=result[i] end; top=13+m end end
            r[11]=r[6] .. r[3]
            r[11]=r[15] / r[15]
            block=7358
        elseif block == 7358 then
            r[51]=("SafeZone")
            r[52]=upvalues[2][7]
            r[52][("goalMode")]=r[51]
            r[51]=(80046)
            r[51]=r[33] == r[51]
            if not r[51] then block=7421 else block=7400 end
        elseif block == 7400 then
            r[14][r[3]]=r[20]
            r[15]=(144876)
            r[22]=env[(82582)]
            block=7421
        elseif block == 7421 then
            r[51]=nil
            r[52]=nil
            r[53]=upvalues[2][7]
            r[53][("assistMode")]=r[51]
            r[54]=upvalues[2][7]
            r[54][("assistTarget")]=r[52]
            block=7470
        elseif block == 7470 then
            block=7477
        elseif block == 7477 then
            block=7484
        elseif block == 7484 then
            r[50]=upvalues[26][7]
            r[49]=r[50]
            r[50]=r[36]
            r[51]=r[44]
            r[52]=r[40]
            r[53] = r[36][("Y")]
            do local f=r[49]; local n=4; if n<0 then n=top-49-1 end; local m=2; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[51]=(135244)
            r[51]=r[33] == r[51]
            if not r[51] then block=7568 else block=7554 end
        elseif block == 7554 then
            r[3][("routeActive")]=r[14]
            r[8][r[0]]=r[22]
            block=7568
        elseif block == 7568 then
            r[51]=r[50]
            r[52]=r[49]
            r[53]=upvalues[2][7]
            r[53][("edgeRisk")]=r[51]
            r[54]=upvalues[2][7]
            r[54][("edgeDirection")]=r[52]
            r[51]=(128644)
            r[51]=r[33] == r[51]
            if not r[51] then block=7645 else block=7631 end
        elseif block == 7631 then
            r[1]=r[17] * r[4]
            r[22][r[13]]=r[7]
            block=7645
        elseif block == 7645 then
            r[51]=r[50]
            if not r[51] then block=7680 else block=7659 end
        elseif block == 7659 then
            r[52] = r[49][("Magnitude")]
            r[52] = r[52] > (0.05)
            r[51]=r[52]
            block=7680
        elseif block == 7680 then
            if not r[51] then block=7925 else block=7687 end
        elseif block == 7687 then
            r[52]=upvalues[2][7]
            r[52] = r[52][("edgeRecoveryDirection")]
            r[52] = r[52][("Magnitude")]
            r[52] = r[52] < (0.05)
            r[51]=r[52]
            if r[51] then block=7827 else block=7729 end
        elseif block == 7729 then
            r[53]=upvalues[2][7]
            r[53] = r[53][("edgeRecoveryUntil")]
            r[53] = r[31] >= r[53]
            r[52]=r[53]
            if r[52] then block=7820 else block=7764 end
        elseif block == 7764 then
            r[55]=upvalues[2][7]
            r[55] = r[55][("edgeRecoveryDirection")]
            r[54]=r[55]
            r[53] = r[54][("Dot")]
            r[55]=r[49]
            do local f=r[53]; local n=2; if n<0 then n=top-53-1 end; local m=1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            r[53] = r[53] < (0.92)
            r[52]=r[53]
            block=7820
        elseif block == 7820 then
            r[51]=r[52]
            block=7827
        elseif block == 7827 then
            if not r[51] then block=7883 else block=7834 end
        elseif block == 7834 then
            r[51] = r[49][("Unit")]
            r[52]=upvalues[2][7]
            r[52][("edgeRecoveryDirection")]=r[51]
            r[51] = r[31] + (0.72)
            r[52]=upvalues[2][7]
            r[52][("edgeRecoveryUntil")]=r[51]
            block=7883
        elseif block == 7883 then
            r[51]=upvalues[2][7]
            r[51] = r[51][("edgeRecoveryDirection")]
            r[44]=r[51]
            r[51]=(true)
            r[46]=r[51]
            block=7981
        elseif block == 7925 then
            r[51]=upvalues[2][7]
            r[51] = r[51][("edgeRecoveryUntil")]
            if not (r[31] >= r[51]) then block=7981 else block=7946 end
        elseif block == 7946 then
            r[51] = env[("Vector3")]
            r[51] = r[51][("zero")]
            r[52]=upvalues[2][7]
            r[52][("edgeRecoveryDirection")]=r[51]
            block=7981
        elseif block == 7981 then
            r[51]=upvalues[2][7]
            r[51] = r[51][("stuck")]
            if not r[51] then block=8870 else block=8002 end
        elseif block == 8002 then
            r[52]=upvalues[27][7]
            r[51]=r[52]
            do local f=r[51]; local n=0; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[53]=r[51]
            if not r[53] then block=8072 else block=8037 end
        elseif block == 8037 then
            r[55]=upvalues[13][7]
            r[54]=r[55]
            r[55] = r[51] - r[36]
            do local f=r[54]; local n=1; if n<0 then n=top-54-1 end; local m=1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            r[53]=r[54]
            block=8072
        elseif block == 8072 then
            r[52]=r[53]
            if r[52] then block=8121 else block=8086 end
        elseif block == 8086 then
            r[54]=upvalues[13][7]
            r[53]=r[54]
            r[54] = r[40] - r[36]
            do local f=r[53]; local n=1; if n<0 then n=top-53-1 end; local m=1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            r[52]=r[53]
            block=8121
        elseif block == 8121 then
            r[53]=(108032)
            r[53]=r[33] == r[53]
            if not r[53] then block=8156 else block=8142 end
        elseif block == 8142 then
            r[19]=r[25][("goal")]
            r[24]=r[23][r[15]]
            block=8156
        elseif block == 8156 then
            r[53] = r[52][("Magnitude")]
            if not (r[53] > (0.05)) then block=8863 else block=8170 end
        elseif block == 8170 then
            r[53]=(128446)
            r[53]=r[33] == r[53]
            if not r[53] then block=8219 else block=8191 end
        elseif block == 8191 then
            r[5]=r[19]
            r[1]=env[("Position")]
            r[21]=r[5][(84802)]
            do local f=r[15]; local n=23; if n<0 then n=top-15-1 end; local m=8; if m==1 then r[15]=f(unpackValues(r,16,15+n)); top=16 elseif m==0 then f(unpackValues(r,16,15+n)); top=15 else local result=packValues(f(unpackValues(r,16,15+n))); if m<0 then m=result.n end; for i=1,m do r[15+i-1]=result[i] end; top=15+m end end
            block=8219
        elseif block == 8219 then
            r[53] = r[52][("Unit")]
            r[52]=r[53]
            r[54]=upvalues[2][7]
            r[54] = r[54][("stuckRecoveryDirection")]
            r[54] = r[54][("Magnitude")]
            r[54] = r[54] < (0.05)
            r[53]=r[54]
            if r[53] then block=8373 else block=8275 end
        elseif block == 8275 then
            r[55]=upvalues[2][7]
            r[55] = r[55][("stuckRecoveryUntil")]
            r[55] = r[31] >= r[55]
            r[54]=r[55]
            if r[54] then block=8366 else block=8310 end
        elseif block == 8310 then
            r[57]=upvalues[2][7]
            r[57] = r[57][("stuckRecoveryDirection")]
            r[56]=r[57]
            r[55] = r[56][("Dot")]
            r[57]=r[52]
            do local f=r[55]; local n=2; if n<0 then n=top-55-1 end; local m=1; if m==1 then r[55]=f(unpackValues(r,56,55+n)); top=56 elseif m==0 then f(unpackValues(r,56,55+n)); top=55 else local result=packValues(f(unpackValues(r,56,55+n))); if m<0 then m=result.n end; for i=1,m do r[55+i-1]=result[i] end; top=55+m end end
            r[55] = r[55] < (0.75)
            r[54]=r[55]
            block=8366
        elseif block == 8366 then
            r[53]=r[54]
            block=8373
        elseif block == 8373 then
            if not r[53] then block=8821 else block=8380 end
        elseif block == 8380 then
            r[53]={}
            r[53][(1)]=r[52]
            r[55]=upvalues[28][7]
            r[54]=r[55]
            r[55]=r[52]
            r[56]=(35)
            do local f=r[54]; local n=2; if n<0 then n=top-54-1 end; local m=1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            r[53][(2)]=r[54]
            r[55]=upvalues[28][7]
            r[54]=r[55]
            r[55]=r[52]
            r[56]=(-35)
            do local f=r[54]; local n=2; if n<0 then n=top-54-1 end; local m=1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            r[53][(3)]=r[54]
            r[55]=upvalues[28][7]
            r[54]=r[55]
            r[55]=r[52]
            r[56]=(70)
            do local f=r[54]; local n=2; if n<0 then n=top-54-1 end; local m=1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            r[53][(4)]=r[54]
            r[55]=upvalues[28][7]
            r[54]=r[55]
            r[55]=r[52]
            r[56]=(-70)
            do local f=r[54]; local n=2; if n<0 then n=top-54-1 end; local m=-1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            do local n=-1; if n<0 then n=top-53-1 end; for i=1,n do r[53][4+i]=r[53+i] end end
            r[54]=r[52]
            r[55] = env[("math")]
            r[55] = r[55][("huge")]
            r[55]=-r[55]
            r[57] = env[("ipairs")]
            r[56]=r[57]
            r[57]=r[53]
            do local f=r[56]; local n=1; if n<0 then n=top-56-1 end; local m=3; if m==1 then r[56]=f(unpackValues(r,57,56+n)); top=57 elseif m==0 then f(unpackValues(r,57,56+n)); top=56 else local result=packValues(f(unpackValues(r,57,56+n))); if m<0 then m=result.n end; for i=1,m do r[56+i-1]=result[i] end; top=56+m end end
            block=8758
        elseif block == 8625 then
            r[62]=upvalues[29][7]
            r[61]=r[62]
            r[62]=r[36]
            r[63]=r[60]
            r[64] = r[36][("Y")]
            do local f=r[61]; local n=3; if n<0 then n=top-61-1 end; local m=1; if m==1 then r[61]=f(unpackValues(r,62,61+n)); top=62 elseif m==0 then f(unpackValues(r,62,61+n)); top=61 else local result=packValues(f(unpackValues(r,62,61+n))); if m<0 then m=result.n end; for i=1,m do r[61+i-1]=result[i] end; top=61+m end end
            r[61] = r[61] * (5)
            r[63]=r[60]
            r[62] = r[63][("Dot")]
            r[64]=r[52]
            do local f=r[62]; local n=2; if n<0 then n=top-62-1 end; local m=1; if m==1 then r[62]=f(unpackValues(r,63,62+n)); top=63 elseif m==0 then f(unpackValues(r,63,62+n)); top=62 else local result=packValues(f(unpackValues(r,63,62+n))); if m<0 then m=result.n end; for i=1,m do r[62+i-1]=result[i] end; top=62+m end end
            r[62] = r[62] * (4)
            r[61] = r[61] + r[62]
            if not (r[61] > r[55]) then block=8758 else block=8723 end
        elseif block == 8723 then
            r[62]=r[61]
            r[55]=r[62]
            r[62] = r[60][("Unit")]
            r[54]=r[62]
            block=8758
        elseif block == 8758 then
            r[59], r[60]=r[56](r[57],r[58])
            if r[59]~=nil then r[58]=r[59]; block=8625 else block=8772 end
        elseif block == 8772 then
            r[56]=r[54]
            r[57]=upvalues[2][7]
            r[57][("stuckRecoveryDirection")]=r[56]
            r[56] = r[31] + (0.85)
            r[57]=upvalues[2][7]
            r[57][("stuckRecoveryUntil")]=r[56]
            block=8821
        elseif block == 8821 then
            r[53]=upvalues[2][7]
            r[53] = r[53][("stuckRecoveryDirection")]
            r[44]=r[53]
            r[53]=(true)
            r[46]=r[53]
            block=8863
        elseif block == 8863 then
            block=8926
        elseif block == 8870 then
            r[51]=upvalues[2][7]
            r[51] = r[51][("stuckRecoveryUntil")]
            if not (r[31] >= r[51]) then block=8926 else block=8891 end
        elseif block == 8891 then
            r[51] = env[("Vector3")]
            r[51] = r[51][("zero")]
            r[52]=upvalues[2][7]
            r[52][("stuckRecoveryDirection")]=r[51]
            block=8926
        elseif block == 8926 then
            r[52]=upvalues[4][7]
            r[52] = r[52][("smoothMovement")]
            r[51]=r[52]
            if not r[51] then block=9059 else block=8954 end
        elseif block == 8954 then
            r[53]=not r[46]
            r[52]=r[53]
            if not r[52] then block=9052 else block=8975 end
        elseif block == 8975 then
            r[54]=upvalues[2][7]
            r[54] = r[54][("path")]
            r[54] = r[54][("Magnitude")]
            r[54] = r[54] > (0.05)
            r[53]=r[54]
            if not r[53] then block=9045 else block=9017 end
        elseif block == 9017 then
            r[54]=upvalues[2][7]
            r[54] = r[54][("stuck")]
            r[54]=not r[54]
            r[53]=r[54]
            block=9045
        elseif block == 9045 then
            r[52]=r[53]
            block=9052
        elseif block == 9052 then
            r[51]=r[52]
            block=9059
        elseif block == 9059 then
            if not r[51] then block=9409 else block=9066 end
        elseif block == 9066 then
            r[51]=(79194)
            r[51]=r[33] == r[51]
            if not r[51] then block=9115 else block=9087 end
        elseif block == 9087 then
            do local f=r[0]; local n=15; if n<0 then n=top-0-1 end; local m=24; if m==1 then r[0]=f(unpackValues(r,1,0+n)); top=1 elseif m==0 then f(unpackValues(r,1,0+n)); top=0 else local result=packValues(f(unpackValues(r,1,0+n))); if m<0 then m=result.n end; for i=1,m do r[0+i-1]=result[i] end; top=0+m end end
            r[25][("edgeDirection")]=r[5]
            r[2]=("goalSide")
            r[9]=("path")
            block=9115
        elseif block == 9115 then
            r[52] = env[("math")]
            r[52] = r[52][("clamp")]
            r[51]=r[52]
            r[52]=upvalues[4][7]
            r[52] = r[52][("turnRate")]
            r[54] = env[("math")]
            r[54] = r[54][("clamp")]
            r[53]=r[54]
            r[54]=r[32]
            if r[54] then block=9199 else block=9185 end
        elseif block == 9185 then
            r[55]=(0.016666666666666666)
            r[54]=r[55]
            block=9199
        elseif block == 9199 then
            r[55]=(0.001)
            r[56]=(0.1)
            do local f=r[53]; local n=3; if n<0 then n=top-53-1 end; local m=1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            r[52] = r[52] * r[53]
            r[53]=(0)
            r[54]=(1)
            do local f=r[51]; local n=3; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[53]=upvalues[13][7]
            r[52]=r[53]
            r[55]=upvalues[2][7]
            r[55] = r[55][("path")]
            r[54]=r[55]
            r[53] = r[54][("Lerp")]
            r[55]=r[44]
            r[56]=r[51]
            do local f=r[53]; local n=3; if n<0 then n=top-53-1 end; local m=-1; if m==1 then r[53]=f(unpackValues(r,54,53+n)); top=54 elseif m==0 then f(unpackValues(r,54,53+n)); top=53 else local result=packValues(f(unpackValues(r,54,53+n))); if m<0 then m=result.n end; for i=1,m do r[53+i-1]=result[i] end; top=53+m end end
            do local f=r[52]; local n=-1; if n<0 then n=top-52-1 end; local m=1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            r[53] = r[52][("Magnitude")]
            if not (r[53] > (0.05)) then block=9402 else block=9332 end
        elseif block == 9332 then
            r[53]=(144737)
            r[53]=r[33] == r[53]
            if not r[53] then block=9381 else block=9353 end
        elseif block == 9353 then
            r[18][r[18]]=r[16]
            r[15]=r[4] / r[25]
            do local f=r[24]; local n=2; if n<0 then n=top-24-1 end; local m=10; if m==1 then r[24]=f(unpackValues(r,25,24+n)); top=25 elseif m==0 then f(unpackValues(r,25,24+n)); top=24 else local result=packValues(f(unpackValues(r,25,24+n))); if m<0 then m=result.n end; for i=1,m do r[24+i-1]=result[i] end; top=24+m end end
            r[25][("goalMode")]=r[24]
            block=9381
        elseif block == 9381 then
            r[53] = r[52][("Unit")]
            r[44]=r[53]
            block=9402
        elseif block == 9402 then
            block=9409
        elseif block == 9409 then
            r[51]=r[44]
            r[52]=upvalues[2][7]
            r[52][("path")]=r[51]
            r[51] = r[35][("AutoRotate")]
            r[52]=(true)
            if not (r[51] ~= r[52]) then block=9472 else block=9451 end
        elseif block == 9451 then
            r[51]=(true)
            r[35][("AutoRotate")]=r[51]
            block=9472
        elseif block == 9472 then
            r[52]=r[35]
            r[51] = r[52][("Move")]
            r[53]=r[44]
            r[54]=(false)
            do local f=r[51]; local n=3; if n<0 then n=top-51-1 end; local m=0; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[52]=upvalues[30][7]
            r[51]=r[52]
            r[52]=r[36]
            r[53]=r[41]
            r[55]=upvalues[13][7]
            r[54]=r[55]
            r[55] = r[40] - r[36]
            do local f=r[54]; local n=1; if n<0 then n=top-54-1 end; local m=1; if m==1 then r[54]=f(unpackValues(r,55,54+n)); top=55 elseif m==0 then f(unpackValues(r,55,54+n)); top=54 else local result=packValues(f(unpackValues(r,55,54+n))); if m<0 then m=result.n end; for i=1,m do r[54+i-1]=result[i] end; top=54+m end end
            r[54] = r[54][("Magnitude")]
            do local f=r[51]; local n=3; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            if not r[51] then block=9913 else block=9584 end
        elseif block == 9584 then
            r[52]=upvalues[31][7]
            r[51]=r[52]
            r[52]=r[36]
            r[53]=r[44]
            r[54]=r[41]
            do local f=r[51]; local n=3; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[53]=upvalues[2][7]
            r[53] = r[53][("edgeRisk")]
            r[52]=r[53]
            if not r[52] then block=9689 else block=9654 end
        elseif block == 9654 then
            r[53]=upvalues[2][7]
            r[53] = r[53][("edgeRecoveryDirection")]
            r[53] = r[53][("Magnitude")]
            r[53] = r[53] > (0.05)
            r[52]=r[53]
            block=9689
        elseif block == 9689 then
            if not r[52] then block=9724 else block=9696 end
        elseif block == 9696 then
            r[52]=upvalues[2][7]
            r[52] = r[52][("edgeRecoveryDirection")]
            r[51]=r[52]
            block=9871
        elseif block == 9724 then
            r[53]=upvalues[2][7]
            r[53] = r[53][("stuck")]
            r[52]=r[53]
            if not r[52] then block=9787 else block=9752 end
        elseif block == 9752 then
            r[53]=upvalues[2][7]
            r[53] = r[53][("stuckRecoveryDirection")]
            r[53] = r[53][("Magnitude")]
            r[53] = r[53] > (0.05)
            r[52]=r[53]
            block=9787
        elseif block == 9787 then
            if not r[52] then block=9871 else block=9794 end
        elseif block == 9794 then
            r[52]=(66368)
            r[52]=r[33] == r[52]
            if not r[52] then block=9843 else block=9815 end
        elseif block == 9815 then
            r[5]=("Position")
            r[9]=r[19] / r[8]
            r[23]=r[12] < r[9]
            r[17]=r[3]
            block=9843
        elseif block == 9843 then
            r[52]=upvalues[2][7]
            r[52] = r[52][("stuckRecoveryDirection")]
            r[51]=r[52]
            block=9871
        elseif block == 9871 then
            r[53]=upvalues[32][7]
            r[52]=r[53]
            r[53]=r[51]
            r[54]=r[31]
            do local f=r[52]; local n=2; if n<0 then n=top-52-1 end; local m=0; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            block=9913
        elseif block == 9913 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[76] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(310415)
            r[33]=upvalues[1][7]
            r[33] = r[33][("catcherTargetAt")]
            r[33] = r[31] - r[33]
            if not (r[33] < (0.15)) then block=85 else block=36 end
        elseif block == 36 then
            r[33]=(350827)
            r[33]=r[32] == r[33]
            if not r[33] then block=71 else block=57 end
        elseif block == 57 then
            r[3]=#r[17]
            r[13]=r[1][r[0]]
            block=71
        elseif block == 71 then
            return unpackValues(r, 0, -1)
        elseif block == 78 then
            block=85
        elseif block == 85 then
            r[33]=r[31]
            r[34]=upvalues[1][7]
            r[34][("catcherTargetAt")]=r[33]
            r[34] = env[("table")]
            r[34] = r[34][("clear")]
            r[33]=r[34]
            r[34]=upvalues[1][7]
            r[34] = r[34][("catcherTargets")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34] = env[("ipairs")]
            r[33]=r[34]
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[34] = r[35][("GetPlayers")]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=-1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            do local f=r[33]; local n=-1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=722
        elseif block == 204 then
            r[38]=(407715)
            r[38]=r[32] == r[38]
            if not r[38] then block=232 else block=225 end
        elseif block == 225 then
            r[8]=r[7] < r[2]
            block=232
        elseif block == 232 then
            r[39]=upvalues[3][7]
            r[39] = r[37] ~= r[39]
            r[38]=r[39]
            if not r[38] then block=386 else block=260 end
        elseif block == 260 then
            r[40] = r[37][("Parent")]
            r[39]=r[40]
            if not r[39] then block=379 else block=281 end
        elseif block == 281 then
            r[42]=r[37]
            r[41] = r[42][("GetAttribute")]
            r[43]=("GameRole")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[41] == ("Runner")
            r[40]=r[41]
            if not r[40] then block=372 else block=330 end
        elseif block == 330 then
            r[42]=r[37]
            r[41] = r[42][("GetAttribute")]
            r[43]=("RunState")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[41] = r[41] == ("Active")
            r[40]=r[41]
            block=372
        elseif block == 372 then
            r[39]=r[40]
            block=379
        elseif block == 379 then
            r[38]=r[39]
            block=386
        elseif block == 386 then
            if not r[38] then block=722 else block=393 end
        elseif block == 393 then
            r[38] = r[37][("Character")]
            r[39]=(378998)
            r[39]=r[32] == r[39]
            if not r[39] then block=428 else block=421 end
        elseif block == 421 then
            r[5]=r[11] + r[2]
            block=428
        elseif block == 428 then
            r[39]=r[38]
            if not r[39] then block=477 else block=442 end
        elseif block == 442 then
            r[41]=r[38]
            r[40] = r[41][("FindFirstChildOfClass")]
            r[42]=("Humanoid")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[39]=r[40]
            block=477
        elseif block == 477 then
            r[40]=r[38]
            if not r[40] then block=526 else block=491 end
        elseif block == 491 then
            r[42]=r[38]
            r[41] = r[42][("FindFirstChild")]
            r[43]=("HumanoidRootPart")
            do local f=r[41]; local n=2; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[40]=r[41]
            block=526
        elseif block == 526 then
            r[41]=r[39]
            if not r[41] then block=645 else block=540 end
        elseif block == 540 then
            r[43] = r[39][("Health")]
            r[43] = r[43] > (0)
            r[42]=r[43]
            if not r[42] then block=638 else block=568 end
        elseif block == 568 then
            r[43]=r[40]
            if not r[43] then block=631 else block=582 end
        elseif block == 582 then
            r[45]=r[38]
            r[44] = r[45][("GetAttribute")]
            r[46]=("Ragdolled")
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(true)
            r[44] = r[44] ~= r[45]
            r[43]=r[44]
            block=631
        elseif block == 631 then
            r[42]=r[43]
            block=638
        elseif block == 638 then
            r[41]=r[42]
            block=645
        elseif block == 645 then
            if not r[41] then block=715 else block=652 end
        elseif block == 652 then
            r[41]=r[37]
            r[42]=upvalues[1][7]
            r[42] = r[42][("catcherTargets")]
            r[43]=upvalues[1][7]
            r[43] = r[43][("catcherTargets")]
            r[43]=#r[43]
            r[43] = r[43] + (1)
            r[42][r[43]]=r[41]
            block=715
        elseif block == 715 then
            block=722
        elseif block == 722 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=204 else block=736 end
        elseif block == 736 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[77] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(715738)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[35]=r[31]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=not r[34]
            if not r[35] then block=78 else block=50 end
        elseif block == 50 then
            r[35] = env[("Vector3")]
            r[35] = r[35][("zero")]
            return r[35]
        elseif block == 71 then
            block=78
        elseif block == 78 then
            r[35]=upvalues[2][7]
            r[35] = r[35][("catcherVelocity")]
            r[35] = r[35][r[31]]
            r[36]=not r[35]
            if not r[36] then block=246 else block=113 end
        elseif block == 113 then
            r[36]={}
            r[38]=upvalues[3][7]
            r[37]=r[38]
            r[38] = r[34][("AssemblyLinearVelocity")]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36][("velocity")]=r[37]
            r[36][("time")]=r[32]
            r[35]=r[36]
            r[36]=r[35]
            r[37]=upvalues[2][7]
            r[37] = r[37][("catcherVelocity")]
            r[37][r[31]]=r[36]
            r[36]=(752716)
            r[36]=r[33] == r[36]
            if not r[36] then block=225 else block=218 end
        elseif block == 218 then
            r[6]=r[17][(1)]
            block=225
        elseif block == 225 then
            r[36] = r[35][("velocity")]
            return r[36]
        elseif block == 239 then
            block=246
        elseif block == 246 then
            r[37]=upvalues[3][7]
            r[36]=r[37]
            r[37] = r[34][("AssemblyLinearVelocity")]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=(805560)
            r[37]=r[33] == r[37]
            if not r[37] then block=316 else block=295 end
        elseif block == 295 then
            r[4]=r[24] == r[20]
            r[23]=#r[5]
            r[16]=("Lerp")
            block=316
        elseif block == 316 then
            r[38] = env[("math")]
            r[38] = r[38][("clamp")]
            r[37]=r[38]
            r[38] = r[35][("time")]
            r[38] = r[32] - r[38]
            r[39]=(0.01)
            r[40]=(0.25)
            do local f=r[37]; local n=3; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[39] = env[("math")]
            r[39] = r[39][("clamp")]
            r[38]=r[39]
            r[39]=upvalues[4][7]
            r[39] = r[39][("catcherSmoothing")]
            r[39] = r[37] * r[39]
            r[40]=(0)
            r[41]=(1)
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[41] = r[35][("velocity")]
            r[40]=r[41]
            r[39] = r[40][("Lerp")]
            r[41]=r[36]
            r[42]=r[38]
            do local f=r[39]; local n=3; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[35][("velocity")]=r[39]
            r[39]=r[32]
            r[35][("time")]=r[39]
            r[39] = r[35][("velocity")]
            return r[39]
        elseif block == 512 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[78] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(287402)
            r[33]=(384562)
            r[33]=r[32] == r[33]
            if not r[33] then block=36 else block=29 end
        elseif block == 29 then
            r[15]=r[7] * r[16]
            block=36
        elseif block == 36 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[2][7]
            r[33]=r[34]
            r[34]=r[31]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(310994)
            r[34]=r[32] == r[34]
            if not r[34] then block=127 else block=106 end
        elseif block == 106 then
            r[21]=r[8] .. r[4]
            r[1]=r[2] + r[13]
            r[24]=r[8] + r[0]
            block=127
        elseif block == 127 then
            r[34]=not r[33]
            if not r[34] then block=162 else block=141 end
        elseif block == 141 then
            r[34]=(false)
            return r[34]
        elseif block == 155 then
            block=162
        elseif block == 162 then
            r[36]=upvalues[3][7]
            r[35]=r[36]
            r[36] = r[33][("Position")]
            r[37]=upvalues[4][7]
            r[37] = r[37][("a")]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34]=r[35]
            if r[34] then block=267 else block=218 end
        elseif block == 218 then
            r[36]=upvalues[3][7]
            r[35]=r[36]
            r[36] = r[33][("Position")]
            r[37]=upvalues[4][7]
            r[37] = r[37][("b")]
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[34]=r[35]
            block=267
        elseif block == 267 then
            return r[34]
        elseif block == 274 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[79] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(781436)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[35]=r[31]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=nil
            r[35]=nil
            r[36]=nil
            r[37]=upvalues[2][7]
            r[37] = r[37][("catcherTarget")]
            r[39] = env[("math")]
            r[39] = r[39][("max")]
            r[38]=r[39]
            r[40]=upvalues[3][7]
            r[39]=r[40]
            do local f=r[39]; local n=0; if n<0 then n=top-39-1 end; local m=1; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            r[40]=(1)
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[40] = env[("ipairs")]
            r[39]=r[40]
            r[40]=upvalues[2][7]
            r[40] = r[40][("catcherTargets")]
            do local f=r[39]; local n=1; if n<0 then n=top-39-1 end; local m=3; if m==1 then r[39]=f(unpackValues(r,40,39+n)); top=40 elseif m==0 then f(unpackValues(r,40,39+n)); top=39 else local result=packValues(f(unpackValues(r,40,39+n))); if m<0 then m=result.n end; for i=1,m do r[39+i-1]=result[i] end; top=39+m end end
            block=862
        elseif block == 169 then
            r[45]=upvalues[4][7]
            r[44]=r[45]
            r[45]=r[43]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(874386)
            r[45]=r[33] == r[45]
            if not r[45] then block=232 else block=218 end
        elseif block == 218 then
            r[5]=r[19][r[2]]
            r[12]=r[24] / r[14]
            block=232
        elseif block == 232 then
            if not r[44] then block=862 else block=239 end
        elseif block == 239 then
            r[45]=(792770)
            r[45]=r[33] == r[45]
            if not r[45] then block=274 else block=260 end
        elseif block == 260 then
            r[24]=r[10] - r[24]
            r[19]=r[10] + r[17]
            block=274
        elseif block == 274 then
            r[45] = r[44][("Position")]
            r[47]=upvalues[5][7]
            r[46]=r[47]
            r[47]=r[43]
            r[48]=r[31]
            do local f=r[46]; local n=2; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[47]=(824804)
            r[47]=r[33] == r[47]
            if not r[47] then block=351 else block=337 end
        elseif block == 337 then
            r[17]=r[8] / r[13]
            r[18]=(0.05)
            block=351
        elseif block == 351 then
            r[47]=upvalues[6][7]
            r[47] = r[47][("catcherPrediction")]
            r[47] = r[46] * r[47]
            r[47] = r[45] + r[47]
            r[49]=upvalues[7][7]
            r[48]=r[49]
            r[49] = r[45] - r[32]
            do local f=r[48]; local n=1; if n<0 then n=top-48-1 end; local m=1; if m==1 then r[48]=f(unpackValues(r,49,48+n)); top=49 elseif m==0 then f(unpackValues(r,49,48+n)); top=48 else local result=packValues(f(unpackValues(r,49,48+n))); if m<0 then m=result.n end; for i=1,m do r[48+i-1]=result[i] end; top=48+m end end
            r[48] = r[48][("Magnitude")]
            r[50]=upvalues[7][7]
            r[49]=r[50]
            r[50] = r[47] - r[32]
            do local f=r[49]; local n=1; if n<0 then n=top-49-1 end; local m=1; if m==1 then r[49]=f(unpackValues(r,50,49+n)); top=50 elseif m==0 then f(unpackValues(r,50,49+n)); top=49 else local result=packValues(f(unpackValues(r,50,49+n))); if m<0 then m=result.n end; for i=1,m do r[49+i-1]=result[i] end; top=49+m end end
            r[49] = r[49][("Magnitude")]
            r[50]=(844598)
            r[50]=r[33] == r[50]
            if not r[50] then block=484 else block=470 end
        elseif block == 470 then
            r[20]=r[0] == r[9]
            do local f=r[7]; local n=9; if n<0 then n=top-7-1 end; local m=21; if m==1 then r[7]=f(unpackValues(r,8,7+n)); top=8 elseif m==0 then f(unpackValues(r,8,7+n)); top=7 else local result=packValues(f(unpackValues(r,8,7+n))); if m<0 then m=result.n end; for i=1,m do r[7+i-1]=result[i] end; top=7+m end end
            block=484
        elseif block == 484 then
            r[50] = r[49] / r[38]
            r[52] = env[("math")]
            r[52] = r[52][("min")]
            r[51]=r[52]
            r[52] = r[50] * (10)
            r[53]=(30)
            do local f=r[51]; local n=2; if n<0 then n=top-51-1 end; local m=1; if m==1 then r[51]=f(unpackValues(r,52,51+n)); top=52 elseif m==0 then f(unpackValues(r,52,51+n)); top=51 else local result=packValues(f(unpackValues(r,52,51+n))); if m<0 then m=result.n end; for i=1,m do r[51+i-1]=result[i] end; top=51+m end end
            r[51] = r[49] + r[51]
            r[52] = r[48] * (0.05)
            r[51] = r[51] + r[52]
            r[53]=upvalues[6][7]
            r[53] = r[53][("smartPriority")]
            r[52]=r[53]
            if not r[52] then block=603 else block=582 end
        elseif block == 582 then
            r[53] = r[46][("Magnitude")]
            r[53] = r[53] >= (4)
            r[52]=r[53]
            block=603
        elseif block == 603 then
            if not r[52] then block=638 else block=610 end
        elseif block == 610 then
            r[52]=(6)
            r[53] = r[51] - r[52]
            r[51]=r[53]
            block=638
        elseif block == 638 then
            r[53]=upvalues[8][7]
            r[52]=r[53]
            r[53]=r[43]
            do local f=r[52]; local n=1; if n<0 then n=top-52-1 end; local m=1; if m==1 then r[52]=f(unpackValues(r,53,52+n)); top=53 elseif m==0 then f(unpackValues(r,53,52+n)); top=52 else local result=packValues(f(unpackValues(r,53,52+n))); if m<0 then m=result.n end; for i=1,m do r[52+i-1]=result[i] end; top=52+m end end
            if not r[52] then block=701 else block=673 end
        elseif block == 673 then
            r[52]=(18)
            r[53] = r[51] + r[52]
            r[51]=r[53]
            block=701
        elseif block == 701 then
            if not (r[43] == r[37]) then block=729 else block=708 end
        elseif block == 708 then
            r[52]=r[51]
            r[36]=r[52]
            block=729
        elseif block == 729 then
            r[53]=not r[35]
            r[52]=r[53]
            if r[52] then block=764 else block=750 end
        elseif block == 750 then
            r[53] = r[51] < r[35]
            r[52]=r[53]
            block=764
        elseif block == 764 then
            if not r[52] then block=855 else block=771 end
        elseif block == 771 then
            r[52]=(808980)
            r[52]=r[33] == r[52]
            if not r[52] then block=820 else block=792 end
        elseif block == 792 then
            r[14]=env[(6)]
            r[17]=r[22] .. r[19]
            r[11]=r[6]
            r[13][(808980)]=r[1]
            block=820
        elseif block == 820 then
            r[52]=r[43]
            r[53]=r[51]
            r[34]=r[52]
            r[35]=r[53]
            block=855
        elseif block == 855 then
            block=862
        elseif block == 862 then
            r[42], r[43]=r[39](r[40],r[41])
            if r[42]~=nil then r[41]=r[42]; block=169 else block=876 end
        elseif block == 876 then
            r[39]=r[37]
            if not r[39] then block=981 else block=890 end
        elseif block == 890 then
            r[40]=r[36]
            if not r[40] then block=974 else block=904 end
        elseif block == 904 then
            r[41]=r[35]
            if not r[41] then block=967 else block=918 end
        elseif block == 918 then
            r[43] = r[37] ~= r[34]
            r[42]=r[43]
            if not r[42] then block=960 else block=939 end
        elseif block == 939 then
            r[43] = r[35] + (8)
            r[43] = r[36] <= r[43]
            r[42]=r[43]
            block=960
        elseif block == 960 then
            r[41]=r[42]
            block=967
        elseif block == 967 then
            r[40]=r[41]
            block=974
        elseif block == 974 then
            r[39]=r[40]
            block=981
        elseif block == 981 then
            if not r[39] then block=1009 else block=988 end
        elseif block == 988 then
            r[39]=r[37]
            r[34]=r[39]
            block=1009
        elseif block == 1009 then
            r[39]=r[34]
            r[40]=upvalues[2][7]
            r[40][("catcherTarget")]=r[39]
            r[39]=(821609)
            r[39]=r[33] == r[39]
            if not r[39] then block=1065 else block=1051 end
        elseif block == 1051 then
            r[19]=r[16][("max")]
            r[24]=r[23] == r[15]
            block=1065
        elseif block == 1065 then
            return r[34]
        elseif block == 1072 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[80] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(428089)
            r[32]=(448986)
            r[32]=r[31] == r[32]
            if not r[32] then block=43 else block=29 end
        elseif block == 29 then
            r[23]=r[25] < r[24]
            r[13]=r[17][(true)]
            block=43
        elseif block == 43 then
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=r[32]
            if not r[33] then block=127 else block=78 end
        elseif block == 78 then
            r[35]=r[32]
            r[34] = r[35][("GetAttribute")]
            r[36]=("TackleActive")
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[35]=(true)
            r[34] = r[34] == r[35]
            r[33]=r[34]
            block=127
        elseif block == 127 then
            return r[33]
        elseif block == 134 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[81] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[34]=(340548)
            r[35]=(384504)
            r[35]=r[34] == r[35]
            if not r[35] then block=50 else block=29 end
        elseif block == 29 then
            r[22]=r[14][r[16]]
            r[8]=("meleeRange")
            r[22]=r[25] + r[10]
            block=50
        elseif block == 50 then
            r[36]=not r[31]
            r[35]=r[36]
            if r[35] then block=127 else block=71 end
        elseif block == 71 then
            r[37]=not r[33]
            r[36]=r[37]
            if r[36] then block=120 else block=92 end
        elseif block == 92 then
            r[38]=upvalues[1][7]
            r[37]=r[38]
            do local f=r[37]; local n=0; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[36]=r[37]
            block=120
        elseif block == 120 then
            r[35]=r[36]
            block=127
        elseif block == 127 then
            if not r[35] then block=148 else block=134 end
        elseif block == 134 then
            return unpackValues(r, 0, -1)
        elseif block == 141 then
            block=148
        elseif block == 148 then
            r[36]=upvalues[2][7]
            r[35]=r[36]
            r[36]=r[31]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36]=not r[35]
            if not r[36] then block=246 else block=190 end
        elseif block == 190 then
            r[36]=(367603)
            r[36]=r[34] == r[36]
            if not r[36] then block=232 else block=211 end
        elseif block == 211 then
            r[23]=r[5] / r[13]
            r[18]=r[11][r[4]]
            r[20]=r[13] .. r[20]
            block=232
        elseif block == 232 then
            return unpackValues(r, 0, -1)
        elseif block == 239 then
            block=246
        elseif block == 246 then
            r[37]=upvalues[3][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38]=r[32]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[38]=upvalues[4][7]
            r[38] = r[38][("Windup")]
            r[37]=r[38]
            if r[37] then block=323 else block=309 end
        elseif block == 309 then
            r[38]=(0.15)
            r[37]=r[38]
            block=323
        elseif block == 323 then
            r[39]=upvalues[4][7]
            r[39] = r[39][("ActiveDuration")]
            r[38]=r[39]
            if r[38] then block=365 else block=351 end
        elseif block == 351 then
            r[39]=(0.1)
            r[38]=r[39]
            block=365
        elseif block == 365 then
            r[38] = r[38] * (0.5)
            r[37] = r[37] + r[38]
            r[38]=upvalues[5][7]
            r[38] = r[38][("ping")]
            r[37] = r[37] + r[38]
            r[38]=(408473)
            r[38]=r[34] == r[38]
            if not r[38] then block=449 else block=421 end
        elseif block == 421 then
            r[12]=r[25] < r[14]
            r[18][r[9]]=r[13]
            r[12]=r[23] / r[23]
            r[20]=env[(408473)]
            block=449
        elseif block == 449 then
            r[38] = r[35][("Position")]
            r[39] = r[36] * r[37]
            r[38] = r[38] + r[39]
            r[39] = r[35][("Position")]
            r[40]=upvalues[5][7]
            r[40] = r[40][("ping")]
            r[40] = r[36] * r[40]
            r[39] = r[39] + r[40]
            r[41]=upvalues[6][7]
            r[41] = r[41][("autoMelee")]
            r[40]=r[41]
            if not r[40] then block=666 else block=533 end
        elseif block == 533 then
            r[42]=upvalues[5][7]
            r[42] = r[42][("lastMelee")]
            r[42] = r[32] - r[42]
            r[43]=upvalues[6][7]
            r[43] = r[43][("meleeCooldown")]
            r[42] = r[42] >= r[43]
            r[41]=r[42]
            if not r[41] then block=659 else block=589 end
        elseif block == 589 then
            r[43]=upvalues[7][7]
            r[42]=r[43]
            r[43] = r[33][("Position")]
            r[43] = r[38] - r[43]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42] = r[42][("Magnitude")]
            r[43]=upvalues[6][7]
            r[43] = r[43][("meleeRange")]
            r[42] = r[42] <= r[43]
            r[41]=r[42]
            block=659
        elseif block == 659 then
            r[40]=r[41]
            block=666
        elseif block == 666 then
            r[41]=(356698)
            r[41]=r[34] == r[41]
            if not r[41] then block=701 else block=687 end
        elseif block == 687 then
            r[24]=r[20]
            r[0]=r[1][r[10]]
            block=701
        elseif block == 701 then
            r[42]=upvalues[6][7]
            r[42] = r[42][("autoTackle")]
            r[41]=r[42]
            if not r[41] then block=862 else block=729 end
        elseif block == 729 then
            r[43]=upvalues[5][7]
            r[43] = r[43][("lastTackle")]
            r[43] = r[32] - r[43]
            r[44]=upvalues[6][7]
            r[44] = r[44][("tackleCooldown")]
            r[43] = r[43] >= r[44]
            r[42]=r[43]
            if not r[42] then block=855 else block=785 end
        elseif block == 785 then
            r[44]=upvalues[7][7]
            r[43]=r[44]
            r[44] = r[33][("Position")]
            r[44] = r[39] - r[44]
            do local f=r[43]; local n=1; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[43] = r[43][("Magnitude")]
            r[44]=upvalues[6][7]
            r[44] = r[44][("tackleRange")]
            r[43] = r[43] <= r[44]
            r[42]=r[43]
            block=855
        elseif block == 855 then
            r[41]=r[42]
            block=862
        elseif block == 862 then
            r[42]=upvalues[6][7]
            r[42] = r[42][("catcherAttackPriority")]
            if not (r[42] == ("Tackle First")) then block=1191 else block=883 end
        elseif block == 883 then
            r[42]=(430478)
            r[42]=r[34] == r[42]
            if not r[42] then block=932 else block=904 end
        elseif block == 904 then
            r[24]=r[5][r[16]]
            r[21][(408473)]=r[19]
            r[5][("pcall")]=r[7]
            r[9]=env[("tackleCooldown")]
            block=932
        elseif block == 932 then
            if not r[41] then block=1058 else block=939 end
        elseif block == 939 then
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[8][7]
            r[43] = r[43][("request")]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=(412106)
            r[42]=r[34] == r[42]
            if not r[42] then block=1023 else block=995 end
        elseif block == 995 then
            r[16][r[0]]=r[4]
            r[17]=r[15][r[20]]
            r[8]=#r[11]
            r[15][r[4]]=r[1]
            block=1023
        elseif block == 1023 then
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastTackle")]=r[42]
            return unpackValues(r, 0, -1)
        elseif block == 1051 then
            block=1058
        elseif block == 1058 then
            if not r[40] then block=1184 else block=1065 end
        elseif block == 1065 then
            r[42]=upvalues[5][7]
            r[43] = r[42][("meleeId")]
            r[44]=(1)
            r[45] = r[43] + r[44]
            r[42][("meleeId")]=r[45]
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[9][7]
            r[43] = r[43][("FireServer")]
            r[44]=upvalues[9][7]
            r[45]=upvalues[5][7]
            r[45] = r[45][("meleeId")]
            do local f=r[42]; local n=3; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastMelee")]=r[42]
            block=1184
        elseif block == 1184 then
            block=1814
        elseif block == 1191 then
            r[42]=upvalues[6][7]
            r[42] = r[42][("catcherAttackPriority")]
            if not (r[42] == ("Melee First")) then block=1513 else block=1212 end
        elseif block == 1212 then
            if not r[40] then block=1436 else block=1219 end
        elseif block == 1219 then
            r[42]=upvalues[5][7]
            r[43] = r[42][("meleeId")]
            r[44]=(1)
            r[45] = r[43] + r[44]
            r[42][("meleeId")]=r[45]
            r[42]=(407793)
            r[42]=r[34] == r[42]
            if not r[42] then block=1296 else block=1275 end
        elseif block == 1275 then
            r[14]=r[12] + r[9]
            r[0]=r[23] .. r[2]
            r[20]=r[4][(356698)]
            block=1296
        elseif block == 1296 then
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[9][7]
            r[43] = r[43][("FireServer")]
            r[44]=upvalues[9][7]
            r[45]=upvalues[5][7]
            r[45] = r[45][("meleeId")]
            do local f=r[42]; local n=3; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastMelee")]=r[42]
            r[42]=(340672)
            r[42]=r[34] == r[42]
            if not r[42] then block=1422 else block=1394 end
        elseif block == 1394 then
            r[10]=r[4] .. r[0]
            r[25]=(0.5)
            r[18][("autoMelee")]=r[16]
            r[19]=r[20][(356698)]
            block=1422
        elseif block == 1422 then
            return unpackValues(r, 0, -1)
        elseif block == 1429 then
            block=1436
        elseif block == 1436 then
            if not r[41] then block=1506 else block=1443 end
        elseif block == 1443 then
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[8][7]
            r[43] = r[43][("request")]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastTackle")]=r[42]
            block=1506
        elseif block == 1506 then
            block=1814
        elseif block == 1513 then
            r[43] = r[36][("Magnitude")]
            r[43] = r[43] >= (5)
            r[42]=r[43]
            if not r[42] then block=1548 else block=1541 end
        elseif block == 1541 then
            r[42]=r[41]
            block=1548
        elseif block == 1548 then
            if not r[42] then block=1618 else block=1555 end
        elseif block == 1555 then
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[8][7]
            r[43] = r[43][("request")]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastTackle")]=r[42]
            block=1814
        elseif block == 1618 then
            if not r[40] then block=1744 else block=1625 end
        elseif block == 1625 then
            r[42]=upvalues[5][7]
            r[43] = r[42][("meleeId")]
            r[44]=(1)
            r[45] = r[43] + r[44]
            r[42][("meleeId")]=r[45]
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[9][7]
            r[43] = r[43][("FireServer")]
            r[44]=upvalues[9][7]
            r[45]=upvalues[5][7]
            r[45] = r[45][("meleeId")]
            do local f=r[42]; local n=3; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastMelee")]=r[42]
            block=1814
        elseif block == 1744 then
            if not r[41] then block=1814 else block=1751 end
        elseif block == 1751 then
            r[43] = env[("pcall")]
            r[42]=r[43]
            r[43]=upvalues[8][7]
            r[43] = r[43][("request")]
            do local f=r[42]; local n=1; if n<0 then n=top-42-1 end; local m=0; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[42]=r[32]
            r[43]=upvalues[5][7]
            r[43][("lastTackle")]=r[42]
            block=1814
        elseif block == 1814 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[82] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(70718)
            r[35]=upvalues[1][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=not r[34]
            if not r[34] then block=134 else block=43 end
        elseif block == 43 then
            r[34]=nil
            r[35] = env[("Vector3")]
            r[35] = r[35][("zero")]
            r[36]=upvalues[2][7]
            r[36][("catcherTarget")]=r[34]
            r[37]=upvalues[2][7]
            r[37][("catcherPath")]=r[35]
            r[34]=(138691)
            r[34]=r[33] == r[34]
            if not r[34] then block=120 else block=113 end
        elseif block == 113 then
            r[17]=r[23][(138691)]
            block=120
        elseif block == 120 then
            return unpackValues(r, 0, -1)
        elseif block == 127 then
            block=134
        elseif block == 134 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36]=upvalues[4][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=not r[34]
            r[36]=r[37]
            if r[36] then block=302 else block=197 end
        elseif block == 197 then
            r[38]=not r[35]
            r[37]=r[38]
            if r[37] then block=295 else block=218 end
        elseif block == 218 then
            r[39] = r[35][("Health")]
            r[39] = r[39] <= (0)
            r[38]=r[39]
            if r[38] then block=288 else block=246 end
        elseif block == 246 then
            r[40] = r[35][("PlatformStand")]
            r[39]=r[40]
            if r[39] then block=281 else block=267 end
        elseif block == 267 then
            r[40] = r[35][("Sit")]
            r[39]=r[40]
            block=281
        elseif block == 281 then
            r[38]=r[39]
            block=288
        elseif block == 288 then
            r[37]=r[38]
            block=295
        elseif block == 295 then
            r[36]=r[37]
            block=302
        elseif block == 302 then
            if not r[36] then block=358 else block=309 end
        elseif block == 309 then
            r[36]=(162996)
            r[36]=r[33] == r[36]
            if not r[36] then block=344 else block=330 end
        elseif block == 330 then
            r[18]=r[6] + r[23]
            r[19]=r[17] / r[6]
            block=344
        elseif block == 344 then
            return unpackValues(r, 0, -1)
        elseif block == 351 then
            block=358
        elseif block == 358 then
            r[37]=upvalues[5][7]
            r[36]=r[37]
            r[37]=r[31]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=0; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=upvalues[6][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38] = r[34][("Position")]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=not r[36]
            if not r[37] then block=470 else block=435 end
        elseif block == 435 then
            r[37]=nil
            r[38]=upvalues[2][7]
            r[38][("catcherTarget")]=r[37]
            return unpackValues(r, 0, -1)
        elseif block == 463 then
            block=470
        elseif block == 470 then
            r[38]=upvalues[3][7]
            r[37]=r[38]
            r[38]=r[36]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            r[38]=(144398)
            r[38]=r[33] == r[38]
            if not r[38] then block=547 else block=519 end
        elseif block == 519 then
            r[2]=r[23]
            r[20]=r[5] < r[6]
            do local f=r[3]; local n=16; if n<0 then n=top-3-1 end; local m=18; if m==1 then r[3]=f(unpackValues(r,4,3+n)); top=4 elseif m==0 then f(unpackValues(r,4,3+n)); top=3 else local result=packValues(f(unpackValues(r,4,3+n))); if m<0 then m=result.n end; for i=1,m do r[3+i-1]=result[i] end; top=3+m end end
            r[14]=r[21] == r[7]
            block=547
        elseif block == 547 then
            r[38]=not r[37]
            if not r[38] then block=624 else block=561 end
        elseif block == 561 then
            r[38]=nil
            r[39]=upvalues[2][7]
            r[39][("catcherTarget")]=r[38]
            r[38]=(143708)
            r[38]=r[33] == r[38]
            if not r[38] then block=610 else block=603 end
        elseif block == 603 then
            r[15]=r[16] + r[11]
            block=610
        elseif block == 610 then
            return unpackValues(r, 0, -1)
        elseif block == 617 then
            block=624
        elseif block == 624 then
            r[38]=(158775)
            r[38]=r[33] == r[38]
            if not r[38] then block=652 else block=645 end
        elseif block == 645 then
            r[21]=r[23]
            block=652
        elseif block == 652 then
            r[39]=upvalues[7][7]
            r[38]=r[39]
            r[39]=r[36]
            r[40]=r[31]
            do local f=r[38]; local n=2; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[39] = r[37][("Position")]
            r[40]=upvalues[8][7]
            r[40] = r[40][("catcherPrediction")]
            r[40] = r[38] * r[40]
            r[39] = r[39] + r[40]
            r[41]=upvalues[9][7]
            r[40]=r[41]
            r[41] = r[34][("Position")]
            r[41] = r[39] - r[41]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[41] = r[40][("Magnitude")]
            if not (r[41] < (0.05)) then block=785 else block=771 end
        elseif block == 771 then
            return unpackValues(r, 0, -1)
        elseif block == 778 then
            block=785
        elseif block == 785 then
            r[41] = r[40][("Unit")]
            r[40]=r[41]
            r[42]=upvalues[8][7]
            r[42] = r[42][("smoothTurn")]
            r[41]=r[42]
            if not r[41] then block=862 else block=827 end
        elseif block == 827 then
            r[42]=upvalues[2][7]
            r[42] = r[42][("catcherPath")]
            r[42] = r[42][("Magnitude")]
            r[42] = r[42] > (0.05)
            r[41]=r[42]
            block=862
        elseif block == 862 then
            if not r[41] then block=1184 else block=869 end
        elseif block == 869 then
            r[42] = env[("math")]
            r[42] = r[42][("clamp")]
            r[41]=r[42]
            r[42]=(1)
            r[44] = env[("math")]
            r[44] = r[44][("exp")]
            r[43]=r[44]
            r[45] = env[("math")]
            r[45] = r[45][("max")]
            r[44]=r[45]
            r[45]=upvalues[8][7]
            r[45] = r[45][("turnRateCatcher")]
            r[46]=(1)
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[44]=-r[44]
            r[46] = env[("math")]
            r[46] = r[46][("max")]
            r[45]=r[46]
            r[46]=r[32]
            r[47]=(0.01)
            do local f=r[45]; local n=2; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[44] = r[44] * r[45]
            do local f=r[43]; local n=1; if n<0 then n=top-43-1 end; local m=1; if m==1 then r[43]=f(unpackValues(r,44,43+n)); top=44 elseif m==0 then f(unpackValues(r,44,43+n)); top=43 else local result=packValues(f(unpackValues(r,44,43+n))); if m<0 then m=result.n end; for i=1,m do r[43+i-1]=result[i] end; top=43+m end end
            r[42] = r[42] - r[43]
            r[43]=(0)
            r[44]=(1)
            do local f=r[41]; local n=3; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[44]=upvalues[2][7]
            r[44] = r[44][("catcherPath")]
            r[43]=r[44]
            r[42] = r[43][("Lerp")]
            r[44]=r[40]
            r[45]=r[41]
            do local f=r[42]; local n=3; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[43]=(112542)
            r[43]=r[33] == r[43]
            if not r[43] then block=1142 else block=1128 end
        elseif block == 1128 then
            r[17]=r[17] + r[8]
            r[16]=r[15] / r[4]
            block=1142
        elseif block == 1142 then
            r[43] = r[42][("Magnitude")]
            if not (r[43] > (0.05)) then block=1177 else block=1156 end
        elseif block == 1156 then
            r[43] = r[42][("Unit")]
            r[40]=r[43]
            block=1177
        elseif block == 1177 then
            block=1184
        elseif block == 1184 then
            r[41]=(107268)
            r[41]=r[33] == r[41]
            if not r[41] then block=1212 else block=1205 end
        elseif block == 1205 then
            r[12][r[22]]=r[1]
            block=1212
        elseif block == 1212 then
            r[41]=r[40]
            r[42]=upvalues[2][7]
            r[42][("catcherPath")]=r[41]
            r[41]=upvalues[8][7]
            r[41] = r[41][("catcherChase")]
            if not r[41] then block=1345 else block=1254 end
        elseif block == 1254 then
            r[41]=(166435)
            r[41]=r[33] == r[41]
            if not r[41] then block=1289 else block=1275 end
        elseif block == 1275 then
            do local f=r[18]; local n=24; if n<0 then n=top-18-1 end; local m=17; if m==1 then r[18]=f(unpackValues(r,19,18+n)); top=19 elseif m==0 then f(unpackValues(r,19,18+n)); top=18 else local result=packValues(f(unpackValues(r,19,18+n))); if m<0 then m=result.n end; for i=1,m do r[18+i-1]=result[i] end; top=18+m end end
            r[12]=r[7]
            block=1289
        elseif block == 1289 then
            r[41]=(true)
            r[35][("AutoRotate")]=r[41]
            r[42]=r[35]
            r[41] = r[42][("Move")]
            r[43]=r[40]
            r[44]=(false)
            do local f=r[41]; local n=3; if n<0 then n=top-41-1 end; local m=0; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            block=1345
        elseif block == 1345 then
            r[42]=upvalues[8][7]
            r[42] = r[42][("autoTackle")]
            r[41]=r[42]
            if r[41] then block=1394 else block=1373 end
        elseif block == 1373 then
            r[42]=upvalues[8][7]
            r[42] = r[42][("autoMelee")]
            r[41]=r[42]
            block=1394
        elseif block == 1394 then
            if not r[41] then block=1450 else block=1401 end
        elseif block == 1401 then
            r[42]=upvalues[10][7]
            r[41]=r[42]
            r[42]=r[36]
            r[43]=r[31]
            r[44]=r[34]
            do local f=r[41]; local n=3; if n<0 then n=top-41-1 end; local m=0; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            block=1450
        elseif block == 1450 then
            r[41]=(86156)
            r[41]=r[33] == r[41]
            if not r[41] then block=1478 else block=1471 end
        elseif block == 1471 then
            r[9]=r[0] < r[1]
            block=1478
        elseif block == 1478 then
            r[41]=upvalues[8][7]
            r[41] = r[41][("followTarget")]
            if not r[41] then block=1772 else block=1499 end
        elseif block == 1499 then
            r[41]=(111975)
            r[41]=r[33] == r[41]
            if not r[41] then block=1548 else block=1520 end
        elseif block == 1520 then
            r[1]=#r[19]
            r[19]=r[16] < r[23]
            r[4][(162996)]=r[24]
            r[3][r[19]]=r[6]
            block=1548
        elseif block == 1548 then
            r[41] = env[("workspace")]
            r[41] = r[41][("CurrentCamera")]
            if not r[41] then block=1765 else block=1569 end
        elseif block == 1569 then
            r[44] = r[41][("CFrame")]
            r[43]=r[44]
            r[42] = r[43][("Lerp")]
            r[45] = env[("CFrame")]
            r[45] = r[45][("lookAt")]
            r[44]=r[45]
            r[45] = r[41][("CFrame")]
            r[45] = r[45][("Position")]
            r[47] = env[("Vector3")]
            r[47] = r[47][("new")]
            r[46]=r[47]
            r[47]=(0)
            r[48]=(1.5)
            r[49]=(0)
            do local f=r[46]; local n=3; if n<0 then n=top-46-1 end; local m=1; if m==1 then r[46]=f(unpackValues(r,47,46+n)); top=47 elseif m==0 then f(unpackValues(r,47,46+n)); top=46 else local result=packValues(f(unpackValues(r,47,46+n))); if m<0 then m=result.n end; for i=1,m do r[46+i-1]=result[i] end; top=46+m end end
            r[46] = r[39] + r[46]
            do local f=r[44]; local n=2; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[46] = env[("math")]
            r[46] = r[46][("clamp")]
            r[45]=r[46]
            r[46]=upvalues[8][7]
            r[46] = r[46][("cameraResponse")]
            r[47]=(0.01)
            r[48]=(1)
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=-1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            do local f=r[42]; local n=-1; if n<0 then n=top-42-1 end; local m=1; if m==1 then r[42]=f(unpackValues(r,43,42+n)); top=43 elseif m==0 then f(unpackValues(r,43,42+n)); top=42 else local result=packValues(f(unpackValues(r,43,42+n))); if m<0 then m=result.n end; for i=1,m do r[42+i-1]=result[i] end; top=42+m end end
            r[41][("CFrame")]=r[42]
            block=1765
        elseif block == 1765 then
            block=1772
        elseif block == 1772 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[83] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    r[33] = args[3]
    r[34] = args[4]
    r[35] = args[5]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[36]=(366360)
            r[37] = r[31][r[32]]
            r[38]=r[37]
            if not r[38] then block=43 else block=29 end
        elseif block == 29 then
            r[39] = r[37][("Parent")]
            r[38]=r[39]
            block=43
        elseif block == 43 then
            if not r[38] then block=64 else block=50 end
        elseif block == 50 then
            return r[37]
        elseif block == 57 then
            block=64
        elseif block == 64 then
            r[38]=(443093)
            r[38]=r[36] == r[38]
            if not r[38] then block=106 else block=85 end
        elseif block == 85 then
            r[19]=r[8] < r[14]
            do local f=r[23]; local n=23; if n<0 then n=top-23-1 end; local m=4; if m==1 then r[23]=f(unpackValues(r,24,23+n)); top=24 elseif m==0 then f(unpackValues(r,24,23+n)); top=23 else local result=packValues(f(unpackValues(r,24,23+n))); if m<0 then m=result.n end; for i=1,m do r[23+i-1]=result[i] end; top=23+m end end
            r[22]=("Vector3")
            block=106
        elseif block == 106 then
            r[39] = env[("Instance")]
            r[39] = r[39][("new")]
            r[38]=r[39]
            r[39]=("Part")
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[37]=r[38]
            r[38]=(421833)
            r[38]=r[36] == r[38]
            if not r[38] then block=183 else block=169 end
        elseif block == 169 then
            r[8][("new")]=r[15]
            r[3]=r[24] < r[14]
            block=183
        elseif block == 183 then
            r[38]=("Azure_Utility")
            r[37][("Name")]=r[38]
            r[38] = env[("Enum")]
            r[38] = r[38][("PartType")]
            r[38] = r[38][("Ball")]
            r[37][("Shape")]=r[38]
            r[39] = env[("Vector3")]
            r[39] = r[39][("new")]
            r[38]=r[39]
            r[39]=r[33]
            r[40]=r[33]
            r[41]=r[33]
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[37][("Size")]=r[38]
            r[38]=(true)
            r[37][("Anchored")]=r[38]
            r[38]=(false)
            r[37][("CanCollide")]=r[38]
            r[38]=(411785)
            r[38]=r[36] == r[38]
            if not r[38] then block=351 else block=330 end
        elseif block == 330 then
            r[19]=#r[16]
            r[3]=r[23][("Name")]
            r[22]=#r[3]
            block=351
        elseif block == 351 then
            r[38]=(false)
            r[37][("CanTouch")]=r[38]
            r[38]=(false)
            r[37][("CanQuery")]=r[38]
            r[38]=(false)
            r[37][("CastShadow")]=r[38]
            r[38] = env[("Enum")]
            r[38] = r[38][("Material")]
            r[38] = r[38][("ForceField")]
            r[37][("Material")]=r[38]
            r[38]=r[34]
            r[37][("Color")]=r[38]
            r[38]=r[35]
            r[37][("Transparency")]=r[38]
            r[38] = env[("workspace")]
            r[37][("Parent")]=r[38]
            r[38]=r[37]
            r[31][r[32]]=r[38]
            return r[37]
        elseif block == 484 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[84] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(639679)
            r[33]=upvalues[1][7]
            r[33] = r[33][("goal")]
            r[32]=r[33]
            if not r[32] then block=64 else block=36 end
        elseif block == 36 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("goal")]
            r[33] = r[33][("Parent")]
            r[32]=r[33]
            block=64
        elseif block == 64 then
            if not r[32] then block=113 else block=71 end
        elseif block == 71 then
            r[34]=upvalues[1][7]
            r[34] = r[34][("goal")]
            r[33]=r[34]
            r[32] = r[33][("Destroy")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            block=113
        elseif block == 113 then
            r[32]=(686430)
            r[32]=r[31] == r[32]
            if not r[32] then block=148 else block=134 end
        elseif block == 134 then
            r[15]=r[19]
            r[16]=#r[23]
            block=148
        elseif block == 148 then
            r[32]=nil
            r[33]=upvalues[1][7]
            r[33][("goal")]=r[32]
            r[33] = env[("pairs")]
            r[32]=r[33]
            r[33]=upvalues[1][7]
            r[33] = r[33][("threats")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=3; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            block=316
        elseif block == 211 then
            r[37] = r[36][("Parent")]
            if not r[37] then block=288 else block=225 end
        elseif block == 225 then
            r[37]=(731657)
            r[37]=r[31] == r[37]
            if not r[37] then block=260 else block=246 end
        elseif block == 246 then
            r[23]=r[0]
            r[6]=r[20] .. r[19]
            block=260
        elseif block == 260 then
            r[38]=r[36]
            r[37] = r[38][("Destroy")]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=288
        elseif block == 288 then
            r[37]=nil
            r[38]=upvalues[1][7]
            r[38] = r[38][("threats")]
            r[38][r[35]]=r[37]
            block=316
        elseif block == 316 then
            r[35], r[36]=r[32](r[33],r[34])
            if r[35]~=nil then r[34]=r[35]; block=211 else block=330 end
        elseif block == 330 then
            r[33] = env[("pairs")]
            r[32]=r[33]
            r[33]=upvalues[1][7]
            r[33] = r[33][("hitboxes")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=3; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            block=442
        elseif block == 372 then
            r[37] = r[36][("Parent")]
            if not r[37] then block=414 else block=386 end
        elseif block == 386 then
            r[38]=r[36]
            r[37] = r[38][("Destroy")]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=0; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            block=414
        elseif block == 414 then
            r[37]=nil
            r[38]=upvalues[1][7]
            r[38] = r[38][("hitboxes")]
            r[38][r[35]]=r[37]
            block=442
        elseif block == 442 then
            r[35], r[36]=r[32](r[33],r[34])
            if r[35]~=nil then r[34]=r[35]; block=372 else block=456 end
        elseif block == 456 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[85] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(798412)
            r[34]=upvalues[1][7]
            r[34] = r[34][("showThreats")]
            r[33]=r[34]
            if not r[33] then block=64 else block=36 end
        elseif block == 36 then
            r[35]=upvalues[2][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33]=r[34]
            block=64
        elseif block == 64 then
            if not r[33] then block=778 else block=71 end
        elseif block == 71 then
            r[33]=(875536)
            r[33]=r[32] == r[33]
            if not r[33] then block=113 else block=92 end
        elseif block == 92 then
            r[5]=r[8] + r[17]
            do local f=r[8]; local n=8; if n<0 then n=top-8-1 end; local m=16; if m==1 then r[8]=f(unpackValues(r,9,8+n)); top=9 elseif m==0 then f(unpackValues(r,9,8+n)); top=8 else local result=packValues(f(unpackValues(r,9,8+n))); if m<0 then m=result.n end; for i=1,m do r[8+i-1]=result[i] end; top=8+m end end
            do local f=r[3]; local n=11; if n<0 then n=top-3-1 end; local m=17; if m==1 then r[3]=f(unpackValues(r,4,3+n)); top=4 elseif m==0 then f(unpackValues(r,4,3+n)); top=3 else local result=packValues(f(unpackValues(r,4,3+n))); if m<0 then m=result.n end; for i=1,m do r[3+i-1]=result[i] end; top=3+m end end
            block=113
        elseif block == 113 then
            r[34]=upvalues[3][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=r[33]
            if not r[35] then block=190 else block=148 end
        elseif block == 148 then
            r[37]=upvalues[4][7]
            r[36]=r[37]
            r[37]=r[31]
            r[38] = r[33][("Position")]
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[35]=r[36]
            block=190
        elseif block == 190 then
            r[34]=r[35]
            if r[34] then block=218 else block=204 end
        elseif block == 204 then
            r[35]={}
            r[34]=r[35]
            block=218
        elseif block == 218 then
            r[35]=(818947)
            r[35]=r[32] == r[35]
            if not r[35] then block=260 else block=239 end
        elseif block == 239 then
            r[0]=r[19] / r[7]
            r[13][r[13]]=r[23]
            r[2][r[18]]=r[7]
            block=260
        elseif block == 260 then
            r[35]=(1)
            r[37] = env[("math")]
            r[37] = r[37][("min")]
            r[36]=r[37]
            r[37]=#r[34]
            r[38]=(8)
            do local f=r[36]; local n=2; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=(1)
            r[35]=r[35]-r[37]; block=568
        elseif block == 323 then
            r[39]=(879531)
            r[39]=r[32] == r[39]
            if not r[39] then block=358 else block=344 end
        elseif block == 344 then
            r[20][r[0]]=r[7]
            r[10]=r[12] * r[21]
            block=358
        elseif block == 358 then
            r[39] = r[34][r[38]]
            r[40]=(885601)
            r[40]=r[32] == r[40]
            if not r[40] then block=414 else block=386 end
        elseif block == 386 then
            do local f=r[4]; local n=22; if n<0 then n=top-4-1 end; local m=22; if m==1 then r[4]=f(unpackValues(r,5,4+n)); top=5 elseif m==0 then f(unpackValues(r,5,4+n)); top=4 else local result=packValues(f(unpackValues(r,5,4+n))); if m<0 then m=result.n end; for i=1,m do r[4+i-1]=result[i] end; top=4+m end end
            r[8][("position")]=r[5]
            r[5]=r[3] * r[11]
            r[14]=r[0]
            block=414
        elseif block == 414 then
            r[41]=upvalues[5][7]
            r[40]=r[41]
            r[41]=upvalues[6][7]
            r[41] = r[41][("threats")]
            r[42]=r[38]
            r[43] = r[39][("danger")]
            r[43] = r[43] * (2)
            r[45] = env[("Color3")]
            r[45] = r[45][("fromRGB")]
            r[44]=r[45]
            r[45]=(255)
            r[46]=(90)
            r[47]=(90)
            do local f=r[44]; local n=3; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[45]=(0.82)
            do local f=r[40]; local n=5; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[42] = env[("CFrame")]
            r[42] = r[42][("new")]
            r[41]=r[42]
            r[42] = r[39][("position")]
            do local f=r[41]; local n=1; if n<0 then n=top-41-1 end; local m=1; if m==1 then r[41]=f(unpackValues(r,42,41+n)); top=42 elseif m==0 then f(unpackValues(r,42,41+n)); top=41 else local result=packValues(f(unpackValues(r,42,41+n))); if m<0 then m=result.n end; for i=1,m do r[41+i-1]=result[i] end; top=41+m end end
            r[40][("CFrame")]=r[41]
            block=568
        elseif block == 568 then
            r[35]=r[35]+r[37]
            if (r[37]>0 and r[35]<=r[36]) or (r[37]<=0 and r[35]>=r[36]) then r[38]=r[35]; block=323 else block=575 end
        elseif block == 575 then
            r[35]=#r[34]
            r[35] = r[35] + (1)
            r[36]=upvalues[6][7]
            r[36] = r[36][("threats")]
            r[36]=#r[36]
            r[37]=(1)
            r[35]=r[35]-r[37]; block=764
        elseif block == 624 then
            r[39]=upvalues[6][7]
            r[39] = r[39][("threats")]
            r[39] = r[39][r[38]]
            r[40]=r[39]
            if not r[40] then block=673 else block=659 end
        elseif block == 659 then
            r[41] = r[39][("Parent")]
            r[40]=r[41]
            block=673
        elseif block == 673 then
            if not r[40] then block=736 else block=680 end
        elseif block == 680 then
            r[40]=(834005)
            r[40]=r[32] == r[40]
            if not r[40] then block=708 else block=701 end
        elseif block == 701 then
            r[9]=r[10] == r[17]
            block=708
        elseif block == 708 then
            r[41]=r[39]
            r[40] = r[41][("Destroy")]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=0; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            block=736
        elseif block == 736 then
            r[40]=nil
            r[41]=upvalues[6][7]
            r[41] = r[41][("threats")]
            r[41][r[38]]=r[40]
            block=764
        elseif block == 764 then
            r[35]=r[35]+r[37]
            if (r[37]>0 and r[35]<=r[36]) or (r[37]<=0 and r[35]>=r[36]) then r[38]=r[35]; block=624 else block=771 end
        elseif block == 771 then
            block=1002
        elseif block == 778 then
            r[34] = env[("pairs")]
            r[33]=r[34]
            r[34]=upvalues[6][7]
            r[34] = r[34][("threats")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=988
        elseif block == 820 then
            r[38] = r[37][("Parent")]
            if not r[38] then block=911 else block=834 end
        elseif block == 834 then
            r[38]=(875248)
            r[38]=r[32] == r[38]
            if not r[38] then block=883 else block=855 end
        elseif block == 855 then
            r[24]=r[4] .. r[9]
            r[23][r[3]]=r[12]
            r[8]=r[3]
            r[1]=r[14]
            block=883
        elseif block == 883 then
            r[39]=r[37]
            r[38] = r[39][("Destroy")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=911
        elseif block == 911 then
            r[38]=(890202)
            r[38]=r[32] == r[38]
            if not r[38] then block=960 else block=932 end
        elseif block == 932 then
            r[21]=r[11][(2)]
            r[25]=r[2] / r[15]
            r[17]=r[8] < r[19]
            r[24]=r[5] * r[6]
            block=960
        elseif block == 960 then
            r[38]=nil
            r[39]=upvalues[6][7]
            r[39] = r[39][("threats")]
            r[39][r[36]]=r[38]
            block=988
        elseif block == 988 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=820 else block=1002 end
        elseif block == 1002 then
            r[34]=upvalues[1][7]
            r[34] = r[34][("showGoal")]
            r[33]=r[34]
            if not r[33] then block=1051 else block=1030 end
        elseif block == 1030 then
            r[34]=upvalues[7][7]
            r[34] = r[34][("goal")]
            r[33]=r[34]
            block=1051
        elseif block == 1051 then
            if not r[33] then block=1828 else block=1058 end
        elseif block == 1058 then
            r[33]=(849601)
            r[33]=r[32] == r[33]
            if not r[33] then block=1107 else block=1079 end
        elseif block == 1079 then
            r[23]=r[4] / r[24]
            r[14]=r[2] - r[22]
            r[25][r[10]]=r[23]
            do local f=r[21]; local n=8; if n<0 then n=top-21-1 end; local m=8; if m==1 then r[21]=f(unpackValues(r,22,21+n)); top=22 elseif m==0 then f(unpackValues(r,22,21+n)); top=21 else local result=packValues(f(unpackValues(r,22,21+n))); if m<0 then m=result.n end; for i=1,m do r[21+i-1]=result[i] end; top=21+m end end
            block=1107
        elseif block == 1107 then
            r[33]=upvalues[6][7]
            r[33] = r[33][("goal")]
            r[34]=(870443)
            r[34]=r[32] == r[34]
            if not r[34] then block=1149 else block=1142 end
        elseif block == 1142 then
            r[0]=#r[17]
            block=1149
        elseif block == 1149 then
            r[35]=not r[33]
            r[34]=r[35]
            if r[34] then block=1191 else block=1170 end
        elseif block == 1170 then
            r[35] = r[33][("Parent")]
            r[35]=not r[35]
            r[34]=r[35]
            block=1191
        elseif block == 1191 then
            if not r[34] then block=1723 else block=1198 end
        elseif block == 1198 then
            r[34]=(869041)
            r[34]=r[32] == r[34]
            if not r[34] then block=1240 else block=1219 end
        elseif block == 1219 then
            r[6]=#r[11]
            r[17]=r[17][(8)]
            r[24]=r[5] - r[17]
            block=1240
        elseif block == 1240 then
            r[35] = env[("Instance")]
            r[35] = r[35][("new")]
            r[34]=r[35]
            r[35]=("Part")
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33]=r[34]
            r[34]=("Azure_Goal")
            r[33][("Name")]=r[34]
            r[34] = env[("Enum")]
            r[34] = r[34][("PartType")]
            r[34] = r[34][("Ball")]
            r[33][("Shape")]=r[34]
            r[34]=(883838)
            r[34]=r[32] == r[34]
            if not r[34] then block=1352 else block=1345 end
        elseif block == 1345 then
            r[15]=r[11]
            block=1352
        elseif block == 1352 then
            r[35] = env[("Vector3")]
            r[35] = r[35][("new")]
            r[34]=r[35]
            r[35]=(2.5)
            r[36]=(2.5)
            r[37]=(2.5)
            do local f=r[34]; local n=3; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33][("Size")]=r[34]
            r[34]=(true)
            r[33][("Anchored")]=r[34]
            r[34]=(857837)
            r[34]=r[32] == r[34]
            if not r[34] then block=1471 else block=1443 end
        elseif block == 1443 then
            r[6]=r[17] + r[1]
            r[2]=r[15] / r[5]
            r[23]=("Color3")
            r[25][(nil)]=r[15]
            block=1471
        elseif block == 1471 then
            r[34]=(false)
            r[33][("CanCollide")]=r[34]
            r[34]=(false)
            r[33][("CanTouch")]=r[34]
            r[34]=(852133)
            r[34]=r[32] == r[34]
            if not r[34] then block=1527 else block=1520 end
        elseif block == 1520 then
            r[1]=r[23] / r[19]
            block=1527
        elseif block == 1527 then
            r[34]=(false)
            r[33][("CanQuery")]=r[34]
            r[34]=(false)
            r[33][("CastShadow")]=r[34]
            r[34] = env[("Enum")]
            r[34] = r[34][("Material")]
            r[34] = r[34][("ForceField")]
            r[33][("Material")]=r[34]
            r[35] = env[("Color3")]
            r[35] = r[35][("fromRGB")]
            r[34]=r[35]
            r[35]=(80)
            r[36]=(200)
            r[37]=(255)
            do local f=r[34]; local n=3; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33][("Color")]=r[34]
            r[34]=(859301)
            r[34]=r[32] == r[34]
            if not r[34] then block=1667 else block=1660 end
        elseif block == 1660 then
            r[23]=("threats")
            block=1667
        elseif block == 1667 then
            r[34]=(0.45)
            r[33][("Transparency")]=r[34]
            r[34] = env[("workspace")]
            r[33][("Parent")]=r[34]
            r[34]=r[33]
            r[35]=upvalues[6][7]
            r[35][("goal")]=r[34]
            block=1723
        elseif block == 1723 then
            r[34]=(858509)
            r[34]=r[32] == r[34]
            if not r[34] then block=1772 else block=1744 end
        elseif block == 1744 then
            r[20]=r[13] * r[20]
            r[15]=r[15] / r[18]
            r[21]=("CFrame")
            r[4]=r[17] == r[18]
            block=1772
        elseif block == 1772 then
            r[35] = env[("CFrame")]
            r[35] = r[35][("new")]
            r[34]=r[35]
            r[35]=upvalues[7][7]
            r[35] = r[35][("goal")]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33][("CFrame")]=r[34]
            block=2024
        elseif block == 1828 then
            r[33]=upvalues[6][7]
            r[33] = r[33][("goal")]
            if not r[33] then block=2024 else block=1849 end
        elseif block == 1849 then
            r[33]=(877854)
            r[33]=r[32] == r[33]
            if not r[33] then block=1877 else block=1870 end
        elseif block == 1870 then
            r[5]=r[1][r[24]]
            block=1877
        elseif block == 1877 then
            r[33]=upvalues[6][7]
            r[33] = r[33][("goal")]
            r[33] = r[33][("Parent")]
            if not r[33] then block=1947 else block=1905 end
        elseif block == 1905 then
            r[35]=upvalues[6][7]
            r[35] = r[35][("goal")]
            r[34]=r[35]
            r[33] = r[34][("Destroy")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=1947
        elseif block == 1947 then
            r[33]=(880399)
            r[33]=r[32] == r[33]
            if not r[33] then block=1996 else block=1968 end
        elseif block == 1968 then
            r[11]=r[24] * r[9]
            r[10]=env[(798412)]
            r[7]=r[17] == r[19]
            r[7]=r[25] - r[14]
            block=1996
        elseif block == 1996 then
            r[33]=nil
            r[34]=upvalues[6][7]
            r[34][("goal")]=r[33]
            block=2024
        elseif block == 2024 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("showHitboxes")]
            if not r[33] then block=3403 else block=2045 end
        elseif block == 2045 then
            r[34]=upvalues[8][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]={}
            r[36] = env[("ipairs")]
            r[35]=r[36]
            r[38]=upvalues[9][7]
            r[37]=r[38]
            r[36] = r[37][("GetPlayers")]
            do local f=r[36]; local n=1; if n<0 then n=top-36-1 end; local m=-1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            do local f=r[35]; local n=-1; if n<0 then n=top-35-1 end; local m=3; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            block=3228
        elseif block == 2129 then
            r[40]=(897679)
            r[40]=r[32] == r[40]
            if not r[40] then block=2157 else block=2150 end
        elseif block == 2150 then
            r[8]=r[20] < r[14]
            block=2157
        elseif block == 2157 then
            r[41]=upvalues[10][7]
            r[41] = r[39] ~= r[41]
            r[40]=r[41]
            if not r[40] then block=2199 else block=2185 end
        elseif block == 2185 then
            r[41] = r[39][("Parent")]
            r[40]=r[41]
            block=2199
        elseif block == 2199 then
            if not r[40] then block=3228 else block=2206 end
        elseif block == 2206 then
            r[41]=r[39]
            r[40] = r[41][("GetAttribute")]
            r[42]=("GameRole")
            do local f=r[40]; local n=2; if n<0 then n=top-40-1 end; local m=1; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            r[43] = r[33] == ("Runner")
            r[42]=r[43]
            if not r[42] then block=2269 else block=2255 end
        elseif block == 2255 then
            r[43] = r[40] == ("Catcher")
            r[42]=r[43]
            block=2269
        elseif block == 2269 then
            r[41]=r[42]
            if r[41] then block=2325 else block=2283 end
        elseif block == 2283 then
            r[43] = r[33] == ("Catcher")
            r[42]=r[43]
            if not r[42] then block=2318 else block=2304 end
        elseif block == 2304 then
            r[43] = r[40] == ("Runner")
            r[42]=r[43]
            block=2318
        elseif block == 2318 then
            r[41]=r[42]
            block=2325
        elseif block == 2325 then
            r[43]=r[41]
            if not r[43] then block=2374 else block=2339 end
        elseif block == 2339 then
            r[45]=upvalues[3][7]
            r[44]=r[45]
            r[45]=r[39]
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[43]=r[44]
            block=2374
        elseif block == 2374 then
            r[42]=r[43]
            if r[42] then block=2402 else block=2388 end
        elseif block == 2388 then
            r[43]=nil
            r[42]=r[43]
            block=2402
        elseif block == 2402 then
            if not r[42] then block=3221 else block=2409 end
        elseif block == 2409 then
            r[43]=(832413)
            r[43]=r[32] == r[43]
            if not r[43] then block=2458 else block=2430 end
        elseif block == 2430 then
            r[25]=r[24] - r[25]
            r[11]=r[10][(818947)]
            r[4]=r[19] / r[9]
            r[4]=("threats")
            block=2458
        elseif block == 2458 then
            r[43]=(true)
            r[34][r[39]]=r[43]
            r[43]=upvalues[6][7]
            r[43] = r[43][("hitboxes")]
            r[43] = r[43][r[39]]
            r[45]=not r[43]
            r[44]=r[45]
            if r[44] then block=2535 else block=2514 end
        elseif block == 2514 then
            r[45] = r[43][("Parent")]
            r[45]=not r[45]
            r[44]=r[45]
            block=2535
        elseif block == 2535 then
            if not r[44] then block=2969 else block=2542 end
        elseif block == 2542 then
            r[45] = env[("Instance")]
            r[45] = r[45][("new")]
            r[44]=r[45]
            r[45]=("Part")
            do local f=r[44]; local n=1; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[43]=r[44]
            r[44]=("Azure_Hitbox")
            r[43][("Name")]=r[44]
            r[44]=(857000)
            r[44]=r[32] == r[44]
            if not r[44] then block=2647 else block=2619 end
        elseif block == 2619 then
            r[21]=r[11][(875536)]
            r[16]=r[7] + r[24]
            r[9]=r[25] - r[7]
            r[24]=r[8] == r[1]
            block=2647
        elseif block == 2647 then
            r[44] = env[("Enum")]
            r[44] = r[44][("PartType")]
            r[44] = r[44][("Ball")]
            r[43][("Shape")]=r[44]
            r[44]=(879658)
            r[44]=r[32] == r[44]
            if not r[44] then block=2710 else block=2696 end
        elseif block == 2696 then
            do local f=r[25]; local n=2; if n<0 then n=top-25-1 end; local m=11; if m==1 then r[25]=f(unpackValues(r,26,25+n)); top=26 elseif m==0 then f(unpackValues(r,26,25+n)); top=25 else local result=packValues(f(unpackValues(r,26,25+n))); if m<0 then m=result.n end; for i=1,m do r[25+i-1]=result[i] end; top=25+m end end
            r[22]=r[9]
            block=2710
        elseif block == 2710 then
            r[44]=(true)
            r[43][("Anchored")]=r[44]
            r[44]=(false)
            r[43][("CanCollide")]=r[44]
            r[44]=(844043)
            r[44]=r[32] == r[44]
            if not r[44] then block=2780 else block=2759 end
        elseif block == 2759 then
            r[13]=r[5][r[17]]
            r[10]=r[24] * r[14]
            r[10]=r[17][("new")]
            block=2780
        elseif block == 2780 then
            r[44]=(false)
            r[43][("CanTouch")]=r[44]
            r[44]=(false)
            r[43][("CanQuery")]=r[44]
            r[44]=(false)
            r[43][("CastShadow")]=r[44]
            r[44] = env[("Enum")]
            r[44] = r[44][("Material")]
            r[44] = r[44][("ForceField")]
            r[43][("Material")]=r[44]
            r[45] = env[("Color3")]
            r[45] = r[45][("fromRGB")]
            r[44]=r[45]
            r[45]=(255)
            r[46]=(180)
            r[47]=(80)
            do local f=r[44]; local n=3; if n<0 then n=top-44-1 end; local m=1; if m==1 then r[44]=f(unpackValues(r,45,44+n)); top=45 elseif m==0 then f(unpackValues(r,45,44+n)); top=44 else local result=packValues(f(unpackValues(r,45,44+n))); if m<0 then m=result.n end; for i=1,m do r[44+i-1]=result[i] end; top=44+m end end
            r[43][("Color")]=r[44]
            r[44]=(0.75)
            r[43][("Transparency")]=r[44]
            r[44] = env[("workspace")]
            r[43][("Parent")]=r[44]
            r[44]=r[43]
            r[45]=upvalues[6][7]
            r[45] = r[45][("hitboxes")]
            r[45][r[39]]=r[44]
            block=2969
        elseif block == 2969 then
            r[44]=(878161)
            r[44]=r[32] == r[44]
            if not r[44] then block=3018 else block=2990 end
        elseif block == 2990 then
            r[12]=r[2] + r[16]
            r[16]=(2)
            r[9][(nil)]=r[15]
            r[16]=r[23] * r[11]
            block=3018
        elseif block == 3018 then
            r[45]=upvalues[11][7]
            r[45] = r[45][("RunnerRadius")]
            r[44]=r[45]
            if r[44] then block=3060 else block=3046 end
        elseif block == 3046 then
            r[45]=(3)
            r[44]=r[45]
            block=3060
        elseif block == 3060 then
            r[44] = r[44] * (2)
            r[46] = env[("Vector3")]
            r[46] = r[46][("new")]
            r[45]=r[46]
            r[46]=r[44]
            r[47]=r[44]
            r[48]=r[44]
            do local f=r[45]; local n=3; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[43][("Size")]=r[45]
            r[45]=(832275)
            r[45]=r[32] == r[45]
            if not r[45] then block=3172 else block=3144 end
        elseif block == 3144 then
            r[10]=r[5]
            r[5]=r[2] .. r[8]
            r[7]=r[22] * r[16]
            r[7]=r[5][r[17]]
            block=3172
        elseif block == 3172 then
            r[46] = env[("CFrame")]
            r[46] = r[46][("new")]
            r[45]=r[46]
            r[46] = r[42][("Position")]
            do local f=r[45]; local n=1; if n<0 then n=top-45-1 end; local m=1; if m==1 then r[45]=f(unpackValues(r,46,45+n)); top=46 elseif m==0 then f(unpackValues(r,46,45+n)); top=45 else local result=packValues(f(unpackValues(r,46,45+n))); if m<0 then m=result.n end; for i=1,m do r[45+i-1]=result[i] end; top=45+m end end
            r[43][("CFrame")]=r[45]
            block=3221
        elseif block == 3221 then
            block=3228
        elseif block == 3228 then
            r[38], r[39]=r[35](r[36],r[37])
            if r[38]~=nil then r[37]=r[38]; block=2129 else block=3242 end
        elseif block == 3242 then
            r[36] = env[("pairs")]
            r[35]=r[36]
            r[36]=upvalues[6][7]
            r[36] = r[36][("hitboxes")]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=3; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            block=3382
        elseif block == 3284 then
            r[40] = r[34][r[38]]
            r[40]=not r[40]
            if not r[40] then block=3382 else block=3305 end
        elseif block == 3305 then
            r[40] = r[39][("Parent")]
            if not r[40] then block=3347 else block=3319 end
        elseif block == 3319 then
            r[41]=r[39]
            r[40] = r[41][("Destroy")]
            do local f=r[40]; local n=1; if n<0 then n=top-40-1 end; local m=0; if m==1 then r[40]=f(unpackValues(r,41,40+n)); top=41 elseif m==0 then f(unpackValues(r,41,40+n)); top=40 else local result=packValues(f(unpackValues(r,41,40+n))); if m<0 then m=result.n end; for i=1,m do r[40+i-1]=result[i] end; top=40+m end end
            block=3347
        elseif block == 3347 then
            r[40]=nil
            r[41]=upvalues[6][7]
            r[41] = r[41][("hitboxes")]
            r[41][r[38]]=r[40]
            block=3382
        elseif block == 3382 then
            r[38], r[39]=r[35](r[36],r[37])
            if r[38]~=nil then r[37]=r[38]; block=3284 else block=3396 end
        elseif block == 3396 then
            block=3599
        elseif block == 3403 then
            r[34] = env[("pairs")]
            r[33]=r[34]
            r[34]=upvalues[6][7]
            r[34] = r[34][("hitboxes")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=3585
        elseif block == 3445 then
            r[38]=(881969)
            r[38]=r[32] == r[38]
            if not r[38] then block=3487 else block=3466 end
        elseif block == 3466 then
            r[15]=#r[10]
            r[17]=r[2] < r[12]
            r[6]=r[13]
            block=3487
        elseif block == 3487 then
            r[38] = r[37][("Parent")]
            if not r[38] then block=3557 else block=3501 end
        elseif block == 3501 then
            r[38]=(886646)
            r[38]=r[32] == r[38]
            if not r[38] then block=3529 else block=3522 end
        elseif block == 3522 then
            r[12][(8)]=r[19]
            block=3529
        elseif block == 3529 then
            r[39]=r[37]
            r[38] = r[39][("Destroy")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=3557
        elseif block == 3557 then
            r[38]=nil
            r[39]=upvalues[6][7]
            r[39] = r[39][("hitboxes")]
            r[39][r[36]]=r[38]
            block=3585
        elseif block == 3585 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=3445 else block=3599 end
        elseif block == 3599 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[86] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(723935)
            r[35] = r[31] == ("State")
            r[34]=r[35]
            if not r[34] then block=71 else block=29 end
        elseif block == 29 then
            r[36] = env[("type")]
            r[35]=r[36]
            r[36]=r[32]
            do local f=r[35]; local n=1; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[35] = r[35] == ("table")
            r[34]=r[35]
            block=71
        elseif block == 71 then
            if not r[34] then block=225 else block=78 end
        elseif block == 78 then
            r[34]=(743510)
            r[34]=r[33] == r[34]
            if not r[34] then block=127 else block=99 end
        elseif block == 99 then
            r[22]=r[6] / r[16]
            r[24]=(nil)
            r[17]=r[16] .. r[8]
            r[24]=(nil)
            block=127
        elseif block == 127 then
            r[34]=r[32]
            r[35]=upvalues[1][7]
            r[35][("armory")]=r[34]
            r[35]=upvalues[1][7]
            r[35] = r[35][("armory")]
            r[35] = r[35][("abilities")]
            r[34]=r[35]
            if r[34] then block=197 else block=183 end
        elseif block == 183 then
            r[35]={}
            r[34]=r[35]
            block=197
        elseif block == 197 then
            r[35]=upvalues[1][7]
            r[35] = r[35][("armory")]
            r[35][("abilities")]=r[34]
            block=225
        elseif block == 225 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[87] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(820990)
            r[35] = r[31] == ("Cancelled")
            r[34]=r[35]
            if not r[34] then block=99 else block=29 end
        elseif block == 29 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("reviveTarget")]
            r[35]=r[36]
            if not r[35] then block=92 else block=57 end
        elseif block == 57 then
            r[36]=upvalues[1][7]
            r[36] = r[36][("reviveTarget")]
            r[36] = r[36][("UserId")]
            r[36] = r[36] == r[32]
            r[35]=r[36]
            block=92
        elseif block == 92 then
            r[34]=r[35]
            block=99
        elseif block == 99 then
            if not r[34] then block=155 else block=106 end
        elseif block == 106 then
            r[34]=(false)
            r[35]=(0)
            r[36]=upvalues[1][7]
            r[36][("reviveStarted")]=r[34]
            r[37]=upvalues[1][7]
            r[37][("reviveStartAt")]=r[35]
            block=155
        elseif block == 155 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[88] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(911347)
            r[32]=(1002379)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=29 end
        elseif block == 29 then
            do local f=r[14]; local n=21; if n<0 then n=top-14-1 end; local m=0; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            r[2]=r[12] == r[23]
            r[9]=r[24] - r[0]
            block=50
        elseif block == 50 then
            r[32]=nil
            r[33]=nil
            r[34]=upvalues[1][7]
            r[34][("profile")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("profileRole")]=r[33]
            r[32]=(956575)
            r[32]=r[31] == r[32]
            if not r[32] then block=127 else block=113 end
        elseif block == 113 then
            r[20]=r[8] - r[17]
            do local f=r[8]; local n=9; if n<0 then n=top-8-1 end; local m=7; if m==1 then r[8]=f(unpackValues(r,9,8+n)); top=9 elseif m==0 then f(unpackValues(r,9,8+n)); top=8 else local result=packValues(f(unpackValues(r,9,8+n))); if m<0 then m=result.n end; for i=1,m do r[8+i-1]=result[i] end; top=8+m end end
            block=127
        elseif block == 127 then
            r[32]=nil
            r[33]=(false)
            r[34]=upvalues[1][7]
            r[34][("lastMovePosition")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("stuck")]=r[33]
            r[32]=(918095)
            r[32]=r[31] == r[32]
            if not r[32] then block=197 else block=190 end
        elseif block == 190 then
            r[21]=r[15] + r[3]
            block=197
        elseif block == 197 then
            r[32]=nil
            r[33]=nil
            r[34]=("SafeZone")
            r[35]=upvalues[1][7]
            r[35][("goal")]=r[32]
            r[36]=upvalues[1][7]
            r[36][("goalSide")]=r[33]
            r[37]=upvalues[1][7]
            r[37][("goalMode")]=r[34]
            r[32]=(false)
            r[33]=(false)
            r[34]=upvalues[1][7]
            r[34][("routeActive")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("routeComplete")]=r[33]
            r[32]=nil
            r[33]=nil
            r[34]=upvalues[1][7]
            r[34][("routeStartSide")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("routeTargetSide")]=r[33]
            r[32]=nil
            r[33] = env[("math")]
            r[33] = r[33][("huge")]
            r[33]=-r[33]
            r[34]=upvalues[1][7]
            r[34][("routeCompletePosition")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("routeCompleteAt")]=r[33]
            r[32]=nil
            r[33]=nil
            r[34]=upvalues[1][7]
            r[34][("gemTarget")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("reviveTarget")]=r[33]
            r[32]=(false)
            r[33]=(0)
            r[34]=upvalues[1][7]
            r[34][("reviveStarted")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("reviveStartAt")]=r[33]
            r[32]={}
            r[33]={}
            r[34]={}
            r[35]={}
            r[36]=upvalues[1][7]
            r[36][("threatHistory")]=r[32]
            r[37]=upvalues[1][7]
            r[37][("threats")]=r[33]
            r[38]=upvalues[1][7]
            r[38][("catchers")]=r[34]
            r[39]=upvalues[1][7]
            r[39][("catcherTargets")]=r[35]
            r[32] = env[("math")]
            r[32] = r[32][("huge")]
            r[32]=-r[32]
            r[33]=("idle")
            r[34]=upvalues[1][7]
            r[34][("dashAt")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("dashStatus")]=r[33]
            r[32] = env[("Vector3")]
            r[32] = r[32][("zero")]
            r[33] = env[("math")]
            r[33] = r[33][("huge")]
            r[33]=-r[33]
            r[34]=upvalues[1][7]
            r[34][("edgeRecoveryDirection")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("edgeRecoveryUntil")]=r[33]
            r[32] = env[("Vector3")]
            r[32] = r[32][("zero")]
            r[33] = env[("math")]
            r[33] = r[33][("huge")]
            r[33]=-r[33]
            r[34]=upvalues[1][7]
            r[34][("stuckRecoveryDirection")]=r[32]
            r[35]=upvalues[1][7]
            r[35][("stuckRecoveryUntil")]=r[33]
            r[32]=(913151)
            r[32]=r[31] == r[32]
            if not r[32] then block=778 else block=771 end
        elseif block == 771 then
            r[11]=r[24] - r[8]
            block=778
        elseif block == 778 then
            r[32]={}
            r[33]=(false)
            r[32][("loaded")]=r[33]
            r[33]={}
            r[32][("abilities")]=r[33]
            r[33]=upvalues[1][7]
            r[33][("armory")]=r[32]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[89] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(694759)
            r[32]=(743306)
            r[32]=r[31] == r[32]
            if not r[32] then block=57 else block=29 end
        elseif block == 29 then
            do local f=r[13]; local n=5; if n<0 then n=top-13-1 end; local m=14; if m==1 then r[13]=f(unpackValues(r,14,13+n)); top=14 elseif m==0 then f(unpackValues(r,14,13+n)); top=13 else local result=packValues(f(unpackValues(r,14,13+n))); if m<0 then m=result.n end; for i=1,m do r[13+i-1]=result[i] end; top=13+m end end
            r[23]=r[18] + r[16]
            do local f=r[11]; local n=16; if n<0 then n=top-11-1 end; local m=3; if m==1 then r[11]=f(unpackValues(r,12,11+n)); top=12 elseif m==0 then f(unpackValues(r,12,11+n)); top=11 else local result=packValues(f(unpackValues(r,12,11+n))); if m<0 then m=result.n end; for i=1,m do r[11+i-1]=result[i] end; top=11+m end end
            r[11]=r[18] * r[8]
            block=57
        elseif block == 57 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("FireServer")]
            r[34]=("Get")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[90] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]={[7]=r[31]}
            r[32]=(705765)
            r[34] = env[("pcall")]
            r[33]=r[34]
            do local captures = {}
            captures[1] = r[31]
            r[34]=function(...) return functions[91](captures, ...) end
            end
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=2; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35]=r[33]
            if not r[35] then block=92 else block=57 end
        elseif block == 57 then
            r[36]=r[34]
            if not r[36] then block=85 else block=71 end
        elseif block == 71 then
            r[37] = r[34] ~= ("")
            r[36]=r[37]
            block=85
        elseif block == 85 then
            r[35]=r[36]
            block=92
        elseif block == 92 then
            if not r[35] then block=155 else block=99 end
        elseif block == 99 then
            r[35]=(725981)
            r[35]=r[32] == r[35]
            if not r[35] then block=141 else block=120 end
        elseif block == 120 then
            r[19]=r[15]
            r[0]=r[0][r[9]]
            r[5]=r[13] * r[8]
            block=141
        elseif block == 141 then
            return r[34]
        elseif block == 148 then
            block=155
        elseif block == 155 then
            r[35]=(756392)
            r[35]=r[32] == r[35]
            if not r[35] then block=183 else block=176 end
        elseif block == 176 then
            r[5]=env[(nil)]
            block=183
        elseif block == 183 then
            r[35]=nil
            return r[35]
        elseif block == 197 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[91] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(937219)
            r[34] = env[("game")]
            r[33]=r[34]
            r[32] = r[33][("HttpGet")]
            r[34]=upvalues[1][7]
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=-1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 32, top-1)
        elseif block == 50 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[92] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    r[32] = args[2]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[33]=(340923)
            r[34]=upvalues[1][7]
            r[34] = r[34][("notifications")]
            r[35]=(false)
            if not (r[34] == r[35]) then block=50 else block=36 end
        elseif block == 36 then
            return unpackValues(r, 0, -1)
        elseif block == 43 then
            block=50
        elseif block == 50 then
            r[34]=(416075)
            r[34]=r[33] == r[34]
            if not r[34] then block=78 else block=71 end
        elseif block == 71 then
            do local f=r[22]; local n=25; if n<0 then n=top-22-1 end; local m=8; if m==1 then r[22]=f(unpackValues(r,23,22+n)); top=23 elseif m==0 then f(unpackValues(r,23,22+n)); top=22 else local result=packValues(f(unpackValues(r,23,22+n))); if m<0 then m=result.n end; for i=1,m do r[22+i-1]=result[i] end; top=22+m end end
            block=78
        elseif block == 78 then
            r[35]=upvalues[2][7]
            r[34]=r[35]
            r[35]=r[31]
            r[36]=r[32]
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=-1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            return unpackValues(r, 34, top-1)
        elseif block == 120 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[93] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(986267)
            r[33] = env[("string")]
            r[33] = r[33][("format")]
            r[32]=r[33]
            r[33]=("Role %s | State %s | Goal %s | Assist %s")
            r[35]=upvalues[1][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36]=upvalues[2][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=upvalues[3][7]
            r[37] = r[37][("goalMode")]
            r[36]=r[37]
            if r[36] then block=120 else block=106 end
        elseif block == 106 then
            r[37]=("None")
            r[36]=r[37]
            block=120
        elseif block == 120 then
            r[38]=upvalues[3][7]
            r[38] = r[38][("assistMode")]
            r[37]=r[38]
            if r[37] then block=162 else block=148 end
        elseif block == 148 then
            r[38]=("None")
            r[37]=r[38]
            block=162
        elseif block == 162 then
            do local f=r[32]; local n=5; if n<0 then n=top-32-1 end; local m=-1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 32, top-1)
        elseif block == 176 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[94] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(145192)
            r[33]=(221176)
            r[33]=r[32] == r[33]
            if not r[33] then block=43 else block=29 end
        elseif block == 29 then
            r[19]=r[1] + r[11]
            r[4][r[12]]=r[22]
            block=43
        elseif block == 43 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("runnerEnabled")]=r[33]
            r[33]=(235069)
            r[33]=r[32] == r[33]
            if not r[33] then block=99 else block=92 end
        elseif block == 92 then
            r[1][r[5]]=r[15]
            block=99
        elseif block == 99 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("runnerEnabled")]
            r[33]=not r[33]
            if not r[33] then block=316 else block=127 end
        elseif block == 127 then
            r[33] = env[("Vector3")]
            r[33] = r[33][("zero")]
            r[34]=nil
            r[35]=upvalues[2][7]
            r[35][("path")]=r[33]
            r[36]=upvalues[2][7]
            r[36][("goal")]=r[34]
            r[33]=(145551)
            r[33]=r[32] == r[33]
            if not r[33] then block=211 else block=197 end
        elseif block == 197 then
            r[20]=r[11] / r[10]
            r[24]=r[16] == r[2]
            block=211
        elseif block == 211 then
            r[33]=nil
            r[34]=nil
            r[35]=upvalues[2][7]
            r[35][("assistMode")]=r[33]
            r[36]=upvalues[2][7]
            r[36][("assistTarget")]=r[34]
            r[33]=(208903)
            r[33]=r[32] == r[33]
            if not r[33] then block=288 else block=274 end
        elseif block == 274 then
            r[11]=r[16] == r[18]
            r[19]=r[18] * r[12]
            block=288
        elseif block == 288 then
            r[34]=upvalues[3][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=316
        elseif block == 316 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[95] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(704995)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("customSpeed")]=r[33]
            r[33]=upvalues[1][7]
            r[33] = r[33][("customSpeed")]
            r[33]=not r[33]
            if not r[33] then block=92 else block=64 end
        elseif block == 64 then
            r[34]=upvalues[2][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=92
        elseif block == 92 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[96] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(284766)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(1)
            r[36]=(2)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("speedMultiplier")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[97] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(762375)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("autoGems")]=r[33]
            r[33]=not r[31]
            if not r[33] then block=78 else block=50 end
        elseif block == 50 then
            r[33]=nil
            r[34]=upvalues[2][7]
            r[34][("gemTarget")]=r[33]
            block=78
        elseif block == 78 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[98] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(727631)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("autoRevive")]=r[33]
            r[33]=not r[31]
            if not r[33] then block=106 else block=50 end
        elseif block == 50 then
            r[33]=(735033)
            r[33]=r[32] == r[33]
            if not r[33] then block=78 else block=71 end
        elseif block == 71 then
            r[6]=r[1] + r[4]
            block=78
        elseif block == 78 then
            r[34]=upvalues[2][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=106
        elseif block == 106 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[99] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(779925)
            r[33]=(796113)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[23]=r[8]
            r[12]=r[16] < r[14]
            r[21]=r[22]
            block=50
        elseif block == 50 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("reviveBeforeGems")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[100] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(176905)
            r[33]=(264482)
            r[33]=r[32] == r[33]
            if not r[33] then block=57 else block=29 end
        elseif block == 29 then
            do local f=r[15]; local n=15; if n<0 then n=top-15-1 end; local m=20; if m==1 then r[15]=f(unpackValues(r,16,15+n)); top=16 elseif m==0 then f(unpackValues(r,16,15+n)); top=15 else local result=packValues(f(unpackValues(r,16,15+n))); if m<0 then m=result.n end; for i=1,m do r[15+i-1]=result[i] end; top=15+m end end
            r[14][(nil)]=r[3]
            r[4]=r[10] / r[10]
            do local f=r[18]; local n=22; if n<0 then n=top-18-1 end; local m=2; if m==1 then r[18]=f(unpackValues(r,19,18+n)); top=19 elseif m==0 then f(unpackValues(r,19,18+n)); top=18 else local result=packValues(f(unpackValues(r,19,18+n))); if m<0 then m=result.n end; for i=1,m do r[18+i-1]=result[i] end; top=18+m end end
            block=57
        elseif block == 57 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("avoidCatchers")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[101] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(610031)
            r[33]=(654774)
            r[33]=r[32] == r[33]
            if not r[33] then block=43 else block=29 end
        elseif block == 29 then
            r[6]=r[17] * r[3]
            r[10]=env[(nil)]
            block=43
        elseif block == 43 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("autoDash")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[102] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(828382)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(0.25)
            r[36]=(1.1)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("predictionTime")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[103] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(218361)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(0.5)
            r[36]=(2.5)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("avoidStrength")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[104] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(787767)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(8)
            r[36]=(25)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("panicDistance")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[105] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(46765)
            r[33]=(85902)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[0]=r[8] + r[24]
            r[16]=r[12] * r[11]
            r[9]=r[22][r[0]]
            block=50
        elseif block == 50 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("smoothMovement")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[106] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(241956)
            r[33]=(332195)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[17]=r[20] == r[22]
            r[20]=r[25][(nil)]
            r[6]=r[17] < r[12]
            block=50
        elseif block == 50 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("emergencySafeZone")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[107] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(363414)
            r[34]=upvalues[1][7]
            r[34] = r[34][("catcherTarget")]
            r[33]=r[34]
            if not r[33] then block=64 else block=36 end
        elseif block == 36 then
            r[34]=upvalues[1][7]
            r[34] = r[34][("catcherTarget")]
            r[34] = r[34][("Name")]
            r[33]=r[34]
            block=64
        elseif block == 64 then
            r[32]=r[33]
            if r[32] then block=92 else block=78 end
        elseif block == 78 then
            r[33]=("None")
            r[32]=r[33]
            block=92
        elseif block == 92 then
            r[34] = env[("string")]
            r[34] = r[34][("format")]
            r[33]=r[34]
            r[34]=("Role %s | State %s | Target %s")
            r[36]=upvalues[2][7]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[37]=upvalues[3][7]
            r[36]=r[37]
            do local f=r[36]; local n=0; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=r[32]
            do local f=r[33]; local n=4; if n<0 then n=top-33-1 end; local m=-1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 33, top-1)
        elseif block == 183 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[108] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(183158)
            r[33]=(205297)
            r[33]=r[32] == r[33]
            if not r[33] then block=36 else block=29 end
        elseif block == 29 then
            r[7]=r[15] / r[12]
            block=36
        elseif block == 36 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("catcherChase")]=r[33]
            r[33]=not r[31]
            if not r[33] then block=183 else block=78 end
        elseif block == 78 then
            r[33]=(279649)
            r[33]=r[32] == r[33]
            if not r[33] then block=127 else block=99 end
        elseif block == 99 then
            r[20]=r[5] + r[4]
            r[3]=r[16] - r[11]
            r[21]=#r[12]
            r[15]=r[13] - r[16]
            block=127
        elseif block == 127 then
            r[33]=nil
            r[34] = env[("Vector3")]
            r[34] = r[34][("zero")]
            r[35]=upvalues[2][7]
            r[35][("catcherTarget")]=r[33]
            r[36]=upvalues[2][7]
            r[36][("catcherPath")]=r[34]
            block=183
        elseif block == 183 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[109] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(318504)
            r[33]=(353420)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[8]=r[13] + r[12]
            r[16]=r[18][(nil)]
            r[24]=r[18][(nil)]
            block=50
        elseif block == 50 then
            r[34] = env[("type")]
            r[33]=r[34]
            r[34]=r[31]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            if not (r[33] == ("table")) then block=106 else block=85 end
        elseif block == 85 then
            r[33] = r[31][(1)]
            r[31]=r[33]
            block=106
        elseif block == 106 then
            r[34] = r[31] == ("Smart")
            r[33]=r[34]
            if r[33] then block=169 else block=127 end
        elseif block == 127 then
            r[35] = r[31] == ("Tackle First")
            r[34]=r[35]
            if r[34] then block=162 else block=148 end
        elseif block == 148 then
            r[35] = r[31] == ("Melee First")
            r[34]=r[35]
            block=162
        elseif block == 162 then
            r[33]=r[34]
            block=169
        elseif block == 169 then
            if not r[33] then block=253 else block=176 end
        elseif block == 176 then
            r[33]=(402353)
            r[33]=r[32] == r[33]
            if not r[33] then block=225 else block=197 end
        elseif block == 197 then
            r[20]=r[15] .. r[18]
            r[5]=r[0]
            r[24]=r[25] < r[15]
            r[24]=r[2] < r[7]
            block=225
        elseif block == 225 then
            r[33]=r[31]
            r[34]=upvalues[1][7]
            r[34][("catcherAttackPriority")]=r[33]
            block=253
        elseif block == 253 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[110] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(786520)
            r[33]=(885447)
            r[33]=r[32] == r[33]
            if not r[33] then block=57 else block=29 end
        elseif block == 29 then
            r[5]=r[6][(nil)]
            r[2]=r[22] / r[3]
            r[24]=r[9][r[1]]
            r[7]=r[13] < r[4]
            block=57
        elseif block == 57 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("smartPriority")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[111] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(437685)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("autoTackle")]=r[33]
            r[33]=not r[31]
            if not r[33] then block=92 else block=50 end
        elseif block == 50 then
            r[33] = env[("math")]
            r[33] = r[33][("huge")]
            r[33]=-r[33]
            r[34]=upvalues[2][7]
            r[34][("lastTackle")]=r[33]
            block=92
        elseif block == 92 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[112] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(344645)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(5)
            r[36]=(25)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("tackleRange")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[113] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(294084)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("autoMelee")]=r[33]
            r[33]=(314533)
            r[33]=r[32] == r[33]
            if not r[33] then block=85 else block=57 end
        elseif block == 57 then
            r[22]=r[14] / r[6]
            do local f=r[0]; local n=13; if n<0 then n=top-0-1 end; local m=21; if m==1 then r[0]=f(unpackValues(r,1,0+n)); top=1 elseif m==0 then f(unpackValues(r,1,0+n)); top=0 else local result=packValues(f(unpackValues(r,1,0+n))); if m<0 then m=result.n end; for i=1,m do r[0+i-1]=result[i] end; top=0+m end end
            r[19][r[0]]=r[15]
            r[20]=r[1] * r[20]
            block=85
        elseif block == 85 then
            r[33]=not r[31]
            if not r[33] then block=141 else block=99 end
        elseif block == 99 then
            r[33] = env[("math")]
            r[33] = r[33][("huge")]
            r[33]=-r[33]
            r[34]=upvalues[2][7]
            r[34][("lastMelee")]=r[33]
            block=141
        elseif block == 141 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[114] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(500883)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(3)
            r[36]=(15)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("meleeRange")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[115] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(285495)
            r[33]=(382561)
            r[33]=r[32] == r[33]
            if not r[33] then block=36 else block=29 end
        elseif block == 29 then
            r[21]=r[20][("catcherPrediction")]
            block=36
        elseif block == 36 then
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(0.1)
            r[36]=(1)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("catcherPrediction")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[116] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(265291)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("catcherCustomSpeed")]=r[33]
            r[33]=(333713)
            r[33]=r[32] == r[33]
            if not r[33] then block=78 else block=57 end
        elseif block == 57 then
            r[19]=(nil)
            r[18][(nil)]=r[21]
            r[19][r[9]]=r[2]
            block=78
        elseif block == 78 then
            r[33]=not r[31]
            if not r[33] then block=120 else block=92 end
        elseif block == 92 then
            r[34]=upvalues[2][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=120
        elseif block == 120 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[117] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(940734)
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(1)
            r[36]=(2)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("catcherSpeedMultiplier")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[118] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(832515)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("smoothTurn")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[119] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(714039)
            r[33]=(720077)
            r[33]=r[32] == r[33]
            if not r[33] then block=36 else block=29 end
        elseif block == 29 then
            r[10]=r[9][(nil)]
            block=36
        elseif block == 36 then
            r[34] = env[("math")]
            r[34] = r[34][("clamp")]
            r[33]=r[34]
            r[34]=r[31]
            r[35]=(5)
            r[36]=(30)
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("turnRateCatcher")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[120] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(866743)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("followTarget")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[121] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(791083)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("showGoal")]=r[33]
            r[34]=not r[31]
            r[33]=r[34]
            if not r[33] then block=120 else block=57 end
        elseif block == 57 then
            r[35]=upvalues[2][7]
            r[35] = r[35][("goal")]
            r[34]=r[35]
            if not r[34] then block=113 else block=85 end
        elseif block == 85 then
            r[35]=upvalues[2][7]
            r[35] = r[35][("goal")]
            r[35] = r[35][("Parent")]
            r[34]=r[35]
            block=113
        elseif block == 113 then
            r[33]=r[34]
            block=120
        elseif block == 120 then
            if not r[33] then block=225 else block=127 end
        elseif block == 127 then
            r[33]=(796231)
            r[33]=r[32] == r[33]
            if not r[33] then block=162 else block=148 end
        elseif block == 148 then
            r[6]=#r[16]
            r[21]=r[10][r[8]]
            block=162
        elseif block == 162 then
            r[35]=upvalues[2][7]
            r[35] = r[35][("goal")]
            r[34]=r[35]
            r[33] = r[34][("Destroy")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]=nil
            r[34]=upvalues[2][7]
            r[34][("goal")]=r[33]
            block=225
        elseif block == 225 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[122] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(487740)
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("showThreats")]=r[33]
            r[33]=not r[31]
            if not r[33] then block=281 else block=50 end
        elseif block == 50 then
            r[34] = env[("pairs")]
            r[33]=r[34]
            r[34]=upvalues[2][7]
            r[34] = r[34][("threats")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=260
        elseif block == 92 then
            r[38]=(552019)
            r[38]=r[32] == r[38]
            if not r[38] then block=141 else block=113 end
        elseif block == 113 then
            r[17]=r[13] * r[7]
            r[0]=r[19][r[0]]
            r[23]=env[(nil)]
            r[3]=r[12] - r[10]
            block=141
        elseif block == 141 then
            r[38] = r[37][("Parent")]
            if not r[38] then block=232 else block=155 end
        elseif block == 155 then
            r[38]=(563431)
            r[38]=r[32] == r[38]
            if not r[38] then block=204 else block=176 end
        elseif block == 176 then
            r[6]=r[11] / r[16]
            r[7]=(nil)
            r[19]=r[0] * r[25]
            r[16]=r[20] == r[17]
            block=204
        elseif block == 204 then
            r[39]=r[37]
            r[38] = r[39][("Destroy")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=232
        elseif block == 232 then
            r[38]=nil
            r[39]=upvalues[2][7]
            r[39] = r[39][("threats")]
            r[39][r[36]]=r[38]
            block=260
        elseif block == 260 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=92 else block=274 end
        elseif block == 274 then
            block=281
        elseif block == 281 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[123] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(34062)
            r[33]=(110321)
            r[33]=r[32] == r[33]
            if not r[33] then block=36 else block=29 end
        elseif block == 29 then
            r[12]=r[25] < r[4]
            block=36
        elseif block == 36 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("showHitboxes")]=r[33]
            r[33]=(67208)
            r[33]=r[32] == r[33]
            if not r[33] then block=99 else block=85 end
        elseif block == 85 then
            r[5]=r[3] .. r[8]
            r[18]=r[17] - r[4]
            block=99
        elseif block == 99 then
            r[33]=not r[31]
            if not r[33] then block=365 else block=113 end
        elseif block == 113 then
            r[33]=(86519)
            r[33]=r[32] == r[33]
            if not r[33] then block=148 else block=134 end
        elseif block == 134 then
            r[4]=(86519)
            r[20]=r[20] * r[23]
            block=148
        elseif block == 148 then
            r[34] = env[("pairs")]
            r[33]=r[34]
            r[34]=upvalues[2][7]
            r[34] = r[34][("hitboxes")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=3; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=344
        elseif block == 190 then
            r[38]=(81139)
            r[38]=r[32] == r[38]
            if not r[38] then block=225 else block=211 end
        elseif block == 211 then
            r[15][(nil)]=r[19]
            r[8]=r[21] + r[21]
            block=225
        elseif block == 225 then
            r[38] = r[37][("Parent")]
            if not r[38] then block=316 else block=239 end
        elseif block == 239 then
            r[38]=(132791)
            r[38]=r[32] == r[38]
            if not r[38] then block=288 else block=260 end
        elseif block == 260 then
            r[25]=#r[20]
            do local f=r[21]; local n=23; if n<0 then n=top-21-1 end; local m=0; if m==1 then r[21]=f(unpackValues(r,22,21+n)); top=22 elseif m==0 then f(unpackValues(r,22,21+n)); top=21 else local result=packValues(f(unpackValues(r,22,21+n))); if m<0 then m=result.n end; for i=1,m do r[21+i-1]=result[i] end; top=21+m end end
            do local f=r[14]; local n=8; if n<0 then n=top-14-1 end; local m=21; if m==1 then r[14]=f(unpackValues(r,15,14+n)); top=15 elseif m==0 then f(unpackValues(r,15,14+n)); top=14 else local result=packValues(f(unpackValues(r,15,14+n))); if m<0 then m=result.n end; for i=1,m do r[14+i-1]=result[i] end; top=14+m end end
            r[0]=env[(132791)]
            block=288
        elseif block == 288 then
            r[39]=r[37]
            r[38] = r[39][("Destroy")]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=0; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            block=316
        elseif block == 316 then
            r[38]=nil
            r[39]=upvalues[2][7]
            r[39] = r[39][("hitboxes")]
            r[39][r[36]]=r[38]
            block=344
        elseif block == 344 then
            r[36], r[37]=r[33](r[34],r[35])
            if r[36]~=nil then r[35]=r[36]; block=190 else block=358 end
        elseif block == 358 then
            block=365
        elseif block == 365 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[124] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(815477)
            r[33]=upvalues[1][7]
            r[33] = r[33][("idleConn")]
            if not r[33] then block=92 else block=29 end
        elseif block == 29 then
            r[35]=upvalues[1][7]
            r[35] = r[35][("idleConn")]
            r[34]=r[35]
            r[33] = r[34][("Disconnect")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]=nil
            r[34]=upvalues[1][7]
            r[34][("idleConn")]=r[33]
            block=92
        elseif block == 92 then
            if not r[31] then block=162 else block=99 end
        elseif block == 99 then
            r[35]=upvalues[2][7]
            r[35] = r[35][("Idled")]
            r[34]=r[35]
            r[33] = r[34][("Connect")]
            do local captures = {}
            r[35]=function(...) return functions[125](captures, ...) end
            end
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=upvalues[1][7]
            r[34][("idleConn")]=r[33]
            block=162
        elseif block == 162 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[125] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(994632)
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            r[33]=function(...) return functions[126](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[126] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(667213)
            r[34] = env[("game")]
            r[33]=r[34]
            r[32] = r[33][("GetService")]
            r[34]=("VirtualUser")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[34]=r[32]
            r[33] = r[34][("CaptureController")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=r[32]
            r[33] = r[34][("ClickButton2")]
            r[36] = env[("Vector2")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local f=r[33]; local n=-1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[127] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(407799)
            r[32]=(436172)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=29 end
        elseif block == 29 then
            r[2]=#r[22]
            r[25]=r[4] + r[19]
            r[12]=r[0][(nil)]
            block=50
        elseif block == 50 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            captures[1] = upvalues[1]
            captures[2] = upvalues[2]
            r[33]=function(...) return functions[128](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[128] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(174963)
            r[32]=(273674)
            r[32]=r[31] == r[32]
            if not r[32] then block=43 else block=29 end
        elseif block == 29 then
            r[22]=#r[14]
            r[25][r[17]]=r[1]
            block=43
        elseif block == 43 then
            r[34] = env[("game")]
            r[33]=r[34]
            r[32] = r[33][("GetService")]
            r[34]=("TeleportService")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(274805)
            r[33]=r[31] == r[33]
            if not r[33] then block=113 else block=99 end
        elseif block == 99 then
            r[15]=r[25] < r[20]
            r[2]=r[16] .. r[5]
            block=113
        elseif block == 113 then
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("GetPlayers")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[33]=#r[33]
            if not (r[33] <= (1)) then block=246 else block=155 end
        elseif block == 155 then
            r[33]=(204453)
            r[33]=r[31] == r[33]
            if not r[33] then block=197 else block=176 end
        elseif block == 176 then
            r[14]=("TeleportToPlaceInstance")
            r[5]=r[4]
            r[1]=r[25] / r[16]
            block=197
        elseif block == 197 then
            r[34]=r[32]
            r[33] = r[34][("Teleport")]
            r[35] = env[("game")]
            r[35] = r[35][("PlaceId")]
            r[36]=upvalues[2][7]
            do local f=r[33]; local n=3; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=330
        elseif block == 246 then
            r[33]=(180638)
            r[33]=r[31] == r[33]
            if not r[33] then block=274 else block=267 end
        elseif block == 267 then
            r[10]=r[2]
            block=274
        elseif block == 274 then
            r[34]=r[32]
            r[33] = r[34][("TeleportToPlaceInstance")]
            r[35] = env[("game")]
            r[35] = r[35][("PlaceId")]
            r[36] = env[("game")]
            r[36] = r[36][("JobId")]
            r[37]=upvalues[2][7]
            do local f=r[33]; local n=4; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            block=330
        elseif block == 330 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[129] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(451429)
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            r[33]=function(...) return functions[130](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[130] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(461182)
            r[32]=(536744)
            r[32]=r[31] == r[32]
            if not r[32] then block=36 else block=29 end
        elseif block == 29 then
            r[25]=("Vector2")
            block=36
        elseif block == 36 then
            r[34] = env[("game")]
            r[33]=r[34]
            r[32] = r[33][("GetService")]
            r[34]=("VirtualUser")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[34]=r[32]
            r[33] = r[34][("CaptureController")]
            do local f=r[33]; local n=1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=r[32]
            r[33] = r[34][("ClickButton2")]
            r[36] = env[("Vector2")]
            r[36] = r[36][("new")]
            r[35]=r[36]
            do local f=r[35]; local n=0; if n<0 then n=top-35-1 end; local m=-1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            do local f=r[33]; local n=-1; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[131] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(63494)
            r[33] = env[("Enum")]
            r[33] = r[33][("KeyCode")]
            r[35] = env[("tostring")]
            r[34]=r[35]
            r[35]=r[31]
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[33] = r[33][r[34]]
            r[33]={[7]=r[33]}
            r[34]=(120305)
            r[34]=r[32] == r[34]
            if not r[34] then block=99 else block=85 end
        elseif block == 85 then
            r[15]=r[15][(nil)]
            r[21]=#r[0]
            block=99
        elseif block == 99 then
            r[34]=r[33][7]
            if not r[34] then block=148 else block=113 end
        elseif block == 113 then
            r[35] = env[("pcall")]
            r[34]=r[35]
            do local captures = {}
            captures[1] = upvalues[1]
            captures[2] = r[33]
            r[35]=function(...) return functions[132](captures, ...) end
            end
            do local f=r[34]; local n=1; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            block=148
        elseif block == 148 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[132] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(314144)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("SetKeybind")]
            r[34]=upvalues[2][7]
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[133] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(224501)
            r[33]=(235189)
            r[33]=r[32] == r[33]
            if not r[33] then block=50 else block=29 end
        elseif block == 29 then
            r[5]=#r[5]
            r[19]=r[17][(nil)]
            do local f=r[23]; local n=17; if n<0 then n=top-23-1 end; local m=0; if m==1 then r[23]=f(unpackValues(r,24,23+n)); top=24 elseif m==0 then f(unpackValues(r,24,23+n)); top=23 else local result=packValues(f(unpackValues(r,24,23+n))); if m<0 then m=result.n end; for i=1,m do r[23+i-1]=result[i] end; top=23+m end end
            block=50
        elseif block == 50 then
            r[33]=(true)
            r[33] = r[31] == r[33]
            r[34]=upvalues[1][7]
            r[34][("notifications")]=r[33]
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[134] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(180988)
            r[32]=(224234)
            r[32]=r[31] == r[32]
            if not r[32] then block=50 else block=29 end
        elseif block == 29 then
            r[4]=r[0]
            r[16]=r[18] < r[24]
            r[22]=r[1][("Icon")]
            block=50
        elseif block == 50 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("SaveConfig")]
            r[34]=("default")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("Notify")]
            r[35]={}
            r[36]=("Azure")
            r[35][("Title")]=r[36]
            r[37]=r[32]
            if not r[37] then block=155 else block=141 end
        elseif block == 141 then
            r[38]=("Config saved.")
            r[37]=r[38]
            block=155
        elseif block == 155 then
            r[36]=r[37]
            if r[36] then block=183 else block=169 end
        elseif block == 169 then
            r[37]=("Save failed.")
            r[36]=r[37]
            block=183
        elseif block == 183 then
            r[35][("Content")]=r[36]
            r[37]=r[32]
            if not r[37] then block=218 else block=204 end
        elseif block == 204 then
            r[38]=("check")
            r[37]=r[38]
            block=218
        elseif block == 218 then
            r[36]=r[37]
            if r[36] then block=246 else block=232 end
        elseif block == 232 then
            r[37]=("x")
            r[36]=r[37]
            block=246
        elseif block == 246 then
            r[35][("Icon")]=r[36]
            r[37]=r[32]
            if not r[37] then block=281 else block=267 end
        elseif block == 267 then
            r[38]=("Success")
            r[37]=r[38]
            block=281
        elseif block == 281 then
            r[36]=r[37]
            if r[36] then block=309 else block=295 end
        elseif block == 295 then
            r[37]=("Error")
            r[36]=r[37]
            block=309
        elseif block == 309 then
            r[35][("Type")]=r[36]
            r[36]=(3)
            r[35][("Duration")]=r[36]
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[135] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(97377)
            r[32]=(149288)
            r[32]=r[31] == r[32]
            if not r[32] then block=57 else block=29 end
        elseif block == 29 then
            r[20]=r[3]
            r[17]=env[(nil)]
            do local f=r[8]; local n=17; if n<0 then n=top-8-1 end; local m=0; if m==1 then r[8]=f(unpackValues(r,9,8+n)); top=9 elseif m==0 then f(unpackValues(r,9,8+n)); top=8 else local result=packValues(f(unpackValues(r,9,8+n))); if m<0 then m=result.n end; for i=1,m do r[8+i-1]=result[i] end; top=8+m end end
            r[2]=r[8] < r[7]
            block=57
        elseif block == 57 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("LoadConfig")]
            r[34]=("default")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("Notify")]
            r[35]={}
            r[36]=("Azure")
            r[35][("Title")]=r[36]
            r[37]=r[32]
            if not r[37] then block=162 else block=148 end
        elseif block == 148 then
            r[38]=("Config loaded.")
            r[37]=r[38]
            block=162
        elseif block == 162 then
            r[36]=r[37]
            if r[36] then block=190 else block=176 end
        elseif block == 176 then
            r[37]=("Load failed.")
            r[36]=r[37]
            block=190
        elseif block == 190 then
            r[35][("Content")]=r[36]
            r[37]=r[32]
            if not r[37] then block=225 else block=211 end
        elseif block == 211 then
            r[38]=("check")
            r[37]=r[38]
            block=225
        elseif block == 225 then
            r[36]=r[37]
            if r[36] then block=253 else block=239 end
        elseif block == 239 then
            r[37]=("x")
            r[36]=r[37]
            block=253
        elseif block == 253 then
            r[35][("Icon")]=r[36]
            r[37]=r[32]
            if not r[37] then block=288 else block=274 end
        elseif block == 274 then
            r[38]=("Success")
            r[37]=r[38]
            block=288
        elseif block == 288 then
            r[36]=r[37]
            if r[36] then block=316 else block=302 end
        elseif block == 302 then
            r[37]=("Error")
            r[36]=r[37]
            block=316
        elseif block == 316 then
            r[35][("Type")]=r[36]
            r[36]=(3)
            r[35][("Duration")]=r[36]
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[136] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(196729)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("DeleteConfig")]
            r[34]=("default")
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33]=(290802)
            r[33]=r[31] == r[33]
            if not r[33] then block=71 else block=64 end
        elseif block == 64 then
            r[21]=r[14] * r[1]
            block=71
        elseif block == 71 then
            r[35]=upvalues[1][7]
            r[34]=r[35]
            r[33] = r[34][("Notify")]
            r[35]={}
            r[36]=("Azure")
            r[35][("Title")]=r[36]
            r[37]=r[32]
            if not r[37] then block=141 else block=127 end
        elseif block == 127 then
            r[38]=("Config deleted.")
            r[37]=r[38]
            block=141
        elseif block == 141 then
            r[36]=r[37]
            if r[36] then block=169 else block=155 end
        elseif block == 155 then
            r[37]=("Delete failed.")
            r[36]=r[37]
            block=169
        elseif block == 169 then
            r[35][("Content")]=r[36]
            r[37]=r[32]
            if not r[37] then block=204 else block=190 end
        elseif block == 190 then
            r[38]=("check")
            r[37]=r[38]
            block=204
        elseif block == 204 then
            r[36]=r[37]
            if r[36] then block=232 else block=218 end
        elseif block == 218 then
            r[37]=("x")
            r[36]=r[37]
            block=232
        elseif block == 232 then
            r[35][("Icon")]=r[36]
            r[37]=r[32]
            if not r[37] then block=267 else block=253 end
        elseif block == 253 then
            r[38]=("Success")
            r[37]=r[38]
            block=267
        elseif block == 267 then
            r[36]=r[37]
            if r[36] then block=295 else block=281 end
        elseif block == 281 then
            r[37]=("Error")
            r[36]=r[37]
            block=295
        elseif block == 295 then
            r[35][("Type")]=r[36]
            r[36]=(3)
            r[35][("Duration")]=r[36]
            do local f=r[33]; local n=2; if n<0 then n=top-33-1 end; local m=0; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[137] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(264729)
            r[32]=(339389)
            r[32]=r[31] == r[32]
            if not r[32] then block=43 else block=29 end
        elseif block == 29 then
            r[13]=#r[16]
            r[17]=#r[16]
            block=43
        elseif block == 43 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("cleanup")]
            if not r[32] then block=99 else block=64 end
        elseif block == 64 then
            r[33]=upvalues[1][7]
            r[33] = r[33][("cleanup")]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            block=99
        elseif block == 99 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[138] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(143089)
            r[33]=upvalues[1][7]
            r[32]=r[33]
            do local f=r[32]; local n=0; if n<0 then n=top-32-1 end; local m=1; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[34]=upvalues[2][7]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[34]=(219349)
            r[34]=r[31] == r[34]
            if not r[34] then block=92 else block=71 end
        elseif block == 71 then
            r[15]=r[5] == r[13]
            do local f=r[12]; local n=23; if n<0 then n=top-12-1 end; local m=22; if m==1 then r[12]=f(unpackValues(r,13,12+n)); top=13 elseif m==0 then f(unpackValues(r,13,12+n)); top=12 else local result=packValues(f(unpackValues(r,13,12+n))); if m<0 then m=result.n end; for i=1,m do r[12+i-1]=result[i] end; top=12+m end end
            r[19]=r[20] + r[14]
            block=92
        elseif block == 92 then
            r[35]=upvalues[3][7]
            r[34]=r[35]
            do local f=r[34]; local n=0; if n<0 then n=top-34-1 end; local m=1; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[36]=not r[33]
            r[35]=r[36]
            if r[35] then block=183 else block=134 end
        elseif block == 134 then
            r[37]=not r[34]
            r[36]=r[37]
            if r[36] then block=176 else block=155 end
        elseif block == 155 then
            r[37] = r[34][("Health")]
            r[37] = r[37] <= (0)
            r[36]=r[37]
            block=176
        elseif block == 176 then
            r[35]=r[36]
            block=183
        elseif block == 183 then
            if not r[35] then block=204 else block=190 end
        elseif block == 190 then
            return unpackValues(r, 0, -1)
        elseif block == 197 then
            block=204
        elseif block == 204 then
            r[36]=r[33]
            r[35] = r[36][("GetAttribute")]
            r[37]=("MovementState")
            do local f=r[35]; local n=2; if n<0 then n=top-35-1 end; local m=1; if m==1 then r[35]=f(unpackValues(r,36,35+n)); top=36 elseif m==0 then f(unpackValues(r,36,35+n)); top=35 else local result=packValues(f(unpackValues(r,36,35+n))); if m<0 then m=result.n end; for i=1,m do r[35+i-1]=result[i] end; top=35+m end end
            r[36]=(201810)
            r[36]=r[31] == r[36]
            if not r[36] then block=267 else block=253 end
        elseif block == 253 then
            r[16]=#r[17]
            r[22]=r[13] - r[3]
            block=267
        elseif block == 267 then
            r[37] = r[35] == ("Dashing")
            r[36]=r[37]
            if r[36] then block=302 else block=288 end
        elseif block == 288 then
            r[37] = r[35] == ("Boosting")
            r[36]=r[37]
            block=302
        elseif block == 302 then
            if not r[36] then block=365 else block=309 end
        elseif block == 309 then
            r[36]=(236362)
            r[36]=r[31] == r[36]
            if not r[36] then block=351 else block=330 end
        elseif block == 330 then
            r[22]=(1)
            r[20]=env[("Boosting")]
            r[3]=r[13] * r[10]
            block=351
        elseif block == 351 then
            return unpackValues(r, 0, -1)
        elseif block == 358 then
            block=365
        elseif block == 365 then
            r[37] = env[("tonumber")]
            r[36]=r[37]
            r[38]=r[33]
            r[37] = r[38][("GetAttribute")]
            r[39]=("MovementSpeed")
            do local f=r[37]; local n=2; if n<0 then n=top-37-1 end; local m=-1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            do local f=r[36]; local n=-1; if n<0 then n=top-36-1 end; local m=1; if m==1 then r[36]=f(unpackValues(r,37,36+n)); top=37 elseif m==0 then f(unpackValues(r,37,36+n)); top=36 else local result=packValues(f(unpackValues(r,37,36+n))); if m<0 then m=result.n end; for i=1,m do r[36+i-1]=result[i] end; top=36+m end end
            r[37]=r[36]
            if not r[37] then block=442 else block=428 end
        elseif block == 428 then
            r[38] = r[36] > (0)
            r[37]=r[38]
            block=442
        elseif block == 442 then
            if not r[37] then block=967 else block=449 end
        elseif block == 449 then
            r[37]=r[36]
            r[38]=(175604)
            r[38]=r[31] == r[38]
            if not r[38] then block=498 else block=477 end
        elseif block == 477 then
            r[20]=r[19][(236362)]
            r[21]=r[13][r[9]]
            r[17]=r[1] * r[17]
            block=498
        elseif block == 498 then
            r[39] = r[32] == ("Runner")
            r[38]=r[39]
            if not r[38] then block=582 else block=519 end
        elseif block == 519 then
            r[40]=upvalues[4][7]
            r[40] = r[40][("customSpeed")]
            r[39]=r[40]
            if not r[39] then block=575 else block=547 end
        elseif block == 547 then
            r[40]=upvalues[4][7]
            r[40] = r[40][("speedMultiplier")]
            r[40] = r[40] > (1.0001)
            r[39]=r[40]
            block=575
        elseif block == 575 then
            r[38]=r[39]
            block=582
        elseif block == 582 then
            if not r[38] then block=694 else block=589 end
        elseif block == 589 then
            r[38]=(214318)
            r[38]=r[31] == r[38]
            if not r[38] then block=617 else block=610 end
        elseif block == 610 then
            r[21][r[5]]=r[15]
            block=617
        elseif block == 617 then
            r[39] = env[("math")]
            r[39] = r[39][("clamp")]
            r[38]=r[39]
            r[39]=upvalues[4][7]
            r[39] = r[39][("speedMultiplier")]
            r[40]=(1)
            r[41]=(2)
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[38] = r[36] * r[38]
            r[37]=r[38]
            block=890
        elseif block == 694 then
            r[39] = r[32] == ("Catcher")
            r[38]=r[39]
            if not r[38] then block=778 else block=715 end
        elseif block == 715 then
            r[40]=upvalues[4][7]
            r[40] = r[40][("catcherCustomSpeed")]
            r[39]=r[40]
            if not r[39] then block=771 else block=743 end
        elseif block == 743 then
            r[40]=upvalues[4][7]
            r[40] = r[40][("catcherSpeedMultiplier")]
            r[40] = r[40] > (1.0001)
            r[39]=r[40]
            block=771
        elseif block == 771 then
            r[38]=r[39]
            block=778
        elseif block == 778 then
            if not r[38] then block=890 else block=785 end
        elseif block == 785 then
            r[38]=(217185)
            r[38]=r[31] == r[38]
            if not r[38] then block=813 else block=806 end
        elseif block == 806 then
            r[21]=env[("Boosting")]
            block=813
        elseif block == 813 then
            r[39] = env[("math")]
            r[39] = r[39][("clamp")]
            r[38]=r[39]
            r[39]=upvalues[4][7]
            r[39] = r[39][("catcherSpeedMultiplier")]
            r[40]=(1)
            r[41]=(2)
            do local f=r[38]; local n=3; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            r[38] = r[36] * r[38]
            r[37]=r[38]
            block=890
        elseif block == 890 then
            r[39] = env[("math")]
            r[39] = r[39][("abs")]
            r[38]=r[39]
            r[39] = r[34][("WalkSpeed")]
            r[39] = r[39] - r[37]
            do local f=r[38]; local n=1; if n<0 then n=top-38-1 end; local m=1; if m==1 then r[38]=f(unpackValues(r,39,38+n)); top=39 elseif m==0 then f(unpackValues(r,39,38+n)); top=38 else local result=packValues(f(unpackValues(r,39,38+n))); if m<0 then m=result.n end; for i=1,m do r[38+i-1]=result[i] end; top=38+m end end
            if not (r[38] > (0.05)) then block=960 else block=939 end
        elseif block == 939 then
            r[38]=r[37]
            r[34][("WalkSpeed")]=r[38]
            block=960
        elseif block == 960 then
            block=967
        elseif block == 967 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[139] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    r[31] = args[1]
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[32]=(515729)
            r[34] = env[("os")]
            r[34] = r[34][("clock")]
            r[33]=r[34]
            do local f=r[33]; local n=0; if n<0 then n=top-33-1 end; local m=1; if m==1 then r[33]=f(unpackValues(r,34,33+n)); top=34 elseif m==0 then f(unpackValues(r,34,33+n)); top=33 else local result=packValues(f(unpackValues(r,34,33+n))); if m<0 then m=result.n end; for i=1,m do r[33+i-1]=result[i] end; top=33+m end end
            r[35] = env[("pcall")]
            r[34]=r[35]
            r[35]=upvalues[1][7]
            r[36]=r[33]
            r[37]=r[31]
            do local f=r[34]; local n=3; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=(576405)
            r[34]=r[32] == r[34]
            if not r[34] then block=127 else block=99 end
        elseif block == 99 then
            r[2]=r[23] + r[16]
            r[4]=r[18] * r[2]
            r[13]=r[17] .. r[18]
            do local f=r[16]; local n=5; if n<0 then n=top-16-1 end; local m=16; if m==1 then r[16]=f(unpackValues(r,17,16+n)); top=17 elseif m==0 then f(unpackValues(r,17,16+n)); top=16 else local result=packValues(f(unpackValues(r,17,16+n))); if m<0 then m=result.n end; for i=1,m do r[16+i-1]=result[i] end; top=16+m end end
            block=127
        elseif block == 127 then
            r[35] = env[("pcall")]
            r[34]=r[35]
            r[35]=upvalues[2][7]
            r[36]=r[33]
            r[37]=r[31]
            do local f=r[34]; local n=3; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            r[34]=(575446)
            r[34]=r[32] == r[34]
            if not r[34] then block=218 else block=190 end
        elseif block == 190 then
            r[0][(nil)]=r[10]
            r[2]=r[25] + r[1]
            r[11]=r[18][("pcall")]
            r[0]=r[21] * r[3]
            block=218
        elseif block == 218 then
            r[35]=upvalues[3][7]
            r[35] = r[35][("utilityTick")]
            r[34]=r[35]
            if r[34] then block=260 else block=246 end
        elseif block == 246 then
            r[35]=(0)
            r[34]=r[35]
            block=260
        elseif block == 260 then
            r[34] = r[33] - r[34]
            if not (r[34] >= (0.25)) then block=400 else block=274 end
        elseif block == 274 then
            r[34]=(518784)
            r[34]=r[32] == r[34]
            if not r[34] then block=309 else block=295 end
        elseif block == 295 then
            r[21]=r[6] / r[5]
            r[21][r[9]]=r[8]
            block=309
        elseif block == 309 then
            r[34]=r[33]
            r[35]=upvalues[3][7]
            r[35][("utilityTick")]=r[34]
            r[34]=(516003)
            r[34]=r[32] == r[34]
            if not r[34] then block=358 else block=351 end
        elseif block == 351 then
            r[23][r[13]]=r[7]
            block=358
        elseif block == 358 then
            r[35] = env[("pcall")]
            r[34]=r[35]
            r[35]=upvalues[4][7]
            r[36]=r[33]
            do local f=r[34]; local n=2; if n<0 then n=top-34-1 end; local m=0; if m==1 then r[34]=f(unpackValues(r,35,34+n)); top=35 elseif m==0 then f(unpackValues(r,35,34+n)); top=34 else local result=packValues(f(unpackValues(r,35,34+n))); if m<0 then m=result.n end; for i=1,m do r[34+i-1]=result[i] end; top=34+m end end
            block=400
        elseif block == 400 then
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[140] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(355299)
            r[32]=(399398)
            r[32]=r[31] == r[32]
            if not r[32] then block=43 else block=29 end
        elseif block == 29 then
            r[6]=(true)
            r[18]=(false)
            block=43
        elseif block == 43 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("cleaned")]
            if not r[32] then block=113 else block=64 end
        elseif block == 64 then
            r[32]=(437955)
            r[32]=r[31] == r[32]
            if not r[32] then block=99 else block=85 end
        elseif block == 85 then
            r[20]=r[24]
            r[18]=env[(355299)]
            block=99
        elseif block == 99 then
            return unpackValues(r, 0, -1)
        elseif block == 106 then
            block=113
        elseif block == 113 then
            r[32]=(407827)
            r[32]=r[31] == r[32]
            if not r[32] then block=141 else block=134 end
        elseif block == 134 then
            r[22][(399398)]=r[16]
            block=141
        elseif block == 141 then
            r[32]=(true)
            r[33]=upvalues[1][7]
            r[33][("cleaned")]=r[32]
            r[32]=(364818)
            r[32]=r[31] == r[32]
            if not r[32] then block=197 else block=183 end
        elseif block == 183 then
            do local f=r[12]; local n=6; if n<0 then n=top-12-1 end; local m=20; if m==1 then r[12]=f(unpackValues(r,13,12+n)); top=13 elseif m==0 then f(unpackValues(r,13,12+n)); top=12 else local result=packValues(f(unpackValues(r,13,12+n))); if m<0 then m=result.n end; for i=1,m do r[12+i-1]=result[i] end; top=12+m end end
            r[20]=r[17] / r[16]
            block=197
        elseif block == 197 then
            r[33] = env[("pairs")]
            r[32]=r[33]
            r[33]=upvalues[2][7]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=3; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            block=295
        elseif block == 232 then
            r[38] = env[("type")]
            r[37]=r[38]
            r[38]=r[36]
            do local f=r[37]; local n=1; if n<0 then n=top-37-1 end; local m=1; if m==1 then r[37]=f(unpackValues(r,38,37+n)); top=38 elseif m==0 then f(unpackValues(r,38,37+n)); top=37 else local result=packValues(f(unpackValues(r,38,37+n))); if m<0 then m=result.n end; for i=1,m do r[37+i-1]=result[i] end; top=37+m end end
            if not (r[37] == ("boolean")) then block=295 else block=267 end
        elseif block == 267 then
            r[37]=(false)
            r[38]=upvalues[2][7]
            r[38][r[35]]=r[37]
            block=295
        elseif block == 295 then
            r[35], r[36]=r[32](r[33],r[34])
            if r[35]~=nil then r[34]=r[35]; block=232 else block=309 end
        elseif block == 309 then
            r[32]=(442890)
            r[32]=r[31] == r[32]
            if not r[32] then block=351 else block=330 end
        elseif block == 330 then
            r[6]=#r[21]
            r[5]=r[3] .. r[0]
            r[20]=r[0][r[7]]
            block=351
        elseif block == 351 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            r[33]=upvalues[3][7]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            captures[1] = upvalues[4]
            captures[2] = upvalues[5]
            r[33]=function(...) return functions[141](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            captures[1] = upvalues[4]
            captures[2] = upvalues[6]
            r[33]=function(...) return functions[142](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]=(376490)
            r[32]=r[31] == r[32]
            if not r[32] then block=477 else block=456 end
        elseif block == 456 then
            r[4]=r[19] / r[24]
            r[20][("genv")]=r[14]
            r[14]=r[0] / r[24]
            block=477
        elseif block == 477 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            r[33]=upvalues[7][7]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]=(392622)
            r[32]=r[31] == r[32]
            if not r[32] then block=540 else block=526 end
        elseif block == 526 then
            r[17][(437955)]=r[25]
            r[20][(364818)]=r[17]
            block=540
        elseif block == 540 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            r[33]=upvalues[8][7]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]=upvalues[1][7]
            r[32] = r[32][("idleConn")]
            if not r[32] then block=645 else block=589 end
        elseif block == 589 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            captures[1] = upvalues[1]
            r[33]=function(...) return functions[143](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            r[32]=nil
            r[33]=upvalues[1][7]
            r[33][("idleConn")]=r[32]
            block=645
        elseif block == 645 then
            r[32]=upvalues[1][7]
            r[32] = r[32][("genv")]
            r[32] = r[32][("AzureUnload")]
            r[33]=upvalues[1][7]
            r[33] = r[33][("cleanup")]
            if not (r[32] == r[33]) then block=722 else block=687 end
        elseif block == 687 then
            r[32]=nil
            r[33]=upvalues[1][7]
            r[33] = r[33][("genv")]
            r[33][("AzureUnload")]=r[32]
            block=722
        elseif block == 722 then
            r[32]=(428187)
            r[32]=r[31] == r[32]
            if not r[32] then block=764 else block=743 end
        elseif block == 743 then
            r[2]=r[16][r[10]]
            r[10]=r[6] - r[12]
            r[4]=r[18][r[24]]
            block=764
        elseif block == 764 then
            r[33] = env[("pcall")]
            r[32]=r[33]
            do local captures = {}
            captures[1] = upvalues[9]
            r[33]=function(...) return functions[144](captures, ...) end
            end
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[141] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(464405)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("UnbindFromRenderStep")]
            r[34]=upvalues[2][7]
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[142] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(396234)
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("UnbindFromRenderStep")]
            r[34]=upvalues[2][7]
            do local f=r[32]; local n=2; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[143] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(397428)
            r[34]=upvalues[1][7]
            r[34] = r[34][("idleConn")]
            r[33]=r[34]
            r[32] = r[33][("Disconnect")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

functions[144] = function(upvalues, ...)
    local args = packValues(...)
    local r = {}
    local varargs = {n=0}
    local top = 0
    local block = 1
    while true do
        if block == 1 then
            r[31]=(935609)
            r[32]=(1000723)
            r[32]=r[31] == r[32]
            if not r[32] then block=36 else block=29 end
        elseif block == 29 then
            r[22]=r[24]
            block=36
        elseif block == 36 then
            r[34]=upvalues[1][7]
            r[33]=r[34]
            r[32] = r[33][("Destroy")]
            do local f=r[32]; local n=1; if n<0 then n=top-32-1 end; local m=0; if m==1 then r[32]=f(unpackValues(r,33,32+n)); top=33 elseif m==0 then f(unpackValues(r,33,32+n)); top=32 else local result=packValues(f(unpackValues(r,33,32+n))); if m<0 then m=result.n end; for i=1,m do r[32+i-1]=result[i] end; top=32+m end end
            return unpackValues(r, 0, -1)
        else error("Invalid recovered block") end
    end
end

return functions[1]({}, ...)
