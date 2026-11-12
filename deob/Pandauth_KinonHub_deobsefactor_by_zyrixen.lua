Warning: truncated output (original token count: 260421)
Total output lines: 26945

-- deobsefactor by zeyrixen
local function runEmbeddedKinonHub(...)
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
		local humanoid = char and char:F…210421 tokens truncated…   closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 1, 1)
        elseif leaveLoop31 == 40 then
          values[12] = 471271
          values[6] = true
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 6, 6)
        end
      end
    else
      values[12] = 143145
      values[0] = true
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 0, 0)
    end
  else
    values[12] = nil
    values[0] = true
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 0, 0)
  end
end

functions["callback_24"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[13] = nil
  values[0] = environment.pcall
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[1] = function(...) return functions["callback_25"](captured, ...) end
  end
  values[0], values[1] = values[0](unpackValues(values, 1, 1))
  values[2] = values[0]
  if not values[2] then
    values[13] = 999029
    values[2] = false
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 2, 2)
  else
    values[13] = nil
    values[2] = environment.type
    values[3] = values[1]
    values[2] = values[2](unpackValues(values, 3, 3))
    if (values[2] == "string") then
      values[13] = 725064
      values[3] = values[1]
      values[2] = values[3]["sub"]
      values[4] = 1
      values[5] = 2
      values[2] = values[2](unpackValues(values, 3, 5))
      if (values[2] == "<!") then
        values[13] = 839065
        values[2] = false
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 2, 2)
      else
        values[13] = 725064
        values[3] = values[1]
        values[2] = values[3]["sub"]
        values[4] = 1
        values[5] = 5
        values[13] = 939521
        values[2] = values[2](unpackValues(values, 3, 5))
        if not (values[2] == "<html") then
          values[13] = 368141
          values[2] = {}
          values[3] = {}
          values[7] = environment.string
          values[4] = values[7]["gmatch"]
          values[5] = values[1]
          values[6] = "[^\013\010]+"
          values[4], values[5], values[6] = values[4](unpackValues(values, 5, 6))
          if type(values[4]) ~= "function" then
            local source = values[4]
            if type(source) == "table" and getmetatable(source) == nil then
              values[4], values[5], values[6] = next, source, nil
            else
              values[4] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
              values[5], values[6] = nil, nil
            end
          end
          do
            local leaveLoop31 = 0
            while true do
              values[13] = 49008
              local results = packValues(values[4](values[5], values[6]))
              for index = 1, 1 do values[6 + index] = results[index] end
              if values[7] ~= nil then
                values[6] = values[7]
                do
                  local leaveLoop32 = 0
                  while true do
                    values[13] = 699515
                    values[8] = upvalues[1]
                    values[9] = values[7]
                    values[8] = values[8](unpackValues(values, 9, 9))
                    values[7] = values[8]
                    if (values[7] == "") then
                      leaveLoop32 = 31
                      break
                    else
                      values[13] = 699515
                      values[9] = values[7]
                      values[8] = values[9]["sub"]
                      values[10] = 1
                      values[11] = 1
                      values[8] = values[8](unpackValues(values, 9, 11))
                      if (values[8] == "#") then
                        leaveLoop32 = 31
                        break
                      else
                        values[13] = 699515
                        values[8] = upvalues[2]
                        values[9] = values[7]
                        values[8] = values[8](unpackValues(values, 9, 9))
                        values[9] = values[3][values[8]]
                        if values[9] then
                          leaveLoop32 = 31
                          break
                        else
                          values[13] = 699515
                          values[9] = true
                          values[3][values[8]] = values[9]
                          values[10] = environment.table
                          values[9] = values[10]["insert"]
                          values[10] = values[2]
                          values[11] = values[8]
                          values[9](unpackValues(values, 10, 11))
                          local results = packValues(values[4](values[5], values[6]))
                          for index = 1, 1 do values[6 + index] = results[index] end
                          if values[7] ~= nil then
                            values[6] = values[7]
                            continue
                          end
                        end
                      end
                    end
                    leaveLoop32 = 33
                    break
                  end
                  if leaveLoop32 == 31 then
                    continue
                  elseif leaveLoop32 == 33 then
                  end
                end
              end
              leaveLoop31 = 33
              break
            end
          end
          values[13] = 445217
          values[4] = values[2]
          upvalues[3] = values[4]
          values[6] = upvalues[3]
          values[5] = #values[6]
          if (0 < values[5]) then
            values[13] = 179546
            values[4] = true
          else
            values[13] = 445217
            values[4] = false
          end
          values[13] = 673797
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 4, 4)
        else
          values[13] = 839065
          values[2] = false
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 2, 2)
        end
      end
    else
      values[13] = 999029
      values[2] = false
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 2, 2)
    end
  end
end

functions["callback_25"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = environment.game
  values[1] = values[1]
  values[0] = values[1]["HttpGet"]
  values[2] = upvalues[0]
  local results = packValues(values[0](unpackValues(values, 1, 2)))
  registerTop = 0 + results.n - 1
  for index = 0, registerTop do values[index] = results[index - 0 + 1] end
  closeCapturedValues(captureGroups, values, 0)
  return unpackValues(values, 0, registerTop)
end

functions["callback_26"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 2 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[3] = environment.pcall
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    cells[1] = {values, 0}
    cells[2] = {values, 1}
    cells[3] = {values, 2}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[4] = function(...) return functions["callback_27"](captured, ...) end
  end
  values[3](unpackValues(values, 4, 4))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_27"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = upvalues[0]
  values[1] = values[1]
  values[0] = values[1]["SetCore"]
  values[2] = "SendNotification"
  values[3] = {}
  values[4] = upvalues[1]
  values[3]["Title"] = values[4]
  values[4] = upvalues[2]
  values[3]["Text"] = values[4]
  values[4] = upvalues[3]
  if values[4] then
  else
    values[4] = 4
  end
  values[3]["Duration"] = values[4]
  values[0](unpackValues(values, 1, 3))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_28"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[15] = nil
  values[0] = environment.pcall
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[1] = function(...) return functions["callback_29"](captured, ...) end
  end
  values[0], values[1] = values[0](unpackValues(values, 1, 1))
  values[2] = values[0]
  if not values[2] then
    values[15] = 746622
    values[2] = environment.warn
    values[3] = "[KINON HUB] Ban List tidak dapat diambil; pemeriksaan dilewati."
    values[2](unpackValues(values, 3, 3))
    values[2] = false
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 2, 2)
  else
    values[15] = nil
    values[2] = environment.type
    values[3] = values[1]
    values[2] = values[2](unpackValues(values, 3, 3))
    if (values[2] == "string") then
      values[15] = 450381
      values[2] = environment.pcall
      do
        local cells = {}
        cells[0] = {upvalues, 1}
        cells[1] = {values, 1}
        local captured = setmetatable({}, captureMetatable)
        rawset(captured, false, cells)
        captureGroups[#captureGroups + 1] = cells
        values[3] = function(...) return functions["callback_30"](captured, ...) end
      end
      values[2], values[3] = values[2](unpackValues(values, 3, 3))
      values[4] = values[2]
      if not values[4] then
        values[15] = 707536
        values[4] = environment.warn
        values[5] = "[KINON HUB] Format Banlist.json tidak valid; pemeriksaan dilewati."
        values[4](unpackValues(values, 5, 5))
        values[4] = false
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 4, 4)
      else
        values[15] = 450381
        values[4] = environment.type
        values[5] = values[3]
        values[4] = values[4](unpackValues(values, 5, 5))
        if not (values[4] == "table") then
          values[15] = 707536
          values[4] = environment.warn
          values[5] = "[KINON HUB] Format Banlist.json tidak valid; pemeriksaan dilewati."
          values[4](unpackValues(values, 5, 5))
          values[4] = false
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 4, 4)
        else
          values[15] = 450381
          values[4] = environment.type
          values[5] = values[3]["banned"]
          values[4] = values[4](unpackValues(values, 5, 5))
          if (values[4] == "table") then
            values[15] = 144128
            values[4] = upvalues[2]
            values[6] = upvalues[3]
            values[5] = values[6]["Name"]
            values[4] = values[4](unpackValues(values, 5, 5))
            values[5] = environment.ipairs
            values[6] = values[3]["banned"]
            values[5], values[6], values[7] = values[5](unpackValues(values, 6, 6))
            if type(values[5]) ~= "function" then
              local source = values[5]
              if type(source) == "table" and getmetatable(source) == nil then
                values[5], values[6], values[7] = next, source, nil
              else
                values[5] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
                values[6], values[7] = nil, nil
              end
            end
            do
              local leaveLoop41 = 0
              while true do
                values[15] = 976073
                local results = packValues(values[5](values[6], values[7]))
                for index = 1, 2 do values[7 + index] = results[index] end
                if values[8] ~= nil then
                  values[7] = values[8]
                  values[15] = 524435
                  values[10] = environment.type
                  values[11] = values[9]
                  values[10] = values[10](unpackValues(values, 11, 11))
                  if not (values[10] == "string") then
                    continue
                  else
                    values[15] = 524435
                    values[10] = upvalues[2]
                    values[11] = values[9]
                    values[10] = values[10](unpackValues(values, 11, 11))
                    if not (values[10] == values[4]) then
                      continue
                    else
                      leaveLoop41 = 52
                      break
                    end
                  end
                else
                  leaveLoop41 = 43
                  break
                end
              end
              if leaveLoop41 == 43 then
                values[15] = 976073
                values[5] = false
                closeCapturedValues(captureGroups, values, 0)
                return unpackValues(values, 5, 5)
              elseif leaveLoop41 == 52 then
                values[15] = 524435
                values[10] = upvalues[4]
                values[11] = "KINON HUB"
                values[12] = "Akun kamu masuk dalam Ban List."
                values[13] = 6
                values[10](unpackValues(values, 11, 13))
                values[11] = environment.task
                values[10] = values[11]["wait"]
                values[11] = 0.5
                values[10](unpackValues(values, 11, 11))
                values[11] = upvalues[3]
                values[11] = values[11]
                values[10] = values[11]["Kick"]
                values[12] = "KINON HUB: Username kamu terdaftar dalam Ban List."
                values[10](unpackValues(values, 11, 12))
                values[10] = true
                closeCapturedValues(captureGroups, values, 0)
                return unpackValues(values, 10, 10)
              end
            end
          else
            values[15] = 707536
            values[4] = environment.warn
            values[5] = "[KINON HUB] Format Banlist.json tidak valid; pemeriksaan dilewati."
            values[4](unpackValues(values, 5, 5))
            values[4] = false
            closeCapturedValues(captureGroups, values, 0)
            return unpackValues(values, 4, 4)
          end
        end
      end
    else
      values[15] = 746622
      values[2] = environment.warn
      values[3] = "[KINON HUB] Ban List tidak dapat diambil; pemeriksaan dilewati."
      values[2](unpackValues(values, 3, 3))
      values[2] = false
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 2, 2)
    end
  end
