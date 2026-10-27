-- Fallens dump sender by zeyrixen
-- Transfers an existing native VM dump to the owner's private receiver.
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
            local path="Zyrixen_Fallens/Fallens_VM_1793067970_30s.json"
            if not isfile(path) then
                local found,paths=pcall(listfiles,"Zyrixen_Fallens")
                assert(found,"Folder dump tidak terbaca.")
                table.sort(paths)
                path=nil
                for _,p in ipairs(paths) do
                    if p:match("_30s%.json$") then path=p end
                end
                assert(path,"File dump 30s belum ditemukan.")
            end
            local data=readfile(path)
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
                        Url=api.."?action="..action,
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
            print("[ZYRIXEN] SELESAI. Dump sudah terkirim. Beri tahu di chat: sudah terkirim.")
        end)
        env.ZYRIXEN_FALLENS_SENDING=false
        if not ok then warn("[ZYRIXEN] Pengiriman berhenti: "..tostring(err)) end
    end)
end
