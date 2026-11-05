-- deobsefactor by zyrixen

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local settings = {
    enabled = true,
    action = "dodge",
    distance = 10,
    cooldown = 0.10,
    direction = "right",
    directionMode = "alternate",
    prediction = false,
    predictionLead = 0.10,
    predictionDistance = 5,
    staminaMode = "free",
    counterEnabled = false,
    counterDelay = 0.35,
    counterRange = 4,
    counterCooldown = 0.60,
    counterLockInput = true,
}

local attacks = {
    ["15444472332"] = true, ["6808140734"] = true,
    ["6808137744"] = true, ["6804556643"] = true,
    ["6808146822"] = true, ["10061480712"] = true,
    ["6808144430"] = true, ["10061309698"] = true,
    ["10061421337"] = true, ["126945362832142"] = true,
    ["10061259513"] = true,
    ["8842412497"] = true, ["8842401685"] = true,
    ["8842448459"] = true, ["8842469710"] = true,
    ["8842460112"] = true, ["10063118953"] = true,
    ["10063095947"] = true, ["76226994884465"] = true,
    ["10063102368"] = true,
}
local enemyDodges = {
    ["8718568305"] = true, ["8718268965"] = true,
    ["8842383791"] = true, ["8842360480"] = true,
    ["9123582546"] = true,
}

if type(_G.StopBoxingDodge) == "function" then
    _G.StopBoxingDodge()
end
if type(_G.StopBoxingPunchTap) == "function" then _G.StopBoxingPunchTap() end
if type(_G.StopNativeDodgeTest) == "function" then
    _G.StopNativeDodgeTest()
end

local playerGui = player:WaitForChild("PlayerGui")
for _, name in ipairs({"DodgeManualTest", "BoxingAutoDodge"}) do
    local previous = playerGui:FindFirstChild(name)
    if previous then previous:Destroy() end
end

local closed = false
local connections = {}
local lastDodge = -math.huge
local counts = {seen = 0, match = 0, sent = 0, punch = 0, predictions = 0,
    counterSeen = 0, counterSent = 0, counterCancelled = 0}
local counterEpoch = 0
local lastCounter = -math.huge
local punchInputLock
local predictor
local lastPredictionTarget
local lastPredictionTime = -math.huge
local lastInput
local doubleHitEnabled = true
local extraDelay = 0.35
local generation = 0
local taps, completed, failed = 0, 0, 0
local actionAnimations = 0
local lastAnimationId = "-"
local onNativeTap
local staminaTextPath = type(_G.BoxingStaminaTextPath) == "table" and _G.BoxingStaminaTextPath or nil
local pickingStamina = false