end

functions["callback_29"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = environment.game
  values[1] = values[1]
  values[0] = values[1]["HttpGet"]
  values[2] = upvalues[0]
  local results = packValues(values[0](unpackValues(values, 1, 2)))
  registerTop = 0 + results.n - 1
  for index = 0, registerTop do values[index] = results[index - 0 + 1] end
  closeCapturedValues(captureGroups, values, 0)
  return unpackValues(values, 0, registerTop)
end

functions["callback_30"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = upvalues[0]
  values[1] = values[1]
  values[0] = values[1]["JSONDecode"]
  values[2] = upvalues[1]
  local results = packValues(values[0](unpackValues(values, 1, 2)))
  registerTop = 0 + results.n - 1
  for index = 0, registerTop do values[index] = results[index - 0 + 1] end
  closeCapturedValues(captureGroups, values, 0)
  return unpackValues(values, 0, registerTop)
end

functions["callback_31"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[0] = environment.type
  values[1] = environment.isfile
  values[0] = values[0](unpackValues(values, 1, 1))
  if not (values[0] == "function") then
    values[8] = 468181
    for index = 0, 0 do values[index] = nil end
    for index = 1, 1 do values[index] = nil end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 0, 1)
  else
    values[8] = nil
    values[0] = environment.type
    values[1] = environment.readfile
    values[0] = values[0](unpackValues(values, 1, 1))
    if (values[0] == "function") then
      values[8] = 740462
      values[0] = environment.isfile
      values[1] = upvalues[0]
      values[0] = values[0](unpackValues(values, 1, 1))
      if values[0] then
        values[8] = 228313
        values[0] = environment.pcall
        values[1] = environment.readfile
        values[2] = upvalues[0]
        values[0], values[1] = values[0](unpackValues(values, 1, 2))
        values[2] = values[0]
        if not values[2] then
          values[8] = 510760
          for index = 2, 2 do values[index] = nil end
          for index = 3, 3 do values[index] = nil end
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 2, 3)
        else
          values[8] = 228313
          values[2] = values[1]
          if values[2] then
            values[8] = 977957
            values[3] = values[1]
            values[2] = values[3]["match"]
            values[4] = "^(.-)|(%d+)$"
            values[2], values[3] = values[2](unpackValues(values, 3, 4))
            values[4] = values[2]
            if not values[4] then
              values[8] = 241684
              for index = 4, 4 do values[index] = nil end
              for index = 5, 5 do values[index] = nil end
              closeCapturedValues(captureGroups, values, 0)
              return unpackValues(values, 4, 5)
            else
              values[8] = 977957
              values[4] = values[3]
              if values[4] then
                values[8] = 650713
                values[4] = values[2]
                values[5] = environment.tonumber
                values[6] = values[3]
                local results = packValues(values[5](unpackValues(values, 6, 6)))
                registerTop = 5 + results.n - 1
                for index = 5, registerTop do values[index] = results[index - 5 + 1] end
                closeCapturedValues(captureGroups, values, 0)
                return unpackValues(values, 4, registerTop)
              else
                values[8] = 241684
                for index = 4, 4 do values[index] = nil end
                for index = 5, 5 do values[index] = nil end
                closeCapturedValues(captureGroups, values, 0)
                return unpackValues(values, 4, 5)
              end
            end
          else
            values[8] = 510760
            for index = 2, 2 do values[index] = nil end
            for index = 3, 3 do values[index] = nil end
            closeCapturedValues(captureGroups, values, 0)
            return unpackValues(values, 2, 3)
          end
        end
      else
        values[8] = 740462
        for index = 0, 0 do values[index] = nil end
        for index = 1, 1 do values[index] = nil end
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 0, 1)
      end
    else
      values[8] = 468181
      for index = 0, 0 do values[index] = nil end
      for index = 1, 1 do values[index] = nil end
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 0, 1)
    end
  end
end

functions["callback_32"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = upvalues[0]
  values[0], values[1] = values[0](unpackValues(values, 1, 0))
  values[2] = values[0]
  if not values[2] then
    for index = 2, 2 do values[index] = nil end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 2, 2)
  else
    values[2] = values[1]
    if values[2] then
      values[2] = upvalues[1]
      values[2] = values[2](unpackValues(values, 3, 2))
      if not (values[1] <= values[2]) then
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 0, 0)
      else
        for index = 2, 2 do values[index] = nil end
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 2, 2)
      end
    else
      for index = 2, 2 do values[index] = nil end
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 2, 2)
    end
  end
end

functions["callback_33"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 0 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[13] = nil
  values[1] = environment.type
  values[2] = environment.writefile
  values[1] = values[1](unpackValues(values, 2, 2))
  if (values[1] == "function") then
    values[13] = 300034
    values[1] = environment.pcall
    values[2] = environment.writefile
    values[3] = upvalues[0]
    values[5] = values[0]
    values[7] = "|"
    values[8] = environment.tostring
    values[10] = upvalues[1]
    values[10] = values[10](unpackValues(values, 11, 10))
    values[11] = upvalues[2]
    values[9] = values[10] + values[11]
    values[13] = 164654
    values[8] = values[8](unpackValues(values, 9, 9))
    local joined = values[8]
    for index = 7, 7, -1 do joined = values[index] .. joined end
    values[6] = joined
    local joined = values[6]
    for index = 5, 5, -1 do joined = values[index] .. joined end
    values[4] = joined
    local results = packValues(values[1](unpackValues(values, 2, 4)))
    registerTop = 1 + results.n - 1
    for index = 1, registerTop do values[index] = results[index - 1 + 1] end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 1, registerTop)
  else
    values[13] = nil
    values[1] = false
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 1, 1)
  end
end

functions["callback_34"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[5] = nil
  values[0] = upvalues[0]
  values[0], values[1] = values[0](unpackValues(values, 1, 0))
  values[2] = values[1]
  if values[2] then
    values[5] = 859968
    values[3] = upvalues[1]
    values[3] = values[3](unpackValues(values, 4, 3))
    values[2] = values[1] - values[3]
    if (0 < values[2]) then
      values[5] = 29939
      values[3] = true
    else
      values[5] = 859968
      values[3] = false
    end
    values[5] = 957268
    if not values[3] then
    else
      values[5] = 957268
      values[3] = values[2]
    end
    values[5] = 1024482
    if values[3] then
    else
      values[5] = 1024482
      values[3] = 0
    end
    values[5] = 125305
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 3, 3)
  else
    values[5] = nil
    values[2] = 0
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 2, 2)
  end
end

functions["callback_35"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[7] = nil
  values[0] = environment.type
  values[1] = environment.isfile
  values[0] = values[0](unpackValues(values, 1, 1))
  if not (values[0] == "function") then
    values[7] = 358519
    for index = 0, 0 do values[index] = nil end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 0, 0)
  else
    values[7] = nil
    values[0] = environment.type
    values[1] = environment.readfile
    values[0] = values[0](unpackValues(values, 1, 1))
    if (values[0] == "function") then
      values[7] = 826305
      values[0] = environment.isfile
      values[1] = upvalues[0]
      values[0] = values[0](unpackValues(values, 1, 1))
      if values[0] then
        values[7] = 273199
        values[0] = environment.pcall
        values[1] = environment.readfile
        values[2] = upvalues[0]
        values[0], values[1] = values[0](unpackValues(values, 1, 2))
        values[2] = values[0]
        if not values[2] then
          values[7] = 527051
          for index = 2, 2 do values[index] = nil end
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 2, 2)
        else
          values[7] = 273199
          values[2] = values[1]
          if values[2] then
            values[7] = 54986
            values[2] = environment.tonumber
            values[4] = values[1]
            values[3] = values[4]["match"]
            values[5] = "^(%d+)$"
            local results = packValues(values[3](unpackValues(values, 4, 5)))
            registerTop = 3 + results.n - 1
            for index = 3, registerTop do values[index] = results[index - 3 + 1] end
            local results = packValues(values[2](unpackValues(values, 3, registerTop)))
            registerTop = 2 + results.n - 1
            for index = 2, registerTop do values[index] = results[index - 2 + 1] end
            closeCapturedValues(captureGroups, values, 0)
            return unpackValues(values, 2, registerTop)
          else
            values[7] = 527051
            for index = 2, 2 do values[index] = nil end
            closeCapturedValues(captureGroups, values, 0)
            return unpackValues(values, 2, 2)
          end
        end
      else
        values[7] = 826305
        for index = 0, 0 do values[index] = nil end
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 0, 0)
      end
    else
      values[7] = 358519
      for index = 0, 0 do values[index] = nil end
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 0, 0)
    end
  end
