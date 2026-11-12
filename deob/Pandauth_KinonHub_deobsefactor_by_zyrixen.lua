-- deobsefactor by zeyrixen
if type(_G.KinonHubBetaUnload) == "function" then pcall(_G.KinonHubBetaUnload) end

local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local LP          = LocalPlayer
local GUI_NAME    = "KinonHubBeta"
local HUB_NAME    = "Kinon Hub Beta"

local unloaded = false
local connections = {}
local function track(conn)
	table.insert(connections, conn)
	return conn
end

local function getRoot()
	local character = LP.Character
	return character and character:FindFirstChild("HumanoidRootPart")
end
local function getHumanoid()
	local character = LP.Character
	return character and character:FindFirstChildOfClass("Humanoid")
end

local Parry = {
	Enabled = false,
	Range = 14,
	FaceSensitivity = 10,
	AggressiveMode = false,
	Distance = 15,
	FaceBias = 10,
	CircleVisible = false,
	RangeColor = Color3.fromRGB(255, 255, 255),
}

local ParryV2 = {
	Enabled = false,
	Range = 14,
	FaceSensitivity = 10,
	AggressiveMode = false,
	CircleVisible = false,
	RangeColor = Color3.fromRGB(100, 200, 255),
}

local State = {
	Spear     = { Enabled = false, K = 0, Mode = 2 },
	Parry     = Parry,
	ParryV2   = ParryV2,
	ESPPlayer = { Enabled = false, Name = true, Box = true, Distance = false },
	ESPWorld  = { Enabled = false, Name = true, Distance = false },
}

local Hooks = {
	Spear     = function(s) end,
	ESPPlayer = function(s) end,
	ESPWorld  = function(s) end,
}

local ParryCards = {}

local function fire(name)
	local hook = Hooks[name]
	if not hook then return end
	local ok, err = pcall(hook, State[name])
	if not ok then warn("[" .. HUB_NAME .. "] Hook " .. name .. " error: " .. tostring(err)) end
end

State.PlayerESPObj = (function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local DEFAULT_CFG = {
		Enabled = false,
		ShowPlayer = false, ShowKiller = false,
		ShowName = false, ShowBox = false, ShowDist = false,
		ShowStatus = false, ShowItem = false,
		HLFill = true, HLOutline = false, KillerWarn = false, HookCounter = false,
		Tick = 0.3,
	}
	local DEFAULT_COLORS = {
		Player  = Color3.fromRGB(57, 255, 20),
		Killer  = Color3.fromRGB(255, 40, 40),
		Injured = Color3.fromRGB(255, 140, 0),
		Downed  = Color3.fromRGB(255, 40, 40),
		Hooked  = Color3.fromRGB(240, 240, 255),
		Carried = Color3.fromRGB(255, 220, 100),
	}

	local U = {}

	function U.Role()
		local t = LP.Team
		if not t then return "Unknown" end
		if t.Name == "Killer" then return "Killer" end
		if t.Name == "Survivors" then return "Survivor" end
		return "Spectator"
	end

	function U.Dist(pos)
		local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		return hrp and (pos - hrp.Position).Magnitude or math.huge
	end

	function U.Status(ch, palette)
		if not ch then return nil, nil, nil end
		local hum = ch:FindFirstChildOfClass("Humanoid")
		local frac = hum and math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1) or 1
		if ch:GetAttribute("IsHooked") == true then return "HOOKED", palette.Hooked, frac end
		if ch:GetAttribute("IsCarried") == true then return "CARRIED", palette.Carried, frac end
		if ch:GetAttribute("Knocked") == true then return "DOWN", palette.Downed, frac end
		if hum and hum.Health > 0 and hum.Health < hum.MaxHealth - 0.01 then
			return "INJURED", palette.Injured, frac
		end
		return "HEALTHY", palette.Player, frac
	end

	local iconCache, itemIndex, indexAt = {}, nil, 0
	local ICON_PROPS = { "Texture", "TextureId", "Image", "ImageId", "Icon", "Thumbnail", "ThumbnailImage" }

	local function toThumb(id)
		if id == nil then return nil end
		id = tostring(id)
		if id == "" then return nil end
		if string.find(id, "rbxthumb://", 1, true) then return id end
		local n = id:match("%d+")
		if n then return string.format("rbxthumb://type=Asset&id=%s&w=420&h=420", n) end
		return nil
	end

	local function readIcon(inst)
		for _, prop in ipairs(ICON_PROPS) do
			local ok, v = pcall(function() return inst[prop] end)
			if ok and type(v) == "string" then
				local r = toThumb(v)
				if r then return r end
			end
			local av = inst:GetAttribute(prop)
			if type(av) == "string" or type(av) == "number" then
				local r = toThumb(av)
				if r then return r end
			end
		end
		for _, d in ipairs(inst:GetDescendants()) do
			if d:IsA("ImageLabel") or d:IsA("ImageButton") then
				local r = toThumb(d.Image)
				if r then return r end
			elseif d:IsA("Decal") or d:IsA("Texture") then
				local r = toThumb(d.Texture)
				if r then return r end
			end
		end
		return nil
	end

	local function findItemInstance(name)
		local items = ReplicatedStorage:FindFirstChild("Items")
		local it = items and items:FindFirstChild(name)
		if it then return it end
		if not itemIndex or os.clock() - indexAt > 30 then
			itemIndex, indexAt = {}, os.clock()
			for _, d in ipairs(ReplicatedStorage:GetDescendants()) do
				if d:IsA("Tool") or d:IsA("Folder") or d:IsA("Model") or d:IsA("Configuration") or d:IsA("StringValue") then
					if not itemIndex[d.Name] then itemIndex[d.Name] = d end
				end
			end
		end
		return itemIndex[name]
	end

	function U.ItemIcon(itemName, plr)
		if not itemName or itemName == "" then return nil end
		local cached = iconCache[itemName]
		if cached then return cached end
		local icon
		local it = findItemInstance(itemName)
		if it then icon = readIcon(it) end
		if not icon and plr then
			local holders = { plr.Character, plr:FindFirstChildOfClass("Backpack") }
			for _, h in ipairs(holders) do
				local tool = h and h:FindFirstChild(itemName)
				if tool then
					icon = readIcon(tool)
					if icon then break end
				end
			end
		end
		if icon then iconCache[itemName] = icon end
		return icon
	end

	local function label(parent, name, size, font, order)
		local l = Instance.new("TextLabel")
		l.Name = name; l.BackgroundTransparency = 1
		l.AutomaticSize = Enum.AutomaticSize.X
		l.Size = UDim2.new(0, 0, 1, 0)
		l.Font = font; l.TextSize = size
		l.TextStrokeTransparency = 0.45
		l.TextStrokeColor3 = Color3.new(0, 0, 0)
		l.LayoutOrder = order; l.Parent = parent
		return l
	end

	local function hlist(parent, name, height, order, pad)
		local row = Instance.new("Frame")
		row.Name = name; row.BackgroundTransparency = 1
		row.Size = UDim2.new(1, 0, 0, height)
		row.LayoutOrder = order; row.Parent = parent
		local l = Instance.new("UIListLayout", row)
		l.FillDirection = Enum.FillDirection.Horizontal
		l.HorizontalAlignment = Enum.HorizontalAlignment.Center
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		l.SortOrder = Enum.SortOrder.LayoutOrder
		l.Padding = UDim.new(0, pad)
		return row
	end

	local GREY = Color3.fromRGB(120, 120, 132)
	local function rich(text, color)
		return string.format('<font color="rgb(%d,%d,%d)">%s</font>',
			math.floor(color.R * 255 + 0.5),
			math.floor(color.G * 255 + 0.5),
			math.floor(color.B * 255 + 0.5), text)
	end

	local function HookColor(c)
		if c <= 0 then return Color3.fromRGB(150, 150, 160)
		elseif c == 1 then return Color3.fromRGB(240, 240, 250)
		elseif c == 2 then return Color3.fromRGB(255, 150, 40) end
		return Color3.fromRGB(255, 60, 60)
	end

	function U.Card(ch, tag, o)
		local bb = ch:FindFirstChild(tag)
		if bb and not (bb:IsA("BillboardGui") and bb:FindFirstChild("Box") and bb.Box:FindFirstChild("InfoRow")) then
			bb:Destroy(); bb = nil
		end
		if not bb then
			bb = Instance.new("BillboardGui")
			bb.Name = tag; bb.AlwaysOnTop = true
			bb.LightInfluence = 0; bb.ResetOnSpawn = false
			bb.Size = UDim2.fromOffset(200, 34)
			bb.StudsOffset = Vector3.new(0, o.offsetY or 3.6, 0)
			bb.Parent = ch

			local box = Instance.new("Frame", bb)
			box.Name = "Box"; box.BackgroundTransparency = 1
			box.Size = UDim2.fromScale(1, 1)
			local list = Instance.new("UIListLayout", box)
			list.FillDirection = Enum.FillDirection.Vertical
			list.HorizontalAlignment = Enum.HorizontalAlignment.Center
			list.VerticalAlignment = Enum.VerticalAlignment.Center
			list.SortOrder = Enum.SortOrder.LayoutOrder
			list.Padding = UDim.new(0, 1)

			local nameRow = hlist(box, "NameRow", 16, 1, 4)
			local icn = Instance.new("ImageLabel", nameRow)
			icn.Name = "Icon"; icn.BackgroundTransparency = 1
			icn.Size = UDim2.fromOffset(14, 14)
			icn.LayoutOrder = 1; icn.Visible = false
			label(nameRow, "NameText", 13, Enum.Font.GothamBold, 2)

			local infoRow = hlist(box, "InfoRow", 14, 2, 0)
			local info = label(infoRow, "InfoText", 11, Enum.Font.GothamBold, 1)
			info.RichText = true
			info.TextColor3 = Color3.new(1, 1, 1)
		end

		bb.Adornee = o.adornee
		local nameRow, infoRow = bb.Box.NameRow, bb.Box.InfoRow

		local hasName = o.name and o.name ~= ""
		local hasIcon = o.icon and o.icon ~= ""
		nameRow.Visible = hasName or hasIcon
		local nt = nameRow.NameText
		nt.Visible = hasName; nt.Text = hasName and o.name or ""
		nt.TextColor3 = o.nameColor or Color3.new(1, 1, 1)
		local ico = nameRow.Icon
		ico.Visible = hasIcon; if hasIcon then ico.Image = o.icon end

		local parts = {}
		if o.status then table.insert(parts, rich(o.status, o.statusColor or Color3.new(1, 1, 1))) end
		if o.hook ~= nil then table.insert(parts, rich("Hook " .. o.hook, HookColor(o.hook))) end
		if o.dist then table.insert(parts, rich(o.dist .. "s", Color3.fromRGB(200, 200, 210))) end
		infoRow.Visible = #parts > 0
		infoRow.InfoText.Text = table.concat(parts, " " .. rich("|", GREY) .. " ")

		local h = 0
		if nameRow.Visible then h = h + 16 + 1 end
		if infoRow.Visible then h = h + 14 end
		bb.Size = UDim2.fromOffset(200, math.max(h, 4))
	end

	local Class = {}
	Class.__index = Class

	function Class.new()
		local self = setmetatable({}, Class)
		self.Settings = table.clone(DEFAULT_CFG)
		self.Palette = table.clone(DEFAULT_COLORS)
		self._loop = nil
		self.Hooks = setmetatable({}, { __mode = "k" })

		for _, p in ipairs(Players:GetPlayers()) do self:_bindPlayer(p) end
		track(Players.PlayerAdded:Connect(function(p) self:_bindPlayer(p) end))
		track(Players.PlayerRemoving:Connect(function(p)
			self:_cleanup(p.Character); self.Hooks[p] = nil
		end))
		return self
	end

	function Class:_watchHooks(plr, ch)
		local last = ch:GetAttribute("IsHooked") == true
		if last and (self.Hooks[plr] or 0) == 0 then self.Hooks[plr] = 1 end
		local lastAt = 0
		track(ch:GetAttributeChangedSignal("IsHooked"):Connect(function()
			local now = ch:GetAttribute("IsHooked") == true
			if now and not last and os.clock() - lastAt > 1 then
				lastAt = os.clock()
				self.Hooks[plr] = (self.Hooks[plr] or 0) + 1
				if self.Settings.Enabled then pcall(function() self:_tick() end) end
			end
			last = now
		end))
	end

	function Class:_hookCount(plr)
		local ch = plr.Character
		local v = (ch and ch:GetAttribute("HookCount")) or plr:GetAttribute("HookCount")
		if type(v) == "number" then return math.max(0, math.floor(v)) end
		return self.Hooks[plr] or 0
	end

	function Class:_bindPlayer(plr)
		if plr.Character then self:_watchHooks(plr, plr.Character) end
		track(plr.CharacterAdded:Connect(function(ch)
			self.Hooks[plr] = nil
			self:_watchHooks(plr, ch)
			task.wait(0.2)
			self:_cleanup(ch)
			if self.Settings.Enabled then pcall(function() self:_tick() end) end
		end))
		track(plr:GetPropertyChangedSignal("Team"):Connect(function()
			if self.Settings.Enabled then pcall(function() self:_tick() end) end
		end))
	end

	function Class:_cleanup(ch)
		if not ch then return end
		for _, n in ipairs({ "PEH", "KEH", "PE_Text", "KE_Text", "PE_Hook", "KillerWarn" }) do
			local o = ch:FindFirstChild(n)
			if o then o:Destroy() end
		end
	end

	function Class:_clearWarn()
		local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		local old = hrp and hrp:FindFirstChild("KillerWarn")
		if old then old:Destroy() end
	end

	function Class:_killerWarn()
		local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		if not hrp or U.Role() ~= "Survivor" or not self.Settings.KillerWarn then
			self:_clearWarn(); return
		end
		local nearest = math.huge
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and p.Team and p.Team.Name == "Killer" and p.Character then
				local h = p.Character:FindFirstChild("HumanoidRootPart")
				if h then
					local d = (h.Position - hrp.Position).Magnitude
					if d < nearest then nearest = d end
				end
			end
		end
		if nearest <= 80 then
			local bb = hrp:FindFirstChild("KillerWarn")
			if not bb then
				bb = Instance.new("BillboardGui")
				bb.Name = "KillerWarn"; bb.Size = UDim2.new(0, 30, 0, 30)
				bb.AlwaysOnTop = true; bb.StudsOffset = Vector3.new(0, 4, 0)
				bb.Parent = hrp
				local lbl = Instance.new("TextLabel", bb)
				lbl.Name = "WarnText"; lbl.Size = UDim2.new(1, 0, 1, 0)
				lbl.BackgroundTransparency = 1; lbl.TextScaled = true
				lbl.TextStrokeTransparency = 0
				lbl.Font = Enum.Font.GothamBlack
			end
			local w = bb:FindFirstChild("WarnText")
			if w then
				if nearest <= 40 then w.Text = "!!"; w.TextColor3 = Color3.fromRGB(255, 0, 0)
				else w.Text = "!"; w.TextColor3 = Color3.fromRGB(255, 255, 0) end
			end
		else
			self:_clearWarn()
		end
	end

	function Class:_tick()
		if not self.Settings.Enabled then return end
		self:_killerWarn()
		local S, P = self.Settings, self.Palette

		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP and plr.Character then
				local ch = plr.Character
				local killer = plr.Team and plr.Team.Name == "Killer"

				local clearNames = killer and { "PEH", "PE_Text", "PE_Hook" } or { "KEH", "KE_Text" }
				for _, n in ipairs(clearNames) do
					local o = ch:FindFirstChild(n); if o then o:Destroy() end
				end

				local want = killer and S.ShowKiller or (not killer and S.ShowPlayer)
				local tag = killer and "KE_Text" or "PE_Text"
				local hlName = killer and "KEH" or "PEH"
				local color = killer and P.Killer or P.Player

				local stText, stColor
				if not killer then
					stText, stColor = U.Status(ch, P)
					if stColor then color = stColor end
					if not S.ShowStatus then stText = nil end
				end

				if want then
					local hrp = ch:FindFirstChild("HumanoidRootPart")
					local dist = hrp and math.floor(U.Dist(hrp.Position)) or nil

					if S.HLFill or S.HLOutline then
						local hl = ch:FindFirstChild(hlName)
						if not hl then
							hl = Instance.new("Highlight")
							hl.Name = hlName; hl.Parent = ch
						end
						hl.FillColor = color; hl.OutlineColor = color
						hl.FillTransparency = S.HLFill and 0.5 or 1
						hl.OutlineTransparency = S.HLOutline and 0 or 1
					else
						local hl = ch:FindFirstChild(hlName)
						if hl then hl:Destroy() end
					end

					local name, icon
					if S.ShowName then
						name = plr.Name
						if killer then
							local sel = plr:GetAttribute("SelectedKiller")
							if not sel then
								local sv = plr:FindFirstChild("SelectedKiller")
								if sv then pcall(function() sel = sv.Value end) end
							end
							if sel and tostring(sel) ~= "" then name = tostring(sel) end
						end
					end
					if not killer and S.ShowItem then
						local eq = plr:GetAttribute("EquippedItem")
						if not eq or eq == "" then
							local tool = ch:FindFirstChildOfClass("Tool")
							eq = tool and tool.Name or nil
						end
						if eq and eq ~= "" then
							icon = U.ItemIcon(eq, plr)
							if not icon then
								name = name and (name .. " | " .. tostring(eq)) or tostring(eq)
							end
						end
					end

					local hooks = (not killer and S.HookCounter) and self:_hookCount(plr) or nil

					if not hrp or (not name and not stText and hooks == nil and not icon and not S.ShowDist) then
						local e = ch:FindFirstChild(tag); if e then e:Destroy() end
					else
						U.Card(ch, tag, {
							adornee = hrp, name = name,
							nameColor = killer and P.Killer or Color3.fromRGB(240, 240, 248),
							status = stText, statusColor = stColor, hook = hooks,
							dist = S.ShowDist and dist or nil, icon = icon,
						})
					end
					local oldHook = ch:FindFirstChild("PE_Hook")
					if oldHook then oldHook:Destroy() end
				else
					local h = ch:FindFirstChild(hlName); if h then h:Destroy() end
					local t = ch:FindFirstChild(tag); if t then t:Destroy() end
					local hk = ch:FindFirstChild("PE_Hook"); if hk then hk:Destroy() end
				end
			end
		end
	end

	function Class:Start()
		self.Settings.Enabled = true
		self:_tick()
		if self._loop then return end
		self._loop = task.spawn(function()
			while self.Settings.Enabled and not unloaded do
				task.wait(self.Settings.Tick)
				pcall(function() self:_tick() end)
			end
			self._loop = nil
		end)
	end

	function Class:Stop()
		self.Settings.Enabled = false
		for _, p in ipairs(Players:GetPlayers()) do self:_cleanup(p.Character) end
		self:_clearWarn()
	end

	function Class:Refresh()
		if self.Settings.Enabled then pcall(function() self:_tick() end) end
	end

	function Class:SetColor(key, color)
		if self.Palette[key] ~= nil then
			self.Palette[key] = color; self:Refresh()
		end
	end

	return Class.new()
end)()

State.ESPPlayer = State.PlayerESPObj.Settings
Hooks.ESPPlayer = function(s)
	local esp = State.PlayerESPObj
	if s.Enabled then esp:Start() else esp:Stop() end
end

State.WorldESPObj = (function()
	local CollectionService = game:GetService("CollectionService")
	local DEFAULT_CFG = {
		Enabled = false,
		Generator = false, Pallet = false, Window = false,
		Hook = false, Gate = false, SCP = false, Pumpkin = false,
		BearTrap = false, BearTrapDistance = false, BearTrapNoText = false,
		GeneratorName = false,
		HLFill = true, HLOutline = false,
		SCPOnlySlow = false,
		ScanInterval = 40,
		TickInterval = 1.8,
	}
	local DEFAULT_COLORS = {
		Generator = Color3.fromRGB(255, 255, 0),
		GeneratorDone = Color3.fromRGB(0, 255, 0),
		Pallet = Color3.fromRGB(255, 128, 0),
		Window = Color3.fromRGB(0, 200, 255),
		Hook = Color3.fromRGB(255, 105, 180),
		Gate = Color3.fromRGB(0, 255, 255),
		SCP = Color3.fromRGB(255, 0, 255),
		Pumpkin = Color3.fromRGB(255, 140, 0),
		BearTrap = Color3.fromRGB(255, 255, 255),
	}

	local function trapPart(obj)
		if not obj then return nil end
		if obj:IsA("BasePart") then return obj end
		if obj:IsA("Model") and obj.PrimaryPart then return obj.PrimaryPart end
		return obj:FindFirstChildWhichIsA("BasePart", true)
	end

	local function billboard(parent, name, opts)
		if not parent then return end
		local bb = parent:FindFirstChild(name)

		local parts = {}
		if opts.name and opts.name ~= "" then table.insert(parts, opts.name) end
		if opts.sub and opts.sub ~= "" then table.insert(parts, opts.sub) end
		local text = table.concat(parts, " \194\183 ")

		if not bb then
			bb = Instance.new("BillboardGui")
			bb.Name = name
			bb.AlwaysOnTop = true
			bb.Size = UDim2.new(0, 120, 0, 20)
			bb.StudsOffset = Vector3.new(0, opts.offsetY or 4.5, 0)
			bb.Parent = parent

			local lbl = Instance.new("TextLabel", bb)
			lbl.Name = "Text"
			lbl.Size = UDim2.new(1, 0, 1, 0)
			lbl.BackgroundTransparency = 1
			lbl.AutomaticSize = Enum.AutomaticSize.XY
			lbl.Font = Enum.Font.GothamBold
			lbl.TextSize = 12
			lbl.TextWrapped = false
			lbl.TextStrokeTransparency = 0
			lbl.TextStrokeColor3 = Color3.new(0, 0, 0)
		end

		local txt = bb:FindFirstChild("Text")
		if txt then
			txt.Text = text
			txt.TextColor3 = opts.color or Color3.new(1, 1, 1)
		end
	end

	local Class = {}
	Class.__index = Class

	function Class.new()
		local self = setmetatable({}, Class)
		self.Settings = table.clone(DEFAULT_CFG)
		self.Palette = table.clone(DEFAULT_COLORS)
		self.Cache = {
			Generators = {}, Pallets = {}, Windows = {},
			Hooks = {}, Gates = {}, SCPs = {}, Pumpkins = {}, BearTraps = {},
		}
		self._lastScan = 0
		self._tickThread = nil

		track(workspace.ChildAdded:Connect(function(ch)
			if ch.Name == "Map" then
				task.wait(1.5)
				self:_scan(true)
				if self.Settings.Enabled then self:Refresh() end
			end
		end))
		track(LP.CharacterAdded:Connect(function()
			task.wait(1.5)
			self:_scan(true)
			if self.Settings.Enabled then self:Refresh() end
		end))
		return self
	end

	function Class:_scan(force)
		local now = tick()
		if not force and (now - self._lastScan) < self.Settings.ScanInterval then return end
		self._lastScan = now

		for k in pairs(self.Cache) do self.Cache[k] = {} end

		local map = workspace:FindFirstChild("Map") or workspace
		local desc = map:GetDescendants()
		local trapSet = {}

		for i, d in ipairs(desc) do
			if i % 200 == 0 then task.wait() end

			if (d.Name == "BearTrap" or CollectionService:HasTag(d, "BearTrap")) and not trapSet[d.Parent] then
				trapSet[d] = true
				table.insert(self.Cache.BearTraps, d)
			end

			if d:IsA("Model") then
				local lower = string.lower(d.Name)
				if lower == "generator" then
					local part = d:FindFirstChildWhichIsA("BasePart")
					if part then table.insert(self.Cache.Generators, { model = d, part = part }) end
				elseif lower == "hook" and d:FindFirstChild("HookPoint") then
					table.insert(self.Cache.Hooks, d)
				elseif lower == "gate" and d:FindFirstChild("ExitLever") then
					table.insert(self.Cache.Gates, d)
				elseif lower == "window" then
					table.insert(self.Cache.Windows, d)
				elseif string.match(lower, "^scp") then
					table.insert(self.Cache.SCPs, d)
				elseif lower:find("pumpkin", 1, true) or (d.Parent and d.Parent.Name == "Pumpkins") then
					table.insert(self.Cache.Pumpkins, d)
				end
			elseif d:IsA("BasePart") and d.Name == "PrimaryPartPallet" then
				local par = d.Parent
				if par and not table.find(self.Cache.Pallets, par) then
					table.insert(self.Cache.Pallets, par)
				end
			elseif d:IsA("BasePart") and (string.lower(d.Name):find("pumpkin", 1, true) or (d.Parent and d.Parent.Name == "Pumpkins")) then
				table.insert(self.Cache.Pumpkins, d)
			end
		end

		local seenPallet = {}
		for _, pl in ipairs(self.Cache.Pallets) do seenPallet[pl] = true end
		local all = workspace:GetDescendants()
		for i, d in ipairs(all) do
			if i % 400 == 0 then task.wait() end
			if (d.Name == "Pallet" or d.Name == "Palletwrong") and (d:IsA("Model") or d:IsA("BasePart"))
				and not seenPallet[d] and not seenPallet[d.Parent] then
				seenPallet[d] = true
				table.insert(self.Cache.Pallets, d)
			end
		end
	end

	function Class:_clearOne(cat)
		local names
		if cat == "Generators" then names = { "GEH", "GE_Text" }
		elseif cat == "Pallets" then names = { "PalletEH" }
		elseif cat == "Windows" then names = { "WindowEH" }
		elseif cat == "Hooks" then names = { "HookEH" }
		elseif cat == "Gates" then names = { "GateEH" }
		elseif cat == "SCPs" then names = { "SCPEH" }
		elseif cat == "Pumpkins" then names = { "PumpkinEH", "Pumpkin_Text" }
		elseif cat == "BearTraps" then names = { "BearTrapEH" }
		end
		if not names then return end

		for _, obj in ipairs(self.Cache[cat] or {}) do
			local target = obj
			if cat == "Generators" then target = obj.model end
			if target and target.Parent then
				for _, n in ipairs(names) do
					local o = target:FindFirstChild(n)
					if o then o:Destroy() end
				end
				if cat == "BearTraps" then
					local p = trapPart(target)
					local t = p and p:FindFirstChild("BearTrap_Text")
					if t then t:Destroy() end
				end
			end
		end
	end

	function Class:Clear()
		for _, cat in ipairs({ "Generators", "Pallets", "Windows", "Hooks", "Gates", "SCPs", "Pumpkins", "BearTraps" }) do
			self:_clearOne(cat)
		end
	end

	function Class:_highlightAll(cat, setting, hlName, color, adornee)
		if not self.Settings[setting] then
			self:_clearOne(cat)
			return
		end
		local S = self.Settings
		for _, obj in ipairs(self.Cache[cat]) do
			if obj and obj.Parent then
				local hl = obj:FindFirstChild(hlName)
				if not hl then
					hl = Instance.new("Highlight")
					hl.Name = hlName
					hl.Parent = obj
				end
				if adornee then hl.Adornee = obj end
				hl.FillColor = color
				hl.OutlineColor = color
				hl.FillTransparency = S.HLFill and 0.5 or 1
				hl.OutlineTransparency = S.HLOutline and 0 or 1
			end
		end
	end

	function Class:_updateGenerators()
		if not self.Settings.Generator then
			self:_clearOne("Generators")
			return
		end
		local S, P = self.Settings, self.Palette

		for _, gen in ipairs(self.Cache.Generators) do
			local model = gen.model
			if model and model.Parent then
				local prog = math.floor(model:GetAttribute("RepairProgress") or 0)
				local done = prog >= 100
				local col = P.Generator

				if done then
					local oldHl = model:FindFirstChild("GEH")
					if oldHl then oldHl:Destroy() end
					local oldTxt = model:FindFirstChild("GE_Text")
					if oldTxt then oldTxt:Destroy() end
				else

				local hl = model:FindFirstChild("GEH")
				if not hl then
					hl = Instance.new("Highlight")
					hl.Name = "GEH"
					hl.Parent = model
				end
				hl.FillColor = col
				hl.OutlineColor = col
				hl.FillTransparency = S.HLFill and 0.5 or 1
				hl.OutlineTransparency = S.HLOutline and 0 or 1

				if S.GeneratorName then
					billboard(model, "GE_Text", {
						name = "GEN",
						sub = string.format("%d%%", prog),
						color = col, offsetY = 4.5,
					})
				else
					local e = model:FindFirstChild("GE_Text")
					if e then e:Destroy() end
				end
				end
			end
		end
	end

	function Class:_updateWindows()
		if not self.Settings.Window then
			self:_clearOne("Windows")
			return
		end
		local S, P = self.Settings, self.Palette

		for _, win in ipairs(self.Cache.Windows) do
			if win and win.Parent then
				local base = win:FindFirstChild("Bottom") or win:FindFirstChildWhichIsA("BasePart")
				if base then
					local ad = win:FindFirstChild("WindowEH")
					if not ad then
						ad = Instance.new("BoxHandleAdornment")
						ad.Name = "WindowEH"
						ad.Parent = win
						ad.AlwaysOnTop = true
						ad.ZIndex = 5
					end
					ad.Adornee = base
					ad.Size = base.Size
					ad.Color3 = P.Window
					ad.Transparency = S.HLFill and 0.4 or (S.HLOutline and 0.75 or 1)
				end
			end
		end
	end

	function Class:_updateSCPs()
		if not self.Settings.SCP then
			self:_clearOne("SCPs")
			return
		end
		local S, P = self.Settings, self.Palette

		for _, scp in ipairs(self.Cache.SCPs) do
			if scp and scp.Parent then
				local hum = scp:FindFirstChildOfClass("Humanoid")
				local body = scp:FindFirstChild("HumanoidRootPart") or scp:FindFirstChild("Torso") or scp.PrimaryPart
				local valid = hum and body and hum.Health > 0
				if valid and S.SCPOnlySlow then
					valid = math.floor(hum.WalkSpeed) == 9
				end

				if valid then
					local hl = scp:FindFirstChild("SCPEH")
					if not hl then
						hl = Instance.new("Highlight")
						hl.Name = "SCPEH"
						hl.Parent = scp
					end
					hl.FillColor = P.SCP
					hl.OutlineColor = P.SCP
					hl.FillTransparency = S.HLFill and 0.5 or 1
					hl.OutlineTransparency = S.HLOutline and 0 or 1
				else
					local e = scp:FindFirstChild("SCPEH")
					if e then e:Destroy() end
				end
			end
		end
	end

	function Class:_updatePumpkins()
		if not self.Settings.Pumpkin then
			self:_clearOne("Pumpkins")
			return
		end
		local color = self.Palette.Pumpkin
		for _, pumpkin in ipairs(self.Cache.Pumpkins) do
			if pumpkin and pumpkin.Parent then
				local hl = pumpkin:FindFirstChild("PumpkinEH")
				if not hl then
					hl = Instance.new("Highlight")
					hl.Name = "PumpkinEH"
					hl.Adornee = pumpkin
					hl.Parent = pumpkin
				end
				hl.FillColor = color
				hl.OutlineColor = color
				hl.FillTransparency = self.Settings.HLFill and 0.45 or 1
				hl.OutlineTransparency = self.Settings.HLOutline and 0 or 1
				local oldText = pumpkin:FindFirstChild("Pumpkin_Text")
				if oldText then oldText:Destroy() end
			end
		end
	end

	function Class:_updateBearTraps()
		local S, P = self.Settings, self.Palette
		if not S.BearTrap then
			self:_clearOne("BearTraps")
			return
		end
		local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
		for _, obj in ipairs(self.Cache.BearTraps) do
			if obj and obj.Parent then
				local part = trapPart(obj)
				local hl = obj:FindFirstChild("BearTrapEH")
				if S.HLFill or S.HLOutline then
					if not hl then
						hl = Instance.new("Highlight")
						hl.Name = "BearTrapEH"
						hl.Parent = obj
					end
					hl.FillColor = P.BearTrap
					hl.OutlineColor = P.BearTrap
					hl.FillTransparency = S.HLFill and 0.5 or 1
					hl.OutlineTransparency = S.HLOutline and 0 or 1
				elseif hl then
					hl:Destroy()
				end

				if part then
					local base = S.BearTrapNoText and "" or "Bear Trap"
					local text = base
					if S.BearTrapDistance then
						local d = hrp and math.floor((part.Position - hrp.Position).Magnitude) or 0
						text = (base == "") and string.format("[%dm]", d) or string.format("Bear Trap [%dm]", d)
					end
					if text == "" then
						local old = part:FindFirstChild("BearTrap_Text")
						if old then old:Destroy() end
					else
						billboard(part, "BearTrap_Text", { name = text, color = P.BearTrap, offsetY = 2.5 })
					end
				end
			end
		end
	end

	function Class:Refresh()
		if not self.Settings.Enabled then return end

		if #self.Cache.Generators == 0 or (tick() - self._lastScan) > self.Settings.ScanInterval then
			self:_scan()
		end

		local P = self.Palette
		self:_updateGenerators()
		self:_highlightAll("Pallets", "Pallet", "PalletEH", P.Pallet, true)
		self:_updateWindows()
		self:_highlightAll("Hooks", "Hook", "HookEH", P.Hook, false)
		self:_highlightAll("Gates", "Gate", "GateEH", P.Gate, true)
		self:_updateSCPs()
		self:_updatePumpkins()
		self:_updateBearTraps()
	end

	function Class:Start()
		self.Settings.Enabled = true
		self:_scan(true)
		self:Refresh()

		if self._tickThread then return end
		self._tickThread = task.spawn(function()
			while self.Settings.Enabled and not unloaded do
				task.wait(self.Settings.TickInterval)
				pcall(function() self:Refresh() end)
			end
			self._tickThread = nil
		end)
	end

	function Class:Stop()
		self.Settings.Enabled = false
		self:Clear()
	end

	function Class:Rescan()
		self:_scan(true)
		if self.Settings.Enabled then self:Refresh() end
	end

	function Class:SetColor(key, color)
		if self.Palette[key] ~= nil then
			self.Palette[key] = color
			self:Refresh()
		end
	end

	return Class.new()
end)()

State.ESPWorld = State.WorldESPObj.Settings
Hooks.ESPWorld = function(s)
	local esp = State.WorldESPObj
	if s.Enabled then
		task.spawn(function() esp:Start() end)
	else
		esp:Stop()
	end
end

State.SpearObj = (function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local G = (getgenv and getgenv()) or _G

	for _, key in ipairs({ "KinonSpearState", "KinonSpearState2", "KinonSpearState3" }) do
		if G[key] then G[key].Enabled = false end
	end

	local V = G.KinonSilentSpearV4
	if V and V.Destroy then pcall(V.Destroy) end
	V = V or { Installed = {} }
	V.Installed = V.Installed or {}
	G.KinonSilentSpearV4 = V

	V.Enabled, V.UseDeep = false, false
	V.FOV, V.MaxRange, V.FovAim = 240, 500, true
	V.SpearSpeed, V.Drop, V.Predict = 180, 0.5, true
	V.Dead = false
	V.CurPart, V.CurPoint, V.CurOrigin = nil, nil, nil
	V.TargetChar = nil

	local wrap = newcclosure or function(f) return f end

	local BAL = {
		SpawnOffset    = 3,
		MinChargeTime  = 0.3,
		FullChargeTime = 1,
		YVelClamp      = 14,
		VelMagCap      = 32,
	}

	local function getGravity()
		local g = math.max(0, tonumber(workspace.Gravity) or 196.2)
		return Vector3.new(0, -g * math.clamp(tonumber(V.Drop) or 0.5, 0, 1), 0)
	end

	local function getPingHalf()
		local ok, ping = pcall(function() return LP:GetNetworkPing() end)
		if ok and type(ping) == "number" and ping > 0 then
			return math.clamp(ping * 0.5, 0, 0.25)
		end
		return 0.035
	end

	local function getLatencyLead()
		local ok, ping = pcall(function() return LP:GetNetworkPing() end)
		local oneWay = (ok and type(ping) == "number" and ping > 0) and math.clamp(ping, 0.01, 0.2) or 0.05
		return math.clamp(oneWay * 1.5 + 0.04, 0.06, 0.32)
	end

	local velCache = setmetatable({}, { __mode = "k" })

	local function getSmoothedVelocity(char, hrp)
		local now = tick()
		local c = velCache[char]
		local raw
		if c and c.lastPos and now - c.time > 0.03 and now - c.time < 0.5 then
			raw = (hrp.Position - c.lastPos) / (now - c.time)
			local live = hrp.AssemblyLinearVelocity or Vector3.zero
			if raw.Magnitude > 60 then raw = live end
			local smoothed = c.velocity:Lerp(raw, 0.5)
			if smoothed.Magnitude > BAL.VelMagCap then
				smoothed = smoothed.Unit * BAL.VelMagCap
			end
			velCache[char] = { velocity = smoothed, time = now, lastPos = hrp.Position }
			return smoothed
		end
		raw = hrp.AssemblyLinearVelocity or Vector3.zero
		if raw.Magnitude > BAL.VelMagCap then raw = raw.Unit * BAL.VelMagCap end
		velCache[char] = { velocity = raw, time = now, lastPos = hrp.Position }
		return raw
	end

	local function clampVelY(v)
		return Vector3.new(v.X, math.clamp(v.Y, -BAL.YVelClamp, BAL.YVelClamp), v.Z)
	end

	local function isKillerTeam(char)
		local plr = Players:GetPlayerFromCharacter(char)
		if plr and plr.Team and plr.Team.Name == "Killer" then return true end
		if char:GetAttribute("Role") == "Killer" then return true end
		if char:GetAttribute("IsKiller") == true then return true end
		return false
	end

	local function candidates()
		local list = {}
		local camera = workspace.CurrentCamera
		if not camera then return list end
		local center = camera.ViewportSize / 2
		local myChar = LP.Character
		local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
		if not myHRP then return list end

		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP and plr.Character and plr.Character ~= myChar then
				local char = plr.Character
				if not isKillerTeam(char) then
					local hum = char:FindFirstChildOfClass("Humanoid")
					local hrp = char:FindFirstChild("HumanoidRootPart")
					if hum and hum.Health > 0 and hrp
					   and not char:GetAttribute("Immobile")
					   and not char:GetAttribute("IsHooked")
					   and not char:GetAttribute("Knocked") then
						local dist = (hrp.Position - myHRP.Position).Magnitude
						if dist <= V.MaxRange then
							local s, onScreen = camera:WorldToViewportPoint(hrp.Position)
							if onScreen and s.Z > 0 then
								local px = (Vector2.new(s.X, s.Y) - center).Magnitude
								if (not V.FovAim) or px <= V.FOV then
									table.insert(list, {
										char = char, hrp = hrp, hum = hum,
										px = px, dist = dist,
										health = hum.Health,
									})
								end
							end
						end
					end
				end
			end
		end
		return list
	end

	local function pick(list)
		if #list == 0 then return nil end
		table.sort(list, function(a, b) return a.px < b.px end)
		local cur = V.TargetChar
		if cur then
			for _, c in ipairs(list) do
				if c.char == cur then
					if c.px <= list[1].px + 18 then return c end
					break
				end
			end
		end
		return list[1]
	end

	local tracker = { char = nil, samples = {} }

	local function trackTarget(char, hrp)
		local now = os.clock()
		if tracker.char ~= char then tracker.char, tracker.samples = char, {} end
		local smp = tracker.samples
		smp[#smp + 1] = { t = now, p = hrp.Position }
		while #smp > 2 and now - smp[1].t > 0.9 do table.remove(smp, 1) end
	end

	local function windowVelocity(smp, window)
		local last = smp[#smp]
		local first = smp[1]
		for i = #smp, 1, -1 do
			if last.t - smp[i].t >= window then first = smp[i]; break end
		end
		local dt = last.t - first.t
		if dt < 0.03 then return nil end
		return (last.p - first.p) / dt
	end

	local INTERACT_ATTR = { "repair", "generator", "heal", "unhook", "rescu", "gate", "interact", "opening", "working" }
	local INTERACT_ANIM = { "repair", "generator", "heal", "unhook", "rescue", "gate" }

	local function isInteracting(char)
		local okA, attrs = pcall(function() return char:GetAttributes() end)
		if okA and type(attrs) == "table" then
			for name, value in pairs(attrs) do
				if value == true then
					local n = string.lower(tostring(name))
					if not (n:find("^can") or n:find("^has") or n:find("^allow")) then
						for _, key in ipairs(INTERACT_ATTR) do
							if n:find(key, 1, true) then return true end
						end
					end
				end
			end
		end
		local hum = char:FindFirstChildOfClass("Humanoid")
		local animator = hum and hum:FindFirstChildOfClass("Animator")
		if animator then
			local okT, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
			if okT and tracks then
				for _, tr in ipairs(tracks) do
					local label = ""
					pcall(function()
						label = string.lower(tostring(tr.Name) .. " " .. tostring(tr.Animation and tr.Animation.Name or ""))
					end)
					if label ~= "" then
						for _, key in ipairs(INTERACT_ANIM) do
							if label:find(key, 1, true) then return true end
						end
					end
				end
			end
		end
		return false
	end

	local function stationaryByHistory(char)
		local smp = tracker.samples
		if tracker.char ~= char or #smp < 6 then return false end
		local last = smp[#smp]
		local first
		for i = #smp, 1, -1 do
			if last.t - smp[i].t >= 0.5 then first = smp[i]; break end
		end
		if not first then return false end
		local d = last.p - first.p
		return Vector3.new(d.X, 0, d.Z).Magnitude < 0.9
	end

	local function estimateVelocity(char, hrp)
		if isInteracting(char) or stationaryByHistory(char) then return Vector3.zero end

		local hum = char:FindFirstChildOfClass("Humanoid")
		local live = hrp.AssemblyLinearVelocity or Vector3.zero
		local liveY = math.clamp(live.Y, -BAL.YVelClamp, BAL.YVelClamp)
		local liveFlat = Vector3.new(live.X, 0, live.Z)
		if not hum then
			if liveFlat.Magnitude < 2.5 then return Vector3.new(0, liveY, 0) end
			if liveFlat.Magnitude > BAL.VelMagCap then liveFlat = liveFlat.Unit * BAL.VelMagCap end
			return Vector3.new(liveFlat.X, liveY, liveFlat.Z)
		end

		local move = hum.MoveDirection
		local moveFlat = Vector3.new(move.X, 0, move.Z)
		local desired
		if moveFlat.Magnitude >= 0.05 then
			local walkSpeed = math.max(0, tonumber(hum.WalkSpeed) or 16)
			desired = moveFlat.Unit * walkSpeed
		else
			if liveFlat.Magnitude < 2.5 then return Vector3.new(0, liveY, 0) end
			local smp = tracker.samples
			local hist = tracker.char == char and #smp >= 4 and windowVelocity(smp, 0.14) or nil
			local histFlat = hist and Vector3.new(hist.X, 0, hist.Z) or nil
			if histFlat and histFlat.Magnitude < 2.5 then return Vector3.new(0, liveY, 0) end
			if histFlat and histFlat.Magnitude > 1
				and histFlat.Unit:Dot(liveFlat.Unit) < 0.45 then
				return Vector3.new(0, liveY, 0)
			end
			desired = histFlat and histFlat.Magnitude > 1 and histFlat or liveFlat
		end

		if desired.Magnitude > BAL.VelMagCap then desired = desired.Unit * BAL.VelMagCap end
		return Vector3.new(desired.X, liveY, desired.Z)
	end
	local function isAuraMode(char)
		if not char then return false end
		if char:GetAttribute("special") == true or char:GetAttribute("Aura") == true then return true end
		return char:FindFirstChild("Aura") ~= nil
	end

	local function solveThrow(targetChar, origin, chargeTime)
		local hrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
		if not hrp then return nil end

		local dist = (hrp.Position - origin).Magnitude
		local far = math.clamp((dist - 40) / 160, 0, 1)
		local sliderSpeed = math.clamp(tonumber(V.SpearSpeed) or 180, 60, 200)
		local speed = math.clamp((chargeTime or BAL.FullChargeTime) * sliderSpeed, 1, sliderSpeed)
		local gravity = getGravity()
		local gMag = math.abs(gravity.Y)
		local halfPing = getPingHalf() + 0.03 + 0.13 * far
		local leadMul = 1.4 -- nilai default Veil_LeadMultiplier pada Pandu

		local aimTarget = hrp.Position + Vector3.new(0, 0.2, 0)
		if dist > 100 then
			local head = targetChar:FindFirstChild("Head")
			if head and head:IsA("BasePart") then aimTarget = head.Position end
		end

		local vel = clampVelY(estimateVelocity(targetChar, hrp))
		if V.Predict == false then vel = Vector3.zero end

		local maxLead = math.clamp(dist * 0.6, 3, 45)
		local function getLeadPosition(flightTime)
			local offset = vel * ((flightTime + halfPing) * leadMul)
			if offset.Magnitude > maxLead then offset = offset.Unit * maxLead end
			return aimTarget + offset
		end

		local function solveLowArc(horizontalDistance, verticalDelta)
			local range = math.max(horizontalDistance, 0.1)
			if gMag < 0.001 then
				return math.atan2(verticalDelta, range), math.max(0.04, range / speed)
			end
			local speed2 = speed * speed
			local disc = speed2 * speed2 - gMag * (gMag * range * range + 2 * verticalDelta * speed2)
			local root = math.sqrt(math.max(disc, 0))
			local tanAngle = (speed2 - root) / (gMag * range)
			local angle = math.atan(tanAngle)
			local cosine = math.max(math.cos(angle), 0.05)
			local flightTime = math.max(0.04, range / (speed * cosine))
			return angle, flightTime
		end

		local firstDelta = aimTarget - origin
		local initialFlat = Vector3.new(firstDelta.X, 0, firstDelta.Z).Magnitude
		local _, flightTime = solveLowArc(initialFlat, firstDelta.Y)
		local finalLead, finalDir
		for _ = 1, 8 do
			finalLead = getLeadPosition(flightTime)
			local delta = finalLead - origin
			local flat = Vector3.new(delta.X, 0, delta.Z)
			local horizontal = flat.Magnitude
			local angle, nextTime = solveLowArc(horizontal, delta.Y)
			local heading = horizontal > 0.001 and flat.Unit or Vector3.new(0, 0, -1)
			finalDir = (heading * math.cos(angle) + Vector3.new(0, math.sin(angle), 0)).Unit
			flightTime = nextTime
		end

		finalLead = getLeadPosition(flightTime)
		local delta = finalLead - origin
		local flat = Vector3.new(delta.X, 0, delta.Z)
		local angle = solveLowArc(flat.Magnitude, delta.Y)
		local heading = flat.Magnitude > 0.001 and flat.Unit or Vector3.new(0, 0, -1)
		finalDir = (heading * math.cos(angle) + Vector3.new(0, math.sin(angle), 0)).Unit
		return finalDir, finalDir * speed, speed, finalLead
	end

	local function isSpearActive(char)
		if not char then return false end
		local morph = char:GetAttribute("MorphedKiller")
		if morph == "Veil" or char:GetAttribute("Veil") == true then return true end
		if char:GetAttribute("spearmode") == true then return true end
		if char:GetAttribute("VeilSpearEquipped") == true then return true end
		local spear = char:FindFirstChild("Spear")
		if spear then
			local inner = spear:FindFirstChild("Spear")
			if inner and inner:IsA("BasePart") then return inner.Transparency < 0.5 end
			return true
		end
		return false
	end

	local endAttackCache, endAttackAnims, endAttackSearched = nil, nil, false

	local function ensureChargeFn()
		local char = LP.Character
		local anims = char and char:FindFirstChild("Animations")
		if not anims then return end
		if type(getgc) ~= "function" or type(getupvalues) ~= "function" then return end
		if endAttackAnims ~= anims then
			endAttackAnims, endAttackCache, endAttackSearched = anims, nil, false
		end
		if endAttackCache or endAttackSearched then return end
		endAttackSearched = true
		pcall(function()
			for _, fn in ipairs(getgc()) do
				if type(fn) == "function" and (not islclosure or islclosure(fn)) then
					if debug.info(fn, "n") == "endAttack" and getfenv(fn).script == anims then
						endAttackCache = fn
						break
					end
				end
			end
		end)
	end

	local function getChargeTime()
		if not endAttackCache then return BAL.FullChargeTime end
		local ok, ups = pcall(getupvalues, endAttackCache)
		if ok and ups then
			local isThrown = ups[2] == true
			local startTime = tonumber(ups[9]) or 0
			if isThrown and startTime > 0 then
				return math.max(BAL.MinChargeTime, workspace:GetServerTimeNow() - startTime)
			end
		end
		return BAL.FullChargeTime
	end

	local viewDelayFn = nil
	task.spawn(function()
		for _ = 1, 40 do
			if unloaded or V.Dead or viewDelayFn then return end
			pcall(function()
				local mods = ReplicatedStorage:FindFirstChild("Modules")
				local world = mods and mods:FindFirstChild("World")
				local vis = world and world:FindFirstChild("ProjectileVisualsClient")
				if vis and vis:IsA("ModuleScript") then
					local m = require(vis)
					if m and type(m.viewDelay) == "function" then viewDelayFn = m.viewDelay end
				end
			end)
			task.wait(0.25)
		end
	end)
	task.spawn(function()
		while not unloaded and not V.Dead do
			if V.Enabled then pcall(ensureChargeFn) end
			task.wait(0.5)
		end
	end)

	local TRAIL_LIFETIME = 1.5
	local function showTrail(origin, dir, speed)
		if typeof(origin) ~= "Vector3" or typeof(dir) ~= "Vector3" or dir.Magnitude < 0.01 then return end
		speed = tonumber(speed) or 180
		task.spawn(function()
			local gravity = getGravity()
			local v0 = dir.Unit * speed
			local params = RaycastParams.new()
			params.FilterType = Enum.RaycastFilterType.Exclude
			params.RespectCanCollide = true
			local ignore = {}
			if LP.Character then table.insert(ignore, LP.Character) end
			params.FilterDescendantsInstances = ignore

			local points = { origin }
			local prev = origin
			local steps, dt = 80, 0.035
			for i = 1, steps do
				local tt = i * dt
				local nxt = origin + v0 * tt + 0.5 * gravity * tt * tt
				local delta = nxt - prev
				local stop = false
				if delta.Magnitude > 0.01 then
					local hit = workspace:Raycast(prev, delta, params)
					if hit then nxt = hit.Position; stop = true end
				end
				table.insert(points, nxt)
				prev = nxt
				if stop then break end
			end
			if #points < 2 then return end

			local folder = Instance.new("Folder")
			folder.Name = "KINON_SpearTrail"
			folder.Parent = workspace
			local terrain = workspace.Terrain
			local atts, beams = {}, {}
			for i, pt in ipairs(points) do
				local a = Instance.new("Attachment")
				a.Parent = terrain
				a.WorldPosition = pt
				atts[i] = a
			end
			local cam = workspace.CurrentCamera
			local camPos = cam and cam.CFrame.Position or origin
			local n = #points - 1
			for i = 1, n do
				local beam = Instance.new("Beam")
				beam.Attachment0, beam.Attachment1 = atts[i], atts[i + 1]
				beam.Color = ColorSequence.new(Color3.fromRGB(255, 218, 35))
				beam.LightEmission = 1
				beam.LightInfluence = 0
				beam.FaceCamera = true
				beam.Segments = 1
				local k0 = math.clamp((points[i] - camPos).Magnitude / 40, 1, 5)
				local k1 = math.clamp((points[i + 1] - camPos).Magnitude / 40, 1, 5)
				beam.Width0 = 0.5 * k0 * (1 - 0.5 * (i - 1) / n)
				beam.Width1 = 0.5 * k1 * (1 - 0.5 * i / n)
				beam.Transparency = NumberSequence.new(0.05)
				beam.Parent = folder
				beams[i] = beam
			end

			local start = os.clock()
			while folder.Parent and not unloaded do
				local alpha = (os.clock() - start) / TRAIL_LIFETIME
				if alpha >= 1 then break end
				local seq = NumberSequence.new(0.05 + alpha * 0.95)
				for _, beam in ipairs(beams) do beam.Transparency = seq end
				RunService.Heartbeat:Wait()
			end
			if folder.Parent then folder:Destroy() end
			for _, a in ipairs(atts) do a:Destroy() end
		end)
	end

	local function applyPayload(payload, origin, dir, speed)
		payload.Origin = origin
		payload.Direction = dir
		if payload.Velocity ~= nil then payload.Velocity = dir * speed end
		if viewDelayFn then
			pcall(function() payload.ViewDelay = viewDelayFn(origin, dir) end)
		end
	end

	V.NamecallHandler = function(old, self, ...)
		local method = getnamecallmethod()
		if not V.Enabled or (method ~= "FireServer" and method ~= "fireServer") then
			return old(self, ...)
		end
		local isSpear = false
		pcall(function()
			isSpear = typeof(self) == "Instance" and string.lower(self.Name) == "spearthrow"
		end)
		if not isSpear then
			if setnamecallmethod then pcall(setnamecallmethod, method) end
			return old(self, ...)
		end
		if checkcaller and checkcaller() then
			if setnamecallmethod then pcall(setnamecallmethod, method) end
			return old(self, ...)
		end

		local args = table.pack(...)
		local trailOrigin, trailDir, trailSpeed

		pcall(function()
			local char = LP.Character
			if not char or not isSpearActive(char) then return end
			local camera = workspace.CurrentCamera
			if not camera then return end
			local payload = type(args[1]) == "table" and args[1] or nil

			local origin
			if payload and typeof(payload.Origin) == "Vector3" then
				origin = payload.Origin
			elseif typeof(args[1]) == "Vector3" and typeof(args[2]) == "Vector3" then
				origin = args[1]
			elseif typeof(args[1]) == "Vector3" and type(args[2]) == "number" and typeof(args[3]) == "Vector3" then
				origin = args[3]
			else
				origin = camera.CFrame.Position + camera.CFrame.LookVector * BAL.SpawnOffset
			end

			local speedForm = payload == nil and typeof(args[1]) == "Vector3" and type(args[2]) == "number"
			local charge = speedForm and BAL.FullChargeTime or getChargeTime()
			local target = V.TargetChar
			local redirected = false

			if target and target.Parent then
				local dir, _, speed = solveThrow(target, origin, charge)
				if dir then
					trailOrigin, trailDir, trailSpeed = origin, dir, speed
					if payload then
						local ok = pcall(applyPayload, payload, origin, dir, speed)
						if ok then redirected = true
						else
							local clone = table.clone and table.clone(payload) or nil
							if clone and pcall(applyPayload, clone, origin, dir, speed) then
								args[1] = clone
								redirected = true
							end
						end
					elseif typeof(args[1]) == "Vector3" and typeof(args[2]) == "Vector3" then
						args[1], args[2] = origin, dir
						redirected = true
					elseif speedForm then
						args[1], args[2] = dir, speed
						redirected = true
					elseif typeof(args[1]) == "Vector3" then
						args[1] = dir
						redirected = true
					end
				end
			end

			if not redirected then
				trailOrigin, trailDir, trailSpeed = nil, nil, nil
				if payload and typeof(payload.Direction) == "Vector3" then
					trailOrigin = origin
					trailDir = payload.Direction
					trailSpeed = typeof(payload.Velocity) == "Vector3" and payload.Velocity.Magnitude
						or math.clamp(charge * (tonumber(V.SpearSpeed) or 180), 1, 200)
				elseif typeof(args[1]) == "Vector3" and typeof(args[2]) == "Vector3" then
					trailOrigin, trailDir = args[1], args[2]
					trailSpeed = math.clamp(charge * (tonumber(V.SpearSpeed) or 180), 1, 200)
				end
			end
		end)

		if setnamecallmethod then pcall(setnamecallmethod, method) end
		if setnamecallmethod then pcall(setnamecallmethod, method) end
		local ret = old(self, unpack(args, 1, args.n))
		if trailOrigin then task.defer(showTrail, trailOrigin, trailDir, trailSpeed) end
		return ret
	end

	local function guiParent()
		local parent
		pcall(function() parent = (gethui and gethui()) or game:GetService("CoreGui") end)
		return parent or LP:WaitForChild("PlayerGui")
	end

	local sg = Instance.new("ScreenGui")
	sg.Name = "KinonSilentSpear"
	sg.ResetOnSpawn = false
	sg.IgnoreGuiInset = true
	sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	sg.Parent = guiParent()

	local TARGET_COLOR = Color3.fromRGB(255, 60, 80)

	local line = Instance.new("Frame")
	line.Name = "TargetLine"
	line.AnchorPoint = Vector2.new(0.5, 0.5)
	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	line.BackgroundTransparency = 0.15
	line.BorderSizePixel = 0
	line.Visible = false
	line.Parent = sg

	local ring = Instance.new("BillboardGui")
	ring.Name = "KINON_SpearRing"
	ring.AlwaysOnTop = true
	ring.LightInfluence = 0
	ring.ResetOnSpawn = false
	ring.Size = UDim2.fromOffset(64, 64)
	ring.Enabled = false
	local ringFrame = Instance.new("Frame", ring)
	ringFrame.Size = UDim2.fromScale(1, 1)
	ringFrame.BackgroundTransparency = 1
	ringFrame.BorderSizePixel = 0
	Instance.new("UICorner", ringFrame).CornerRadius = UDim.new(1, 0)
	local ringStroke = Instance.new("UIStroke", ringFrame)
	ringStroke.Color = Color3.fromRGB(220, 220, 220)
	ringStroke.Thickness = 1.5
	ringStroke.Transparency = 0.35

	local lastNamed = nil
	local function paintName(char, on)
		if not char then return end
		pcall(function()
			local bb = char:FindFirstChild("PE_Text")
			local box = bb and bb:FindFirstChild("Box")
			local row = box and box:FindFirstChild("NameRow")
			local lbl = row and row:FindFirstChild("NameText")
			if lbl then
				lbl.TextColor3 = on and TARGET_COLOR or Color3.fromRGB(240, 240, 248)
			end
		end)
	end

	local function hideVisuals()
		pcall(function() line.Visible = false end)
		pcall(State.ClearMark, "spear")
		pcall(function() ring.Enabled = false; ring.Adornee = nil; ring.Parent = nil end)
	end

	V.DestroyEsp = function()
		paintName(lastNamed, false)
		lastNamed = nil
		V.TargetChar = nil
		V.CurPart, V.CurPoint, V.CurOrigin = nil, nil, nil
		hideVisuals()
		tracker.char, tracker.samples = nil, {}
	end

	V.RenderConn = RunService.RenderStepped:Connect(function()
		if unloaded or not V.Enabled then
			if V.TargetChar or line.Visible or ring.Enabled then V.DestroyEsp() end
			return
		end

		local t = pick(candidates())
		local nowC = os.clock()
		if t then
			V.LastT, V.LastSeen = t, nowC
		elseif V.LastT and nowC - (V.LastSeen or 0) < 0.3 then
			local lt = V.LastT
			local lh = lt.hum
			if lt.hrp and lt.hrp.Parent and lh and lh.Parent and lh.Health > 0 then t = lt end
		end
		V.TargetChar = t and t.char or nil
		V.CurPart = t and t.hrp or nil
		if not (LP.Team and LP.Team.Name == "Killer") then
			paintName(lastNamed, false)
			lastNamed = nil
			hideVisuals()
			return
		end
		if V.TargetChar ~= lastNamed then
			paintName(lastNamed, false)
			paintName(V.TargetChar, true)
			lastNamed = V.TargetChar
		end

		if V.TargetChar then
			local hrp = t.hrp
			trackTarget(V.TargetChar, hrp)
			pcall(State.SetMark, "spear", V.TargetChar, TARGET_COLOR)

			if ring.Adornee ~= hrp or ring.Parent ~= hrp then
				ring.Parent = hrp
				ring.Adornee = hrp
			end
			ring.Enabled = true

			local cam = workspace.CurrentCamera
			local sp, on = cam:WorldToViewportPoint(hrp.Position)
			if on and sp.Z > 0 then
				local vp = cam.ViewportSize
				local from = Vector2.new(vp.X / 2, vp.Y)
				local to = Vector2.new(sp.X, sp.Y)
				local d = to - from
				line.Size = UDim2.fromOffset(d.Magnitude, 1.5)
				line.Position = UDim2.fromOffset((from.X + to.X) / 2, (from.Y + to.Y) / 2)
				line.Rotation = math.deg(math.atan2(d.Y, d.X))
				line.Visible = true
			else
				line.Visible = false
			end
		else
			hideVisuals()
			tracker.char, tracker.samples = nil, {}
		end
	end)

	V.Destroy = function()
		V.Enabled = false
		V.Dead = true
		if V.RenderConn then pcall(function() V.RenderConn:Disconnect() end); V.RenderConn = nil end
		paintName(lastNamed, false)
		pcall(State.ClearMark, "spear")
		pcall(function() ring:Destroy() end)
		pcall(function() sg:Destroy() end)
		V.TargetChar = nil
		V.CurPart, V.CurPoint, V.CurOrigin = nil, nil, nil
	end

	if not V.Installed.namecall and hookmetamethod and getnamecallmethod then
		pcall(function()
			local old
			old = hookmetamethod(game, "__namecall", wrap(function(self, ...)
				local method = getnamecallmethod()
				if method == "FireServer" or method == "fireServer" then
					local fr = State.FlashRemote
					if fr and self == fr and State.FlashSetActive then
						local fa = { ... }
						pcall(State.FlashSetActive, fa[2] == true, fa[1])
						if setnamecallmethod then pcall(setnamecallmethod, method) end
					end
					if State.AntiBlindOn and not (checkcaller and checkcaller()) and State.IsKillerNow and State.IsKillerNow() then
						local blockBlind = false
						pcall(function()
							local n = string.lower(tostring(self:GetFullName()))
							if n:find("blind", 1, true) then blockBlind = true end
						end)
						if blockBlind then return nil end
						if setnamecallmethod then pcall(setnamecallmethod, method) end
					end
					local ns = State.NoSlow
					if ns and (ns.K or ns.S) and not (checkcaller and checkcaller()) then
						local block = false
						pcall(function()
							if self.Name == "Fall" and self.Parent and self.Parent.Name == "Mechanics" then
								block = true
							end
						end)
						if block then return nil end
						if setnamecallmethod then pcall(setnamecallmethod, method) end
					end
				end
				local handler = V.NamecallHandler
				if handler then return handler(old, self, ...) end
				return old(self, ...)
			end))
			V.Installed.namecall = true
		end)
	end
	V.HookOk = V.Installed.namecall == true

	return V
end)()

local function getTOFGunPart(ch)
	local tool = ch and ch:FindFirstChild("Twist of Fate", true)
	if not tool then return nil end

	local rightArm = tool:FindFirstChild("Right Arm", true)
	if rightArm then
		for _, name in ipairs({ "gun", "EmperorGun" }) do
			local gun = rightArm:FindFirstChild(name)
			if gun then
				if gun:IsA("BasePart") then return gun end
				local part = gun:FindFirstChildWhichIsA("BasePart", true)
				if part then return part end
			end
		end
	end

	if tool:IsA("BasePart") then return tool end
	return tool:FindFirstChildWhichIsA("BasePart", true)
end

local function getTOFLaserOrigin(ch)
	local gunPart = getTOFGunPart(ch)
	return gunPart and gunPart.Position or nil
end

State.TOF = {
	Enabled = false,
	ShowLaser = false,
	TargetMode = "Killer",
	FOV = 250,
	Smooth = 50,
	Predict = 12,
	Vis = true,
}

do
	local marks = {}
	local function setNameColor(char, color)
		pcall(function()
			local bb = char and char:FindFirstChild("PE_Text")
			local box = bb and bb:FindFirstChild("Box")
			local row = box and box:FindFirstChild("NameRow")
			local lbl = row and row:FindFirstChild("NameText")
			if lbl and lbl:IsA("TextLabel") then lbl.TextColor3 = color end
		end)
	end
	local function clear(key)
		local m = marks[key]
		if not m then return end
		marks[key] = nil
		if m.highlight then pcall(function() m.highlight:Destroy() end) end
		if m.char then
			local stillMarked, activeColor = false, nil
			for _, other in pairs(marks) do
				if other.char == m.char then
					stillMarked = true
					activeColor = other.color
					break
				end
			end
			if stillMarked then
				setNameColor(m.char, activeColor or Color3.fromRGB(255, 40, 40))
			else
				setNameColor(m.char, Color3.fromRGB(240, 240, 248))
			end
		end
	end
	State.ClearMark = clear
	State.SetMark = function(key, char, color)
		if not char or not char.Parent then return clear(key) end
		local m = marks[key]
		if m and m.char == char and m.highlight and m.highlight.Parent == char then
			m.highlight.FillColor = color
			m.highlight.OutlineColor = color
			m.color = color
			setNameColor(char, color)
			return
		end
		clear(key)
		local hl = Instance.new("Highlight")
		hl.Name = "KINON_TargetHighlight_" .. tostring(key)
		hl.Adornee = char
		hl.FillColor = color
		hl.OutlineColor = color
		hl.FillTransparency = 0.5
		hl.OutlineTransparency = 1
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		hl.Parent = char
		setNameColor(char, color)
		marks[key] = { char = char, highlight = hl, color = color }
	end
	State.DestroyMarks = function()
		for k in pairs(marks) do clear(k) end
	end
end

State.AimHold = { held = false, ok = false, tried = false }
do
	local AH = State.AimHold
	local old
	AH.Install = function()
		if AH.tried then return end
		AH.tried = true
		if type(hookmetamethod) ~= "function" or type(getnamecallmethod) ~= "function" then return end
		local wrapf = newcclosure or function(f) return f end
		local ok = pcall(function()
			old = hookmetamethod(game, "__namecall", wrapf(function(self, ...)
				local method = getnamecallmethod()
				if setnamecallmethod then setnamecallmethod(method) end
				if not unloaded and method == "FireServer" and typeof(self) == "Instance" and self.Name == "AimHold" and self.ClassName == "RemoteEvent" then
					local v = select(2, ...)
					if type(v) == "boolean" then AH.held = v end
				end
				if setnamecallmethod then setnamecallmethod(method) end
				return old(self, ...)
			end))
		end)
		AH.ok = ok and old ~= nil
	end
end

State.TOFSilent = {
	Enabled = false,
	FOV = 120,
	Predict = false,
	ZigZag = false,
	LeadScale = 100,
	ShowCircle = true,
	ShowLaser = true,
}

State.TOFObj = (function()
	local T = State.TOF
	local obj = {}
	local conns, btnConns = {}, {}
	local holding, token, curBtn, laserPart = false, 0, nil, nil
	local renderBindName = "KINON_TOFAimlockLaser_" .. tostring(LP.UserId)
	local rp = RaycastParams.new()
	rp.FilterType = Enum.RaycastFilterType.Exclude
	local laserRay = RaycastParams.new()
	laserRay.FilterType = Enum.RaycastFilterType.Exclude

	local function hideLaser()
		if laserPart then laserPart.Transparency = 1 end
	end

	local function visible(part)
		local cam = workspace.CurrentCamera
		if not cam then return true end
		rp.FilterDescendantsInstances = { LP.Character }
		local origin = cam.CFrame.Position
		local result = workspace:Raycast(origin, part.Position - origin, rp)
		if not result then return true end
		return result.Instance:IsDescendantOf(part.Parent)
	end

	local function laserBlocked(origin, targetPart)
		local ignore = { LP.Character, targetPart.Parent }
		local dir = targetPart.Position - origin
		for _ = 1, 6 do
			laserRay.FilterDescendantsInstances = ignore
			local res = workspace:Raycast(origin, dir, laserRay)
			if not res then return false end
			local inst = res.Instance
			if inst.CanCollide == false or inst.Transparency >= 0.95 then
				ignore[#ignore + 1] = inst
			else
				return true
			end
		end
		return true
	end

	local function updateLaser(origin, to)
		if not (T.ShowLaser and origin and to) then return hideLaser() end
		if not (laserPart and laserPart.Parent) then
			local p = Instance.new("Part")
			p.Name = "KinonLaser"
			p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
			p.Material = Enum.Material.Neon
			p.Color = Color3.fromRGB(255, 60, 60)
			p.Parent = workspace
			laserPart = p
		end
		local dist = (to - origin).Magnitude
		if dist < 0.5 then return hideLaser() end
		local thick = math.clamp(dist * 0.0015, 0.12, 0.3)
		laserPart.Size = Vector3.new(thick, thick, dist)
		laserPart.CFrame = CFrame.new((origin + to) / 2, to)
		laserPart.Transparency = 0
	end

	local function findButton()
		local cur = LP:FindFirstChild("PlayerGui")
		for seg in string.gmatch("Survivor-mob.Controls.Gui-mob", "[^%.]+") do
			cur = cur and cur:FindFirstChild(seg)
		end
		return cur
	end

	local function closest()
		local cam = workspace.CurrentCamera
		if not cam then return nil end
		local word = T.TargetMode == "Survivor" and "survivor" or "killer"
		local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
		local best, shortest = nil, tonumber(T.FOV) or 250
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and p.Character and p.Team and string.find(string.lower(p.Team.Name), word, 1, true) then
				local part = p.Character:FindFirstChild("HumanoidRootPart")
				local hum = p.Character:FindFirstChildOfClass("Humanoid")
				if part and hum and hum.Health > 0 then
					local pos, vis = cam:WorldToViewportPoint(part.Position)
					if vis then
						local d = (Vector2.new(pos.X, pos.Y) - center).Magnitude
						if d < shortest and (not T.Vis or visible(part)) then
							shortest = d
							best = part
						end
					end
				end
			end
		end
		return best
	end

	local function step()
		if unloaded or not T.Enabled then return end
		local AH = State.AimHold
		local char = LP.Character
		if AH.held and not (char and char:FindFirstChild("Twist of Fate")) then AH.held = false end
		local aiming = holding or (AH.ok and AH.held)
		local laserOn = T.ShowLaser and ((AH.ok and AH.held) or (not AH.ok and holding))
		if not aiming and not laserOn then return hideLaser() end
		local cam = workspace.CurrentCamera
		if not cam then return hideLaser() end
		local target = closest()
		local aimPos
		if target then
			aimPos = target.Position + target.AssemblyLinearVelocity * ((tonumber(T.Predict) or 0) / 100)
			if aiming then
				local k = math.clamp((tonumber(T.Smooth) or 50) / 100, 0.05, 1)
				cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, aimPos), k)
			end
		end
		if not laserOn then return hideLaser() end
		local origin = getTOFLaserOrigin(char)
		if not origin then return hideLaser() end
		local dir
		if aimPos and (aimPos - origin).Magnitude > 0.5 then
			dir = (aimPos - origin).Unit
		else
			dir = cam.CFrame.LookVector
		end
		laserRay.FilterDescendantsInstances = { char }
		local hit = workspace:Raycast(origin, dir * 500, laserRay)
		pcall(updateLaser, origin, hit and hit.Position or (origin + dir * 500))
	end

	local function teardown()
		token = token + 1
		pcall(function() RunService:UnbindFromRenderStep(renderBindName) end)
		holding = false
		for _, c in ipairs(conns) do c:Disconnect() end
		for _, c in ipairs(btnConns) do c:Disconnect() end
		conns, btnConns, curBtn = {}, {}, nil
		if laserPart then pcall(function() laserPart:Destroy() end); laserPart = nil end
	end

	function obj:SetEnabled(v)
		T.Enabled = v == true
		teardown()
		if not T.Enabled then return end
		State.AimHold.Install()
		local my = token
		RunService:BindToRenderStep(renderBindName, Enum.RenderPriority.Last.Value, function()
			if token == my then pcall(step) end
		end)
		conns[#conns + 1] = UserInputService.InputBegan:Connect(function(input, gp)
			if gp then return end
			if input.UserInputType == Enum.UserInputType.MouseButton2 then holding = true end
		end)
		conns[#conns + 1] = UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton2 then holding = false end
		end)
		task.spawn(function()
			while token == my and not unloaded do
				local btn = findButton()
				if btn and btn ~= curBtn then
					for _, c in ipairs(btnConns) do c:Disconnect() end
					btnConns = {}
					curBtn = btn
					btnConns[#btnConns + 1] = btn.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2 then
							holding = true
						end
					end)
					btnConns[#btnConns + 1] = btn.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2 then
							holding = false
						end
					end)
				end
				task.wait(1)
			end
		end)
	end

	function obj:Destroy()
		T.Enabled = false
		teardown()
	end

	return obj
end)()

Hooks.TOF = function(s)
	State.TOFObj:SetEnabled(s.Enabled)
end

State.SilentObj = (function()
	local T = State.TOFSilent
	local obj = {}
	local effects, original
	local installing = false

	local function killerChar()
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP and p.Character then
				local team = p.Team and string.lower(p.Team.Name) or ""
				if string.find(team, "killer", 1, true) or p.Character:FindFirstChild("Lookscriptkiller", true) then
					return p.Character
				end
			end
		end
		return nil
	end

	local function targetPart(ch)
		return ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("Torso") or ch:FindFirstChild("HumanoidRootPart")
	end

	local function hasTOF(ch)
		if not ch then return false end
		if ch:FindFirstChild("Twist of Fate") then return true end
		local eq = string.lower(tostring(LP:GetAttribute("EquippedItem") or ""))
		return eq:find("twist", 1, true) ~= nil or eq:find("fate", 1, true) ~= nil
	end

	local function muzzle(ch)
		return getTOFLaserOrigin(ch)
	end

	local PROJ_SPEED = 800
	local LEAD_MAX_TIME = 0.5
	local LEAD_MAX_DIST = 16
	local NEAR_START = 1
	local NEAR_FULL = 5
	local INTERP_DELAY = 0.05
	local HISTORY_WINDOW = 0.12
	local HISTORY_KEEP = 0.7
	local VEL_CAP = 60
	local Y_VEL_CLAMP = 14
	local TELEPORT_STEP = 12
	local history = setmetatable({}, { __mode = "k" })

	local function record(part, now)
		local list = history[part]
		if not list then
			list = {}
			history[part] = list
		end
		local pos = part.Position
		local last = list[#list]
		if last and (pos - last.p).Magnitude > TELEPORT_STEP then
			table.clear(list)
		end
		list[#list + 1] = { t = now, p = pos }
		while #list > 2 and now - list[1].t > HISTORY_KEEP do
			table.remove(list, 1)
		end
	end

	local function limitVel(v)
		v = Vector3.new(v.X, math.clamp(v.Y, -Y_VEL_CLAMP, Y_VEL_CLAMP), v.Z)
		if v.Magnitude > VEL_CAP then v = v.Unit * VEL_CAP end
		return v
	end

	local function flat(v)
		return Vector3.new(v.X, 0, v.Z)
	end

	local function latencyLead()
		local ok, ping = pcall(function() return LP:GetNetworkPing() end)
		local rtt = (ok and type(ping) == "number" and ping > 0) and math.clamp(ping, 0.02, 0.4) or 0.08
		return (rtt + INTERP_DELAY) * 0.6
	end

	track(RunService.Heartbeat:Connect(function()
		if unloaded or not (T.Enabled and (T.Predict or T.ZigZag)) then return end
		local kc = killerChar()
		local part = kc and targetPart(kc)
		if part then record(part, os.clock()) end
	end))

	local function observedVel(part)
		local list = history[part]
		if not list or #list < 2 then return nil end
		local newest = list[#list]
		if os.clock() - newest.t > 0.15 then return nil end
		local ref = list[1]
		for i = #list - 1, 1, -1 do
			if newest.t - list[i].t >= 0.05 then
				ref = list[i]
				break
			end
		end
		local dt = newest.t - ref.t
		if dt < 0.03 then return nil end
		return (newest.p - ref.p) / dt
	end

	local function getVelocity(part, hrp, hum)
		local base = hrp.AssemblyLinearVelocity
		local obs = observedVel(part)
		if obs and obs.Magnitude > 3 and obs.Magnitude < 120 then
			local bf = flat(base)
			if bf.Magnitude < 1.5 or flat(obs):Dot(bf) < 0 then base = obs end
		end
		if hum then
			local md = hum.MoveDirection
			if md.Magnitude > 0.05 then
				local intent = md * hum.WalkSpeed
				local bf = flat(base)
				if bf.Magnitude > 0.5 and flat(intent):Dot(bf) < 0 then base = intent end
			end
		end
		return limitVel(base)
	end

	local function zigzagPoint(part, from)
		local list = history[part]
		if not list or #list < 6 then return nil end
		local now = os.clock()
		local cut = now - 0.5
		local flips, prev, n = 0, nil, 0
		local sx, sz = 0, 0
		local first
		for i = 2, #list do
			local a, b = list[i - 1], list[i]
			if b.t >= cut then
				first = first or a
				local dt = b.t - a.t
				if dt > 0.03 then
					local v = flat((b.p - a.p) / dt)
					if v.Magnitude > 4 then
						if prev and prev:Dot(v) < 0 then flips = flips + 1 end
						prev = v
					end
				end
				sx, sz, n = sx + b.p.X, sz + b.p.Z, n + 1
			end
		end
		if flips < 2 or n < 4 or not first then return nil end
		local newest = list[#list]
		local span = newest.t - first.t
		local drift = Vector3.zero
		if span > 0.15 then drift = flat((newest.p - first.p) / span) end
		if drift.Magnitude > 30 then drift = drift.Unit * 30 end
		local center = Vector3.new(sx / n, newest.p.Y, sz / n)
		local t = (center - from).Magnitude / PROJ_SPEED + latencyLead()
		return center + drift * t
	end

	local function aimPoint(part, from)
		local pos = part.Position
		if not (T.Predict or T.ZigZag) then return pos end
		if T.ZigZag then
			local zp = zigzagPoint(part, from)
			if zp then return zp end
		end
		if not T.Predict then return pos end
		local ch = part.Parent
		local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
		if not hrp then return pos end
		local hum = ch:FindFirstChildOfClass("Humanoid")
		local vel = getVelocity(part, hrp, hum)
		if vel.Magnitude < 1 then return pos end
		local lat = latencyLead()
		local t = (pos - from).Magnitude / PROJ_SPEED + lat
		local predicted = pos
		for _ = 1, 3 do
			predicted = pos + vel * t
			t = (predicted - from).Magnitude / PROJ_SPEED + lat
		end
		local scale = math.clamp((tonumber(T.LeadScale) or 100) / 100, 0.3, 3)
		local offset = (predicted - pos) * scale
		if offset.Magnitude > 22 then offset = offset.Unit * 22 end
		return pos + offset
	end

	local function inFov(pos)
		local cam = workspace.CurrentCamera
		if not cam then return false end
		local to = pos - cam.CFrame.Position
		if to.Magnitude < 0.1 then return true end
		local dot = math.clamp(cam.CFrame.LookVector:Dot(to.Unit), -1, 1)
		return math.deg(math.acos(dot)) <= (tonumber(T.FOV) or 120) / 2
	end

	local function compute(character, ignoreFov)
		local kc = killerChar()
		local part = kc and targetPart(kc)
		if not part then return nil end
		local from = muzzle(character)
		if not from then return nil end
		local pos = aimPoint(part, from)
		if not ignoreFov and not inFov(pos) then return nil end
		local d = pos - from
		if d.Magnitude < 0.01 then return nil end
		return d.Unit
	end

	local circleGui, circleFrame, laserPart
	local activeTool, toolConns = nil, {}
	local isFiring, releaseUntil = false, 0
	local lastAimDir, lastAimAt = nil, 0

	local function clearToolConnections()
		for _, c in ipairs(toolConns) do pcall(function() c:Disconnect() end) end
		table.clear(toolConns)
		activeTool = nil
		isFiring, releaseUntil = false, 0
	end

	local mouseHeld = false
	toolConns[#toolConns + 1] = track(UserInputService.InputBegan:Connect(function(input, processed)
		if processed then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			mouseHeld = true
		end
	end))
	track(UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			mouseHeld = false
			releaseUntil = tick() + 0.12
		end
	end))

	local BULLET_LASER_MAX = 500

	local function bindActiveTool(ch)
		local tool = ch and ch:FindFirstChild("Twist of Fate")
		if tool == activeTool then return end
		clearToolConnections()
		mouseHeld = false
		if not (tool and tool:IsA("Tool")) then return end
		activeTool = tool
		toolConns[#toolConns + 1] = tool.Activated:Connect(function()
			isFiring = true
			releaseUntil = 0
		end)
		toolConns[#toolConns + 1] = tool.Deactivated:Connect(function()
			State.AimHold.held = false
			isFiring = false
			releaseUntil = tick() + 0.12
		end)
		toolConns[#toolConns + 1] = tool.Unequipped:Connect(function()
			State.AimHold.held = false
			isFiring = false
			releaseUntil = 0
		end)
	end

	local function ensureCircle()
		if circleGui and circleGui.Parent then return true end
		local parent
		pcall(function() parent = (gethui and gethui()) or game:GetService("CoreGui") end)
		parent = parent or LP:FindFirstChildOfClass("PlayerGui")
		if not parent then return false end
		local sg = Instance.new("ScreenGui")
		sg.Name = "KINON_TOFSilentFOV"
		sg.ResetOnSpawn = false
		sg.IgnoreGuiInset = true
		sg.DisplayOrder = 20
		local f = Instance.new("Frame")
		f.AnchorPoint = Vector2.new(0.5, 0.5)
		f.Position = UDim2.fromScale(0.5, 0.5)
		f.BackgroundTransparency = 1
		f.BorderSizePixel = 0
		f.Parent = sg
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(1, 0)
		corner.Parent = f
		local stroke = Instance.new("UIStroke")
		stroke.Color = Color3.fromRGB(255, 255, 255)
		stroke.Thickness = 1.5
		stroke.Transparency = 0.2
		stroke.Parent = f
		local ok = pcall(function() sg.Parent = parent end)
		if not ok then return false end
		circleGui, circleFrame = sg, f
		return true
	end

	local function circleRadius(cam)
		local half = math.rad(math.clamp((tonumber(T.FOV) or 120) / 2, 1, 85))
		local halfV = math.rad(cam.FieldOfView) / 2
		local r = (cam.ViewportSize.Y / 2) * math.tan(half) / math.tan(halfV)
		local visibleCap = math.min(cam.ViewportSize.X, cam.ViewportSize.Y) * 0.48
		return math.clamp(r, 12, visibleCap)
	end

	local function hideLaser()
		if laserPart then laserPart.Transparency = 1 end
	end

	local function updateLaser(from, to)
		if not (laserPart and laserPart.Parent) then
			local p = Instance.new("Part")
			p.Name = "KINON_TOFSilentLaser"
			p.Anchored, p.CanCollide, p.CanQuery, p.CanTouch, p.CastShadow = true, false, false, false, false
			p.Material = Enum.Material.Neon
			p.Color = Color3.fromRGB(255, 60, 60)
			p.Transparency = 1
			p.Parent = workspace
			laserPart = p
		end
		local dist = (to - from).Magnitude
		if dist < 0.5 then return hideLaser() end
		local thick = math.clamp(dist * 0.0015, 0.12, 0.3)
		laserPart.Size = Vector3.new(thick, thick, dist)
		laserPart.CFrame = CFrame.new((from + to) / 2, to)
		laserPart.Transparency = 0
	end

	local aimRay = RaycastParams.new()
	aimRay.FilterType = Enum.RaycastFilterType.Exclude
	aimRay.RespectCanCollide = true

	local function drawAimLaser(ch, from, dir)
		aimRay.FilterDescendantsInstances = { ch }
		local res = workspace:Raycast(from, dir * BULLET_LASER_MAX, aimRay)
		updateLaser(from, res and res.Position or (from + dir * BULLET_LASER_MAX))
	end

	local renderBindName = "KINON_TOFSilentLaser_" .. tostring(LP.UserId)
	pcall(function() RunService:UnbindFromRenderStep(renderBindName) end)
	RunService:BindToRenderStep(renderBindName, Enum.RenderPriority.Last.Value, function()
		local active = T.Enabled and not unloaded
		local cam = workspace.CurrentCamera
		if active and T.ShowCircle and cam and ensureCircle() then
			circleGui.Enabled = true
			local r = circleRadius(cam)
			circleFrame.Size = UDim2.fromOffset(r * 2, r * 2)
		elseif circleGui then
			circleGui.Enabled = false
		end

		if not active or not T.ShowLaser then return hideLaser() end
		local ch = LP.Character
		bindActiveTool(ch)
		if not hasTOF(ch) then State.AimHold.held = false; return hideLaser() end
		if State.AimHold.ok and not State.AimHold.held then return hideLaser() end
		local from = muzzle(ch)
		if not from then return hideLaser() end
		local good, dir = pcall(compute, ch, true)
		if not (good and typeof(dir) == "Vector3") then
			dir = nil
			if cam then
				aimRay.FilterDescendantsInstances = { ch }
				local hit = workspace:Raycast(cam.CFrame.Position, cam.CFrame.LookVector * BULLET_LASER_MAX, aimRay)
				local target = hit and hit.Position or (cam.CFrame.Position + cam.CFrame.LookVector * BULLET_LASER_MAX)
				local d = target - from
				dir = d.Magnitude > 0.5 and d.Unit or cam.CFrame.LookVector
			end
		end
		if not dir then return hideLaser() end
		pcall(drawAimLaser, ch, from, dir)
	end)

	local function restore()
		if effects and original then
			pcall(function() effects.aimDirection = original end)
		end
	end

	local function install()
		if original or installing then return end
		installing = true
		task.spawn(function()
			local ok = pcall(function()
				local rs = game:GetService("ReplicatedStorage")
				local m = rs:WaitForChild("Modules", 10):WaitForChild("Items", 10):WaitForChild("TwistOfFate", 10):WaitForChild("TwistoffateEffects", 10)
				local e = require(m)
				local orig = e.aimDirection
				if type(orig) ~= "function" then error("no aimDirection") end
				e.aimDirection = function(character, camCF)
					if unloaded or not T.Enabled then return orig(character, camCF) end
					local good, dir = pcall(compute, character)
					if good and dir then
						lastAimDir, lastAimAt = dir, tick()
						return dir
					end
					local res = orig(character, camCF)
					if typeof(res) == "Vector3" then lastAimDir, lastAimAt = res, tick() end
					return res
				end
				effects, original = e, orig
			end)
			installing = false
			if ok and unloaded then restore() end
		end)
	end

	function obj:Refresh()
		if T.Enabled then State.AimHold.Install(); install() end
	end

	function obj:Destroy()
		T.Enabled = false
		pcall(function() RunService:UnbindFromRenderStep(renderBindName) end)
		clearToolConnections()
		mouseHeld = false
		restore()
		if circleGui then pcall(function() circleGui:Destroy() end) end
		if laserPart then pcall(function() laserPart:Destroy() end) end
	end

	return obj
end)()

Hooks.TOFSilent = function(s)
	State.SilentObj:Refresh()
end

State.AimFlash = { Enabled = false, Range = 120, AimPart = "Head", Smooth = 35, ShowLaser = true }

State.FlashObj = (function()
	local FL = State.AimFlash
	local obj = {}
	local conn, laser
	local active, flashPart = false, nil
	local token = 0

	local function holdingFlashlight()
		local c = LP.Character
		if not c then return false end
		for _, t in ipairs(c:GetChildren()) do
			if t:IsA("Tool") then
				local n = string.lower(t.Name)
				if string.find(n, "flash", 1, true) or string.find(n, "torch", 1, true) then return true end
			end
		end
		return false
	end

	local function clearLaser()
		if laser then pcall(function() laser:Destroy() end); laser = nil end
	end

	local function targetPart(char)
		local p = char:FindFirstChild(FL.AimPart or "Head")
		if p and p:IsA("BasePart") then return p end
		return char:FindFirstChild("Head") or char:FindFirstChild("UpperTorso")
			or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
	end

	local function pickTarget(myPos)
		local best, bestDist = nil, tonumber(FL.Range) or 120
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP and plr.Character and plr.Team and string.find(string.lower(plr.Team.Name), "killer", 1, true) then
				local hum = plr.Character:FindFirstChildOfClass("Humanoid")
				local part = targetPart(plr.Character)
				if hum and hum.Health > 0 and plr.Character:GetAttribute("State") ~= "Dead" and part then
					local d = (myPos - part.Position).Magnitude
					if d <= bestDist then best, bestDist = part, d end
				end
			end
		end
		return best
	end

	local function laserOrigin(cam)
		if typeof(flashPart) == "Instance" and flashPart.Parent then
			if flashPart:IsA("BasePart") then return flashPart.Position end
			local p = flashPart:FindFirstChildWhichIsA("BasePart", true)
			if p then return p.Position end
		end
		local c = LP.Character
		local hand = c and (c:FindFirstChild("RightHand") or c:FindFirstChild("Right Arm") or c:FindFirstChild("HumanoidRootPart"))
		if hand and hand:IsA("BasePart") then return hand.Position end
		return cam.CFrame.Position
	end

	local function updateLaser(op, tp)
		if not (laser and laser.Parent) then
			local l = Instance.new("Part")
			l.Name = "VDFlashlightLaser"
			l.Anchored, l.CanCollide, l.CanTouch, l.CanQuery, l.CastShadow = true, false, false, false, false
			l.Material = Enum.Material.Neon
			l.Color = Color3.fromRGB(255, 255, 255)
			l.Parent = workspace
			laser = l
		end
		local d = (tp - op).Magnitude
		if d < 0.1 then return end
		laser.Size = Vector3.new(0.16, 0.16, d)
		laser.CFrame = CFrame.new((op + tp) / 2, tp)
		laser.Transparency = 0.35
	end

	local function isActive()
		if State.SpearObj and State.SpearObj.HookOk and State.FlashRemote then return active end
		return holdingFlashlight()
	end

	local function step()
		if unloaded or not FL.Enabled then return end
		local c = LP.Character
		local root = c and c:FindFirstChild("HumanoidRootPart")
		local cam = workspace.CurrentCamera
		if not root or not cam or not isActive() then
			if laser then laser.Transparency = 1 end
			return
		end
		local part = pickTarget(root.Position)
		if not part then
			if laser then laser.Transparency = 1 end
			return
		end
		if FL.ShowLaser then
			pcall(updateLaser, laserOrigin(cam), part.Position)
		elseif laser then
			laser.Transparency = 1
		end
		local k = math.clamp((tonumber(FL.Smooth) or 35) / 100, 0.05, 1)
		cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, part.Position), k)
		root.CFrame = CFrame.new(root.Position, Vector3.new(part.Position.X, root.Position.Y, part.Position.Z))
	end

	State.FlashSetActive = function(on, part)
		active = on == true
		flashPart = active and part or nil
	end

	function obj:SetEnabled(v)
		FL.Enabled = v == true
		if conn then conn:Disconnect(); conn = nil end
		token = token + 1
		active, flashPart = false, nil
		clearLaser()
		if FL.Enabled then
			local my = token
			conn = RunService.RenderStepped:Connect(function() pcall(step) end)
			task.spawn(function()
				for _ = 1, 40 do
					if token ~= my or unloaded then return end
					local r = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
					local i = r and r:FindFirstChild("Items")
					local f = i and i:FindFirstChild("Flashlight")
					local a = f and f:FindFirstChild("Activate")
					if a and a:IsA("RemoteEvent") then
						State.FlashRemote = a
						return
					end
					task.wait(0.5)
				end
			end)
		end
	end

	function obj:Destroy()
		FL.Enabled = false
		token = token + 1
		if conn then conn:Disconnect(); conn = nil end
		State.FlashRemote = nil
		clearLaser()
	end

	return obj
end)()

Hooks.AimFlash = function(s)
	State.FlashObj:SetEnabled(s.Enabled)
end

State.NoSlow = { K = false, S = false }

State.Spear = State.SpearObj
Hooks.Spear = function(s)
	if not s.Enabled then return end
	if not s.HookOk then
		warn("[" .. HUB_NAME .. "] Silent Spear: your executor does not support hookmetamethod, this feature will not work.")
	end
	if not (LP.Team and LP.Team.Name == "Killer") then
		warn("[" .. HUB_NAME .. "] Silent Spear: only works while you are the Killer.")
	end
end

State.SilentChain = (function()
	local Teams = game:GetService("Teams")
	local CollectionService = game:GetService("CollectionService")
	local RunService = game:GetService("RunService")

	local S = {
		Enabled = false,
		Debug = false,
		Range = 50,
		Speed = 140,
		PredMultiplier = 1.0,
		Prediction = true,
		Highlight = true,
		AimHeightOffset = 0.5,
		HookOk = false,
	}

	local function log(msg)
		if S.Debug then print("[" .. HUB_NAME .. "] Silent Chain: " .. tostring(msg)) end
	end

	local HISTORY_WINDOW = 0.15
	local HISTORY_KEEP = 0.4
	local MAX_SPEED = 50
	local TELEPORT_STEP = 12
	local history = setmetatable({}, { __mode = "k" })

	local function recordPosition(hrp, now)
		local list = history[hrp]
		if not list then
			list = {}
			history[hrp] = list
		end
		local pos = hrp.Position
		local last = list[#list]
		if last and (pos - last.p).Magnitude > TELEPORT_STEP then
			table.clear(list)
		end
		list[#list + 1] = { t = now, p = pos }
		while #list > 2 and now - list[1].t > HISTORY_KEEP do
			table.remove(list, 1)
		end
	end

	local function clampFlat(v)
		local flat = Vector3.new(v.X, 0, v.Z)
		if flat.Magnitude > MAX_SPEED then flat = flat.Unit * MAX_SPEED end
		return flat
	end

	local function getVelocity(hrp)
		if not hrp then return Vector3.zero end
		local list = history[hrp]
		if list and #list >= 2 then
			local newest = list[#list]
			local oldest = newest
			for i = #list - 1, 1, -1 do
				if newest.t - list[i].t <= HISTORY_WINDOW then
					oldest = list[i]
				else
					break
				end
			end
			local dt = newest.t - oldest.t
			if dt > 0.02 then
				return clampFlat((newest.p - oldest.p) / dt)
			end
		end
		return clampFlat(hrp.AssemblyLinearVelocity or hrp.Velocity or Vector3.zero)
	end

	local function getPing()
		local ok, ping = pcall(function() return LP:GetNetworkPing() end)
		if ok and type(ping) == "number" then return math.clamp(ping, 0, 0.3) end
		return 0
	end

	local function solveLead(origin, aimPoint, vel)
		local speed = math.max(S.Speed, 1)
		local ping = getPing()
		local t = (aimPoint - origin).Magnitude / speed
		local lead = Vector3.zero
		for _ = 1, 3 do
			lead = vel * (math.min(t, 0.8) + ping) * S.PredMultiplier
			t = ((aimPoint + lead) - origin).Magnitude / speed
		end
		return lead
	end

	local function canLatch(char)
		if not char or not char.Parent then return false end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not hum or hum.Health <= 0 then return false end
		if char:GetAttribute("Knocked") then return false end
		if char:GetAttribute("IsHooked") or char:GetAttribute("IsCarried") or char:GetAttribute("IsCarrying") then return false end
		if char:GetAttribute("Trapped") then return false end
		return true
	end

	local KILLER_WORDS = { "killer", "murderer", "hunter", "assassin", "slasher", "psycho", "enemy" }
	local function isSurvivor(plr)
		if plr == LP then return false end
		local team = plr.Team
		if team then
			local n = team.Name:lower()
			for _, word in ipairs(KILLER_WORDS) do
				if n:find(word, 1, true) then return false end
			end
			return true
		end
		return #Teams:GetTeams() > 0
	end

	local function getTarget()
		local myChar = LP.Character
		if not myChar then return nil end
		local myRoot = myChar:FindFirstChild("HumanoidRootPart")
		if not myRoot then return nil end

		local bestTarget, bestDist = nil, S.Range
		local function check(char)
			if not char or char == myChar then return end
			if not canLatch(char) then return end
			local root = char:FindFirstChild("HumanoidRootPart")
			if not root then return end
			local d = (root.Position - myRoot.Position).Magnitude
			if d <= S.Range and d < bestDist then
				bestDist = d
				bestTarget = root
			end
		end
		for _, plr in ipairs(Players:GetPlayers()) do
			if isSurvivor(plr) then check(plr.Character) end
		end
		for _, bot in ipairs(CollectionService:GetTagged("SurvivorBot")) do
			check(bot)
		end
		return bestTarget
	end

	track(RunService.Heartbeat:Connect(function()
		if not S.Enabled or unloaded then return end
		local now = os.clock()
		for _, plr in ipairs(Players:GetPlayers()) do
			if isSurvivor(plr) then
				local char = plr.Character
				local root = char and char:FindFirstChild("HumanoidRootPart")
				if root then recordPosition(root, now) end
			end
		end
		for _, bot in ipairs(CollectionService:GetTagged("SurvivorBot")) do
			local root = bot:FindFirstChild("HumanoidRootPart")
			if root then recordPosition(root, now) end
		end
	end))

	track(RunService.RenderStepped:Connect(function()
		if S.Enabled and S.Highlight and not unloaded then
			local t = getTarget()
			local char = t and t.Parent
			if char then
				pcall(State.SetMark, "chain", char, Color3.fromRGB(255, 40, 40))
				return
			end
		end
		pcall(State.ClearMark, "chain")
	end))

	local function redirect(args)
		local target = getTarget()
		if not target then return false end

		local char = LP.Character
		local head = char and char:FindFirstChild("Head")
		if not head then return false end

		local origin = head.Position
		local aimPoint = target.Position + Vector3.new(0, S.AimHeightOffset, 0)

		local lead = 0
		if S.Prediction and S.PredMultiplier > 0 then
			local leadVec = solveLead(origin, aimPoint, getVelocity(target))
			aimPoint = aimPoint + leadVec
			lead = leadVec.Magnitude
		end

		local dirVec = aimPoint - origin
		local dist = dirVec.Magnitude
		if dist < 0.001 then return false end
		local dir = dirVec.Unit

		if S.Debug then
			log(string.format("dist=%.1f lead=%.1f speed=%d mult=%.2f offset=%.1f",
				dist, lead, S.Speed, S.PredMultiplier, S.AimHeightOffset))
		end

		if typeof(args[1]) == "Vector3" then
			args[1] = dir
			return true
		end
		if type(args[3]) == "table" then
			if typeof(args[3].Origin) == "Vector3" then
				args[3].Origin = origin
			end
			if typeof(args[3].Direction) == "Vector3" then
				args[3].Direction = dir
				return true
			end
		end
		return false
	end

	local oldNamecall
	function S.Install()
		if S.HookOk then return true end
		if type(hookmetamethod) ~= "function" or type(getnamecallmethod) ~= "function" then
			return false
		end
		local wrap = newcclosure or function(f) return f end

		oldNamecall = hookmetamethod(game, "__namecall", wrap(function(self, ...)
			local method = getnamecallmethod()
			if setnamecallmethod then setnamecallmethod(method) end

			if unloaded or not S.Enabled then
				return oldNamecall(self, ...)
			end

			if method == "FireServer"
				and typeof(self) == "Instance"
				and self.ClassName == "RemoteEvent"
				and self.Name == "ChainThrow" then
				local args = table.pack(...)
				log("ChainThrow n=" .. tostring(args.n))
				local ok, changed = pcall(redirect, args)
				if ok and changed then
					if setnamecallmethod then setnamecallmethod(method) end
					return oldNamecall(self, table.unpack(args, 1, args.n))
				end
			end

			if setnamecallmethod then setnamecallmethod(method) end
			return oldNamecall(self, ...)
		end))

		S.HookOk = true
		log("hook installed")
		return true
	end

	function S.Destroy()
		S.Enabled = false
		pcall(State.ClearMark, "chain")
	end

	return S
end)()

Hooks.SilentChain = function(s)
	if not s.Enabled then return end
	if not s.HookOk then s.Install() end
	if not s.HookOk then
		warn("[" .. HUB_NAME .. "] Silent Chain: your executor does not support hookmetamethod, this feature will not work.")
	end
end

State.PumpkinFarmObj = (function()
	local VIM = game:GetService("VirtualInputManager")
	local PathfindingService = game:GetService("PathfindingService")
	local S = { Enabled = false, AutoRun = false, FleeKiller = false, FleeDistance = 25 }
	local obj = { Settings = S, Status = "OFF", OnStatus = nil }

	local function setStatus(t)
		if obj.Status == t then return end
		obj.Status = t
		if obj.OnStatus then pcall(obj.OnStatus, t) end
	end

	local function teamHas(word)
		local t = LP.Team
		return t ~= nil and t.Name:lower():find(word, 1, true) ~= nil
	end
	local function isSpectating() return teamHas("spectator") end
	local function inLobby() return workspace:FindFirstChild("Map") == nil end

	local function nearestKillerDistance()
		local char = LP.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp then return nil end
		local best = math.huge
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP and plr.Character then
				local isKiller = false
				local t = plr.Team
				if t and t.Name:lower():find("killer", 1, true) then isKiller = true end
				if plr:GetAttribute("Role") == "Killer" or plr:GetAttribute("IsKiller") == true then isKiller = true end
				if isKiller then
					local kHrp = plr.Character:FindFirstChild("HumanoidRootPart")
					local kHum = plr.Character:FindFirstChildOfClass("Humanoid")
					if kHrp and kHum and kHum.Health > 0 then
						local d = (kHrp.Position - hrp.Position).Magnitude
						if d < best then best = d end
					end
				end
			end
		end
		return best < math.huge and best or nil
	end

	local GuiService = game:GetService("GuiService")

	local function releaseShift()
		pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game) end)
	end

	local function findSprintButton()
		local pg  = LP:FindFirstChildOfClass("PlayerGui")
		local mob = pg and pg:FindFirstChild("Survivor-mob")
		local ctl = mob and mob:FindFirstChild("Controls")
		local sp  = ctl and ctl:FindFirstChild("sprint")
		if not sp then return nil end
		if sp:IsA("GuiButton") then return sp end
		local ic = sp:FindFirstChild("icon")
		if ic and ic:IsA("GuiButton") then return ic end
		if ic and ic.Parent and ic.Parent:IsA("GuiButton") then return ic.Parent end
		if sp.Parent and sp.Parent:IsA("GuiButton") then return sp.Parent end
		return sp
	end

	local function tapSprint()
		local btn = findSprintButton()
		if not btn then return false end
		pcall(function()
			if type(firesignal) == "function" then
				firesignal(btn.MouseButton1Click)
				firesignal(btn.MouseButton1Down)
				task.wait(0.04)
				firesignal(btn.MouseButton1Up)
			else
				local p, sz = btn.AbsolutePosition, btn.AbsoluteSize
				local inset = GuiService:GetGuiInset()
				local x = p.X + sz.X / 2 + inset.X
				local y = p.Y + sz.Y / 2 + inset.Y
				VIM:SendTouchEvent(9901, 0, x, y)
				task.wait(0.04)
				VIM:SendTouchEvent(9901, 2, x, y)
			end
		end)
		return true
	end

	local function isMoving()
		local ch = LP.Character
		local h = ch and ch:FindFirstChildOfClass("Humanoid")
		if not h then return false end
		if h.MoveDirection.Magnitude > 0.12 then return true end
		local hrp = ch:FindFirstChild("HumanoidRootPart")
		if hrp then
			local v = hrp.AssemblyLinearVelocity
			if Vector3.new(v.X, 0, v.Z).Magnitude > 1.5 then return true end
		end
		return false
	end
	local function charAttr(a, b)
		local ch = LP.Character
		return ch ~= nil and (ch:GetAttribute(a) == true or (b ~= nil and ch:GetAttribute(b) == true))
	end
	local function isCrouching() return charAttr("Crouching", "Crouchingserver") end
	local function isSprinting() return charAttr("Sprinting", "IsRunning") end

	task.spawn(function()
		local shiftHeld, mobileTouched, lastTap = false, false, 0
		local tapStreak, pauseUntil = 0, 0
		while not unloaded do
			task.wait(0.12)
			local active = S.Enabled and S.AutoRun and not isSpectating()
			local btn = findSprintButton()
			local mobile = false
			if btn ~= nil then
				local vis = false
				pcall(function() vis = btn.AbsoluteSize.X > 0 and btn:IsDescendantOf(game) end)
				mobile = vis and (UserInputService.TouchEnabled or not UserInputService.KeyboardEnabled)
			end
			if active then
				pcall(function()
					if mobile then
						local moving, crouch, sprint = isMoving(), isCrouching(), isSprinting()
						local now = tick()
						if sprint then tapStreak = 0 end
						if now - lastTap > 0.6 and now > pauseUntil then
							if crouch then
								if sprint then tapSprint(); lastTap = now end
							elseif not sprint then
								tapSprint(); lastTap = now
								tapStreak = tapStreak + 1
								if tapStreak >= 4 then
									tapStreak = 0
									pauseUntil = now + 15
								end
							end
						end
						mobileTouched = true
					else
						VIM:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
						shiftHeld = true
					end
				end)
			else

				if shiftHeld then releaseShift(); shiftHeld = false end
				if mobileTouched then
					mobileTouched = false
					pcall(function() if isSprinting() then tapSprint() end end)
				end
			end
		end
		if shiftHeld then releaseShift() end
	end)

	local items = {}
	local lastDest, lastMoveAt, currentTarget, isCrushing = nil, 0, nil, false
	local stuckPos, stuckAt = nil, 0
	local MOVE_REFRESH, DEST_MOVE_EPS = 0.35, 4

	local pathState = { wps = nil, idx = 1, goal = nil, at = 0, lastTry = 0, fails = 0 }
	local function clearPath()
		pathState.wps, pathState.idx, pathState.goal = nil, 1, nil
	end
	local function resetState()
		lastDest, lastMoveAt, currentTarget, isCrushing = nil, 0, nil, false
		stuckPos, stuckAt = nil, 0
		clearPath()
		pathState.fails = 0
	end

	local PATH_PARAMS = { AgentRadius = 4.5, AgentHeight = 6, AgentCanJump = true, AgentCanClimb = false, WaypointSpacing = 3 }
	local PATH_OFFSETS = {
		Vector3.zero, Vector3.new(4, 0, 0), Vector3.new(-4, 0, 0), Vector3.new(0, 0, 4), Vector3.new(0, 0, -4),
	}
	local function computePath(hrp, goalPos)
		for _, off in ipairs(PATH_OFFSETS) do
			local path = PathfindingService:CreatePath(PATH_PARAMS)
			local ok = pcall(function() path:ComputeAsync(hrp.Position, goalPos + off) end)
			if ok and path.Status == Enum.PathStatus.Success then
				local wps = path:GetWaypoints()
				if #wps >= 2 then
					local len = 0
					for i = 2, #wps do len = len + (wps[i].Position - wps[i - 1].Position).Magnitude end
					return wps, len
				end
			end
		end
		return nil
	end

	local function hardStop(humanoid, hrp)
		pcall(function()
			humanoid:Move(Vector3.zero, false)
			humanoid:MoveTo(hrp.Position)
		end)
	end

	local function getCrushRemote()
		local RS = game:GetService("ReplicatedStorage")
		local remotes = RS:FindFirstChild("Remotes")
		if remotes then
			local events = remotes:FindFirstChild("Events")
			local halloween = events and events:FindFirstChild("Halloween")
			local crush = halloween and halloween:FindFirstChild("Crush")
			if crush then return crush end
			for _, d in ipairs(remotes:GetDescendants()) do
				if (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) and d.Name == "Crush" then return d end
			end
		end
		return nil
	end

	local function getHitboxPart(o)
		if not o then return nil end
		if o:IsA("BasePart") then return o end
		if o:IsA("Model") then
			local hb = o:FindFirstChild("HB") or o:FindFirstChild("Hitbox") or o:FindFirstChild("HitBox")
			if hb and hb:IsA("BasePart") then return hb end
			return o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart")
		end
		return nil
	end

	local function getCrushTarget(o)
		if not o then return nil end
		local hb = o:FindFirstChild("HB") or (o.Parent and o.Parent:FindFirstChild("HB"))
		if hb then return hb end
		return getHitboxPart(o) or o
	end

	local function smoothMove(humanoid, destPos)
		local now = tick()
		local need = (not lastDest) or (destPos - lastDest).Magnitude > DEST_MOVE_EPS or now - lastMoveAt > MOVE_REFRESH
		if need then
			humanoid:MoveTo(destPos)
			lastDest, lastMoveAt = destPos, now
		end
	end

	local function step()
		if inLobby() then
			setStatus("WAITING FOR MATCH (Lobby)")
			resetState()
			task.wait(1)
			return
		end

		local char = LP.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local humanoid = char and char:FindFirstChildOfClass("Humanoid")
		if not (char and hrp and humanoid and humanoid.Health > 0 and teamHas("survivor") and not isSpectating()) then
			resetState()
			return
		end

		if S.FleeKiller then
			local d = nearestKillerDistance()
			if d and d <= S.FleeDistance then
				setStatus("PUMPKIN (KILLER NEAR)")
				hardStop(humanoid, hrp)
				resetState()
				task.wait(0.5)
				return
			end
		end

		local now = tick()
		local list, seen = {}, {}
		local function addPumpkin(o)
			if o and o.Parent and o:IsDescendantOf(workspace) and not seen[o] then
				if not (items[o] and now < items[o]) and getHitboxPart(o) then
					seen[o] = true
					table.insert(list, o)
				end
			end
		end

		local world = State.WorldESPObj
		local cache = world and world.Cache.Pumpkins
		if world and (not cache or #cache == 0) then
			pcall(function() world:_scan(false) end)
			cache = world.Cache.Pumpkins
		end
		for _, p in ipairs(cache or {}) do addPumpkin(p) end
		local map = workspace:FindFirstChild("Map")
		local folder = map and map:FindFirstChild("Pumpkins")
		if folder then
			for _, c in ipairs(folder:GetChildren()) do addPumpkin(c) end
		end

		if #list == 0 then
			setStatus("ALL PUMPKINS CRUSHED")
			resetState()
			return
		end

		local chosen, chosenPart, best = nil, nil, math.huge
		if currentTarget and currentTarget.Parent and seen[currentTarget] then
			local part = getHitboxPart(currentTarget)
			if part then
				chosen, chosenPart = currentTarget, part
				best = (part.Position - hrp.Position).Magnitude
			end
		end
		if not chosen then
			local cands = {}
			for _, o in ipairs(list) do
				local part = getHitboxPart(o)
				if part then
					table.insert(cands, { o = o, part = part, d = (part.Position - hrp.Position).Magnitude })
				end
			end
			table.sort(cands, function(a, b) return a.d < b.d end)
			local bestScore = math.huge
			for i = 1, math.min(3, #cands) do
				local c = cands[i]
				local _, len = computePath(hrp, c.part.Position)
				local score = len or (c.d * 4 + 200)
				if score < bestScore then bestScore, best, chosen, chosenPart = score, c.d, c.o, c.part end
			end
			if not chosen and cands[1] then best, chosen, chosenPart = cands[1].d, cands[1].o, cands[1].part end
		end
		if not (chosen and chosenPart) then return end

		currentTarget = chosen
		setStatus("PUMPKIN (" .. #list .. " LEFT)")
		local destPos = chosenPart.Position + Vector3.new(0, 1.5, 0)
		local dist = (chosenPart.Position - hrp.Position).Magnitude

		if not isCrushing and dist > 4.5 then
			local ps = pathState
			local goalPos = chosenPart.Position
			local needNew = (not ps.wps) or (not ps.goal) or (goalPos - ps.goal).Magnitude > 6 or now - ps.at > 2.5
			if needNew and now - ps.lastTry > 0.6 then
				ps.lastTry = now
				local wps = computePath(hrp, goalPos)
				if wps then
					ps.wps, ps.idx, ps.goal, ps.at, ps.fails = wps, 2, goalPos, tick(), 0
				else
					ps.wps = nil
					ps.fails = ps.fails + 1
					if ps.fails >= 4 then

						items[chosen] = tick() + 20
						currentTarget = nil
						ps.fails = 0
						clearPath()
						return
					end
				end
			end
			local wps = ps.wps
			if not wps then
				humanoid:MoveTo(hrp.Position)
			else
				local wp = wps[ps.idx]
				while wp and Vector3.new(hrp.Position.X - wp.Position.X, 0, hrp.Position.Z - wp.Position.Z).Magnitude < 2.2 do
					ps.idx = ps.idx + 1
					wp = wps[ps.idx]
				end
				if not wp then
					clearPath()
				else
					if wp.Action == Enum.PathWaypointAction.Jump then humanoid.Jump = true end
					humanoid:MoveTo(wp.Position)

					if stuckPos == nil or (hrp.Position - stuckPos).Magnitude > 1.2 then
						stuckPos, stuckAt = hrp.Position, now
					elseif now - stuckAt > 1.0 then
						humanoid.Jump = true
						clearPath()
						stuckAt = now
					end
				end
			end
		elseif not isCrushing then
			smoothMove(humanoid, hrp.Position)
		end

		if dist <= 7 and chosen.Parent then
			isCrushing = true
			hardStop(humanoid, hrp)
			lastDest = nil
			task.wait(0.15)

			local crushRemote = getCrushRemote()
			local crushTarget = getCrushTarget(chosen)
			local tries, crushed = 0, false

			while tries < 3 and chosen.Parent and chosen:IsDescendantOf(workspace) and S.Enabled do
				tries = tries + 1
				hardStop(humanoid, hrp)
				if crushRemote then
					pcall(function() crushRemote:FireServer(crushTarget) end)
				end
				pcall(function()
					local pg = LP:FindFirstChildOfClass("PlayerGui")
					local pcp = pg and pg:FindFirstChild("pcprompts")
					local f = pcp and pcp:FindFirstChild("Frame")
					local stomp = f and f:FindFirstChild("pumpkinstomp")
					if stomp and stomp.Visible then
						VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
						task.wait(0.05)
						VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
					end
				end)
				task.wait(0.35)
				hardStop(humanoid, hrp)
				if not chosen.Parent or not chosen:IsDescendantOf(workspace) then
					crushed = true
					break
				end
			end

			isCrushing = false
			if not crushed and chosen.Parent then
				items[chosen] = tick() + 15
			else
				if cache then
					local idx = table.find(cache, chosen)
					if idx then table.remove(cache, idx) end
				end
				resetState()
			end
		end
	end

	task.spawn(function()
		while not unloaded do
			task.wait(0.15)
			if S.Enabled then
				local ok, err = pcall(step)
				if not ok then warn("[" .. HUB_NAME .. "] Auto Pumpkin error: " .. tostring(err)) end
			else
				resetState()
			end
		end
	end)

	function obj:Halt()
		resetState()
		setStatus("OFF")
		local char = LP.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local humanoid = char and char:FindFirstChildOfClass("Humanoid")
		if hrp and humanoid then hardStop(humanoid, hrp) end
	end

	function obj:Shutdown()
		S.Enabled, S.AutoRun = false, false
		releaseShift()
		self:Halt()
	end

	return obj
end)()

State.SkillCheckObj = (function()
	local ReplicatedStorage   = game:GetService("ReplicatedStorage")
	local GuiService          = game:GetService("GuiService")
	local VirtualInputManager = game:GetService("VirtualInputManager")

	local PlayerGui = LP:FindFirstChildOfClass("PlayerGui") or LP:WaitForChild("PlayerGui")

	local DEFAULT_CFG = {
		Enabled = false,
		Mode = "Legit",
		BusyResetDelay = 0.05,
		InstantOffset = 109,
		LegitMinOffset = 102, LegitMaxOffset = 116,
		NormalMinOffset = 116, NormalMaxOffset = 140,
	}

	local Class = {}
	Class.__index = Class

	function Class.new()
		local self = setmetatable({}, Class)
		self.Settings = table.clone(DEFAULT_CFG)
		self._busy = false
		self._randomModeIsNormal = false
		self._heartbeat = nil
		self._kingConn = nil
		self.Stats = { Hits = 0, Missed = 0 }
		return self
	end

	function Class:_getActionButton()
		local mob = PlayerGui:FindFirstChild("Survivor-mob")
		if not mob then return nil end
		local controls = mob:FindFirstChild("Controls")
		if not controls then return nil end
		return controls:FindFirstChild("action") or controls:FindFirstChild("check")
	end

	function Class:_fireAction()
		local btn = self:_getActionButton()

		if btn and btn:IsA("GuiObject") and btn.Visible and type(firesignal) == "function" then
			local ok = pcall(function()
				firesignal(btn.MouseButton1Down)
				task.wait(0.005)
				firesignal(btn.MouseButton1Up)
			end)
			if ok then return true end
		end

		if btn and btn:IsA("GuiObject") and btn.Visible then
			local ok = pcall(function()
				local ap, as = btn.AbsolutePosition, btn.AbsoluteSize
				local inset = GuiService:GetGuiInset()
				local id = 8822 + math.random(1, 9999)
				local x = ap.X + as.X / 2 + inset.X
				local y = ap.Y + as.Y / 2 + inset.Y
				VirtualInputManager:SendTouchEvent(id, 0, x, y)
				task.wait(0.005)
				VirtualInputManager:SendTouchEvent(id, 2, x, y)
			end)
			if ok then return true end
		end

		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
			task.wait(0.005)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
		end)
		return true
	end

	function Class:_inAngleRange(lineRot, goalRot, minOff, maxOff)
		local minA = (goalRot + minOff) % 360
		local maxA = (goalRot + maxOff) % 360
		if maxA < minA then
			return minA <= lineRot or lineRot <= maxA
		end
		return minA <= lineRot and lineRot <= maxA
	end

	function Class:_shouldFireByRange(lineRot, goalRot)
		local S = self.Settings
		local m = S.Mode
		if m == "Normal" then
			return self:_inAngleRange(lineRot, goalRot, S.NormalMinOffset, S.NormalMaxOffset)
		end
		return self:_inAngleRange(lineRot, goalRot, S.LegitMinOffset, S.LegitMaxOffset)
	end

	function Class:_onHeartbeat()
		if not self.Settings.Enabled or self._busy then return end

		local scGui = PlayerGui:FindFirstChild("SkillCheckPromptGui")
		if not scGui then return end

		local check = scGui:FindFirstChild("Check")
		if not check or not check.Visible then
			self._randomModeIsNormal = false
			return
		end

		local line = check:FindFirstChild("Line")
		local goal = check:FindFirstChild("Goal")
		if not line or not goal then return end
		local trapA = check:FindFirstChild("TrapPerfect")
		local trapB = check:FindFirstChild("TrapGoal")
		if (trapA and trapA.Visible) or (trapB and trapB.Visible) then return end

		local fireNow = self:_shouldFireByRange(line.Rotation % 360, goal.Rotation % 360)

		if not fireNow then return end

		self._busy = true
		task.spawn(function()
			local ok = pcall(function() self:_fireAction() end)
			if ok then
				self.Stats.Hits = self.Stats.Hits + 1
			else
				self.Stats.Missed = self.Stats.Missed + 1
			end
			task.wait(self.Settings.BusyResetDelay)
			self._busy = false
		end)
	end

	function Class:_hookKingScourge()
		task.spawn(function()
			pcall(function()
				local remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
				if not remotes then return end
				local perks = remotes:WaitForChild("KillerPerks", 5)
				if not perks then return end
				local ks = perks:WaitForChild("kingscourge", 5)
				if not ks then return end
				local start = ks:WaitForChild("KingScourgeStart", 5)
				if not start then return end

				if self._kingConn then self._kingConn:Disconnect() end
				self._kingConn = start.OnClientEvent:Connect(function() end)
			end)
		end)
	end

	function Class:Start()
		self.Settings.Enabled = true
		if self._heartbeat then return end
		self:_hookKingScourge()
		self._heartbeat = RunService.Heartbeat:Connect(function()
			if unloaded then return end
			pcall(function() self:_onHeartbeat() end)
		end)
	end

	function Class:Stop()
		self.Settings.Enabled = false
		if self._heartbeat then
			self._heartbeat:Disconnect()
			self._heartbeat = nil
		end
		if self._kingConn then
			self._kingConn:Disconnect()
			self._kingConn = nil
		end
		self._busy = false
		self._randomModeIsNormal = false
	end

	function Class:SetMode(mode)
		local valid = { Legit = true, Normal = true }
		if not valid[mode] then return false end
		self.Settings.Mode = mode
		self._randomModeIsNormal = false
		return true
	end

	return Class.new()
end)()


State.SkillCheck = State.SkillCheckObj.Settings
Hooks.SkillCheck = function(s)
	if s.Enabled then State.SkillCheckObj:Start() else State.SkillCheckObj:Stop() end
end

State.AutoPumpkin = State.PumpkinFarmObj.Settings
Hooks.AutoPumpkin = function(s)
	if not s.Enabled then State.PumpkinFarmObj:Halt() end
end

State.CameraSettings = {
	Enabled = false,
	ZoomOn = true, Zoom = 1000,
	FOVOn = false, FOV = 70,
	StiffOn = false, Stiff = 3,
	StretchOn = false, Stretch = 5,
}

State.CameraObj = (function()
	local S = State.CameraSettings
	local M = {
		OriginalFOV = nil, OriginalZoom = nil, OriginalMinZoom = nil,
		StiffnessFocus = nil, Dead = false,
		_fovCam = nil, _fovConn = nil, _bound = false,
	}

	local function wantZoom() return S.Enabled and S.ZoomOn end
	local function wantFOV() return S.Enabled and S.FOVOn end
	local function wantStiff() return S.Enabled and S.StiffOn end
	local function wantStretch() return S.Enabled and S.StretchOn end

	local function applyZoom()
		if wantZoom() then
			if M.OriginalZoom == nil then
				M.OriginalZoom = LP.CameraMaxZoomDistance
				M.OriginalMinZoom = LP.CameraMinZoomDistance
			end
			local z = math.clamp(tonumber(S.Zoom) or 1000, 50, 100000)
			if LP.CameraMaxZoomDistance ~= z then LP.CameraMaxZoomDistance = z end
		elseif M.OriginalZoom ~= nil then
			LP.CameraMaxZoomDistance = M.OriginalZoom
			M.OriginalZoom, M.OriginalMinZoom = nil, nil
		end
	end

	local function applyFOV()
		local cam = workspace.CurrentCamera
		if not cam then return end
		if wantFOV() then
			if M.OriginalFOV == nil then M.OriginalFOV = cam.FieldOfView end
			local f = math.clamp(tonumber(S.FOV) or 70, 1, 120)
			if cam.FieldOfView ~= f then cam.FieldOfView = f end
		elseif M.OriginalFOV ~= nil then
			cam.FieldOfView = M.OriginalFOV
			M.OriginalFOV = nil
		end
	end

	local function watchCamera()
		local cam = workspace.CurrentCamera
		if cam == M._fovCam then return end
		if M._fovConn then pcall(function() M._fovConn:Disconnect() end); M._fovConn = nil end
		M._fovCam = cam
		if cam then
			M._fovConn = cam:GetPropertyChangedSignal("FieldOfView"):Connect(function()
				if M.Dead or not wantFOV() then return end
				pcall(applyFOV)
			end)
		end
	end

	local function stepStiffness(dt)
		if not wantStiff() then M.StiffnessFocus = nil; return end
		local cam = workspace.CurrentCamera
		local char = LP.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not cam or not hum or not root or hum.Health <= 0 then M.StiffnessFocus = nil; return end
		local focus = root.Position
		local smooth = M.StiffnessFocus
		if not smooth or (smooth - focus).Magnitude > 20 then
			M.StiffnessFocus = focus
			return
		end
		local level = math.clamp(tonumber(S.Stiff) or 3, 1, 10)
		local tau = 0.04 + (level ^ 1.6) * 0.03
		smooth = smooth:Lerp(focus, 1 - math.exp(-dt / tau))
		local lag = focus - smooth
		if lag.Magnitude > 10 then smooth = focus - lag.Unit * 10 end
		M.StiffnessFocus = smooth
		local c = cam.CFrame
		cam.CFrame = CFrame.new(smooth + (c.Position - focus)) * (c - c.Position)
	end

	local function stepStretch()
		if not wantStretch() then return end
		local cam = workspace.CurrentCamera
		if not cam then return end
		local lv = math.clamp(tonumber(S.Stretch) or 5, 1, 10)
		local amount = 0.40 + ((lv - 1) / 9) * 0.60
		cam.CFrame = cam.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, amount, 0, 0, 0, 1)
	end

	local function bind()
		if M._bound then return end
		M._bound = true
		pcall(function() RunService:UnbindFromRenderStep("Kinon_CameraStiffness") end)
		pcall(function() RunService:UnbindFromRenderStep("Kinon_CameraStretch") end)
		pcall(function() RunService:UnbindFromRenderStep("Kinon_CameraFOV") end)
		RunService:BindToRenderStep("Kinon_CameraStiffness", Enum.RenderPriority.Last.Value, function(dt)
			if M.Dead then return end
			pcall(stepStiffness, dt)
		end)
		RunService:BindToRenderStep("Kinon_CameraStretch", Enum.RenderPriority.Last.Value + 1, function()
			if M.Dead then return end
			pcall(stepStretch)
		end)
		RunService:BindToRenderStep("Kinon_CameraFOV", Enum.RenderPriority.Last.Value + 2, function()
			if M.Dead then return end
			pcall(watchCamera)
			pcall(applyFOV)
			pcall(applyZoom)
		end)
	end

	function M:Sync()
		if self.Dead then return end
		bind()
		pcall(applyZoom)
		pcall(applyFOV)
		if not wantStiff() then self.StiffnessFocus = nil end
	end

	function M:Destroy()
		self.Dead = true
		S.Enabled = false
		pcall(applyZoom)
		pcall(applyFOV)
		if self._fovConn then pcall(function() self._fovConn:Disconnect() end); self._fovConn = nil end
		pcall(function() RunService:UnbindFromRenderStep("Kinon_CameraStiffness") end)
		pcall(function() RunService:UnbindFromRenderStep("Kinon_CameraStretch") end)
		pcall(function() RunService:UnbindFromRenderStep("Kinon_CameraFOV") end)
		self._bound = false
	end

	return M
end)()

Hooks.CameraSettings = function(s)
	State.CameraObj:Sync()
	if State.HighCamObj then State.HighCamObj:Refresh() end
end

State.PerfObj = (function()
	local Lighting = game:GetService("Lighting")

	local DEFAULT_CFG = {
		Enabled = false,
		FullBright = false, FullBrightValue = 3,
		CustomTime = false, TimeOfDay = 14,
		NoFog = false, NoShadow = false,
		LowGFX = false,
		LowGFX_Textures = false, LowGFX_Particles = false,
		LowGFX_VFX = false, LowGFX_Parts = false, LowGFX_Sky = false,
		RemoveTree = false, RemoveGrass = false, Keywords = "",
		GuardInterval = 1.0,
	}

	local Class = {}
	Class.__index = Class

	function Class.new()
		local self = setmetatable({}, Class)
		self.Settings = table.clone(DEFAULT_CFG)
		self._saved = {}
		self._savedLight = nil
		self._guardThread = nil
		self._streamConn = nil
		self._lightingConn = nil
		self._hidden = {}
		self._hiddenSet = {}
		self._removeConn = nil
		self._removeGen = 0
		self._removeActive = false
		return self
	end

	function Class:_snapshotLighting()
		if self._savedLight then return end
		local atm = Lighting:FindFirstChildOfClass("Atmosphere")
		self._savedLight = {
			Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime,
			FogStart = Lighting.FogStart, FogEnd = Lighting.FogEnd,
			FogColor = Lighting.FogColor, Ambient = Lighting.Ambient,
			OutdoorAmbient = Lighting.OutdoorAmbient, GlobalShadows = Lighting.GlobalShadows,
			Atmosphere = atm and {
				Density = atm.Density, Offset = atm.Offset,
				Glare = atm.Glare, Haze = atm.Haze,
			} or nil,
		}
	end

	function Class:_restoreLighting()
		local s = self._savedLight
		if not s then return end
		pcall(function()
			Lighting.Brightness = s.Brightness
			Lighting.ClockTime = s.ClockTime
			Lighting.FogStart = s.FogStart
			Lighting.FogEnd = s.FogEnd
			Lighting.FogColor = s.FogColor
			Lighting.Ambient = s.Ambient
			Lighting.OutdoorAmbient = s.OutdoorAmbient
			Lighting.GlobalShadows = s.GlobalShadows
			if s.Atmosphere then
				local atm = Lighting:FindFirstChildOfClass("Atmosphere")
				if atm then
					atm.Density = s.Atmosphere.Density
					atm.Offset = s.Atmosphere.Offset
					atm.Glare = s.Atmosphere.Glare
					atm.Haze = s.Atmosphere.Haze
				end
			end
		end)
		self._savedLight = nil
	end

	function Class:_applyLighting()
		local S = self.Settings

		if S.FullBright then
			Lighting.Brightness = S.FullBrightValue
			Lighting.FogEnd = 100000
			Lighting.Ambient = Color3.fromRGB(200, 200, 200)
			Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
		end

		if S.CustomTime then
			Lighting.ClockTime = S.TimeOfDay
		end

		if S.NoFog then
			Lighting.FogStart = 0
			Lighting.FogEnd = 100000
			Lighting.FogColor = Color3.fromRGB(255, 255, 255)
			local atm = Lighting:FindFirstChildOfClass("Atmosphere")
			if atm then
				atm.Density = 0
				atm.Offset = 0
				atm.Glare = 0
				atm.Haze = 0
			end
		end

		if S.NoShadow then
			Lighting.GlobalShadows = false
		elseif self._savedLight then
			Lighting.GlobalShadows = self._savedLight.GlobalShadows
		end
	end

	function Class:_lightingWanted()
		local S = self.Settings
		return S.FullBright or S.NoFog or S.NoShadow or S.CustomTime
	end

	function Class:_startGuard()
		self._guardGen = (self._guardGen or 0) + 1
		local gen = self._guardGen
		if not self._guardThread then self._guardThread = true end

		task.spawn(function()
			while gen == self._guardGen and self.Settings.Enabled and self:_lightingWanted() and not unloaded do
				task.wait(self.Settings.GuardInterval)
				if gen ~= self._guardGen then break end
				pcall(function() self:_applyLighting() end)
			end
		end)

		if self._lightingConn then self._lightingConn:Disconnect() end
		self._lightingConn = Lighting.ChildAdded:Connect(function()
			if not self.Settings.Enabled then return end
			if not self:_lightingWanted() then return end
			task.defer(function() pcall(function() self:_applyLighting() end) end)
		end)
	end

	function Class:_stopGuard()
		self._guardGen = (self._guardGen or 0) + 1
		self._guardThread = nil
		if self._lightingConn then
			self._lightingConn:Disconnect()
			self._lightingConn = nil
		end
	end

	function Class:_save(obj, kind, extra)
		table.insert(self._saved, { obj = obj, kind = kind, extra = extra })
	end

	function Class:_processObject(obj)
		local S = self.Settings
		if not S.LowGFX or not obj then return end
		do
			local m = obj:FindFirstAncestorOfClass("Model")
			if m and m:FindFirstChildOfClass("Humanoid") then return end
		end

		if S.LowGFX_Parts
			and (obj:IsA("BasePart") or obj:IsA("UnionOperation") or obj:IsA("MeshPart"))
			and obj.Material ~= Enum.Material.SmoothPlastic then
			self:_save(obj, "Part", obj.Material)
			obj.Material = Enum.Material.SmoothPlastic
		end

		if S.LowGFX_Particles
			and (obj:IsA("ParticleEmitter") or obj:IsA("Smoke") or obj:IsA("Explosion")
				or obj:IsA("Sparkles") or obj:IsA("Fire"))
			and obj.Enabled ~= false then
			self:_save(obj, "Particle", true)
			obj.Enabled = false
		end

		if S.LowGFX_VFX
			and (obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("DepthOfFieldEffect")
				or obj:IsA("SunRaysEffect") or obj:IsA("ColorCorrectionEffect"))
			and obj.Enabled ~= false then
			self:_save(obj, "VFX", true)
			obj.Enabled = false
		end

		if S.LowGFX_Textures
			and (obj:IsA("Decal") or obj:IsA("Texture"))
			and obj.Texture ~= "" then
			self:_save(obj, "Texture", obj.Texture)
			obj.Texture = ""
		end

		if S.LowGFX_Sky and obj:IsA("Sky") then
			self:_save(obj, "Sky", obj.Parent)
			obj.Parent = nil
		end
	end

	function Class:_applyLowGFX()
		if not self.Settings.LowGFX or self._lowBusy then return end
		self._lowBusy = true

		for _, root in ipairs({ workspace, Lighting }) do
			local desc = root:GetDescendants()
			for i, d in ipairs(desc) do
				if i % 250 == 0 then task.wait() end
				self:_processObject(d)
			end
		end

		if self._streamConn then self._streamConn:Disconnect() end
		self._streamConn = workspace.DescendantAdded:Connect(function(d)
			if not self.Settings.Enabled or not self.Settings.LowGFX then return end
			task.defer(function() self:_processObject(d) end)
		end)
		self._lowBusy = false
	end

	function Class:_restoreLowGFX()
		self._lowBusy = false
		if self._streamConn then
			self._streamConn:Disconnect()
			self._streamConn = nil
		end

		for _, rec in ipairs(self._saved) do
			local obj = rec.obj
			if obj and obj.Parent then
				pcall(function()
					if rec.kind == "Part" then obj.Material = rec.extra
					elseif rec.kind == "Texture" then obj.Texture = rec.extra
					elseif rec.kind == "Particle" or rec.kind == "VFX" then obj.Enabled = rec.extra
					end
				end)
			elseif rec.kind == "Sky" and rec.extra and rec.obj then
				pcall(function() rec.obj.Parent = rec.extra end)
			end
		end
		self._saved = {}
	end

	local TREE_PATTERNS = {
		"%f[%a]trees?%f[%A]", "%f[%a]bush", "%f[%a]shrub", "%f[%a]foliage", "%f[%a]leaf", "%f[%a]leaves",
		"%f[%a]trunk", "%f[%a]branch", "%f[%a]stump", "%f[%a]pine", "%f[%a]oak", "%f[%a]birch",
		"%f[%a]spruce", "%f[%a]palm", "%f[%a]bamboo", "%f[%a]hedge", "%f[%a]cypress", "%f[%a]willow",
		"%f[%a]forest", "%f[%a]twig", "%f[%a]sapling", "%f[%a]canopy", "%f[%a]maple", "%f[%a]cedar",
	}
	local GRASS_PATTERNS = {
		"%f[%a]grass", "%f[%a]weeds?%f[%A]", "%f[%a]fern", "%f[%a]plants?%f[%A]", "%f[%a]vines?%f[%A]",
		"%f[%a]flowers?%f[%A]", "%f[%a]reeds?%f[%A]", "%f[%a]vegetation", "%f[%a]moss", "%f[%a]clover",
		"%f[%a]meadow",
	}
	local EXCLUDE_WORDS = {
		"generator", "pallet", "hook", "gate", "window", "vault", "exit", "chest", "locker", "door",
		"rock", "stone", "boulder", "crate", "barrel", "box", "brick", "wall", "fence", "street",
		"house", "home", "cabin", "building", "shed", "barn", "hut", "tent", "shack", "church", "roof",
		"floor", "stair", "porch", "basement", "garage", "bunker", "tower", "bridge",
		"temple", "mansion", "hospital", "school", "factory", "warehouse",
	}

	local function matchPatterns(name, list)
		local n = string.lower(name)
		for _, pat in ipairs(list) do
			if string.find(n, pat) then return true end
		end
		return false
	end

	local function matchPlain(name, list)
		local n = string.lower(name)
		for _, w in ipairs(list) do
			if string.find(n, w, 1, true) then return true end
		end
		return false
	end

	local function nameHit(self, name)
		return matchPatterns(name, self._tgPatterns) or matchPlain(name, self._tgCustom)
	end

	local function treeModel(self, m)
		local cache = self._tgCache
		local c = cache[m]
		if c == true then return true end
		if c and os.clock() < c then return false end
		local res = false
		if nameHit(self, m.Name) then
			res = true
		else
			local okSize, ext = pcall(function() return m:GetExtentsSize() end)
			if okSize and ext.Magnitude < 70 then
				local kids = m:GetChildren()
				local total, hits = math.min(#kids, 80), 0
				for i = 1, total do
					local kid = kids[i]
					if nameHit(self, kid.Name)
						or (kid:IsA("BasePart") and kid.Material == Enum.Material.LeafyGrass) then
						hits = hits + 1
					end
				end
				if total > 0 and hits >= math.max(1, math.floor(total * 0.3)) then res = true end
			end
		end
		cache[m] = res and true or (os.clock() + 3)
		return res
	end

	local function isFoliage(self, inst)
		local hit = false
		local cur, depth = inst, 0
		while cur and cur ~= workspace and depth < 10 do
			if cur:IsA("Model") then
				if cur:FindFirstChildOfClass("Humanoid") then return false end
				if treeModel(self, cur) then hit = true end
			end
			if cur:IsA("Model") or cur == inst then
				if matchPlain(cur.Name, EXCLUDE_WORDS) then return false end
			end
			if nameHit(self, cur.Name) then hit = true end
			cur = cur.Parent
			depth = depth + 1
		end
		return hit
	end

	local function hideInst(self, inst)
		local saved = self._tgSaved
		if saved[inst] then return end
		local S = self.Settings
		if inst:IsA("BasePart") then
			if inst:IsA("Terrain") then return end
			local sz = inst.Size
			if math.max(sz.X, sz.Z) > 45 and not nameHit(self, inst.Name) then return end
			if S.RemoveGrass and inst.Material == Enum.Material.Grass then
				saved[inst] = { kind = "mat", m = inst.Material }
				inst.Material = Enum.Material.Ground
				return
			end
			local leafy = inst.Material == Enum.Material.LeafyGrass and (S.RemoveGrass or S.RemoveTree)
			if not (leafy or isFoliage(self, inst)) then return end
			saved[inst] = {
				kind = "part", t = inst.Transparency, cs = inst.CastShadow,
				cc = inst.CanCollide, cq = inst.CanQuery, ct = inst.CanTouch,
			}
			inst.Transparency = 1
			inst.CastShadow = false
		elseif inst:IsA("Decal") or inst:IsA("Texture") then
			if not isFoliage(self, inst) then return end
			saved[inst] = { kind = "decal", t = inst.Transparency }
			inst.Transparency = 1
		elseif inst:IsA("ParticleEmitter") or inst:IsA("Beam") or inst:IsA("Trail") then
			if not isFoliage(self, inst) then return end
			saved[inst] = { kind = "fx", e = inst.Enabled }
			inst.Enabled = false
		end
	end

	function Class:_setTerrainGrassHidden(hidden)
		local terrain = workspace:FindFirstChildOfClass("Terrain")
		if not terrain then return end
		local function put(v)
			local ok = pcall(function() terrain.Decoration = v end)
			if (not ok or terrain.Decoration ~= v) and type(sethiddenproperty) == "function" then
				pcall(sethiddenproperty, terrain, "Decoration", v)
			end
		end
		if hidden then
			if self._terrainDecorationOriginal == nil then
				local ok, value = pcall(function() return terrain.Decoration end)
				if ok then self._terrainDecorationOriginal = value end
			end
			put(false)
		elseif self._terrainDecorationOriginal ~= nil then
			put(self._terrainDecorationOriginal)
			self._terrainDecorationOriginal = nil
		end
	end

	function Class:_scanRemove(gen)
		local list = workspace:GetDescendants()
		local t0 = os.clock()
		for _, inst in ipairs(list) do
			if gen ~= self._removeGen or not self._removeActive or unloaded then return end
			pcall(hideInst, self, inst)
			if os.clock() - t0 > 0.004 then
				task.wait()
				t0 = os.clock()
			end
		end
	end

	function Class:_applyRemove()
		local S = self.Settings
		local patterns = {}
		if S.RemoveTree then
			for _, p in ipairs(TREE_PATTERNS) do table.insert(patterns, p) end
		end
		if S.RemoveGrass then
			for _, p in ipairs(GRASS_PATTERNS) do table.insert(patterns, p) end
		end
		local custom = {}
		if #patterns > 0 then
			for part in string.gmatch(string.lower(S.Keywords or ""), "[^,]+") do
				local word = part:match("^%s*(.-)%s*$")
				if word ~= "" then table.insert(custom, word) end
			end
		end
		self._tgPatterns, self._tgCustom = patterns, custom
		self._tgCache = setmetatable({}, { __mode = "k" })
		self._tgSaved = self._tgSaved or {}
		self:_setTerrainGrassHidden(S.RemoveGrass == true)
		if #patterns == 0 then
			self._removeActive = false
			return
		end

		self._removeActive = true
		self._removeGen = (self._removeGen or 0) + 1
		local gen = self._removeGen

		if self._removeConn then self._removeConn:Disconnect() end
		self._removeConn = workspace.DescendantAdded:Connect(function(d)
			if self._removeActive and gen == self._removeGen then
				pcall(hideInst, self, d)
			end
		end)

		task.spawn(function()
			local round = 0
			while S.Enabled and gen == self._removeGen and not unloaded do
				task.wait(2)
				if gen ~= self._removeGen then break end
				if S.RemoveGrass then self:_setTerrainGrassHidden(true) end
				round = round + 1
				if round % 3 == 0 then self:_scanRemove(gen) end
			end
		end)

		self:_scanRemove(gen)
	end

	function Class:_restoreRemove()
		self._removeActive = false
		self._removeGen = (self._removeGen or 0) + 1
		if self._removeConn then
			self._removeConn:Disconnect()
			self._removeConn = nil
		end
		for inst, o in pairs(self._tgSaved or {}) do
			pcall(function()
				if o.kind == "part" then
					inst.Transparency = o.t
					inst.CastShadow = o.cs
					inst.CanCollide = o.cc
					inst.CanQuery = o.cq
					inst.CanTouch = o.ct
				elseif o.kind == "mat" then
					inst.Material = o.m
				elseif o.kind == "decal" then
					inst.Transparency = o.t
				elseif o.kind == "fx" then
					inst.Enabled = o.e
				end
			end)
		end
		self._tgSaved = {}
		self:_setTerrainGrassHidden(false)
	end

	function Class:Refresh()
		if not self.Settings.Enabled then return end
		self:_applyLighting()
		if self.Settings.LowGFX and #self._saved == 0 then
			task.spawn(function() self:_applyLowGFX() end)
		end
	end

	function Class:Start()
		self.Settings.Enabled = true
		self:_snapshotLighting()
		self:_applyLighting()
		self:_startGuard()
		if self.Settings.LowGFX then
			task.spawn(function() self:_applyLowGFX() end)
		end
		task.spawn(function() self:_applyRemove() end)
	end

	function Class:Stop()
		self.Settings.Enabled = false
		self:_stopGuard()
		self:_restoreLowGFX()
		self:_restoreRemove()
		self:_restoreLighting()
	end

	function Class:Set(key, value)
		self.Settings[key] = value
		if not self.Settings.Enabled then return end

		if key == "LowGFX" and value == false then
			self:_restoreLowGFX()
		end
		if key == "FullBright" or key == "NoFog" or key == "NoShadow" or key == "CustomTime" then
			self:_restoreLighting()
		end
		if key == "RemoveTree" or key == "RemoveGrass" or key == "Keywords" then
			self:_restoreRemove()
			task.spawn(function() self:_applyRemove() end)
		end
		if key:sub(1, 7) == "LowGFX_" and self.Settings.LowGFX then
			self:_restoreLowGFX()
			task.spawn(function() self:_applyLowGFX() end)
		end

		if self:_lightingWanted() then
			self:_snapshotLighting()
			self:_startGuard()
		else
			self:_restoreLighting()
			self:_stopGuard()
		end
		self:Refresh()
	end

	return Class.new()
end)()

State.WorldSettings = State.PerfObj.Settings
Hooks.WorldSettings = function(s)
	if s.Enabled then State.PerfObj:Start() else State.PerfObj:Stop() end
end

local Lucide
do
	local ok, res = pcall(function()
		return loadstring(game:HttpGet(
			"https://github.com/latte-soft/lucide-roblox/releases/latest/download/lucide-roblox.luau"
		))()
	end)
	if ok and type(res) == "table" and res.GetAsset then
		Lucide = res
	else
		warn("[" .. HUB_NAME .. "] Failed to load Lucide, icons replaced with first letters.")
	end
end

local WHITE = Color3.new(1, 1, 1)
local C = {
	Panel    = Color3.fromRGB(8, 8, 8),
	Card     = Color3.fromRGB(18, 18, 18),
	Surface  = Color3.fromRGB(34, 34, 34),
	Accent   = Color3.fromRGB(245, 245, 245),
	OnAccent = Color3.fromRGB(10, 10, 10),
	Text     = Color3.fromRGB(245, 245, 245),
	Muted    = Color3.fromRGB(176, 176, 176),
	Sub      = Color3.fromRGB(122, 122, 122),
}

local WIDTH      = 400
local HEADER_H   = 42
local CARD_H     = 52
local OPT_H      = 34
local MAX_BODY_H = 300
local NOTCH_W, NOTCH_H, NOTCH_Y = 212, 38, 8

local function new(class, props, parent)
	local inst = Instance.new(class)
	for k, v in pairs(props or {}) do inst[k] = v end
	inst.Parent = parent
	return inst
end

local function corner(inst, r)
	return new("UICorner", { CornerRadius = UDim.new(0, r) }, inst)
end

local function icon(name, size, color, parent, extra)
	local props = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(size, size),
		BackgroundTransparency = 1,
	}
	for k, v in pairs(extra or {}) do props[k] = v end

	if Lucide then
		local ok, asset = pcall(Lucide.GetAsset, name, 48)
		if not ok or not asset then ok, asset = pcall(Lucide.GetAsset, name) end
		if ok and asset then
			props.Image = asset.Url
			props.ImageRectSize = asset.ImageRectSize
			props.ImageRectOffset = asset.ImageRectOffset
			props.ImageColor3 = color
			return new("ImageLabel", props, parent)
		end
	end

	props.Text = name:sub(1, 1):upper()
	props.TextColor3 = color
	props.Font = Enum.Font.GothamBold
	props.TextSize = size - 2
	return new("TextLabel", props, parent)
end

local function tweenIconColor(inst, color)
	local prop = inst:IsA("ImageLabel") and "ImageColor3" or "TextColor3"
	TweenService:Create(inst, TweenInfo.new(0.18), { [prop] = color }):Play()
end

local function getParent()
	local ok, ui = pcall(function() return gethui and gethui() end)
	if ok and ui then return ui end
	local core = game:GetService("CoreGui")
	local okTest = pcall(function()
		local t = Instance.new("Folder"); t.Parent = core; t:Destroy()
	end)
	if okTest then return core end
	return LocalPlayer:WaitForChild("PlayerGui")
end

local parent = getParent()
for _, p in ipairs({ parent, LocalPlayer:FindFirstChild("PlayerGui") }) do
	local old = p and p:FindFirstChild(GUI_NAME)
	if old then old:Destroy() end
end

local Gui = new("ScreenGui", {
	Name = GUI_NAME,
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	DisplayOrder = 999,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})
if syn and syn.protect_gui then pcall(syn.protect_gui, Gui) end
Gui.Parent = parent

local VD_SkipParryOptions = {
	["106871536134254"] = false,
	["117070354890871"] = false,
	["73681849513551"] = false,
	["100014992013740"] = false,
}
local VD_SkipParryNameToId = {
	["Masked Alex Attack"] = "106871536134254",
	["Masked Alex Lunge"]  = "117070354890871",
	["Hidden Dash"]        = "73681849513551",
	["Abyswalker Slash"]   = "100014992013740",
}

local FloatingParryButtonEnabled = false
local ParryUIRefresh = function() end
local FloatingParryButtonEnabledV2 = false
local ParryUIRefreshV2 = function() end

local ParryCirclePart, ParryCircleAdornment

local function KINON_ShouldPassFaceCheck(killerRoot, playerRoot)
	if Parry.AggressiveMode then
		return true
	end
	if not killerRoot or not playerRoot then
		return false
	end
	local memo = Parry.FaceMemo
	if not memo then
		memo = setmetatable({}, { __mode = "k" })
		Parry.FaceMemo = memo
	end
	local now = os.clock()
	if memo[killerRoot] and now - memo[killerRoot] < 0.6 then
		return true
	end
	local offset = playerRoot.Position - killerRoot.Position
	local dist = offset.Magnitude
	if dist <= 6 then
		return true
	end
	local dir = offset.Unit
	local sensitivity = math.clamp(tonumber(Parry.FaceSensitivity) or 10, 0, 10) / 10
	local maxAngle = 20 + sensitivity * 100
	local cosLimit = math.cos(math.rad(maxAngle))
	local passed = killerRoot.CFrame.LookVector:Dot(dir) >= cosLimit
	if not passed then
		local model = killerRoot.Parent
		local head = model and model:FindFirstChild("Head")
		if head and head:IsA("BasePart") and head.CFrame.LookVector:Dot(dir) >= cosLimit then
			passed = true
		end
	end
	if not passed then
		local vel = killerRoot.AssemblyLinearVelocity
		if vel and vel.Magnitude > 8 then
			local velLimit = math.cos(math.rad(math.min(maxAngle + 20, 150)))
			if vel.Unit:Dot(dir) >= velLimit then passed = true end
		end
	end
	if passed then memo[killerRoot] = now end
	return passed
end

local function KINON_ShouldPassFaceCheckV2(killerRoot, playerRoot)
	if ParryV2.AggressiveMode then
		return true
	end
	if not killerRoot or not playerRoot then
		return false
	end
	local memo = ParryV2.FaceMemo
	if not memo then
		memo = setmetatable({}, { __mode = "k" })
		ParryV2.FaceMemo = memo
	end
	local now = os.clock()
	if memo[killerRoot] and now - memo[killerRoot] < 0.6 then
		return true
	end
	local offset = playerRoot.Position - killerRoot.Position
	local dist = offset.Magnitude
	if dist <= 6 then
		return true
	end
	local dir = offset.Unit
	local sensitivity = math.clamp(tonumber(ParryV2.FaceSensitivity) or 10, 0, 10) / 10
	local maxAngle = 20 + sensitivity * 100
	local cosLimit = math.cos(math.rad(maxAngle))
	local passed = killerRoot.CFrame.LookVector:Dot(dir) >= cosLimit
	if not passed then
		local model = killerRoot.Parent
		local head = model and model:FindFirstChild("Head")
		if head and head:IsA("BasePart") and head.CFrame.LookVector:Dot(dir) >= cosLimit then
			passed = true
		end
	end
	if not passed then
		local vel = killerRoot.AssemblyLinearVelocity
		if vel and vel.Magnitude > 8 then
			local velLimit = math.cos(math.rad(math.min(maxAngle + 20, 150)))
			if vel.Unit:Dot(dir) >= velLimit then passed = true end
		end
	end
	if passed then memo[killerRoot] = now end
	return passed
end

local function KINON_InRangeAndFacingV2(killerRoot, playerRoot, positionOverride, measuredVel)
	if not killerRoot or not playerRoot then return false end
	local targetPosition = positionOverride or killerRoot.Position
	local distance = (targetPosition - playerRoot.Position).Magnitude
	local range = math.clamp(tonumber(ParryV2.Range) or 14, 5, 35)
	if distance > range and not positionOverride then
		local extra = 0
		pcall(function()
			local toPlayer = playerRoot.Position - killerRoot.Position
			if toPlayer.Magnitude > 0.01 then
				local dirToPlayer = toPlayer.Unit

				local killerVel = killerRoot.AssemblyLinearVelocity or Vector3.zero
				if measuredVel and measuredVel.Magnitude > killerVel.Magnitude then killerVel = measuredVel end
				local playerVel = playerRoot.AssemblyLinearVelocity or Vector3.zero
				local closing = math.max(30, killerVel:Dot(dirToPlayer) - playerVel:Dot(dirToPlayer))
				local ping = 0.05
				local okPing, value = pcall(function() return LP:GetNetworkPing() end)
				if okPing and type(value) == "number" then ping = value end

				extra = math.clamp(closing * (ping * 2 + 0.22), 0, 34)
			end
		end)
		range = range + extra
	end
	if distance > range then return false end
	if not KINON_ShouldPassFaceCheckV2(killerRoot, playerRoot) then return false end
	return true
end

local function CreateCustomParryGUI()
	local shared = _G.KINON_AutoParryShortcut
	if type(shared) ~= "table" then shared = {}; _G.KINON_AutoParryShortcut = shared end
	if shared.InputConn then pcall(function() shared.InputConn:Disconnect() end); shared.InputConn = nil end
	if shared.Gui then pcall(function() shared.Gui:Destroy() end); shared.Gui = nil end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "KINON_AutoParryShortcut"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = parent
	shared.Gui = screenGui
	shared.GuiVisible = true

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.Size = UDim2.fromOffset(142, 34)
	frame.Position = shared.Position or UDim2.new(1, -138, 0.35, 0)
	frame.BackgroundColor3 = WHITE
	frame.BackgroundTransparency = 0.02
	frame.Active = true
	frame.BorderSizePixel = 0
	frame.Parent = screenGui
	frame.ZIndex = 150
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 9)

	local frameStroke = Instance.new("UIStroke")
	frameStroke.Name = "UIStroke"
	frameStroke.Color = Color3.fromRGB(90, 90, 90)
	frameStroke.Thickness = 1
	frameStroke.Transparency = 0.12
	frameStroke.Parent = frame

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 34, 34)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8)),
	})
	gradient.Rotation = 90
	gradient.Parent = frame

	local button = Instance.new("TextButton")
	button.Name = "ActionButton"
	button.Size = UDim2.fromScale(1, 1)
	button.BackgroundTransparency = 1
	button.Font = Enum.Font.GothamBold
	button.Text = ""
	button.TextColor3 = C.Text
	button.AutoButtonColor = false
	button.Parent = frame
	button.ZIndex = 151

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(9, 0)
	title.Size = UDim2.new(1, -18, 1, 0)
	title.Font = Enum.Font.GothamBold
	title.Text = "AUTO PARRY   [OFF]"
	title.TextSize = 10
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextYAlignment = Enum.TextYAlignment.Center
	title.TextColor3 = C.Text
	title.Parent = button
	title.ZIndex = 152

	task.defer(function()
		if not frame.Parent then return end
		local camera = workspace.CurrentCamera
		local viewport = camera and camera.ViewportSize or Vector2.new(800, 600)
		local pos, size = frame.Position, frame.AbsoluteSize
		local px = pos.X.Scale * viewport.X + pos.X.Offset
		local py = pos.Y.Scale * viewport.Y + pos.Y.Offset
		frame.Position = UDim2.fromOffset(
			math.clamp(px, 0, math.max(0, viewport.X - size.X)),
			math.clamp(py, 0, math.max(0, viewport.Y - size.Y))
		)
		shared.Position = frame.Position
	end)

	local function refreshButton()
		local enabled = Parry.Enabled == true
		title.Text = enabled and "AUTO PARRY   [ON]" or "AUTO PARRY   [OFF]"
		title.TextColor3 = enabled and WHITE or Color3.fromRGB(170, 170, 170)
		frameStroke.Color = enabled and WHITE or Color3.fromRGB(90, 90, 90)
		frameStroke.Transparency = enabled and 0.02 or 0.12
	end
	shared.RefreshButton = refreshButton

	local function toggleParry()
		if not Parry.Enabled and ParryV2.Enabled then
			refreshButton()
			return
		end
		Parry.Enabled = not Parry.Enabled
		refreshButton()
		ParryUIRefresh()
	end

	task.defer(function()
		if not frame.Parent then return end
		title.Text = "AUTO PARRY   [ON]";  local onWidth  = title.TextBounds.X
		title.Text = "AUTO PARRY   [OFF]"; local offWidth = title.TextBounds.X
		title.Text = Parry.Enabled and "AUTO PARRY   [ON]" or "AUTO PARRY   [OFF]"
		frame.Size = UDim2.fromOffset(
			math.clamp(math.ceil(math.max(onWidth, offWidth)) + 26, 116, 166), 38)
		title.Size = UDim2.new(1, -18, 1, 0)
		refreshButton()
	end)
	refreshButton()

	local pressed, moved = false, false
	local activeInput, startPointer, startX, startY
	local dragThreshold = 6

	local function viewport()
		local camera = workspace.CurrentCamera
		return camera and camera.ViewportSize or Vector2.new(800, 600)
	end
	local function beginDrag(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then return end
		pressed, moved = true, false
		activeInput = input
		startPointer = Vector2.new(input.Position.X, input.Position.Y)
		local vp, pos = viewport(), frame.Position
		startX = pos.X.Scale * vp.X + pos.X.Offset
		startY = pos.Y.Scale * vp.Y + pos.Y.Offset
	end
	local function moveDrag(input)
		if not pressed or not startPointer then return end
		local delta = Vector2.new(input.Position.X, input.Position.Y) - startPointer
		if not moved and delta.Magnitude > dragThreshold then moved = true end
		if not moved then return end
		local vp, size = viewport(), frame.AbsoluteSize
		frame.Position = UDim2.fromOffset(
			math.clamp(startX + delta.X, 0, math.max(0, vp.X - size.X)),
			math.clamp(startY + delta.Y, 0, math.max(0, vp.Y - size.Y))
		)
		shared.Position = frame.Position
	end

	button.InputBegan:Connect(beginDrag)

	shared.InputConn = UserInputService.InputChanged:Connect(function(input)
		if not pressed or not activeInput then return end
		if activeInput.UserInputType == Enum.UserInputType.MouseButton1
			and input.UserInputType == Enum.UserInputType.MouseMovement then
			moveDrag(input)
		elseif activeInput.UserInputType == Enum.UserInputType.Touch and input == activeInput then
			moveDrag(input)
		end
	end)
	shared.TouchMoveConn = UserInputService.TouchMoved:Connect(function(input)
		if pressed and activeInput and activeInput.UserInputType == Enum.UserInputType.Touch
			and input == activeInput then moveDrag(input) end
	end)
	shared.EndConn = UserInputService.InputEnded:Connect(function(input)
		if not pressed or not activeInput then return end
		local matchTouch = activeInput.UserInputType == Enum.UserInputType.Touch
			and input.UserInputType == Enum.UserInputType.Touch and input == activeInput
		local matchMouse = activeInput.UserInputType == Enum.UserInputType.MouseButton1
			and input.UserInputType == Enum.UserInputType.MouseButton1
		if not matchTouch and not matchMouse then return end
		if not moved then toggleParry() end
		pressed, moved, activeInput = false, false, nil
		startPointer = nil
	end)

	screenGui.Enabled = FloatingParryButtonEnabled
	track(screenGui.Destroying:Connect(function()
		if shared.InputConn     then pcall(function() shared.InputConn:Disconnect() end)     end
		if shared.EndConn       then pcall(function() shared.EndConn:Disconnect() end)       end
		if shared.TouchMoveConn then pcall(function() shared.TouchMoveConn:Disconnect() end) end
	end))
	return screenGui
end

local CustomParryGui = CreateCustomParryGUI()

local function CreateCustomParryGUIV2()
	local shared = _G.KINON_AutoParryV2Shortcut
	if type(shared) ~= "table" then shared = {}; _G.KINON_AutoParryV2Shortcut = shared end
	if shared.InputConn then pcall(function() shared.InputConn:Disconnect() end); shared.InputConn = nil end
	if shared.Gui then pcall(function() shared.Gui:Destroy() end); shared.Gui = nil end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "KINON_AutoParryV2Shortcut"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Parent = parent
	shared.Gui = screenGui
	shared.GuiVisible = true

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.Size = UDim2.fromOffset(142, 34)
	frame.Position = shared.Position or UDim2.new(1, -138, 0.44, 0)
	frame.BackgroundColor3 = WHITE
	frame.BackgroundTransparency = 0.02
	frame.Active = true
	frame.BorderSizePixel = 0
	frame.Parent = screenGui
	frame.ZIndex = 150
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 9)

	local frameStroke = Instance.new("UIStroke")
	frameStroke.Name = "UIStroke"
	frameStroke.Color = Color3.fromRGB(90, 90, 90)
	frameStroke.Thickness = 1
	frameStroke.Transparency = 0.12
	frameStroke.Parent = frame

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 34, 34)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8)),
	})
	gradient.Rotation = 90
	gradient.Parent = frame

	local button = Instance.new("TextButton")
	button.Name = "ActionButton"
	button.Size = UDim2.fromScale(1, 1)
	button.BackgroundTransparency = 1
	button.Font = Enum.Font.GothamBold
	button.Text = ""
	button.TextColor3 = C.Text
	button.AutoButtonColor = false
	button.Parent = frame
	button.ZIndex = 151

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(9, 0)
	title.Size = UDim2.new(1, -18, 1, 0)
	title.Font = Enum.Font.GothamBold
	title.Text = "AUTO PARRY V2   [OFF]"
	title.TextSize = 10
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.TextYAlignment = Enum.TextYAlignment.Center
	title.TextColor3 = C.Text
	title.Parent = button
	title.ZIndex = 152

	task.defer(function()
		if not frame.Parent then return end
		local camera = workspace.CurrentCamera
		local viewport = camera and camera.ViewportSize or Vector2.new(800, 600)
		local pos, size = frame.Position, frame.AbsoluteSize
		local px = pos.X.Scale * viewport.X + pos.X.Offset
		local py = pos.Y.Scale * viewport.Y + pos.Y.Offset
		frame.Position = UDim2.fromOffset(
			math.clamp(px, 0, math.max(0, viewport.X - size.X)),
			math.clamp(py, 0, math.max(0, viewport.Y - size.Y))
		)
		shared.Position = frame.Position
	end)

	local function refreshButton()
		local enabled = ParryV2.Enabled == true
		title.Text = enabled and "AUTO PARRY V2   [ON]" or "AUTO PARRY V2   [OFF]"
		title.TextColor3 = enabled and WHITE or Color3.fromRGB(170, 170, 170)
		frameStroke.Color = enabled and WHITE or Color3.fromRGB(90, 90, 90)
		frameStroke.Transparency = enabled and 0.02 or 0.12
	end
	shared.RefreshButton = refreshButton

	local function toggleParryV2()
		if Parry.Enabled then
			Parry.Enabled = false
			local v1 = _G.KINON_AutoParryShortcut
			if type(v1) == "table" and type(v1.RefreshButton) == "function" then pcall(v1.RefreshButton) end
			ParryUIRefresh()
		end
		ParryV2.Enabled = not ParryV2.Enabled
		refreshButton()
		ParryUIRefreshV2()
	end

	task.defer(function()
		if not frame.Parent then return end
		title.Text = "AUTO PARRY V2   [ON]";  local onWidth  = title.TextBounds.X
		title.Text = "AUTO PARRY V2   [OFF]"; local offWidth = title.TextBounds.X
		title.Text = ParryV2.Enabled and "AUTO PARRY V2   [ON]" or "AUTO PARRY V2   [OFF]"
		frame.Size = UDim2.fromOffset(
			math.clamp(math.ceil(math.max(onWidth, offWidth)) + 26, 116, 166), 38)
		title.Size = UDim2.new(1, -18, 1, 0)
		refreshButton()
	end)
	refreshButton()

	local pressed, moved = false, false
	local activeInput, startPointer, startX, startY
	local dragThreshold = 6

	local function viewport()
		local camera = workspace.CurrentCamera
		return camera and camera.ViewportSize or Vector2.new(800, 600)
	end
	local function beginDrag(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then return end
		pressed, moved = true, false
		activeInput = input
		startPointer = Vector2.new(input.Position.X, input.Position.Y)
		local vp, pos = viewport(), frame.Position
		startX = pos.X.Scale * vp.X + pos.X.Offset
		startY = pos.Y.Scale * vp.Y + pos.Y.Offset
	end
	local function moveDrag(input)
		if not pressed or not startPointer then return end
		local delta = Vector2.new(input.Position.X, input.Position.Y) - startPointer
		if not moved and delta.Magnitude > dragThreshold then moved = true end
		if not moved then return end
		local vp, size = viewport(), frame.AbsoluteSize
		frame.Position = UDim2.fromOffset(
			math.clamp(startX + delta.X, 0, math.max(0, vp.X - size.X)),
			math.clamp(startY + delta.Y, 0, math.max(0, vp.Y - size.Y))
		)
		shared.Position = frame.Position
	end

	button.InputBegan:Connect(beginDrag)

	shared.InputConn = UserInputService.InputChanged:Connect(function(input)
		if not pressed or not activeInput then return end
		if activeInput.UserInputType == Enum.UserInputType.MouseButton1
			and input.UserInputType == Enum.UserInputType.MouseMovement then
			moveDrag(input)
		elseif activeInput.UserInputType == Enum.UserInputType.Touch and input == activeInput then
			moveDrag(input)
		end
	end)
	shared.TouchMoveConn = UserInputService.TouchMoved:Connect(function(input)
		if pressed and activeInput and activeInput.UserInputType == Enum.UserInputType.Touch
			and input == activeInput then moveDrag(input) end
	end)
	shared.EndConn = UserInputService.InputEnded:Connect(function(input)
		if not pressed or not activeInput then return end
		local matchTouch = activeInput.UserInputType == Enum.UserInputType.Touch
			and input.UserInputType == Enum.UserInputType.Touch and input == activeInput
		local matchMouse = activeInput.UserInputType == Enum.UserInputType.MouseButton1
			and input.UserInputType == Enum.UserInputType.MouseButton1
		if not matchTouch and not matchMouse then return end
		if not moved then toggleParryV2() end
		pressed, moved, activeInput = false, false, nil
		startPointer = nil
	end)

	screenGui.Enabled = FloatingParryButtonEnabledV2
	track(screenGui.Destroying:Connect(function()
		if shared.InputConn     then pcall(function() shared.InputConn:Disconnect() end)     end
		if shared.EndConn       then pcall(function() shared.EndConn:Disconnect() end)       end
		if shared.TouchMoveConn then pcall(function() shared.TouchMoveConn:Disconnect() end) end
	end))
	return screenGui
end

local CustomParryGuiV2 = CreateCustomParryGUIV2()

if CustomParryGui then CustomParryGui.Enabled = false end
Parry.ShouldPassFaceCheck = KINON_ShouldPassFaceCheck

local KINON_ParryEngine = {
	LastAttempt = 0,
	LastSuccess = 0,
	SeenAnimators = setmetatable({}, { __mode = "k" }),
	SeenTools = setmetatable({}, { __mode = "k" }),
	SeenModels = setmetatable({}, { __mode = "k" }),
	ActiveClient = nil,
	ClientModule = nil,
	ClientHooked = false,
	WarnedFallback = false,
	WarnedMissingTool = false,
}

local KINON_ParryAnimationIds = {
	["71008020992570"] = true, ["72742711718023"] = true, ["72908958549833"] = true, ["73923929500477"] = true,
	["74968262036854"] = true, ["75857500533792"] = true, ["76385865186777"] = true, ["76503974441748"] = true,
	["77081789642514"] = true, ["78432063483146"] = true, ["78935059863801"] = true, ["79935565590141"] = true,
	["79965656177566"] = true, ["80411309607666"] = true, ["82666958311998"] = true, ["83873880822918"] = true,
	["84525330720658"] = true, ["85030641905220"] = true, ["89185525343404"] = true, ["92125118598365"] = true,
	["92362656727126"] = true, ["92554564590253"] = true, ["96839438835309"] = true, ["99472251587670"] = true,
	["102055678391920"] = true, ["104689417033027"] = true, ["105374834496520"] = true, ["109402730355822"] = true,
	["111920872708571"] = true, ["112166042383605"] = true, ["112633191985365"] = true, ["112840768179724"] = true,
	["113255068724446"] = true, ["115244153053858"] = true, ["117042998468241"] = true, ["117207742458428"] = true,
	["118907603246885"] = true, ["119752564209631"] = true, ["121216847022485"] = true, ["121571390309073"] = true,
	["122812055447896"] = true, ["123047897844134"] = true, ["123812278891591"] = true, ["124706657239027"] = true,
	["124735239320776"] = true, ["125224839697689"] = true, ["126081405469607"] = true, ["126497551689502"] = true,
	["126527634689050"] = true, ["126626340093785"] = true, ["126751859125353"] = true, ["128241974219045"] = true,
	["129784271201071"] = true, ["130012819736632"] = true, ["130585295123651"] = true, ["130593238885843"] = true,
	["132817836308238"] = true, ["133002120549396"] = true, ["133881825716964"] = true, ["133963973694098"] = true,
	["134838390519433"] = true, ["135002183282873"] = true, ["135403091566760"] = true, ["135727476735024"] = true,
	["136365031119137"] = true, ["137504605181913"] = true, ["137688077908355"] = true, ["137795837089724"] = true,
	["137846825408335"] = true, ["138045669415653"] = true, ["138720291317243"] = true, ["117187218825161"] = true,
	["105221485497534"] = true, ["86868198964957"] = true, ["134758728973154"] = true, ["132636403911470"] = true,
	["125350153877085"] = true, ["2874840706"] = true, ["110850539331763"] = true, ["72042024"] = true,
	["139369275981139"] = true, ["113691709436161"] = true, ["129626174716003"] = true, ["75618342544502"] = true,
	["93902163029544"] = true, ["79310600168078"] = true, ["104540716539347"] = true, ["101636125032002"] = true,
	["125430111937587"] = true, ["81963230963908"] = true, ["84926129581106"] = true, ["83333467665074"] = true,
	["127417297154354"] = true,
}

local VD_NO_PARRY_ANIMS = {
	["101443662521580"] = "Veil Spear Throw 1",
	["127622545856523"] = "Veil Spear Throw 2",
	["76744850905644"]  = "Myers Grab",
	["71001061734896"]  = "Take Out Spear",
	["129669521834246"] = "Put Away Spear",
}

local VD_OPTIONAL_ATTACK_ANIMS = {
	["106871536134254"] = { Name = "Masked Alex Attack", Default = true },
	["117070354890871"] = { Name = "Masked Alex Lunge", Default = true },
	["73681849513551"]  = { Name = "Hidden Dash", Default = true },
	["100014992013740"] = { Name = "Abyswalker Slash", Default = true },
}

local KINON_IgnoredParryAnimationIds = {
	["86266790353635"] = true, ["84093948968516"] = true,
	["102746205979822"] = true, ["99210996402874"] = true,
	["121108316060822"] = true, ["109928123357793"] = true,
	["110466971021611"] = true, ["110355011987939"] = true,
	["135181748009911"] = true, ["77210283630654"] = true,
	["108211560927158"] = true, ["104192089592095"] = true,
	["109257644640676"] = true, ["98163597193511"] = true,
	["111223305405046"] = true, ["75258958842388"] = true,
	["93136435416899"] = true, ["92098503722633"] = true,
	["117886494230451"] = true,
}

local function KINON_AnimationId(animTrack)
	local id = ""
	pcall(function() id = tostring(animTrack.Animation.AnimationId):match("%d+") or "" end)
	return id
end

local function KINON_IsKillerModel(model)
	if not model or not model:IsA("Model") or model == LP.Character then return false end
	if not model:FindFirstChildOfClass("Humanoid") or not model:FindFirstChild("HumanoidRootPart") then return false end
	local player = Players:GetPlayerFromCharacter(model)
	if player == LP then return false end

	local function flagged(instance)
		return instance and (instance:GetAttribute("Role") == "Killer"
			or instance:GetAttribute("IsKiller") == true)
	end
	if flagged(model) or flagged(player) then return true end

	if player and player.Team then
		local teamName = player.Team.Name:lower()
		if teamName:find("killer") or teamName:find("slasher")
			or teamName:find("hunter") or teamName:find("monster") then return true end
		if not teamName:find("survivor") and not teamName:find("lobby")
			and not teamName:find("spectat") then return true end
	end

	local killersFolder = workspace:FindFirstChild("Killers")
	if killersFolder and model:IsDescendantOf(killersFolder) then return true end

	local name = model.Name:lower()
	for _, word in ipairs({"zombie","slasher","monster","killer","veil","stalker","masked","abysswalker","hunter"}) do
		if name:find(word, 1, true) then return true end
	end
	return false
end

local function KINON_GetKillerModels()
	local result, seen = {}, {}
	local function add(model)
		if model and not seen[model] and KINON_IsKillerModel(model) then
			seen[model] = true
			table.insert(result, model)
		end
	end
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LP then add(player.Character) end
	end
	local killersFolder = workspace:FindFirstChild("Killers")
	if killersFolder then
		for _, obj in ipairs(killersFolder:GetDescendants()) do
			if obj:IsA("Model") then add(obj) end
		end
	end
	for _, obj in ipairs(workspace:GetChildren()) do
		if obj:IsA("Model") then add(obj) end
	end
	return result
end

local function KINON_GetParryTool()
	local character = LP.Character
	local backpack = LP:FindFirstChildOfClass("Backpack")
	local equipped = tostring(LP:GetAttribute("EquippedItem") or ""):lower()
	if equipped:find("parry", 1, true) or equipped:find("dagger", 1, true) then
		if character then
			local tool = character:FindFirstChild("Parrying Dagger") or character:FindFirstChild("Parry Dagger")
			if tool then return tool end
		end
		if backpack then
			local tool = backpack:FindFirstChild("Parrying Dagger") or backpack:FindFirstChild("Parry Dagger")
			if tool then return tool end
		end
		return true
	end
	local containers = {}
	if character then table.insert(containers, character) end
	if backpack then table.insert(containers, backpack) end
	for _, container in ipairs(containers) do
		for _, child in ipairs(container:GetChildren()) do
			local name = child.Name:lower()
			if name:find("parry", 1, true) or name:find("dagger", 1, true) then return child end
		end
	end
	return nil
end

local function KINON_FindParryClient()
	local function usable(value)
		return type(value) == "table" and type(value.Parry) == "function"
			and value.tool and value.tool.Parent
	end
	if usable(KINON_ParryEngine.ActiveClient) then return KINON_ParryEngine.ActiveClient end
	if usable(_G.KINON_ActiveParryClient) then
		KINON_ParryEngine.ActiveClient = _G.KINON_ActiveParryClient
		return KINON_ParryEngine.ActiveClient
	end
	if usable(_G.VD_ActiveParryClient) then
		KINON_ParryEngine.ActiveClient = _G.VD_ActiveParryClient
		return KINON_ParryEngine.ActiveClient
	end

	if not KINON_ParryEngine.ClientModule then
		pcall(function()
			local replicated = game:GetService("ReplicatedStorage")
			local modules = replicated:FindFirstChild("Modules")
			local items = modules and modules:FindFirstChild("Items")
			local dagger = items and items:FindFirstChild("ParryingDagger")
			local moduleScript = dagger and dagger:FindFirstChild("ParryClient")
			if moduleScript then KINON_ParryEngine.ClientModule = require(moduleScript) end
		end)
	end

	local moduleTable = KINON_ParryEngine.ClientModule
	if type(moduleTable) == "table" and not KINON_ParryEngine.ClientHooked then
		KINON_ParryEngine.ClientHooked = true
		pcall(function()
			local originalNew = moduleTable.new
			if type(originalNew) == "function" then
				moduleTable.new = function(...)
					local client = originalNew(...)
					KINON_ParryEngine.ActiveClient = client
					_G.KINON_ActiveParryClient = client
					_G.VD_ActiveParryClient = client
					return client
				end
			end
		end)
	end

	if typeof(getgc) == "function" and tick() - (KINON_ParryEngine.LastGcScan or 0) > 3 then
		KINON_ParryEngine.LastGcScan = tick()
		local ok, objects = pcall(function() return getgc(true) end)
		if ok and type(objects) == "table" then
			for _, object in ipairs(objects) do
				if usable(object) then
					local meta = getmetatable(object)
					if meta == moduleTable or rawget(object, "parryEvent")
						or rawget(object, "daggerFolder") or rawget(object, "tool") then
						KINON_ParryEngine.ActiveClient = object
						_G.KINON_ActiveParryClient = object
						_G.VD_ActiveParryClient = object
						return object
					end
				end
			end
		end
	end
	return nil
end

task.spawn(function()
	while not unloaded do
		if Parry.Enabled or ParryV2.Enabled then pcall(KINON_FindParryClient) end
		task.wait(1)
	end
end)

local function KINON_TryFallbackParry()
	local fired = false
	pcall(function()
		local playerGui = LP:FindFirstChildOfClass("PlayerGui")
		local survivorGui = playerGui and (playerGui:FindFirstChild("Survivor-mob") or playerGui:FindFirstChild("Survivor"))
		local controls = survivorGui and survivorGui:FindFirstChild("Controls")
		local actionButton = controls and (controls:FindFirstChild("Gui-mob") or controls:FindFirstChild("action"))
		if actionButton then
			if typeof(firesignal) == "function" then
				pcall(function() firesignal(actionButton.MouseButton1Down) end)
				task.defer(function() pcall(function() firesignal(actionButton.MouseButton1Up) end) end)
				fired = true
			end
			if typeof(getconnections) == "function" then
				local okDown, downLinks = pcall(function() return getconnections(actionButton.MouseButton1Down) end)
				if okDown and type(downLinks) == "table" then
					for _, link in ipairs(downLinks) do pcall(function() link:Fire(); fired = true end) end
				end
				local okUp, upLinks = pcall(function() return getconnections(actionButton.MouseButton1Up) end)
				if okUp and type(upLinks) == "table" then
					task.defer(function()
						for _, link in ipairs(upLinks) do pcall(function() link:Fire() end) end
					end)
				end
			end
		end
	end)

	local tool = KINON_GetParryTool()
	if typeof(tool) == "Instance" and tool:IsA("Tool") then
		pcall(function() tool:Activate(); fired = true end)
	end

	pcall(function()
		local character = LP.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
			local toolObj = typeof(tool) == "Instance" and tool or nil
			local animId = toolObj and toolObj:GetAttribute("useanim") or "109133187196613"
			local numericId = tostring(animId):match("%d+")
			if numericId and numericId ~= "" then
				local animation = Instance.new("Animation")
				animation.AnimationId = "rbxassetid://" .. numericId
				local animTrack = animator:LoadAnimation(animation)
				animTrack.Priority = Enum.AnimationPriority.Action
				animTrack:Play()
				fired = true
			end
		end
	end)
	return fired
end

local KINON_Busy = { HoldingPrompt = false, HoldSince = 0, UntilTime = 0 }
do
	local PPS = game:GetService("ProximityPromptService")
	track(PPS.PromptButtonHoldBegan:Connect(function(_, player)
		if player == LP then KINON_Busy.HoldingPrompt = true; KINON_Busy.HoldSince = tick() end
	end))
	track(PPS.PromptButtonHoldEnded:Connect(function(_, player)
		if player == LP then
			KINON_Busy.HoldingPrompt = false
			KINON_Busy.UntilTime = math.max(KINON_Busy.UntilTime, tick() + 0.35)
		end
	end))
	track(PPS.PromptTriggered:Connect(function(_, player)
		if player == LP then
			KINON_Busy.HoldingPrompt = false
			KINON_Busy.UntilTime = tick() + 1.2
		end
	end))
end

local KINON_BusyAttrPatterns = {
	"repair","generator","unhook","hooking","rescu","gate","vault","pallet","dropping","interact","opening",
}
local KINON_BusyAnimKeywords = {
	"repair","generator","unhook","rescue","hook","gate","exit","vault","window","pallet","drop",
}

local function KINON_AttrBusy(instance)
	local ok, attrs = pcall(function() return instance:GetAttributes() end)
	if not ok or type(attrs) ~= "table" then return false end
	for name, value in pairs(attrs) do
		if value == true then
			local n = string.lower(tostring(name))
			if not (n:find("^can") or n:find("^has") or n:find("^allow")) then
				for _, pattern in ipairs(KINON_BusyAttrPatterns) do
					if n:find(pattern, 1, true) then return true end
				end
			end
		end
	end
	return false
end

local function KINON_IsBusyInteracting()
	local now = tick()
	if now < KINON_Busy.UntilTime then return true end
	if KINON_Busy.HoldingPrompt and now - KINON_Busy.HoldSince < 15 then return true end
	local character = LP.Character
	if not character then return false end
	if KINON_AttrBusy(character) or KINON_AttrBusy(LP) then return true end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	if animator then
		local ok, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
		if ok and tracks then
			for _, playing in ipairs(tracks) do
				local label = ""
				pcall(function()
					local pr = playing.Priority
					if pr == Enum.AnimationPriority.Action or pr == Enum.AnimationPriority.Action2
						or pr == Enum.AnimationPriority.Action3 or pr == Enum.AnimationPriority.Action4 then
						label = string.lower(tostring(playing.Name) .. " "
							.. tostring(playing.Animation and playing.Animation.Name or ""))
					end
				end)
				if label ~= "" and not label:find("parry", 1, true) and not label:find("dagger", 1, true) then
					for _, keyword in ipairs(KINON_BusyAnimKeywords) do
						if label:find(keyword, 1, true) then return true end
					end
				end
			end
		end
	end
	return false
end

local function KINON_TryParry(reason, killerRoot)
	if unloaded or not (Parry.Enabled or ParryV2.Enabled) then return false end
	if tick() - KINON_ParryEngine.LastAttempt < 0.012 then return false end
	if not KINON_GetParryTool() then return false end
	if KINON_IsBusyInteracting() then return false end

	local character = LP.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if not character or not humanoid or humanoid.Health <= 0 then return false end
	if character:GetAttribute("Knocked") == true or LP:GetAttribute("Knocked") == true
		or character:GetAttribute("IsHooked") == true or LP:GetAttribute("IsHooked") == true
		or character:GetAttribute("IsCarried") == true or LP:GetAttribute("IsCarried") == true
		or character:GetAttribute("IsDead") == true or LP:GetAttribute("IsDead") == true then
		return false
	end

	local client = KINON_FindParryClient()
	if client and (client.isParryOnCooldown or client.isParryResolving) then return false end
	if tick() - (KINON_ParryEngine.LastSuccess or 0) < 0.10 then return false end

	KINON_ParryEngine.LastAttempt = tick()

	if client then
		local ok, result = pcall(function()
			if client.character ~= character and type(client._bindCharacter) == "function" then
				pcall(function() client:_bindCharacter(character) end)
			end
			return client:Parry()
		end)
		if ok and result ~= false then
			KINON_ParryEngine.LastSuccess = tick()
			return true
		end
		return false
	end

	local fallbackOk, fallbackFired = pcall(KINON_TryFallbackParry)
	if fallbackOk and fallbackFired then
		KINON_ParryEngine.LastSuccess = tick()
		if not KINON_ParryEngine.WarnedFallback then
			KINON_ParryEngine.WarnedFallback = true
			warn("[KINON Auto Parry] Using GUI/tool fallback; ParryClient instance was not available yet.")
		end
		return true
	end
	if not KINON_ParryEngine.WarnedFallback then
		KINON_ParryEngine.WarnedFallback = true
		warn("[KINON Auto Parry] Attack detected, but no active ParryClient or usable game parry button was found.")
	end
	return false
end

local function KINON_InRangeAndFacing(killerRoot, playerRoot)
	if not killerRoot or not playerRoot then return false end
	local distance = (killerRoot.Position - playerRoot.Position).Magnitude
	local range = math.clamp(tonumber(Parry.Range) or 14, 5, 35)
	if distance > range then return false end
	if not KINON_ShouldPassFaceCheck(killerRoot, playerRoot) then return false end
	return true
end

local function KINON_HandleAttackTrack(animTrack, model)
	if not (Parry.Enabled or ParryV2.Enabled) or not animTrack or not model or not model.Parent then return end
	local animationId = KINON_AnimationId(animTrack)
	if animationId == "" or KINON_IgnoredParryAnimationIds[animationId] then return end
	if VD_NO_PARRY_ANIMS[animationId] then return end

	local modelName = string.lower(tostring(model.Name or ""))
	if modelName:find("veil", 1, true) then
		local trackName = ""
		pcall(function() trackName = string.lower(tostring(animTrack.Name or "")) end)
		local animationName = ""
		pcall(function() animationName = string.lower(tostring(animTrack.Animation and animTrack.Animation.Name or "")) end)
		local label = trackName .. " " .. animationName
		if label:find("spear", 1, true) or label:find("throw", 1, true)
			or label:find("charge", 1, true) then return end
	end

	local optionalAttack = VD_OPTIONAL_ATTACK_ANIMS[animationId]
	if optionalAttack and VD_SkipParryOptions[animationId] == true then return end
	local knownAttack = KINON_ParryAnimationIds[animationId] == true
		or (optionalAttack ~= nil and optionalAttack.Default == true)
	if not knownAttack then return end

	local okTime, timePosition = pcall(function() return animTrack.TimePosition or 0 end)
	if okTime and timePosition > 0.45 then return end

	task.spawn(function()
		local startTime = tick()
		local lastPos, lastT, vel
		repeat
			if unloaded or not (Parry.Enabled or ParryV2.Enabled) or not animTrack.IsPlaying then break end
			local currentTime = 0
			pcall(function() currentTime = animTrack.TimePosition or 0 end)
			if currentTime > 0.45 then break end
			local playerRoot = getRoot()
			local killerRoot = model:FindFirstChild("HumanoidRootPart")
			if killerRoot then
				local nowT = tick()
				local pos = killerRoot.Position
				if lastPos and nowT > lastT then
					local v = (pos - lastPos) / (nowT - lastT)
					vel = vel and (vel * 0.5 + v * 0.5) or v
				end
				lastPos, lastT = pos, nowT
			end
			if playerRoot and killerRoot then
				local pass = false
				if Parry.Enabled then
					pass = KINON_InRangeAndFacing(killerRoot, playerRoot)
				elseif ParryV2.Enabled then
					pass = KINON_InRangeAndFacingV2(killerRoot, playerRoot, nil, vel)
				end
				if pass and KINON_TryParry("Animation " .. animationId, killerRoot) then return end
			end
			RunService.Heartbeat:Wait()
		until tick() - startTime >= 0.45
	end)
end

local function KINON_HookAnimator(animator, model)
	if not animator or KINON_ParryEngine.SeenAnimators[animator] then return end
	KINON_ParryEngine.SeenAnimators[animator] = true
	local ok, connection = pcall(function()
		return animator.AnimationPlayed:Connect(function(animTrack)
			pcall(KINON_HandleAttackTrack, animTrack, model)
		end)
	end)
	if ok and connection then track(connection) end
	pcall(function()
		for _, playingTrack in ipairs(animator:GetPlayingAnimationTracks()) do
			task.spawn(KINON_HandleAttackTrack, playingTrack, model)
		end
	end)
end

local function KINON_HookKillerModel(model)
	if not model or KINON_ParryEngine.SeenModels[model] then return end
	KINON_ParryEngine.SeenModels[model] = true
	local function hookChild(child)
		if child:IsA("Humanoid") then
			local animator = child:FindFirstChildOfClass("Animator")
			if animator then KINON_HookAnimator(animator, model) end
			track(child.ChildAdded:Connect(function(newChild)
				if newChild:IsA("Animator") then KINON_HookAnimator(newChild, model) end
			end))
		end
	end
	for _, child in ipairs(model:GetChildren()) do pcall(hookChild, child) end
	track(model.ChildAdded:Connect(function(child) pcall(hookChild, child) end))
end

track(Players.PlayerAdded:Connect(function(player)
	if player == LP then return end
	track(player.CharacterAdded:Connect(function(character)
		task.defer(function()
			if character and KINON_IsKillerModel(character) then KINON_HookKillerModel(character) end
		end)
	end))
end))
for _, player in ipairs(Players:GetPlayers()) do
	if player ~= LP then
		track(player.CharacterAdded:Connect(function(character)
			task.defer(function()
				if character and KINON_IsKillerModel(character) then KINON_HookKillerModel(character) end
			end)
		end))
	end
end

task.spawn(function()
	while not unloaded do
		if Parry.Enabled or ParryV2.Enabled then
			local tool = KINON_GetParryTool()
			if LP.Character and not tool and not KINON_ParryEngine.WarnedMissingTool then
				KINON_ParryEngine.WarnedMissingTool = true
			elseif tool then
				KINON_ParryEngine.WarnedMissingTool = false
			end
			local playerRoot = getRoot()
			for _, model in ipairs(KINON_GetKillerModels()) do
				pcall(KINON_HookKillerModel, model)
				local killerRoot = model:FindFirstChild("HumanoidRootPart")
				if playerRoot and killerRoot and (killerRoot.Position - playerRoot.Position).Magnitude <= 70 then
					if typeof(tool) == "Instance" and tool:IsA("Tool") and tool.Parent ~= LP.Character then
						local humanoid = getHumanoid()
						if humanoid then pcall(function() humanoid:EquipTool(tool) end) end
					end
					local killerHumanoid = model:FindFirstChildOfClass("Humanoid")
					local animator = killerHumanoid and killerHumanoid:FindFirstChildOfClass("Animator")
					if animator then KINON_HookAnimator(animator, model) end
				end
			end
			task.wait(0.1)
		else
			task.wait(0.35)
		end
	end
end)

local function clearParryCircle()
	if ParryCircleAdornment then ParryCircleAdornment:Destroy(); ParryCircleAdornment = nil end
	if ParryCirclePart then ParryCirclePart:Destroy(); ParryCirclePart = nil end
end

track(RunService.Heartbeat:Connect(function()
	local character = LP.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	local activeParry
	if Parry.Enabled and Parry.CircleVisible then
		activeParry = Parry
	elseif ParryV2.Enabled and ParryV2.CircleVisible then
		activeParry = ParryV2
	end
	if not activeParry or not root then
		clearParryCircle()
		return
	end
	if not ParryCirclePart or not ParryCirclePart.Parent then
		ParryCirclePart = Instance.new("Part")
		ParryCirclePart.Name = "KINON_ParryCircleAnchor"
		ParryCirclePart.Anchored = true
		ParryCirclePart.CanCollide = false
		ParryCirclePart.CanTouch = false
		ParryCirclePart.CanQuery = false
		ParryCirclePart.Transparency = 1
		ParryCirclePart.Size = Vector3.new(0.1, 0.1, 0.1)
		ParryCirclePart.Parent = workspace

		ParryCircleAdornment = Instance.new("CylinderHandleAdornment")
		ParryCircleAdornment.Name = "KINON_ParryCircle"
		ParryCircleAdornment.Adornee = ParryCirclePart
		ParryCircleAdornment.Height = 0.05
		ParryCircleAdornment.AlwaysOnTop = false
		ParryCircleAdornment.ZIndex = 0
		ParryCircleAdornment.Parent = ParryCirclePart
	end
	local radius = math.clamp(tonumber(activeParry.Range) or 14, 5, 35)
	ParryCirclePart.CFrame = CFrame.new(root.Position + Vector3.new(0, -2.8, 0))
	ParryCircleAdornment.CFrame = CFrame.Angles(math.rad(90), 0, 0)
	ParryCircleAdornment.Radius = radius
	ParryCircleAdornment.InnerRadius = math.max(0.1, radius - 0.12)
	ParryCircleAdornment.Color3 = activeParry.RangeColor
	ParryCircleAdornment.Transparency = 0.15
end))

local Main = new("CanvasGroup", {
	Name = "Main",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(WIDTH, HEADER_H + 4 * CARD_H + 3 * 6 + 16),
	BackgroundColor3 = C.Panel,
	BackgroundTransparency = 0.04,
	GroupTransparency = 0,
}, Gui)
corner(Main, 16)
local mainStroke = new("UIStroke", { Color = WHITE, Transparency = 0.6, Thickness = 1 }, Main)
new("UIGradient", {
	Color = ColorSequence.new(WHITE, Color3.fromRGB(60, 60, 60)),
	Rotation = 45,
}, mainStroke)

local updateMainHeight
local Scale = new("UIScale", {}, Main)
local function updateScale()
	local cam = workspace.CurrentCamera
	if not cam then return end
	local vp = cam.ViewportSize
	Scale.Scale = math.clamp(
		math.min((vp.X - 24) / WIDTH, (vp.Y - 24) / (HEADER_H + MAX_BODY_H)),
		0.5, 0.9
	)
	if updateMainHeight then updateMainHeight() end
end
updateScale()
if workspace.CurrentCamera then
	track(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale))
end

local Header = new("Frame", {
	Name = "Header",
	Size = UDim2.new(1, 0, 0, HEADER_H),
	BackgroundTransparency = 1,
}, Main)

local dot = new("Frame", {
	AnchorPoint = Vector2.new(0, 0.5),
	Position = UDim2.new(0, 18, 0.5, 0),
	Size = UDim2.fromOffset(10, 10),
	BackgroundColor3 = WHITE,
}, Header)
corner(dot, 5)

new("TextLabel", {
	Position = UDim2.new(0, 38, 0, 7),
	Size = UDim2.new(1, -190, 0, 18),
	BackgroundTransparency = 1,
	Text = HUB_NAME,
	TextColor3 = C.Text,
	Font = Enum.Font.GothamBold,
	TextSize = 15,
	TextXAlignment = Enum.TextXAlignment.Left,
}, Header)
new("TextLabel", {
	Position = UDim2.new(0, 38, 0, 25),
	Size = UDim2.new(1, -190, 0, 12),
	BackgroundTransparency = 1,
	Text = "Beta  \226\128\162  tap a card to open its options",
	TextColor3 = C.Sub,
	Font = Enum.Font.Gotham,
	TextSize = 10,
	TextXAlignment = Enum.TextXAlignment.Left,
}, Header)


local perfBox = new("Frame", {
	Name = "PerformanceStatsHUD",
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0.5, 174, 0, 18),
	Size = UDim2.fromOffset(124, 25),
	BackgroundTransparency = 1,
	ZIndex = 50,
}, Gui)

local perfLayout = new("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 5),
}, perfBox)

local function makePerfPill(name, initialText, order, width)
	local pill = new("Frame", {
		Name = name .. "Pill",
		Size = UDim2.fromOffset(width, 23),
		BackgroundColor3 = Color3.fromRGB(24, 27, 31),
		BackgroundTransparency = 0.08,
		BorderSizePixel = 0,
		LayoutOrder = order,
		ZIndex = 50,
	}, perfBox)
	corner(pill, 12)
	local stroke = new("UIStroke", {
		Color = Color3.fromRGB(80, 85, 92),
		Transparency = 0.35,
		Thickness = 1,
	}, pill)
	local dot = new("Frame", {
		Name = "StatusDot",
		Position = UDim2.new(0, 7, 0.5, -3),
		Size = UDim2.fromOffset(6, 6),
		BackgroundColor3 = Color3.fromRGB(65, 220, 105),
		BorderSizePixel = 0,
		ZIndex = 52,
	}, pill)
	corner(dot, 5)
	local label = new("TextLabel", {
		Name = "Value",
		Position = UDim2.new(0, 17, 0, 0),
		Size = UDim2.new(1, -20, 1, 0),
		BackgroundTransparency = 1,
		Text = initialText,
		TextColor3 = Color3.fromRGB(245, 247, 250),
		Font = Enum.Font.GothamBold,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 52,
	}, pill)
	return label, dot, pill, stroke
end

local fpsLabel, fpsDot, fpsPill = makePerfPill("FPS", "FPS --", 1, 54)
local pingLabel, pingDot, pingPill = makePerfPill("PING", "-- ms", 2, 60)

local GOOD = Color3.fromRGB(55, 210, 115)
local WARN = Color3.fromRGB(245, 190, 55)
local BAD = Color3.fromRGB(240, 75, 75)

local function setPillStatus(label, dot, pill, color, value)
	label.Text = value
	dot.BackgroundColor3 = color
	pill.BackgroundColor3 = Color3.fromRGB(
		math.floor(24 + color.R * 34),
		math.floor(27 + color.G * 34),
		math.floor(31 + color.B * 34)
	)
end

local smoothedFPS = 60
local pingMs = 0
local pingClock = 0
local uiClock = 0
track(RunService.RenderStepped:Connect(function(dt)
	if unloaded or not Gui.Parent then return end
	if dt > 0 then
		local instantFPS = 1 / dt
		smoothedFPS = smoothedFPS * 0.82 + instantFPS * 0.18
	end
	uiClock += dt
	pingClock += dt
	if pingClock >= 1 then
		pingClock = 0
		local ok, value = pcall(function() return LP:GetNetworkPing() end)
		if ok and type(value) == "number" then
			pingMs = math.max(0, math.floor(value * 1000 + 0.5))
		end
	end
	if uiClock >= 0.25 then
		uiClock = 0
		local fps = math.floor(smoothedFPS + 0.5)
		local fpsColor = fps >= 50 and GOOD or (fps >= 30 and WARN or BAD)
		local pingColor = pingMs < 100 and GOOD or (pingMs < 180 and WARN or BAD)
		setPillStatus(fpsLabel, fpsDot, fpsPill, fpsColor, "FPS " .. tostring(fps))
		setPillStatus(pingLabel, pingDot, pingPill, pingColor, tostring(pingMs) .. " ms")
	end
end))

local headerBtns = new("Frame", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -10, 0.5, 0),
	Size = UDim2.new(0, 0, 0, 30),
	AutomaticSize = Enum.AutomaticSize.X,
	BackgroundTransparency = 1,
}, Header)
new("UIListLayout", {
	FillDirection = Enum.FillDirection.Horizontal,
	HorizontalAlignment = Enum.HorizontalAlignment.Right,
	VerticalAlignment = Enum.VerticalAlignment.Center,
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 4),
}, headerBtns)

local function headerBtn(iconName, order)
	local b = new("TextButton", {
		Size = UDim2.fromOffset(30, 30),
		BackgroundTransparency = 1,
		Text = "",
		LayoutOrder = order,
	}, headerBtns)
	corner(b, 8)
	local ic = icon(iconName, 18, C.Muted, b)
	b.MouseEnter:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.12), { BackgroundTransparency = 0.88, BackgroundColor3 = WHITE }):Play()
		tweenIconColor(ic, C.Text)
	end)
	b.MouseLeave:Connect(function()
		TweenService:Create(b, TweenInfo.new(0.12), { BackgroundTransparency = 1 }):Play()
		tweenIconColor(ic, C.Muted)
	end)
	return b
end
local minBtn   = headerBtn("minus", 1)
local closeBtn = headerBtn("x", 2)
State.Actions = {}
minBtn.MouseButton1Click:Connect(function()
	local f = State.Actions.minimize
	if f then f() end
end)
closeBtn.MouseButton1Click:Connect(function()
	local f = State.Actions.close
	if f then f() end
end)

new("Frame", {
	Position = UDim2.new(0, 16, 0, HEADER_H - 1),
	Size = UDim2.new(1, -32, 0, 1),
	BackgroundColor3 = WHITE,
	BackgroundTransparency = 0.9,
	BorderSizePixel = 0,
}, Main)

local Body = new("ScrollingFrame", {
	Name = "Body",
	Position = UDim2.new(0, 0, 0, HEADER_H),
	Size = UDim2.new(1, 0, 1, -HEADER_H),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ScrollBarThickness = 3,
	ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200),
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	ScrollingDirection = Enum.ScrollingDirection.Y,
}, Main)
local List = new("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 6),
}, Body)
new("UIPadding", {
	PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8),
	PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 12),
}, Body)

local minimized, busy, savedPos = false, false, nil

local function fullHeight()
	local content = List.AbsoluteContentSize.Y / math.max(Scale.Scale, 0.01) + 16
	return HEADER_H + math.min(content, MAX_BODY_H)
end

updateMainHeight = function()
	if minimized or busy then return end
	Main.Size = UDim2.fromOffset(WIDTH, fullHeight())
end
track(List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateMainHeight))

local RegHook = {}
local Reg = { list = {}, ids = {}, skip = false }

local function stylePill(p, selected)
	p.BackgroundColor3 = selected and C.Accent or C.Surface
	p.TextColor3 = selected and C.OnAccent or C.Muted
end

local function pill(parent, text, width, order, interactive)
	local p = new(interactive and "TextButton" or "TextLabel", {
		Size = UDim2.fromOffset(width, 28),
		BackgroundColor3 = C.Surface,
		Text = text,
		TextColor3 = C.Muted,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		LayoutOrder = order,
	}, parent)
	corner(p, 8)
	return p
end

local function pillIcon(parent, iconName, width, order)
	local p = pill(parent, "", width, order, true)
	icon(iconName, 14, C.Text, p)
	return p
end

local function addCard(order, iconName, title, subtitle, key, onToggle)
	local card = { rows = 0, expanded = false }
	local s = State[key]

	local frame = new("Frame", {
		Name = title,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = C.Card,
		LayoutOrder = order,
	}, Body)
	corner(frame, 12)
	local cardStroke = new("UIStroke", { Color = WHITE, Transparency = 0.92, Thickness = 1 }, frame)
	new("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }, frame)

	local head = new("Frame", {
		Name = "Head",
		Size = UDim2.new(1, 0, 0, CARD_H),
		BackgroundTransparency = 1,
		LayoutOrder = 1,
	}, frame)

	local rowBtn = new("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
	}, head)

	local iconBox = new("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(38, 38),
		BackgroundColor3 = C.Surface,
	}, head)
	corner(iconBox, 10)
	local cardIcon = icon(iconName, 20, C.Text, iconBox)

	new("TextLabel", {
		Position = UDim2.new(0, 58, 0.5, -19),
		Size = UDim2.new(1, -170, 0, 20),
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = C.Text,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, head)

	card.sub = new("TextLabel", {
		Position = UDim2.new(0, 58, 0.5, 1),
		Size = UDim2.new(1, -170, 0, 16),
		BackgroundTransparency = 1,
		Text = subtitle,
		TextColor3 = C.Sub,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, head)

	local right = new("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 30),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
	}, head)
	new("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 6),
	}, right)

	card.toggle = pill(right, "OFF", 56, 1, true)
	local arrowBtn = new("TextButton", {
		Size = UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		Text = "",
		LayoutOrder = 2,
	}, right)
	card.arrow = icon("chevron-down", 18, C.Muted, arrowBtn)

	card.Opts = new("Frame", {
		Name = "Opts",
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = 2,
	}, frame)
	new("Frame", {
		Position = UDim2.new(0, 12, 0, 0),
		Size = UDim2.new(1, -24, 0, 1),
		BackgroundColor3 = WHITE,
		BackgroundTransparency = 0.92,
		BorderSizePixel = 0,
	}, card.Opts)
	card.Rows = new("Frame", {
		Position = UDim2.new(0, 14, 0, 9),
		Size = UDim2.new(1, -28, 1, -9),
		BackgroundTransparency = 1,
	}, card.Opts)
	new("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 4),
	}, card.Rows)

	local function setExpanded(on)
		card.expanded = on
		local h = 0
		if on then h = 9 + card.rows * OPT_H + math.max(card.rows - 1, 0) * 4 + 10 end
		local ti = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		TweenService:Create(card.Opts, ti, { Size = UDim2.new(1, 0, 0, h) }):Play()
		TweenService:Create(card.arrow, ti, { Rotation = on and 180 or 0 }):Play()
		tweenIconColor(card.arrow, on and C.Text or C.Muted)
	end
	rowBtn.MouseEnter:Connect(function()
		TweenService:Create(frame, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(24, 24, 24) }):Play()
	end)
	rowBtn.MouseLeave:Connect(function()
		TweenService:Create(frame, TweenInfo.new(0.12), { BackgroundColor3 = C.Card }):Play()
	end)
	rowBtn.MouseButton1Click:Connect(function() setExpanded(not card.expanded) end)
	arrowBtn.MouseButton1Click:Connect(function() setExpanded(not card.expanded) end)

	local function refreshEnabled()
		TweenService:Create(iconBox, TweenInfo.new(0.18), {
			BackgroundColor3 = s.Enabled and C.Accent or C.Surface,
		}):Play()
		tweenIconColor(cardIcon, s.Enabled and C.OnAccent or C.Text)
		card.toggle.Text = s.Enabled and "ON" or "OFF"
		TweenService:Create(card.toggle, TweenInfo.new(0.18), {
			BackgroundColor3 = s.Enabled and C.Accent or C.Surface,
			TextColor3 = s.Enabled and C.OnAccent or C.Muted,
		}):Play()
		local ti = TweenInfo.new(0.18)
		TweenService:Create(cardStroke, ti, { Transparency = s.Enabled and 0.6 or 0.92 }):Play()
	end
	card.refresh = refreshEnabled
	card.toggle.MouseButton1Click:Connect(function()
		s.Enabled = not s.Enabled
		refreshEnabled()
		if onToggle then onToggle(s.Enabled) else fire(key) end
	end)
	refreshEnabled()

	return card
end

local function addOption(card, label, iconName, wide)
	card.rows = card.rows + 1
	local row = new("Frame", {
		Size = UDim2.new(1, 0, 0, OPT_H),
		BackgroundColor3 = WHITE,
		BackgroundTransparency = 1,
		LayoutOrder = card.rows,
	}, card.Rows)
	corner(row, 8)

	local rowBtn = new("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
	}, row)
	rowBtn.MouseEnter:Connect(function()
		TweenService:Create(row, TweenInfo.new(0.12), { BackgroundTransparency = 0.95 }):Play()
	end)
	rowBtn.MouseLeave:Connect(function()
		TweenService:Create(row, TweenInfo.new(0.12), { BackgroundTransparency = 1 }):Play()
	end)

	local x = 8
	if iconName then
		icon(iconName, 16, C.Muted, row, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 8, 0.5, 0),
		})
		x = 34
	end

	new("TextLabel", {
		Position = UDim2.new(0, x, 0, 0),
		Size = wide and UDim2.new(1, -(x + (type(wide) == "number" and wide or 42)), 1, 0) or UDim2.new(0.5, -x, 1, 0),
		BackgroundTransparency = 1,
		Text = label,
		TextColor3 = C.Text,
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, row)

	local ctrl = new("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -8, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 28),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
	}, row)
	new("UIListLayout", {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 6),
	}, ctrl)
	return ctrl, rowBtn
end

local function addSegment(card, label, iconName, values, fmt, width, get, set)
	local ctrl = addOption(card, label, iconName)
	local btns = {}
	local function refresh()
		for v, b in pairs(btns) do stylePill(b, get() == v) end
	end
	for i, v in ipairs(values) do
		local b = pill(ctrl, fmt(v), width, i, true)
		btns[v] = b
		b.MouseButton1Click:Connect(function() set(v); refresh() end)
	end
	refresh()
	RegHook.r = refresh
end

local function addDropdown(card, label, iconName, values, fmt, get, set, buttonWidth)
	local ctrl = addOption(card, label, iconName)
	local btn = new("TextButton", {
		Size = UDim2.fromOffset(math.clamp(tonumber(buttonWidth) or 104, 96, 180), 28),
		BackgroundColor3 = C.Surface,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = 1,
	}, ctrl)
	corner(btn, 8)
	local lbl = new("TextLabel", {
		Position = UDim2.new(0, 10, 0, 0),
		Size = UDim2.new(1, -30, 1, 0),
		BackgroundTransparency = 1,
		TextColor3 = C.Text,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	}, btn)
	local arrow = icon("chevron-down", 14, C.Muted, btn, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -8, 0.5, 0),
	})
	local function render() lbl.Text = fmt(get()) end
	render()
	RegHook.r = render

	local blocker
	local function close()
		if blocker then blocker:Destroy(); blocker = nil end
		TweenService:Create(arrow, TweenInfo.new(0.15), { Rotation = 0 }):Play()
	end
	local function open()
		if blocker then return close() end
		local sc = Scale.Scale
		local itemH, pad = 30, 4
		local w = btn.AbsoluteSize.X / sc
		local h = #values * itemH + (#values - 1) * 2 + pad * 2
		local vp = Gui.AbsoluteSize
		h = math.min(h, math.max(120, math.floor(vp.Y / sc * 0.5)))
		local pos = btn.AbsolutePosition
		local below = pos.Y + btn.AbsoluteSize.Y + 4 + h * sc <= vp.Y - 8

		blocker = new("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 60,
		}, Gui)
		blocker.MouseButton1Click:Connect(close)

		local anchor = new("Frame", {
			AnchorPoint = Vector2.new(0, below and 0 or 1),
			Position = UDim2.fromOffset(pos.X, below and (pos.Y + btn.AbsoluteSize.Y + 4) or (pos.Y - 4)),
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
		}, blocker)
		local popup = new("ScrollingFrame", {
			AnchorPoint = Vector2.new(0, below and 0 or 1),
			Size = UDim2.fromOffset(w, 0),
			BackgroundColor3 = C.Card,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 3,
			ScrollingDirection = Enum.ScrollingDirection.Y,
		}, anchor)
		new("UIScale", { Scale = sc }, popup)
		corner(popup, 8)
		new("UIStroke", { Color = WHITE, Transparency = 0.75, Thickness = 1 }, popup)
		new("UIPadding", {
			PaddingTop = UDim.new(0, pad), PaddingBottom = UDim.new(0, pad),
			PaddingLeft = UDim.new(0, pad), PaddingRight = UDim.new(0, pad),
		}, popup)
		new("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2) }, popup)

		for i, v in ipairs(values) do
			local selected = get() == v
			local item = new("TextButton", {
				Size = UDim2.new(1, 0, 0, itemH),
				BackgroundColor3 = selected and C.Accent or C.Card,
				Text = fmt(v),
				TextColor3 = selected and C.OnAccent or C.Text,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextXAlignment = buttonWidth and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				AutoButtonColor = false,
				LayoutOrder = i,
			}, popup)
			if buttonWidth then
				new("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
				}, item)
			end
			corner(item, 7)
			if not selected then
				item.MouseEnter:Connect(function() item.BackgroundColor3 = C.Surface end)
				item.MouseLeave:Connect(function() item.BackgroundColor3 = C.Card end)
			end
			item.MouseButton1Click:Connect(function()
				set(v); render(); close()
			end)
		end

		TweenService:Create(popup, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Size = UDim2.fromOffset(w, h),
		}):Play()
		TweenService:Create(arrow, TweenInfo.new(0.15), { Rotation = 180 }):Play()
	end
	btn.MouseButton1Click:Connect(open)
end

local function addMultiDropdown(card, label, iconName, items, get, set)
	local ctrl = addOption(card, label, iconName)
	local btn = new("TextButton", {
		Size = UDim2.fromOffset(124, 28),
		BackgroundColor3 = C.Surface,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = 1,
	}, ctrl)
	corner(btn, 8)
	local lbl = new("TextLabel", {
		Position = UDim2.new(0, 10, 0, 0),
		Size = UDim2.new(1, -30, 1, 0),
		BackgroundTransparency = 1,
		TextColor3 = C.Text,
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, btn)
	local arrow = icon("chevron-down", 14, C.Muted, btn, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -8, 0.5, 0),
	})
	local function render()
		local n = 0
		for _, it in ipairs(items) do if get(it.id) then n = n + 1 end end
		lbl.Text = n == 0 and "Select..." or (n .. " skipped")
		lbl.TextColor3 = n == 0 and C.Muted or C.Text
	end
	render()
	RegHook.r = render

	local blocker
	local function close()
		if blocker then blocker:Destroy(); blocker = nil end
		TweenService:Create(arrow, TweenInfo.new(0.15), { Rotation = 0 }):Play()
	end
	local function open()
		if blocker then return close() end
		local sc = Scale.Scale
		local itemH, pad = 32, 4
		local w = math.max(btn.AbsoluteSize.X / sc, 196)
		local h = #items * itemH + (#items - 1) * 2 + pad * 2
		local vp = Gui.AbsoluteSize
		local pos = btn.AbsolutePosition
		local below = pos.Y + btn.AbsoluteSize.Y + 4 + h * sc <= vp.Y - 8

		blocker = new("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 60,
		}, Gui)
		blocker.MouseButton1Click:Connect(close)

		local anchor = new("Frame", {
			Position = UDim2.fromOffset(pos.X + btn.AbsoluteSize.X, below and (pos.Y + btn.AbsoluteSize.Y + 4) or (pos.Y - 4)),
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
		}, blocker)
		local popup = new("Frame", {
			AnchorPoint = Vector2.new(1, below and 0 or 1),
			Size = UDim2.fromOffset(w, 0),
			BackgroundColor3 = C.Card,
			ClipsDescendants = true,
		}, anchor)
		new("UIScale", { Scale = sc }, popup)
		corner(popup, 10)
		new("UIStroke", { Color = WHITE, Transparency = 0.75, Thickness = 1 }, popup)
		new("UIPadding", {
			PaddingTop = UDim.new(0, pad), PaddingBottom = UDim.new(0, pad),
			PaddingLeft = UDim.new(0, pad), PaddingRight = UDim.new(0, pad),
		}, popup)
		new("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2) }, popup)

		for i, it in ipairs(items) do
			local item = new("TextButton", {
				Size = UDim2.new(1, 0, 0, itemH),
				BackgroundColor3 = C.Card,
				Text = "",
				AutoButtonColor = false,
				LayoutOrder = i,
			}, popup)
			corner(item, 7)

			local box = new("Frame", {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 8, 0.5, 0),
				Size = UDim2.fromOffset(18, 18),
				BackgroundColor3 = C.Surface,
			}, item)
			corner(box, 5)
			local tickIcon = icon("check", 13, C.OnAccent, box)
			new("TextLabel", {
				Position = UDim2.new(0, 34, 0, 0),
				Size = UDim2.new(1, -40, 1, 0),
				BackgroundTransparency = 1,
				Text = it.name,
				TextColor3 = C.Text,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			}, item)

			local function refresh()
				local on = get(it.id)
				tickIcon.Visible = on
				box.BackgroundColor3 = on and C.Accent or C.Surface
			end
			refresh()
			item.MouseEnter:Connect(function() item.BackgroundColor3 = C.Surface end)
			item.MouseLeave:Connect(function() item.BackgroundColor3 = C.Card end)
			item.MouseButton1Click:Connect(function()
				set(it.id, not get(it.id))
				refresh(); render()
			end)
		end

		TweenService:Create(popup, TweenInfo.new(0.16, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Size = UDim2.fromOffset(w, h),
		}):Play()
		TweenService:Create(arrow, TweenInfo.new(0.15), { Rotation = 180 }):Play()
	end
	btn.MouseButton1Click:Connect(open)
end

local function attachColorPicker(parent, get, set, width, order)
	local swatch = new("TextButton", {
		Size = UDim2.fromOffset(24, 24),
		BackgroundColor3 = get(),
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = order,
	}, parent)
	corner(swatch, 6)
	new("UIStroke", { Color = WHITE, Transparency = 0.6, Thickness = 1 }, swatch)
	RegHook.c = function() swatch.BackgroundColor3 = get() end

	local blocker, conns
	local function close()
		if conns then
			for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
			conns = nil
		end
		if blocker then blocker:Destroy(); blocker = nil end
	end

	swatch.MouseButton1Click:Connect(function()
		if blocker then return close() end
		local sc = Scale.Scale
		local W, SV_H, HUE_H = 150, 84, 12
		local H = 8 + SV_H + 8 + HUE_H + 8 + 22 + 8
		local vp = Gui.AbsoluteSize
		local pos = swatch.AbsolutePosition
		local below = pos.Y + swatch.AbsoluteSize.Y + 4 + H * sc <= vp.Y - 8

		blocker = new("TextButton", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 60,
		}, Gui)
		blocker.MouseButton1Click:Connect(close)
		local anchor = new("Frame", {
			Position = UDim2.fromOffset(pos.X + swatch.AbsoluteSize.X, below and (pos.Y + swatch.AbsoluteSize.Y + 4) or (pos.Y - 4)),
			Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1,
		}, blocker)
		local popup = new("Frame", {
			AnchorPoint = Vector2.new(1, below and 0 or 1), Size = UDim2.fromOffset(W, H),
			BackgroundColor3 = C.Card, Active = true,
		}, anchor)
		new("UIScale", { Scale = sc }, popup)
		corner(popup, 10)
		new("UIStroke", { Color = WHITE, Transparency = 0.75, Thickness = 1 }, popup)

		local h, s, v = Color3.toHSV(get())

		local svBox = new("TextButton", {
			Position = UDim2.fromOffset(8, 8), Size = UDim2.fromOffset(W - 16, SV_H),
			BackgroundColor3 = Color3.fromHSV(h, 1, 1), Text = "", AutoButtonColor = false, ClipsDescendants = true,
		}, popup)
		corner(svBox, 4)
		local white = new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0 }, svBox)
		new("UIGradient", {
			Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) }),
		}, white)
		local black = new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 }, svBox)
		new("UIGradient", {
			Rotation = 90,
			Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) }),
		}, black)
		local svKnob = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(12, 12), BackgroundTransparency = 1,
		}, svBox)
		corner(svKnob, 6)
		new("UIStroke", { Color = WHITE, Thickness = 2 }, svKnob)

		local hueBar = new("TextButton", {
			Position = UDim2.fromOffset(8, 8 + SV_H + 8), Size = UDim2.fromOffset(W - 16, HUE_H),
			BackgroundColor3 = WHITE, Text = "", AutoButtonColor = false,
		}, popup)
		corner(hueBar, 7)
		local keys = {}
		for i = 0, 6 do table.insert(keys, ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(math.min(i / 6, 0.999), 1, 1))) end
		new("UIGradient", { Color = ColorSequence.new(keys) }, hueBar)
		local hueKnob = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(6, HUE_H + 6), BackgroundColor3 = WHITE,
		}, hueBar)
		corner(hueKnob, 3)

		local rowY = 8 + SV_H + 8 + HUE_H + 8
		local prev = new("Frame", { Position = UDim2.fromOffset(8, rowY), Size = UDim2.fromOffset(34, 22), BackgroundColor3 = get() }, popup)
		corner(prev, 6)
		local hex = new("TextLabel", {
			Position = UDim2.fromOffset(50, rowY), Size = UDim2.new(1, -58, 0, 22), BackgroundTransparency = 1,
			TextColor3 = C.Text, Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Text = "",
		}, popup)

		local function current() return Color3.fromHSV(h, s, v) end
		local function refresh()
			local col = current()
			svBox.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
			svKnob.Position = UDim2.fromScale(s, 1 - v)
			hueKnob.Position = UDim2.fromScale(h, 0.5)
			prev.BackgroundColor3 = col
			swatch.BackgroundColor3 = col
			hex.Text = string.format("#%02X%02X%02X", math.floor(col.R * 255 + 0.5), math.floor(col.G * 255 + 0.5), math.floor(col.B * 255 + 0.5))
		end
		refresh()

		local dragging
		local last = 0
		local function fromInput(p)
			if dragging == "sv" then
				local ap, as = svBox.AbsolutePosition, svBox.AbsoluteSize
				s = math.clamp((p.X - ap.X) / as.X, 0, 1)
				v = 1 - math.clamp((p.Y - ap.Y) / as.Y, 0, 1)
			elseif dragging == "hue" then
				local ap, as = hueBar.AbsolutePosition, hueBar.AbsoluteSize
				h = math.clamp((p.X - ap.X) / as.X, 0, 0.999)
			end
			refresh()
			if os.clock() - last > 0.08 then last = os.clock(); set(current()) end
		end
		local function begin(kind)
			return function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = kind
					fromInput(input.Position)
				end
			end
		end
		svBox.InputBegan:Connect(begin("sv"))
		hueBar.InputBegan:Connect(begin("hue"))
		conns = {
			track(UserInputService.InputChanged:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
					or input.UserInputType == Enum.UserInputType.Touch) then
					fromInput(input.Position)
				end
			end)),
			track(UserInputService.InputEnded:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch) then
					dragging = nil
					set(current())
				end
			end)),
		}
	end)
	return swatch
end

local function addSwatches(card, label, iconName, _colors, get, set)
	local ctrl = addOption(card, label, iconName)
	attachColorPicker(ctrl, get, set, 24, 1)
end

local function addCheckbox(card, label, iconName, get, set, colorGet, colorSet, roleTag)
	local ctrl, rowBtn = addOption(card, label, iconName, roleTag and 84 or (colorGet and 64 or true))
	if colorGet then attachColorPicker(ctrl, colorGet, colorSet, 24, -1) end
	if roleTag then
		local tag = new("TextLabel", {
			Size = UDim2.fromOffset(56, 22),
			BackgroundColor3 = C.Surface,
			Text = string.upper(roleTag),
			TextColor3 = C.Text,
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			LayoutOrder = -2,
		}, ctrl)
		corner(tag, 6)
	end

	local box = new("TextButton", {
		Size = UDim2.fromOffset(22, 22),
		BackgroundColor3 = C.Surface,
		Text = "",
		AutoButtonColor = false,
	}, ctrl)
	corner(box, 6)
	local stroke = new("UIStroke", { Color = C.Accent, Transparency = 0.6, Thickness = 1.2 }, box)
	local tick = icon("check", 15, C.OnAccent, box)

	local function refresh()
		local on = get()
		tick.Visible = on
		stroke.Transparency = on and 1 or 0.6
		TweenService:Create(box, TweenInfo.new(0.12), {
			BackgroundColor3 = on and C.Accent or C.Surface,
		}):Play()
	end
	refresh()

	local function flip() set(not get()); refresh() end
	box.MouseButton1Click:Connect(flip)
	rowBtn.MouseButton1Click:Connect(flip)
	RegHook.r = refresh
end

local activeSlider
track(UserInputService.InputChanged:Connect(function(input)
	if activeSlider and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		activeSlider(input.Position.X)
	end
end))
track(UserInputService.InputEnded:Connect(function(input)
	if activeSlider and (input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch) then
		activeSlider = nil
		Body.ScrollingEnabled = true
	end
end))

local function addSlider(card, label, iconName, min, max, get, set)
	local ctrl = addOption(card, label, iconName)

	local holder = new("TextButton", {
		Size = UDim2.fromOffset(112, 28),
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = 1,
	}, ctrl)
	local bar = new("Frame", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 7, 0.5, 0),
		Size = UDim2.new(1, -14, 0, 6),
		BackgroundColor3 = C.Surface,
	}, holder)
	corner(bar, 3)
	local fill = new("Frame", {
		Size = UDim2.fromScale(0, 1),
		BackgroundColor3 = C.Accent,
	}, bar)
	corner(fill, 3)
	local knob = new("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		BackgroundColor3 = C.Accent,
	}, bar)
	corner(knob, 7)

	local val = pill(ctrl, tostring(get()), 38, 2, false)
	val.TextColor3 = C.Text

	local function render()
		local v = get()
		local r = (v - min) / (max - min)
		fill.Size = UDim2.fromScale(r, 1)
		knob.Position = UDim2.new(r, 0, 0.5, 0)
		val.Text = tostring(v)
	end
	local function fromX(x)
		local r = math.clamp((x - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1), 0, 1)
		local v = math.floor(min + r * (max - min) + 0.5)
		if v ~= get() then set(v) end
		render()
	end

	holder.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			activeSlider = fromX
			Body.ScrollingEnabled = false
			fromX(input.Position.X)
		end
	end)
	render()
	RegHook.r = render
end

do
	local function regAdd(card, label, get, set, refresh, lo, hi)
		if Reg.skip then return end
		local base = tostring(card.title or "?") .. "/" .. label
		local id, n = base, 1
		while Reg.ids[id] do n = n + 1; id = base .. "#" .. n end
		Reg.ids[id] = true
		local okDefault, default = pcall(get)
		if not okDefault or default == nil then return end
		table.insert(Reg.list, {
			id = id, get = get, set = set, refresh = refresh,
			default = default, lo = lo, hi = hi,
			enabled = label == "Enabled" and base:sub(-8) == "/Enabled",
		})
	end

	local oCard, oCheck, oSlide, oDrop, oMulti, oSwatch, oSeg =
		addCard, addCheckbox, addSlider, addDropdown, addMultiDropdown, addSwatches, addSegment

	addCard = function(order, iconName, title, subtitle, key, onToggle)
		local card = oCard(order, iconName, title, subtitle, key, onToggle)
		card.title = title
		local st = State[key]
		if st then
			regAdd(card, "Enabled",
				function() return st.Enabled == true end,
				function(v)
					v = v == true
					if (st.Enabled == true) == v then return end
					st.Enabled = v
					card.refresh()
					if onToggle then onToggle(v) else fire(key) end
				end,
				function() card.refresh() end)
		end
		return card
	end

	addCheckbox = function(card, label, iconName, get, set, colorGet, colorSet, roleTag)
		RegHook.r, RegHook.c = nil, nil
		oCheck(card, label, iconName, get, set, colorGet, colorSet, roleTag)
		local r, c = RegHook.r, RegHook.c
		regAdd(card, label, get, set, r)
		if colorGet and colorSet then regAdd(card, label .. " Color", colorGet, colorSet, c) end
	end

	addSlider = function(card, label, iconName, min, max, get, set)
		RegHook.r = nil
		oSlide(card, label, iconName, min, max, get, set)
		regAdd(card, label, get, set, RegHook.r, min, max)
	end

	addDropdown = function(card, label, iconName, values, fmt, get, set)
		RegHook.r = nil
		oDrop(card, label, iconName, values, fmt, get, set)
		regAdd(card, label, get, set, RegHook.r)
	end

	addSegment = function(card, label, iconName, values, fmt, width, get, set)
		RegHook.r = nil
		oSeg(card, label, iconName, values, fmt, width, get, set)
		regAdd(card, label, get, set, RegHook.r)
	end

	addMultiDropdown = function(card, label, iconName, items, get, set)
		RegHook.r = nil
		oMulti(card, label, iconName, items, get, set)
		local r = RegHook.r
		for _, it in ipairs(items) do
			regAdd(card, label .. "/" .. tostring(it.name or it.id),
				function() return get(it.id) == true end,
				function(v) set(it.id, v == true) end,
				r)
		end
	end

	addSwatches = function(card, label, iconName, colors, get, set)
		RegHook.c = nil
		oSwatch(card, label, iconName, colors, get, set)
		regAdd(card, label, get, set, RegHook.c)
	end
end

State.SkillCheckTrap = { On = false }
do
	local T = State.SkillCheckTrap
	local conn
	local busy = false
	local function inRange(lineRot, goalRot)
		local a = (goalRot + 102) % 360
		local b = (goalRot + 116) % 360
		if a > b then return lineRot >= a or lineRot <= b end
		return lineRot >= a and lineRot <= b
	end
	local function step()
		if unloaded or not T.On or busy then return end
		local pg = LP:FindFirstChildOfClass("PlayerGui")
		if not pg then return end
		for _, name in ipairs({ "SkillCheckPromptGui", "SkillCheckPromptGui-con" }) do
			local prompt = pg:FindFirstChild(name)
			if prompt and prompt.Enabled ~= false then
				local check = prompt:FindFirstChild("Check")
				if check and check.Visible then
					local line = check:FindFirstChild("Line")
					if not line then return end
					local target
					for _, tn in ipairs({ "TrapPerfect", "TrapGoal" }) do
						local c = check:FindFirstChild(tn)
						if c and c.Visible then target = c; break end
					end
					if not target then return end
					local press = inRange(line.Rotation % 360, target.Rotation % 360)
					if press then
						busy = true
						task.spawn(function()
							pcall(function() State.SkillCheckObj:_fireAction() end)
							task.wait(0.05)
							busy = false
						end)
					end
					return
				end
			end
		end
	end
	State.TrapSkillSet = function(v)
		T.On = v == true
		if conn then conn:Disconnect(); conn = nil end
		busy = false
		if T.On then conn = RunService.RenderStepped:Connect(function() pcall(step) end) end
	end
end

do
	local s = State.SkillCheck
	local obj = State.SkillCheckObj
	local card = addCard(0, "target", "Auto Skill Check", "", "SkillCheck")
	local function sync() card.sub.Text = "Mode: " .. s.Mode end
	sync()
	addDropdown(card, "Mode", "list", { "Legit", "Normal" },
		function(v) return v end,
		function() return s.Mode end,
		function(v) obj:SetMode(v); sync() end)
	local T = State.SkillCheckTrap
	addCheckbox(card, "Auto Trap Skill Check", "target",
		function() return T.On end,
		function(v) State.TrapSkillSet(v) end)
end

do
	local s = State.Spear
	local card = addCard(1, "swords", "Silent Spear [Veil]", "", "Spear")
	local function sync()
		card.sub.Text = string.format("FOV %d \226\128\162 Range %d", s.FOV, s.MaxRange)
	end
	sync()

	addCheckbox(card, "FOV Aim", "scan",
		function() return s.FovAim end,
		function(v) s.FovAim = v end)
	addCheckbox(card, "Predict Spear", "crosshair",
		function() return s.Predict ~= false end,
		function(v) s.Predict = v end)
	addSlider(card, "FOV (px)", "circle", 40, 600,
		function() return math.clamp(math.floor(tonumber(s.FOV) or 240), 40, 600) end,
		function(v) s.FOV = v; sync() end)
	addSlider(card, "Max Range", "ruler", 50, 500,
		function() return math.clamp(math.floor(tonumber(s.MaxRange) or 500), 50, 500) end,
		function(v) s.MaxRange = v; sync() end)
	addSlider(card, "Spear Speed", "gauge", 60, 200,
		function() return math.clamp(math.floor(tonumber(s.SpearSpeed) or 180), 60, 200) end,
		function(v) s.SpearSpeed = v end)
	addSlider(card, "Drop (x0.1)", "arrow-down", 0, 10,
		function() return math.clamp(math.floor((tonumber(s.Drop) or 0.5) * 10 + 0.5), 0, 10) end,
		function(v) s.Drop = v / 10 end)
end

do
	local s = State.SilentChain
	local card = addCard(2, "link", "Silent Chain [Butcher]", "", "SilentChain")
	local function sync()
		card.sub.Text = string.format("Range %d \226\128\162 Speed %d", s.Range, s.Speed)
	end
	sync()

	addCheckbox(card, "Prediction", "crosshair",
		function() return s.Prediction end,
		function(v) s.Prediction = v end)
	addCheckbox(card, "Target Highlight", "eye",
		function() return s.Highlight end,
		function(v) s.Highlight = v end)
	addCheckbox(card, "Debug Log", "bug",
		function() return s.Debug end,
		function(v) s.Debug = v end)
	addSlider(card, "Chain Range", "ruler", 10, 50,
		function() return math.clamp(math.floor(tonumber(s.Range) or 50), 10, 50) end,
		function(v) s.Range = v; sync() end)
	addSlider(card, "Chain Speed", "gauge", 80, 250,
		function() return math.clamp(math.floor(tonumber(s.Speed) or 140), 80, 250) end,
		function(v) s.Speed = v; sync() end)
	addSlider(card, "Prediction Strength (%)", "move", 0, 150,
		function() return math.clamp(math.floor((tonumber(s.PredMultiplier) or 1) * 100 + 0.5), 0, 150) end,
		function(v) s.PredMultiplier = v / 100 end)
	addSlider(card, "Aim Height (x0.1)", "arrow-down", -30, 50,
		function() return math.clamp(math.floor((tonumber(s.AimHeightOffset) or 0.5) * 10 + 0.5), -30, 50) end,
		function(v) s.AimHeightOffset = v / 10 end)
end

do
	local s = Parry
	local card = addCard(3, "shield", "Auto Parry", "", "Parry", function(on)
		if on and ParryV2.Enabled then
			ParryV2.Enabled = false
			local otherCard = ParryCards.V2
			if otherCard then
				otherCard.refresh()
				otherCard.sub.Text = "Dimatikan otomatis (Auto Parry diaktifkan)"
				task.delay(2.5, function() if otherCard and otherCard.sub then pcall(function() otherCard.sub.Text = string.format("Range %d \226\128\162 Face %d", ParryV2.Range, ParryV2.FaceSensitivity) end) end end)
			end
			local otherShortcut = _G.KINON_AutoParryV2Shortcut
			if type(otherShortcut) == "table" and type(otherShortcut.RefreshButton) == "function" then
				pcall(otherShortcut.RefreshButton)
			end
		end
		local shortcut = _G.KINON_AutoParryShortcut
		if type(shortcut) == "table" and type(shortcut.RefreshButton) == "function" then
			pcall(shortcut.RefreshButton)
		end
	end)
	ParryCards.V1 = card
	ParryUIRefresh = card.refresh

	local function sync()
		card.sub.Text = string.format("Range %d \226\128\162 Face %d", s.Range, s.FaceSensitivity)
	end
	sync()

	addSlider(card, "Range (studs)", "radar", 5, 35,
		function() return s.Range end,
		function(v) s.Range = v; sync() end)

	addCheckbox(card, "Show Range", "circle",
		function() return s.CircleVisible end,
		function(v) s.CircleVisible = v end)

	addSwatches(card, "Range Color", "palette", {
		Color3.fromRGB(255, 255, 255),
		Color3.fromRGB(255, 90, 90),
		Color3.fromRGB(255, 190, 70),
		Color3.fromRGB(255, 235, 100),
		Color3.fromRGB(100, 230, 150),
		Color3.fromRGB(100, 200, 255),
	}, function() return s.RangeColor end, function(c) s.RangeColor = c end)

	addSlider(card, "Face Sensitivity", "scan-face", 0, 10,
		function() return math.clamp(math.floor(tonumber(s.FaceSensitivity) or 10), 0, 10) end,
		function(v) s.FaceSensitivity = v; s.FaceBias = v; sync() end)

	addCheckbox(card, "Aggressive Mode", "zap",
		function() return s.AggressiveMode end,
		function(v) s.AggressiveMode = v end)

	addCheckbox(card, "Button Parry", "mouse-pointer-click",
		function() return FloatingParryButtonEnabled end,
		function(v)
			FloatingParryButtonEnabled = v
			local shortcut = _G.KINON_AutoParryShortcut
			if type(shortcut) == "table" and shortcut.Gui then
				shortcut.Gui.Enabled = v
			end
		end)

	do
		local items = {}
		for _, name in ipairs({ "Masked Alex Attack", "Masked Alex Lunge", "Hidden Dash", "Abyswalker Slash" }) do
			table.insert(items, { id = VD_SkipParryNameToId[name], name = name })
		end
		addMultiDropdown(card, "Skip Parry", "ban", items,
			function(id) return VD_SkipParryOptions[id] == true end,
			function(id, v) VD_SkipParryOptions[id] = v end)
	end
end


do
	local s = ParryV2
	local card = addCard(4, "shield-check", "Auto Parry V2", "", "ParryV2", function(on)
		if on and Parry.Enabled then
			Parry.Enabled = false
			local otherCard = ParryCards.V1
			if otherCard then
				otherCard.refresh()
				otherCard.sub.Text = "Dimatikan otomatis (Auto Parry V2 diaktifkan)"
				task.delay(2.5, function() if otherCard and otherCard.sub then pcall(function() otherCard.sub.Text = string.format("Range %d \226\128\162 Face %d", Parry.Range, Parry.FaceSensitivity) end) end end)
			end
			local otherShortcut = _G.KINON_AutoParryShortcut
			if type(otherShortcut) == "table" and type(otherShortcut.RefreshButton) == "function" then
				pcall(otherShortcut.RefreshButton)
			end
		end
		local shortcut = _G.KINON_AutoParryV2Shortcut
		if type(shortcut) == "table" and type(shortcut.RefreshButton) == "function" then
			pcall(shortcut.RefreshButton)
		end
	end)
	ParryCards.V2 = card
	ParryUIRefreshV2 = card.refresh

	local function sync()
		card.sub.Text = string.format("Range %d \226\128\162 Face %d", s.Range, s.FaceSensitivity)
	end
	sync()

	addSlider(card, "Range (studs)", "radar", 5, 35,
		function() return s.Range end,
		function(v) s.Range = v; sync() end)

	addCheckbox(card, "Show Range", "circle",
		function() return s.CircleVisible end,
		function(v) s.CircleVisible = v end)

	addSwatches(card, "Range Color", "palette", {
		Color3.fromRGB(255, 255, 255),
		Color3.fromRGB(255, 90, 90),
		Color3.fromRGB(255, 190, 70),
		Color3.fromRGB(255, 235, 100),
		Color3.fromRGB(100, 230, 150),
		Color3.fromRGB(100, 200, 255),
	}, function() return s.RangeColor end, function(c) s.RangeColor = c end)

	addSlider(card, "Face Sensitivity", "scan-face", 0, 10,
		function() return math.clamp(math.floor(tonumber(s.FaceSensitivity) or 10), 0, 10) end,
		function(v) s.FaceSensitivity = v; sync() end)

	addCheckbox(card, "Aggressive Mode", "zap",
		function() return s.AggressiveMode end,
		function(v) s.AggressiveMode = v end)

	addCheckbox(card, "Button Parry", "mouse-pointer-click",
		function() return FloatingParryButtonEnabledV2 end,
		function(v)
			FloatingParryButtonEnabledV2 = v
			local shortcut = _G.KINON_AutoParryV2Shortcut
			if type(shortcut) == "table" and shortcut.Gui then
				shortcut.Gui.Enabled = v
			end
		end)

	do
		local items = {}
		for _, name in ipairs({ "Masked Alex Attack", "Masked Alex Lunge", "Hidden Dash", "Abyswalker Slash" }) do
			table.insert(items, { id = VD_SkipParryNameToId[name], name = name })
		end
		addMultiDropdown(card, "Skip Parry", "ban", items,
			function(id) return VD_SkipParryOptions[id] == true end,
			function(id, v) VD_SkipParryOptions[id] = v end)
	end
end

State.Moonwalk = { Enabled = false, SwingSpeed = 30, SwingAngle = 35, BackSpeed = 13, LimitSpeed = true }

do
	local s = State.Moonwalk
	local STEP = "KinonMoonwalk"
	local bound = false
	local saved, heading = nil, nil
	local card

	local function restore()
		local d = saved
		saved = nil
		if d and d.hum and d.hum.Parent then
			pcall(function()
				d.hum.AutoRotate = d.auto
				if d.limited then d.hum.WalkSpeed = d.speed end
			end)
		end
	end

	local function step()
		if unloaded or not s.Enabled then return end
		local char = LP.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		local cam = workspace.CurrentCamera
		if not hrp or not hum or not cam or hum.Health <= 0 or hum.Sit
			or char:GetAttribute("Downed") == true or char:GetAttribute("IsDown") == true
			or char:GetAttribute("Knocked") == true then
			restore()
			return
		end
		if not saved or saved.hum ~= hum then
			restore()
			saved = { hum = hum, auto = hum.AutoRotate, speed = hum.WalkSpeed, limited = false }
		end

		local look = cam.CFrame.LookVector
		local flat = Vector3.new(look.X, 0, look.Z)
		if flat.Magnitude > 0.1 then heading = flat.Unit end
		if not heading then return end

		hum.AutoRotate = false
		if s.LimitSpeed then
			local ws = math.clamp(tonumber(s.BackSpeed) or 13, 4, 40)
			if hum.WalkSpeed ~= ws then hum.WalkSpeed = ws end
			saved.limited = true
		elseif saved.limited then
			hum.WalkSpeed = saved.speed
			saved.limited = false
		end

		local angle = math.sin(tick() * (tonumber(s.SwingSpeed) or 30)) * (tonumber(s.SwingAngle) or 35)
		local pos = hrp.Position
		hrp.CFrame = CFrame.lookAt(pos, pos + heading) * CFrame.Angles(0, math.rad(angle), 0)
		hum:Move(Vector3.new(0, 0, 1), true)
	end

	local function stop()
		if bound then
			bound = false
			pcall(function() RunService:UnbindFromRenderStep(STEP) end)
		end
		restore()
	end

	local function start()
		stop()
		heading = nil
		bound = true
		RunService:BindToRenderStep(STEP, Enum.RenderPriority.Camera.Value + 1, step)
	end

	local function toggleMoonwalk()
		s.Enabled = not s.Enabled
		Hooks.Moonwalk(s)
		if card then card.refresh() end
	end

	local function createButton()
		local shared = _G.KINON_MoonwalkShortcut
		if type(shared) ~= "table" then
			shared = {}
			_G.KINON_MoonwalkShortcut = shared
		end
		for _, k in ipairs({ "InputConn", "EndConn", "TouchMoveConn" }) do
			if shared[k] then
				pcall(function() shared[k]:Disconnect() end)
				shared[k] = nil
			end
		end
		if shared.Gui then
			pcall(function() shared.Gui:Destroy() end)
			shared.Gui = nil
		end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "KINON_MoonwalkShortcut"
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.Parent = parent
		shared.Gui = screenGui

		local frame = Instance.new("Frame")
		frame.Name = "Frame"
		frame.Size = UDim2.fromOffset(142, 34)
		frame.Position = shared.Position or UDim2.new(1, -138, 0.47, 0)
		frame.BackgroundColor3 = WHITE
		frame.BackgroundTransparency = 0.02
		frame.Active = true
		frame.BorderSizePixel = 0
		frame.ZIndex = 150
		frame.Parent = screenGui
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 9)

		local frameStroke = Instance.new("UIStroke")
		frameStroke.Color = Color3.fromRGB(90, 90, 90)
		frameStroke.Thickness = 1
		frameStroke.Transparency = 0.12
		frameStroke.Parent = frame

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 34, 34)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8)),
		})
		gradient.Rotation = 90
		gradient.Parent = frame

		local button = Instance.new("TextButton")
		button.Name = "ActionButton"
		button.Size = UDim2.fromScale(1, 1)
		button.BackgroundTransparency = 1
		button.Text = ""
		button.AutoButtonColor = false
		button.ZIndex = 151
		button.Parent = frame

		local title = Instance.new("TextLabel")
		title.Name = "Title"
		title.BackgroundTransparency = 1
		title.Position = UDim2.fromOffset(9, 0)
		title.Size = UDim2.new(1, -18, 1, 0)
		title.Font = Enum.Font.GothamBold
		title.Text = "MOONWALK   [OFF]"
		title.TextSize = 10
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.TextYAlignment = Enum.TextYAlignment.Center
		title.TextColor3 = C.Text
		title.ZIndex = 152
		title.Parent = button

		local function viewportSize()
			local camera = workspace.CurrentCamera
			return camera and camera.ViewportSize or Vector2.new(800, 600)
		end

		local function refreshButton()
			local on = s.Enabled == true
			title.Text = on and "MOONWALK   [ON]" or "MOONWALK   [OFF]"
			title.TextColor3 = on and WHITE or Color3.fromRGB(170, 170, 170)
			frameStroke.Color = on and WHITE or Color3.fromRGB(90, 90, 90)
			frameStroke.Transparency = on and 0.02 or 0.12
		end
		shared.RefreshButton = refreshButton

		task.defer(function()
			if not frame.Parent then return end
			title.Text = "MOONWALK   [ON]"
			local onWidth = title.TextBounds.X
			title.Text = "MOONWALK   [OFF]"
			local offWidth = title.TextBounds.X
			frame.Size = UDim2.fromOffset(math.clamp(math.ceil(math.max(onWidth, offWidth)) + 26, 116, 166), 38)
			local vp, pos, size = viewportSize(), frame.Position, frame.AbsoluteSize
			frame.Position = UDim2.fromOffset(
				math.clamp(pos.X.Scale * vp.X + pos.X.Offset, 0, math.max(0, vp.X - size.X)),
				math.clamp(pos.Y.Scale * vp.Y + pos.Y.Offset, 0, math.max(0, vp.Y - size.Y)))
			shared.Position = frame.Position
			refreshButton()
		end)
		refreshButton()

		local pressed, moved = false, false
		local activeInput, startPointer, startX, startY
		local dragThreshold = 6

		local function beginDrag(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1
				and input.UserInputType ~= Enum.UserInputType.Touch then return end
			pressed, moved = true, false
			activeInput = input
			startPointer = Vector2.new(input.Position.X, input.Position.Y)
			local vp, pos = viewportSize(), frame.Position
			startX = pos.X.Scale * vp.X + pos.X.Offset
			startY = pos.Y.Scale * vp.Y + pos.Y.Offset
		end

		local function moveDrag(input)
			if not pressed or not startPointer then return end
			local delta = Vector2.new(input.Position.X, input.Position.Y) - startPointer
			if not moved and delta.Magnitude > dragThreshold then moved = true end
			if not moved then return end
			local vp, size = viewportSize(), frame.AbsoluteSize
			frame.Position = UDim2.fromOffset(
				math.clamp(startX + delta.X, 0, math.max(0, vp.X - size.X)),
				math.clamp(startY + delta.Y, 0, math.max(0, vp.Y - size.Y)))
			shared.Position = frame.Position
		end

		button.InputBegan:Connect(beginDrag)

		shared.InputConn = UserInputService.InputChanged:Connect(function(input)
			if not pressed or not activeInput then return end
			if activeInput.UserInputType == Enum.UserInputType.MouseButton1
				and input.UserInputType == Enum.UserInputType.MouseMovement then
				moveDrag(input)
			elseif activeInput.UserInputType == Enum.UserInputType.Touch and input == activeInput then
				moveDrag(input)
			end
		end)
		shared.TouchMoveConn = UserInputService.TouchMoved:Connect(function(input)
			if pressed and activeInput and activeInput.UserInputType == Enum.UserInputType.Touch
				and input == activeInput then moveDrag(input) end
		end)
		shared.EndConn = UserInputService.InputEnded:Connect(function(input)
			if not pressed or not activeInput then return end
			local matchTouch = activeInput.UserInputType == Enum.UserInputType.Touch
				and input.UserInputType == Enum.UserInputType.Touch and input == activeInput
			local matchMouse = activeInput.UserInputType == Enum.UserInputType.MouseButton1
				and input.UserInputType == Enum.UserInputType.MouseButton1
			if not matchTouch and not matchMouse then return end
			if not moved then toggleMoonwalk() end
			pressed, moved, activeInput = false, false, nil
			startPointer = nil
		end)

		screenGui.Enabled = false
		return screenGui
	end

	createButton()

	Hooks.Moonwalk = function(st)
		if st.Enabled then start() else stop() end
		local shortcut = _G.KINON_MoonwalkShortcut
		if type(shortcut) == "table" and type(shortcut.RefreshButton) == "function" then
			pcall(shortcut.RefreshButton)
		end
	end

	function s.Destroy()
		stop()
		local shortcut = _G.KINON_MoonwalkShortcut
		if type(shortcut) == "table" then
			for _, k in ipairs({ "InputConn", "EndConn", "TouchMoveConn" }) do
				if shortcut[k] then pcall(function() shortcut[k]:Disconnect() end) end
			end
			if shortcut.Gui then pcall(function() shortcut.Gui:Destroy() end) end
		end
	end

	track(UserInputService.InputBegan:Connect(function(input, processed)
		if processed or unloaded then return end
		if input.KeyCode == Enum.KeyCode.F8 then toggleMoonwalk() end
	end))

	card = addCard(15, "footprints", "Moonwalk", "", "Moonwalk")
	local function sync()
		card.sub.Text = string.format("Swing %d \226\128\162 Angle %d", s.SwingSpeed, s.SwingAngle)
	end
	sync()

	addSlider(card, "Swing Speed", "gauge", 2, 60,
		function() return math.clamp(math.floor(tonumber(s.SwingSpeed) or 30), 2, 60) end,
		function(v) s.SwingSpeed = v; sync() end)
	addSlider(card, "Swing Angle", "move-horizontal", 0, 90,
		function() return math.clamp(math.floor(tonumber(s.SwingAngle) or 35), 0, 90) end,
		function(v) s.SwingAngle = v; sync() end)
	addCheckbox(card, "Limit Back Speed", "gauge",
		function() return s.LimitSpeed == true end,
		function(v) s.LimitSpeed = v end)
	addSlider(card, "Back Speed", "arrow-down", 4, 40,
		function() return math.clamp(math.floor(tonumber(s.BackSpeed) or 13), 4, 40) end,
		function(v) s.BackSpeed = v end)
	addCheckbox(card, "Button Moonwalk", "mouse-pointer-click",
		function()
			local shortcut = _G.KINON_MoonwalkShortcut
			return type(shortcut) == "table" and shortcut.Gui ~= nil and shortcut.Gui.Enabled == true
		end,
		function(v)
			local shortcut = _G.KINON_MoonwalkShortcut
			if type(shortcut) == "table" and shortcut.Gui then shortcut.Gui.Enabled = v end
		end)
end

State.StunObj = (function()
	local STUN_ATTRS = { "IsStunned", "isStunned", "Stunned", "stunned", "IsStun", "Stun" }
	local DEFAULT_STUN = 2
	local cache = {}
	local acc = 0
	local obj = {}

	local function isStunned(char)
		for _, name in ipairs(STUN_ATTRS) do
			if char:GetAttribute(name) == true then return true end
		end
		local ci = char:FindFirstChild("CheckInterractable")
		if ci and (ci:GetAttribute("isStunned") == true or ci:GetAttribute("Stunned") == true) then
			return true
		end
		local hum = char:FindFirstChildOfClass("Humanoid")
		local sv = hum and hum:FindFirstChild("StunValue")
		if sv ~= nil and sv.Value > 0 then return true end
		local st = char:GetAttribute("State")
		if type(st) == "string" and string.find(string.lower(st), "stun", 1, true) then return true end
		for k, v in pairs(char:GetAttributes()) do
			if type(k) == "string" and string.find(string.lower(k), "stun", 1, true) and (v == true or (type(v) == "number" and v > 0)) then return true end
		end
		if hum then
			for k, v in pairs(hum:GetAttributes()) do
				if type(k) == "string" and string.find(string.lower(k), "stun", 1, true) and (v == true or (type(v) == "number" and v > 0)) then return true end
			end
		end
		return false
	end

	local function stunLeft(char)
		local hum = char:FindFirstChildOfClass("Humanoid")
		local sv = hum and hum:FindFirstChild("StunValue")
		if sv and sv:IsA("NumberValue") and sv.Value > 0 and sv.Value < 60 then return sv.Value end
		for k, v in pairs(char:GetAttributes()) do
			if type(k) == "string" and string.find(string.lower(k), "stun", 1, true) and type(v) == "number" and v > 0 and v < 60 then return v end
		end
		return nil
	end

	local function isKillerPlayer(p)
		local team = p.Team and string.lower(p.Team.Name) or ""
		return string.find(team, "killer", 1, true) ~= nil
	end

	local SoundService = game:GetService("SoundService")
	local STUN_SOUND_LIST = {
		{ "Default",       "18843924331" },
		{ "Clash Royale",  "114072050006157" },
		{ "Blash",         "89068385567682" },
		{ "antek asing",   "129760109847577" },
		{ "hidup Jokowi",  "116121992738402" },
		{ "Kururin Kuru",  "119896940405402" },
		{ "Spongebob",     "6835794541" },
		{ "Fahhhh",        "123562480982353" },
		{ "Aughhh",        "9095205664" },
		{ "iPhone",        "4203251375" },
		{ "Siren",         "130677853589923" },
		{ "an anime",      "128090092396552" },
	}
	local stunSoundIds, stunSoundNames = {}, {}
	for _, e in ipairs(STUN_SOUND_LIST) do
		stunSoundIds[e[1]] = e[2]
		table.insert(stunSoundNames, e[1])
	end
	State.StunSound = { Enabled = false, Selected = "Default", Volume = 150 } -- Volume dalam %
	State.StunSoundNames = stunSoundNames

	local liveSounds = {}
	local function playStunSound()
		local SS = State.StunSound
		local id = stunSoundIds[SS.Selected] or stunSoundIds.Default
		pcall(function()
			local snd = Instance.new("Sound")
			snd.Name = "KinonStunSound"
			snd.SoundId = "rbxassetid://" .. tostring(id)
			snd.Volume = math.clamp((tonumber(SS.Volume) or 150) / 100, 0, 5)
			snd.PlaybackSpeed = 1
			snd.Parent = SoundService
			liveSounds[snd] = true
			local function cleanup()
				liveSounds[snd] = nil
				pcall(function() snd:Destroy() end)
			end
			snd.Ended:Connect(cleanup)
			task.delay(6, cleanup)
			snd:Play()
		end)
	end
	function obj.PreviewStunSound() playStunSound() end

	local stunSeen = setmetatable({}, { __mode = "k" })
	local stunPrimed = false
	track(RunService.Heartbeat:Connect(function()
		local SS = State.StunSound
		if unloaded or not SS.Enabled then
			if stunPrimed then stunPrimed = false; table.clear(stunSeen) end
			return
		end
		local firstPass = not stunPrimed
		stunPrimed = true
		local shouldPlay = false
		for _, p in ipairs(Players:GetPlayers()) do
			local char = p.Character
			if p ~= LP and char and isKillerPlayer(p) then
				local ok, stunned = pcall(isStunned, char)
				if ok and stunned then
					if not stunSeen[char] then
						stunSeen[char] = true
						if not firstPass then shouldPlay = true end
					end
				else
					stunSeen[char] = nil
				end
			end
		end
		if shouldPlay then playStunSound() end
	end))

	local function destroyEntry(char, animate)
		local e = cache[char]
		if not e then return end
		cache[char] = nil
		pcall(function() e.pulse:Cancel() end)
		pcall(function() if e.tween then e.tween:Cancel() end end)
		if animate and e.gui.Parent then
			TweenService:Create(e.scale, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0 }):Play()
			task.delay(0.25, function() pcall(function() e.gui:Destroy() end) end)
		else
			pcall(function() e.gui:Destroy() end)
		end
	end

	local function build(char, player)
		local head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
		if not head then return nil end

		local gui = new("BillboardGui", {
			Name = "KINON_StunIndicator",
			Size = UDim2.fromOffset(132, 36),
			StudsOffset = Vector3.new(0, 3.5, 0),
			AlwaysOnTop = true,
			LightInfluence = 0,
			MaxDistance = 5000,
			Adornee = head,
		}, char)

		local main = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(132, 36),
			BackgroundColor3 = C.Card,
			BackgroundTransparency = 0.05,
			BorderSizePixel = 0,
		}, gui)
		corner(main, 10)
		local scale = new("UIScale", { Scale = 0 }, main)
		local stroke = new("UIStroke", { Color = C.Accent, Thickness = 1.2, Transparency = 0.5 }, main)

		local holder = new("Frame", {
			Position = UDim2.new(0, 6, 0, 6),
			Size = UDim2.fromOffset(24, 24),
			BackgroundColor3 = C.Surface,
			BorderSizePixel = 0,
		}, main)
		corner(holder, 12)
		icon("zap", 14, C.Text, holder)

		new("TextLabel", {
			Position = UDim2.new(0, 38, 0, 5),
			Size = UDim2.new(1, -92, 0, 16),
			BackgroundTransparency = 1,
			Text = "STUNNED",
			TextColor3 = C.Text,
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
		}, main)
		local timeLabel = new("TextLabel", {
			Position = UDim2.new(1, -52, 0, 5),
			Size = UDim2.fromOffset(44, 16),
			BackgroundTransparency = 1,
			Text = "",
			TextColor3 = C.Text,
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Right,
		}, main)

		local barTrack = new("Frame", {
			Position = UDim2.new(0, 38, 1, -9),
			Size = UDim2.new(1, -46, 0, 4),
			BackgroundColor3 = C.Surface,
			BorderSizePixel = 0,
		}, main)
		corner(barTrack, 2)
		local fill = new("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = C.Accent,
			BorderSizePixel = 0,
		}, barTrack)
		corner(fill, 2)

		TweenService:Create(scale, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
		local pulse = TweenService:Create(stroke,
			TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
			{ Transparency = 0.1 })
		pulse:Play()

		return { gui = gui, scale = scale, pulse = pulse, fill = fill, timeLabel = timeLabel, total = 1, endAt = 0, tween = nil }
	end

	local function startTimer(e, left)
		e.total = math.max(left, 0.05)
		e.endAt = os.clock() + left
		pcall(function() if e.tween then e.tween:Cancel() end end)
		e.fill.Size = UDim2.fromScale(math.clamp(left / e.total, 0, 1), 1)
		e.tween = TweenService:Create(e.fill, TweenInfo.new(left, Enum.EasingStyle.Linear), { Size = UDim2.fromScale(0, 1) })
		e.tween:Play()
	end

	function obj.Clear(animate)
		for char in pairs(cache) do
			destroyEntry(char, animate)
		end
	end

	function obj.Destroy()
		obj.Clear(false)
		State.StunSound.Enabled = false
		for snd in pairs(liveSounds) do pcall(function() snd:Destroy() end) end
		table.clear(liveSounds)
	end

	track(RunService.Heartbeat:Connect(function(dt)
		acc = acc + dt
		if acc < 0.05 then return end
		acc = 0

		local S = State.ESPPlayer
		if unloaded or not (S.Enabled and S.StunInd) then
			if next(cache) then obj.Clear(true) end
			return
		end

		local seen = {}
		for _, p in ipairs(Players:GetPlayers()) do
			local char = p.Character
			if p ~= LP and char and isKillerPlayer(p) then
				local ok, stunned = pcall(isStunned, char)
				if ok and stunned then
					seen[char] = true
					local e = cache[char]
					local left = stunLeft(char)
					if not e then
						e = build(char, p)
						cache[char] = e
						if e then startTimer(e, left or DEFAULT_STUN) end
					elseif left and math.abs((e.endAt - os.clock()) - left) > 0.6 then
						startTimer(e, left)
					end
					if e then
						local remain = e.endAt - os.clock()
						if remain > 0.05 then
							e.timeLabel.Text = string.format("%.1fs", remain)
						elseif left then
							startTimer(e, left)
						else
							e.timeLabel.Text = "..."
						end
					end
				end
			end
		end

		for char in pairs(cache) do
			if not seen[char] then destroyEntry(char, char.Parent ~= nil) end
		end
	end))

	return obj
end)()

State.HitAreaObj = (function()
	local obj = {}
	local RANGE, ANGLE = 10, 90
	local SEG = 10
	local EDGE_STEPS = 4
	local DASH, GAP, DASH_MAX = 1.4, 1.0, 40
	local MAX_DIST = 160
	local LINE_LEN, LINE_LINGER = 50, 0.18 -- panjang maksimal Attack Line: 50 studs
	local HIDDEN_DASH_ID = "73681849513551"
	local SPEAR_CHARGE_IDS = { ["101443662521580"] = true, ["127622545856523"] = true } -- Veil Spear Throw 1 / 2
	local SPEAR_NOT_CHARGE_IDS = { ["71001061734896"] = true, ["129669521834246"] = true } -- Take Out / Put Away Spear

	local HA = {
		Color = Color3.fromRGB(0, 0, 0),
		FillColor = Color3.fromRGB(128, 128, 128),
		Pool = {}, FloorY = {},
	}
	obj.Settings = HA

	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Exclude
	rayParams.RespectCanCollide = true

	local function isKiller(plr)
		local team = plr.Team and string.lower(plr.Team.Name) or ""
		if string.find(team, "killer", 1, true) then return true end
		local ch = plr.Character
		if ch and (ch:GetAttribute("MorphedKiller") or ch:GetAttribute("Role") == "Killer"
			or ch:GetAttribute("IsKiller") == true) then
			return true
		end
		return false
	end

	local function newLine()
		local p = Instance.new("Part")
		p.Name = "KinonHitArea"
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.CastShadow = false
		p.Material = Enum.Material.Neon
		p.Color = HA.Color
		p.Transparency = 0.05
		p.Size = Vector3.new(0.2, 0.1, 0.2)
		p.Parent = workspace
		return p
	end

	local function newWedge()
		local w = Instance.new("WedgePart")
		w.Name = "KinonHitFill"
		w.Anchored = true
		w.CanCollide = false
		w.CanTouch = false
		w.CanQuery = false
		w.CastShadow = false
		w.Material = Enum.Material.SmoothPlastic
		w.Color = HA.FillColor
		w.Transparency = 0.4
		w.Size = Vector3.new(0.04, 0.1, 0.1)
		w.Parent = workspace
		return w
	end

	local function newAttackPart(name, cylinder)
		local p = Instance.new("Part")
		p.Name = name
		p.Anchored = true
		p.CanCollide = false
		p.CanTouch = false
		p.CanQuery = false
		p.CastShadow = false
		p.Material = Enum.Material.Neon
		p.Color = Color3.new(1, 1, 1)
		p.Transparency = 1
		if cylinder then p.Shape = Enum.PartType.Cylinder end
		p.Size = Vector3.new(0.1, 0.1, 0.1)
		p.Parent = workspace
		return p
	end

	local function setTri(w1, w2, a, b, c, thick)
		local ab, ac, bc = b - a, c - a, c - b
		local abd, acd, bcd = ab:Dot(ab), ac:Dot(ac), bc:Dot(bc)
		if abd > acd and abd > bcd then
			c, a = a, c
		elseif acd > bcd and acd > abd then
			a, b = b, a
		end
		ab, ac, bc = b - a, c - a, c - b
		local cr = ac:Cross(ab)
		if cr.Magnitude < 1e-4 or bc.Magnitude < 1e-4 then
			w1.Transparency = 1; w2.Transparency = 1
			return
		end
		local right = cr.Unit
		local up = bc:Cross(right).Unit
		local back = bc.Unit
		local height = math.abs(ab:Dot(up))
		w1.Transparency = 0.4; w2.Transparency = 0.4
		w1.Size = Vector3.new(thick, height, math.abs(ab:Dot(back)))
		w1.CFrame = CFrame.fromMatrix((a + b) / 2, right, up, back)
		w2.Size = Vector3.new(thick, height, math.abs(ac:Dot(back)))
		w2.CFrame = CFrame.fromMatrix((a + c) / 2, -right, up, -back)
	end

	local function lineSeg(part, a, b, thick)
		local d = (b - a).Magnitude
		if d < 0.01 then part.Transparency = 1; return end
		part.Transparency = 0.05
		part.Size = Vector3.new(thick, 0.1, d)
		part.CFrame = CFrame.lookAt((a + b) / 2, b)
	end

	local function groundPoint(x, z, floorY)
		local res = workspace:Raycast(Vector3.new(x, floorY + 3, z), Vector3.new(0, -9, 0), rayParams)
		local y = floorY
		if res and math.abs(res.Position.Y - floorY) <= 2.5 then y = res.Position.Y end
		return Vector3.new(x, y + 0.1, z)
	end

	local function edgePoints(fromP, toP, floorY)
		local pts = { fromP }
		for i = 1, EDGE_STEPS - 1 do
			local t = i / EDGE_STEPS
			pts[#pts + 1] = groundPoint(
				fromP.X + (toP.X - fromP.X) * t,
				fromP.Z + (toP.Z - fromP.Z) * t,
				floorY)
		end
		pts[#pts + 1] = toP
		return pts
	end

	local function pointAt(pts, cum, s)
		local n = #pts
		if s <= 0 then return pts[1] end
		if s >= cum[n] then return pts[n] end
		local i = 2
		while cum[i] < s do i = i + 1 end
		local seg = cum[i] - cum[i - 1]
		local t = seg > 1e-6 and (s - cum[i - 1]) / seg or 0
		return pts[i - 1]:Lerp(pts[i], t)
	end

	local function dashSide(lines, idx, pts, thick)
		local cum = { 0 }
		for i = 2, #pts do cum[i] = cum[i - 1] + (pts[i] - pts[i - 1]).Magnitude end
		local total = cum[#pts]
		if total < 0.2 then return idx end
		local n = math.max(1, math.floor((total + GAP) / (DASH + GAP) + 0.5))
		local period = (total + GAP) / n
		local dashLen = math.max(0.3, period - GAP)
		for k = 0, n - 1 do
			if idx >= DASH_MAX then break end
			local a = pointAt(pts, cum, k * period)
			local b = pointAt(pts, cum, k * period + dashLen)
			idx = idx + 1
			lineSeg(lines[idx], a, b, thick)
			lines[idx].Color = HA.Color
		end
		return idx
	end

	local function ensureArea(lines)
		if lines.hasArea then return end
		lines.hasArea = true
		for i = 1, DASH_MAX do lines[i] = newLine() end
	end

	local function dropArea(lines)
		if not lines.hasArea then return end
		lines.hasArea = false
		for i = 1, DASH_MAX do
			local l = lines[i]
			if l then pcall(function() l:Destroy() end); lines[i] = nil end
		end
		if lines.fill then
			for _, w in ipairs(lines.fill) do pcall(function() w:Destroy() end) end
			lines.fill = nil
		end
		lines.lastXZ = nil
	end

	local function hideAttack(lines)
		local atk = lines.atk
		if atk then
			atk.line.Transparency = 1
			atk.dot.Transparency = 1
		end
	end

	local function destroyAttack(lines)
		local atk = lines.atk
		if atk then
			pcall(function() atk.line:Destroy() end)
			pcall(function() atk.dot:Destroy() end)
			lines.atk = nil
		end
	end

	local function drawAttack(lines, origin, dir, camPos)
		local atk = lines.atk
		if not atk then
			atk = {
				line = newAttackPart("KinonAttackLine", false),
				dot = newAttackPart("KinonAttackDot", true),
			}
			lines.atk = atk
		end
		local res = workspace:Raycast(origin, dir * LINE_LEN, rayParams)
		local len = res and (res.Position - origin).Magnitude or LINE_LEN
		if len < 0.3 then
			hideAttack(lines)
			return
		end
		local thick = math.clamp((origin - camPos).Magnitude * 0.004, 0.12, 0.3)
		atk.line.Size = Vector3.new(thick, thick, len)
		atk.line.CFrame = CFrame.lookAt(origin + dir * (len / 2), origin + dir * len)
		atk.line.Transparency = 0.1

		if res then
			local dsz = math.clamp((res.Position - camPos).Magnitude * 0.02, 0.9, 2.2)
			local pos = res.Position + res.Normal * 0.03
			atk.dot.Size = Vector3.new(0.05, dsz, dsz)
			atk.dot.CFrame = CFrame.lookAt(pos, pos + res.Normal) * CFrame.Angles(0, math.rad(90), 0)
			atk.dot.Transparency = 0.1
		else
			atk.dot.Transparency = 1
		end
	end

	local function isAttacking(char)
		local hum = char:FindFirstChildOfClass("Humanoid")
		local animator = hum and hum:FindFirstChildOfClass("Animator")
		if not animator then return false end
		local ok, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
		if not ok or not tracks then return false end
		local isVeil = char:GetAttribute("MorphedKiller") == "Veil" or char:GetAttribute("Veil") == true
			or string.find(string.lower(char.Name), "veil", 1, true) ~= nil
		for _, t in ipairs(tracks) do
			local id = KINON_AnimationId(t)

			if id == HIDDEN_DASH_ID then
				local playing, pos = false, 0
				pcall(function() playing = t.IsPlaying; pos = t.TimePosition or 0 end)
				if playing and pos <= 1.5 then return true end
			end

			if id ~= "" and SPEAR_CHARGE_IDS[id] then
				local playing = false
				pcall(function() playing = t.IsPlaying end)
				if playing then return true end
			elseif isVeil and id ~= "" and not SPEAR_NOT_CHARGE_IDS[id] then
				local label = ""
				pcall(function()
					label = string.lower(tostring(t.Name or "") .. " " .. tostring(t.Animation and t.Animation.Name or ""))
				end)
				if label:find("charge", 1, true) or label:find("throw", 1, true) then
					local playing = false
					pcall(function() playing = t.IsPlaying end)
					if playing then return true end
				end
			end

			if id ~= "" and not KINON_IgnoredParryAnimationIds[id] and not VD_NO_PARRY_ANIMS[id] then
				local optional = VD_OPTIONAL_ATTACK_ANIMS[id]
				if optional or KINON_ParryAnimationIds[id] then
					local playing, pos = false, 0
					pcall(function() playing = t.IsPlaying; pos = t.TimePosition or 0 end)
					if playing and pos <= (optional and 1.2 or 0.55) then return true end
				end
			end
		end
		return false
	end

	local function release(plr)
		local lines = HA.Pool[plr]
		if lines then
			dropArea(lines)
			destroyAttack(lines)
			HA.Pool[plr] = nil
		end
		HA.FloorY[plr] = nil
	end

	local function releaseAll()
		for plr in pairs(HA.Pool) do release(plr) end
	end

	local function step(dt, wantArea, wantLine)
		local cam = workspace.CurrentCamera
		if not cam then return end
		local camPos = cam.CFrame.Position
		local now = os.clock()
		local fillOn = false -- isi warna di dalam Hit Area dihapus (kosong, hanya garis tepi)

		local filter = { cam }
		for _, pl in ipairs(Players:GetPlayers()) do
			if pl.Character then filter[#filter + 1] = pl.Character end
		end
		rayParams.FilterDescendantsInstances = filter

		for _, plr in ipairs(Players:GetPlayers()) do
			local char = plr.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if hrp and hum and hum.Health > 0 and isKiller(plr) and (hrp.Position - camPos).Magnitude <= MAX_DIST then
				local lines = HA.Pool[plr]
				if not lines then
					lines = {}
					HA.Pool[plr] = lines
				end

				local look = hrp.CFrame.LookVector
				local flat = Vector3.new(look.X, 0, look.Z)
				if flat.Magnitude < 0.01 then flat = Vector3.new(0, 0, -1) end
				flat = flat.Unit
				local alpha = 1 - math.exp(-(dt or 0.016) * 20)
				local sFlat = lines.smFlat
				if not sFlat then
					sFlat = flat
				else
					sFlat = sFlat:Lerp(flat, alpha)
					if sFlat.Magnitude < 0.01 then sFlat = flat end
					sFlat = sFlat.Unit
				end
				lines.smFlat = sFlat

				if wantArea then
					ensureArea(lines)

					local hip = (hum.HipHeight and hum.HipHeight > 0) and hum.HipHeight or 2
					local feetY = hrp.Position.Y - (hip + hrp.Size.Y / 2)
					local origin = Vector3.new(hrp.Position.X, feetY + 1.5, hrp.Position.Z)
					local floorHit = workspace:Raycast(origin, Vector3.new(0, -14, 0), rayParams)
					local targetY = floorHit and floorHit.Position.Y or feetY
					local prevY = HA.FloorY[plr]
					local floorY
					if prevY and math.abs(targetY - prevY) < 2.5 then
						floorY = prevY + (targetY - prevY) * 0.4 -- haluskan supaya tidak loncat-loncat
					else
						floorY = targetY
					end
					HA.FloorY[plr] = floorY

					local apexXZ = Vector3.new(hrp.Position.X, 0, hrp.Position.Z)
					local sXZ = lines.smXZ
					if not sXZ or (sXZ - apexXZ).Magnitude > 12 then sXZ = apexXZ else sXZ = sXZ:Lerp(apexXZ, alpha) end
					lines.smXZ = sXZ

					local unchanged = lines.lastXZ ~= nil and (lines.lastXZ - sXZ).Magnitude < 0.004
						and math.abs((lines.lastFloorY or 0) - floorY) < 0.01
						and lines.lastFlat ~= nil and lines.lastFlat:Dot(sFlat) > 0.99995
						and lines.lastFill == fillOn and lines.lastColor == HA.Color and lines.lastFillColor == HA.FillColor
					if not unchanged then
						lines.lastXZ, lines.lastFloorY, lines.lastFlat = sXZ, floorY, sFlat
						lines.lastFill, lines.lastColor, lines.lastFillColor = fillOn, HA.Color, HA.FillColor

						local ax, az = sXZ.X, sXZ.Z
						local apexP = Vector3.new(ax, floorY + 0.1, az)

						local arc = {}
						for k = 0, SEG do
							local ang = math.rad(-ANGLE / 2 + ANGLE * (k / SEG))
							local d = (CFrame.Angles(0, ang, 0) * sFlat) * RANGE
							arc[k + 1] = groundPoint(ax + d.X, az + d.Z, floorY)
						end
						local left = edgePoints(apexP, arc[1], floorY)
						local right = edgePoints(arc[SEG + 1], apexP, floorY)

						local thick = math.clamp((apexP - camPos).Magnitude * 0.006, 0.18, 0.45)
						local idx = dashSide(lines, 0, left, thick)
						idx = dashSide(lines, idx, arc, thick)
						idx = dashSide(lines, idx, right, thick)
						for i = idx + 1, DASH_MAX do lines[i].Transparency = 1 end

						if fillOn then
							if not lines.fill then
								lines.fill = {}
								for i = 1, SEG * 2 do lines.fill[i] = newWedge() end
							end
							local fy = Vector3.new(0, -0.04, 0)
							for k = 1, SEG do
								setTri(lines.fill[k * 2 - 1], lines.fill[k * 2], apexP + fy, arc[k] + fy, arc[k + 1] + fy, 0.04)
							end
							for _, w in ipairs(lines.fill) do w.Color = HA.FillColor end
						elseif lines.fill then
							for _, w in ipairs(lines.fill) do pcall(function() w:Destroy() end) end
							lines.fill = nil
						end
					end
				else
					dropArea(lines)
				end

				if wantLine then
					if State.ESPPlayer.AttackLineAlways == true or isAttacking(char) then lines.attackUntil = now + LINE_LINGER end
					if (lines.attackUntil or 0) > now then
						drawAttack(lines, hrp.Position, sFlat, camPos)
					else
						hideAttack(lines)
					end
				else
					destroyAttack(lines)
				end
			else
				release(plr)
			end
		end
	end

	track(RunService.RenderStepped:Connect(function(dt)
		if unloaded then return end
		local S = State.ESPPlayer
		local area = S.Enabled and S.HitArea == true
		local line = S.Enabled and S.AttackLine == true
		if not area and not line then
			if next(HA.Pool) then releaseAll() end
			return
		end
		if not pcall(step, dt, area, line) then releaseAll() end
	end))

	track(Players.PlayerRemoving:Connect(function(plr) release(plr) end))

	function obj:Destroy()
		releaseAll()
	end

	return obj
end)()

do
	local s = State.ESPPlayer
	local esp = State.PlayerESPObj
	local card = addCard(5, "eye", "ESP Player", "Survivor & Killer", "ESPPlayer")
	local function opt(label, icn, field, colorKey)
		addCheckbox(card, label, icn,
			function() return s[field] end,
			function(v) s[field] = v; fire("ESPPlayer") end,
			colorKey and function() return esp.Palette[colorKey] end or nil,
			colorKey and function(c) esp:SetColor(colorKey, c) end or nil)
	end
	opt("Show Survivor",  "user",           "ShowPlayer", "Player")
	opt("Show Killer",    "skull",          "ShowKiller", "Killer")
	opt("Show Name",      "tag",            "ShowName")
	opt("Show Distance",  "ruler",          "ShowDist")
	opt("Show Status",    "heart-pulse",    "ShowStatus")
	opt("Show Item",      "package",        "ShowItem")
	opt("Highlight ESP",  "sparkles",       "HLFill")
	opt("Outline ESP",    "scan",           "HLOutline")
	opt("Hook Counter",   "link",           "HookCounter")
	opt("Killer Warning", "triangle-alert", "KillerWarn")
	addCheckbox(card, "Stun Indicator", "zap",
		function() return s.StunInd == true end,
		function(v) s.StunInd = v end)
	local ss = State.StunSound
	addCheckbox(card, "Stun Sound", "volume-2",
		function() return ss.Enabled == true end,
		function(v) ss.Enabled = v end)
	addDropdown(card, "Stun Sound Type", "music", State.StunSoundNames,
		function(v) return v end,
		function() return ss.Selected end,
		function(v) ss.Selected = v; pcall(State.StunObj.PreviewStunSound) end)
	addSlider(card, "Stun Sound Volume %", "volume-2", 10, 500,
		function() return math.clamp(math.floor(tonumber(ss.Volume) or 150), 10, 500) end,
		function(v) ss.Volume = v end)

	local hit = State.HitAreaObj
	addCheckbox(card, "Killer Hit Area", "target",
		function() return s.HitArea == true end,
		function(v) s.HitArea = v end,
		function() return hit.Settings.Color end,
		function(c) hit.Settings.Color = c end)
	addCheckbox(card, "Attack Line", "move-right",
		function() return s.AttackLine == true end,
		function(v) s.AttackLine = v end)
	addCheckbox(card, "Attack Line Always On", "infinity",
		function() return s.AttackLineAlways == true end,
		function(v) s.AttackLineAlways = v end)
end

do
	local s = State.ESPWorld
	local esp = State.WorldESPObj
	local card = addCard(6, "globe", "ESP World", "Objects on the map", "ESPWorld")
	local function opt(label, icn, field, colorKey)
		addCheckbox(card, label, icn,
			function() return s[field] end,
			function(v) s[field] = v; fire("ESPWorld") end,
			colorKey and function() return esp.Palette[colorKey] end or nil,
			colorKey and function(c) esp:SetColor(colorKey, c) end or nil)
	end
	opt("Generator",       "zap",        "Generator", "Generator")
	opt("Generator Info",  "percent",    "GeneratorName")
	opt("Pallet",          "layers",     "Pallet", "Pallet")
	opt("Window",          "app-window", "Window", "Window")
	opt("Hook",            "anchor",     "Hook", "Hook")
	opt("Gate",            "door-open",  "Gate", "Gate")
	opt("SCP",             "ghost",      "SCP", "SCP")
	opt("SCP Slow Only",   "gauge",      "SCPOnlySlow")
	opt("Pumpkin",         "candy",      "Pumpkin", "Pumpkin")
	opt("Bear Trap",       "bomb",       "BearTrap", "BearTrap")
	opt("Hide Trap Text",  "eye-off",    "BearTrapNoText")
	opt("Highlight ESP",   "sparkles",   "HLFill")
	opt("Outline ESP",     "scan",       "HLOutline")
end

State.Utilities = {
	Enabled = false,
	AntiBlindFlashlightK = false, DashLockK = false, AimlockAttackK = false, NoSlowDown = false,
	PalletReflexS = false,
	AutoRun = false,
	AlwaysFastVaultS = false, UnlimitedVaultS = false,
	AutoDodgeAbyssS = false,
	DashRadius = 50, AimRadius = 50,
}
State.UtilityHandlers = {}
Hooks.Utilities = function(s)
	for key, handler in pairs(State.UtilityHandlers) do
		pcall(handler, s.Enabled and s[key] == true)
	end
end

do
	local Lighting = game:GetService("Lighting")
	local RunService = game:GetService("RunService")
	local ENV = getgenv and getgenv() or _G
	ENV.VD = ENV.VD or {}
	State.AntiBlindOn = false
	local hb
	local saved = {}

	State.IsKillerNow = function()
		local char = LP.Character
		if not char then return false end
		if LP.Team and string.find(string.lower(LP.Team.Name), "killer", 1, true) then return true end
		if char:GetAttribute("MorphedKiller") then return true end
		return false
	end

	local function remember(inst, prop)
		saved[#saved + 1] = { inst, prop, inst[prop] }
	end

	local function clearVisuals()
		if not State.AntiBlindOn or not State.IsKillerNow() then return end
		for _, child in ipairs(Lighting:GetChildren()) do
			if child:IsA("BlurEffect") then
				if child.Enabled or child.Size ~= 0 then
					remember(child, "Enabled"); remember(child, "Size")
					child.Size = 0
					child.Enabled = false
				end
			elseif child:IsA("ColorCorrectionEffect") then
				if child.Enabled and (child.Brightness < -0.2 or child.Contrast > 0.5) then
					remember(child, "Enabled")
					child.Enabled = false
				end
			end
		end
		local pg = LP:FindFirstChild("PlayerGui")
		if pg then
			for _, gui in ipairs(pg:GetChildren()) do
				if gui:IsA("ScreenGui") and gui.Enabled then
					local n = string.lower(gui.Name)
					if n:find("blind", 1, true) or n:find("flash", 1, true) then
						remember(gui, "Enabled")
						gui.Enabled = false
					end
				end
			end
		end
	end

	State.UtilityHandlers.AntiBlindFlashlightK = function(on)
		State.AntiBlindOn = on == true
		ENV.VD.KILLER_AntiBlind = State.AntiBlindOn
		if hb then hb:Disconnect(); hb = nil end
		if State.AntiBlindOn then
			hb = RunService.Heartbeat:Connect(clearVisuals)
		else
			for i = #saved, 1, -1 do
				local e = saved[i]
				pcall(function() e[1][e[2]] = e[3] end)
			end
			saved = {}
		end
	end
end
do
	local ENV = getgenv and getgenv() or _G
	ENV.VD = ENV.VD or {}
	ENV.VD.NoFallDamage = false
	local function sync()
		ENV.VD.NoFallDamage = (State.NoSlow.K or State.NoSlow.S) and true or false
	end
	State.UtilityHandlers.NoSlowDown = function(on)
		State.NoSlow.K = on == true
		State.NoSlow.S = on == true
		sync()
	end
end

do
	local AlwaysFastVaultEnabled = false

	local function InstallAlwaysFastVaultHooks()
		local rs = game:GetService("ReplicatedStorage")
		pcall(function()
			local module = require(rs:WaitForChild("Modules"):WaitForChild("Survivors"):WaitForChild("SurvivorVault"))
			if module and type(module.evaluate) == "function" and not module._VDFastVaultHooked then
				module._VDOriginalEvaluate = module.evaluate
				module.evaluate = function(self, ...)
					if AlwaysFastVaultEnabled then
						return true, "ready", 5
					end
					return module._VDOriginalEvaluate(self, ...)
				end
				module._VDFastVaultHooked = true
			end
		end)
		pcall(function()
			local module = require(rs:WaitForChild("Modules"):WaitForChild("Survivors"):WaitForChild("SurvivorAnimationsController"))
			if module and type(module._validateFastVault) == "function" and not module._VDFastVaultHooked then
				module._VDOriginalValidateFastVault = module._validateFastVault
				module._validateFastVault = function(self, ...)
					if AlwaysFastVaultEnabled then
						return true, "ready", 5
					end
					return module._VDOriginalValidateFastVault(self, ...)
				end
				module._VDFastVaultHooked = true
			end
		end)
	end

	local fvConn
	local function runInstall()
		task.spawn(function()
			for _ = 1, 20 do
				if unloaded or not AlwaysFastVaultEnabled then break end
				InstallAlwaysFastVaultHooks()
				task.wait(0.25)
			end
		end)
	end
	State.UtilityHandlers.AlwaysFastVaultS = function(state)
		AlwaysFastVaultEnabled = state and true or false
		if fvConn then fvConn:Disconnect(); fvConn = nil end
		if AlwaysFastVaultEnabled then
			runInstall()
			fvConn = LP.CharacterAdded:Connect(runInstall)
		end
	end
end

do
	local CollectionService = game:GetService("CollectionService")
	local UnlimitedVaultEnabled = false
	local UnlimitedVaultConn = nil

	local function EnableUnlimitedVault()
		if UnlimitedVaultEnabled then return end
		UnlimitedVaultEnabled = true
		if UnlimitedVaultConn then UnlimitedVaultConn:Disconnect() end

		for _, v in ipairs(CollectionService:GetTagged("Blocked")) do
			CollectionService:RemoveTag(v, "Blocked")
		end

		UnlimitedVaultConn = CollectionService:GetInstanceAddedSignal("Blocked"):Connect(function(instance)
			CollectionService:RemoveTag(instance, "Blocked")
		end)
	end

	local function DisableUnlimitedVault()
		UnlimitedVaultEnabled = false
		if UnlimitedVaultConn then
			UnlimitedVaultConn:Disconnect()
			UnlimitedVaultConn = nil
		end
	end

	State.UtilityHandlers.UnlimitedVaultS = function(state)
		if state then EnableUnlimitedVault() else DisableUnlimitedVault() end
	end
end
do
	local U = State.Utilities
	local DASH_ANIM = "rbxassetid://98163597193511"
	local flags = { dash = false, aim = false }
	local conn, charConn, animConn, guiConn
	local dashActive = false
	local attackInput, attackAt, tapUntil = nil, 0, 0
	local dashTarget, aimTarget
	local guiHooked = false

	local function isSurvivor(p)
		local t = p and p.Team and p.Team.Name
		return t ~= nil and string.find(string.lower(t), "survivor", 1, true) ~= nil
	end

	local function myRoot()
		local c = LP.Character
		return c and c:FindFirstChild("HumanoidRootPart")
	end

	local function hooked(ch)
		return ch:GetAttribute("IsHooked") == true or ch:GetAttribute("State") == "Hooked"
	end

	local function closestWithin(radius)
		local root = myRoot()
		if not root then return nil end
		local best, bestDist = nil, radius
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP and isSurvivor(plr) and plr.Character then
				local hum = plr.Character:FindFirstChildOfClass("Humanoid")
				local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
				if hum and hrp and hum.Health > 30 and not hooked(plr.Character) then
					local d = (hrp.Position - root.Position).Magnitude
					if d <= bestDist then best, bestDist = hrp, d end
				end
			end
		end
		return best
	end

	local function targetValid(part, radius)
		if not part or not part.Parent then return false end
		local ch = part.Parent
		local hum = ch:FindFirstChildOfClass("Humanoid")
		local root = myRoot()
		if not hum or not root or hum.Health <= 30 or hooked(ch) then return false end
		return (part.Position - root.Position).Magnitude <= radius
	end

	local function hookDashChar(char)
		task.spawn(function()
			local hum = char:WaitForChild("Humanoid", 5)
			local animator = hum and hum:WaitForChild("Animator", 5)
			if not animator or unloaded then return end
			if animConn then animConn:Disconnect() end
			animConn = animator.AnimationPlayed:Connect(function(track)
				local id = track.Animation and track.Animation.AnimationId
				if id == DASH_ANIM and flags.dash then
					dashActive = true
					track.Stopped:Connect(function() dashActive = false end)
					task.delay(1.5, function() dashActive = false end)
				end
			end)
		end)
	end

	local function hookAttackButton(obj)
		if not obj:IsA("GuiButton") then return end
		if obj:IsDescendantOf(Gui) then return end
		local n = string.lower(obj.Name)
		if string.find(n, "attack", 1, true) or string.find(n, "hit", 1, true)
			or string.find(n, "slash", 1, true) or string.find(n, "swing", 1, true) then
			obj.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch
					or input.UserInputType == Enum.UserInputType.MouseButton1 then
					attackInput, attackAt = input, os.clock()
				end
			end)
			obj.TouchTap:Connect(function() tapUntil = os.clock() + 0.25 end)
		end
	end

	local function attackHeld()
		if attackInput then
			local st = attackInput.UserInputState
			if st == Enum.UserInputState.End or st == Enum.UserInputState.Cancel or os.clock() - attackAt > 8 then
				attackInput = nil
			else
				return true
			end
		end
		return os.clock() < tapUntil
	end

	local function step()
		if unloaded then return end
		local cam = workspace.CurrentCamera
		if not cam then return end
		if flags.dash and dashActive then
			local radius = tonumber(U.DashRadius) or 50
			if not targetValid(dashTarget, radius * 1.3) then dashTarget = closestWithin(radius) end
			if dashTarget then cam.CFrame = CFrame.new(cam.CFrame.Position, dashTarget.Position) end
		else
			dashTarget = nil
		end
		if flags.aim and LP.Team and LP.Team.Name == "Killer" and attackHeld() then
			local radius = tonumber(U.AimRadius) or 50
			if not targetValid(aimTarget, radius * 1.3) then aimTarget = closestWithin(radius) end
			if aimTarget then cam.CFrame = CFrame.new(cam.CFrame.Position, aimTarget.Position) end
		else
			aimTarget = nil
		end
	end

	local function sync()
		local need = flags.dash or flags.aim
		if need and not conn then
			conn = RunService.RenderStepped:Connect(function() pcall(step) end)
			if LP.Character then hookDashChar(LP.Character) end
			charConn = LP.CharacterAdded:Connect(hookDashChar)
			if not guiHooked then
				guiHooked = true
				task.spawn(function()
					local pg = LP:WaitForChild("PlayerGui", 10)
					if not pg then return end
					for _, d in ipairs(pg:GetDescendants()) do pcall(hookAttackButton, d) end
					guiConn = pg.DescendantAdded:Connect(function(d) pcall(hookAttackButton, d) end)
				end)
			end
		elseif not need and conn then
			conn:Disconnect(); conn = nil
			if charConn then charConn:Disconnect(); charConn = nil end
			if animConn then animConn:Disconnect(); animConn = nil end
			if guiConn then guiConn:Disconnect(); guiConn = nil end
			guiHooked = false
			dashActive, dashTarget, aimTarget = false, nil, nil
		end
	end

	State.UtilityHandlers.DashLockK = function(on)
		flags.dash = on == true
		if not flags.dash then dashActive = false end
		sync()
	end
	State.UtilityHandlers.AimlockAttackK = function(on)
		flags.aim = on == true
		if not flags.aim then aimTarget, attackInput, tapUntil = nil, nil, 0 end
		sync()
	end
end

do
	local RunService = game:GetService("RunService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ENV = getgenv and getgenv() or _G
	ENV.VD = ENV.VD or {}
	local PR = { on = false, used = {}, lastScan = 0, lastDrop = 0, cache = {}, cacheAt = 0 }
	State.PalletDist = 20
	local hb, charConn

	local function isSurvivor()
		local team = LP.Team
		return team ~= nil and (team.Name == "Survivors" or team.Name == "Survivor")
	end

	local function killerRoot()
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP and plr.Character and plr.Team and string.find(string.lower(plr.Team.Name), "killer", 1, true) then
				local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
				if hrp then return hrp end
			end
		end
		return nil
	end

	local function pallets()
		local now = os.clock()
		if now - PR.cacheAt < 1 then return PR.cache end
		PR.cacheAt = now
		local list = {}
		local map = workspace:FindFirstChild("Map")
		if map then
			for _, obj in ipairs(map:GetDescendants()) do
				if obj.Name == "Palletwrong" and (obj:IsA("Model") or obj:IsA("Folder")) then
					list[#list + 1] = obj
				end
			end
		end
		PR.cache = list
		return list
	end

	local function isDropped(m)
		if not m or not m.Parent then return true end
		if PR.used[m] then return true end
		local ok1, d = pcall(function() return m:GetAttribute("Destroyed") end)
		if ok1 and d == true then return true end
		local ok2, b = pcall(function() return m:GetAttribute("Broken") end)
		if ok2 and b == true then return true end
		if not m:FindFirstChildWhichIsA("BasePart", true) then return true end
		return false
	end

	local function slidePoint(m)
		local sp = m:FindFirstChild("PalletPointSlide")
		if sp then return sp end
		for _, c in ipairs(m:GetDescendants()) do
			if c.Name == "PalletPointSlide" then return c end
		end
		return m:FindFirstChild("PalletPoint")
	end

	local function dropEvent()
		local r = ReplicatedStorage:FindFirstChild("Remotes")
		local f = r and r:FindFirstChild("Pallet")
		return f and f:FindFirstChild("PalletDropEvent")
	end

	local function step()
		if not PR.on or not isSurvivor() then return end
		local now = os.clock()
		if now - PR.lastScan < 0.2 then return end
		PR.lastScan = now
		if now - PR.lastDrop < 2.5 then return end
		pcall(function()
			local char = LP.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if not root or not hum or hum.Health <= 0 then return end
			local k = killerRoot()
			if not k then return end
			if (root.Position - k.Position).Magnitude > State.PalletDist then return end
			local ev = dropEvent()
			if not ev then return end
			local best, bestD = nil, 8
			for _, pal in ipairs(pallets()) do
				if not isDropped(pal) then
					local ref = pal:FindFirstChild("PalletPoint") or pal:FindFirstChild("PalletPointSlide") or pal:FindFirstChildWhichIsA("BasePart", true)
					if ref then
						local d = (root.Position - ref.Position).Magnitude
						if d < bestD then bestD = d; best = pal end
					end
				end
			end
			if best then
				local target = slidePoint(best)
				if target then
					pcall(function() ev:FireServer(target) end)
					PR.used[best] = true
					PR.lastDrop = os.clock()
				end
			end
		end)
	end

	State.UtilityHandlers.PalletReflexS = function(on)
		PR.on = on == true
		ENV.VD.PalletReflex = PR.on
		if hb then hb:Disconnect(); hb = nil end
		if charConn then charConn:Disconnect(); charConn = nil end
		PR.used = {}
		PR.cacheAt = 0
		if PR.on then
			hb = RunService.Heartbeat:Connect(step)
			charConn = LP.CharacterAdded:Connect(function()
				task.wait(0.5)
				PR.used = {}
				PR.cacheAt = 0
			end)
		end
	end
end
do
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ABYSS_ANIMATION_ID = "100014992013740"
	local TRIGGER_RANGE = 40
	local CROUCH_HOLD = 1.2

	local conns = {}
	local watchedChars = setmetatable({}, { __mode = "k" })
	local watchedAnimators = setmetatable({}, { __mode = "k" })
	local running = false
	local busy = false

	local function setCrouchServer(v)
		pcall(function()
			ReplicatedStorage.Remotes.Mechanics.ChangeAttribute:FireServer("Crouchingserver", v)
		end)
	end

	local function clickCrouchButton()
		pcall(function()
			local pg = LP:FindFirstChildOfClass("PlayerGui")
			local survMob = pg and pg:FindFirstChild("Survivor-mob")
			local controls = survMob and survMob:FindFirstChild("Controls")
			local crouchBtn = controls and controls:FindFirstChild("crouch")
			if crouchBtn then firesignal(crouchBtn.MouseButton1Click) end
		end)
	end

	local function triggerCrouch()
		if busy then return end
		busy = true
		task.spawn(function()
			local startT = tick()
			local char = LP.Character
			if char then
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				pcall(function() char:SetAttribute("Crouching", true) end)
				setCrouchServer(true)
				pcall(function() ReplicatedStorage.Remotes.Chase.Runevent:FireServer(char, false) end)
				if humanoid then pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Landed) end) end
				clickCrouchButton()
				while tick() - startT < CROUCH_HOLD and not unloaded do
					setCrouchServer(true)
					task.wait(0.1)
				end
				pcall(function() char:SetAttribute("Crouching", false) end)
				setCrouchServer(false)
				if humanoid then pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Landed) end) end
				clickCrouchButton()
			end
			busy = false
		end)
	end

	local function attachAnimator(killerChar, animator)
		if not animator or watchedAnimators[animator] then return end
		watchedAnimators[animator] = true
		conns[#conns + 1] = animator.AnimationPlayed:Connect(function(playedTrack)
			if not running or unloaded then return end
			local animation = playedTrack and playedTrack.Animation
			local animationId = animation and animation.AnimationId or ""
			if animationId:match("%d+") ~= ABYSS_ANIMATION_ID then return end

			local myChar = LP.Character
			if not myChar then return end
			local state = myChar:GetAttribute("State")
			if myChar:GetAttribute("Knocked") == true
				or myChar:GetAttribute("IsHooked") == true
				or state == "Downed" or state == "Dead" then return end

			local myRoot = myChar:FindFirstChild("HumanoidRootPart")
			local killerRoot = killerChar and killerChar:FindFirstChild("HumanoidRootPart")
			if myRoot and killerRoot and (myRoot.Position - killerRoot.Position).Magnitude <= TRIGGER_RANGE then
				triggerCrouch()
			end
		end)
	end

	local function attachChar(killerChar)
		if not killerChar or watchedChars[killerChar] then return end
		watchedChars[killerChar] = true
		task.spawn(function()
			local humanoid = killerChar:FindFirstChildOfClass("Humanoid") or killerChar:WaitForChild("Humanoid", 5)
			if not humanoid or not running then return end
			local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)
			if animator and running then attachAnimator(killerChar, animator) end
			conns[#conns + 1] = humanoid.ChildAdded:Connect(function(child)
				if running and child:IsA("Animator") then attachAnimator(killerChar, child) end
			end)
		end)
	end

	local function isKillerPlayer(player)
		return player.Team ~= nil and string.find(string.lower(player.Team.Name), "killer", 1, true) ~= nil
	end

	local function watchPlayer(player)
		if player == LP then return end
		local function tryAttach()
			if running and isKillerPlayer(player) and player.Character then
				attachChar(player.Character)
			end
		end
		conns[#conns + 1] = player.CharacterAdded:Connect(function()
			task.wait(0.2)
			tryAttach()
		end)
		conns[#conns + 1] = player:GetPropertyChangedSignal("Team"):Connect(tryAttach)
		tryAttach()
	end

	State.UtilityHandlers.AutoDodgeAbyssS = function(on)
		on = on == true
		for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
		conns = {}
		watchedChars = setmetatable({}, { __mode = "k" })
		watchedAnimators = setmetatable({}, { __mode = "k" })
		running = on
		if not on then return end
		for _, player in ipairs(Players:GetPlayers()) do watchPlayer(player) end
		conns[#conns + 1] = Players.PlayerAdded:Connect(watchPlayer)
	end
end

do
	local VIM = game:GetService("VirtualInputManager")
	local GuiService = game:GetService("GuiService")
	local active = false

	local function isSpectating()
		local t = LP.Team
		return t ~= nil and t.Name:lower():find("spectator", 1, true) ~= nil
	end
	local function releaseShift()
		pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game) end)
	end
	local function findSprintButton()
		local pg = LP:FindFirstChildOfClass("PlayerGui")
		local mob = pg and pg:FindFirstChild("Survivor-mob")
		local ctl = mob and mob:FindFirstChild("Controls")
		local sp = ctl and ctl:FindFirstChild("sprint")
		if not sp then return nil end
		if sp:IsA("GuiButton") then return sp end
		local ic = sp:FindFirstChild("icon")
		if ic and ic:IsA("GuiButton") then return ic end
		if ic and ic.Parent and ic.Parent:IsA("GuiButton") then return ic.Parent end
		if sp.Parent and sp.Parent:IsA("GuiButton") then return sp.Parent end
		return sp
	end
	local function tapSprint()
		local btn = findSprintButton()
		if not btn then return false end
		pcall(function()
			if type(firesignal) == "function" then
				firesignal(btn.MouseButton1Click)
				firesignal(btn.MouseButton1Down)
				task.wait(0.04)
				firesignal(btn.MouseButton1Up)
			else
				local p, sz = btn.AbsolutePosition, btn.AbsoluteSize
				local inset = GuiService:GetGuiInset()
				local x = p.X + sz.X / 2 + inset.X
				local y = p.Y + sz.Y / 2 + inset.Y
				VIM:SendTouchEvent(9901, 0, x, y)
				task.wait(0.04)
				VIM:SendTouchEvent(9901, 2, x, y)
			end
		end)
		return true
	end
	local function charAttr(a, b)
		local ch = LP.Character
		return ch ~= nil and (ch:GetAttribute(a) == true or (b ~= nil and ch:GetAttribute(b) == true))
	end
	local function isCrouching() return charAttr("Crouching", "Crouchingserver") end
	local function isSprinting() return charAttr("Sprinting", "IsRunning") end

	State.UtilityHandlers.AutoRun = function(on) active = on == true end

	task.spawn(function()
		local shiftHeld, mobileTouched, lastTap = false, false, 0
		local tapStreak, pauseUntil = 0, 0
		while not unloaded do
			task.wait(0.12)
			local on = active and not isSpectating()
			local btn = findSprintButton()
			local mobile = false
			if btn ~= nil then
				local vis = false
				pcall(function() vis = btn.AbsoluteSize.X > 0 and btn:IsDescendantOf(game) end)
				mobile = vis and (UserInputService.TouchEnabled or not UserInputService.KeyboardEnabled)
			end
			if on then
				pcall(function()
					if mobile then
						local crouch, sprint = isCrouching(), isSprinting()
						local now = tick()
						if sprint then tapStreak = 0 end
						if now - lastTap > 0.6 and now > pauseUntil then
							if crouch then
								if sprint then tapSprint(); lastTap = now end
							elseif not sprint then
								tapSprint(); lastTap = now
								tapStreak = tapStreak + 1
								if tapStreak >= 4 then
									tapStreak = 0
									pauseUntil = now + 15
								end
							end
						end
						mobileTouched = true
					else
						VIM:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
						shiftHeld = true
					end
				end)
			else
				if shiftHeld then releaseShift(); shiftHeld = false end
				if mobileTouched then
					mobileTouched = false
					pcall(function() if isSprinting() then tapSprint() end end)
				end
			end
		end
		if shiftHeld then releaseShift() end
	end)
end

do
	local s = State.Utilities
	local card = addCard(10, "wrench", "Utilities", "Killer and Survivor tools", "Utilities")
	local function util(role, label, icn, key)
		addCheckbox(card, label, icn,
			function() return s[key] end,
			function(v)
				s[key] = v
				local handler = State.UtilityHandlers[key]
				if handler then pcall(handler, s.Enabled and v) end
			end, nil, nil, role)
	end
	util(nil, "No Slow Down (Anti Fall)", "gauge", "NoSlowDown")
	util(nil, "Auto Run", "footprints", "AutoRun")
	util("Killer", "Anti Blind Flashlight", "flashlight-off", "AntiBlindFlashlightK")
	util("Killer", "Dash Lock", "lock", "DashLockK")
	util("Killer", "Aimlock Attack", "crosshair", "AimlockAttackK")
	util("Survivor", "Pallet Reflex", "layers", "PalletReflexS")
	util("Survivor", "Always Fast Vault", "zap", "AlwaysFastVaultS")
	util("Survivor", "Unlimited Vault", "infinity", "UnlimitedVaultS")
	util("Survivor", "Auto Dodge Abyss", "shield", "AutoDodgeAbyssS")
	addSlider(card, "Dash Lock Radius", "ruler", 20, 150,
		function() return math.clamp(math.floor(tonumber(s.DashRadius) or 50), 20, 150) end,
		function(v) s.DashRadius = v end)
	addSlider(card, "Pallet Reflex Distance", "ruler", 5, 80,
		function() return math.clamp(math.floor(tonumber(State.PalletDist) or 20), 5, 80) end,
		function(v) State.PalletDist = v end)
end

do
	local s = State.TOF
	local card = addCard(11, "crosshair", "Aimlock Twist of Fate", "", "TOF")
	addDropdown(card, "Aimlock Target Mode", "user", { "Killer", "Survivor" },
		function(v) return v end,
		function() return s.TargetMode or "Killer" end,
		function(v) s.TargetMode = v end)
	addSlider(card, "Aimlock FOV Radius", "ruler", 50, 1000,
		function() return math.clamp(math.floor(tonumber(s.FOV) or 250), 50, 1000) end,
		function(v) s.FOV = v end)
	addSlider(card, "Aimlock Smoothness %", "gauge", 5, 100,
		function() return math.clamp(math.floor(tonumber(s.Smooth) or 50), 5, 100) end,
		function(v) s.Smooth = v end)
	addSlider(card, "Aimlock Prediction %", "move", 0, 100,
		function() return math.clamp(math.floor(tonumber(s.Predict) or 12), 0, 100) end,
		function(v) s.Predict = v end)
	addCheckbox(card, "Visibility Check", "eye",
		function() return s.Vis end,
		function(v) s.Vis = v end)
	addCheckbox(card, "Aimlock Laser", "scan-line",
		function() return s.ShowLaser end,
		function(v) s.ShowLaser = v end)
end

do
	local s = State.TOFSilent
	local card = addCard(12, "eye", "Silent Aim Twist of Fate", "", "TOFSilent")
	addCheckbox(card, "Predict", "move",
		function() return s.Predict end,
		function(v) s.Predict = v end)
	addCheckbox(card, "Predict Zig-Zag", "move",
		function() return s.ZigZag end,
		function(v) s.ZigZag = v end)
	addSlider(card, "Predict Lead %", "gauge", 50, 250,
		function() return math.clamp(math.floor(tonumber(s.LeadScale) or 100), 50, 250) end,
		function(v) s.LeadScale = v end)
	addCheckbox(card, "Show FOV Circle", "circle",
		function() return s.ShowCircle end,
		function(v) s.ShowCircle = v end)
	addCheckbox(card, "Red Laser", "scan-line",
		function() return s.ShowLaser end,
		function(v) s.ShowLaser = v end)
	addSlider(card, "Silent Aim FOV", "ruler", 10, 360,
		function() return math.clamp(math.floor(tonumber(s.FOV) or 120), 10, 360) end,
		function(v) s.FOV = v end)
end

do
	local s = State.AimFlash
	local card = addCard(13, "flashlight", "Aimlock Flashlight", "Survivor flashlight aimlock", "AimFlash")
	addDropdown(card, "Target Body", "user", { "Head", "UpperTorso", "Torso", "HumanoidRootPart" },
		function(v) return v end,
		function() return s.AimPart or "Head" end,
		function(v) s.AimPart = v end)
	addSlider(card, "Max Range", "ruler", 20, 250,
		function() return math.clamp(math.floor(tonumber(s.Range) or 120), 20, 250) end,
		function(v) s.Range = v end)
	addSlider(card, "Smoothness %", "gauge", 5, 100,
		function() return math.clamp(math.floor(tonumber(s.Smooth) or 35), 5, 100) end,
		function(v) s.Smooth = v end)
	addCheckbox(card, "Show Laser", "scan-line",
		function() return s.ShowLaser end,
		function(v) s.ShowLaser = v end)
end

do
	local AV = { Enabled = false }
	State.AvatarVisual = AV
	local selectedId = LP.UserId
	local selectedServer, presetName = nil, "Self Avatar"
	local source = "preset"
	local lastId = nil
	local korless = { on = false, conn = nil }
	local usernameInput = ""
	local busy = false
	local card

	local function say(t) pcall(function() card.sub.Text = t end) end

	local function applyKorlessOnce()
		local ch = LP.Character
		if not ch then return end
		local leg = ch:FindFirstChild("Right Leg") or ch:FindFirstChild("RightUpperLeg")
		local head = ch:FindFirstChild("Head")
		if not leg or not head or ch:FindFirstChild("KorlessHead") then return end
		head.Transparency = 1
		local face = head:FindFirstChild("face")
		if face then face:Destroy() end
		leg.Transparency = 1
		local mp = Instance.new("MeshPart")
		mp.Name = "KorlessHead"
		mp.Size = Vector3.new(0.85, 0.85, 0.85)
		mp.CanCollide = false
		mp.MeshId = "rbxassetid://902942096"
		mp.TextureID = "rbxassetid://902843398"
		mp.CFrame = leg.CFrame * CFrame.new(0, 0.7, 0)
		mp.Parent = ch
		local w = Instance.new("WeldConstraint")
		w.Part0 = leg
		w.Part1 = mp
		w.Parent = mp
	end

	local function removeKorless()
		local ch = LP.Character
		if not ch then return end
		local kh = ch:FindFirstChild("KorlessHead")
		if kh then kh:Destroy() end
		local head = ch:FindFirstChild("Head")
		if head then head.Transparency = 0 end
		local leg = ch:FindFirstChild("Right Leg") or ch:FindFirstChild("RightUpperLeg")
		if leg then leg.Transparency = 0 end
	end

	local function setKorless(v)
		korless.on = v and true or false
		if korless.conn then korless.conn:Disconnect(); korless.conn = nil end
		if korless.on then
			task.spawn(applyKorlessOnce)
			korless.conn = LP.CharacterAdded:Connect(function()
				task.wait(1)
				if korless.on and not unloaded then applyKorlessOnce() end
			end)
		else
			removeKorless()
		end
	end

	local function loadAppearance(appearance, character, head)
		local items = appearance:GetChildren()
		local function applyMesh(obj)
			if obj:IsA("CharacterMesh") or obj:IsA("BodyColors") or obj:IsA("Shirt") or obj:IsA("Pants") then
				local existing = character:FindFirstChild(obj.Name)
				if existing and existing.ClassName == obj.ClassName then existing:Destroy() end
				obj:Clone().Parent = character
			end
		end
		for _, item in pairs(items) do
			if item:IsA("Folder") or item:IsA("Model") then
				for _, sub in pairs(item:GetChildren()) do applyMesh(sub) end
			else
				applyMesh(item)
			end
		end
		for _, item in pairs(items) do
			if item:IsA("SpecialMesh") and head then
				local tm = head:FindFirstChildOfClass("SpecialMesh") or Instance.new("SpecialMesh", head)
				tm.MeshType = Enum.MeshType.FileMesh
				tm.MeshId = item.MeshId
				tm.TextureId = item.TextureId
			elseif item:IsA("Decal") and item.Name == "face" and head then
				if head:FindFirstChild("face") then head.face:Destroy() end
				item:Clone().Parent = head
			end
		end
		for _, item in pairs(items) do
			if item:IsA("Accessory") then
				local clone = item:Clone()
				local handle = clone:FindFirstChild("Handle")
				if handle then
					local att = handle:FindFirstChildOfClass("Attachment")
					if att then
						local ta = character:FindFirstChild(att.Name, true)
						if ta then
							local weld = Instance.new("Weld")
							weld.Part0 = handle
							weld.Part1 = ta.Parent
							weld.C0 = att.CFrame
							weld.C1 = ta.CFrame
							weld.Parent = handle
						end
					end
					handle.CanCollide = false
					handle.Massless = true
					clone.Parent = character
				end
			end
		end
	end

	local function legacyApply(id, character, humanoid)
		local ok, appearance = pcall(function() return Players:GetCharacterAppearanceAsync(id) end)
		if not ok or not appearance then return false end
		for _, obj in pairs(character:GetChildren()) do
			if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants")
				or obj:IsA("BodyColors") or obj:IsA("CharacterMesh") or obj:IsA("ShirtGraphic") then
				obj:Destroy()
			end
		end
		local head = character:FindFirstChild("Head")
		if head then
			for _, h in pairs(head:GetChildren()) do
				if h:IsA("SpecialMesh") or h:IsA("Decal") then h:Destroy() end
			end
			local m = Instance.new("SpecialMesh", head)
			m.MeshType = Enum.MeshType.Head
			m.Scale = Vector3.new(1, 1, 1)
		end
		local defaults = {
			BodyDepthScale = 1, BodyHeightScale = 1, BodyWidthScale = 1,
			HeadScale = 1, BodyTypeScale = 0, BodyProportionScale = 0,
		}
		for name, val in pairs(defaults) do
			local sv = humanoid:FindFirstChild(name)
			if sv then sv.Value = val end
		end
		task.wait(0.1)
		loadAppearance(appearance, character, head)
		pcall(function()
			local info = Players:GetCharacterAppearanceInfoAsync(id)
			if head and info.assets then
				for _, asset in pairs(info.assets) do
					if asset.assetType.name == "Face" then
						if head:FindFirstChild("face") then head.face:Destroy() end
						local f = Instance.new("Decal", head)
						f.Name = "face"
						f.Texture = "rbxassetid://" .. asset.id
						break
					end
				end
			end
		end)
		return true
	end

	local origDesc = nil

	local ours = {}
	local hornOn = {}
	local hornObjs = {}

	local function isKillerNow()
		if LP.Team ~= nil and string.find(string.lower(LP.Team.Name), "killer", 1, true) ~= nil then return true end
		local ch = LP.Character
		return ch ~= nil and ch:GetAttribute("MorphedKiller") ~= nil
	end

	local function markOurs()
		ours = {}
		local ch = LP.Character
		if not ch then return end
		for _, c in ipairs(ch:GetChildren()) do
			if c:IsA("Accessory") then ours[c] = true end
		end
	end

	local function clearHorn(name)
		local list = hornObjs[name]
		if list then
			for _, obj in ipairs(list) do
				pcall(function() if obj and obj.Parent then obj:Destroy() end end)
			end
		end
		hornObjs[name] = nil
	end

	local function stripForKiller()
		for acc in pairs(ours) do
			pcall(function() if acc.Parent then acc:Destroy() end end)
		end
		ours = {}
		for name in pairs(hornObjs) do clearHorn(name) end
	end

	local HORNS = {
		["Poisoned Horns of the Toxic Wasteland"] = { AssetId = 1744060292, MeshId = "215680403", TextureId = "1744057070" },
		["Fiery Horns of the Netherworld"] = { AssetId = 215718515, MeshId = "215680403", TextureId = "215676264" },
		["Frozen Horns of the Frozen Tundra"] = { AssetId = 74891470, MeshId = "215680403", TextureId = "658646189" },
	}
	local HORN_ORDER = {
		"Poisoned Horns of the Toxic Wasteland",
		"Fiery Horns of the Netherworld",
		"Frozen Horns of the Frozen Tundra",
	}

	local function applyHorn(name)
		clearHorn(name)
		local data = HORNS[name]
		local character = LP.Character
		if not data or not character or isKillerNow() then return false end
		local attached = {}

		local function attach(source)
			local sh = source:FindFirstChild("Handle")
			if not sh or not sh:IsA("BasePart") then return false end
			local clone = source:Clone()
			local handle = clone:FindFirstChild("Handle")
			if not handle or not handle:IsA("BasePart") then
				pcall(function() clone:Destroy() end)
				return false
			end
			clone.Name = "VD_FakeLimitedHorn"
			handle.CanCollide = false
			handle.CanTouch = false
			handle.CanQuery = false
			handle.Massless = true
			local accAtt
			for _, o in ipairs(handle:GetChildren()) do
				if o:IsA("Attachment") then accAtt = o; break end
			end
			local targetAtt
			if accAtt then
				for _, o in ipairs(character:GetDescendants()) do
					if o:IsA("Attachment") and o.Name == accAtt.Name then targetAtt = o; break end
				end
			end
			clone.Parent = character
			local head = character:FindFirstChild("Head")
			if targetAtt and accAtt and targetAtt.Parent:IsA("BasePart") then
				handle.CFrame = targetAtt.WorldCFrame * accAtt.CFrame:Inverse()
			elseif head then
				handle.CFrame = head.CFrame * CFrame.new(0, 0.65, 0)
			else
				pcall(function() clone:Destroy() end)
				return false
			end
			local weld = Instance.new("WeldConstraint")
			weld.Name = "VD_FakeLimitedHornWeld"
			weld.Part0 = handle
			weld.Part1 = (targetAtt and targetAtt.Parent:IsA("BasePart")) and targetAtt.Parent or head
			weld.Parent = handle
			attached[#attached + 1] = clone
			return true
		end

		if data.AssetId then
			local ok, loaded = pcall(function() return game:GetObjects("rbxassetid://" .. tostring(data.AssetId)) end)
			if ok and type(loaded) == "table" then
				for _, root in ipairs(loaded) do
					local list = {}
					if root:IsA("Accessory") then
						list[1] = root
					else
						for _, o in ipairs(root:GetDescendants()) do
							if o:IsA("Accessory") then list[#list + 1] = o end
						end
					end
					for _, acc in ipairs(list) do attach(acc) end
					pcall(function() root:Destroy() end)
				end
			end
		end

		if #attached == 0 and data.MeshId and data.TextureId then
			local head = character:FindFirstChild("Head")
			if head then
				local acc = Instance.new("Accessory")
				acc.Name = "VD_FakeLimitedHorn"
				local handle = Instance.new("Part")
				handle.Name = "Handle"
				handle.Size = Vector3.new(1, 1, 1)
				handle.Transparency = 1
				handle.CanCollide = false
				handle.CanTouch = false
				handle.CanQuery = false
				handle.Massless = true
				handle.CastShadow = false
				handle.Parent = acc
				local mesh = Instance.new("SpecialMesh")
				mesh.MeshType = Enum.MeshType.FileMesh
				mesh.MeshId = "rbxassetid://" .. data.MeshId
				mesh.TextureId = "rbxassetid://" .. data.TextureId
				mesh.Parent = handle
				acc.Parent = character
				handle.CFrame = head.CFrame * CFrame.new(0, 0.65, 0)
				local weld = Instance.new("WeldConstraint")
				weld.Name = "VD_FakeLimitedHornWeld"
				weld.Part0 = handle
				weld.Part1 = head
				weld.Parent = handle
				attached[#attached + 1] = acc
			end
		end

		if #attached == 0 then return false end
		hornObjs[name] = attached
		return true
	end

	local function setHorn(name, on)
		if on then
			for other, enabled in pairs(hornOn) do
				if enabled and other ~= name then
					hornOn[other] = false
					clearHorn(other)
				end
			end
			if isKillerNow() then
				hornOn[name] = false
				say("Not available as Killer")
				return
			end
			hornOn[name] = applyHorn(name)
			say(hornOn[name] and "Horn applied" or "Horn failed")
		else
			hornOn[name] = false
			clearHorn(name)
		end
	end

	local function descApply(id, humanoid, override)
		local desc = override
		if not desc then
			local ok, d = pcall(function() return Players:GetHumanoidDescriptionFromUserId(id) end)
			if not ok or not d then return false end
			desc = d
		end
		local applied = pcall(function() humanoid:ApplyDescriptionReset(desc) end)
		if not applied then applied = pcall(function() humanoid:ApplyDescription(desc) end) end
		if not applied then return false end
		task.wait(0.4)
		local okA, cur = pcall(function() return humanoid:GetAppliedDescription() end)
		if not okA or not cur then return false end
		return cur.Shirt == desc.Shirt and cur.Pants == desc.Pants and cur.Face == desc.Face
	end

	local function applyAvatar(id)
		local character = LP.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			say("No character")
			return
		end
		if isKillerNow() then
			say("Not available as Killer")
			return
		end
		if not origDesc then
			local okO, d = pcall(function() return humanoid:GetAppliedDescription() end)
			if okO and d then origDesc = d end
		end
		lastId = id
		local done
		if id == LP.UserId and origDesc then
			done = descApply(id, humanoid, origDesc)
		else
			done = descApply(id, humanoid)
			if not done then done = legacyApply(id, character, humanoid) end
		end
		if done then markOurs() end
		if korless.on then
			task.wait(0.1)
			applyKorlessOnce()
		end
		say(done and "Applied" or "Failed")
	end

	local function resolveId()
		if source == "user" then
			if usernameInput == "" then return nil, "Enter a username or ID" end
			local n = tonumber(usernameInput)
			if n then return n end
			local ok, id = pcall(function() return Players:GetUserIdFromNameAsync(usernameInput) end)
			if not ok or not id then return nil, "User not found" end
			return id
		end
		return selectedId
	end

	card = addCard(14, "user", "Avatar Visual", "ON keeps avatar after respawn", "AvatarVisual", function(on)
		AV.Enabled = on == true
		if AV.Enabled and lastId then task.spawn(applyAvatar, lastId) end
	end)

	local serverList = {}
	local function refreshServerList()
		for i = #serverList, 1, -1 do serverList[i] = nil end
		for _, p in ipairs(Players:GetPlayers()) do
			if p ~= LP then serverList[#serverList + 1] = p.Name end
		end
		table.sort(serverList)
		if #serverList == 0 then serverList[1] = "No players" end
	end
	refreshServerList()
	Players.PlayerAdded:Connect(function() task.delay(1, refreshServerList) end)
	Players.PlayerRemoving:Connect(function() task.delay(1, refreshServerList) end)

	addDropdown(card, "Server Players", "users", serverList,
		function(v) return v or "Select" end,
		function() return selectedServer end,
		function(v)
			selectedServer = v
			local plr = Players:FindFirstChild(v)
			if plr and plr.UserId then
				selectedId = plr.UserId
				source = "server"
			end
		end)

	local PRESET_IDS = {
		["Self Avatar"] = LP.UserId,
		["Random 1"] = 2888298851, ["Random 2"] = 10074747755,
		["Random 3"] = 5209567453, ["Random 4"] = 8991982843,
		["Random 5"] = 5796319029, ["Random 6"] = 9744452117,
		["Random 7"] = 8476755006,
		["WoozyNate"] = 146089324, ["Nicholas"] = 909635,
		["yvlyf"] = 181751703, ["traevp"] = 471607078,
		["J0LLY"] = 1073847038, ["LucashDev"] = 2525651744,
		["CEOofIsaac"] = 63238912, ["Stealthy"] = 56602747,
		["Wildes"] = 40397833, ["Talon"] = 75974130,
		["Relukt"] = 65042011, ["Sammy"] = 2678001507,
		["Diesel"] = 9123921576, ["S4ans03"] = 35439794,
		["Aura"] = 2275806428, ["iJava"] = 276557820,
		["White Guy"] = 8843268357, ["Purple King"] = 9070758608,
		["Kachaaaa Gay"] = 8956318334, ["Mpruyyy"] = 8340163775,
	}
	local PRESET_ORDER = {
		"Self Avatar", "Random 1", "Random 2", "Random 3", "Random 4", "Random 5", "Random 6", "Random 7",
		"WoozyNate", "Nicholas", "yvlyf", "traevp", "J0LLY", "LucashDev", "CEOofIsaac", "Stealthy",
		"Wildes", "Talon", "Relukt", "Sammy", "Diesel", "S4ans03", "Aura", "iJava", "White Guy",
		"Purple King", "Kachaaaa Gay", "Mpruyyy",
	}
	addDropdown(card, "Preset Avatars", "layers", PRESET_ORDER,
		function(v) return v end,
		function() return presetName end,
		function(v)
			presetName = v
			selectedId = PRESET_IDS[v] or LP.UserId
			source = "preset"
		end)

	local ctrl = addOption(card, "Username / ID", "user")
	local box = new("TextBox", {
		Size = UDim2.fromOffset(130, 26),
		BackgroundColor3 = C.Surface,
		Text = "",
		PlaceholderText = "username or user id",
		PlaceholderColor3 = C.Muted,
		TextColor3 = C.Text,
		Font = Enum.Font.GothamMedium,
		TextSize = 12,
		ClearTextOnFocus = false,
		LayoutOrder = 1,
	}, ctrl)
	corner(box, 6)
	box:GetPropertyChangedSignal("Text"):Connect(function()
		usernameInput = (box.Text or ""):gsub("^@", ""):gsub("%s+", "")
		if usernameInput ~= "" then source = "user" end
	end)

	local _, applyBtn = addOption(card, "Apply Avatar", "check", true)
	applyBtn.MouseButton1Click:Connect(function()
		if busy then return end
		busy = true
		task.spawn(function()
			say("Loading")
			local id, err = resolveId()
			if id then applyAvatar(id) else say(err or "Failed") end
			busy = false
		end)
	end)

	addCheckbox(card, "Korless Morph", "skull",
		function() return korless.on end,
		function(v) setKorless(v) end)

	for _, hornName in ipairs(HORN_ORDER) do
		addCheckbox(card, hornName, "crown",
			function() return hornOn[hornName] == true end,
			function(v) setHorn(hornName, v) end)
	end

	task.spawn(function()
		while not unloaded do
			task.wait(0.5)
			if isKillerNow() and (next(ours) ~= nil or next(hornObjs) ~= nil) then
				pcall(stripForKiller)
			end
		end
	end)

	LP.CharacterAdded:Connect(function()
		task.wait(2.5)
		if unloaded then return end
		if isKillerNow() then return end
		if AV.Enabled and lastId then applyAvatar(lastId) end
		if korless.on then applyKorlessOnce() end
		for name, enabled in pairs(hornOn) do
			if enabled then applyHorn(name) end
		end
	end)
end

do
	local s = State.AutoPumpkin
	local farm = State.PumpkinFarmObj
	local card = addCard(7, "tractor", "Auto Farm Pumpkins", "Crush pumpkins automatically", "AutoPumpkin")
	local ctrl = addOption(card, "Status", "activity")
	local st = pill(ctrl, farm.Status, 160, 1, false)
	st.TextSize = 11
	farm.OnStatus = function(t) st.Text = t end
	addCheckbox(card, "Auto Run (while farming)", "footprints", function() return s.AutoRun end, function(v) s.AutoRun = v end)
	addCheckbox(card, "Flee Killer", "siren", function() return s.FleeKiller end, function(v) s.FleeKiller = v end)
	addSlider(card, "Flee Distance", "ruler", 5, 60,
		function() return math.clamp(math.floor(tonumber(s.FleeDistance) or 25), 5, 60) end,
		function(v) s.FleeDistance = v end)
end

do
	local s = State.WorldSettings
	local perf = State.PerfObj
	local card = addCard(8, "sun", "World Settings", "Turn ON, then tick options", "WorldSettings")
	local function opt(label, icn, field)
		addCheckbox(card, label, icn, function() return s[field] end, function(v) perf:Set(field, v) end)
	end
	opt("Full Bright", "sun", "FullBright")
	addSlider(card, "Brightness", "sun-medium", 1, 6,
		function() return math.clamp(math.floor((tonumber(s.FullBrightValue) or 3) + 0.5), 1, 6) end,
		function(v) perf:Set("FullBrightValue", v) end)
	opt("Custom Time", "clock", "CustomTime")
	addSlider(card, "Time of Day", "clock", 0, 24,
		function() return math.clamp(math.floor(tonumber(s.TimeOfDay) or 14), 0, 24) end,
		function(v) perf:Set("TimeOfDay", v) end)
	opt("No Fog",        "cloud-off",  "NoFog")
	opt("No Shadow",     "moon",       "NoShadow")
	opt("Low Graphics",    "gauge",      "LowGFX")
	opt("Low: Textures", "image-off",  "LowGFX_Textures")
	opt("Low: Particles","sparkles",   "LowGFX_Particles")
	opt("Low: Effects",  "wand",       "LowGFX_VFX")
	opt("Low: Materials","box",        "LowGFX_Parts")
	opt("Low: Hide Sky", "cloud",      "LowGFX_Sky")
	opt("Remove Trees",  "tree-pine",  "RemoveTree")
	opt("Remove Grass",  "sprout",     "RemoveGrass")
end

State.HighCamera = { Enabled = false, Distance = 25, FOV = 120, Height = 10 }
State.HighCamObj = (function()
	local H = State.HighCamera
	local obj = {}
	local active = false
	local def = { fov = 70, minZ = 0.5, maxZ = 128 }
	local BIND = "VDHighCamera"

	local function apply()
		if unloaded then return end
		local c = workspace.CurrentCamera
		if not c then return end
		c.FieldOfView = H.FOV
		local d = H.Distance
		LP.CameraMaxZoomDistance = d + 0.5
		LP.CameraMinZoomDistance = math.max(0.1, d - 0.5)
		c.CFrame = c.CFrame + Vector3.new(0, H.Height, 0)
	end

	function obj:Refresh()
		local want = H.Enabled and State.CameraSettings.Enabled == true and not unloaded
		if want == active then return end
		active = want
		if want then
			local c = workspace.CurrentCamera
			if c then def.fov = c.FieldOfView end
			def.minZ = LP.CameraMinZoomDistance
			def.maxZ = LP.CameraMaxZoomDistance
			RunService:BindToRenderStep(BIND, Enum.RenderPriority.Camera.Value + 1, apply)
		else
			pcall(function() RunService:UnbindFromRenderStep(BIND) end)
			local c = workspace.CurrentCamera
			if c then c.FieldOfView = def.fov end
			LP.CameraMaxZoomDistance = def.maxZ
			LP.CameraMinZoomDistance = def.minZ
		end
	end

	function obj:SetEnabled(on)
		H.Enabled = on == true
		obj:Refresh()
	end

	return obj
end)()

do
	local s = State.CameraSettings
	local cam = State.CameraObj
	local card = addCard(9, "camera", "Camera Settings", "Turn ON, then tick options", "CameraSettings")
	addCheckbox(card, "Unlimited Zoom", "scan",
		function() return s.ZoomOn end,
		function(v) s.ZoomOn = v; cam:Sync() end)
	addSlider(card, "Max Zoom", "ruler", 50, 2000,
		function() return math.clamp(math.floor(tonumber(s.Zoom) or 1000), 50, 2000) end,
		function(v) s.Zoom = v; cam:Sync() end)
	addCheckbox(card, "Custom FOV", "eye",
		function() return s.FOVOn end,
		function(v) s.FOVOn = v; cam:Sync() end)
	addSlider(card, "FOV", "scan", 30, 120,
		function() return math.clamp(math.floor(tonumber(s.FOV) or 70), 30, 120) end,
		function(v) s.FOV = v; cam:Sync() end)
	addCheckbox(card, "Camera Stiffness", "gauge",
		function() return s.StiffOn end,
		function(v) s.StiffOn = v; cam:Sync() end)
	addSlider(card, "Stiffness", "gauge", 1, 10,
		function() return math.clamp(math.floor(tonumber(s.Stiff) or 3), 1, 10) end,
		function(v) s.Stiff = v end)
	addCheckbox(card, "Stretch", "arrow-down",
		function() return s.StretchOn end,
		function(v) s.StretchOn = v; cam:Sync() end)
	addSlider(card, "Stretch Level", "arrow-down", 1, 10,
		function() return math.clamp(math.floor(tonumber(s.Stretch) or 5), 1, 10) end,
		function(v) s.Stretch = v end)

	local hs = State.HighCamera
	local hc = State.HighCamObj
	addCheckbox(card, "High Camera", "camera",
		function() return hs.Enabled end,
		function(v) hc:SetEnabled(v) end)
	addSlider(card, "High Camera Distance", "ruler", 1, 60,
		function() return math.clamp(math.floor(tonumber(hs.Distance) or 25), 1, 60) end,
		function(v) hs.Distance = v end)
	addSlider(card, "High Camera FOV", "scan", 50, 120,
		function() return math.clamp(math.floor(tonumber(hs.FOV) or 120), 50, 120) end,
		function(v) hs.FOV = v end)
	addSlider(card, "High Camera Height", "arrow-up", -10, 40,
		function() return math.clamp(math.floor(tonumber(hs.Height) or 10), -10, 40) end,
		function(v) hs.Height = v end)
end

do
	local HttpService = game:GetService("HttpService")
	local DIR = "KinonHubBeta"
	local SLOT_DIR = DIR .. "/slots"
	local AUTO = DIR .. "/autoload.txt"
	local hasFs = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
	local hasDel = type(delfile) == "function"

	State.KinonSettings = { Enabled = false, AutoLoad = false }
	local ss = State.KinonSettings

	Reg.skip = true
	local card = addCard(16, "save", "Settings", "Save, load and delete your config slots", "KinonSettings")
	card.toggle.Visible = false

	local function say(text) pcall(function() card.sub.Text = text end) end

	local function encode(v)
		if typeof(v) == "Color3" then
			return { c = { math.floor(v.R * 255 + 0.5), math.floor(v.G * 255 + 0.5), math.floor(v.B * 255 + 0.5) } }
		end
		return v
	end
	local function decode(v, like)
		if typeof(like) == "Color3" then
			if type(v) == "table" and type(v.c) == "table" then
				local r, g, b = tonumber(v.c[1]), tonumber(v.c[2]), tonumber(v.c[3])
				if r and g and b then
					return Color3.fromRGB(math.clamp(r, 0, 255), math.clamp(g, 0, 255), math.clamp(b, 0, 255))
				end
			end
			return nil
		end
		if type(v) ~= type(like) then return nil end
		return v
	end

	local function apply(entry, value)
		if value == nil then return false end
		if type(value) == "number" and entry.lo and entry.hi then
			value = math.clamp(value, entry.lo, entry.hi)
		end
		local ok = pcall(entry.set, value)
		if ok and entry.refresh then pcall(entry.refresh) end
		return ok
	end

	local function applyAll(getValue)
		local count = 0
		for pass = 1, 2 do
			for _, e in ipairs(Reg.list) do
				if (pass == 2) == (e.enabled == true) then
					local v = getValue(e)
					if v ~= nil and apply(e, v) then count = count + 1 end
				end
			end
		end
		return count
	end

	local function reset()
		local n = applyAll(function(e) return e.default end)
		say("Reset " .. n .. " values to default")
	end

	local slotName = "My Config"
	local slotChoices = {}
	local slotSaved = {}
	local slotInput
	local dropdownRender

	local function cleanSlotName(name)
		name = tostring(name or ""):gsub("^%s+", ""):gsub("%s+$", "")
		name = name:gsub('[%c/\\:*?"<>|]', "_"):sub(1, 40)
		return name
	end
	local function slotFile(name)
		return SLOT_DIR .. "/" .. name .. ".json"
	end
	local function ensureSlotFolder()
		if type(isfolder) == "function" and type(makefolder) == "function" then
			if not isfolder(DIR) then makefolder(DIR) end
			if not isfolder(SLOT_DIR) then makefolder(SLOT_DIR) end
		end
	end

	local refreshSlotChoices
	refreshSlotChoices = function(preferred)
		local found = {}
		if hasFs and type(listfiles) == "function" then
			pcall(function()
				ensureSlotFolder()
				for _, path in ipairs(listfiles(SLOT_DIR)) do
					local name = tostring(path):match("([^/\\]+)%.json$")
					if name and name ~= "" then
						local okFile, exists = pcall(isfile, slotFile(name))
						if okFile and exists then found[name] = true end
					end
				end
			end)
		end
		table.clear(slotChoices)
		table.clear(slotSaved)
		for name in pairs(found) do table.insert(slotChoices, name); slotSaved[name] = true end
		table.sort(slotChoices, function(a, b) return a:lower() < b:lower() end)
		if preferred and found[preferred] then slotName = preferred end
		if slotInput then slotInput.Text = slotName end
		if dropdownRender then pcall(dropdownRender) end
	end

	local function saveSlot()
		if not hasFs then say("Save failed: executor has no file access"); return end
		local name = cleanSlotName(slotName)
		if name == "" then say("Enter a slot name first"); return end
		local data = {}
		for _, e in ipairs(Reg.list) do
			local ok, v = pcall(e.get)
			if ok and v ~= nil then data[e.id] = encode(v) end
		end
		local ok, err = pcall(function()
			ensureSlotFolder()
			writefile(slotFile(name), HttpService:JSONEncode(data))
		end)
		if ok then
			slotName = name
			refreshSlotChoices(name)
			say("Saved slot: " .. name)
		else say("Slot save failed: " .. tostring(err):sub(1, 40)) end
	end

	local function loadSlot(silent)
		local name = cleanSlotName(slotName)
		if name == "" then if not silent then say("Enter a slot name first") end; return end
		local file = slotFile(name)
		local okFile, exists = pcall(isfile, file)
		if not okFile or not exists then if not silent then say("Slot not found: " .. name) end; return end
		local okRead, raw = pcall(readfile, file)
		local okJson, data = false, nil
		if okRead then okJson, data = pcall(function() return HttpService:JSONDecode(raw) end) end
		if not okJson or type(data) ~= "table" then say("Slot is corrupt: " .. name); return end
		local n = applyAll(function(e) return decode(data[e.id], e.default) end)
		say("Loaded slot: " .. name .. " (" .. n .. " values)")
	end

	local function deleteSlot()
		if not hasFs then say("Delete failed: executor has no file access"); return end
		if not hasDel then say("Delete failed: executor has no delfile"); return end
		local name = cleanSlotName(slotName)
		if name == "" then say("Enter a slot name first"); return end
		local file = slotFile(name)
		local okFile, exists = pcall(isfile, file)
		if not okFile or not exists then say("Slot not found: " .. name); return end
		local ok, err = pcall(delfile, file)
		if not ok then say("Delete failed: " .. tostring(err):sub(1, 40)); return end

		refreshSlotChoices()
		local nextName = slotChoices[1]
		if nextName then
			slotName = nextName
			if slotInput then slotInput.Text = nextName end
		elseif slotInput then
			slotInput.Text = slotName
		end

		local okAuto, autoName = pcall(readfile, AUTO)
		if ss.AutoLoad and okAuto and cleanSlotName(autoName) == name then
			pcall(delfile, AUTO)
			ss.AutoLoad = false
		end
		say("Deleted slot: " .. name)
	end

	local function actionRow(label, iconName, btnText, fn)
		local ctrl, rowBtn = addOption(card, label, iconName)
		local b = pill(ctrl, btnText, 64, 1, true)
		stylePill(b, true)
		b.MouseButton1Click:Connect(fn)
		rowBtn.MouseButton1Click:Connect(fn)
	end

	do
		local ctrl = addOption(card, "Name Config", "edit")
		local box = Instance.new("TextBox")
		slotInput = box
		box.Name = "SlotNameInput"
		box.Size = UDim2.new(0, 132, 0, 28)
		box.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
		box.BorderSizePixel = 0
		box.Text = slotName
		box.PlaceholderText = "Enter slot name"
		box.ClearTextOnFocus = false
		box.TextColor3 = Color3.fromRGB(245, 245, 250)
		box.PlaceholderColor3 = Color3.fromRGB(145, 145, 155)
		box.Font = Enum.Font.Gotham
		box.TextSize = 11
		box.Parent = ctrl
		corner(box, 7)
		box.FocusLost:Connect(function()
			slotName = cleanSlotName(box.Text)
			box.Text = slotName
			if dropdownRender then pcall(dropdownRender) end
		end)
	end

	refreshSlotChoices()
	addDropdown(card, "List Config", "list", slotChoices,
		function(v) return v or "No saved slots" end,
		function() return slotSaved[slotName] and slotName or nil end,
		function(v)
			slotName = v
			if slotInput then slotInput.Text = v end
		end)
	dropdownRender = RegHook.r
	RegHook.r = nil
	actionRow("Save Config", "save", "Save", saveSlot)
	actionRow("Load Config", "download", "Load", function() loadSlot(false) end)
	actionRow("Delete Config", "trash-2", "Delete", deleteSlot)
	actionRow("Reset to Default", "rotate-ccw", "Reset", reset)

	do
		local flag = false
		if hasFs then
			local ok, autoName = pcall(readfile, AUTO)
			flag = ok and cleanSlotName(autoName) ~= ""
		end
		ss.AutoLoad = flag
		addCheckbox(card, "Auto Load Config", "zap",
			function() return ss.AutoLoad end,
			function(v)
				ss.AutoLoad = v
				if not hasFs then return end
				pcall(function()
					if v then
						ensureSlotFolder()
						writefile(AUTO, cleanSlotName(slotName))
					elseif hasDel and isfile(AUTO) then
						delfile(AUTO)
					end
				end)
			end)
	end
	Reg.skip = false

	State.SaveSettings = saveSlot
	State.LoadSettings = loadSlot

	if ss.AutoLoad then
		task.defer(function()
			task.wait(1)
			if unloaded then return end
			local okAuto, autoName = pcall(readfile, AUTO)
			autoName = okAuto and cleanSlotName(autoName) or ""
			if autoName ~= "" then
				slotName = autoName
				if slotInput then slotInput.Text = autoName end
				loadSlot(true)
			end
		end)
	end
end

State.FakeParry = { Enabled = false, Anim = "Enten" }
do
	local FPY = State.FakeParry
	local ParryFloatOn = false
	local FAKE_ANIMS = {
		["Enten"]               = "rbxassetid://127096285501517",
		["Stopwatch"]           = "rbxassetid://81793464499285",
		["Fih"]                 = "rbxassetid://123307242865945",
		["Blood Shield"]        = "rbxassetid://75939529748815",
		["Frying Pan"]          = "rbxassetid://74655471921270",
		["Vampire Lord Scythe"] = "rbxassetid://117821101412772",
		["Diamond Sword"]       = "rbxassetid://85288374151888",
	}
	local FAKE_ORDER = { "Enten", "Stopwatch", "Fih", "Blood Shield", "Frying Pan", "Vampire Lord Scythe", "Diamond Sword" }
	local currentTrack, floatGui

	local function playFakeParry()
		pcall(function()
			local char = LP.Character
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			local animator = hum:FindFirstChildOfClass("Animator")
			if not animator then
				animator = Instance.new("Animator")
				animator.Parent = hum
			end
			if currentTrack then pcall(function() currentTrack:Stop() end); currentTrack = nil end
			local anim = Instance.new("Animation")
			anim.AnimationId = FAKE_ANIMS[FPY.Anim] or FAKE_ANIMS["Enten"]
			local tr = animator:LoadAnimation(anim)
			tr.Priority = Enum.AnimationPriority.Action
			tr:Play()
			currentTrack = tr
		end)
	end

	track(UserInputService.InputBegan:Connect(function(input, gp)
		if gp or unloaded or not FPY.Enabled then return end
		if input.KeyCode == Enum.KeyCode.V then playFakeParry() end
	end))

	local function buildFloat()
		local gui = Instance.new("ScreenGui")
		gui.Name = "KINON_FakeParryShortcut"
		gui.ResetOnSpawn = false
		gui.IgnoreGuiInset = true
		gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		gui.Parent = parent

		local frame = Instance.new("Frame")
		frame.Size = UDim2.fromOffset(142, 38)
		frame.Position = UDim2.new(1, -138, 0.53, 0)
		frame.BackgroundColor3 = WHITE
		frame.BackgroundTransparency = 0.02
		frame.Active = true
		frame.BorderSizePixel = 0
		frame.ZIndex = 150
		frame.Parent = gui
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 9)
		local st = Instance.new("UIStroke")
		st.Color = Color3.fromRGB(90, 90, 90)
		st.Thickness = 1
		st.Transparency = 0.12
		st.Parent = frame
		local grad = Instance.new("UIGradient")
		grad.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 34, 34)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 8)),
		})
		grad.Rotation = 90
		grad.Parent = frame

		local btn = Instance.new("TextButton")
		btn.Size = UDim2.fromScale(1, 1)
		btn.BackgroundTransparency = 1
		btn.Text = ""
		btn.AutoButtonColor = false
		btn.ZIndex = 151
		btn.Parent = frame
		local title = Instance.new("TextLabel")
		title.BackgroundTransparency = 1
		title.Position = UDim2.fromOffset(9, 0)
		title.Size = UDim2.new(1, -18, 1, 0)
		title.Font = Enum.Font.GothamBold
		title.Text = "FAKE PARRY"
		title.TextSize = 10
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.TextTruncate = Enum.TextTruncate.AtEnd
		title.TextColor3 = C.Text
		title.ZIndex = 152
		title.Parent = btn

		task.defer(function()
			if not frame.Parent then return end
			local camera = workspace.CurrentCamera
			local viewport = camera and camera.ViewportSize or Vector2.new(800, 600)
			local width = math.clamp(math.ceil(title.TextBounds.X) + 26, 116, 166)
			frame.Size = UDim2.fromOffset(width, 38)
			local pos = frame.Position
			local px = pos.X.Scale * viewport.X + pos.X.Offset
			local py = pos.Y.Scale * viewport.Y + pos.Y.Offset
			frame.Position = UDim2.fromOffset(
				math.clamp(px, 0, math.max(0, viewport.X - frame.AbsoluteSize.X)),
				math.clamp(py, 0, math.max(0, viewport.Y - frame.AbsoluteSize.Y))
			)
		end)

		local pressed, moved, active, startPtr, startAbs = false, false, nil, nil, nil
		local floatConns = {}
		local function keepFloatConn(conn)
			floatConns[#floatConns + 1] = conn
			return conn
		end
		btn.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				pressed, moved, active = true, false, input
				startPtr, startAbs = input.Position, frame.AbsolutePosition
			end
		end)
		local function moveButton(input)
			if not pressed or not startPtr then return end
			if input == active or input.UserInputType == Enum.UserInputType.MouseMovement then
				local d = input.Position - startPtr
				if d.Magnitude > 6 then moved = true end
				if moved then
					local cam = workspace.CurrentCamera
					local vp = cam and cam.ViewportSize or Vector2.new(800, 600)
					frame.Position = UDim2.fromOffset(
						math.clamp(startAbs.X + d.X, 0, math.max(0, vp.X - frame.AbsoluteSize.X)),
						math.clamp(startAbs.Y + d.Y, 0, math.max(0, vp.Y - frame.AbsoluteSize.Y)))
				end
			end
		end
		keepFloatConn(UserInputService.InputChanged:Connect(moveButton))
		keepFloatConn(UserInputService.TouchMoved:Connect(moveButton))
		keepFloatConn(UserInputService.InputEnded:Connect(function(input)
			if not pressed then return end
			if input == active or input.UserInputType == Enum.UserInputType.MouseButton1 then
				if not moved then playFakeParry() end
				pressed, moved, active = false, false, nil
			end
		end))
		gui.Destroying:Connect(function()
			for _, conn in ipairs(floatConns) do pcall(function() conn:Disconnect() end) end
			table.clear(floatConns)
		end)
		return gui
	end
	local function setFloat(on)
		ParryFloatOn = on
		if floatGui then pcall(function() floatGui:Destroy() end); floatGui = nil end
		if on and not unloaded then floatGui = buildFloat() end
	end

	local card = addCard(5, "shield", "Fake Parry", "Animasi: " .. FPY.Anim .. "  \226\128\162  Tombol V", "FakeParry")
	addCheckbox(card, "Floating Button Parry", "mouse-pointer-click",
		function() return ParryFloatOn end,
		function(v) setFloat(v) end)
	card.sub.TextTruncate = Enum.TextTruncate.AtEnd
	addDropdown(card, "Animation", "list", FAKE_ORDER,
		function(v) return v end,
		function() return FPY.Anim end,
		function(v)
			FPY.Anim = v
			card.sub.Text = "Animasi: " .. v .. "  \226\128\162  Tombol V"
		end, 144)

	local mine = Body:FindFirstChild("Fake Parry")
	if mine then
		for _, child in ipairs(Body:GetChildren()) do
			if child ~= mine and child:IsA("GuiObject") and child.LayoutOrder >= 5 then
				child.LayoutOrder = child.LayoutOrder + 1
			end
		end
	end

	State.FakeParryObj = { Destroy = function()
		FPY.Enabled = false
		if currentTrack then pcall(function() currentTrack:Stop() end) end
		if floatGui then pcall(function() floatGui:Destroy() end); floatGui = nil end
	end }
end

local Notch = new("TextButton", {
	Name = "Notch",
	AnchorPoint = Vector2.new(0.5, 0),
	Position = UDim2.new(0.5, 0, 0, NOTCH_Y),
	Size = UDim2.fromOffset(NOTCH_W, NOTCH_H),
	BackgroundColor3 = WHITE,
	Text = "",
	AutoButtonColor = false,
	Visible = false,
}, Gui)
corner(Notch, math.floor(NOTCH_H / 2))
new("UIGradient", {
	Color = ColorSequence.new(Color3.fromRGB(34, 34, 34), Color3.fromRGB(0, 0, 0)),
	Rotation = 90,
}, Notch)
local notchStroke = new("UIStroke", { Color = WHITE, Transparency = 0.55, Thickness = 1 }, Notch)
new("UIGradient", {
	Color = ColorSequence.new(WHITE, Color3.fromRGB(70, 70, 70)),
	Rotation = 90,
}, notchStroke)

local notchDot = new("Frame", {
	AnchorPoint = Vector2.new(0, 0.5),
	Position = UDim2.new(0, 16, 0.5, 0),
	Size = UDim2.fromOffset(9, 9),
	BackgroundColor3 = WHITE,
}, Notch)
corner(notchDot, 5)
TweenService:Create(notchDot, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
	BackgroundTransparency = 0.75,
}):Play()

new("TextLabel", {
	Position = UDim2.new(0, 34, 0, 0),
	Size = UDim2.new(1, -80, 1, 0),
	BackgroundTransparency = 1,
	Text = HUB_NAME,
	TextColor3 = C.Text,
	Font = Enum.Font.GothamBold,
	TextSize = 13,
	TextXAlignment = Enum.TextXAlignment.Left,
}, Notch)

local chev = new("Frame", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -6, 0.5, 0),
	Size = UDim2.fromOffset(26, 26),
	BackgroundColor3 = C.Surface,
}, Notch)
corner(chev, 13)
icon("chevron-down", 14, C.Text, chev)

local notchCenter = UDim2.new(0.5, 0, 0, NOTCH_Y + NOTCH_H / 2)

local function minimize()
	if busy or minimized then return end
	busy, minimized = true, true
	savedPos = Main.Position

	local t = TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		Size = UDim2.fromOffset(NOTCH_W, NOTCH_H),
		Position = notchCenter,
		GroupTransparency = 1,
	})
	t.Completed:Connect(function()
		Main.Visible = false
		Notch.Size = UDim2.fromOffset(NOTCH_W * 0.6, NOTCH_H * 0.6)
		Notch.Visible = true
		TweenService:Create(Notch, TweenInfo.new(0.24, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Size = UDim2.fromOffset(NOTCH_W, NOTCH_H),
		}):Play()
		busy = false
	end)
	t:Play()
end

local function restore()
	if busy or not minimized then return end
	busy, minimized = true, false

	Notch.Visible = false
	Main.Size = UDim2.fromOffset(NOTCH_W, NOTCH_H)
	Main.Position = notchCenter
	Main.GroupTransparency = 1
	Main.Visible = true

	local t = TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Size = UDim2.fromOffset(WIDTH, fullHeight()),
		Position = savedPos or UDim2.fromScale(0.5, 0.5),
		GroupTransparency = 0,
	})
	t.Completed:Connect(function() busy = false end)
	t:Play()
end

State.Actions.minimize = minimize
Notch.MouseButton1Click:Connect(restore)

local dragging, dragStart, startPos
Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging  = true
		dragStart = input.Position
		startPos  = Main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

track(UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		local d = (input.Position - dragStart) / Scale.Scale
		Main.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + d.X,
			startPos.Y.Scale, startPos.Y.Offset + d.Y
		)
	end
end))

local function unload()
	if unloaded then return end
	unloaded = true
	Parry.Enabled = false
	pcall(function() State.PlayerESPObj:Stop() end)
	pcall(function() State.WorldESPObj:Stop() end)
	pcall(function() State.PumpkinFarmObj:Shutdown() end)
	pcall(function() State.PerfObj:Stop() end)
	pcall(function() State.CameraObj:Destroy() end)
	pcall(function() State.TOFObj:Destroy() end)
	pcall(function() State.SilentObj:Destroy() end)
	pcall(function() State.DestroyMarks() end)
	pcall(function() State.HitAreaObj:Destroy() end)
	pcall(function() State.FlashObj:Destroy() end)
	pcall(function() State.NoSlow.K = false; State.NoSlow.S = false end)
	pcall(function()
		for _, handler in pairs(State.UtilityHandlers) do handler(false) end
	end)
	pcall(function() State.SkillCheckObj:Stop() end)
	pcall(function() State.TrapSkillSet(false) end)
	pcall(function() State.HighCamObj:SetEnabled(false) end)
	pcall(function() State.SpearObj.Destroy() end)
	pcall(function() State.SilentChain.Destroy() end)
	pcall(function() State.StunObj.Destroy() end)
	pcall(function() State.Moonwalk.Destroy() end)
	pcall(function() State.FakeParryObj.Destroy() end)

	for _, conn in ipairs(connections) do pcall(function() conn:Disconnect() end) end
	table.clear(connections)

	local shared = _G.KINON_AutoParryShortcut
	if type(shared) == "table" then
		for _, k in ipairs({ "InputConn", "EndConn", "TouchMoveConn" }) do
			if shared[k] then pcall(function() shared[k]:Disconnect() end); shared[k] = nil end
		end
		if shared.Gui then pcall(function() shared.Gui:Destroy() end); shared.Gui = nil end
	end

	clearParryCircle()
	if Gui then Gui:Destroy() end
	if _G.KinonHubBetaUnload == unload then _G.KinonHubBetaUnload = nil end
end
_G.KinonHubBetaUnload = unload

local closeConfirm
local function showCloseConfirm()
	if closeConfirm or unloaded then return end
	closeConfirm = new("TextButton", {
		Name = "CloseConfirm",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 0.5,
		Text = "",
		AutoButtonColor = false,
		ZIndex = 80,
	}, Gui)
	local box = new("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(280, 142),
		BackgroundColor3 = C.Panel,
		Active = true,
	}, closeConfirm)
	new("UIScale", { Scale = math.clamp(Scale.Scale + 0.1, 0.75, 1) }, box)
	corner(box, 14)
	new("UIStroke", { Color = WHITE, Transparency = 0.7, Thickness = 1 }, box)

	new("TextLabel", {
		Position = UDim2.fromOffset(16, 14),
		Size = UDim2.new(1, -32, 0, 22),
		BackgroundTransparency = 1,
		Text = "Close Kinon Hub?",
		TextColor3 = C.Text,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, box)
	new("TextLabel", {
		Position = UDim2.fromOffset(16, 40),
		Size = UDim2.new(1, -32, 0, 40),
		BackgroundTransparency = 1,
		Text = "Are you sure you want to close this UI?",
		TextColor3 = C.Muted,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
	}, box)

	local function dialogButton(text, x, bg, fg, cb)
		local b = new("TextButton", {
			Position = UDim2.new(x, x == 0 and 16 or 4, 1, -52),
			Size = UDim2.new(0.5, -20, 0, 36),
			BackgroundColor3 = bg,
			Text = text,
			TextColor3 = fg,
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			AutoButtonColor = true,
		}, box)
		corner(b, 10)
		b.MouseButton1Click:Connect(cb)
		return b
	end
	dialogButton("Back", 0, C.Surface, C.Text, function()
		if closeConfirm then closeConfirm:Destroy(); closeConfirm = nil end
	end)
	dialogButton("Continue", 0.5, C.Accent, C.OnAccent, function()
		if closeConfirm then closeConfirm:Destroy(); closeConfirm = nil end
		unload()
	end)
end

State.Actions.close = showCloseConfirm