local function listen(signal, callback)
    local connection = signal:Connect(callback)
    connections[#connections + 1] = connection
    return connection
end

listen(UIS.InputBegan, function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        lastInput = input
    end
end)

local function make(class, props, parent)
    local object = Instance.new(class)
    for key, value in pairs(props) do object[key] = value end
    object.Parent = parent
    return object
end

local colors = {
    background = Color3.fromRGB(16, 20, 30),
    card = Color3.fromRGB(29, 36, 51),
    accent = Color3.fromRGB(111, 119, 255),
    green = Color3.fromRGB(35, 143, 113),
    muted = Color3.fromRGB(151, 168, 196),
    white = Color3.fromRGB(239, 244, 255),
    red = Color3.fromRGB(134, 55, 74),
}
local function corner(object, radius)
    make("UICorner", {CornerRadius = UDim.new(0, radius or 10)}, object)
end
local gui = make("ScreenGui", {
    Name = "BoxingAutoDodge", ResetOnSpawn = false, DisplayOrder = 105,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playerGui)
local host = make("Frame", {Size=UDim2.fromScale(1,1), BackgroundTransparency=1, BorderSizePixel=0}, gui)
local panel = make("Frame", {
    Size=UDim2.fromOffset(344,508), Position=UDim2.fromOffset(16,16),
    BackgroundColor3=colors.background, BorderSizePixel=0,
}, host)
corner(panel,16)
make("UIStroke", {Color=Color3.fromRGB(58,70,98),Thickness=1}, panel)
local scale = make("UIScale", {Scale=1}, panel)
local function label(text,x,y,w,h,size,color,parent)
    return make("TextLabel", {
        Text=text,Position=UDim2.fromOffset(x,y),Size=UDim2.fromOffset(w,h),
        BackgroundTransparency=1,Font=Enum.Font.Gotham,TextSize=size or 12,
        TextColor3=color or colors.white,TextXAlignment=Enum.TextXAlignment.Left,
    }, parent or panel)
end
local function button(text,x,y,w,h,parent)
    local object=make("TextButton", {
        Text=text,Position=UDim2.fromOffset(x,y),Size=UDim2.fromOffset(w,h),
        BackgroundColor3=colors.card,BorderSizePixel=0,Font=Enum.Font.GothamBold,
        TextColor3=colors.white,TextSize=12,AutoButtonColor=true,
    }, parent or panel)
    corner(object,10)
    return object
end
local header=label("BOXING CONTROL",16,10,228,28,19)
header.Font=Enum.Font.GothamBold
header.Active=true
label("ZYRIXEN  /  DODGE + PUNCH",16,39,248,15,10,colors.muted)
local minimize=button("-",264,15,28,28)
local close=button("X",300,15,28,28)
close.BackgroundColor3=colors.red
local targetCard=make("Frame", {
    Position=UDim2.fromOffset(16,66),Size=UDim2.fromOffset(312,30),
    BackgroundColor3=colors.card,BorderSizePixel=0,
},panel)
corner(targetCard,9)
local targetLabel=label("Target: tidak ada | Maks. 10 stud",10,0,292,30,11,colors.muted,targetCard)
targetLabel.TextTruncate=Enum.TextTruncate.AtEnd
local tabDodge=button("DODGE",16,108,98,34)
local tabPunch=button("PUKULAN",122,108,98,34)
local tabCounter=button("COUNTER",228,108,100,34)
tabDodge.TextSize=11
tabPunch.TextSize=11
tabCounter.TextSize=11
local pageDodge=make("Frame", {
    Position=UDim2.fromOffset(16,154),Size=UDim2.fromOffset(312,254),BackgroundTransparency=1,
},panel)
local pagePunch=make("Frame", {
    Position=UDim2.fromOffset(16,154),Size=UDim2.fromOffset(312,254),BackgroundTransparency=1,Visible=false,
},panel)
local pageCounter=make("Frame", {
    Position=UDim2.fromOffset(16,154),Size=UDim2.fromOffset(312,254),
    BackgroundTransparency=1,Visible=false,
},panel)
local toggle=button("",0,0,312,38,pageDodge)
label("MODE AKSI",0,48,312,16,10,colors.muted,pageDodge)
local modeDodge=button("Dodge biasa",0,70,152,34,pageDodge)
local modeCombo=button("Dodge + Hit",160,70,152,34,pageDodge)
local directionButton=button("",0,116,152,34,pageDodge)
local staminaButton=button("Stamina: BEBAS",160,116,152,34,pageDodge)
staminaButton.TextSize=11
local predictionButton=button("Prediksi: OFF",0,162,152,30,pageDodge)
local leadButton=button("Awal: 0.10s",160,162,152,30,pageDodge)
predictionButton.TextSize=11
leadButton.TextSize=11
local timing=button("",0,202,152,30,pageDodge)
timing.TextSize=11
local staminaSource=button("PILIH STAMINA",160,202,152,30,pageDodge)
staminaSource.TextSize=11
local staminaStatus=label("Stamina: -- | Pilih angka stamina 0-100",0,238,312,16,10,colors.muted,pageDodge)
local doubleToggle=button("",0,0,312,38,pagePunch)
local punchNote=label("Tambahan mengikuti tap tombol tinju asli game.",0,45,312,28,11,colors.muted,pagePunch)
punchNote.TextWrapped=true
local extraTiming=button("",0,82,312,34,pagePunch)
extraTiming.TextSize=11
local punchStats=label("",0,122,312,18,10,colors.muted,pagePunch)
local animationLabel=label("Anim aksi: 0 | ID: -",0,143,312,17,10,colors.muted,pagePunch)
animationLabel.TextTruncate=Enum.TextTruncate.AtEnd
local reset=button("RESET LOG",0,166,312,28,pagePunch)
reset.TextSize=11
local counterToggle=button("COUNTER DODGE: OFF",0,0,312,38,pageCounter)
local counterNote=label("Belakang: kunci singkat sesuai jeda Counter. Dodge berulang memperbarui kunci.",0,48,312,40,11,colors.muted,pageCounter)
counterNote.TextWrapped=true
local counterTiming=button("",0,100,312,32,pageCounter)
counterTiming.TextSize=11
local counterRangeButton=button("",0,144,312,32,pageCounter)
counterRangeButton.TextSize=11
local counterLockButton=button("Kunci tap: ON",0,188,312,30,pageCounter)
counterLockButton.TextSize=11
local counterStats=label("",0,226,312,22,10,colors.muted,pageCounter)
local stats=label("",16,421,312,20,10,colors.muted)
local status=label("Siap | Stamina bebas; pilih Hemat bila diperlukan",16,447,312,31,11)
status.TextWrapped=true
label("Hasil aksi mengikuti validasi dan cooldown game.",16,486,312,13,9,colors.muted)
local icon=button("",12,110,66,58,host)
icon.TextSize=11
icon.Visible=false
local activeTab="dodge"
local function refreshStats()
    stats.Text=string.format("Dodge:%d | Pred:%d | Combo:%d | Extra:%d",counts.sent,counts.predictions,counts.punch,completed)
    punchStats.Text=string.format("Pemicu: %d  |  Extra: %d  |  Error: %d",taps,completed,failed)
    counterStats.Text=string.format("Dodge lawan: %d | Counter: %d | Batal: %d",counts.counterSeen,counts.counterSent,counts.counterCancelled)
end
local function renderStats() refreshStats() end
local function renderAnimations()
    animationLabel.Text=string.format("Anim aksi: %d | ID: %s",actionAnimations,lastAnimationId)
end
local function updatePredictionLabel()
    predictionButton.Text=not settings.prediction and "Prediksi: OFF"
        or (predictor and predictor.deadline and "Prediksi: SIAP"
        or string.format("Prediksi: %d/4",predictor and predictor.count or 0))
    predictionButton.BackgroundColor3=settings.prediction and colors.accent or colors.card
end
local function refresh()
    toggle.Text=settings.enabled and "AUTO DODGE: ON" or "AUTO DODGE: OFF"
    toggle.BackgroundColor3=settings.enabled and colors.green or colors.card
    modeDodge.BackgroundColor3=settings.action=="dodge" and colors.accent or colors.card
    modeCombo.BackgroundColor3=settings.action=="combo" and colors.accent or colors.card
    timing.Text=string.format("Jeda: %.2fs",settings.cooldown)
    staminaButton.Text=settings.staminaMode=="save" and "Stamina: HEMAT" or "Stamina: BEBAS"
    staminaButton.BackgroundColor3=settings.staminaMode=="save" and colors.accent or colors.card
    directionButton.Text=settings.directionMode=="alternate" and "Arah: BERGANTIAN"
        or (settings.direction=="right" and "Arah: KANAN" or "Arah: KIRI")
    doubleToggle.Text=doubleHitEnabled and "DOUBLE HIT: ON" or "DOUBLE HIT: OFF"
    doubleToggle.BackgroundColor3=doubleHitEnabled and colors.green or colors.card
    extraTiming.Text=string.format("Jeda pukulan ekstra: %.2fs  |  Klik untuk ubah",extraDelay)
    leadButton.Text=string.format("Awal: %.2fs",settings.predictionLead)
    updatePredictionLabel()
    tabDodge.BackgroundColor3=activeTab=="dodge" and colors.accent or colors.card
    tabPunch.BackgroundColor3=activeTab=="punch" and colors.accent or colors.card
    tabCounter.BackgroundColor3=activeTab=="counter" and colors.accent or colors.card
    pageDodge.Visible=activeTab=="dodge"
    pagePunch.Visible=activeTab=="punch"
    pageCounter.Visible=activeTab=="counter"
    counterToggle.Text=settings.counterEnabled and "COUNTER DODGE: ON" or "COUNTER DODGE: OFF"
    counterToggle.BackgroundColor3=settings.counterEnabled and colors.green or colors.card
    counterTiming.Text=string.format("Jeda counter: %.2fs | Klik untuk ubah",settings.counterDelay)
    counterRangeButton.Text=string.format("Jangkauan pukul: %d stud",settings.counterRange)
    counterLockButton.Text=not settings.counterLockInput and "Kunci tap: OFF"
        or (punchInputLock and punchInputLock:isLocked() and "Tap tinju: TERKUNCI" or "Kunci tap: ON")
    counterLockButton.BackgroundColor3=punchInputLock and punchInputLock:isLocked() and colors.red or colors.card
    icon.Text=(settings.enabled and "D ON" or "D OFF").."\n"..(doubleHitEnabled and "2X ON" or "2X OFF")
        .."\n"..(settings.counterEnabled and "C ON" or "C OFF")
    icon.BackgroundColor3=(settings.enabled or doubleHitEnabled or settings.counterEnabled) and colors.green or colors.card
    refreshStats()
end
local function layout()
    if closed then return end
    local size=host.AbsoluteSize
    if size.X<=16 or size.Y<=16 then return end
    scale.Scale=math.min(1,(size.X-16)/344,(size.Y-16)/508)
    panel.Position=UDim2.fromOffset(
        math.clamp(panel.Position.X.Offset,0,math.max(0,size.X-344*scale.Scale)),
        math.clamp(panel.Position.Y.Offset,0,math.max(0,size.Y-508*scale.Scale))
    )
end

local function createStaminaGate()
    local gate = {paused = false, allowed = nil}
    function gate:update(mode, percent)
        if mode ~= "save" then
            self.paused, self.allowed = false, true
            return true
        end
        if type(percent) ~= "number" or percent ~= percent or percent < 0 or percent > 100 then
            self.paused, self.allowed = true, false
            return false
        end
        if percent <= 20 then self.paused = true
        elseif self.paused and percent >= 40 then self.paused = false end
        self.allowed = not self.paused
        return self.allowed
    end
    return gate
end

local function parseStaminaPercent(text)
    if type(text) ~= "string" then return nil end
    text = text:gsub("<[^>]*>", ""):gsub(",", ".")
    local current, maximum = text:match("^%s*(%d+%.?%d*)%s*/%s*(%d+%.?%d*)%s*$")
    if current then
        current, maximum = tonumber(current), tonumber(maximum)
        if maximum > 0 and current <= maximum then return current / maximum * 100 end
        return nil
    end
    local value = tonumber(text:match("^%s*(%d+%.?%d*)%s*%%?%s*$"))
    if value and value >= 0 and value <= 100 then return value end
    return nil
end

local function readStaminaPercent()
    if type(staminaTextPath) ~= "table" or #staminaTextPath == 0 then return nil end
    local object = playerGui
    for _, name in ipairs(staminaTextPath) do
        if type(name) ~= "string" then return nil end
        object = object:FindFirstChild(name)
        if not object then return nil end
    end
    if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
        return parseStaminaPercent(object.Text)
    end
    return nil
end

local staminaGate = createStaminaGate()
local function staminaAllowsDodge()
    local percent = readStaminaPercent()
    local previous = staminaGate.allowed
    local allowed = staminaGate:update(settings.staminaMode, percent)
    if previous ~= allowed then
        if predictor then predictor:reset(nil) end
        lastPredictionTarget = nil
    end
    local value = percent and string.format("%.0f%%", percent) or "--"
    if settings.staminaMode ~= "save" then
        staminaStatus.Text = "Stamina: " .. value .. " | Bebas"
    elseif percent == nil then
        staminaStatus.Text = "Stamina belum terbaca | Tekan PILIH STAMINA"
    else
        staminaStatus.Text = "Stamina: " .. value .. (allowed and " | Siap" or " | Jeda sampai 40%")
    end
    return allowed
end

local function nativeButton(direction)
    local mobile = playerGui:FindFirstChild("MobileControls")
    local area = mobile and mobile:FindFirstChild("MobileButtonAreaContainer")
    local name = direction == "right" and "DodgeRightMainContainer" or "DodgeLeftMainContainer"
    local container = area and area:FindFirstChild(name)
    local target = container and container:FindFirstChild("button")
    if target and target:IsA("GuiButton") then return target end
    return nil
end

local function activatedCallbacks(target)
    if type(getconnections) ~= "function" then
        return nil, "Executor tidak mendukung getconnections"
    end
    if not target then return nil, "Tombol bawaan belum tersedia" end
    local readable, list = pcall(getconnections, target.Activated)
    if not readable or type(list) ~= "table" then
        return nil, "Handler Activated tidak bisa dibaca"
    end
    local callbacks = {}
    for _, connection in pairs(list) do
        local ok, callback = pcall(function()
            if connection.Enabled == false or connection.ForeignState == true then return nil end
            return connection.Function
        end)
        if ok and type(callback) == "function" and callback ~= onNativeTap then callbacks[#callbacks + 1] = callback end
    end
    if #callbacks == 0 then return nil, "Handler Activated belum tersedia" end
    return callbacks
end

local function runCallbacks(callbacks, input, clickCount, guard)
    if not input then return false, "Sentuh layar sekali untuk menyiapkan input" end
    for _, callback in ipairs(callbacks) do
        if closed then return false, "Script ditutup" end
        if guard and not guard() then return false, "Aksi dibatalkan" end
        local ok, err = pcall(callback, input, clickCount or 1)
        if not ok then return false, "Handler gagal: " .. tostring(err) end
        if guard and not guard() then return false, "Aksi dibatalkan" end
    end
    return true
end

local function runActivated(target, input, clickCount)
    local callbacks, err = activatedCallbacks(target)
    if not callbacks then return false, err end
    return runCallbacks(callbacks, input, clickCount)
end

local function nativePunchButton()
    local mobile = playerGui:FindFirstChild("MobileControls")
    local area = mobile and mobile:FindFirstChild("MobileButtonAreaContainer")
    local container = area and area:FindFirstChild("PunchMainContainer")
    local target = container and container:FindFirstChild("button")
    if target and target:IsA("GuiButton") then return target end
    return nil
end

local nextDirection = "right"

local function dodge(source, input, clickCount, onDispatched)
    if closed then return end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then
        status.Text = "Karakter belum siap / sedang KO"
        return
    end
    if not staminaAllowsDodge() then
        status.Text = "Dodge dijeda | " .. staminaStatus.Text
        return
    end
    local now = os.clock()
    if now - lastDodge < settings.cooldown then return end
    lastDodge = now
    local action = settings.action
    local actualInput = input or lastInput
    if not actualInput then
        status.Text = "Sentuh layar sekali untuk menyiapkan input"
        return
    end
    local direction = settings.directionMode == "alternate" and nextDirection or settings.direction
    local dodgeCallbacks, dodgeError = activatedCallbacks(nativeButton(direction))
    if not dodgeCallbacks then status.Text = dodgeError; return end
    if settings.directionMode == "alternate" then
        nextDirection = direction == "right" and "left" or "right"
    end
    if onDispatched then onDispatched() end
    local directionText = direction == "right" and "KANAN" or "KIRI"
    local comboError
    if action == "combo" and not (punchInputLock and punchInputLock:isLocked()) then
        local hitCallbacks, hitError = activatedCallbacks(nativePunchButton())
        if hitCallbacks then
            local result = {dodge = "aktif", hit = "aktif", dodgeFailed = false}
            local function showResult()
                if closed or player.Character ~= character then return end
                refreshStats()
                status.Text = directionText .. " | Dodge: " .. result.dodge .. " | Hit: " .. result.hit
            end
            status.Text = source .. " | Dodge + Hit dipicu"
            task.spawn(function()
                if closed or player.Character ~= character then return end
                local dodgeOK, err = runCallbacks(dodgeCallbacks, actualInput, clickCount)
                result.dodgeFailed = not dodgeOK
                if closed or player.Character ~= character then return end
                result.dodge = dodgeOK and "selesai" or "gagal"
                if dodgeOK then counts.sent = counts.sent + 1 end
                showResult()
                if not dodgeOK then warn("Dodge handler: " .. tostring(err)) end
            end)
            task.spawn(function()
                if closed or player.Character ~= character then return end
                if result.dodgeFailed or settings.action ~= "combo"
                    or (punchInputLock and punchInputLock:isLocked()) then
                    result.hit = "dilewati"
                    showResult()
                    return
                end
                local hitOK, err = runCallbacks(hitCallbacks, actualInput, clickCount)
                if closed or player.Character ~= character then return end
                result.hit = hitOK and "selesai" or "gagal"
                if hitOK then counts.punch = counts.punch + 1 end
                showResult()
                if not hitOK then warn("Pukul handler: " .. tostring(err)) end
            end)
            return not result.dodgeFailed
        end
        comboError = hitError
    end

    local ok, err = runCallbacks(dodgeCallbacks, actualInput, clickCount)
    if closed or player.Character ~= character then return end
    if not ok then status.Text = err; return end
    counts.sent = counts.sent + 1
    refreshStats()
    status.Text = source .. " | Dodge " .. directionText .. " dijalankan"

    if comboError then status.Text = "Dodge dijalankan | Hit belum siap: " .. tostring(comboError) end
    return true
end

local function eligible(id, gap, elapsed)
    return attacks[id] == true
        and gap <= settings.distance
        and elapsed >= settings.cooldown
end

local function nearestOpponent()
    local own = player.Character
    local ownRoot = own and own:FindFirstChild("HumanoidRootPart")
    local ownHumanoid = own and own:FindFirstChildOfClass("Humanoid")
    if not ownRoot or not ownHumanoid or ownHumanoid.Health <= 0 then return nil end

    local nearest, bestGap
    for _, opponent in ipairs(Players:GetPlayers()) do
        if opponent ~= player then
            local character = opponent.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if root and humanoid and humanoid.Health > 0 then
                local gap = (ownRoot.Position - root.Position).Magnitude
                if gap <= settings.distance and (not nearest or gap < bestGap) then
                    nearest, bestGap = opponent, gap
                end
            end
        end
    end
    return nearest, bestGap
end

local function createPunchInputLock(getButton, createShield, changed)
    local controller = {state = nil}
    function controller:isLocked() return self.state ~= nil end
    function controller:release(owner)
        local state = self.state
        if not state or (owner ~= nil and owner ~= state.owner) then return false end
        self.state = nil
        if state.hasInteractable and not state.executing then
            pcall(function() state.target.Interactable = state.originalInteractable end)
        end
        pcall(function() state.shield:Destroy() end)
        if changed then changed() end
        return true
    end
    function controller:acquire(owner, expiresAt)
        local target = getButton()
        local current = self.state
        if current and current.target == target and target and target.Parent and not current.executing then
            current.owner, current.expiresAt = owner, expiresAt
            if current.hasInteractable then
                pcall(function() target.Interactable = false end)
            end
            if changed then changed() end
            return true
        end
        self:release()
        if not target or not target.Parent then return false, "Tombol pukul belum tersedia" end
        local readable, original = pcall(function() return target.Interactable end)
        local ok, shield = pcall(createShield, target)
        if not ok or not shield then return false, "Pelindung tombol gagal dibuat" end
        local state = {target=target,shield=shield,owner=owner,expiresAt=expiresAt,
            hasInteractable=readable and type(original)=="boolean",originalInteractable=original,executing=false}
        self.state = state
        if state.hasInteractable then
            local set = pcall(function() target.Interactable = false end)
            if not set then self:release(owner); return false, "Tombol tidak bisa dikunci" end
        end
        if changed then changed() end
        return true
    end
    function controller:allowCounter(owner)
        local state = self.state
        if not state or state.owner ~= owner then return false end
        if state.hasInteractable then
            pcall(function() state.target.Interactable = state.originalInteractable end)
        end
        state.executing = true
        return true
    end
    function controller:pulse(owner, now)
        local state = self.state
        if not state then return true end
        if state.owner ~= owner or now >= state.expiresAt
            or not state.target.Parent or getButton() ~= state.target then
            self:release()
            return false
        end
        local ok = pcall(function()
            local target, shield = state.target, state.shield
            shield.Parent = target.Parent
            shield.Position, shield.Size = target.Position, target.Size
            shield.AnchorPoint, shield.Rotation = target.AnchorPoint, target.Rotation
            shield.ZIndex = math.max(50,(target.ZIndex or 1)+10)
            if state.hasInteractable and not state.executing then
                if target.Interactable ~= false then state.originalInteractable = target.Interactable end
                target.Interactable = false
            end
        end)
        if not ok then self:release(); return false end
        return true
    end
    return controller
end
punchInputLock = createPunchInputLock(nativePunchButton,function(target)
    local shield=make("TextButton",{
        Name="BoxingCounterInputShield",Text="TERKUNCI",TextSize=10,Font=Enum.Font.GothamBold,
        TextColor3=Color3.new(1,1,1),BackgroundColor3=colors.red,BackgroundTransparency=0.18,
        BorderSizePixel=0,AutoButtonColor=false,Active=true,Selectable=false,
        Position=target.Position,Size=target.Size,AnchorPoint=target.AnchorPoint,Rotation=target.Rotation,
        ZIndex=math.max(50,target.ZIndex+10),
    },target.Parent)
    corner(shield,999)
    return shield
end,function()
    generation=generation+1
    refresh()
end)

local function queueCounter(opponent, character, dodgeId, dodgeLength, dodgeSpeed)
    if closed or not settings.counterEnabled or opponent.Character ~= character then return end
    local target = nearestOpponent()
    if target ~= opponent then return end
    counts.counterSeen = counts.counterSeen + 1
    refreshStats()
    local function diagnostic(message)
        if counterNote then
            counterNote.Text = string.format("%s | ID %s\n%s",opponent.Name,tostring(dodgeId),message)
        end
    end
    diagnostic("Dodge terdeteksi")
    local now = os.clock()
    counterEpoch = counterEpoch + 1
    local token, ownCharacter, input = counterEpoch, player.Character, lastInput
    local isBack = dodgeId == "9123582546"
    local duration = 0
    if not isBack and type(dodgeLength) == "number" and dodgeLength > 0 then
        local speed = type(dodgeSpeed) == "number" and math.abs(dodgeSpeed) or 1
        if speed > 0 then duration = dodgeLength / speed end
    end
    local delay = math.max(settings.counterDelay, math.min(duration, 1.50))
    local deadline = now + delay
    local function active()
        return not closed and settings.counterEnabled and token == counterEpoch
            and player.Character == ownCharacter and opponent.Character == character
    end
    local function cancel(reason)
        punchInputLock:release(token)
        if closed then return end
        counts.counterCancelled = counts.counterCancelled + 1
        refreshStats()
        status.Text = "Counter batal | " .. reason
        diagnostic("Counter batal | " .. reason)
    end
    if settings.counterLockInput then
        local locked, reason = punchInputLock:acquire(token,deadline+1)
        if not locked then cancel(tostring(reason)); return end
        diagnostic(string.format("Kunci dipasang %.2fs",delay))
    else
        punchInputLock:release()
        diagnostic("Kunci tap OFF")
    end
    status.Text = string.format("Counter menunggu %.2fs | %s",delay,opponent.Name)
    local function attempt()
        if not active() then punchInputLock:release(token); return end
        local current = nearestOpponent()
        if current ~= opponent then cancel("Target berubah"); return end
        local ownRoot = ownCharacter and ownCharacter:FindFirstChild("HumanoidRootPart")
        local otherRoot = character:FindFirstChild("HumanoidRootPart")
        local ownHumanoid = ownCharacter and ownCharacter:FindFirstChildOfClass("Humanoid")
        local otherHumanoid = character:FindFirstChildOfClass("Humanoid")
        if not ownRoot or not otherRoot or not ownHumanoid or not otherHumanoid
            or ownHumanoid.Health <= 0 or otherHumanoid.Health <= 0 then
            cancel("Karakter belum siap"); return
        end
        if os.clock() - lastDodge < 0.30 then cancel("Prioritas dodge kita"); return end
        local delta = otherRoot.Position - ownRoot.Position
        if delta.Magnitude < 0.01 or delta.Magnitude > settings.counterRange then
            cancel("Di luar jangkauan pukul"); return
        end
        if ownRoot.CFrame.LookVector:Dot(delta.Unit) < 0.35 then
            cancel("Kita tidak menghadap lawan"); return
        end
        input = input or lastInput
        if not input then cancel("Sentuh layar sekali untuk menyiapkan input"); return end
        if os.clock() - lastCounter < settings.counterCooldown then cancel("Jeda pukulan counter"); return end
        local callbacks, err = activatedCallbacks(nativePunchButton())
        if not callbacks then cancel(tostring(err)); return end
        if settings.counterLockInput and not punchInputLock:allowCounter(token) then
            cancel("Kunci tombol berakhir"); return
        end
        lastCounter = os.clock()
        local ok, problem = runCallbacks(callbacks,input,1,active)
        punchInputLock:release(token)
        if not active() then return end
        if not ok then cancel(tostring(problem)); return end
        counts.counterSent = counts.counterSent + 1
        refreshStats()
        status.Text = "Counter | Handler pukul dipanggil sekali"
        diagnostic("Kunci dilepas | Handler pukul dipanggil")
    end
    task.delay(delay,attempt)
    return true
end

local function createRhythmPredictor(lead)
    local model = {lead = lead or 0.10, times = {}, count = 0, revision = 0}
    function model:reset(target)
        self.revision = self.revision + 1
        self.target, self.times, self.count = target, {}, 0
        self.deadline = nil
    end
    function model:observe(target, now)
        if not target then self:reset(nil); return false end
        if self.target ~= target then self:reset(target) end
        local previous = self.times[#self.times]
        if previous then
            local gap = now - previous
            if gap < 0.08 then return false end
            if gap < 0.20 or gap > 2 then self:reset(target) end
        end
        self.times[#self.times + 1] = now
        if #self.times > 4 then table.remove(self.times, 1) end
        self.count = #self.times
        self.deadline = nil
        if self.count < 4 then return true end
        local intervals = {}
        local mean = 0
        for index = 2, 4 do
            local interval = self.times[index] - self.times[index - 1]
            intervals[#intervals + 1] = interval
            mean = mean + interval / 3
        end
        for _, interval in ipairs(intervals) do
            if math.abs(interval - mean) > mean * 0.15 then
                self.times, self.count = {now}, 1
                return true
            end
        end
        self.deadline = now + mean - math.min(self.lead, mean * 0.5)
        return true
    end
    function model:poll(target, now)
        if self.target ~= target then self:reset(target); return false end
        if not self.deadline or now + 0.000001 < self.deadline then return false end
        local deadline = self.deadline
        self.deadline = nil
        return now <= deadline + 0.10
    end
    return model
end
predictor = createRhythmPredictor(settings.predictionLead)

local function predictionEligible(target, gap)
    if not target or not gap or gap > (settings.predictionDistance or 5) then return false end
    local own = player.Character
    local other = target.Character
    local ownRoot = own and own:FindFirstChild("HumanoidRootPart")
    local otherRoot = other and other:FindFirstChild("HumanoidRootPart")
    if not ownRoot or not otherRoot then return false end
    local delta = ownRoot.Position - otherRoot.Position
    if delta.Magnitude < 0.01 then return false end
    return otherRoot.CFrame.LookVector:Dot(delta.Unit) >= 0.35
end

local function stepPrediction(now)
    if closed or not settings.enabled or not settings.prediction then
        predictor:reset(nil)
        return
    end
    if not staminaAllowsDodge() then predictor:reset(nil); return end
    local target, gap = nearestOpponent()
    if not predictionEligible(target, gap) then predictor:reset(nil); return end
    local key = target.Character
    if predictor:poll(key, now) then
        local activeModel, revision = predictor, predictor.revision
        task.spawn(function()
            if closed or not settings.enabled or not settings.prediction or target.Character ~= key then return end
            if predictor ~= activeModel or predictor.revision ~= revision then return end
            local current, currentGap = nearestOpponent()
            if current ~= target or not predictionEligible(target, currentGap) then return end
            local dispatchedAt
            local started = dodge("Prediksi " .. target.Name,nil,nil,function()
                dispatchedAt=os.clock()
                lastPredictionTarget,lastPredictionTime=key,dispatchedAt
                counts.predictions=counts.predictions+1
                refreshStats()
            end)
            if not started and dispatchedAt and lastPredictionTime == dispatchedAt then
                lastPredictionTarget=nil
            end
        end)
    end
end

local watchedAnimators = setmetatable({}, {__mode = "k"})
local watchedCharacters = setmetatable({}, {__mode = "k"})
local watchedPlayers = setmetatable({}, {__mode = "k"})

local function watchCharacter(opponent, character)
    if watchedCharacters[character] then return end
    watchedCharacters[character] = true
    local function inspect(instance)
        if not instance:IsA("Animator") or watchedAnimators[instance] then return end
        watchedAnimators[instance] = true
        listen(instance.AnimationPlayed, function(track)
            if closed or (not settings.enabled and not settings.counterEnabled)
                or opponent.Character ~= character then return end
            local target, gap = nearestOpponent()
            if target ~= opponent then return end

            counts.seen = counts.seen + 1
            local animation = track.Animation
            local id = animation and animation.AnimationId:match("%d+")
            if settings.counterEnabled and id and enemyDodges[id] then
                queueCounter(opponent,character,id,track.Length,track.Speed)
                return
            end
            if not settings.enabled then return end
            if not id or not attacks[id] then refreshStats(); return end
            counts.match = counts.match + 1
            refreshStats()
            if settings.staminaMode == "save" and not staminaAllowsDodge() then
                status.Text = "Dodge dijeda | " .. staminaStatus.Text
                return
            end
            local now = os.clock()
            local predicted = settings.prediction and lastPredictionTarget == character
                and now - lastPredictionTime <= settings.predictionLead + 0.15
            if settings.prediction then
                if predictionEligible(opponent, gap) then predictor:observe(character, now)
                else predictor:reset(nil) end
                updatePredictionLabel()
            end
            if predicted then return end

            if settings.enabled and eligible(id, gap, now - lastDodge) then
                dodge(opponent.Name)
            elseif settings.enabled then
                status.Text = "ID cocok | Masih dalam jeda lokal"
            end
        end)
    end
    listen(character.DescendantAdded, inspect)
    for _, instance in ipairs(character:GetDescendants()) do inspect(instance) end
end

local function watchPlayer(opponent)
    if opponent == player or watchedPlayers[opponent] then return end
    watchedPlayers[opponent] = true
    listen(opponent.CharacterAdded, function(character) watchCharacter(opponent, character) end)
    if opponent.Character then watchCharacter(opponent, opponent.Character) end
end

local function punchButton()
    local mobile = playerGui:FindFirstChild("MobileControls")
    local area = mobile and mobile:FindFirstChild("MobileButtonAreaContainer")
    local container = area and area:FindFirstChild("PunchMainContainer")
    local target = container and container:FindFirstChild("button")
    if target and target:IsA("GuiButton") then return target end
    return nil
end

local boundButton
local extraConnection
local originalCallbacks = {}

local function unbindNative()
    generation = generation + 1
    if extraConnection then extraConnection:Disconnect() end
    extraConnection = nil
    boundButton = nil
    originalCallbacks = {}
end

local function snapshotCallbacks(target)
    if type(getconnections) ~= "function" then return nil, "Executor tidak mendukung getconnections" end
    local ok, entries = pcall(getconnections, target.Activated)
    if not ok or type(entries) ~= "table" then return nil, "Handler pukul tidak bisa dibaca" end
    local callbacks = {}
    for _, connection in pairs(entries) do
        local readable, callback = pcall(function()
            if connection.Enabled == false or connection.ForeignState == true then return nil end
            return connection.Function
        end)
        if readable and type(callback) == "function" and callback ~= onNativeTap then
            callbacks[#callbacks + 1] = callback
        end
    end
    if #callbacks == 0 then return nil, "Menunggu handler pukul asli" end
    return callbacks
end

onNativeTap = function(input, clickCount)
    if closed or not doubleHitEnabled or not input then return end
    if punchInputLock and punchInputLock:isLocked() then return end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    taps = taps + 1
    renderStats()
    local token, target, callbacks = generation, boundButton, originalCallbacks
    local function active()
        return not closed and doubleHitEnabled and generation == token
            and boundButton == target and player.Character == character and humanoid.Health > 0
    end
    local function invokeExtra()
        for _, callback in ipairs(callbacks) do
            if not active() then return end
            local ok, err = pcall(callback, input, clickCount == nil and 1 or clickCount)
            if not active() then return end
            if not ok then
                failed = failed + 1
                renderStats()
                status.Text = "Panggilan tambahan gagal: " .. tostring(err)
                return
            end
        end
        if not active() then return end
        completed = completed + 1
        renderStats()
        status.Text = "Extra dipanggil | Periksa animasi aksi dan hasil hit"
    end
    if extraDelay <= 0 then
        task.spawn(invokeExtra)
    else
        status.Text = string.format("Extra dijadwalkan setelah %.2fs", extraDelay)
        task.delay(extraDelay, invokeExtra)
    end
end

local function bindNative()
    if closed then return end
    local target = punchButton()
    if not target then
        if boundButton then unbindNative() end
        status.Text = "Menunggu tombol tinju mobile bawaan"
        return
    end
    local callbacks, err = snapshotCallbacks(target)
    if not callbacks then
        if boundButton then unbindNative() end
        status.Text = err
        return
    end
    if target == boundButton and extraConnection and extraConnection.Connected then
        local same = #callbacks == #originalCallbacks
        if same then
            for _, callback in ipairs(callbacks) do
                local found = false
                for _, original in ipairs(originalCallbacks) do
                    if callback == original then found = true; break end
                end
                if not found then same = false; break end
            end
        end
        if not same then
            generation = generation + 1
            originalCallbacks = callbacks
        end
        return
    end
    unbindNative()
    boundButton = target
    originalCallbacks = callbacks
    extraConnection = target.Activated:Connect(onNativeTap)
    status.Text = "Terhubung | Tap tombol tinju ASLI game"
end

local animationConnections = {}
local function clearAnimationConnections()
    for _, connection in ipairs(animationConnections) do connection:Disconnect() end
    animationConnections = {}
end

local function observeCharacter(character)
    clearAnimationConnections()
    local watched = setmetatable({}, {__mode = "k"})
    local function inspect(instance)
        if closed or not instance:IsA("Animator") or watched[instance] then return end
        watched[instance] = true
        animationConnections[#animationConnections + 1] = instance.AnimationPlayed:Connect(function(track)
            if closed or player.Character ~= character then return end
            local priority = track.Priority
            if priority ~= Enum.AnimationPriority.Action
                and priority ~= Enum.AnimationPriority.Action2
                and priority ~= Enum.AnimationPriority.Action3
                and priority ~= Enum.AnimationPriority.Action4 then return end
            local animation = track.Animation
            lastAnimationId = animation and animation.AnimationId:match("%d+") or "?"
            actionAnimations = actionAnimations + 1
            renderAnimations()
        end)
    end
    animationConnections[#animationConnections + 1] = character.DescendantAdded:Connect(inspect)
    for _, instance in ipairs(character:GetDescendants()) do inspect(instance) end
end


local function cleanup()
    if closed then return end
    closed = true
    settings.enabled = false
    predictor:reset(nil)
    doubleHitEnabled = false
    settings.counterEnabled = false
    counterEpoch = counterEpoch + 1
    punchInputLock:release()
    unbindNative()
    clearAnimationConnections()
    for _, connection in ipairs(connections) do connection:Disconnect() end
    gui:Destroy()
    if _G.StopBoxingDodge == cleanup then _G.StopBoxingDodge = nil end
    if _G.StopBoxingPunchTap == cleanup then _G.StopBoxingPunchTap = nil end
end


_G.StopBoxingDodge = cleanup
_G.StopBoxingPunchTap = cleanup
listen(tabDodge.Activated,function() activeTab="dodge"; refresh() end)
listen(tabPunch.Activated,function() activeTab="punch"; refresh() end)
listen(tabCounter.Activated,function() activeTab="counter"; refresh() end)
listen(counterToggle.Activated,function()
    settings.counterEnabled=not settings.counterEnabled
    counterEpoch=counterEpoch+1
    punchInputLock:release()
    lastCounter=-math.huge
    refresh()
    status.Text=settings.counterEnabled and "Counter ON | Menunggu dodge lawan terdekat" or "Counter OFF"
end)
listen(counterLockButton.Activated,function()
    settings.counterLockInput=not settings.counterLockInput
    counterEpoch=counterEpoch+1
    punchInputLock:release()
    refresh()
    status.Text=settings.counterLockInput and "Kunci tap ON selama counter menunggu" or "Kunci tap OFF"
end)
local counterDelays={0.20,0.25,0.30,0.35,0.40,0.50,0.60}
local counterDelayIndex=4
listen(counterTiming.Activated,function()
    counterDelayIndex=counterDelayIndex % #counterDelays + 1
    settings.counterDelay=counterDelays[counterDelayIndex]
    counterEpoch=counterEpoch+1
    punchInputLock:release()
    refresh()
    status.Text="Jeda counter diubah | Nilai uji, belum jendela server yang terukur"
end)
local counterRanges={3,4,5}
local counterRangeIndex=2
listen(counterRangeButton.Activated,function()
    counterRangeIndex=counterRangeIndex % #counterRanges + 1
    settings.counterRange=counterRanges[counterRangeIndex]
    counterEpoch=counterEpoch+1
    punchInputLock:release()
    refresh()
end)
listen(doubleToggle.Activated,function()
    doubleHitEnabled=not doubleHitEnabled
    generation=generation+1
    refresh()
    status.Text=doubleHitEnabled and "Double Hit ON | Gunakan tombol tinju asli" or "Double Hit OFF | Tinju asli tetap normal"
end)
local delayChoices={0,0.05,0.10,0.15,0.25,0.35,0.50,0.75}
local delayIndex=6
listen(extraTiming.Activated,function()
    delayIndex=delayIndex % #delayChoices + 1
    extraDelay=delayChoices[delayIndex]
    generation=generation+1
    refresh()
    status.Text=string.format("Jeda pukulan ekstra: %.2f detik",extraDelay)
end)
listen(reset.Activated,function()
    generation=generation+1
    taps,completed,failed,actionAnimations=0,0,0,0
    counts.seen,counts.match,counts.sent,counts.punch=0,0,0,0
    counts.predictions=0
    counts.counterSeen,counts.counterSent,counts.counterCancelled=0,0,0
    counterEpoch=counterEpoch+1
    punchInputLock:release()
    lastAnimationId="-"
    renderStats()
    renderAnimations()
    status.Text="Log direset | Coba satu tap tinju asli"
end)
listen(toggle.MouseButton1Click, function()
    settings.enabled = not settings.enabled
    predictor:reset(nil)
    lastPredictionTarget=nil
    refresh()
    status.Text = settings.enabled and "ON | Menunggu pukulan lawan" or "OFF | Auto dodge dijeda"
end)
listen(predictionButton.Activated,function()
    settings.prediction=not settings.prediction
    predictor:reset(nil)
    lastPredictionTarget=nil
    refresh()
    status.Text=settings.prediction and "Prediksi uji ON | Belajar 4 pukulan stabil dalam 5 stud" or "Prediksi OFF | Pemicu animasi"
end)
local leads={0.05,0.10,0.15,0.20}
local leadIndex=2
listen(leadButton.Activated,function()
    leadIndex=leadIndex % #leads + 1
    settings.predictionLead=leads[leadIndex]
    predictor=createRhythmPredictor(settings.predictionLead)
    lastPredictionTarget=nil
    refresh()
    status.Text="Awal prediksi berubah | Belajar ulang ritme lawan"
end)
listen(modeDodge.MouseButton1Click, function()
    settings.action = "dodge"
    refresh()
    status.Text = "Dodge biasa | Tanpa pukulan tambahan"
end)
listen(modeCombo.MouseButton1Click, function()
    settings.action = "combo"
    refresh()
    status.Text = "Dodge + Hit | Dua handler dari satu pemicu dodge"
end)
listen(directionButton.MouseButton1Click, function()
    if settings.directionMode == "alternate" then
        settings.directionMode = "fixed"
        settings.direction = "left"
    elseif settings.direction == "left" then
        settings.direction = "right"
    else
        settings.directionMode = "alternate"
        nextDirection = "right"
    end
    refresh()
end)

local cooldowns = {0.10, 0.50, 0.70}
local cooldownIndex = 1
listen(timing.MouseButton1Click, function()
    cooldownIndex = cooldownIndex % #cooldowns + 1
    settings.cooldown = cooldowns[cooldownIndex]
    refresh()
    status.Text = "Jeda lokal berubah; cooldown server tetap berlaku"
end)
listen(staminaButton.Activated,function()
    settings.staminaMode=settings.staminaMode=="save" and "free" or "save"
    staminaAllowsDodge()
    refresh()
    status.Text=settings.staminaMode=="save"
        and "Hemat: jeda di 20%, boleh lagi di 40%. Pilih angka stamina bila belum terbaca."
        or "Bebas: script tidak membatasi dodge berdasarkan stamina"
end)
listen(staminaSource.Activated,function()
    pickingStamina=true
    panel.Visible=false
    icon.Visible=true
    icon.Text="PILIH\nSTAMINA"
    status.Text="Sentuh ANGKA stamina di game (0-100, persen, atau nilai/maks.)"
end)
listen(UIS.InputBegan,function(input)
    if closed or not pickingStamina then return end
    if input.UserInputType ~= Enum.UserInputType.Touch
        and input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
    local ok, objects=pcall(function()
        return playerGui:GetGuiObjectsAtPosition(input.Position.X,input.Position.Y)
    end)
    if not ok then return end
    for _, object in ipairs(objects) do
        if object:IsDescendantOf(gui) then return end
    end
    local selected
    for _, object in ipairs(objects) do
        if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
            if parseStaminaPercent(object.Text) ~= nil then selected=object; break end
        end
    end
    pickingStamina=false
    panel.Visible=true
    icon.Visible=false
    if selected then
        local path={}
        local object=selected
        while object and object ~= playerGui do
            table.insert(path,1,object.Name)
            object=object.Parent
        end
        if object==playerGui then
            staminaTextPath=path
            _G.BoxingStaminaTextPath=path
            predictor:reset(nil)
            lastPredictionTarget=nil
            staminaAllowsDodge()
            status.Text="Angka stamina tertandai | " .. staminaStatus.Text
        end
    else
        status.Text="Angka stamina tidak terbaca di titik itu. Pilih lagi dan sentuh angkanya."
    end
    refresh()
end)
listen(minimize.MouseButton1Click, function() panel.Visible = false; icon.Visible = true end)
listen(icon.MouseButton1Click, function() icon.Visible = false; panel.Visible = true; layout() end)

local dragging, dragInput, dragStart, startPosition
listen(header.InputBegan, function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragInput, dragStart, startPosition = true, input, input.Position, panel.Position
    end
end)
listen(UIS.InputChanged, function(input)
    if not dragging then return end
    local touch = dragInput.UserInputType == Enum.UserInputType.Touch
    if (touch and input == dragInput) or (not touch and input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        panel.Position = UDim2.fromOffset(startPosition.X.Offset + delta.X, startPosition.Y.Offset + delta.Y)
        layout()
    end
end)
listen(UIS.InputEnded, function(input)
    if input == dragInput then dragging = false; dragInput = nil end
end)
listen(host:GetPropertyChangedSignal("AbsoluteSize"), layout)

local nativeScan = 0
local targetUpdate = 0
listen(RunService.Heartbeat, function(delta)
    if closed then return end
    if not punchInputLock:pulse(counterEpoch,os.clock()) then counterEpoch=counterEpoch+1 end
    staminaAllowsDodge()
    stepPrediction(os.clock())
    nativeScan = nativeScan + delta
    if nativeScan >= 0.5 then nativeScan = 0; bindNative() end
    targetUpdate = targetUpdate + delta
    if targetUpdate < 0.15 then return end
    targetUpdate = 0
    local target, gap = nearestOpponent()
    targetLabel.Text = target
        and string.format("Target: %s | %.1f stud", target.Name, gap)
        or "Target: tidak ada | Maks. 10 stud"
    updatePredictionLabel()
end)

listen(close.Activated, cleanup)
listen(player.CharacterAdded,function(character)
    lastDodge=-math.huge
    nextDirection="right"
    predictor:reset(nil)
    lastPredictionTarget=nil
    counterEpoch=counterEpoch+1
    punchInputLock:release()
    lastCounter=-math.huge
    unbindNative()
    observeCharacter(character)
end)
listen(Players.PlayerAdded,watchPlayer)
for _, opponent in ipairs(Players:GetPlayers()) do watchPlayer(opponent) end
if player.Character then observeCharacter(player.Character) end
refresh()
renderAnimations()
layout()
bindNative()