end

functions["callback_36"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = environment.type
  values[1] = environment.writefile
  values[0] = values[0](unpackValues(values, 1, 1))
  if (values[0] == "function") then
    values[0] = environment.pcall
    values[1] = environment.writefile
    values[2] = upvalues[0]
    values[3] = environment.tostring
    values[4] = upvalues[1]
    local results = packValues(values[4](unpackValues(values, 5, 4)))
    registerTop = 4 + results.n - 1
    for index = 4, registerTop do values[index] = results[index - 4 + 1] end
    local results = packValues(values[3](unpackValues(values, 4, registerTop)))
    registerTop = 3 + results.n - 1
    for index = 3, registerTop do values[index] = results[index - 3 + 1] end
    local results = packValues(values[0](unpackValues(values, 1, registerTop)))
    registerTop = 0 + results.n - 1
    for index = 0, registerTop do values[index] = results[index - 0 + 1] end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 0, registerTop)
  else
    values[0] = false
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 0, 0)
  end
end

functions["callback_37"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[5] = nil
  values[0] = upvalues[0]
  values[0] = values[0](unpackValues(values, 1, 0))
  values[1] = values[0]
  if values[1] then
    values[5] = 522963
    values[2] = upvalues[1]
    values[2] = values[2](unpackValues(values, 3, 2))
    values[1] = values[2] - values[0]
    values[2] = upvalues[2]
    if not (values[2] <= values[1]) then
      values[5] = 267772
      values[3] = upvalues[2]
      values[2] = values[3] - values[1]
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 2, 2)
    else
      values[5] = 522963
      values[2] = 0
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 2, 2)
    end
  else
    values[5] = nil
    values[1] = 0
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 1, 1)
  end
end

functions["callback_38"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = upvalues[0]
  values[1] = values[1](unpackValues(values, 2, 1))
  if not (values[1] == nil) then
    values[0] = true
  else
    values[0] = false
  end
  if not values[0] then
  else
    values[1] = upvalues[1]
    values[1] = values[1](unpackValues(values, 2, 1))
    if (0 < values[1]) then
      values[0] = true
    else
      values[0] = false
    end
  end
  closeCapturedValues(captureGroups, values, 0)
  return unpackValues(values, 0, 0)
end

functions["callback_39"] = function(upvalues, ...)
  runEmbeddedKinonHub()
  return
end

functions["extractAssetId"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 0 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = environment.type
  values[2] = values[0]
  values[1] = values[1](unpackValues(values, 2, 2))
  if (values[1] == "string") then
    values[2] = values[0]
    values[1] = values[2]["match"]
    values[3] = "(%d+)"
    local results = packValues(values[1](unpackValues(values, 2, 3)))
    registerTop = 1 + results.n - 1
    for index = 1, registerTop do values[index] = results[index - 1 + 1] end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 1, registerTop)
  else
    for index = 1, 1 do values[index] = nil end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 1, 1)
  end
end

functions["callback_41"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[2] = environment.pcall
  do
    local cells = {}
    cells[0] = {values, 0}
    cells[1] = {values, 1}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[3] = function(...) return functions["callback_42"](captured, ...) end
  end
  values[2] = values[2](unpackValues(values, 3, 3))
  values[3] = values[2]
  if values[3] then
    values[8] = 482920
    values[4] = environment.os
    values[3] = values[4]["clock"]
    values[3] = values[3](unpackValues(values, 4, 3))
    do
      local leaveLoop11 = 0
      while true do
        values[8] = 653764
        values[4] = values[0]["IsLoaded"]
        if values[4] then
        else
          values[8] = 653764
          values[6] = environment.os
          values[5] = values[6]["clock"]
          values[5] = values[5](unpackValues(values, 6, 5))
          values[4] = values[5] - values[3]
          if not (values[4] < 3) then
          else
            values[8] = 653764
            values[5] = environment.task
            values[4] = values[5]["wait"]
            values[5] = 0.1
            values[4](unpackValues(values, 5, 5))
            continue
          end
        end
        leaveLoop11 = 13
        break
      end
    end
    values[8] = 203427
    values[4] = values[0]["IsLoaded"]
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 4, 4)
  else
    values[8] = nil
    values[3] = false
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 3, 3)
  end
end

