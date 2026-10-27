-- Fallens native constant recovery by zeyrixen
-- Reads requested lazy constants from the retained native capture and uploads a separate round.
-- The short-lived upload token is supplied by the caller; no SCRIPT_KEY is sent separately.
return function(token)
    assert(type(token)=="string" and #token>=32,"Token pengiriman belum diisi.")
    local env=getgenv()
    if env.ZYRIXEN_FALLENS_SENDING then warn("[ZYRIXEN] Pengiriman masih berjalan.");return end
    env.ZYRIXEN_FALLENS_SENDING=true
    task.spawn(function()
        local ok,err=pcall(function()
            local send=request or http_request or (syn and syn.request)
            assert(type(send)=="function","API request tidak tersedia.")
            local api="https://hdlxgecizpuljvdoznyv.supabase.co/functions/v1/fallens-native-transfer-v1"
            local json=game:GetService("HttpService")
            local state=rawget(env,"ZYRIXEN_FALLENS_CAPTURE")
            assert(type(state)=="table" and state.format=="zyrixen.native-vm.v1","Sesi capture tidak aktif. Jangan jalankan capture ulang dulu; kirim pesan ini di chat.")
            assert(state.source_tag=="FALLENS_ROUTE2_NATIVE_V54","Capture berasal dari sumber berbeda.")
            assert(type(state.pa)=="table" and type(state.serialize)=="function","State capture tidak lengkap.")
            local requests="180,I,108;188,G,2584;188,G,7830;188,M,120;188,M,126;188,M,239;188,M,333;188,M,7829;188,M,788;188,M,905;188,M,911;188,l,802;189,G,20;189,M,19;189,M,20;189,M,23;189,M,25;193,I,1001;193,I,1002;193,I,1031;193,I,1032;193,I,1153;193,I,1374;193,I,1400;193,I,1401;193,I,1909;193,I,1910;193,I,1954;193,I,2006;193,I,202;193,I,2068;193,I,2143;193,I,2237;193,I,2318;193,I,2452;193,I,2558;193,I,3316;193,I,3405;193,I,360;193,I,3790;193,I,3850;193,I,3997;193,I,4030;193,I,4039;193,I,4056;193,I,4057;193,I,4121;193,I,4356;193,I,4675;193,I,4676;193,I,4687;193,I,4688;193,I,5020;193,I,5108;193,I,5209;193,I,5447;193,I,5736;193,I,5776;193,I,6045;193,I,6060;193,I,6067;193,I,6089;193,I,6348;193,I,6349;193,I,6392;193,I,6399;193,I,6541;193,I,656;193,I,657;193,I,6778;193,I,6779;193,I,6788;193,I,713;193,I,768;193,I,964;193,q,256;193,q,257;193,q,349;193,q,4648;193,q,834;196,l,40;197,l,39;199,G,55"
            local seq={}
            for proto,cap in next,state.pa do
                if type(proto)=="table" and type(cap)=="table" and cap.__seq then seq[cap.__seq]=cap end
            end
            local overlays={}
            local unresolved={}
            local resolved=0
            local requested=0
            for item in requests:gmatch("[^;]+") do
                requested+=1
                local capture,field,index=item:match("^(%d+),([%a_][%w_]*),(%d+)$")
                local cap=seq[tonumber(capture)]
                local target=cap and cap[field]
                if type(target)=="table" then
                    local key=tonumber(index)
                    local good,value=pcall(function()return target[key]end)
                    if good and value~=nil then
                        resolved+=1
                        overlays[target]=overlays[target] or {}
                        if not overlays[target][key] then overlays[target][key]={value=value} end
                    else
                        unresolved[#unresolved+1]=item
                    end
                else
                    unresolved[#unresolved+1]=item
                end
            end
            print(string.format("[ZYRIXEN] Konstanta terbaca: %d/%d.",resolved,requested))
            assert(resolved>0,"Belum ada konstanta tambahan terbaca. Kirim screenshot hasil ini.")
            local restore={}
            for target,slots in next,overlays do
                for key,entry in next,slots do
                    restore[#restore+1]={target=target,key=key,old=rawget(target,key)}
                    rawset(target,key,entry.value)
                end
            end
            local serialized,data=pcall(state.serialize)
            for i=#restore,1,-1 do
                local entry=restore[i]
                rawset(entry.target,entry.key,entry.old)
            end
            assert(serialized,"Ekspor konstanta gagal; state asli sudah dipulihkan.")
            if data:sub(-2)=="}}" then
                local missing={}
                for _,item in ipairs(unresolved) do missing[#missing+1]='"'..item..'"' end
                data=data:sub(1,-3)..',"constant_round":1,"constant_requested":'..requested..',"constant_resolved":'..resolved..',"constant_unresolved":['..table.concat(missing,",")..']}}'
            end
            local path="Fallens_native_constants_r1.json"
            assert(type(data)=="string" and #data>0,"File dump kosong.")
            local size=#data
            local chunk=131072
            local count=math.ceil(size/chunk)
            assert(count<=1024,"Dump melebihi batas 128 MiB; kirim screenshot ukuran ini: "..size)
            print(string.format("[ZYRIXEN] Mengirim %.2f MiB / %d bagian.",size/1048576,count))
            local function call(action,body)
                local last="request gagal"
                for attempt=1,3 do
                    local good,res=pcall(send,{
                        Url=api.."?action="..action.."&round=1",
                        Method="POST",
                        Headers={["Content-Type"]="application/octet-stream",["x-zyrixen-transfer"]=token},
                        Body=body or ""
                    })
                    if good and type(res)=="table" then
                        local status=tonumber(res.StatusCode or res.Status)
                        if status and status>=200 and status<300 then
                            local parsed,reply=pcall(json.JSONDecode,json,res.Body or "")
                            if parsed and reply.ok then return reply end
                            last="Respons tidak valid."
                        else
                            last="HTTP "..tostring(status).." "..tostring(res.Body or ""):sub(1,160)
                            if status==401 or status==403 or status==410 or status==409 then error(last,0) end
                        end
                    else
                        last=tostring(res)
                    end
                    task.wait(attempt)
                end
                error(last,0)
            end
            call("init","")
            for part=0,count-1 do
                local first=part*chunk+1
                local block=data:sub(first,math.min(first+chunk-1,size))
                local reply=call("part&part="..part,block)
                assert(reply.part==part and reply.bytes==#block,"Verifikasi bagian gagal.")
                if part==0 or (part+1)%8==0 or part==count-1 then
                    print(string.format("[ZYRIXEN] Terkirim %d/%d (%d%%)",part+1,count,math.floor((part+1)*100/count)))
                end
                task.wait(0.05)
            end
            local result=call("finish",json:JSONEncode({parts=count,bytes=size,filename=path:match("[^/\\]+$") or "Fallens_dump.json"}))
            assert(result.complete==true and result.bytes==size,"Manifest belum lengkap.")
            env.ZYRIXEN_FALLENS_SENT={upload_id=result.upload_id,bytes=size,parts=count}
            print("[ZYRIXEN] SELESAI. Konstanta tambahan sudah terkirim. Balas di chat: konstanta terkirim.")
        end)
        env.ZYRIXEN_FALLENS_SENDING=false
        if not ok then warn("[ZYRIXEN] Pengiriman berhenti: "..tostring(err)) end
    end)
end