functions["callback_42"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = upvalues[0]
  values[1] = upvalues[1]
  values[0]["Image"] = values[1]
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_43"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 0 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[1] = environment.pcall
  do
    local cells = {}
    cells[0] = {values, 0}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[2] = function(...) return functions["callback_44"](captured, ...) end
  end
  values[1], values[2] = values[1](unpackValues(values, 2, 2))
  values[3] = values[1]
  if not values[3] then
    values[8] = 864804
    for index = 3, 3 do values[index] = nil end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 3, 3)
  else
    values[8] = nil
    values[3] = environment.type
    values[4] = values[2]
    values[3] = values[3](unpackValues(values, 4, 4))
    if (values[3] == "table") then
      values[8] = 808189
      values[3] = values[2][1]
      values[4] = values[3]
      if values[4] then
        values[8] = 769135
        for index = 4, 4 do values[index] = nil end
        values[5] = environment.pcall
        do
          local cells = {}
          cells[0] = {values, 3}
          cells[1] = {values, 4}
          local captured = setmetatable({}, captureMetatable)
          rawset(captured, false, cells)
          captureGroups[#captureGroups + 1] = cells
          values[6] = function(...) return functions["callback_45"](captured, ...) end
        end
        values[5](unpackValues(values, 6, 6))
        values[5] = environment.pcall
        do
          local cells = {}
          cells[0] = {values, 3}
          local captured = setmetatable({}, captureMetatable)
          rawset(captured, false, cells)
          captureGroups[#captureGroups + 1] = cells
          values[6] = function(...) return functions["callback_46"](captured, ...) end
        end
        values[5](unpackValues(values, 6, 6))
        values[5] = environment.type
        values[6] = values[4]
        values[5] = values[5](unpackValues(values, 6, 6))
        if not (values[5] == "string") then
          values[8] = 666731
          for index = 5, 5 do values[index] = nil end
          closeCapturedValues(captureGroups, values, 0)
          return unpackValues(values, 5, 5)
        else
          values[8] = 769135
          if (values[4] == "") then
            values[8] = 666731
            for index = 5, 5 do values[index] = nil end
            closeCapturedValues(captureGroups, values, 0)
            return unpackValues(values, 5, 5)
          else
            values[8] = 769135
            closeCapturedValues(captureGroups, values, 0)
            return unpackValues(values, 4, 4)
          end
        end
      else
        values[8] = 808189
        for index = 4, 4 do values[index] = nil end
        closeCapturedValues(captureGroups, values, 0)
        return unpackValues(values, 4, 4)
      end
    else
      values[8] = 864804
      for index = 3, 3 do values[index] = nil end
      closeCapturedValues(captureGroups, values, 0)
      return unpackValues(values, 3, 3)
    end
  end
end

functions["callback_44"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = environment.game
  values[1] = values[1]
  values[0] = values[1]["GetObjects"]
  values[3] = "rbxassetid://"
  values[4] = upvalues[0]
  local joined = values[4]
  for index = 3, 3, -1 do joined = values[index] .. joined end
  values[2] = joined
  local results = packValues(values[0](unpackValues(values, 1, 2)))
  registerTop = 0 + results.n - 1
  for index = 0, registerTop do values[index] = results[index - 0 + 1] end
  closeCapturedValues(captureGroups, values, 0)
  return unpackValues(values, 0, registerTop)
end

functions["callback_45"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[5] = nil
  values[1] = upvalues[0]
  values[1] = values[1]
  values[0] = values[1]["IsA"]
  values[2] = "Decal"
  values[0] = values[0](unpackValues(values, 1, 2))
  if values[0] then
    values[5] = 816641
    values[1] = upvalues[0]
    values[0] = values[1]["Texture"]
    upvalues[1] = values[0]
  else
    values[5] = nil
    values[1] = upvalues[0]
    values[1] = values[1]
    values[0] = values[1]["IsA"]
    values[2] = "Texture"
    values[0] = values[0](unpackValues(values, 1, 2))
    if not values[0] then
      values[5] = 346978
      values[1] = upvalues[0]
      values[1] = values[1]
      values[0] = values[1]["IsA"]
      values[2] = "ImageLabel"
      values[0] = values[0](unpackValues(values, 1, 2))
      if values[0] then
        values[5] = 662347
        values[1] = upvalues[0]
        values[0] = values[1]["Image"]
        upvalues[1] = values[0]
      else
        values[5] = 346978
        values[1] = upvalues[0]
        values[1] = values[1]
        values[0] = values[1]["IsA"]
        values[2] = "ImageButton"
        values[0] = values[0](unpackValues(values, 1, 2))
        if not values[0] then
          values[5] = 42758
          values[1] = upvalues[0]
          values[1] = values[1]
          values[0] = values[1]["FindFirstChildWhichIsA"]
          values[2] = "Decal"
          values[3] = true
          values[0] = values[0](unpackValues(values, 1, 3))
          if values[0] then
          else
            values[5] = 42758
            values[1] = upvalues[0]
            values[1] = values[1]
            values[0] = values[1]["FindFirstChildWhichIsA"]
            values[2] = "Texture"
            values[3] = true
            values[0] = values[0](unpackValues(values, 1, 3))
          end
          values[5] = 197
          values[1] = values[0]
          if not values[1] then
          else
            values[5] = 197
            values[1] = values[0]["Texture"]
            upvalues[1] = values[1]
          end
        else
          values[5] = 662347
          values[1] = upvalues[0]
          values[0] = values[1]["Image"]
          upvalues[1] = values[0]
        end
      end
    else
      values[5] = 816641
      values[1] = upvalues[0]
      values[0] = values[1]["Texture"]
      upvalues[1] = values[0]
    end
  end
  values[5] = 569710
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_46"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = upvalues[0]
  values[1] = values[1]
  values[0] = values[1]["Destroy"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_47"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[3] = environment.task
  values[2] = values[3]["spawn"]
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    cells[1] = {upvalues, 1}
    cells[2] = {upvalues, 2}
    cells[3] = {values, 0}
    cells[4] = {upvalues, 3}
    cells[5] = {values, 1}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[3] = function(...) return functions["callback_48"](captured, ...) end
  end
  values[2](unpackValues(values, 3, 3))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_48"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[16] = nil
  values[0] = environment.ipairs
  values[1] = upvalues[0]
  values[0], values[1], values[2] = values[0](unpackValues(values, 1, 1))
  if type(values[0]) ~= "function" then
    local source = values[0]
    if type(source) == "table" and getmetatable(source) == nil then
      values[0], values[1], values[2] = next, source, nil
    else
      values[0] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
      values[1], values[2] = nil, nil
    end
  end
  do
    local leaveLoop5 = 0
    while true do
      values[16] = 994603
      local results = packValues(values[0](values[1], values[2]))
      for index = 1, 2 do values[2 + index] = results[index] end
      if values[3] ~= nil then
        values[2] = values[3]
        values[16] = 419945
        values[5] = upvalues[1]
        values[6] = values[4]
        values[5] = values[5](unpackValues(values, 6, 6))
        values[6] = values[5]
        if not values[6] then
          continue
        else
          values[16] = 419945
          values[6] = {}
          values[8] = "rbxassetid://"
          values[9] = values[5]
          local joined = values[9]
          for index = 8, 8, -1 do joined = values[index] .. joined end
          values[7] = joined
          values[9] = "rbxthumb://type=Asset&id="
          values[11] = values[5]
          values[12] = "&w=150&h=150"
          local joined = values[12]
          for index = 11, 11, -1 do joined = values[index] .. joined end
          values[10] = joined
          local joined = values[10]
          for index = 9, 9, -1 do joined = values[index] .. joined end
          values[8] = joined
          for index = 1, 2 do values[6][0 + index] = values[6 + index] end
          values[7] = environment.ipairs
          values[8] = values[6]
          values[7], values[8], values[9] = values[7](unpackValues(values, 8, 8))
          if type(values[7]) ~= "function" then
            local source = values[7]
            if type(source) == "table" and getmetatable(source) == nil then
              values[7], values[8], values[9] = next, source, nil
            else
              values[7] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
              values[8], values[9] = nil, nil
            end
          end
          do
            local leaveLoop33 = 0
            while true do
              values[16] = 527985
              local results = packValues(values[7](values[8], values[9]))
              for index = 1, 2 do values[9 + index] = results[index] end
              if values[10] ~= nil then
                values[9] = values[10]
                values[16] = 13190
                values[12] = upvalues[2]
                values[13] = upvalues[3]
                values[14] = values[11]
                values[12] = values[12](unpackValues(values, 13, 14))
                if not values[12] then
                  continue
                else
                  leaveLoop33 = 44
                  break
                end
              else
                leaveLoop33 = 35
                break
              end
            end
            if leaveLoop33 == 35 then
              values[16] = 527985
              values[7] = upvalues[4]
              values[8] = values[5]
              values[7] = values[7](unpackValues(values, 8, 8))
              values[8] = values[7]
              if not values[8] then
                continue
              else
                values[16] = 527985
                values[8] = upvalues[2]
                values[9] = upvalues[3]
                values[10] = values[7]
                values[8] = values[8](unpackValues(values, 9, 10))
                if not values[8] then
                  continue
                else
                  leaveLoop5 = 49
                  break
                end
              end
            elseif leaveLoop33 == 44 then
              leaveLoop5 = 44
              break
            end
          end
        end
      else
        leaveLoop5 = 7
        break
      end
    end
    if leaveLoop5 == 7 then
      values[16] = 994603
      values[0] = upvalues[3]
      values[1] = ""
      values[0]["Image"] = values[1]
      values[0] = upvalues[5]
      if not values[0] then
      else
        values[16] = 994603
        values[0] = upvalues[5]
        values[1] = true
        values[0]["Visible"] = values[1]
      end
      values[16] = 714091
      closeCapturedValues(captureGroups, values, 0)
      return
    elseif leaveLoop5 == 44 then
      values[16] = 13190
      closeCapturedValues(captureGroups, values, 0)
      return
    elseif leaveLoop5 == 49 then
      values[16] = 527985
      closeCapturedValues(captureGroups, values, 0)
      return
    end
  end
end

functions["callback_49"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = environment.gethui
  if not values[0] then
  else
    values[0] = environment.gethui
    values[0] = values[0](unpackValues(values, 1, 0))
  end
  if values[0] then
  else
    values[1] = environment.game
    values[1] = values[1]
    values[0] = values[1]["GetService"]
    values[2] = "CoreGui"
    values[0] = values[0](unpackValues(values, 1, 2))
  end
  upvalues[0] = values[0]
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_50"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = environment.syn
  if not values[0] then
  else
    values[1] = environment.syn
    values[0] = values[1]["protect_gui"]
    if not values[0] then
    else
      values[1] = environment.syn
      values[0] = values[1]["protect_gui"]
      values[1] = upvalues[0]
      values[0](unpackValues(values, 1, 1))
    end
  end
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_51"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = environment.ipairs
  values[1] = upvalues[0]
  values[0], values[1], values[2] = values[0](unpackValues(values, 1, 1))
  if type(values[0]) ~= "function" then
    local source = values[0]
    if type(source) == "table" and getmetatable(source) == nil then
      values[0], values[1], values[2] = next, source, nil
    else
      values[0] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
      values[1], values[2] = nil, nil
    end
  end
  do
    local leaveLoop5 = 0
    while true do
      local results = packValues(values[0](values[1], values[2]))
      for index = 1, 2 do values[2 + index] = results[index] end
      if values[3] ~= nil then
        values[2] = values[3]
        values[5] = environment.pcall
        do
          local cells = {}
          cells[0] = {values, 4}
          local captured = setmetatable({}, captureMetatable)
          rawset(captured, false, cells)
          captureGroups[#captureGroups + 1] = cells
          values[6] = function(...) return functions["callback_52"](captured, ...) end
        end
        values[5](unpackValues(values, 6, 6))
        closeCapturedValues(captureGroups, values, 4)
        continue
      end
      leaveLoop5 = 7
      break
    end
  end
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_52"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = upvalues[0]
  values[1] = values[1]
  values[0] = values[1]["Disconnect"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_53"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[0] = upvalues[0]
  if values[0] then
    values[8] = 671526
    values[1] = upvalues[0]
    values[0] = values[1]["ViewportSize"]
    values[2] = environment.math
    values[1] = values[2]["clamp"]
    values[5] = environment.math
    values[2] = values[5]["min"]
    values[6] = values[0]["X"]
    values[5] = values[6] - 24
    values[6] = upvalues[1]
    values[3] = values[5] / values[6]
    values[6] = values[0]["Y"]
    values[5] = values[6] - 24
    values[6] = upvalues[2]
    values[8] = 537478
    values[4] = values[5] / values[6]
    values[2] = values[2](unpackValues(values, 3, 4))
    values[3] = 0.55
    values[4] = 1
    local results = packValues(values[1](unpackValues(values, 2, 4)))
    registerTop = 1 + results.n - 1
    for index = 1, registerTop do values[index] = results[index - 1 + 1] end
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 1, registerTop)
  else
    values[8] = nil
    values[0] = 1
    closeCapturedValues(captureGroups, values, 0)
    return unpackValues(values, 0, 0)
  end
end

functions["callback_54"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = upvalues[0]
  values[0] = values[0](unpackValues(values, 1, 0))
  upvalues[1] = values[0]
  values[0] = upvalues[2]
  values[1] = upvalues[1]
  values[0]["Scale"] = values[1]
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_55"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[11] = nil
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.15
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[7] = environment.Color3
  values[6] = values[7]["fromRGB"]
  values[7] = 60
  values[8] = 60
  values[9] = 60
  values[6] = values[6](unpackValues(values, 7, 9))
  values[5]["BackgroundColor3"] = values[6]
  values[11] = 260328
  values[6] = upvalues[2]
  values[5]["TextColor3"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[3]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.15
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = upvalues[2]
  values[11] = 658503
  values[5]["Color"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_56"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[11] = nil
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.15
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[7] = environment.Color3
  values[6] = values[7]["fromRGB"]
  values[7] = 32
  values[8] = 32
  values[9] = 32
  values[6] = values[6](unpackValues(values, 7, 9))
  values[5]["BackgroundColor3"] = values[6]
  values[7] = environment.Color3
  values[11] = 454738
  values[6] = values[7]["fromRGB"]
  values[7] = 175
  values[8] = 175
  values[9] = 175
  values[6] = values[6](unpackValues(values, 7, 9))
  values[5]["TextColor3"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[2]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.15
  values[11] = 559867
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = upvalues[3]
  values[5]["Color"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_57"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.15
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = upvalues[2]
  values[5]["Color"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_58"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.15
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = upvalues[2]
  values[5]["Color"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_59"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 0 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = values[0]["MouseEnter"]
  values[2] = values[2]
  values[1] = values[2]["Connect"]
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    cells[1] = {values, 0}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[3] = function(...) return functions["callback_60"](captured, ...) end
  end
  values[1](unpackValues(values, 2, 3))
  values[2] = values[0]["MouseLeave"]
  values[2] = values[2]
  values[1] = values[2]["Connect"]
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    cells[1] = {values, 0}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[3] = function(...) return functions["callback_61"](captured, ...) end
  end
  values[1](unpackValues(values, 2, 3))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_60"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.12
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = 0.12
  values[5]["BackgroundTransparency"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_61"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.12
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = 0
  values[5]["BackgroundTransparency"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_62"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[11] = nil
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[1]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.22
  values[9] = environment.Enum
  values[8] = values[9]["EasingStyle"]
  values[6] = values[8]["Quad"]
  values[11] = 882013
  values[9] = environment.Enum
  values[8] = values[9]["EasingDirection"]
  values[7] = values[8]["In"]
  values[4] = values[4](unpackValues(values, 5, 7))
  values[5] = {}
  values[6] = 0
  values[5]["Scale"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  values[2] = upvalues[0]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[11] = 875068
  values[3] = upvalues[2]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.2
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = 1
  values[5]["BackgroundTransparency"] = values[6]
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  values[1] = environment.task
  values[0] = values[1]["delay"]
  values[11] = 145510
  values[1] = 0.25
  do
    local cells = {}
    cells[0] = {upvalues, 3}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[2] = function(...) return functions["callback_63"](captured, ...) end
  end
  values[0](unpackValues(values, 1, 2))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_63"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = upvalues[0]
  values[1] = values[1]
  values[0] = values[1]["Destroy"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_64"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[10] = nil
  values[0] = upvalues[0]
  values[2] = upvalues[1]
  values[1] = values[2]["Text"]
  values[0] = values[0](unpackValues(values, 1, 1))
  values[2] = values[0]
  values[1] = #values[2]
  if not (values[1] < 4) then
    values[10] = 1021932
    values[2] = upvalues[2]
    values[1] = #values[2]
    if not (values[1] == 0) then
    else
      values[10] = 1021932
      values[1] = environment.pcall
      values[2] = upvalues[3]
      values[1](unpackValues(values, 2, 2))
    end
    values[10] = 538417
    values[1] = environment.ipairs
    values[2] = upvalues[2]
    values[1], values[2], values[3] = values[1](unpackValues(values, 2, 2))
    if type(values[1]) ~= "function" then
      local source = values[1]
      if type(source) == "table" and getmetatable(source) == nil then
        values[1], values[2], values[3] = next, source, nil
      else
        values[1] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
        values[2], values[3] = nil, nil
      end
    end
    do
      local leaveLoop19 = 0
      while true do
        values[10] = 865146
        local results = packValues(values[1](values[2], values[3]))
        for index = 1, 2 do values[3 + index] = results[index] end
        if values[4] ~= nil then
          values[3] = values[4]
          values[10] = 439350
          if not (values[5] == values[0]) then
            continue
          else
            leaveLoop19 = 22
            break
          end
        else
          leaveLoop19 = 21
          break
        end
      end
      if leaveLoop19 == 21 then
        values[10] = 865146
        closeCapturedValues(captureGroups, values, 0)
        return
      elseif leaveLoop19 == 22 then
        values[10] = 439350
        values[6] = environment.pcall
        values[7] = upvalues[4]
        values[8] = values[0]
        values[6](unpackValues(values, 7, 8))
        closeCapturedValues(captureGroups, values, 0)
        return
      end
    end
  else
    values[10] = nil
    closeCapturedValues(captureGroups, values, 0)
    return
  end
end

functions["callback_65"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[1] = environment.game
  values[1] = values[1]
  values[0] = values[1]["BindToClose"]
  do
    local cells = {}
    cells[0] = {upvalues, 0}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[2] = function(...) return functions["callback_66"](captured, ...) end
  end
  values[0](unpackValues(values, 1, 2))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_66"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = upvalues[0]
  values[0](unpackValues(values, 1, 0))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_67"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = upvalues[0]
  values[1] = values[2]["AncestryChanged"]
  values[1] = values[1]
  values[0] = values[1]["Connect"]
  do
    local cells = {}
    cells[0] = {upvalues, 1}
    local captured = setmetatable({}, captureMetatable)
    rawset(captured, false, cells)
    captureGroups[#captureGroups + 1] = cells
    values[2] = function(...) return functions["callback_68"](captured, ...) end
  end
  values[0](unpackValues(values, 1, 2))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_68"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[2] = values[1]
  if values[2] then
  else
    values[2] = upvalues[0]
    values[2](unpackValues(values, 3, 2))
  end
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_69"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[5] = nil
  values[2] = upvalues[0]
  values[3] = values[0]
  values[2]["Text"] = values[3]
  if not (values[1] == "good") then
    values[5] = 672735
    if not (values[1] == "bad") then
      values[5] = 727998
      values[2] = upvalues[0]
      values[3] = upvalues[3]
      values[2]["TextColor3"] = values[3]
    else
      values[5] = 672735
      values[2] = upvalues[0]
      values[3] = upvalues[2]
      values[2]["TextColor3"] = values[3]
    end
  else
    values[5] = nil
    values[2] = upvalues[0]
    values[3] = upvalues[1]
    values[2]["TextColor3"] = values[3]
  end
  values[5] = 792261
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_70"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[7] = nil
  values[0] = upvalues[0]
  values[0] = values[0](unpackValues(values, 1, 0))
  if not (0 < values[0]) then
    values[7] = 361076
    values[1] = upvalues[5]
    values[1], values[2] = values[1](unpackValues(values, 2, 1))
    values[3] = values[1]
    if not values[3] then
      values[7] = 914139
      values[3] = upvalues[1]
      values[4] = "No active key"
      values[3]["Text"] = values[4]
    else
      values[7] = 361076
      values[3] = values[2]
      if not values[3] then
        values[7] = 914139
        values[3] = upvalues[1]
        values[4] = "No active key"
        values[3]["Text"] = values[4]
      else
        values[7] = 361076
        values[3] = upvalues[6]
        values[3] = values[3](unpackValues(values, 4, 3))
        if not (values[2] <= values[3]) then
          values[7] = 914139
          values[3] = upvalues[1]
          values[4] = "No active key"
          values[3]["Text"] = values[4]
        else
          values[7] = 1043229
          values[3] = upvalues[1]
          values[4] = "Previous key expired"
          values[3]["Text"] = values[4]
        end
      end
    end
    values[7] = 771890
    values[3] = upvalues[1]
    values[4] = upvalues[7]
    values[3]["TextColor3"] = values[4]
    values[3] = upvalues[4]
    values[4] = upvalues[7]
    values[3]["BackgroundColor3"] = values[4]
  else
    values[7] = nil
    values[1] = upvalues[1]
    values[3] = "Expires in  "
    values[4] = upvalues[2]
    values[5] = values[0]
    values[4] = values[4](unpackValues(values, 5, 5))
    local joined = values[4]
    for index = 3, 3, -1 do joined = values[index] .. joined end
    values[2] = joined
    values[1]["Text"] = values[2]
    values[1] = upvalues[1]
    values[7] = 682433
    values[2] = upvalues[3]
    values[1]["TextColor3"] = values[2]
    values[1] = upvalues[4]
    values[2] = upvalues[3]
    values[1]["BackgroundColor3"] = values[2]
  end
  values[7] = 767546
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_71"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[0] = upvalues[0]
  values[0] = values[0](unpackValues(values, 1, 0))
  values[1] = upvalues[1]
  values[1] = values[1](unpackValues(values, 2, 1))
  if values[1] then
    values[8] = 228946
    if (0 < values[0]) then
      values[8] = 678449
      values[1] = true
    else
      values[8] = 228946
      values[1] = false
    end
    values[8] = 36670
    if not values[1] then
    else
      values[8] = 36670
      values[1] = values[0]
    end
    values[8] = 322586
    if values[1] then
    else
      values[8] = 322586
      values[1] = upvalues[2]
      values[1] = values[1](unpackValues(values, 2, 1))
    end
    values[8] = 921648
    values[2] = upvalues[3]
    values[4] = "LOCKED  "
    values[5] = upvalues[4]
    values[6] = values[1]
    values[5] = values[5](unpackValues(values, 6, 6))
    local joined = values[5]
    for index = 4, 4, -1 do joined = values[index] .. joined end
    values[3] = joined
    values[2]["Text"] = values[3]
    values[2] = upvalues[3]
    values[4] = environment.Color3
    values[3] = values[4]["fromRGB"]
    values[4] = 32
    values[5] = 32
    values[6] = 32
    values[8] = 852689
    values[3] = values[3](unpackValues(values, 4, 6))
    values[2]["BackgroundColor3"] = values[3]
    values[2] = upvalues[3]
    values[3] = upvalues[5]
    values[2]["TextColor3"] = values[3]
  else
    values[8] = nil
    if not (0 < values[0]) then
      values[8] = 802344
      values[1] = upvalues[3]
      values[2] = "GET FREE KEY"
      values[1]["Text"] = values[2]
      values[1] = upvalues[3]
      values[2] = upvalues[6]
      values[1]["BackgroundColor3"] = values[2]
      values[1] = upvalues[3]
      values[3] = environment.Color3
      values[2] = values[3]["fromRGB"]
      values[3] = 10
      values[4] = 10
      values[5] = 10
      values[2] = values[2](unpackValues(values, 3, 5))
      values[1]["TextColor3"] = values[2]
    else
      values[8] = 228946
      if (0 < values[0]) then
        values[8] = 678449
        values[1] = true
      else
        values[8] = 228946
        values[1] = false
      end
      values[8] = 36670
      if not values[1] then
      else
        values[8] = 36670
        values[1] = values[0]
      end
      values[8] = 322586
      if values[1] then
      else
        values[8] = 322586
        values[1] = upvalues[2]
        values[1] = values[1](unpackValues(values, 2, 1))
      end
      values[8] = 921648
      values[2] = upvalues[3]
      values[4] = "LOCKED  "
      values[5] = upvalues[4]
      values[6] = values[1]
      values[5] = values[5](unpackValues(values, 6, 6))
      local joined = values[5]
      for index = 4, 4, -1 do joined = values[index] .. joined end
      values[3] = joined
      values[2]["Text"] = values[3]
      values[2] = upvalues[3]
      values[4] = environment.Color3
      values[3] = values[4]["fromRGB"]
      values[4] = 32
      values[5] = 32
      values[6] = 32
      values[8] = 852689
      values[3] = values[3](unpackValues(values, 4, 6))
      values[2]["BackgroundColor3"] = values[3]
      values[2] = upvalues[3]
      values[3] = upvalues[5]
      values[2]["TextColor3"] = values[3]
    end
  end
  values[8] = 657233
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_72"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  do
    local leaveLoop1 = 0
    while true do
      values[1] = upvalues[0]
      values[0] = values[1]["Parent"]
      if not values[0] then
      else
        values[0] = upvalues[1]
        values[0](unpackValues(values, 1, 0))
        values[0] = upvalues[2]
        values[0](unpackValues(values, 1, 0))
        values[1] = environment.task
        values[0] = values[1]["wait"]
        values[1] = 1
        values[0](unpackValues(values, 1, 1))
        continue
      end
      leaveLoop1 = 4
      break
    end
  end
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_73"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, 0 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[12] = nil
  values[1] = upvalues[0]
  if not values[1] then
    values[12] = 35218
    values[1] = true
    upvalues[0] = values[1]
    values[1] = environment.pcall
    values[2] = upvalues[1]
    values[3] = values[0]
    values[1](unpackValues(values, 2, 3))
    values[1] = upvalues[2]
    values[2] = "ACCESS GRANTED"
    values[1]["Text"] = values[2]
    values[1] = upvalues[2]
    values[3] = environment.Color3
    values[2] = values[3]["fromRGB"]
    values[3] = 22
    values[4] = 60
    values[5] = 36
    values[12] = 561460
    values[2] = values[2](unpackValues(values, 3, 5))
    values[1]["BackgroundColor3"] = values[2]
    values[1] = upvalues[2]
    values[2] = upvalues[3]
    values[1]["TextColor3"] = values[2]
    values[3] = upvalues[4]
    values[3] = values[3]
    values[2] = values[3]["Create"]
    values[4] = upvalues[5]
    values[12] = 590473
    values[7] = environment.TweenInfo
    values[5] = values[7]["new"]
    values[6] = 0.2
    values[5] = values[5](unpackValues(values, 6, 6))
    values[6] = {}
    values[8] = environment.Color3
    values[7] = values[8]["fromRGB"]
    values[8] = 30
    values[12] = 63717
    values[9] = 90
    values[10] = 50
    values[7] = values[7](unpackValues(values, 8, 10))
    values[6]["Color"] = values[7]
    values[2] = values[2](unpackValues(values, 3, 6))
    values[2] = values[2]
    values[1] = values[2]["Play"]
    values[1](unpackValues(values, 2, 2))
    values[1] = upvalues[6]
    values[12] = 223802
    values[2] = "Loading hub..."
    values[3] = "good"
    values[1](unpackValues(values, 2, 3))
    values[1] = upvalues[7]
    values[2] = "KINON HUB"
    values[3] = "Key accepted! Access granted."
    values[4] = 4
    values[1](unpackValues(values, 2, 4))
    values[1] = upvalues[8]
    values[1](unpackValues(values, 2, 1))
    values[1] = upvalues[9]
    values[1] = values[1](unpackValues(values, 2, 1))
    if values[1] then
      values[12] = 58153
      values[2] = environment.task
      values[1] = values[2]["wait"]
      values[2] = 0.6
      values[1](unpackValues(values, 2, 2))
      values[1] = environment.pcall
      do
        local cells = {}
        cells[0] = {upvalues, 12}
        local captured = setmetatable({}, captureMetatable)
        rawset(captured, false, cells)
        captureGroups[#captureGroups + 1] = cells
        values[2] = function(...) return functions["callback_75"](captured, ...) end
      end
      values[1], values[2] = values[1](unpackValues(values, 2, 2))
      values[3] = values[1]
      if values[3] then
        values[12] = 722844
        values[3] = upvalues[2]
        values[4] = "LOADED"
        values[3]["Text"] = values[4]
        values[3] = upvalues[6]
        values[4] = "Hub loaded"
        values[5] = "good"
        values[3](unpackValues(values, 4, 5))
        values[4] = environment.task
        values[12] = 851869
        values[3] = values[4]["wait"]
        values[4] = 0.8
        values[3](unpackValues(values, 4, 4))
        values[3] = upvalues[13]
        values[3](unpackValues(values, 4, 3))
        closeCapturedValues(captureGroups, values, 0)
        return
      else
        values[12] = 58153
        values[3] = false
        upvalues[0] = values[3]
        values[12] = 787950
        values[3] = upvalues[2]
        values[4] = "RETRY"
        values[3]["Text"] = values[4]
        values[3] = upvalues[2]
        values[5] = environment.Color3
        values[4] = values[5]["fromRGB"]
        values[5] = 70
        values[6] = 26
        values[7] = 26
        values[4] = values[4](unpackValues(values, 5, 7))
        values[3]["BackgroundColor3"] = values[4]
        values[12] = 32448
        values[3] = upvalues[2]
        values[5] = environment.Color3
        values[4] = values[5]["fromRGB"]
        values[5] = 255
        values[6] = 170
        values[7] = 170
        values[4] = values[4](unpackValues(values, 5, 7))
        values[3]["TextColor3"] = values[4]
        values[3] = upvalues[6]
        values[12] = 540578
        values[4] = "Hub failed to load - press RETRY"
        values[5] = "bad"
        values[3](unpackValues(values, 4, 5))
        values[3] = upvalues[7]
        values[4] = "KINON HUB"
        values[5] = "Hub failed to load"
        values[6] = 5
        values[3](unpackValues(values, 4, 6))
        values[3] = environment.warn
        values[5] = "[KinonHub] "
        values[12] = 18890
        values[6] = environment.tostring
        values[7] = values[2]
        values[6] = values[6](unpackValues(values, 7, 7))
        local joined = values[6]
        for index = 5, 5, -1 do joined = values[index] .. joined end
        values[4] = joined
        values[3](unpackValues(values, 4, 4))
        closeCapturedValues(captureGroups, values, 0)
        return
      end
    else
      values[12] = 223802
      values[1] = false
      values[12] = 245512
      upvalues[0] = values[1]
      values[1] = upvalues[2]
      values[2] = "WRONG GAME"
      values[1]["Text"] = values[2]
      values[1] = upvalues[2]
      values[3] = environment.Color3
      values[2] = values[3]["fromRGB"]
      values[3] = 70
      values[4] = 26
      values[12] = 923849
      values[5] = 26
      values[2] = values[2](unpackValues(values, 3, 5))
      values[1]["BackgroundColor3"] = values[2]
      values[1] = upvalues[2]
      values[3] = environment.Color3
      values[2] = values[3]["fromRGB"]
      values[3] = 255
      values[4] = 170
      values[5] = 170
      values[12] = 33677
      values[2] = values[2](unpackValues(values, 3, 5))
      values[1]["TextColor3"] = values[2]
      values[1] = upvalues[6]
      values[2] = "Key saved. Open Violence District to load."
      values[3] = "bad"
      values[1](unpackValues(values, 2, 3))
      values[1] = upvalues[7]
      values[2] = "KINON HUB"
      values[3] = "Key saved. Hub loads in Violence District only."
      values[4] = 5
      values[12] = 868873
      values[1](unpackValues(values, 2, 4))
      values[2] = environment.task
      values[1] = values[2]["delay"]
      values[2] = 1.6
      do
        local cells = {}
        cells[0] = {upvalues, 2}
        cells[1] = {upvalues, 10}
        cells[2] = {upvalues, 4}
        cells[3] = {upvalues, 5}
        cells[4] = {upvalues, 11}
        local captured = setmetatable({}, captureMetatable)
        rawset(captured, false, cells)
        captureGroups[#captureGroups + 1] = cells
        values[3] = function(...) return functions["callback_74"](captured, ...) end
      end
      values[1](unpackValues(values, 2, 3))
      closeCapturedValues(captureGroups, values, 0)
      return
    end
  else
    values[12] = nil
    closeCapturedValues(captureGroups, values, 0)
    return
  end
end

functions["callback_74"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[0] = upvalues[0]
  values[1] = "UNLOCK"
  values[0]["Text"] = values[1]
  values[0] = upvalues[0]
  values[2] = environment.Color3
  values[1] = values[2]["fromRGB"]
  values[2] = 32
  values[3] = 32
  values[4] = 32
  values[8] = 309929
  values[1] = values[1](unpackValues(values, 2, 4))
  values[0]["BackgroundColor3"] = values[1]
  values[0] = upvalues[0]
  values[1] = upvalues[1]
  values[0]["TextColor3"] = values[1]
  values[2] = upvalues[2]
  values[2] = values[2]
  values[1] = values[2]["Create"]
  values[3] = upvalues[3]
  values[6] = environment.TweenInfo
  values[4] = values[6]["new"]
  values[5] = 0.2
  values[4] = values[4](unpackValues(values, 5, 5))
  values[5] = {}
  values[6] = upvalues[4]
  values[5]["Color"] = values[6]
  values[8] = 870419
  values[1] = values[1](unpackValues(values, 2, 5))
  values[1] = values[1]
  values[0] = values[1]["Play"]
  values[0](unpackValues(values, 1, 1))
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_75"] = function(upvalues, ...)
  runEmbeddedKinonHub()
  return
end

functions["callback_76"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[5] = nil
  values[0] = upvalues[0]
  if not values[0] then
    values[5] = 432649
    values[0] = upvalues[1]
    values[0] = values[0](unpackValues(values, 1, 0))
    if not values[0] then
      values[5] = 809846
      values[0] = upvalues[3]
      values[0] = values[0](unpackValues(values, 1, 0))
      if not (0 < values[0]) then
        values[5] = 107568
        values[0] = true
        upvalues[0] = values[0]
        values[0] = upvalues[4]
        values[1] = "LOADING..."
        values[0]["Text"] = values[1]
        values[1] = environment.task
        values[0] = values[1]["spawn"]
        do
          local cells = {}
          cells[0] = {upvalues, 5}
          cells[1] = {upvalues, 6}
          cells[2] = {upvalues, 7}
          cells[3] = {upvalues, 8}
          cells[4] = {upvalues, 9}
          cells[5] = {upvalues, 10}
          cells[6] = {upvalues, 2}
          cells[7] = {upvalues, 11}
          cells[8] = {upvalues, 12}
          cells[9] = {upvalues, 0}
          cells[10] = {upvalues, 13}
          local captured = setmetatable({}, captureMetatable)
          rawset(captured, false, cells)
          captureGroups[#captureGroups + 1] = cells
          values[1] = function(...) return functions["callback_77"](captured, ...) end
        end
        values[0](unpackValues(values, 1, 1))
        closeCapturedValues(captureGroups, values, 0)
        return
      else
        values[5] = 809846
        values[0] = upvalues[2]
        values[1] = "KINON HUB"
        values[2] = "Free key already claimed."
        values[3] = 4
        values[0](unpackValues(values, 1, 3))
        closeCapturedValues(captureGroups, values, 0)
        return
      end
    else
      values[5] = 432649
      values[0] = upvalues[2]
      values[1] = "KINON HUB"
      values[2] = "You already have an active key."
      values[3] = 4
      values[0](unpackValues(values, 1, 3))
      closeCapturedValues(captureGroups, values, 0)
      return
    end
  else
    values[5] = nil
    closeCapturedValues(captureGroups, values, 0)
    return
  end
end

functions["callback_77"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[8] = nil
  values[0] = upvalues[0]
  values[0] = values[0](unpackValues(values, 1, 0))
  values[1] = values[0]
  if not values[1] then
    values[8] = 377566
    values[1] = upvalues[5]
    values[2] = "Failed to load key list"
    values[3] = "bad"
    values[1](unpackValues(values, 2, 3))
    values[1] = upvalues[6]
    values[2] = "KINON HUB"
    values[3] = "Failed to load key list"
    values[4] = 4
    values[8] = 741822
    values[1](unpackValues(values, 2, 4))
    values[1] = false
    upvalues[9] = values[1]
    values[1] = upvalues[7]
    values[1](unpackValues(values, 2, 1))
  else
    values[8] = nil
    values[2] = upvalues[1]
    values[1] = #values[2]
    if not (0 < values[1]) then
      values[8] = 377566
      values[1] = upvalues[5]
      values[2] = "Failed to load key list"
      values[3] = "bad"
      values[1](unpackValues(values, 2, 3))
      values[1] = upvalues[6]
      values[2] = "KINON HUB"
      values[3] = "Failed to load key list"
      values[4] = 4
      values[8] = 741822
      values[1](unpackValues(values, 2, 4))
      values[1] = false
      upvalues[9] = values[1]
      values[1] = upvalues[7]
      values[1](unpackValues(values, 2, 1))
    else
      values[8] = nil
      values[2] = upvalues[1]
      values[4] = environment.math
      values[3] = values[4]["random"]
      values[4] = 1
      values[6] = upvalues[1]
      values[5] = #values[6]
      values[3] = values[3](unpackValues(values, 4, 5))
      values[1] = values[2][values[3]]
      values[8] = 679478
      values[2] = upvalues[2]
      values[3] = values[1]
      values[2]["Text"] = values[3]
      values[2] = environment.pcall
      values[3] = upvalues[3]
      values[2](unpackValues(values, 3, 3))
      values[2] = environment.pcall
      values[3] = upvalues[4]
      values[4] = values[1]
      values[2](unpackValues(values, 3, 4))
      values[2] = environment.type
      values[3] = environment.setclipboard
      values[2] = values[2](unpackValues(values, 3, 3))
      if not (values[2] == "function") then
      else
        values[8] = 395715
        values[2] = environment.pcall
        values[3] = environment.setclipboard
        values[4] = values[1]
        values[2](unpackValues(values, 3, 4))
      end
      values[8] = 741650
      values[2] = upvalues[5]
      values[3] = "Free key claimed - applying"
      values[4] = "good"
      values[2](unpackValues(values, 3, 4))
      values[2] = upvalues[6]
      values[3] = "KINON HUB"
      values[4] = "Free key claimed for 24 hours"
      values[5] = 4
      values[8] = 765376
      values[2](unpackValues(values, 3, 5))
      values[2] = upvalues[7]
      values[2](unpackValues(values, 3, 2))
      values[2] = upvalues[8]
      values[2](unpackValues(values, 3, 2))
      values[2] = false
      upvalues[9] = values[2]
      values[2] = upvalues[10]
      values[3] = values[1]
      values[2](unpackValues(values, 3, 3))
    end
  end
  values[8] = 355871
  closeCapturedValues(captureGroups, values, 0)
  return
end

functions["callback_78"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[4] = nil
  values[0] = upvalues[0]
  if not values[0] then
    values[4] = 568762
    values[0] = true
    upvalues[0] = values[0]
    values[0] = upvalues[1]
    values[1] = "CHECKING..."
    values[0]["Text"] = values[1]
    values[0] = upvalues[2]
    values[1] = "Verifying..."
    values[2] = "good"
    values[0](unpackValues(values, 1, 2))
    values[1] = environment.task
    values[0] = values[1]["spawn"]
    do
      local cells = {}
      cells[0] = {upvalues, 3}
      cells[1] = {upvalues, 4}
      cells[2] = {upvalues, 5}
      cells[3] = {upvalues, 6}
      cells[4] = {upvalues, 0}
      cells[5] = {upvalues, 7}
      cells[6] = {upvalues, 8}
      cells[7] = {upvalues, 9}
      cells[8] = {upvalues, 10}
      cells[9] = {upvalues, 2}
      cells[10] = {upvalues, 11}
      cells[11] = {upvalues, 1}
      local captured = setmetatable({}, captureMetatable)
      rawset(captured, false, cells)
      captureGroups[#captureGroups + 1] = cells
      values[1] = function(...) return functions["callback_79"](captured, ...) end
    end
    values[0](unpackValues(values, 1, 1))
    closeCapturedValues(captureGroups, values, 0)
    return
  else
    values[4] = nil
    closeCapturedValues(captureGroups, values, 0)
    return
  end
end

functions["callback_79"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[9] = nil
  values[0] = upvalues[0]
  values[0] = values[0](unpackValues(values, 1, 0))
  values[1] = values[0]
  if not values[1] then
    values[9] = 456425
    values[2] = upvalues[6]
    values[1] = #values[2]
    if not (values[1] == 0) then
    else
      values[9] = 456425
      values[1] = upvalues[7]
      values[1](unpackValues(values, 2, 1))
    end
    values[9] = 462
    values[1] = upvalues[1]
    values[3] = upvalues[2]
    values[2] = values[3]["Text"]
    values[1] = values[1](unpackValues(values, 2, 2))
    values[2] = false
    values[3] = environment.ipairs
    values[4] = upvalues[6]
    values[3], values[4], values[5] = values[3](unpackValues(values, 4, 4))
    if type(values[3]) ~= "function" then
      local source = values[3]
      if type(source) == "table" and getmetatable(source) == nil then
        values[3], values[4], values[5] = next, source, nil
      else
        values[3] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
        values[4], values[5] = nil, nil
      end
    end
    do
      local leaveLoop29 = 0
      while true do
        values[9] = 970509
        local results = packValues(values[3](values[4], values[5]))
        for index = 1, 2 do values[5 + index] = results[index] end
        if values[6] ~= nil then
          values[5] = values[6]
          values[9] = 678359
          if (values[1] == "") then
            continue
          else
            values[9] = 678359
            if not (values[1] == values[7]) then
              continue
            else
              leaveLoop29 = 35
              break
            end
          end
        end
        leaveLoop29 = 32
        break
      end
      if leaveLoop29 == 32 then
      elseif leaveLoop29 == 35 then
        values[9] = 678359
        values[2] = true
      end
    end
    values[9] = 406617
    values[3] = values[2]
    if not values[3] then
      values[9] = 1028870
      values[4] = upvalues[6]
      values[3] = #values[4]
      if not (values[3] == 0) then
        values[9] = 279797
        values[3] = upvalues[9]
        values[4] = "Invalid key"
        values[5] = "bad"
        values[3](unpackValues(values, 4, 5))
        values[3] = upvalues[10]
        values[4] = "KINON HUB"
        values[5] = "Key does not match"
        values[6] = 4
        values[3](unpackValues(values, 4, 6))
      else
        values[9] = 1028870
        values[3] = upvalues[9]
        values[4] = "Key list empty - press GET FREE KEY"
        values[5] = "bad"
        values[3](unpackValues(values, 4, 5))
        values[3] = upvalues[10]
        values[4] = "KINON HUB"
        values[5] = "Key list not loaded"
        values[6] = 4
        values[9] = 849133
        values[3](unpackValues(values, 4, 6))
      end
      values[9] = 897972
      values[3] = upvalues[11]
      values[4] = "UNLOCK"
      values[3]["Text"] = values[4]
      values[3] = false
      upvalues[4] = values[3]
      closeCapturedValues(captureGroups, values, 0)
      return
    else
      values[9] = 406617
      values[3] = environment.pcall
      values[4] = upvalues[8]
      values[5] = values[1]
      values[3](unpackValues(values, 4, 5))
      values[3] = false
      upvalues[4] = values[3]
      values[3] = upvalues[5]
      values[4] = values[1]
      values[3](unpackValues(values, 4, 4))
      closeCapturedValues(captureGroups, values, 0)
      return
    end
  else
    values[9] = nil
    values[1] = upvalues[1]
    values[3] = upvalues[2]
    values[2] = values[3]["Text"]
    values[1] = values[1](unpackValues(values, 2, 2))
    if not (values[1] == values[0]) then
      values[9] = 456425
      values[2] = upvalues[6]
      values[1] = #values[2]
      if not (values[1] == 0) then
      else
        values[9] = 456425
        values[1] = upvalues[7]
        values[1](unpackValues(values, 2, 1))
      end
      values[9] = 462
      values[1] = upvalues[1]
      values[3] = upvalues[2]
      values[2] = values[3]["Text"]
      values[1] = values[1](unpackValues(values, 2, 2))
      values[2] = false
      values[3] = environment.ipairs
      values[4] = upvalues[6]
      values[3], values[4], values[5] = values[3](unpackValues(values, 4, 4))
      if type(values[3]) ~= "function" then
        local source = values[3]
        if type(source) == "table" and getmetatable(source) == nil then
          values[3], values[4], values[5] = next, source, nil
        else
          values[3] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
          values[4], values[5] = nil, nil
        end
      end
      do
        local leaveLoop29 = 0
        while true do
          values[9] = 970509
          local results = packValues(values[3](values[4], values[5]))
          for index = 1, 2 do values[5 + index] = results[index] end
          if values[6] ~= nil then
            values[5] = values[6]
            values[9] = 678359
            if (values[1] == "") then
              continue
            else
              values[9] = 678359
              if not (values[1] == values[7]) then
                continue
              else
                leaveLoop29 = 35
                break
              end
            end
          end
          leaveLoop29 = 32
          break
        end
        if leaveLoop29 == 32 then
        elseif leaveLoop29 == 35 then
          values[9] = 678359
          values[2] = true
        end
      end
      values[9] = 406617
      values[3] = values[2]
      if not values[3] then
        values[9] = 1028870
        values[4] = upvalues[6]
        values[3] = #values[4]
        if not (values[3] == 0) then
          values[9] = 279797
          values[3] = upvalues[9]
          values[4] = "Invalid key"
          values[5] = "bad"
          values[3](unpackValues(values, 4, 5))
          values[3] = upvalues[10]
          values[4] = "KINON HUB"
          values[5] = "Key does not match"
          values[6] = 4
          values[3](unpackValues(values, 4, 6))
        else
          values[9] = 1028870
          values[3] = upvalues[9]
          values[4] = "Key list empty - press GET FREE KEY"
          values[5] = "bad"
          values[3](unpackValues(values, 4, 5))
          values[3] = upvalues[10]
          values[4] = "KINON HUB"
          values[5] = "Key list not loaded"
          values[6] = 4
          values[9] = 849133
          values[3](unpackValues(values, 4, 6))
        end
        values[9] = 897972
        values[3] = upvalues[11]
        values[4] = "UNLOCK"
        values[3]["Text"] = values[4]
        values[3] = false
        upvalues[4] = values[3]
        closeCapturedValues(captureGroups, values, 0)
        return
      else
        values[9] = 406617
        values[3] = environment.pcall
        values[4] = upvalues[8]
        values[5] = values[1]
        values[3](unpackValues(values, 4, 5))
        values[3] = false
        upvalues[4] = values[3]
        values[3] = upvalues[5]
        values[4] = values[1]
        values[3](unpackValues(values, 4, 4))
        closeCapturedValues(captureGroups, values, 0)
        return
      end
    else
      values[9] = nil
      values[1] = upvalues[3]
      values[9] = 184479
      values[1] = values[1](unpackValues(values, 2, 1))
      if not (0 < values[1]) then
        values[9] = 456425
        values[2] = upvalues[6]
        values[1] = #values[2]
        if not (values[1] == 0) then
        else
          values[9] = 456425
          values[1] = upvalues[7]
          values[1](unpackValues(values, 2, 1))
        end
        values[9] = 462
        values[1] = upvalues[1]
        values[3] = upvalues[2]
        values[2] = values[3]["Text"]
        values[1] = values[1](unpackValues(values, 2, 2))
        values[2] = false
        values[3] = environment.ipairs
        values[4] = upvalues[6]
        values[3], values[4], values[5] = values[3](unpackValues(values, 4, 4))
        if type(values[3]) ~= "function" then
          local source = values[3]
          if type(source) == "table" and getmetatable(source) == nil then
            values[3], values[4], values[5] = next, source, nil
          else
            values[3] = coroutine.wrap(function() for key, value in source do coroutine.yield(key, value) end end)
            values[4], values[5] = nil, nil
          end
        end
        do
          local leaveLoop29 = 0
          while true do
            values[9] = 970509
            local results = packValues(values[3](values[4], values[5]))
            for index = 1, 2 do values[5 + index] = results[index] end
            if values[6] ~= nil then
              values[5] = values[6]
              values[9] = 678359
              if (values[1] == "") then
                continue
              else
                values[9] = 678359
                if not (values[1] == values[7]) then
                  continue
                else
                  leaveLoop29 = 35
                  break
                end
              end
            end
            leaveLoop29 = 32
            break
          end
          if leaveLoop29 == 32 then
          elseif leaveLoop29 == 35 then
            values[9] = 678359
            values[2] = true
          end
        end
        values[9] = 406617
        values[3] = values[2]
        if not values[3] then
          values[9] = 1028870
          values[4] = upvalues[6]
          values[3] = #values[4]
          if not (values[3] == 0) then
            values[9] = 279797
            values[3] = upvalues[9]
            values[4] = "Invalid key"
            values[5] = "bad"
            values[3](unpackValues(values, 4, 5))
            values[3] = upvalues[10]
            values[4] = "KINON HUB"
            values[5] = "Key does not match"
            values[6] = 4
            values[3](unpackValues(values, 4, 6))
          else
            values[9] = 1028870
            values[3] = upvalues[9]
            values[4] = "Key list empty - press GET FREE KEY"
            values[5] = "bad"
            values[3](unpackValues(values, 4, 5))
            values[3] = upvalues[10]
            values[4] = "KINON HUB"
            values[5] = "Key list not loaded"
            values[6] = 4
            values[9] = 849133
            values[3](unpackValues(values, 4, 6))
          end
          values[9] = 897972
          values[3] = upvalues[11]
          values[4] = "UNLOCK"
          values[3]["Text"] = values[4]
          values[3] = false
          upvalues[4] = values[3]
          closeCapturedValues(captureGroups, values, 0)
          return
        else
          values[9] = 406617
          values[3] = environment.pcall
          values[4] = upvalues[8]
          values[5] = values[1]
          values[3](unpackValues(values, 4, 5))
          values[3] = false
          upvalues[4] = values[3]
          values[3] = upvalues[5]
          values[4] = values[1]
          values[3](unpackValues(values, 4, 4))
          closeCapturedValues(captureGroups, values, 0)
          return
        end
      else
        values[9] = 184479
        values[2] = false
        upvalues[4] = values[2]
        values[2] = upvalues[5]
        values[3] = values[0]
        values[2](unpackValues(values, 3, 3))
        closeCapturedValues(captureGroups, values, 0)
        return
      end
    end
  end
end

functions["callback_80"] = function(upvalues, ...)
  local passed = packValues(...)
  local values = {}
  for index = 0, -1 do values[index] = passed[index + 1] end
  local registerTop = -1
  local captureGroups = {}
  values[0] = upvalues[0]
  values[0](unpackValues(values, 1, 0))
  values[0] = upvalues[1]
  values[0](unpackValues(values, 1, 0))
  closeCapturedValues(captureGroups, values, 0)
  return
end
return functions["initializeKinonKeySystem"]({}, ...)
