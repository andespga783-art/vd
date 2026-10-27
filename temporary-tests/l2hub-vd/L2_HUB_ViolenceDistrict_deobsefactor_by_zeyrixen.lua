-- deobsefactor by zeyrixen
do
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local player = Players.LocalPlayer
    if not player then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        player = Players.LocalPlayer
    end
    local now = os.time()
    local sessionKey = table.concat({
        tostring(game.PlaceId),
        tostring(game.JobId or ""),
        tostring(now),
        tostring(math.random(1, 2^30)),
        tostring(player.UserId or 0)
    }, "|")
    local hash = 0
    local signed = sessionKey .. "L2HUB_v1_SECRET_CHANGE_ME"
    for i = 1, #signed do
        hash = (hash * 31 + signed:byte(i)) % 2^31
    end
    getgenv().L2HUB_SESSION = {
        Key = sessionKey,
        Signature = HttpService:GenerateGUID(false),
        Fingerprint = tostring(hash),
        PlaceId = game.PlaceId,
        JobId = game.JobId,
        UserId = player.UserId,
        Time = now,
        Version = 1
    }
end
local _SECRET_SALT = "L2HUB_v1_SECRET_CHANGE_ME"
local function _HMAC(str, salt)
local out = 0
for i = 1, #str do
out = (out * 31 + str:byte(i)) % 2^31
end
return tostring(out)
end
local _S = getgenv().L2HUB_SESSION
if type(_S) ~= "table"
or _S.Version ~= 1
or _S.UserId ~= game:GetService("Players").LocalPlayer.UserId
or (os.time() - (_S.Time or 0)) > 600
or type(_S.Signature) ~= "string"
or #_S.Signature < 30
then
warn("[L2-HUB] Unauthorized execution blocked.")
return
end
if _S.Fingerprint ~= _HMAC((_S.Key or "") .. _SECRET_SALT, _SECRET_SALT) then
warn("[L2-HUB] Fingerprint mismatch.")
return
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui") or Players.LocalPlayer:WaitForChild("PlayerGui")
local vim = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local repStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local L2Hub = (function()
-- [L2Hub] | [Modified By L2Hub] | [Version : 0.1] 
do
	local Constant = 'L'..'P'..'H'..'_NO_VIRTUALIZE';
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end;
end;

cloneref = cloneref or function(i) return i end;
gethui = gethui or get_hidden_gui;
getcustomasset = getcustomasset or getsynasset;
getgenv = getgenv or getfenv;

local LOAD_ENV = LPH_NO_VIRTUALIZE(function()
	if game:GetService('RunService'):IsStudio() then
		local BaseWorkspace = game:GetService("ReplicatedFirst"):FindFirstChild('PRI_WORKSPACE') or Instance.new('Folder',game:GetService("ReplicatedFirst"));

		BaseWorkspace.Name = 'PRI\0.'..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)))..tostring(string.char(math.random(50,120)));

		local __get_path_c = function(path)
			return (string.find(path,'/',1,true) and string.split(path,'/')) or (string.find(path,'\\',1,true) and string.split(path,'\\')) or {path};
		end;

		local __get_path = function(path)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				block = block[v];
			end;

			return block;
		end;

		getgenv().readfile = function(path)
			local path : StringValue = __get_path(path);

			return path.Value;
		end;

		getgenv().isfile = function(path)
			local success , message = pcall(function()
				return __get_path(path);
			end);

			if success and not message:IsA("Folder") then
				return true;
			end;

			return false;
		end;

		getgenv().isfolder = function(path)
			local success , message = pcall(function()
				return __get_path(path);
			end);

			if success and message:IsA("Folder") then
				return true;
			end;

			return false;
		end;

		getgenv().writefile = function(path,content)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				local item = block:FindFirstChild(v);
				if not item then
					local c = Instance.new('StringValue',block);

					c.Name = tostring(v);
					c.Value = content;
				else
					if item:IsA('StringValue') and tostring(item) == v then
						item.Name = tostring(v);
						item.Value = content;
					end;

					block = item;
				end;
			end;
		end;

		getgenv().listfiles = function(path)
			local fold = __get_path(path);
			local pa = {};

			for i,v in next , fold:GetChildren() do
				if v:IsA('StringValue') then
					table.insert(pa,path..'/'..tostring(v));
				end;
			end;

			return pa;
		end;

		getgenv().makefolder = function(path)
			local main = __get_path_c(path);

			local block = BaseWorkspace;

			for i,v in next , main do
				local item = block:FindFirstChild(v);
				if not item then
					local c = Instance.new('Folder',block);

					c.Name = tostring(v);
				else
					block = item;
				end;
			end;
		end;

	    getgenv().delfile = function(path)
			local main = __get_path_c(path);
			local block = BaseWorkspace;
			for i,v in next , main do
				local item = block:FindFirstChild(v);
				if item and item:IsA('StringValue') then
					item:Destroy();
				else
					block = item;
				end;
			end;
		end;

		getgenv().delfolder = function(path)
			local main = __get_path_c(path);
			local block = BaseWorkspace;

			for i = 1, #main do
				local item = block:FindFirstChild(main[i]);

				if not item then
					return;
				end;

				if i == #main then
					if item:IsA('Folder') then
						item:Destroy();
					end;
				else
					block = item;
				end;
			end;
		end;
	end;
end)

LOAD_ENV();

writefile = writefile or getgenv().writefile;
makefolder = makefolder or getgenv().makefolder;
readfile = readfile or getgenv().readfile;
delfolder = delfolder or getgenv().delfolder;
delfile = delfile or getgenv().delfile;
listfiles = listfiles or getgenv().listfiles;
isfolder = isfolder or getgenv().isfolder;
isfile = isfile or getgenv().isfile;

local L2Hub = {};

L2Hub.BuiltInRegular = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Regular,Enum.FontStyle.Normal);
L2Hub.BuiltInBold = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Bold,Enum.FontStyle.Normal);
L2Hub.GlobalSignals = {};
L2Hub.UnloadEnabled = false;

local cloneref: cloneref = cloneref or function(f) return f end;
local TweenService: TweenService = cloneref(game:GetService('TweenService'));
local UserInputService: UserInputService = cloneref(game:GetService('UserInputService'));
local TextService: TextService = cloneref(game:GetService('TextService'));
local RunService: RunService = cloneref(game:GetService('RunService'));
local Players: Players = cloneref(game:GetService('Players'));
local HttpService: HttpService = cloneref(game:GetService('HttpService'));
local LocalPlayer: Player = Players.LocalPlayer;
local CoreGui: PlayerGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneref(game:FindFirstChild('CoreGui')) or cloneref(LocalPlayer.PlayerGui);
local Mouse: Mouse = LocalPlayer:GetMouse();
local CurrentCamera: Camera = cloneref(workspace.CurrentCamera);
local ProtectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function(s) return s; end;
local GlobalWindow = Instance.new('ScreenGui');
local ManualTween = TweenInfo.new(0.1);
local SlowyTween = TweenInfo.new(0.175);
local FastTween = TweenInfo.new(0.05);
local VSlowTween = TweenInfo.new(0.2,Enum.EasingStyle.Quint);
local Encryption = {};

L2Hub.UserProfile = Players:GetUserThumbnailAsync(LocalPlayer.UserId , Enum.ThumbnailType.HeadShot , Enum.ThumbnailSize.Size150x150)
L2Hub.RandomString = LPH_NO_VIRTUALIZE(function()
	return string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4));
end);

ProtectGui(GlobalWindow);

GlobalWindow.Name = L2Hub.RandomString();
GlobalWindow.IgnoreGuiInset = true;
GlobalWindow.ZIndexBehavior = Enum.ZIndexBehavior.Global;
GlobalWindow.ResetOnSpawn = false;
GlobalWindow.Parent = CoreGui;

L2Hub.Scales = {
	Small = UDim2.fromOffset(540,380),
	Compact = UDim2.fromOffset(600,380),
	Mobile = UDim2.fromOffset(640,385),
	Default = UDim2.fromOffset(640 , 480),
	Large = UDim2.fromOffset(800 , 600)
};

L2Hub.IconColor = Color3.fromRGB(255, 255, 255);
L2Hub.ScreenGui = GlobalWindow;
L2Hub.Flags = {};
L2Hub.PendingFlagValues = {};
L2Hub.AccentColor = Color3.fromRGB(0, 255, 100);
L2Hub.MainColor = Color3.fromRGB(12, 12, 12);
L2Hub.RegisiteryColor = {};
L2Hub.NameRegisitry = {};
L2Hub.SectionOwners = {};
L2Hub.IsMosueOverOtherFrame = false;
L2Hub.TextGradientEnabled = true;
L2Hub.TextGradientAnimationTime = 0;
L2Hub.TextGradientAccumulator = 0;
L2Hub.TextGradientLabels = {};
L2Hub.TextGradientObjects = {};
L2Hub.GlobalLogo = "rbxassetid://105349270202991";
L2Hub.ImageColorMapping = "rbxassetid://4155801252";
L2Hub.IconBase = "https://raw.githubusercontent.com/nhfudzfsrzggt/brigida/refs/heads/main/";
L2Hub.Icons = {};
L2Hub.IconScale = 0.82;
L2Hub.Font = nil;
L2Hub.FontFace = nil;
L2Hub.IconAliases = {
	["lucide:table-of-contents"] = "list-bulleted",
	["lucide:toggle-right"] = "two-switches-horizontal",
	["lucide:mouse"] = "mouse-button-left",
	["lucide:chevrons-left-right-ellipsis"] = "dual-arrows-horizontal",
	["lucide:list-collapse"] = "list-bulleted",
	["lucide:palette"] = "paint-brush",
	["lucide:sliders-horizontal"] = "three-sliders-horizontal",
	["lucide:keyboard"] = "key",
	["lucide:layout-grid"] = "grid",
	["lucide:bell"] = "bell",
	["lucide:message-circle"] = "speech-bubble-round",
	["lucide:circle-info"] = "circle-i",
	["lucide:check"] = "check",
	["lucide:circle-alert"] = "triangle-exclamation",
	["lucide:house"] = "house",
};
L2Hub.IconLibraryLoaded = false;
L2Hub.IconLibraryLoading = false;
L2Hub.IconSystem = nil;

function L2Hub:NormalizeIconId(iconId)
	if not iconId or iconId == "" then
		return "";
	end;

	iconId = tostring(iconId);

	if string.match(iconId, "^%d+$") then
		return "rbxassetid://" .. iconId;
	end;

	if string.find(iconId, "rbxassetid://", 1, true)
	or string.find(iconId, "rbxasset://", 1, true)
	or string.match(iconId, "^https?://") then
		return iconId;
	end;

	return iconId;
end;

-- ── Icon System ──────────────────────────────────────────────────
-- Supports:
--   "123456"          -> rbxassetid://123456
--   "lucide:search"   -> icon id from external lucide library
--   "solar:user"      -> icon id from external solar library
--   "https://..."     -> direct image URL
function L2Hub:LoadIconLibrary()
    if L2Hub.IconLibraryLoaded then
        return L2Hub.Icons;
    end;

    if L2Hub.IconLibraryLoading then
        local timeout = 0
        repeat 
            task.wait(0.1)
            timeout = timeout + 0.1
        until not L2Hub.IconLibraryLoading or timeout > 3
        return L2Hub.Icons;
    end;

    L2Hub.IconLibraryLoading = true;

    local function Load(path)
        local success, result = pcall(function()
            return loadstring(game:HttpGet(L2Hub.IconBase .. path))();
        end);

        if success and typeof(result) == "table" then
            return result;
        end;

        return {};
    end;

    pcall(function()
        local defaultIcons = Load("src/elements/icon/basic.lua");
        local lucideIcons = Load("src/elements/icon/lucide.lua");
        local solarIcons = Load("src/elements/icon/solar.lua");

        for name, id in pairs(defaultIcons) do
            L2Hub.Icons[name] = L2Hub:NormalizeIconId(id);
        end;

        for name, id in pairs(lucideIcons) do
            L2Hub.Icons["lucide:" .. name] = L2Hub:NormalizeIconId(id);
        end;

        for name, id in pairs(solarIcons) do
            L2Hub.Icons["solar:" .. name] = L2Hub:NormalizeIconId(id);
        end;
    end)

    L2Hub.IconLibraryLoaded = true;
    L2Hub.IconLibraryLoading = false;
    L2Hub.IconSystem = {
        Icons = L2Hub.Icons,
        getIconId = function(iconName)
            return L2Hub:GetIconId(iconName);
        end,
    };

    return L2Hub.Icons;
end;

function L2Hub:GetIconId(iconName)
	if not iconName or iconName == "" then
		return "";
	end;

	iconName = tostring(iconName);

	local DirectIcon = L2Hub:NormalizeIconId(iconName);
	if DirectIcon ~= iconName
	or string.find(DirectIcon, "rbxassetid://", 1, true)
	or string.find(DirectIcon, "rbxasset://", 1, true)
	or string.match(DirectIcon, "^https?://") then
		return DirectIcon;
	end;

	if not L2Hub.IconLibraryLoaded then
		L2Hub:LoadIconLibrary();
	end;

	if L2Hub.Icons[iconName] then
		return L2Hub:NormalizeIconId(L2Hub.Icons[iconName]);
	end;

	return "";
end;

function L2Hub:IsWebmIcon(iconName)
	if not iconName or iconName == "" then
		return false;
	end;

	iconName = string.lower(tostring(iconName));

	return string.sub(iconName, 1, 5) == "webm:"
		or string.match(iconName, "%.webm$") ~= nil
		or string.match(iconName, "%.webm%?") ~= nil
		or string.match(iconName, "%.webm#") ~= nil;
end;

function L2Hub:NormalizeVideoIcon(iconName)
	iconName = tostring(iconName or "");

	if string.sub(string.lower(iconName), 1, 5) == "webm:" then
		iconName = string.sub(iconName, 6);
	end;

	return L2Hub:NormalizeIconId(iconName);
end;

function L2Hub:ClearIconVideo(IconObject)
	local VideoIcon = IconObject and IconObject:FindFirstChild("ModernIconVideo");

	if VideoIcon then
		pcall(function()
			VideoIcon:Pause();
		end);

		VideoIcon.Visible = false;
		VideoIcon.Video = "";
	end;
end;

function L2Hub:ApplyIconVideo(IconObject, IconSource)
	if not IconObject then
		return nil;
	end;

	local VideoIcon = IconObject:FindFirstChild("ModernIconVideo");

	if not VideoIcon then
		VideoIcon = Instance.new("VideoFrame");
		VideoIcon.Name = "ModernIconVideo";
		VideoIcon.Parent = IconObject;
		VideoIcon.AnchorPoint = Vector2.new(0.5, 0.5);
		VideoIcon.BackgroundTransparency = 1;
		VideoIcon.BorderSizePixel = 0;
		VideoIcon.Position = UDim2.fromScale(0.5, 0.5);
		VideoIcon.Size = UDim2.fromScale(1, 1);
		VideoIcon.ZIndex = IconObject.ZIndex + 1;
        pcall(function()
	    VideoIcon.Volume = L2Hub.IconVideoVolume or 0;
        end);
        VideoIcon.Visible = true;

		L2Hub:AddSignal(VideoIcon.Ended:Connect(function()
			VideoIcon.TimePosition = 0;
			VideoIcon:Play();
		end));
	end;

	if not IconObject:GetAttribute("ModernIconVideoBound") then
		IconObject:SetAttribute("ModernIconVideoBound", true);

		L2Hub:AddSignal(IconObject:GetPropertyChangedSignal("ZIndex"):Connect(function()
			local ChildVideo = IconObject:FindFirstChild("ModernIconVideo");
			if ChildVideo then
				ChildVideo.ZIndex = IconObject.ZIndex + 1;
			end;
		end));

		if IconObject:IsA("ImageLabel") or IconObject:IsA("ImageButton") then
			L2Hub:AddSignal(IconObject:GetPropertyChangedSignal("ImageTransparency"):Connect(function()
				local ChildVideo = IconObject:FindFirstChild("ModernIconVideo");
				if ChildVideo then
					ChildVideo.Visible = IconObject.ImageTransparency < 0.99;
				end;
			end));
		end;
	end;

	VideoIcon.Video = L2Hub:NormalizeVideoIcon(IconSource);
	pcall(function()
	    VideoIcon.Volume = L2Hub.IconVideoVolume or 0;
    end);
	VideoIcon.Visible = true;
	VideoIcon:SetAttribute("_isWebm", true);

	pcall(function()
		VideoIcon:Play();
	end);

	return VideoIcon;
end;

L2Hub.IconSystem = {
	Icons = L2Hub.Icons,
	getIconId = function(iconName)
		return L2Hub:GetIconId(iconName);
	end,
};

task.spawn(function()
	pcall(function()
		L2Hub:LoadIconLibrary();
	end);
end);

-- ┌─────────────────────────────────────────────────────────────────┐
-- │                   THEME SYSTEM (AddTheme)                       │
-- └─────────────────────────────────────────────────────────────────┘

L2Hub.Themes = {};
L2Hub.ThemeCallbacks = {};   -- list of callbacks to update live UI

-- Register a theme update listener (internal use)
function L2Hub:OnThemeChanged(fn)
	table.insert(L2Hub.ThemeCallbacks, fn);
end;

-- Apply all registered theme callbacks
local function _ApplyTheme(theme)
	L2Hub.AccentColor  = theme.Accent      or L2Hub.AccentColor;
	L2Hub.MainColor    = theme.Background  or L2Hub.MainColor;
	L2Hub.IconColor    = theme.Icon        or L2Hub.IconColor;

	-- fire every live-update listener
	for _, fn in next, L2Hub.ThemeCallbacks do
		pcall(fn, theme);
	end;

	if L2Hub.SetTextGradientEnabled then
		L2Hub:SetTextGradientEnabled(L2Hub.TextGradientEnabled);
	end;
end;

--[[
	L2Hub:AddTheme({
		Name        = "Lumi Sakura",
		Accent      = Color3.fromRGB(255,120,180),
		Background  = Color3.fromRGB(35,20,30),
		Surface     = Color3.fromRGB(60,30,50),
		Outline     = Color3.fromRGB(255,160,200),
		Text        = Color3.fromRGB(255,220,235),
		Placeholder = Color3.fromRGB(200,140,170),
		Button      = Color3.fromRGB(255,140,190),
		Icon        = Color3.fromRGB(255,180,210),
	})
]]
function L2Hub:AddTheme(Config)
	Config = Config or {};
	Config.Name = Config.Name or "Custom Theme";

	-- defaults fall back to current values
	local theme = {
		Name        = Config.Name,
		Accent      = Config.Accent      or L2Hub.AccentColor,
		Background  = Config.Background  or L2Hub.MainColor,
		Surface     = Config.Surface     or Color3.fromRGB(20,22,27),
		Outline     = Config.Outline     or Color3.fromRGB(45,48,58),
		Text        = Config.Text        or Color3.fromRGB(255,255,255),
		Placeholder = Config.Placeholder or Color3.fromRGB(140,140,155),
		Button      = Config.Button      or L2Hub.AccentColor,
		Icon        = Config.Icon        or L2Hub.IconColor,
	};

	table.insert(L2Hub.Themes, theme);
	_ApplyTheme(theme);

	return theme;
end;

-- ┌─────────────────────────────────────────────────────────────────┐
-- │               MENU ICON (CreateMenuIcon)                        │
-- │  • Always center-left of screen                                 │
-- │  • Round-square shape with UICorner                             │
-- │  • Auto-scales with UI scale                                    │
-- │  • Supports rbxassetid, Lucide-style icon name, or image URL    │
-- │  • Cool show/hide animations                                    │
-- │  • Color / BG / Stroke all customisable                         │
-- │  • Cannot be dragged off screen (optional drag entirely)        │
-- └─────────────────────────────────────────────────────────────────┘

function L2Hub:CreateMenuIcon(Config)
	Config = Config or {};

	-- ── Defaults ──────────────────────────────────────────────────
	local iconSize       = Config.Size         or 48;
	local iconImage      = Config.Image        or "";          -- rbxassetid:// OR lucide name OR URL
	local iconScale      = tonumber(Config.IconScale or Config.Scale) or 1;
	local iconColor      = Config.IconColor    or Color3.fromRGB(255,255,255);
	local bgColor        = Config.BGColor      or Color3.fromRGB(20,22,27);
	local strokeColor    = Config.StrokeColor  or L2Hub.AccentColor;
	local strokeThick    = Config.StrokeThick  or 1.5;
	local draggable      = (Config.Draggable ~= false);       -- default true, but clamped
	local cornerRadius   = UDim.new(0, math.floor(iconSize * 0.28)); -- ~28 % → round-square

	-- ── Container ─────────────────────────────────────────────────
	local IconRoot = Instance.new("Frame");
	IconRoot.Name             = L2Hub.RandomString();
	IconRoot.Parent           = L2Hub.ScreenGui;
	-- center-left: X = 15px from left, Y = 50 % of screen
	IconRoot.AnchorPoint      = Vector2.new(0, 0.5);
	IconRoot.BackgroundColor3 = bgColor;
	IconRoot.BackgroundTransparency = 1;   -- start invisible
	IconRoot.BorderSizePixel  = 0;
	IconRoot.Size             = UDim2.fromOffset(iconSize, iconSize);
	IconRoot.Position         = UDim2.new(0, 15, 0.5, 0);
	IconRoot.ZIndex           = 20;
	IconRoot.ClipsDescendants = false;

	local UICornerIcon = Instance.new("UICorner");
	UICornerIcon.CornerRadius = cornerRadius;
	UICornerIcon.Parent       = IconRoot;

	-- Stroke
	local UIStrokeIcon = Instance.new("UIStroke");
	UIStrokeIcon.Color       = strokeColor;
	UIStrokeIcon.Thickness   = strokeThick;
	UIStrokeIcon.Transparency = 1;
	UIStrokeIcon.Parent      = IconRoot;

	-- ── Icon display (TextLabel for built-in / ImageLabel for image) ──
	-- We keep both and show the relevant one.
	local IconLabel = Instance.new("TextLabel");
	IconLabel.Name                = L2Hub.RandomString();
	IconLabel.Parent              = IconRoot;
	IconLabel.AnchorPoint         = Vector2.new(0.5, 0.5);
	IconLabel.BackgroundTransparency = 1;
	IconLabel.BorderSizePixel     = 0;
	IconLabel.Position            = UDim2.fromScale(0.5, 0.5);
	IconLabel.Size                = UDim2.fromScale(0.65, 0.65);
	IconLabel.ZIndex              = 21;
	IconLabel.FontFace            = L2Hub.BuiltInBold;
	IconLabel.Text                = "";
	IconLabel.TextColor3          = iconColor;
	IconLabel.TextScaled          = true;
	IconLabel.TextTransparency    = 1;
	IconLabel.TextWrapped         = true;

	local IconImage = Instance.new("ImageLabel");
	IconImage.Name                = L2Hub.RandomString();
	IconImage.Parent              = IconRoot;
	IconImage.AnchorPoint         = Vector2.new(0.5, 0.5);
	IconImage.BackgroundTransparency = 1;
	IconImage.BorderSizePixel     = 0;
	IconImage.Position            = UDim2.fromScale(0.5, 0.5);
	IconImage.Size                = UDim2.fromScale(0.65, 0.65);
	IconImage.ZIndex              = 21;
	IconImage.ImageColor3         = iconColor;
	IconImage.ImageTransparency   = 1;
	IconImage.ScaleType           = Enum.ScaleType.Fit;
	IconImage:SetAttribute("ModernIconScaleValue", iconScale);

	local UICornerImg = Instance.new("UICorner");
	UICornerImg.CornerRadius = UDim.new(0.15, 0);
	UICornerImg.Parent       = IconImage;

	-- Shadow behind icon
	local IconShadow = L2Hub:CreateShadow(IconRoot, true);

	-- ── Internal state ────────────────────────────────────────────
	local MenuIconLib = {
		Root         = IconRoot,
		Visible      = false,
		_size        = iconSize,
		_draggable   = draggable,
	};

	-- ── Helpers ───────────────────────────────────────────────────
	local function _applyIcon(src)
		if not src or src == "" then
			IconLabel.Text           = "";
			IconImage.Image          = "";
			IconLabel.Visible        = false;
			IconImage.Visible        = true;
			return;
		end;

		L2Hub:SetIconMode(IconImage, src);
		IconImage.Visible = true;
		IconLabel.Visible = false;
	end;

	_applyIcon(iconImage);

	-- ── Show / Hide with smooth animations ───────────────────────
		local function _setIconVisible(val)
		MenuIconLib.Visible = val;
		local IconFallbackText = IconImage:FindFirstChild("ModernIconFallbackText");

		if val then
			L2Hub.PlayAnimate(IconRoot, VSlowTween, {
				BackgroundTransparency = 0,
			});
			L2Hub.PlayAnimate(UIStrokeIcon, SlowyTween, {
				Transparency = 0.25,
			});
			L2Hub.PlayAnimate(IconLabel, VSlowTween, {
				TextTransparency = 0,
			});
			L2Hub.PlayAnimate(IconImage, VSlowTween, {
				ImageTransparency = 0,
			});
			if IconFallbackText then
				L2Hub.PlayAnimate(IconFallbackText, VSlowTween, {
					TextTransparency = 0,
				});
			end;
			IconShadow:Render(false);
		else
		
			L2Hub.PlayAnimate(IconRoot, VSlowTween, {
				BackgroundTransparency = 1,
			});
			L2Hub.PlayAnimate(UIStrokeIcon, SlowyTween, {
				Transparency = 1,
			});
			L2Hub.PlayAnimate(IconLabel, SlowyTween, {
				TextTransparency = 1,
			});
			L2Hub.PlayAnimate(IconImage, SlowyTween, {
				ImageTransparency = 1,
			});
			if IconFallbackText then
				L2Hub.PlayAnimate(IconFallbackText, SlowyTween, {
					TextTransparency = 1,
				});
			end;
			IconShadow:Render(false);
		end;
	end;

	-- ── Public API ────────────────────────────────────────────────

	--- Show or hide the icon
	function MenuIconLib:SetVisible(val)
		_setIconVisible(val);
	end;

	--- Change the icon image (rbxassetid, URL, or built-in name)
	function MenuIconLib:SetIcon(src)
		iconImage = src;
		_applyIcon(src);
	end;

	--- Change icon visual scale for padded image assets
	function MenuIconLib:SetIconScale(scale)
		iconScale = tonumber(scale) or iconScale;
		IconImage:SetAttribute("ModernIconScaleValue", iconScale);

		local IconScaleObject = IconImage:FindFirstChild("ModernIconScale");
		if IconScaleObject then
			IconScaleObject.Scale = iconScale;
		end;

		return MenuIconLib;
	end;

	--- Change icon tint colour
	function MenuIconLib:SetIconColor(c3)
		iconColor = c3;
		IconLabel.TextColor3  = c3;
		IconImage.ImageColor3 = c3;
	end;

	--- Change background colour
	function MenuIconLib:SetBGColor(c3)
		bgColor = c3;
		IconRoot.BackgroundColor3 = c3;
	end;

	--- Change stroke colour
	function MenuIconLib:SetStrokeColor(c3)
		strokeColor = c3;
		UIStrokeIcon.Color = c3;
	end;

	--- Change stroke thickness
	function MenuIconLib:SetStrokeThick(t)
		UIStrokeIcon.Thickness = t;
	end;

	--- Resize the icon (also adjusts corner radius)
	function MenuIconLib:SetSize(sz)
		MenuIconLib._size = sz;
		IconRoot.Size = UDim2.fromOffset(sz, sz);
		UICornerIcon.CornerRadius = UDim.new(0, math.floor(sz * 0.28));
	end;

	--- Enable / disable drag
	function MenuIconLib:SetDraggable(enabled)
		MenuIconLib._draggable = enabled;
	end;

	--- React to window toggle (pass true = UI is now visible, false = hidden)
	function MenuIconLib:OnWindowToggle(windowVisible)
		-- pulse-scale animation when toggling
		local sz = MenuIconLib._size;
		if windowVisible then
			-- shrink slightly
			L2Hub.PlayAnimate(IconRoot, TweenInfo.new(0.1), {
				Size = UDim2.fromOffset(sz * 0.85, sz * 0.85),
			});
			task.delay(0.12, function()
				L2Hub.PlayAnimate(IconRoot, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Size = UDim2.fromOffset(sz, sz),
				});
			end);
		else
			-- expand slightly
			L2Hub.PlayAnimate(IconRoot, TweenInfo.new(0.1), {
				Size = UDim2.fromOffset(sz * 1.15, sz * 1.15),
			});
			task.delay(0.12, function()
				L2Hub.PlayAnimate(IconRoot, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Size = UDim2.fromOffset(sz, sz),
				});
			end);
		end;
	end;

	-- ── Optional drag (clamped to screen, never off edge) ─────────
	do
		local dragging = false;
		local dragStart, startPos;

		local function clampPosition(pos)
			local screenSize = L2Hub.ScreenGui.AbsoluteSize;
			local sz2 = MenuIconLib._size;
			local nx = math.clamp(pos.X.Offset, 0, screenSize.X - sz2);
			local ny = math.clamp(pos.Y.Scale * screenSize.Y + pos.Y.Offset, sz2/2, screenSize.Y - sz2/2);
			return UDim2.new(0, nx, 0, ny);
		end;

			-- Tap = toggle UI  |  Drag = move icon (if draggable)
			-- Uses movement threshold to distinguish a click from a drag.
			local dragging   = false;
			local dragStart, startPos;
			local DRAG_THRESHOLD = 6; -- pixels of movement before it counts as a drag

			L2Hub:AddSignal(IconRoot.InputBegan:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1
				and input.UserInputType ~= Enum.UserInputType.Touch then
					return;
				end;

				dragging  = false;
				dragStart = input.Position;
				startPos  = IconRoot.Position;

				local moved = false;
				local moveConn, endConn;

				moveConn = UserInputService.InputChanged:Connect(function(mv)
					if mv.UserInputType ~= Enum.UserInputType.MouseMovement
					and mv.UserInputType ~= Enum.UserInputType.Touch then return; end;

					local delta = mv.Position - dragStart;
					if delta.Magnitude > DRAG_THRESHOLD and MenuIconLib._draggable then
						moved    = true;
						dragging = true;
						local raw = UDim2.new(
							startPos.X.Scale, startPos.X.Offset + delta.X,
							startPos.Y.Scale, startPos.Y.Offset + delta.Y
						);
						IconRoot.Position = clampPosition(raw);
					end;
				end);

				endConn = input.Changed:Connect(function()
					if input.UserInputState ~= Enum.UserInputState.End then return; end;
					moveConn:Disconnect();
					endConn:Disconnect();
					dragging = false;

					-- Pure tap (no drag movement) → Munculin Menu, Hilangin Logo
					if not moved then
						if L2Hub.ActiveWindow then
							L2Hub.ActiveWindow.Signal:SetValue(true)
							MenuIconLib:SetVisible(false)
						end
					end;
				end);
			end));
		end;

	-- ── Theme live-update ─────────────────────────────────────────
	L2Hub:OnThemeChanged(function(theme)
		if theme.Icon then
			MenuIconLib:SetIconColor(theme.Icon);
		end;
		if theme.Accent then
			MenuIconLib:SetStrokeColor(theme.Accent);
		end;
	end);

	-- ── Settings panel (built-in, opens on right-click / long press) ─
	-- Shows size slider + color pickers inline using the existing windows
	-- (lightweight stub; a full window.UserSettings section is the preferred path)

	-- Show by default (caller can call :SetVisible(false) to hide)
	_setIconVisible(true);

	return MenuIconLib;
end;

if getcustomasset then
	local link = "https://github.com/4lpaca-pin/L2Hub/blob/main/assets/%s?raw=true";
	local dir = 'L2Assets';

	if not isfolder(dir) then
		makefolder(dir);
	end;

	local function SafeFetch(name)
		local path = dir..'/'..name;

		if isfile(path) then
			return getcustomasset(path);
		end;

		local ok, byte = pcall(function()
			return game:HttpGet(string.format(link,name));
		end);

		if not ok or not byte or byte == "" then
			return nil;
		end;

		local write_ok = pcall(writefile, path, byte);

		if not write_ok then
			return nil;
		end;

		task.wait();

		if isfile(path) then
			local ok2, asset = pcall(getcustomasset, path);

			if ok2 then
				return asset;
			end;
		end;

		return nil;
	end;

	task.spawn(function()
		local logo = SafeFetch('logo.png');

		if logo then
			L2Hub.GlobalLogo = logo;
		end;
	end);

	task.spawn(function()
		local gradient = SafeFetch('saturation_value_gradient.png');

		if gradient then
			L2Hub.ImageColorMapping = gradient;
		end;
	end);
end;

function L2Hub:AddSignal(RBXSignal)
	if L2Hub.UnloadEnabled then
		table.insert(L2Hub.GlobalSignals,RBXSignal);
	end;

	return RBXSignal;
end;

L2Hub:AddSignal(GlobalWindow.DescendantAdded:Connect(function(Object)
	task.defer(function()
		L2Hub:ApplyFont(Object);
	end);
end));

function L2Hub:AddQuery(ItemRoot: Frame , Name : string)
	local SectionOwner = nil;
	local Parent = ItemRoot;

	while Parent do
		if L2Hub.SectionOwners[Parent] then
			SectionOwner = L2Hub.SectionOwners[Parent];
			break;
		end;

		Parent = Parent.Parent;
	end;

	table.insert(L2Hub.NameRegisitry , {
		Root = ItemRoot,
		Idx = Name,
		Section = SectionOwner,
	});
end;

function L2Hub:RevealQueryItem(Query)
	if not Query or not Query.Root then
		return;
	end;

	if Query.Section and Query.Section.GetCollapsed and Query.Section:GetCollapsed() then
		Query.Section:SetCollapsed(false);
	end;

	task.defer(function()
		local Root = Query.Root;

		if not Root or not Root.Parent then
			return;
		end;

		local ScrollParent = Root.Parent;

		while ScrollParent and not ScrollParent:IsA("ScrollingFrame") do
			ScrollParent = ScrollParent.Parent;
		end;

		if not ScrollParent then
			return;
		end;

		local CanvasMaxY = math.max(0, ScrollParent.AbsoluteCanvasSize.Y - ScrollParent.AbsoluteSize.Y);
		local TargetY = Root.AbsolutePosition.Y - ScrollParent.AbsolutePosition.Y + ScrollParent.CanvasPosition.Y - 8;

		ScrollParent.CanvasPosition = Vector2.new(
			ScrollParent.CanvasPosition.X,
			math.clamp(TargetY, 0, CanvasMaxY)
		);
	end);
end;

function L2Hub:RegisterFlag(Flag, Object)
	if not Flag or not Object then
		return Object;
	end;

	Flag = tostring(Flag);
	L2Hub.Flags[Flag] = Object;

	if L2Hub.PendingFlagValues[Flag] ~= nil and Object.SetValue then
		local PendingValue = L2Hub.PendingFlagValues[Flag];
		L2Hub.PendingFlagValues[Flag] = nil;

		task.spawn(function()
			pcall(function()
				Object:SetValue(PendingValue);
			end);
		end);
	end;

	return Object;
end;

function L2Hub:ResolveConfigFlag(Config)
	if typeof(Config) ~= "table" then
		return nil;
	end;

	local Flag = Config.Flag or Config.Key or Config.ConfigKey;

	if Flag ~= nil then
		Flag = tostring(Flag);
		Config.Flag = Flag;
	end;

	return Flag;
end;

function L2Hub:AttachLockMethods(Object, Frame, Config)
	if not Object or not Frame then
		return Object;
	end;

	Config = Config or {};
	local LockObject = L2Hub:ApplyLock(Frame, Config.Locked == true, Config.TextLocked or Config.LockMessage or "Locked");
	Object.Lock = LockObject;

	function Object:SetLocked(state)
		LockObject:SetLocked(state);
		return Object;
	end;

	function Object:SetTextLocked(text)
		LockObject:SetTextLocked(text);
		return Object;
	end;

	function Object:GetLocked()
		return LockObject:GetLocked();
	end;

	return Object;
end;

function Encryption.new(data: string)
	local bytes = {};
	local encrypt_seed = ((#data + 3782) % 111) + 1;

	string.gsub(data , '.', LPH_NO_VIRTUALIZE(function(dt)
		table.insert(bytes , tostring(dt:byte() + encrypt_seed));
	end));

	local concatbyte = table.concat(bytes,'?');

	table.clear(bytes);

	return "{"..tostring(encrypt_seed + 72667).."}?"..concatbyte;
end;

function Encryption.reverse(data: string)
	local main_data = string.split(data,'?');
	local seed_str = main_data[1]:gsub('{',''):gsub('}','');
	local seed = tonumber(seed_str);

	local ks = {};
	local real_seed = seed - 72667;

	for i,v in next , main_data do
		if i > 1 then
			local fake_byte = tonumber(v);
			table.insert(ks , string.char(fake_byte - real_seed))	
		end;
	end;

	local data = table.concat(ks);

	table.clear(ks);

	return data;
end;

do
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

	L2Hub.Base64Encode = LPH_NO_VIRTUALIZE(function(data)
		return ((data:gsub('.', function(x) 
			local r,b='',x:byte()
			for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
			return r;
		end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
			if (#x < 6) then return '' end
			local c=0
			for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
			return b:sub(c+1,c+1)
		end)..({ '', '==', '=' })[#data%3+1])
	end);

	L2Hub.Base64Decode = LPH_NO_VIRTUALIZE(function(data)
		data = string.gsub(data, '[^'..b..'=]', '')
		return (data:gsub('.', function(x)
			if (x == '=') then return '' end
			local r,f='',(b:find(x)-1)
			for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
			return r;
		end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
			if (#x ~= 8) then return '' end
			local c=0
			for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
			return string.char(c)
		end))
	end);
end;

-- ── FireKeybind ───────────────────────────────────────────────────
-- Simulates the UI keybind being pressed in real time.
-- Reads Window.Keybind at call time, so it always matches whatever
-- the user has set — even if they changed it via the keybind picker.
-- Called by Watermark bindable blocks and the MenuIcon click.
function L2Hub:FireKeybind()
	if L2Hub.ActiveWindow then
		L2Hub.ActiveWindow:ToggleInterface();
	end;
end;

L2Hub.LoadIcon = LPH_NO_VIRTUALIZE(function()
	L2Hub.RobloxIcon = {
		["3d-cube-arrow-left"] = "3d-cube-arrow-left",
		["amazon"] = "amazon",
		["arm-left"] = "arm-left",
		["arm-right"] = "arm-right",
		["arrow-curl-to-left"] = "arrow-curl-to-left",
		["arrow-curl-to-right"] = "arrow-curl-to-right",
		["arrow-down-to-line"] = "arrow-down-to-line",
		["arrow-large-down"] = "arrow-large-down",
		["arrow-large-left"] = "arrow-large-left",
		["arrow-large-right"] = "arrow-large-right",
		["arrow-large-up"] = "arrow-large-up",
		["arrow-right-from-portrait-rectangle"] = "arrow-right-from-portrait-rectangle",
		["arrow-right-to-portrait-rectangle"] = "arrow-right-to-portrait-rectangle",
		["arrow-rotate-down-dashed"] = "arrow-rotate-down-dashed",
		["arrow-rotate-right"] = "arrow-rotate-right",
		["arrow-rotate-right-dashed"] = "arrow-rotate-right-dashed",
		["arrow-small-down"] = "arrow-small-down",
		["arrow-small-left"] = "arrow-small-left",
		["arrow-small-right"] = "arrow-small-right",
		["arrow-small-up"] = "arrow-small-up",
		["arrow-spin-clockwise"] = "arrow-spin-clockwise",
		["arrow-spin-clockwise-10"] = "arrow-spin-clockwise-10",
		["arrow-spin-clockwise-15"] = "arrow-spin-clockwise-15",
		["arrow-spin-clockwise-30"] = "arrow-spin-clockwise-30",
		["arrow-spin-counter-clockwise-10"] = "arrow-spin-counter-clockwise-10",
		["arrow-spin-counter-clockwise-15"] = "arrow-spin-counter-clockwise-15",
		["arrow-spin-counter-clockwise-30"] = "arrow-spin-counter-clockwise-30",
		["arrow-thick-to-left"] = "arrow-thick-to-left",
		["arrow-thick-to-right"] = "arrow-thick-to-right",
		["arrow-up-from-landscape-rectangle"] = "arrow-up-from-landscape-rectangle",
		["arrow-up-right-from-square"] = "arrow-up-right-from-square",
		["arrow-wide-short-down"] = "arrow-wide-short-down",
		["arrow-wide-short-left"] = "arrow-wide-short-left",
		["arrow-wide-short-right"] = "arrow-wide-short-right",
		["arrow-wide-short-up"] = "arrow-wide-short-up",
		["arrows-small-directional"] = "arrows-small-directional",
		["audio-wave-dotted-line"] = "audio-wave-dotted-line",
		["backpack"] = "backpack",
		["beard"] = "beard",
		["bell"] = "bell",
		["bell-clock"] = "bell-clock",
		["bell-plus"] = "bell-plus",
		["bell-slash"] = "bell-slash",
		["belt"] = "belt",
		["binoculars"] = "binoculars",
		["book-closed"] = "book-closed",
		["bookmark"] = "bookmark",
		["bow-tie"] = "bow-tie",
		["building-store"] = "building-store",
		["bullet-flying"] = "bullet-flying",
		["butterfly-wings"] = "butterfly-wings",
		["calendar"] = "calendar",
		["calendar-plus"] = "calendar-plus",
		["calendar-star"] = "calendar-star",
		["camera-small"] = "camera-small",
		["caret-small-down"] = "caret-small-down",
		["caret-small-left"] = "caret-small-left",
		["caret-small-right"] = "caret-small-right",
		["caret-small-up"] = "caret-small-up",
		["chain-link"] = "chain-link",
		["chart-four-vertical-bars"] = "chart-four-vertical-bars",
		["chart-line"] = "chart-line",
		["chart-pie"] = "chart-pie",
		["chart-scatter-plot"] = "chart-scatter-plot",
		["chart-three-vertical-bars"] = "chart-three-vertical-bars",
		["check"] = "check",
		["check-large"] = "check-large",
		["check-small"] = "check-small",
		["chevron-large-down"] = "chevron-large-down",
		["chevron-large-down-to-line"] = "chevron-large-down-to-line",
		["chevron-large-left"] = "chevron-large-left",
		["chevron-large-left-to-line"] = "chevron-large-left-to-line",
		["chevron-large-right"] = "chevron-large-right",
		["chevron-large-right-to-line"] = "chevron-large-right-to-line",
		["chevron-large-up"] = "chevron-large-up",
		["chevron-large-up-to-line"] = "chevron-large-up-to-line",
		["chevron-small-down"] = "chevron-small-down",
		["chevron-small-down-to-line"] = "chevron-small-down-to-line",
		["chevron-small-left"] = "chevron-small-left",
		["chevron-small-left-to-line"] = "chevron-small-left-to-line",
		["chevron-small-right"] = "chevron-small-right",
		["chevron-small-right-to-line"] = "chevron-small-right-to-line",
		["chevron-small-up"] = "chevron-small-up",
		["chevron-small-up-to-line"] = "chevron-small-up-to-line",
		["circle-check"] = "circle-check",
		["circle-i"] = "circle-i",
		["circle-minus"] = "circle-minus",
		["circle-person"] = "circle-person",
		["circle-person-three-horizontal-bars-wrapping-right"] = "circle-person-three-horizontal-bars-wrapping-right",
		["circle-play"] = "circle-play",
		["circle-plus"] = "circle-plus",
		["circle-question"] = "circle-question",
		["circle-slash"] = "circle-slash",
		["circle-star"] = "circle-star",
		["circle-three-dots-horizontal"] = "circle-three-dots-horizontal",
		["circle-three-dots-vertical"] = "circle-three-dots-vertical",
		["circle-x"] = "circle-x",
		["clock"] = "clock",
		["clock-dashed"] = "clock-dashed",
		["clock-spin-reverse"] = "clock-spin-reverse",
		["clock-spin-reverse-dashed"] = "clock-spin-reverse-dashed",
		["clothes-hanger"] = "clothes-hanger",
		["cloud"] = "cloud",
		["cloud-arrow-down"] = "cloud-arrow-down",
		["code"] = "code",
		["compact-makeup-brush"] = "compact-makeup-brush",
		["compass"] = "compass",
		["controller-with-cog"] = "controller-with-cog",
		["crop"] = "crop",
		["crosshairs"] = "crosshairs",
		["crosshairs-slash"] = "crosshairs-slash",
		["cube-vertexes"] = "cube-vertexes",
		["curved-rectangle-megaphone"] = "curved-rectangle-megaphone",
		["diagonal-line-pattern"] = "diagonal-line-pattern",
		["diagonal-line-pattern-sticker"] = "diagonal-line-pattern-sticker",
		["diamond-simplified"] = "diamond-simplified",
		["discord"] = "discord",
		["disguise-nose-glasses"] = "disguise-nose-glasses",
		["document-circle-slash"] = "document-circle-slash",
		["document-list-heart"] = "document-list-heart",
		["door-open-arrow-to-bottom-right"] = "door-open-arrow-to-bottom-right",
		["dress"] = "dress",
		["dual-arrows-horizontal"] = "dual-arrows-horizontal",
		["dual-arrows-to-corners"] = "dual-arrows-to-corners",
		["dual-arrows-vertical"] = "dual-arrows-vertical",
		["envelope"] = "envelope",
		["eraser"] = "eraser",
		["eye"] = "eye",
		["eye-slash"] = "eye-slash",
		["eye-with-eyeliner"] = "eye-with-eyeliner",
		["eyebrows"] = "eyebrows",
		["eyelashes"] = "eyelashes",
		["face-winking"] = "face-winking",
		["facebook"] = "facebook",
		["file-box"] = "file-box",
		["fingerprint"] = "fingerprint",
		["flag"] = "flag",
		["flame"] = "flame",
		["folder"] = "folder",
		["fountain-pen-nib"] = "fountain-pen-nib",
		["four-bars-horizontal-center-aligned"] = "four-bars-horizontal-center-aligned",
		["four-bars-horizontal-chevron-left"] = "four-bars-horizontal-chevron-left",
		["four-bars-horizontal-chevron-right"] = "four-bars-horizontal-chevron-right",
		["four-bars-horizontal-justified-aligned"] = "four-bars-horizontal-justified-aligned",
		["four-bars-horizontal-left-aligned"] = "four-bars-horizontal-left-aligned",
		["four-bars-horizontal-right-aligned"] = "four-bars-horizontal-right-aligned",
		["frame-bubble-slash"] = "frame-bubble-slash",
		["frame-bubble-soundwave"] = "frame-bubble-soundwave",
		["frame-camera"] = "frame-camera",
		["frame-camera-center"] = "frame-camera-center",
		["frame-collapsed"] = "frame-collapsed",
		["frame-corners"] = "frame-corners",
		["frame-expanded"] = "frame-expanded",
		["frame-face"] = "frame-face",
		["frame-person-torso"] = "frame-person-torso",
		["frame-record"] = "frame-record",
		["frame-single-bar-horizontal"] = "frame-single-bar-horizontal",
		["frame-soundwave"] = "frame-soundwave",
		["frame-video-camera"] = "frame-video-camera",
		["gear"] = "gear",
		["generic-dpad"] = "generic-dpad",
		["gift-box"] = "gift-box",
		["gift-card"] = "gift-card",
		["glasses"] = "glasses",
		["globe-detailed"] = "globe-detailed",
		["globe-simplified"] = "globe-simplified",
		["globe-simplipfied-speech-bubble"] = "globe-simplipfied-speech-bubble",
		["grid"] = "grid",
		["guilded"] = "guilded",
		["hack-week"] = "hack-week",
		["hammer-code"] = "hammer-code",
		["hand-curved-arrow-left"] = "hand-curved-arrow-left",
		["hand-dual-arrows"] = "hand-dual-arrows",
		["hand-ellipse"] = "hand-ellipse",
		["hand-half-ellipse"] = "hand-half-ellipse",
		["hand-two-arrows-horizontal"] = "hand-two-arrows-horizontal",
		["hashtag"] = "hashtag",
		["hat-fedora"] = "hat-fedora",
		["hat-toque"] = "hat-toque",
		["head-blank"] = "head-blank",
		["head-blush"] = "head-blush",
		["head-female"] = "head-female",
		["head-freckles"] = "head-freckles",
		["head-lips"] = "head-lips",
		["head-male"] = "head-male",
		["headphones"] = "headphones",
		["headphones-arrow-up"] = "headphones-arrow-up",
		["headphones-arrow-up-lock"] = "headphones-arrow-up-lock",
		["headphones-slash"] = "headphones-slash",
		["headphones-x"] = "headphones-x",
		["headphones-x-lock"] = "headphones-x-lock",
		["heart"] = "heart",
		["house"] = "house",
		["image"] = "image",
		["image-stacked"] = "image-stacked",
		["instagram"] = "instagram",
		["jacket"] = "jacket",
		["key"] = "key",
		["key-alt"] = "key-alt",
		["key-apostrophe"] = "key-apostrophe",
		["key-arrow-down"] = "key-arrow-down",
		["key-arrow-right"] = "key-arrow-right",
		["key-arrow-up"] = "key-arrow-up",
		["key-asterisk"] = "key-asterisk",
		["key-backspace"] = "key-backspace",
		["key-caps-lock"] = "key-caps-lock",
		["key-caret"] = "key-caret",
		["key-comma"] = "key-comma",
		["key-command"] = "key-command",
		["key-control"] = "key-control",
		["key-grave-accent"] = "key-grave-accent",
		["key-period"] = "key-period",
		["key-return"] = "key-return",
		["key-shift"] = "key-shift",
		["key-space"] = "key-space",
		["key-tab"] = "key-tab",
		["language-characters"] = "language-characters",
		["leg-left"] = "leg-left",
		["leg-right"] = "leg-right",
		["lightning-bolt"] = "lightning-bolt",
		["linkedin"] = "linkedin",
		["lips"] = "lips",
		["lipstick"] = "lipstick",
		["list-bulleted"] = "list-bulleted",
		["location-pin"] = "location-pin",
		["location-pin-map"] = "location-pin-map",
		["lock-closed"] = "lock-closed",
		["lollipop"] = "lollipop",
		["magnifying-glass"] = "magnifying-glass",
		["magnifying-glass-minus"] = "magnifying-glass-minus",
		["magnifying-glass-plus"] = "magnifying-glass-plus",
		["mascara"] = "mascara",
		["megaphone"] = "megaphone",
		["memory-card"] = "memory-card",
		["messenger"] = "messenger",
		["microphone"] = "microphone",
		["microphone-slash"] = "microphone-slash",
		["microphone-text-box"] = "microphone-text-box",
		["microphone-triangle-exclamation"] = "microphone-triangle-exclamation",
		["minus"] = "minus",
		["minus-small"] = "minus-small",
		["mirror-standing"] = "mirror-standing",
		["moments"] = "moments",
		["moon"] = "moon",
		["mouse-button-left"] = "mouse-button-left",
		["mouse-button-right"] = "mouse-button-right",
		["mouse-scrollwheel"] = "mouse-scrollwheel",
		["music-note"] = "music-note",
		["nebula"] = "nebula",
		["necklace"] = "necklace",
		["nine-dots-grid"] = "nine-dots-grid",
		["ninja"] = "ninja",
		["nose"] = "nose",
		["page"] = "page",
		["paint-brush"] = "paint-brush",
		["paint-bucket"] = "paint-bucket",
		["pants"] = "pants",
		["pants-2d-text"] = "pants-2d-text",
		["paper-airplane"] = "paper-airplane",
		["parrot"] = "parrot",
		["pause-large"] = "pause-large",
		["pause-small"] = "pause-small",
		["pencil"] = "pencil",
		["pencil-square"] = "pencil-square",
		["person"] = "person",
		["person-arrow-from-bottom-right"] = "person-arrow-from-bottom-right",
		["person-check"] = "person-check",
		["person-circle-slash"] = "person-circle-slash",
		["person-climbing"] = "person-climbing",
		["person-clock"] = "person-clock",
		["person-falling"] = "person-falling",
		["person-graduate"] = "person-graduate",
		["person-jumping"] = "person-jumping",
		["person-magnifying-glass"] = "person-magnifying-glass",
		["person-photo-camera"] = "person-photo-camera",
		["person-play"] = "person-play",
		["person-play-clock"] = "person-play-clock",
		["person-plus"] = "person-plus",
		["person-racing"] = "person-racing",
		["person-running"] = "person-running",
		["person-standing"] = "person-standing",
		["person-standing-arrow-reverse"] = "person-standing-arrow-reverse",
		["person-standing-dual-arrows-vertical"] = "person-standing-dual-arrows-vertical",
		["person-standing-gear"] = "person-standing-gear",
		["person-swimming"] = "person-swimming",
		["person-teleport"] = "person-teleport",
		["person-trash-can"] = "person-trash-can",
		["person-walking"] = "person-walking",
		["person-with-smaller-person"] = "person-with-smaller-person",
		["phone"] = "phone",
		["phone-down"] = "phone-down",
		["phone-plus"] = "phone-plus",
		["phone-volume"] = "phone-volume",
		["phone-x"] = "phone-x",
		["photo-camera"] = "photo-camera",
		["photo-camera-face"] = "photo-camera-face",
		["photo-camera-slash"] = "photo-camera-slash",
		["picture-in-picture"] = "picture-in-picture",
		["pig"] = "pig",
		["pin"] = "pin",
		["pin-slash"] = "pin-slash",
		["play-large"] = "play-large",
		["play-small"] = "play-small",
		["plus-large"] = "plus-large",
		["plus-small"] = "plus-small",
		["premium"] = "premium",
		["ps-circle"] = "ps-circle",
		["ps-dpad-down"] = "ps-dpad-down",
		["ps-dpad-left"] = "ps-dpad-left",
		["ps-dpad-right"] = "ps-dpad-right",
		["ps-dpad-up"] = "ps-dpad-up",
		["ps-l1"] = "ps-l1",
		["ps-l2"] = "ps-l2",
		["ps-l3"] = "ps-l3",
		["ps-r1"] = "ps-r1",
		["ps-r2"] = "ps-r2",
		["ps-r3"] = "ps-r3",
		["ps-square"] = "ps-square",
		["ps-stick-left"] = "ps-stick-left",
		["ps-stick-right"] = "ps-stick-right",
		["ps-triagle"] = "ps-triagle",
		["ps-x"] = "ps-x",
		["ps4-options"] = "ps4-options",
		["ps4-share"] = "ps4-share",
		["ps4-touchpad"] = "ps4-touchpad",
		["ps5-options"] = "ps5-options",
		["ps5-share"] = "ps5-share",
		["ps5-touchpad"] = "ps5-touchpad",
		["pumpkin"] = "pumpkin",
		["purse"] = "purse",
		["rectangle-list"] = "rectangle-list",
		["rectangle-numbers-counting"] = "rectangle-numbers-counting",
		["rectangle-person-with-three-horizontal-lines"] = "rectangle-person-with-three-horizontal-lines",
		["robux"] = "robux",
		["rosette-seven-point"] = "rosette-seven-point",
		["rosette-ten-point"] = "rosette-ten-point",
		["seven-point-rosette"] = "seven-point-rosette",
		["shield-check"] = "shield-check",
		["shield-lock"] = "shield-lock",
		["shirt"] = "shirt",
		["shirt-2d-text"] = "shirt-2d-text",
		["shirt-pants"] = "shirt-pants",
		["shoe-left"] = "shoe-left",
		["shoe-right"] = "shoe-right",
		["shopping-basket"] = "shopping-basket",
		["shopping-basket-check"] = "shopping-basket-check",
		["shopping-cart"] = "shopping-cart",
		["shorts"] = "shorts",
		["sidebar"] = "sidebar",
		["signal-exclamation"] = "signal-exclamation",
		["six-dots-two-column-grid"] = "six-dots-two-column-grid",
		["skip-end-large"] = "skip-end-large",
		["skip-end-small"] = "skip-end-small",
		["skip-next-large"] = "skip-next-large",
		["skip-next-small"] = "skip-next-small",
		["skip-previous-large"] = "skip-previous-large",
		["skip-previous-small"] = "skip-previous-small",
		["skip-start-large"] = "skip-start-large",
		["skip-start-small"] = "skip-start-small",
		["smartphone-portrait"] = "smartphone-portrait",
		["speaker"] = "speaker",
		["speaker-slash"] = "speaker-slash",
		["speaker-triangle-exclamation"] = "speaker-triangle-exclamation",
		["speaker-x"] = "speaker-x",
		["speech-bubble-align-center"] = "speech-bubble-align-center",
		["speech-bubble-align-left"] = "speech-bubble-align-left",
		["speech-bubble-exclamation"] = "speech-bubble-exclamation",
		["speech-bubble-round"] = "speech-bubble-round",
		["square-bone"] = "square-bone",
		["square-books"] = "square-books",
		["square-check"] = "square-check",
		["square-code"] = "square-code",
		["square-dashed-person-standing"] = "square-dashed-person-standing",
		["square-dual-arrows-horizontal"] = "square-dual-arrows-horizontal",
		["square-dual-arrows-to-corner"] = "square-dual-arrows-to-corner",
		["square-face-sound"] = "square-face-sound",
		["square-face-waving-hand"] = "square-face-waving-hand",
		["square-face-winking"] = "square-face-winking",
		["square-minus"] = "square-minus",
		["square-person"] = "square-person",
		["squares-grid-plus"] = "squares-grid-plus",
		["squares-grid-qr"] = "squares-grid-qr",
		["stacked-squares-arrow-down-left"] = "stacked-squares-arrow-down-left",
		["stacked-squares-arrow-up-right"] = "stacked-squares-arrow-up-right",
		["stacked-squares-plus"] = "stacked-squares-plus",
		["star"] = "star",
		["stop-large"] = "stop-large",
		["stop-small"] = "stop-small",
		["studio"] = "studio",
		["sun"] = "sun",
		["sweater"] = "sweater",
		["sword"] = "sword",
		["tag-sparkle"] = "tag-sparkle",
		["teletype"] = "teletype",
		["tencent-qq"] = "tencent-qq",
		["text-b-bold"] = "text-b-bold",
		["text-box-microphone"] = "text-box-microphone",
		["text-h-subscript-1"] = "text-h-subscript-1",
		["text-h-subscript-2"] = "text-h-subscript-2",
		["text-h-subscript-3"] = "text-h-subscript-3",
		["text-i-italic"] = "text-i-italic",
		["text-s-strikethrough"] = "text-s-strikethrough",
		["text-u-underline"] = "text-u-underline",
		["text-uppercase-a-lowercase-a"] = "text-uppercase-a-lowercase-a",
		["text-x-subscript-2"] = "text-x-subscript-2",
		["text-x-superscript-2"] = "text-x-superscript-2",
		["three-bars-horizontal"] = "three-bars-horizontal",
		["three-bars-horizontal-chevron-left"] = "three-bars-horizontal-chevron-left",
		["three-bars-horizontal-narrowing"] = "three-bars-horizontal-narrowing",
		["three-bars-horizontal-triangles-vertical"] = "three-bars-horizontal-triangles-vertical",
		["three-bars-vertical-triangles-horizontal"] = "three-bars-vertical-triangles-horizontal",
		["three-chevrons-enlarging-down"] = "three-chevrons-enlarging-down",
		["three-chevrons-enlarging-up"] = "three-chevrons-enlarging-up",
		["three-dots-horizontal"] = "three-dots-horizontal",
		["three-dots-vertical"] = "three-dots-vertical",
		["three-horizontal-bars-wrapping-right"] = "three-horizontal-bars-wrapping-right",
		["three-people"] = "three-people",
		["three-ring-note"] = "three-ring-note",
		["three-sliders-horizontal"] = "three-sliders-horizontal",
		["three-stacked-squares-tilted"] = "three-stacked-squares-tilted",
		["thumb-down"] = "thumb-down",
		["thumb-up"] = "thumb-up",
		["tik-tok"] = "tik-tok",
		["tilt"] = "tilt",
		["torso"] = "torso",
		["trash-can"] = "trash-can",
		["triangle-exclamation"] = "triangle-exclamation",
		["trophy"] = "trophy",
		["tshirt"] = "tshirt",
		["tshirt-2d-text"] = "tshirt-2d-text",
		["tshirt-dual-arrows"] = "tshirt-dual-arrows",
		["twitch"] = "twitch",
		["twitter"] = "twitter",
		["two-arrows-down-and-up"] = "two-arrows-down-and-up",
		["two-arrows-from-center"] = "two-arrows-from-center",
		["two-arrows-left-right"] = "two-arrows-left-right",
		["two-arrows-loop-clockwise"] = "two-arrows-loop-clockwise",
		["two-arrows-loop-clockwise-1"] = "two-arrows-loop-clockwise-1",
		["two-arrows-loop-clockwise-infinity"] = "two-arrows-loop-clockwise-infinity",
		["two-arrows-spin-clockwise"] = "two-arrows-spin-clockwise",
		["two-arrows-spin-clockwise-plus"] = "two-arrows-spin-clockwise-plus",
		["two-arrows-switch-right"] = "two-arrows-switch-right",
		["two-arrows-to-center"] = "two-arrows-to-center",
		["two-folders"] = "two-folders",
		["two-location-pins-connecting-arrow"] = "two-location-pins-connecting-arrow",
		["two-makeup-brushes"] = "two-makeup-brushes",
		["two-people"] = "two-people",
		["two-people-speech-bubble"] = "two-people-speech-bubble",
		["two-stacked-squares"] = "two-stacked-squares",
		["two-switches-horizontal"] = "two-switches-horizontal",
		["verified-backplate"] = "verified-backplate",
		["verified-check"] = "verified-check",
		["verified-mono"] = "verified-mono",
		["video-camera"] = "video-camera",
		["video-camera-arrow-to-bottom-left"] = "video-camera-arrow-to-bottom-left",
		["video-camera-arrow-to-top-right"] = "video-camera-arrow-to-top-right",
		["video-camera-slash"] = "video-camera-slash",
		["video-camera-triangle-exclamation"] = "video-camera-triangle-exclamation",
		["video-camera-x"] = "video-camera-x",
		["wallet"] = "wallet",
		["we-chat"] = "we-chat",
		["whatsapp"] = "whatsapp",
		["x"] = "x",
		["x-small"] = "x-small",
		["xbox-a"] = "xbox-a",
		["xbox-a-pressed"] = "xbox-a-pressed",
		["xbox-a-unpressed"] = "xbox-a-unpressed",
		["xbox-b"] = "xbox-b",
		["xbox-dpad"] = "xbox-dpad",
		["xbox-dpad-down"] = "xbox-dpad-down",
		["xbox-dpad-left"] = "xbox-dpad-left",
		["xbox-dpad-right"] = "xbox-dpad-right",
		["xbox-dpad-up"] = "xbox-dpad-up",
		["xbox-lb"] = "xbox-lb",
		["xbox-lt"] = "xbox-lt",
		["xbox-menu"] = "xbox-menu",
		["xbox-rb"] = "xbox-rb",
		["xbox-rt"] = "xbox-rt",
		["xbox-stick-left"] = "xbox-stick-left",
		["xbox-stick-left-directional"] = "xbox-stick-left-directional",
		["xbox-stick-left-horizontal"] = "xbox-stick-left-horizontal",
		["xbox-stick-left-vertical"] = "xbox-stick-left-vertical",
		["xbox-stick-right"] = "xbox-stick-right",
		["xbox-stick-right-directional"] = "xbox-stick-right-directional",
		["xbox-stick-right-horizontal"] = "xbox-stick-right-horizontal",
		["xbox-stick-right-vertical"] = "xbox-stick-right-vertical",
		["xbox-view"] = "xbox-view",
		["xbox-x"] = "xbox-x",
		["xbox-y"] = "xbox-y",
		["xr-headset"] = "xr-headset",
		["youtube"] = "youtube"
	};
end);

L2Hub.IsMouseOverFrame = LPH_NO_VIRTUALIZE(function(self , Frame)
	if not Frame then
		return;
	end;

	if L2Hub.Global3DRenderMode then
		if Frame.GuiState == Enum.GuiState.Hover or Frame.GuiState == Enum.GuiState.Press then
			return true;
		end;

		return false;
	end;

	local AbsPos: Vector2, AbsSize: Vector2 = Frame.AbsolutePosition, Frame.AbsoluteSize;

	if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then
		return true;
	end;
end);

L2Hub.CreateSignal = LPH_NO_VIRTUALIZE(function(self , DefaultValue)
	local __cache = Instance.new('BindableEvent');
	local bind = {
		Value = DefaultValue,
		__event = __cache
	};

	function bind:GetValue()
		return bind.Value;
	end;

	function bind:SetValue(f)
		bind.Value = f;

		return __cache:Fire(f);
	end;

	function bind:Connect(f)
		local signal = __cache.Event:Connect(f);

		L2Hub:AddSignal(signal);

		return signal;
	end;

	return bind;
end);

function L2Hub:_ApplyTextGradient(Label)
	if not Label or not Label.Parent then
		return;
	end;

	local Gradient = Label:FindFirstChild("ModernTextGradient");

	if not L2Hub.TextGradientEnabled then
		if Gradient then
			Gradient:Destroy();
		end;

		return;
	end;

	if not Gradient then
		Gradient = Instance.new("UIGradient");
		Gradient.Name = "ModernTextGradient";
		Gradient.Parent = Label;
	end;

	local Accent = L2Hub.AccentColor or Color3.fromRGB(0, 255, 100);
	local SweepX = (((L2Hub.TextGradientAnimationTime or 0) * 0.9) % 2) - 1;

	Gradient.Rotation = 0;
	Gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Accent:Lerp(Color3.new(1, 1, 1), 0.2)),
		ColorSequenceKeypoint.new(0.55, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(1, Accent:Lerp(Color3.new(1, 1, 1), 0.35)),
	});
	Gradient.Offset = Vector2.new(SweepX, 0);

	for _,ExistingGradient in ipairs(L2Hub.TextGradientObjects) do
		if ExistingGradient == Gradient then
			return Gradient;
		end;
	end;

	table.insert(L2Hub.TextGradientObjects, Gradient);

	return Gradient;
end;

function L2Hub:AddTextGradient(Label)
	if not Label then
		return Label;
	end;

	for _,ExistingLabel in ipairs(L2Hub.TextGradientLabels) do
		if ExistingLabel == Label then
			L2Hub:_ApplyTextGradient(Label);
			return Label;
		end;
	end;

	table.insert(L2Hub.TextGradientLabels, Label);
	L2Hub:_ApplyTextGradient(Label);

	return Label;
end;

function L2Hub:SetTextGradientEnabled(Enabled)
	L2Hub.TextGradientEnabled = Enabled == true;

	if not L2Hub.TextGradientEnabled then
		L2Hub.TextGradientAccumulator = 0;
	end;

	table.clear(L2Hub.TextGradientObjects);

	for Index = #L2Hub.TextGradientLabels, 1, -1 do
		local Label = L2Hub.TextGradientLabels[Index];

		if Label and Label.Parent then
			L2Hub:_ApplyTextGradient(Label);
		else
			table.remove(L2Hub.TextGradientLabels, Index);
		end;
	end;
end;

function L2Hub:AnimateTextGradients(dt)
	if not L2Hub.TextGradientEnabled then
		return;
	end;

	L2Hub.TextGradientAccumulator = (L2Hub.TextGradientAccumulator or 0) + (dt or 0);

	if L2Hub.TextGradientAccumulator < (1 / 30) then
		return;
	end;

	local ResolvedDt = L2Hub.TextGradientAccumulator;
	L2Hub.TextGradientAccumulator = 0;
	L2Hub.TextGradientAnimationTime = (L2Hub.TextGradientAnimationTime or 0) + ResolvedDt;

	local SweepX = ((L2Hub.TextGradientAnimationTime * 0.9) % 2) - 1;
	local Offset = Vector2.new(SweepX, 0);

	for Index = #L2Hub.TextGradientObjects, 1, -1 do
		local Gradient = L2Hub.TextGradientObjects[Index];

		if Gradient and Gradient.Parent then
			Gradient.Rotation = 0;
			Gradient.Offset = Offset;
		else
			table.remove(L2Hub.TextGradientObjects, Index);
		end;
	end;
end;

L2Hub:AddSignal(RunService.RenderStepped:Connect(function(dt)
	L2Hub:AnimateTextGradients(dt);
end));

L2Hub.SetIconMode = LPH_NO_VIRTUALIZE(function(self , Label: TextLabel , Icon: string)
	Icon = tostring(Icon or "");
	local OriginalIcon = Icon;
	local FallbackIcon = L2Hub.IconAliases[OriginalIcon] or OriginalIcon;
	local IsVideoIcon = L2Hub:IsWebmIcon(OriginalIcon) or L2Hub:IsWebmIcon(FallbackIcon);
	local ResolvedIcon = L2Hub:GetIconId(OriginalIcon);

	if ResolvedIcon == "" and FallbackIcon ~= OriginalIcon then
		ResolvedIcon = L2Hub:GetIconId(FallbackIcon);
	end;

	if Label:IsA("ImageLabel") then
		if IsVideoIcon then
			Label.Image = "";
			Label.ImageTransparency = 1;
			Label.ScaleType = Enum.ScaleType.Fit;
			L2Hub:ApplyIconVideo(Label, OriginalIcon);

			local FallbackText = Label:FindFirstChild("ModernIconFallbackText");
			if FallbackText then
				FallbackText.Visible = false;
			end;

			return;
		end;

		L2Hub:ClearIconVideo(Label);
		Label.Image = ResolvedIcon;
		Label.ScaleType = Enum.ScaleType.Fit;

		local IconScale = Label:FindFirstChild("ModernIconScale");
		if not IconScale then
			IconScale = Instance.new("UIScale");
			IconScale.Name = "ModernIconScale";
			IconScale.Parent = Label;
		end;
		IconScale.Scale = tonumber(Label:GetAttribute("ModernIconScaleValue")) or L2Hub.IconScale or 0.82;

		local FallbackText = Label:FindFirstChild("ModernIconFallbackText");

		if ResolvedIcon ~= "" then
			if FallbackText then
				FallbackText.Visible = false;
			end;
		else
			Label.ImageTransparency = 1;

			if FallbackIcon ~= "" and not string.find(FallbackIcon, "lucide:", 1, true) and not string.find(FallbackIcon, "solar:", 1, true) then
				if not FallbackText then
					FallbackText = Instance.new("TextLabel");
					FallbackText.Name = "ModernIconFallbackText";
					FallbackText.Parent = Label;
					FallbackText.AnchorPoint = Vector2.new(0.5, 0.5);
					FallbackText.BackgroundTransparency = 1;
					FallbackText.BorderSizePixel = 0;
					FallbackText.Position = UDim2.fromScale(0.5, 0.5);
					FallbackText.Size = UDim2.fromScale(1, 1);
					FallbackText.ZIndex = Label.ZIndex + 1;
					FallbackText.TextScaled = true;
					FallbackText.TextWrapped = true;
					FallbackText:SetAttribute("ModernV2IconFont", true);

					L2Hub:AddSignal(Label:GetPropertyChangedSignal("ImageTransparency"):Connect(function()
						local ChildIcon = Label:FindFirstChild("ModernIconFallbackText");
						if ChildIcon then
							ChildIcon.TextTransparency = Label.ImageTransparency;
						end;
					end));

					L2Hub:AddSignal(Label:GetPropertyChangedSignal("ImageColor3"):Connect(function()
						local ChildIcon = Label:FindFirstChild("ModernIconFallbackText");
						if ChildIcon then
							ChildIcon.TextColor3 = Label.ImageColor3;
						end;
					end));

					L2Hub:AddSignal(Label:GetPropertyChangedSignal("ZIndex"):Connect(function()
						local ChildIcon = Label:FindFirstChild("ModernIconFallbackText");
						if ChildIcon then
							ChildIcon.ZIndex = Label.ZIndex + 1;
						end;
					end));
				end;

				local useBold = string.lower(string.sub(FallbackIcon , -5)) == '-bold';
				FallbackText.Text = useBold and FallbackIcon:sub(1,-6) or FallbackIcon;
				FallbackText.FontFace = useBold and L2Hub.BuiltInBold or L2Hub.BuiltInRegular;
				FallbackText.TextColor3 = Label.ImageColor3;
				FallbackText.TextTransparency = Label.ImageTransparency;
				FallbackText.Visible = true;
			elseif FallbackText then
				FallbackText.Visible = false;
			end;
		end;

		return;
	end;

	local IconImage = Label:FindFirstChild("ModernResolvedIcon");

	if IsVideoIcon then
		if not IconImage then
			IconImage = Instance.new("ImageLabel");
			IconImage.Name = "ModernResolvedIcon";
			IconImage.Parent = Label;
			IconImage.AnchorPoint = Vector2.new(0.5, 0.5);
			IconImage.BackgroundTransparency = 1;
			IconImage.BorderSizePixel = 0;
			IconImage.Position = UDim2.fromScale(0.5, 0.5);
			IconImage.Size = UDim2.fromScale(1, 1);
			IconImage.ScaleType = Enum.ScaleType.Fit;
			IconImage.ZIndex = Label.ZIndex;
		end;

		IconImage.Image = "";
		IconImage.ImageTransparency = 1;
		IconImage.Visible = true;
		L2Hub:ApplyIconVideo(IconImage, OriginalIcon);
		Label.Text = "";

		return;
	elseif IconImage then
		L2Hub:ClearIconVideo(IconImage);
	end;

	if ResolvedIcon ~= "" then
		if not IconImage then
			IconImage = Instance.new("ImageLabel");
			IconImage.Name = "ModernResolvedIcon";
			IconImage.Parent = Label;
			IconImage.AnchorPoint = Vector2.new(0.5, 0.5);
			IconImage.BackgroundTransparency = 1;
			IconImage.BorderSizePixel = 0;
			IconImage.Position = UDim2.fromScale(0.5, 0.5);
			IconImage.Size = UDim2.fromScale(1, 1);
			IconImage.ScaleType = Enum.ScaleType.Fit;
			IconImage.ZIndex = Label.ZIndex;

			L2Hub:AddSignal(Label:GetPropertyChangedSignal("TextTransparency"):Connect(function()
				local ChildIcon = Label:FindFirstChild("ModernResolvedIcon");
				if ChildIcon then
					ChildIcon.ImageTransparency = Label.TextTransparency;
				end;
			end));

			L2Hub:AddSignal(Label:GetPropertyChangedSignal("TextColor3"):Connect(function()
				local ChildIcon = Label:FindFirstChild("ModernResolvedIcon");
				if ChildIcon then
					ChildIcon.ImageColor3 = Label.TextColor3;
				end;
			end));

			L2Hub:AddSignal(Label:GetPropertyChangedSignal("ZIndex"):Connect(function()
				local ChildIcon = Label:FindFirstChild("ModernResolvedIcon");
				if ChildIcon then
					ChildIcon.ZIndex = Label.ZIndex;
				end;
			end));
		end;

		IconImage.Image = ResolvedIcon;
		IconImage.ImageColor3 = Label.TextColor3;
		IconImage.ImageTransparency = Label.TextTransparency;
		IconImage.Visible = true;
		Label.Text = "";

		return;
	end;

	if IconImage then
		IconImage.Visible = false;
		IconImage.Image = "";
	end;

	Icon = FallbackIcon;

	if string.find(Icon, "lucide:", 1, true) or string.find(Icon, "solar:", 1, true) then
		Label.Text = "";
		return;
	end;

	local useBold = string.lower(string.sub(Icon , -5)) == '-bold';

	if useBold then
		Label.Text = Icon:sub(1,-6);
		Label.FontFace = L2Hub.BuiltInBold;
	else
		Label.Text = Icon;
		Label.FontFace = L2Hub.BuiltInRegular;
	end;
	Label:SetAttribute("ModernV2IconFont", true);
end);

function L2Hub:GetIconFont(icon: string)
	local useBold = string.lower(string.sub(icon , -5)) == '-bold';

	if useBold then
		return L2Hub.BuiltInBold;
	end;

	return L2Hub.BuiltInRegular;
end;

function L2Hub:ResolveFontFace(FontConfig)
	if typeof(FontConfig) == "Font" then
		return FontConfig;
	end;

	if not FontConfig or FontConfig == "" then
		return nil;
	end;

	local FontSource = tostring(FontConfig);

	if string.match(FontSource, "^%d+$") then
		FontSource = "rbxassetid://" .. FontSource;
	elseif not string.find(FontSource, "rbxasset://", 1, true) and not string.find(FontSource, "rbxassetid://", 1, true) and not string.match(FontSource, "^https?://") then
		FontSource = "rbxasset://fonts/families/" .. FontSource .. ".json";
	end;

	local Success, ResolvedFont = pcall(function()
		return Font.new(FontSource,Enum.FontWeight.Regular,Enum.FontStyle.Normal);
	end);

	if Success then
		return ResolvedFont;
	end;
end;

function L2Hub:ApplyFont(Object)
	if not L2Hub.FontFace then
		return Object;
	end;

	if not Object or (not Object:IsA("TextLabel") and not Object:IsA("TextBox") and not Object:IsA("TextButton")) then
		return Object;
	end;

	if Object:GetAttribute("ModernV2IconFont") then
		return Object;
	end;

	Object.FontFace = L2Hub.FontFace;
	return Object;
end;

function L2Hub:SetFont(FontConfig)
	L2Hub.Font = FontConfig;
	L2Hub.FontFace = L2Hub:ResolveFontFace(FontConfig);

	if L2Hub.FontFace then
		for _, Object in next, L2Hub.ScreenGui:GetDescendants() do
			L2Hub:ApplyFont(Object);
		end;
	end;

	return L2Hub.FontFace;
end;

function L2Hub:MoreThanHalfY(Value: number)
	return (L2Hub.ScreenGui.AbsoluteSize.Y / 2) < Value
end;

L2Hub.IsStudio = RunService:IsStudio();

do
	local TouchEnabled    = UserInputService.TouchEnabled;
	local KeyboardEnabled = UserInputService.KeyboardEnabled;
	local MouseEnabled    = UserInputService.MouseEnabled;

	L2Hub.IsMobile = TouchEnabled and not KeyboardEnabled and not MouseEnabled;
	L2Hub.IsTouchDevice = TouchEnabled;
	L2Hub.IsDesktop = KeyboardEnabled and MouseEnabled;
end;

L2Hub.CreateInput = LPH_NO_VIRTUALIZE(function(self , Frame , Callback)
	local Button = Instance.new('ImageButton',Frame);

	Button.ZIndex = Frame.ZIndex + 10;
	Button.Size = UDim2.fromScale(1,1);
	Button.BackgroundTransparency = 1;
	Button.ImageTransparency = 1;
	Button.Image = "rbxasset://textuers/translateIcon.png";

	if Callback then
		local bth_signal = Button.MouseButton1Click:Connect(Callback);

		return Button , bth_signal;
	end;

	return Button;
end);

L2Hub.PlayAnimate = LPH_NO_VIRTUALIZE(function(Self , Info , Property)
	if Self and Self:IsA("ImageLabel") then
		local ImageProperty = {};

		for Key,Value in next , Property do
			if Key == "TextTransparency" then
				ImageProperty.ImageTransparency = Value;
			elseif Key == "TextColor3" then
				ImageProperty.ImageColor3 = Value;
			else
				ImageProperty[Key] = Value;
			end;
		end;

		Property = ImageProperty;
	end;

	local Tween = TweenService:Create(Self , Info or TweenInfo.new(0.15) , Property);

	Tween:Play();

	return Tween;
end);

L2Hub.Drag = LPH_NO_VIRTUALIZE(function(InputFrame: Frame, MoveFrame: Frame, Speed : number)
	local dragToggle: boolean = false;
	local dragStart: Vector3 = nil;
	local startPos: UDim2 = nil;
	local Tween = TweenInfo.new(Speed);

	local updateInput = function(input)
	local delta = input.Position - dragStart;
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y);
		if L2Hub.Global3DRenderMode then
			MoveFrame.Position = UDim2.fromScale(0.5, 0.5)
		else
			MoveFrame.Position = position
		end;
	end;

	L2Hub:AddSignal(InputFrame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true;
			dragStart = input.Position;
			startPos = MoveFrame.Position;

			local input_end;
			input_end = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false;

					input_end:Disconnect();
				end
			end)
		end
	end));

	L2Hub:AddSignal(UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end));
end);

L2Hub.Rounding = LPH_NO_VIRTUALIZE(function(num, numDecimalPlaces)
	local mult = 10 ^ (numDecimalPlaces or 0);
	return math.floor(num * mult + 0.5) / mult;
end);

L2Hub.ProcessParams = LPH_NO_VIRTUALIZE(function(self , Params , Fixed)
	Params = Params or {};
	Fixed = Fixed or {};

	local k = Params or {};

	for i,v in next , Fixed do
		if Params[i] == nil then
			k[i] = v;
		end;
	end;

	table.clear(Fixed);

	return k;
end);

function L2Hub:ApplyLock(Frame, isLocked, lockMessage)
	local LockFunc = {
		IsLocked = isLocked == true,
	};
	local Message = tostring(lockMessage or "Locked");
	local Destroyed = false;
	local Rebuilding = false;
	local LockOverlay;
	local LockLabel;
	local RefreshLockSize = function() end;

	pcall(function()
		Frame.ClipsDescendants = true;
	end);

	local function BuildOverlay()
		if Destroyed or not Frame or not Frame.Parent then
			return;
		end;

		if LockOverlay and LockOverlay.Parent then
			LockOverlay.Visible = LockFunc.IsLocked;
			return;
		end;

		LockOverlay = Instance.new("TextButton");
		LockOverlay.Name = "LockOverlay";
		LockOverlay.Text = "";
		LockOverlay.Size = UDim2.new(1, 0, 1, 0);
		LockOverlay.BackgroundColor3 = Color3.fromRGB(10, 8, 18);
		LockOverlay.BackgroundTransparency = 0.28;
		LockOverlay.BorderSizePixel = 0;
		LockOverlay.AutoButtonColor = false;
		LockOverlay.ClipsDescendants = false;
		LockOverlay.Visible = LockFunc.IsLocked;
		LockOverlay.ZIndex = (Frame.ZIndex or 1) + 50;
		LockOverlay.Parent = Frame;

		local UICorner = Instance.new("UICorner");
		UICorner.CornerRadius = UDim.new(0, 6);
		UICorner.Parent = LockOverlay;

		local Inner = Instance.new("Frame");
		Inner.Name = "LockInner";
		Inner.AnchorPoint = Vector2.new(0.5, 0.5);
		Inner.Position = UDim2.new(0.5, 0, 0.5, 0);
		Inner.Size = UDim2.new(0, 120, 0, 20);
		Inner.BackgroundTransparency = 1;
		Inner.ClipsDescendants = false;
		Inner.ZIndex = LockOverlay.ZIndex + 1;
		Inner.Parent = LockOverlay;

		local UIListLayout = Instance.new("UIListLayout");
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal;
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center;
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout.Padding = UDim.new(0, 7);
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
		UIListLayout.Parent = Inner;

		local LockIcon = Instance.new("ImageLabel");
		LockIcon.Name = "LockIcon";
		LockIcon.Size = UDim2.new(0, 15, 0, 15);
		LockIcon.BackgroundTransparency = 1;
		LockIcon.ScaleType = Enum.ScaleType.Fit;
		LockIcon.Image = L2Hub:GetIconId("134724289526879");
		LockIcon.ImageColor3 = Color3.fromRGB(235, 235, 235);
		LockIcon.ImageTransparency = 0.05;
		LockIcon.LayoutOrder = 1;
		LockIcon.ZIndex = LockOverlay.ZIndex + 2;
		LockIcon.Parent = Inner;

		LockLabel = Instance.new("TextLabel");
		LockLabel.Name = "LockLabel";
		LockLabel.Size = UDim2.new(0, 200, 0, 20);
		LockLabel.BackgroundTransparency = 1;
		LockLabel.Font = Enum.Font.GothamBold;
		LockLabel.Text = Message;
		LockLabel.TextSize = 13;
		LockLabel.TextColor3 = Color3.fromRGB(235, 235, 235);
		LockLabel.TextTransparency = 0.05;
		LockLabel.TextXAlignment = Enum.TextXAlignment.Left;
		LockLabel.TextYAlignment = Enum.TextYAlignment.Center;
		LockLabel.TextTruncate = Enum.TextTruncate.None;
		LockLabel.TextWrapped = false;
		LockLabel.LayoutOrder = 2;
		LockLabel.ZIndex = LockOverlay.ZIndex + 2;
		LockLabel.Parent = Inner;

		RefreshLockSize = function()
			if not LockLabel or not LockLabel.Parent then
				return;
			end;

			local TextSize = TextService:GetTextSize(
				LockLabel.Text,
				LockLabel.TextSize,
				LockLabel.Font,
				Vector2.new(math.huge, 20)
			);
			local TextWidth = math.max(40, TextSize.X);
			LockLabel.Size = UDim2.new(0, TextWidth, 0, 20);
			Inner.Size = UDim2.new(0, 22 + TextWidth, 0, 20);
		end;

		RefreshLockSize();

		local FeedbackBusy = false;
		L2Hub:AddSignal(LockOverlay.MouseButton1Click:Connect(function()
			if FeedbackBusy or not LockOverlay.Parent then
				return;
			end;

			FeedbackBusy = true;
			L2Hub.PlayAnimate(LockOverlay, TweenInfo.new(0.08), {
				BackgroundTransparency = 0.18,
			});

			task.delay(0.12, function()
				if LockOverlay and LockOverlay.Parent then
					L2Hub.PlayAnimate(LockOverlay, TweenInfo.new(0.12), {
						BackgroundTransparency = 0.28,
					});
				end;

				FeedbackBusy = false;
			end);
		end));
	end;

	BuildOverlay();

	L2Hub:AddSignal(Frame.DescendantRemoving:Connect(function(desc)
		if desc == LockOverlay and LockFunc.IsLocked and not Destroyed then
			if Rebuilding then
				return;
			end;

			Rebuilding = true;
			task.defer(function()
				BuildOverlay();
				Rebuilding = false;
			end);
		end;
	end));

	L2Hub:AddSignal(Frame.AncestryChanged:Connect(function(_, newParent)
		if newParent == nil then
			Destroyed = true;
		end;
	end));

	function LockFunc:SetLocked(state)
		LockFunc.IsLocked = state == true;

		if LockFunc.IsLocked and (not LockOverlay or not LockOverlay.Parent) then
			BuildOverlay();
		end;

		if LockOverlay and LockOverlay.Parent then
			LockOverlay.Visible = LockFunc.IsLocked;
		end;

		return LockFunc;
	end;

	function LockFunc:SetTextLocked(text)
		Message = tostring(text or "Locked");

		if LockLabel and LockLabel.Parent then
			LockLabel.Text = Message;
			RefreshLockSize();
		end;

		return LockFunc;
	end;

	function LockFunc:SetMessage(text)
		return LockFunc:SetTextLocked(text);
	end;

	function LockFunc:GetLocked()
		return LockFunc.IsLocked;
	end;

	LockFunc:SetLocked(LockFunc.IsLocked);

	return LockFunc;
end;

L2Hub.EnabledBlur = true;
L2Hub.BlurModuleParent = workspace.CurrentCamera;

L2Hub.GetCalculatePosition = LPH_NO_VIRTUALIZE(function(planePos, planeNormal, rayOrigin, rayDirection)
	local n = planeNormal;
	local d = rayDirection;
	local v = rayOrigin - planePos;

	local num = (n.x * v.x) + (n.y * v.y) + (n.z * v.z);
	local den = (n.x * d.x) + (n.y * d.y) + (n.z * d.z);
	local a = -num / den;

	return rayOrigin + (a * rayDirection);
end);

L2Hub.CreateBlurModule = LPH_NO_VIRTUALIZE(function(self , Frame , Signal)
	if not L2Hub.EnabledBlur then
		return L2Hub:AddSignal(Instance.new('BindableEvent').Event:Connect(function() return "nl"; end));	
	end;

	local Part = Instance.new('Part',L2Hub.BlurModuleParent);
	local DepthOfField = Instance.new('DepthOfFieldEffect',cloneref(game:GetService('Lighting')));
	local BlockMesh = Instance.new("BlockMesh");

	BlockMesh.Parent = Part;

	Part.Material = Enum.Material.Glass;
	Part.Transparency = 1;
	Part.Reflectance = 1;
	Part.CastShadow = false;
	Part.Anchored = true;
	Part.CanCollide = false;
	Part.CanQuery = false;
	Part.CollisionGroup = L2Hub.RandomString();
	Part.Size = Vector3.new(1, 1, 1) * 0.01;
	Part.Color = Color3.fromRGB(0,0,0);

	DepthOfField.Enabled = true;
	DepthOfField.FarIntensity = 0;
	DepthOfField.FocusDistance = 0;
	DepthOfField.InFocusRadius = 1000;
	DepthOfField.NearIntensity = 1;
	DepthOfField.Name = L2Hub.RandomString();

	Part.Name = L2Hub.RandomString();

	local disconnect;

	local UpdateFunction = function()
		local IsWindowActive = Signal:GetValue();

		if IsWindowActive and not L2Hub.Global3DRenderMode then

			L2Hub.PlayAnimate(DepthOfField,TweenInfo.new(0.1),{
				NearIntensity = 1
			})

			L2Hub.PlayAnimate(Part,TweenInfo.new(0.1),{
				Transparency = 0.97,
				Size = Vector3.new(1, 1, 1) * 0.01;
			})

			Part.Parent = L2Hub.BlurModuleParent;
		else
			L2Hub.PlayAnimate(DepthOfField,TweenInfo.new(0.1),{
				NearIntensity = 0
			})

			L2Hub.PlayAnimate(Part,TweenInfo.new(0.1),{
				Size = Vector3.zero,
				Transparency = 1.5,
			})

			Part.Parent = nil;

			return false;
		end;

		if IsWindowActive then
			local corner0 = Frame.AbsolutePosition;
			local corner1 = corner0 + Frame.AbsoluteSize;

			local ray0 = CurrentCamera.ScreenPointToRay(CurrentCamera,corner0.X, corner0.Y, 1);
			local ray1 = CurrentCamera.ScreenPointToRay(CurrentCamera,corner1.X, corner1.Y, 1);

			local planeOrigin = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * (0.05 - CurrentCamera.NearPlaneZ);

			local planeNormal = CurrentCamera.CFrame.LookVector;

			local pos0 = L2Hub.GetCalculatePosition(planeOrigin, planeNormal, ray0.Origin, ray0.Direction);
			local pos1 = L2Hub.GetCalculatePosition(planeOrigin, planeNormal, ray1.Origin, ray1.Direction);

			pos0 = CurrentCamera.CFrame:PointToObjectSpace(pos0);
			pos1 = CurrentCamera.CFrame:PointToObjectSpace(pos1);

			local size   = pos1 - pos0;
			local center = (pos0 + pos1) / 2;

			BlockMesh.Offset = center
			BlockMesh.Scale  = size / 0.0101;
			Part.CFrame = CurrentCamera.CFrame;
		end;
	end;

	local rbxsignal = L2Hub:AddSignal(CurrentCamera:GetPropertyChangedSignal('CFrame'):Connect(UpdateFunction))
	local loopThread = L2Hub:AddSignal(UserInputService.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			pcall(UpdateFunction);
		end;
	end));

	local THREAD = task.spawn(function()
		while true do task.wait(0.1)
			pcall(UpdateFunction);
		end;
	end);

	disconnect = function()
		rbxsignal:Disconnect();
		loopThread:Disconnect();
		task.cancel(THREAD);
		Part:Destroy();
		DepthOfField:Destroy();
	end;

	Frame.Destroying:Connect(disconnect);

	return rbxsignal;
end);

local EmptyFunction = function() end;

function L2Hub:FireCallback(Callback, Context, ...)
	if type(Callback) ~= "function" then
		return true;
	end;

	local Args = table.pack(...);
	local Window = L2Hub.ActiveWindow;
	local Ok, Result = xpcall(function()
		return Callback(table.unpack(Args, 1, Args.n));
	end, (debug and debug.traceback) or tostring);

	if not Ok then
		warn(("[L2Hub] %s callback error: %s"):format(tostring(Context or "Unknown"), tostring(Result)));

		if Window and Window.NotifyOnCallbackError and Window.Notify then
			Window:Notify({
				Title = "Callback Error",
				Content = tostring(Result),
				Duration = 5,
				Icon = "lucide:triangle-alert",
			});
		end;
	end;

	return Ok, Result;
end;

-- ── CaseInsensitive ───────────────────────────────────────────────
-- Wraps any table so its methods can be called with any casing.
-- e.g. :AddButton(), :ADDBUTTON(), :adDbUtToN() all work.
-- Walks the raw table first (exact match), then falls back to a
-- lowercase scan so performance is fine for small method tables.
local function CaseInsensitive(t)
	return setmetatable(t, {
		__index = function(self, key)
			-- 1. exact key already present (fastest path, covers normal calls)
			local v = rawget(self, key);
			if v ~= nil then return v; end;

			-- 2. lowercase scan
			local lower = string.lower(tostring(key));
			for k, val in next, self do
				if string.lower(tostring(k)) == lower then
					return val;
				end;
			end;
		end;
	});
end;

function L2Hub:RollingEffect(parent)
	local UIGradient = Instance.new("UIGradient")

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.4), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = parent

	return UIGradient;
end;

local __SharedShadow = {
	Render = function(self, value) end,
};

function L2Hub:CreateShadow(parent, RollingEffect)
	return __SharedShadow;
end;

function L2Hub:CreateOptionWindow(Frame: Frame , Zindex)
	Zindex = Zindex or 9;

	local Window = {
		Signal = L2Hub:CreateSignal(false),
	};

	local OptionHandler = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")
	local UIStroke = Instance.new("UIStroke")
	local shadow = L2Hub:CreateShadow(OptionHandler);

	OptionHandler.Name = L2Hub.RandomString();
	OptionHandler.Parent = L2Hub.ScreenGui
	OptionHandler.AnchorPoint = Vector2.new(0, 0)
	OptionHandler.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	OptionHandler.BackgroundTransparency = 0.035
	OptionHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OptionHandler.BorderSizePixel = 0
	OptionHandler.ClipsDescendants = true
	OptionHandler.Position = UDim2.new(255,255,255,255)
	OptionHandler.Size = UDim2.new(0, 220, 0, 75)
	OptionHandler.ZIndex = Zindex + 9

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = OptionHandler

	UIListLayout.Parent = OptionHandler
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = OptionHandler

	L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(OptionHandler , SlowyTween , {
			Size = UDim2.new(0, 220, 0, UIListLayout.AbsoluteContentSize.Y - 1)
		})
	end)));

	L2Hub:AddSignal(OptionHandler:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
		if OptionHandler.BackgroundTransparency > 0.9 then
			OptionHandler.Visible = false;
			UIListLayout.Parent = nil;
			OptionHandler.Parent = nil;
		else
			OptionHandler.Visible = true;
			UIListLayout.Parent = OptionHandler

			if L2Hub.Global3DRenderMode then
				OptionHandler.Parent = L2Hub.GlobalSurfaceGui;
			else
				OptionHandler.Parent = L2Hub.ScreenGui;
			end;
		end
	end)));

	local FollowingThread;
	local SetPosition = LPH_NO_VIRTUALIZE(function()
		if L2Hub:MoreThanHalfY(Frame.AbsolutePosition.Y + 65) then
			OptionHandler.AnchorPoint = Vector2.new(0,1)
		else
			OptionHandler.AnchorPoint = Vector2.new(0,0)
		end;

		OptionHandler.Position = UDim2.fromOffset(Frame.AbsolutePosition.X + 18 , Frame.AbsolutePosition.Y + 65);
	end);

	Window.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if FollowingThread then
			task.cancel(FollowingThread);
			FollowingThread = nil;
		end;

		if value then
			SetPosition();

			L2Hub.PlayAnimate(OptionHandler , SlowyTween , {
				BackgroundTransparency = 0.035
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			})

			Shadow:Render(false);

			if L2Hub.Global3DRenderMode then
				OptionHandler.Parent = L2Hub.GlobalSurfaceGui;
			else
				OptionHandler.Parent = L2Hub.ScreenGui;
			end;

			FollowingThread = task.spawn(function()
				while true do task.wait()
					SetPosition();
				end
			end)
		else
			L2Hub.PlayAnimate(OptionHandler , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			shadow:Render(false);
		end;
	end);

	Window.SetRender(false);
	Window.Signal:Connect(Window.SetRender)

	local Payback = L2Hub:RegisiterItem(OptionHandler , Window.Signal);

	Payback.Winbdow = Window;
	Payback.Root = OptionHandler;
	Payback.Signal = Window.Signal;

	return Payback;
end;

function L2Hub:CreateColorPicker(HandleFrame: Frame)
	local ZIndex = HandleFrame.ZIndex;

	local ColorPickerLib = {};

	local ColorPickerHandler = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local SaViMap = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local ColorZoneSelection = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local ColorMap = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local UICorner_4 = Instance.new("UICorner")
	local ColorMapSelection = Instance.new("Frame")
	local UIStroke_3 = Instance.new("UIStroke")
	local UICorner_5 = Instance.new("UICorner")
	local RGBLabel = Instance.new("TextLabel")
	local UICorner_6 = Instance.new("UICorner")
	local Shadow = L2Hub:CreateShadow(ColorPickerHandler);

	ColorPickerHandler.Name = L2Hub.RandomString();
	ColorPickerHandler.Parent = L2Hub.ScreenGui
	ColorPickerHandler.AnchorPoint = Vector2.new(0, 0)
	ColorPickerHandler.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	ColorPickerHandler.BackgroundTransparency = 0.035
	ColorPickerHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorPickerHandler.BorderSizePixel = 0
	ColorPickerHandler.ClipsDescendants = true
	ColorPickerHandler.Position = UDim2.new(255, 0, 255, 20)
	ColorPickerHandler.Size = UDim2.new(0, 200, 0, 240)
	ColorPickerHandler.ZIndex = ZIndex + 125

	L2Hub:AddSignal(ColorPickerHandler:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
		if ColorPickerHandler.BackgroundTransparency > 0.9 then
			ColorPickerHandler.Visible = false;
			ColorPickerHandler.Parent = nil
		else
			ColorPickerHandler.Visible = true;

			if L2Hub.Global3DRenderMode then
				ColorPickerHandler.Parent = L2Hub.GlobalSurfaceGui;
			else
				ColorPickerHandler.Parent = L2Hub.ScreenGui;
			end;
		end;
	end)));

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = ColorPickerHandler

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = ColorPickerHandler

	SaViMap.Name = L2Hub.RandomString();
	SaViMap.Parent = ColorPickerHandler
	SaViMap.AnchorPoint = Vector2.new(0.5, 0)
	SaViMap.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
	SaViMap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SaViMap.BorderSizePixel = 0
	SaViMap.Position = UDim2.new(0.5, 0, 0, 5)
	SaViMap.Size = UDim2.new(0, 185, 0, 185)
	SaViMap.ZIndex = ZIndex + 126
	SaViMap.Image = L2Hub.ImageColorMapping -- UNSAFE IMAGE

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = SaViMap

	ColorZoneSelection.Name = L2Hub.RandomString();
	ColorZoneSelection.Parent = SaViMap
	ColorZoneSelection.AnchorPoint = Vector2.new(0.5, 0.5)
	ColorZoneSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorZoneSelection.BackgroundTransparency = 1.000
	ColorZoneSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorZoneSelection.BorderSizePixel = 0
	ColorZoneSelection.Position = UDim2.new(0.5, 0, 0.5, 0)
	ColorZoneSelection.Size = UDim2.new(0, 10, 0, 10)
	ColorZoneSelection.ZIndex = ZIndex + 127

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = ColorZoneSelection

	UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
	UIStroke_2.Parent = ColorZoneSelection

	ColorMap.Name = L2Hub.RandomString();
	ColorMap.Parent = ColorPickerHandler
	ColorMap.AnchorPoint = Vector2.new(0.5, 0)
	ColorMap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorMap.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorMap.BorderSizePixel = 0
	ColorMap.Position = UDim2.new(0.5, 0, 0, 200)
	ColorMap.Size = UDim2.new(1, -15, 0, 10)
	ColorMap.ZIndex = ZIndex + 126

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 153, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(203, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(50, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 101, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(50, 0, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
	UIGradient.Parent = ColorMap

	UICorner_4.CornerRadius = UDim.new(0, 3)
	UICorner_4.Parent = ColorMap

	ColorMapSelection.Name = L2Hub.RandomString();
	ColorMapSelection.Parent = ColorMap
	ColorMapSelection.AnchorPoint = Vector2.new(0.5, 0.5)
	ColorMapSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ColorMapSelection.BackgroundTransparency = 1.000
	ColorMapSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ColorMapSelection.BorderSizePixel = 0
	ColorMapSelection.Position = UDim2.new(0, 0, 0.5, 0)
	ColorMapSelection.Size = UDim2.new(0, 5, 1, 0)
	ColorMapSelection.ZIndex = ZIndex + 126

	UIStroke_3.Thickness = 2.000
	UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
	UIStroke_3.Parent = ColorMapSelection

	UICorner_5.CornerRadius = UDim.new(0, 3)
	UICorner_5.Parent = ColorMapSelection

	RGBLabel.Name = L2Hub.RandomString();
	RGBLabel.Parent = ColorPickerHandler
	RGBLabel.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
	RGBLabel.BackgroundTransparency = 0.750
	RGBLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RGBLabel.BorderSizePixel = 0
	RGBLabel.Position = UDim2.new(0, 10, 0, 217)
	RGBLabel.Size = UDim2.new(1, -20, 0, 15)
	RGBLabel.ZIndex = ZIndex + 127
	RGBLabel.Font = Enum.Font.GothamBold
	RGBLabel.Text = "#FFFFFF"
	RGBLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	RGBLabel.TextSize = 12.000
	RGBLabel.TextTransparency = 0.400
	RGBLabel.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = RGBLabel

	ColorPickerLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			if L2Hub:MoreThanHalfY(HandleFrame.AbsolutePosition.Y + 150) then
			ColorPickerHandler.AnchorPoint = Vector2.new(0, 1)
	        ColorPickerHandler.Position = UDim2.new(0, HandleFrame.AbsolutePosition.X + 20, 0, HandleFrame.AbsolutePosition.Y - 5)
			else
			ColorPickerHandler.AnchorPoint = Vector2.new(0, 0)
			ColorPickerHandler.Position = UDim2.new(0, HandleFrame.AbsolutePosition.X + 20, 0, HandleFrame.AbsolutePosition.Y + 25)
			end;

			L2Hub.PlayAnimate(ColorPickerHandler,SlowyTween , {
				BackgroundTransparency = 0.035
			})

			L2Hub.PlayAnimate(UIStroke,SlowyTween , {
				Transparency = 0.650
			})

			L2Hub.PlayAnimate(SaViMap,SlowyTween , {
				BackgroundTransparency = 0,
				ImageTransparency = 0
			})

			L2Hub.PlayAnimate(UIStroke_2,SlowyTween , {
				Transparency = 0
			})

			L2Hub.PlayAnimate(ColorMap,SlowyTween , {
				BackgroundTransparency = 0
			})

			L2Hub.PlayAnimate(UIStroke_3,SlowyTween , {
				Transparency = 0
			})

			L2Hub.PlayAnimate(RGBLabel,SlowyTween , {
				BackgroundTransparency = 0.750,
				TextTransparency = 0.400
			})

			Shadow:Render(true)
		else
			L2Hub.PlayAnimate(ColorPickerHandler,SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke,SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(SaViMap,SlowyTween , {
				BackgroundTransparency = 1,
				ImageTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke_2,SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(ColorMap,SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke_3,SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(RGBLabel,SlowyTween , {
				BackgroundTransparency = 1,
				TextTransparency = 1
			})

			Shadow:Render(false)
		end;
	end);

	ColorPickerLib.SetRender(false);
	ColorPickerLib.Root = ColorPickerHandler;
	ColorPickerLib.H = 1;
	ColorPickerLib.S = 1;
	ColorPickerLib.V = 1;
	ColorPickerLib.Callback = EmptyFunction;

	function ColorPickerLib:Update()
		local RealColor = Color3.fromHSV(ColorPickerLib.H , ColorPickerLib.S , ColorPickerLib.V);

		L2Hub.PlayAnimate(ColorZoneSelection,ManualTween,{
			Position = UDim2.fromScale(ColorPickerLib.S , 1 - ColorPickerLib.V)
		});

		L2Hub.PlayAnimate(SaViMap,ManualTween,{
			BackgroundColor3 = Color3.fromHSV(ColorPickerLib.H , 1 , 1)
		});

		L2Hub.PlayAnimate(ColorMapSelection,ManualTween,{
			Position = UDim2.fromScale(ColorPickerLib.H,0.5)
		});

		RGBLabel.Text = "#"..RealColor:ToHex();

		ColorPickerLib.Callback(RealColor);
	end;

	function ColorPickerLib:SetValue(Color)
		if typeof(Color) == 'string' then
			Color = Color3.fromHex(Color);
		end;

		local H , S , V = Color:ToHSV();

		ColorPickerLib.H = H;
		ColorPickerLib.S = S;
		ColorPickerLib.V = V;

		ColorPickerLib:Update();
	end;

	ColorPickerLib.IsHold = false;

	L2Hub:AddSignal(ColorPickerHandler.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = true;
		end;
	end));

	L2Hub:AddSignal(ColorPickerHandler.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = false;
		end;
	end));

	L2Hub:AddSignal(ColorMap.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or ColorPickerLib.IsHold) do task.wait()
				local ColorY = ColorMap.AbsolutePosition.X
				local ColorYM = ColorY + ColorMap.AbsoluteSize.X;
				local Value = math.clamp(Mouse.X, ColorY, ColorYM)
				local Code = ((Value - ColorY) / (ColorYM - ColorY));

				ColorPickerLib.H = Code;
				ColorPickerLib:Update();
			end;
		end;
	end)));

	L2Hub:AddSignal(SaViMap.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			ColorPickerLib.IsHold = true;

			while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or ColorPickerLib.IsHold) do task.wait();
				local PosX = SaViMap.AbsolutePosition.X;
				local ScaleX = PosX + SaViMap.AbsoluteSize.X;
				local Value, PosY = math.clamp(Mouse.X, PosX, ScaleX), SaViMap.AbsolutePosition.Y;
				local ScaleY = PosY + SaViMap.AbsoluteSize.Y;
				local Vals = math.clamp(Mouse.Y, PosY, ScaleY);

				ColorPickerLib.S = (Value - PosX) / (ScaleX - PosX);
				ColorPickerLib.V = (1 - ((Vals - PosY) / (ScaleY - PosY)));
				ColorPickerLib:Update();
			end
		end
	end)));

	return ColorPickerLib;
end;

L2Hub.KeyEnum = {
	One = '1',
	Two = '2',
	Three = '3',
	Four = '4',
	Five = '5',
	Six = '6',
	Seven = '7',
	Eight = '8',
	Nine = '9',
	Zero = '0',
	['Minus'] = "-",
	['Plus'] = "+",
	BackSlash = "\\",
	Slash = "/",
	Period = '.',
	Semicolon = ';',
	Colon = ":",
	LeftControl = "LCtrl",
	RightControl = "RCtrl",
	LeftShift = "LShift",
	RightShift = "RShift",
	Return = "Enter",
	LeftBracket = "[",
	RightBracket = "]",
	Quote = "'",
	Comma = ",",
	Equals = "=",
	LeftSuper = "Super",
	RightSuper = "Super",
	LeftAlt = "LAlt",
	RightAlt = "RAlt",
	Escape = "Esc",
};

L2Hub.EnumReverse = {};

for i,v in next , L2Hub.KeyEnum do
	L2Hub.EnumReverse[v] = i;
end;

function L2Hub:NormalizeKeybindValue(K)
	if K == nil then
		return "None";
	end;

	if typeof(K) == "EnumItem" then
		return K.Name;
	end;

	if typeof(K) == "table" and K.Name ~= nil then
		return tostring(K.Name);
	end;

	return tostring(K);
end;

function L2Hub:KeyCodeToStr(K: Enum.KeyCode)
	local KeyName = L2Hub:NormalizeKeybindValue(K);

	if L2Hub.KeyEnum[KeyName] then
		return L2Hub.KeyEnum[KeyName];
	end;

	return KeyName;
end;

function L2Hub:StrToKeyCode(str: string)
	str = L2Hub:NormalizeKeybindValue(str);

	if L2Hub.EnumReverse[str] then
		return Enum.KeyCode[L2Hub.EnumReverse[str]];
	end;

	return Enum.KeyCode[str] or Enum.KeyCode.Unknown;
end;

function L2Hub:RegisiterHandler(Handler: Frame , Signal)
	local handle = {};
	local ZINdex = Handler.ZIndex;

	function handle:AddToggle(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = nil,
			Default = false,
			Type = "Switch",
			Icon = "check",
			Flag = nil,
			Key = nil,
			ConfigKey = nil,
			Locked = false,
			TextLocked = "Locked",
			Callback = EmptyFunction,
		});
		L2Hub:ResolveConfigFlag(Config);

		local IsCheckbox = string.lower(tostring(Config.Type)) == "checkbox";
		local Toggle = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Circle = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local CheckboxIcon = Instance.new("ImageLabel")
		local UIStroke = Instance.new("UIStroke")

		Toggle.Name = L2Hub.RandomString();
		Toggle.Parent = Handler
		Toggle.BackgroundColor3 = Color3.fromRGB(10, 13, 21)
		Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Toggle.BorderSizePixel = 0
		Toggle.ClipsDescendants = true
		Toggle.Size = IsCheckbox and UDim2.new(0, 18, 0, 18) or UDim2.new(0, 30, 0, 18)
		Toggle.ZIndex = ZINdex + 13
		Toggle.LayoutOrder = -(#Handler:GetChildren() + 5);

		UICorner.CornerRadius = IsCheckbox and UDim.new(0, 4) or UDim.new(1, 0)
		UICorner.Parent = Toggle

		UIStroke.Transparency = IsCheckbox and 0.650 or 1
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Toggle

		Circle.Name = L2Hub.RandomString();
		Circle.Parent = Toggle
		Circle.AnchorPoint = Vector2.new(0.5, 0.5)
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 0.500
		Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Circle.BorderSizePixel = 0
		Circle.Position = UDim2.new(0.300000012, 0, 0.5, 0)
		Circle.Size = IsCheckbox and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 16, 0, 16)
		Circle.Visible = not IsCheckbox
		Circle.ZIndex = ZINdex + 14

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = Circle

		CheckboxIcon.Name = L2Hub.RandomString();
		CheckboxIcon.Parent = Toggle
		CheckboxIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		CheckboxIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CheckboxIcon.BackgroundTransparency = 1.000
		CheckboxIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CheckboxIcon.BorderSizePixel = 0
		CheckboxIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
		CheckboxIcon.Size = UDim2.new(1, -4, 1, -4)
		CheckboxIcon.Visible = IsCheckbox
		CheckboxIcon.ZIndex = ZINdex + 14
		CheckboxIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
		CheckboxIcon.ImageTransparency = 1
		CheckboxIcon.ScaleType = Enum.ScaleType.Fit
		L2Hub:SetIconMode(CheckboxIcon, Config.Icon or "check")

		local ToggleLib = {
			Root = Toggle	
		};
		L2Hub:AttachLockMethods(ToggleLib, self.Root or Toggle, Config);

		ToggleLib.SetUI = LPH_NO_VIRTUALIZE(function(value)
			if IsCheckbox then
				if value then
					L2Hub.PlayAnimate(Toggle,SlowyTween,{
						BackgroundTransparency = 0,
						BackgroundColor3 = L2Hub.AccentColor
					})

					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 1
					})

					L2Hub.PlayAnimate(CheckboxIcon,SlowyTween,{
						TextTransparency = 0
					})
				else
					L2Hub.PlayAnimate(Toggle,SlowyTween,{
						BackgroundTransparency = 0,
						BackgroundColor3 = Color3.fromRGB(10, 13, 21)
					})

					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.650
					})

					L2Hub.PlayAnimate(CheckboxIcon,SlowyTween,{
						TextTransparency = 1
					})
				end;
			elseif value then
				L2Hub.PlayAnimate(Toggle,SlowyTween,{
					BackgroundTransparency = 0,
					BackgroundColor3 = L2Hub.AccentColor
				})

				L2Hub.PlayAnimate(Circle,SlowyTween,{
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0,
					Position = UDim2.new(0.7, 0, 0.5, 0)
				})
			else
				L2Hub.PlayAnimate(Toggle,SlowyTween,{
					BackgroundTransparency = 0,
					BackgroundColor3 = Color3.fromRGB(10, 13, 21)
				})

				L2Hub.PlayAnimate(Circle,SlowyTween,{
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.500,
					Position = UDim2.new(0.300000012, 0, 0.5, 0)
				})
			end;
		end);

		ToggleLib.SetVisible = LPH_NO_VIRTUALIZE(function(value)
			if value then
				ToggleLib.SetUI(Config.Default);
			else
				L2Hub.PlayAnimate(Toggle,SlowyTween,{
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(10, 13, 21)
				})

				L2Hub.PlayAnimate(Circle,SlowyTween,{
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.300000012, 0, 0.5, 0)
				})

				L2Hub.PlayAnimate(UIStroke,SlowyTween,{
					Transparency = 1
				})

				L2Hub.PlayAnimate(CheckboxIcon,SlowyTween,{
					TextTransparency = 1
				})
			end;
		end);

		ToggleLib.SetUI(Config.Default);
		ToggleLib.SetVisible(Signal:GetValue());

		L2Hub:CreateInput(Toggle , LPH_NO_VIRTUALIZE(function()
			Config.Default = not Config.Default;

			ToggleLib.SetUI(Config.Default);

			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default)
		end))

		ToggleLib.Signal = Signal:Connect(ToggleLib.SetVisible);

		function ToggleLib:GetValue()
			return Config.Default;
		end;

		function ToggleLib:SetValue(v)
			Config.Default = v == true;

			if Signal:GetValue() then
				ToggleLib.SetUI(Config.Default);
			end;

			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default)
			return ToggleLib;
		end;

		function ToggleLib:Toggle()
			ToggleLib:SetValue(not Config.Default);
			return ToggleLib;
		end;

		function ToggleLib:On()
			ToggleLib:SetValue(true);
			return ToggleLib;
		end;

		function ToggleLib:Off()
			ToggleLib:SetValue(false);
			return ToggleLib;
		end;

		function ToggleLib:SetCallback(fn)
			Config.Callback = fn or EmptyFunction;
			return ToggleLib;
		end;

		function ToggleLib:SetIcon(icon)
			Config.Icon = icon or Config.Icon;
			if IsCheckbox then
				L2Hub:SetIconMode(CheckboxIcon, Config.Icon);
			end;
			return ToggleLib;
		end;

		function ToggleLib:SetEnabled(value)
			Toggle.Visible = value ~= false;
			return ToggleLib;
		end;

		if Config.Flag then
			L2Hub:RegisterFlag(Config.Flag, ToggleLib);
		end;

		return CaseInsensitive(ToggleLib);
	end;

	function handle:AddSlider(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = nil,
			Default = 50,
			Min = 0,
			Max = 10,
			Type = "",
			Rounding = 0,
			Nums = {},
			Flag = nil,
			Key = nil,
			ConfigKey = nil,
			Locked = false,
			TextLocked = "Locked",
			Size = 125,
			Tooltip = false,
			Callback = EmptyFunction,
		});
		L2Hub:ResolveConfigFlag(Config);

		local SliderLib = {};

		SliderLib.GetSize = LPH_NO_VIRTUALIZE(function()
			return (Config.Default - Config.Min) / (Config.Max - Config.Min);
		end);

		local FullNumSize = TextService:GetTextSize(string.rep("0",(Config.Rounding + #tostring(Config.Max))+1)..tostring(Config.Type),10,Enum.Font.GothamBold,Vector2.new(math.huge,math.huge));

		SliderLib.MaximumSize = FullNumSize.X;

		if Config.Nums then
			local nszie = 0;

			for i,ns in next , Config.Nums do
				local size = TextService:GetTextSize(string.rep("m",string.len(tostring(ns))),10,Enum.Font.GothamBold,Vector2.new(math.huge,math.huge));

				if nszie < size.X then
					nszie = size.X;
				end
			end;

			if SliderLib.MaximumSize < nszie then
				SliderLib.MaximumSize = nszie;
			end;
		end;

		local Slider = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ValueFrame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ValueLabel = Instance.new("TextBox")
		local SlideMain = Instance.new("Frame")
		local SlideFrame = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local SlideMoving = Instance.new("Frame")
		local UICorner_4 = Instance.new("UICorner")
		local Frame = Instance.new("Frame")
		local UICorner_5 = Instance.new("UICorner")
		local boxSize = 2;
		local valueGap = 5;
		local TooltipEnabled = Config.Tooltip == true;
		local TooltipFrame;
		local TooltipCorner;
		local TooltipStroke;
		local TooltipLabel;

		Slider.Name = L2Hub.RandomString();
		Slider.Parent = Handler
		Slider.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		Slider.BackgroundTransparency = 1.000
		Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider.BorderSizePixel = 0
		Slider.ClipsDescendants = false
		Slider.Size = UDim2.new(0, Config.Size, 0, 18)
		Slider.ZIndex = ZINdex + 13
		Slider.LayoutOrder = -(#Handler:GetChildren() + 5);
		L2Hub:AttachLockMethods(SliderLib, self.Root or Slider, Config);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Slider

		ValueFrame.Name = L2Hub.RandomString();
		ValueFrame.Parent = Slider
		ValueFrame.AnchorPoint = Vector2.new(1, 0)
		ValueFrame.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		ValueFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueFrame.BorderSizePixel = 0
		ValueFrame.ClipsDescendants = true
		ValueFrame.Position = UDim2.new(1, 0, 0, 0)
		ValueFrame.Size = UDim2.new(0, SliderLib.MaximumSize + boxSize, 0, 18)
		ValueFrame.ZIndex = ZINdex + 13

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = ValueFrame

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = ValueFrame

		ValueLabel.Name = L2Hub.RandomString();
		ValueLabel.Parent = ValueFrame
		ValueLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.BackgroundTransparency = 1.000
		ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueLabel.BorderSizePixel = 0
		ValueLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ValueLabel.Size = UDim2.new(1, 0, 1, 0)
		ValueLabel.ZIndex = ZINdex + 14
		ValueLabel.Font = Enum.Font.GothamBold
		ValueLabel.Text = tostring(Config.Default)..tostring(Config.Type);
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 10.000
		ValueLabel.ClearTextOnFocus = false;
		ValueLabel.TextTransparency = 0.350

		SlideMain.Name = L2Hub.RandomString();
		SlideMain.Parent = Slider
		SlideMain.AnchorPoint = Vector2.new(0, 0.5)
		SlideMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SlideMain.BackgroundTransparency = 1.000
		SlideMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SlideMain.BorderSizePixel = 0
		SlideMain.Position = UDim2.new(0, 0, 0.5, 0)
		SlideMain.Size = UDim2.new(1, -((SliderLib.MaximumSize + boxSize + valueGap)), 0, 18)
		SlideMain.ZIndex = ZINdex + 13

		SlideFrame.Name = L2Hub.RandomString();
		SlideFrame.Parent = SlideMain
		SlideFrame.AnchorPoint = Vector2.new(0, 0.5)
		SlideFrame.BackgroundColor3 = Color3.fromRGB(30, 29, 36)
		SlideFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SlideFrame.BorderSizePixel = 0
		SlideFrame.Position = UDim2.new(0, 0, 0.5, 0)
		SlideFrame.Size = UDim2.new(1, 0, 0, 5)
		SlideFrame.ZIndex = ZINdex + 13

		UICorner_3.CornerRadius = UDim.new(1, 0)
		UICorner_3.Parent = SlideFrame

		SlideMoving.Name = L2Hub.RandomString();
		SlideMoving.Parent = SlideFrame
		SlideMoving.BackgroundColor3 = L2Hub.AccentColor
		SlideMoving.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SlideMoving.BorderSizePixel = 0
		SlideMoving.Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
		SlideMoving.ZIndex = ZINdex + 14

		UICorner_4.CornerRadius = UDim.new(1, 0)
		UICorner_4.Parent = SlideMoving

		Frame.Parent = SlideMoving
		Frame.AnchorPoint = Vector2.new(1, 0.5)
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(1, 5, 0.5, 0)
		Frame.Size = UDim2.new(0, 10, 0, 10)
		Frame.ZIndex = ZINdex + 15

		UICorner_5.CornerRadius = UDim.new(1, 0)
		UICorner_5.Parent = Frame

		local function EnsureSliderTooltip()
			if TooltipFrame then
				return;
			end;

			TooltipFrame = Instance.new("Frame");
			TooltipFrame.Name = L2Hub.RandomString();
			TooltipFrame.Parent = L2Hub.ScreenGui;
			TooltipFrame.AnchorPoint = Vector2.new(0.5, 1);
			TooltipFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
			TooltipFrame.BackgroundTransparency = 1;
			TooltipFrame.BorderSizePixel = 0;
			TooltipFrame.ClipsDescendants = true;
			TooltipFrame.Position = UDim2.fromOffset(0, 0);
			TooltipFrame.Size = UDim2.fromOffset(40, 22);
			TooltipFrame.Visible = false;
			TooltipFrame.ZIndex = ZINdex + 200;

			TooltipCorner = Instance.new("UICorner");
			TooltipCorner.CornerRadius = UDim.new(0, 5);
			TooltipCorner.Parent = TooltipFrame;

			TooltipStroke = Instance.new("UIStroke");
			TooltipStroke.Color = Color3.fromRGB(45, 48, 58);
			TooltipStroke.Transparency = 1;
			TooltipStroke.Parent = TooltipFrame;

			TooltipLabel = Instance.new("TextLabel");
			TooltipLabel.Name = L2Hub.RandomString();
			TooltipLabel.Parent = TooltipFrame;
			TooltipLabel.BackgroundTransparency = 1;
			TooltipLabel.BorderSizePixel = 0;
			TooltipLabel.Position = UDim2.fromOffset(6, 0);
			TooltipLabel.Size = UDim2.new(1, -12, 1, 0);
			TooltipLabel.ZIndex = TooltipFrame.ZIndex + 1;
			TooltipLabel.Font = Enum.Font.GothamBold;
			TooltipLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
			TooltipLabel.TextSize = 11;
			TooltipLabel.TextTransparency = 1;
			TooltipLabel.TextXAlignment = Enum.TextXAlignment.Center;
		end;

		local function UpdateSliderTooltip()
			if not TooltipFrame or not TooltipLabel then
				return;
			end;

			TooltipLabel.Text = ValueLabel.Text;
			local TextSize = TextService:GetTextSize(TooltipLabel.Text, TooltipLabel.TextSize, TooltipLabel.Font, Vector2.new(math.huge, math.huge));
			TooltipFrame.Size = UDim2.fromOffset(math.max(34, TextSize.X + 14), 22);
			TooltipFrame.Position = UDim2.fromOffset(Frame.AbsolutePosition.X + (Frame.AbsoluteSize.X / 2), Frame.AbsolutePosition.Y - 2);
		end;

		local function SetSliderTooltipRender(value)
			if not TooltipEnabled or not value then
				if TooltipFrame then
					L2Hub.PlayAnimate(TooltipFrame, SlowyTween, {
						BackgroundTransparency = 1,
					});
					L2Hub.PlayAnimate(TooltipStroke, SlowyTween, {
						Transparency = 1,
					});
					L2Hub.PlayAnimate(TooltipLabel, SlowyTween, {
						TextTransparency = 1,
					});
					task.delay(0.18, function()
						if TooltipFrame and TooltipFrame.BackgroundTransparency > 0.95 then
							TooltipFrame.Visible = false;
						end;
					end);
				end;

				return;
			end;

			EnsureSliderTooltip();
			UpdateSliderTooltip();
			TooltipFrame.Visible = true;

			L2Hub.PlayAnimate(TooltipFrame, SlowyTween, {
				BackgroundTransparency = 0.075,
			});
			L2Hub.PlayAnimate(TooltipStroke, SlowyTween, {
				Transparency = 0.650,
			});
			L2Hub.PlayAnimate(TooltipLabel, SlowyTween, {
				TextTransparency = 0.200,
			});
		end;

		local LoadText = LPH_NO_VIRTUALIZE(function()
			if Config.Nums[Config.Default] then
				ValueLabel.Text = Config.Nums[Config.Default]

			else
				ValueLabel.Text = tostring(Config.Default)..tostring(Config.Type);

			end;

			UpdateSliderTooltip();
		end);

		ValueLabel.FocusLost:Connect(LPH_NO_VIRTUALIZE(function()
			local OutVal = L2Hub:ParseInput(ValueLabel.Text , true);
			if OutVal then
				local rx = math.clamp(OutVal , Config.Min , Config.Max);
				local Value = L2Hub.Rounding(rx,Config.Rounding);

				if Value then
					Config.Default = Value;

					TweenService:Create(SlideMoving , ManualTween ,{
						Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
					}):Play();

					LoadText();

					L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default)
				else
					LoadText();
				end;

			else
				LoadText()
			end;
		end));

		SliderLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(ValueFrame,SlowyTween,{
					BackgroundTransparency = 0,
					Size = UDim2.new(0, SliderLib.MaximumSize + boxSize, 0, 18)
				});

				L2Hub.PlayAnimate(UIStroke,SlowyTween,{
					Transparency = 0.650
				});

				L2Hub.PlayAnimate(ValueLabel,SlowyTween,{
					TextTransparency = 0.350
				});

				L2Hub.PlayAnimate(SlideFrame,SlowyTween,{
					BackgroundTransparency = 0
				});

				L2Hub.PlayAnimate(SlideMoving,SlowyTween,{
					BackgroundTransparency = 0,
					Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
				});

				L2Hub.PlayAnimate(Frame,SlowyTween,{
					BackgroundTransparency = 0
				});
			else
				SetSliderTooltipRender(false);

				L2Hub.PlayAnimate(ValueFrame,SlowyTween,{
					BackgroundTransparency = 1,
				});

				L2Hub.PlayAnimate(UIStroke,SlowyTween,{
					Transparency = 1
				});

				L2Hub.PlayAnimate(ValueLabel,SlowyTween,{
					TextTransparency = 1
				});

				L2Hub.PlayAnimate(SlideFrame,SlowyTween,{
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(SlideMoving,SlowyTween,{
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0)
				});

				L2Hub.PlayAnimate(Frame,SlowyTween,{
					BackgroundTransparency = 1
				});
			end;
		end);

		SliderLib.SetRender(Signal:GetValue());
		SliderLib.Signal = Signal:Connect(SliderLib.SetRender);

		local Update = function(Input)
			local SizeScale = math.clamp((((Input.Position.X) - SlideMain.AbsolutePosition.X) / SlideMain.AbsoluteSize.X), 0, 1);
			local Main = ((Config.Max - Config.Min) * SizeScale) + Config.Min;
			local Value = L2Hub.Rounding(Main,Config.Rounding);
			local PositionX = UDim2.fromScale(SizeScale, 1);
			local Size = ((Value - Config.Min) / (Config.Max - Config.Min)) + 0.02;

			Config.Default = Value;

			TweenService:Create(SlideMoving , ManualTween ,{
				Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
			}):Play();

			LoadText()


			L2Hub:FireCallback(Config.Callback, Config.Name, Value)
		end;

		local IsHold = false;

		do
			L2Hub:AddSignal(SlideMain.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
				SetSliderTooltipRender(true);
			end)));

			L2Hub:AddSignal(SlideMain.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
				if not IsHold then
					SetSliderTooltipRender(false);
				end;
			end)));

			SlideMain.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					IsHold = true
					Update(Input)
					SetSliderTooltipRender(true);
				end
			end))

			SlideMain.InputEnded:Connect(LPH_NO_VIRTUALIZE(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if UserInputService.TouchEnabled then
						if not L2Hub:IsMouseOverFrame(SlideMain) then
							IsHold = false
						end;
					else
						IsHold = false
					end;

					if not IsHold and not L2Hub:IsMouseOverFrame(SlideMain) then
						SetSliderTooltipRender(false);
					end;
				end
			end))

			UserInputService.InputChanged:Connect(LPH_NO_VIRTUALIZE(function(Input)
				if IsHold then
					if (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)  then
						if UserInputService.TouchEnabled then
							if not L2Hub:IsMouseOverFrame(SlideMain) then
								IsHold = false
							else
								Update(Input)
								UpdateSliderTooltip();
							end;
						else
							Update(Input)
							UpdateSliderTooltip();
						end;
					end;
				end;
			end));
		end;

		function SliderLib:GetValue()
			return Config.Default;
		end;

		function SliderLib:SetValue(v)
			local NumericValue = tonumber(v);
			if not NumericValue then
				return SliderLib;
			end;

			Config.Default = L2Hub.Rounding(math.clamp(NumericValue, Config.Min, Config.Max),Config.Rounding);

			if Signal:GetValue() then
				L2Hub.PlayAnimate(SlideMoving,SlowyTween,{
					BackgroundTransparency = 0,
					Size = UDim2.new(SliderLib.GetSize(), 0, 1, 0)
				});
			end;

			LoadText()

			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
			return SliderLib;
		end;

		function SliderLib:SetRange(min,max)
			Config.Min = tonumber(min) or Config.Min;
			Config.Max = tonumber(max) or Config.Max;

			if Config.Min > Config.Max then
				Config.Min, Config.Max = Config.Max, Config.Min;
			end;

			SliderLib:SetValue(Config.Default);
			return SliderLib;
		end;

		function SliderLib:SetMin(min)
			return SliderLib:SetRange(min,Config.Max);
		end;

		function SliderLib:SetMax(max)
			return SliderLib:SetRange(Config.Min,max);
		end;

		function SliderLib:SetCallback(fn)
			Config.Callback = fn or EmptyFunction;
			return SliderLib;
		end;

		function SliderLib:SetSuffix(suffix)
			Config.Type = tostring(suffix or "");
			LoadText();
			return SliderLib;
		end;

		function SliderLib:SetTooltip(value)
			TooltipEnabled = value == true;
			Config.Tooltip = TooltipEnabled;

			if not TooltipEnabled then
				SetSliderTooltipRender(false);
			end;

			return SliderLib;
		end;

		function SliderLib:SetEnabled(value)
			Slider.Visible = value ~= false;
			return SliderLib;
		end;

		if Config.Flag then
			L2Hub:RegisterFlag(Config.Flag, SliderLib);
		end;

		return CaseInsensitive(SliderLib);
	end;

	function handle:AddOption(GearIcon)
		local Option = Instance.new("Frame")
		local Icon = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")

		Option.Name = L2Hub.RandomString();
		Option.Parent = Handler
		Option.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
		Option.BackgroundTransparency = 1.000
		Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Option.BorderSizePixel = 0
		Option.ClipsDescendants = true
		Option.Size = UDim2.new(0, 20, 0, 18)
		Option.ZIndex = ZINdex + 13
		Option.LayoutOrder = -(#Handler:GetChildren() + 5);

		Icon.Name = L2Hub.RandomString();
		Icon.Parent = Option
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.ZIndex = ZINdex + 14
		L2Hub:SetIconMode(Icon, (GearIcon == 1 and 'gear') or (GearIcon == 2 and 'chevron-large-right') or "three-dots-horizontal");
		Icon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		Icon.ImageTransparency = 0.400
		Icon.ScaleType = Enum.ScaleType.Fit

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Option

		local Window = L2Hub:CreateOptionWindow(Option , ZINdex + 13);
		local reciveSignal;

		Window.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 0.400
				})
			else
				L2Hub.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 1
				})
			end;
		end);

		Window.SetRender(Signal:GetValue());
		Signal:Connect(Window.SetRender);

		local bthg = L2Hub:CreateInput(Option , LPH_NO_VIRTUALIZE(function()
			if reciveSignal then
				reciveSignal:Disconnect();
				reciveSignal = nil;	
			end;

			Window.Signal:SetValue(true);

			reciveSignal = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not L2Hub:IsMouseOverFrame(Window.Root) and not L2Hub:IsMouseOverFrame(Option) then
						if reciveSignal then
							reciveSignal:Disconnect();
							reciveSignal = nil;	
						end;

						Window.Signal:SetValue(false);
					end
				end
			end)
		end));

		L2Hub:AddSignal(bthg.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(Option , SlowyTween , {
				BackgroundTransparency = 0.5
			})

			L2Hub.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.25
			})
		end)));

		L2Hub:AddSignal(bthg.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(Option , SlowyTween , {
				BackgroundTransparency = 1.000
			})

			L2Hub.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.400
			})
		end)));

		return CaseInsensitive(Window);
	end;

	function handle:AddColorPicker(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = nil,
			Default = Color3.fromRGB(255, 255, 255),
			Flag = nil,
			Key = nil,
			ConfigKey = nil,
			Locked = false,
			TextLocked = "Locked",
			Callback  = EmptyFunction,
		});
		L2Hub:ResolveConfigFlag(Config);

		if typeof(Config.Default) == 'string' then
			Config.Default = Color3.fromHex(Config.Default:gsub('#',''));
		end;

		local ColorPickerLib = {};
		local ColorPicker = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ImageLabel = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")

		ColorPicker.Name = L2Hub.RandomString();
		ColorPicker.Parent = Handler
		ColorPicker.BackgroundColor3 = Config.Default;
		ColorPicker.BackgroundTransparency = 0
		ColorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorPicker.BorderSizePixel = 0
		ColorPicker.ClipsDescendants = true
		ColorPicker.Size = UDim2.new(0, 18, 0, 18)
		ColorPicker.ZIndex = ZINdex + 13
		L2Hub:AttachLockMethods(ColorPickerLib, self.Root or ColorPicker, Config);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = ColorPicker

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = ColorPicker

		ImageLabel.Parent = ColorPicker
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.ZIndex = ZINdex + 11
		ImageLabel.Image = "rbxasset://textures/meshPartFallback.png"
		ImageLabel.ImageTransparency = 0.9
		ImageLabel.BackgroundTransparency = 1;
		ImageLabel.ScaleType = Enum.ScaleType.Crop

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = ImageLabel

		local BackendM = L2Hub:CreateColorPicker(ColorPicker);

		BackendM:SetValue(Config.Default)
		BackendM.Callback = function(color)
			ColorPicker.BackgroundColor3 = color;
			Config.Default = color;
			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
		end;

		local signal;
		L2Hub:CreateInput(ColorPicker , LPH_NO_VIRTUALIZE(function()
			if signal then
				signal:Disconnect();
				signal = nil;
			end;

			BackendM.SetRender(true);

			signal = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not L2Hub:IsMouseOverFrame(ColorPicker) and not L2Hub:IsMouseOverFrame(BackendM.Root) then
						if signal then
							signal:Disconnect();
							signal = nil;
						end;

						BackendM.SetRender(false);
					end;
				end;
			end)
		end));

		ColorPickerLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(ColorPicker , SlowyTween , {
					BackgroundTransparency = 0
				})

				L2Hub.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 0.650
				})

				L2Hub.PlayAnimate(ImageLabel , SlowyTween , {
					ImageTransparency = 0.9
				})
			else
				L2Hub.PlayAnimate(ColorPicker , SlowyTween , {
					BackgroundTransparency = 1
				})

				L2Hub.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 1
				})

				L2Hub.PlayAnimate(ImageLabel , SlowyTween , {
					ImageTransparency = 1
				})
			end;
		end);

		ColorPickerLib.SetRender(Signal:GetValue());
		Signal:Connect(ColorPickerLib.SetRender);

		function ColorPickerLib:GetValue()
			return Config.Default;
		end;

		function ColorPickerLib:SetValue(v)
			Config.Default = v;
			BackendM:SetValue(Config.Default)
			return ColorPickerLib;
		end;

		function ColorPickerLib:GetHex()
			return Config.Default:ToHex();
		end;

		function ColorPickerLib:SetHex(hex)
			ColorPickerLib:SetValue(Color3.fromHex(tostring(hex):gsub("#","")));
			return ColorPickerLib;
		end;

		function ColorPickerLib:SetCallback(fn)
			Config.Callback = fn or EmptyFunction;
			BackendM.Callback = function(color)
				ColorPicker.BackgroundColor3 = color;
				Config.Default = color;
				L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
			end;
			return ColorPickerLib;
		end;

		function ColorPickerLib:SetEnabled(value)
			ColorPicker.Visible = value ~= false;
			return ColorPickerLib;
		end;

		if Config.Flag then
			L2Hub:RegisterFlag(Config.Flag, ColorPickerLib);
		end;

		return CaseInsensitive(ColorPickerLib);
	end;

	function handle:AddKeybind(Config)
		Config = L2Hub:ProcessParams(Config,{
			Name = nil,
			Default = nil,
			Mode = "Toggle",
			ModeFlag = nil,
			ChangedCallback = nil,
			ModeChangedCallback = nil,
			Blacklist = {},
			Callback = EmptyFunction,
			Flag = nil,
			Key = nil,
			ConfigKey = nil,
			Locked = false,
			TextLocked = "Locked",
		});
		L2Hub:ResolveConfigFlag(Config);
		Config.Default = L2Hub:NormalizeKeybindValue(Config.Default);
		Config.Mode = string.lower(tostring(Config.Mode or "Toggle")) == "hold" and "Hold" or "Toggle";
		Config.ChangedCallback = Config.ChangedCallback or Config.OnChanged or EmptyFunction;
		Config.ModeChangedCallback = Config.ModeChangedCallback or Config.OnModeChanged or EmptyFunction;
		local ModeFlag = Config.ModeFlag or Config.ModeKey or Config.ModeConfigKey;
		if ModeFlag ~= nil then
			Config.ModeFlag = tostring(ModeFlag);
		end;

		local KeybindLib = {};
		local ToggleState = false;
		local HoldState = false;

		local Keybind = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local ValueLabel = Instance.new("TextLabel")

		Keybind.Name = L2Hub.RandomString();
		Keybind.Parent = Handler
		Keybind.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind.BorderSizePixel = 0
		Keybind.ClipsDescendants = true
		Keybind.Size = UDim2.new(0, 45, 0, 18)
		Keybind.ZIndex = ZINdex + 13
		L2Hub:AttachLockMethods(KeybindLib, self.Root or Keybind, Config);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Keybind

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Keybind

		ValueLabel.Name = L2Hub.RandomString();
		ValueLabel.Parent = Keybind
		ValueLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.BackgroundTransparency = 1.000
		ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ValueLabel.BorderSizePixel = 0
		ValueLabel.ClipsDescendants = true
		ValueLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ValueLabel.Size = UDim2.new(1, 0, 1, 0)
		ValueLabel.ZIndex = ZINdex + 14
		ValueLabel.Font = Enum.Font.GothamBold
		ValueLabel.Text = L2Hub:KeyCodeToStr(Config.Default or "None")
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 10.000
		ValueLabel.TextTransparency = 0.500

		KeybindLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(Keybind,SlowyTween, {
					BackgroundTransparency = 0
				})

				L2Hub.PlayAnimate(UIStroke,SlowyTween, {
					Transparency = 0.650
				})

				L2Hub.PlayAnimate(ValueLabel,SlowyTween, {
					TextTransparency = 0.500
				})
			else
				L2Hub.PlayAnimate(Keybind,SlowyTween, {
					BackgroundTransparency = 1
				})

				L2Hub.PlayAnimate(UIStroke,SlowyTween, {
					Transparency = 1
				})

				L2Hub.PlayAnimate(ValueLabel,SlowyTween, {
					TextTransparency = 1
				})
			end;
		end);

		function KeybindLib:Update()
			local size = TextService:GetTextSize(ValueLabel.Text,ValueLabel.TextSize,ValueLabel.Font,Vector2.new(math.huge,math.huge));

			L2Hub.PlayAnimate(Keybind , SlowyTween , {
				Size = UDim2.new(0, size.X + 7, 0, 18)
			})
		end;

		local IsBlacklist = LPH_NO_VIRTUALIZE(function(v)
			return Config.Blacklist and (Config.Blacklist[v] or table.find(Config.Blacklist,v))
		end);

		KeybindLib:Update()

		KeybindLib.SetRender(Signal:GetValue());
		Signal:Connect(KeybindLib.SetRender);

		local IsBinding = false;
		local function FireAction(state)
			L2Hub:FireCallback(Config.Callback, Config.Name, state, Config.Default, Config.Mode);
		end;

		local function IsSameKey(Input)
			if not Config.Default or Config.Default == "None" then
				return false;
			end;

			if Config.Default == "M1B" then
				return Input.UserInputType == Enum.UserInputType.MouseButton1;
			elseif Config.Default == "M2B" then
				return Input.UserInputType == Enum.UserInputType.MouseButton2;
			end;

			local KeyCode = L2Hub:StrToKeyCode(Config.Default);
			return KeyCode and Input.KeyCode == KeyCode;
		end;

		L2Hub:CreateInput(Keybind , function()
			if IsBinding then
				return;
			end;

			IsBinding = true;

			ValueLabel.Text = "...";

			KeybindLib:Update();

			local Selected = nil;

			while not Selected do
				local Key = UserInputService.InputBegan:Wait();

				if Key.KeyCode ~= Enum.KeyCode.Unknown and not IsBlacklist(Key.KeyCode) and not IsBlacklist(Key.KeyCode.Name) then
					Selected = Key.KeyCode;
				else
					if Key.UserInputType == Enum.UserInputType.MouseButton1 and not IsBlacklist(Enum.UserInputType.MouseButton1) and not IsBlacklist("M1B") then
						Selected = "M1B";
					elseif Key.UserInputType == Enum.UserInputType.MouseButton2 and not IsBlacklist(Enum.UserInputType.MouseButton2) and not IsBlacklist("M2B") then
						Selected = "M2B";
					end;
				end;
			end;

			IsBinding = false;

			local KeyName = L2Hub:NormalizeKeybindValue(Selected);

			Config.Default = KeyName;

			ValueLabel.Text = L2Hub:KeyCodeToStr(KeyName);

			KeybindLib:Update();

			L2Hub:FireCallback(Config.ChangedCallback, Config.Name, KeyName);
			L2Hub:FireCallback(Config.Callback, Config.Name, KeyName, "Changed", Config.Mode);
		end)

		L2Hub:AddSignal(UserInputService.InputBegan:Connect(function(Input, IsTyping)
			if IsTyping or IsBinding or (KeybindLib.GetLocked and KeybindLib:GetLocked()) then
				return;
			end;

			if not IsSameKey(Input) then
				return;
			end;

			if Config.Mode == "Hold" then
				if not HoldState then
					HoldState = true;
					FireAction(true);
				end;
			else
				ToggleState = not ToggleState;
				FireAction(ToggleState);
			end;
		end))

		L2Hub:AddSignal(UserInputService.InputEnded:Connect(function(Input)
			if Config.Mode ~= "Hold" or not HoldState or not IsSameKey(Input) then
				return;
			end;

			HoldState = false;
			FireAction(false);
		end))

		function KeybindLib:GetValue()
			return Config.Default;
		end;

		function KeybindLib:SetValue(v)
			Config.Default = L2Hub:NormalizeKeybindValue(v);
			ValueLabel.Text = L2Hub:KeyCodeToStr(Config.Default);
			KeybindLib:Update();
			L2Hub:FireCallback(Config.ChangedCallback, Config.Name, Config.Default);
			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default, "Changed", Config.Mode);
			return KeybindLib;
		end;

		function KeybindLib:SetMode(mode)
			local NextMode = string.lower(tostring(mode or "Toggle")) == "hold" and "Hold" or "Toggle";
			if Config.Mode == NextMode then
				return KeybindLib;
			end;

			if HoldState then
				HoldState = false;
				FireAction(false);
			end;

			Config.Mode = NextMode;
			ToggleState = false;
			L2Hub:FireCallback(Config.ModeChangedCallback, Config.Name, Config.Mode);
			return KeybindLib;
		end;

		function KeybindLib:GetMode()
			return Config.Mode;
		end;

		function KeybindLib:GetActionState()
			return Config.Mode == "Hold" and HoldState or ToggleState;
		end;

		function KeybindLib:SetCallback(fn)
			Config.Callback = fn or EmptyFunction;
			return KeybindLib;
		end;

		function KeybindLib:SetBlacklist(list)
			Config.Blacklist = list or {};
			return KeybindLib;
		end;

		function KeybindLib:GetKeyCode()
			return L2Hub:StrToKeyCode(Config.Default);
		end;

		function KeybindLib:SetEnabled(value)
			Keybind.Visible = value ~= false;
			return KeybindLib;
		end;

		if Config.Flag then
			L2Hub:RegisterFlag(Config.Flag, KeybindLib);
		end;

		if Config.ModeFlag then
			L2Hub:RegisterFlag(Config.ModeFlag, {
				GetValue = function()
					return KeybindLib:GetMode();
				end,
				SetValue = function(_, value)
					return KeybindLib:SetMode(value);
				end,
			});
		end;

		return CaseInsensitive(KeybindLib);
	end;

	function handle:AddTextInput(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = nil,
			Default = "",
			Placeholder = "Placeholder",
			Callback = print,
			Flag = nil,
			Key = nil,
			ConfigKey = nil,
			Locked = false,
			TextLocked = "Locked",
			Size = 100,
			Height = nil,
			Type = "TextInput",
			Numeric = false,
			FullWidth = false,
		});
		L2Hub:ResolveConfigFlag(Config);
		local IsTextarea = string.lower(tostring(Config.Type or "TextInput")) == "textarea";
		if IsTextarea then
			Config.Numeric = false;
		end;
		local InputHeight = Config.Height or (IsTextarea and 72 or 18);
		local GetInputSize = LPH_NO_VIRTUALIZE(function()
			if Config.FullWidth then
				return UDim2.new(1, 0, 0, InputHeight);
			end;

			return UDim2.new(0, Config.Size, 0, InputHeight);
		end);

		local TextBoxLib = {};

		local TextInput = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local TextBox = Instance.new("TextBox")

		TextInput.Name = L2Hub.RandomString();
		TextInput.Parent = Handler
		TextInput.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		TextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextInput.BorderSizePixel = 0
		TextInput.ClipsDescendants = true
		TextInput.Size = GetInputSize()
		TextInput.ZIndex = ZINdex + 13
		L2Hub:AttachLockMethods(TextBoxLib, self.Root or TextInput, Config);

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = TextInput

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = TextInput

		TextBox.Parent = TextInput
		TextBox.AnchorPoint = IsTextarea and Vector2.new(0, 0) or Vector2.new(0, 0.5)
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = IsTextarea and UDim2.new(0, 6, 0, 5) or UDim2.new(0, 5, 0.5, 0)
		TextBox.Size = IsTextarea and UDim2.new(1, -12, 1, -10) or UDim2.new(1, -5, 0, 17)
		TextBox.ZIndex = ZINdex + 14
		TextBox.ClearTextOnFocus = false
		TextBox.Font = Enum.Font.GothamBold
		TextBox.PlaceholderText = Config.Placeholder
		TextBox.Text = tostring(Config.Default)
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 11.000
		TextBox.TextTransparency = 0.350
		TextBox.TextXAlignment = Enum.TextXAlignment.Left
		TextBox.TextYAlignment = IsTextarea and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
		TextBox.TextWrapped = IsTextarea
		TextBox.MultiLine = IsTextarea

		TextBoxLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(TextInput , SlowyTween ,{
					BackgroundTransparency = 0
				})	

				L2Hub.PlayAnimate(UIStroke , SlowyTween ,{
					Transparency = 0.650
				})	

				L2Hub.PlayAnimate(TextBox , SlowyTween ,{
					TextTransparency = 0.350
				})	
			else
				L2Hub.PlayAnimate(TextInput , SlowyTween ,{
					BackgroundTransparency = 1
				})	

				L2Hub.PlayAnimate(UIStroke , SlowyTween ,{
					Transparency = 1
				})	

				L2Hub.PlayAnimate(TextBox , SlowyTween ,{
					TextTransparency = 1
				})
			end;
		end);

		L2Hub:AddSignal(TextBox:GetPropertyChangedSignal('Text'):Connect(LPH_NO_VIRTUALIZE(function()
			local valout = L2Hub:ParseInput(TextBox.Text , Config.Numeric);

			if Config.Numeric then
				TextBox.Text = string.gsub(TextBox.Text , '[^0-9.]','')
			end;

			if valout then
				Config.Default = valout;
				L2Hub:FireCallback(Config.Callback, Config.Name, valout);
			end
		end)));

		TextBoxLib.SetRender(Signal:GetValue());
		Signal:Connect(TextBoxLib.SetRender);

		function TextBoxLib:GetValue()
			return Config.Default;
		end;

		function TextBoxLib:SetValue(v)
			Config.Default = v;
			TextBox.Text = tostring(v);
			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
			return TextBoxLib;
		end;

		function TextBoxLib:Clear()
			TextBoxLib:SetValue("");
			return TextBoxLib;
		end;

		function TextBoxLib:SetPlaceholder(text)
			Config.Placeholder = tostring(text or "");
			TextBox.PlaceholderText = Config.Placeholder;
			return TextBoxLib;
		end;

		function TextBoxLib:SetNumeric(value)
			Config.Numeric = value == true;
			if Config.Numeric then
				Config.Type = "TextInput";
				TextBoxLib:SetType("TextInput");
			end;
			return TextBoxLib;
		end;

		function TextBoxLib:SetType(inputType)
			Config.Type = tostring(inputType or "TextInput");
			IsTextarea = string.lower(Config.Type) == "textarea";
			if IsTextarea then
				Config.Numeric = false;
			end;

			InputHeight = Config.Height or (IsTextarea and 72 or 18);
			TextInput.Size = GetInputSize();
			TextBox.AnchorPoint = IsTextarea and Vector2.new(0, 0) or Vector2.new(0, 0.5);
			TextBox.Position = IsTextarea and UDim2.new(0, 6, 0, 5) or UDim2.new(0, 5, 0.5, 0);
			TextBox.Size = IsTextarea and UDim2.new(1, -12, 1, -10) or UDim2.new(1, -5, 0, 17);
			TextBox.TextYAlignment = IsTextarea and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center;
			TextBox.TextWrapped = IsTextarea;
			TextBox.MultiLine = IsTextarea;
			return TextBoxLib;
		end;

		function TextBoxLib:SetHeight(height)
			Config.Height = tonumber(height) or Config.Height;
			InputHeight = Config.Height or (IsTextarea and 72 or 18);
			TextInput.Size = GetInputSize();
			return TextBoxLib;
		end;

		function TextBoxLib:SetCallback(fn)
			Config.Callback = fn or EmptyFunction;
			return TextBoxLib;
		end;

		function TextBoxLib:Focus()
			TextBox:CaptureFocus();
			return TextBoxLib;
		end;

		function TextBoxLib:SetEnabled(value)
			TextInput.Visible = value ~= false;
			return TextBoxLib;
		end;

		if Config.Flag then
			L2Hub:RegisterFlag(Config.Flag, TextBoxLib);
		end;

		return CaseInsensitive(TextBoxLib);
	end;

	-- Alias: :AddInput() → same as :AddTextInput()
	handle.AddInput = handle.AddTextInput;

function handle:AddDropdown(Config)
	Config = L2Hub:ProcessParams(Config , {
		Name = nil,
		Default = nil,
		Values = {},
		Multi = false,
		Callback = EmptyFunction,
		AutoUpdate = false,
		Flag = nil,
		Key = nil,
		ConfigKey = nil,
		Locked = false,
		TextLocked = "Locked",
		Size = 100,
		Search = true,
		Position = "Dropdown",
		Placement = nil,
		DropdownPosition = nil,
		PopupPosition = nil,
		OptionsIcon = {},
		DisabledOptions = {},
		AllowNil = false,
		AutoSelectFirst = false,
		ValidateValue = true,
		RefreshInterval = nil,
		OptionsProvider = nil,
	})
	L2Hub:ResolveConfigFlag(Config);

	Config.Default = L2Hub.ProcessDropdown(Config.Default);
	Config.OptionsIcon = Config.OptionsIcon or Config.OptionIcons or Config.Icons or {};
	Config.DisabledOptions = Config.DisabledOptions or Config.Disabled or {};
	Config.AllowNil = Config.AllowNil == true;
	Config.AutoSelectFirst = Config.AutoSelectFirst == true;
	Config.ValidateValue = Config.ValidateValue ~= false;
	Config.DropdownPosition = Config.DropdownPosition or Config.PopupPosition or Config.Placement or Config.Position;

	local function NormalizeOptionMap(source)
		local Map = {};
		if typeof(source) == "string" or typeof(source) == "number" then
			Map[tostring(source)] = true;
			return Map;
		end;
		if typeof(source) ~= "table" then return Map; end;
		for key,value in next, source do
			if typeof(key) == "number" then
				Map[tostring(value)] = true;
			elseif value == true then
				Map[tostring(key)] = true;
			end;
		end;
		return Map;
	end;

	local function NormalizeIconMap(source)
		local Map = {};
		if typeof(source) ~= "table" then return Map; end;
		for key,value in next, source do
			if typeof(key) ~= "number" and value ~= nil then
				Map[tostring(key)] = value;
			elseif typeof(value) == "table" and value.Value and value.Icon then
				Map[tostring(value.Value)] = value.Icon;
			end;
		end;
		return Map;
	end;

	local DisabledMap = NormalizeOptionMap(Config.DisabledOptions);
	local IconMap = NormalizeIconMap(Config.OptionsIcon);

	local function GetFirstDropdownValue()
		for _,Value in next, Config.Values do
			return Value;
		end;
	end;

	local function HasDropdownValue(value)
		for _,Option in next, Config.Values do
			if Option == value then return true; end;
		end;
		return false;
	end;

	local function ResolveSingleDropdownValue(value)
		if value == nil then
			if Config.AutoSelectFirst then return GetFirstDropdownValue(); end;
			return nil;
		end;
		if Config.ValidateValue and not HasDropdownValue(value) then
			if Config.AutoSelectFirst then return GetFirstDropdownValue(); end;
			return nil;
		end;
		return value;
	end;

	local function ShouldFireDropdownCallback(value)
		return Config.Multi or value ~= nil or Config.AllowNil;
	end;

	local function ResolveMultiDropdownValue(value)
		local Processed = L2Hub.ProcessDropdown(value);
		if typeof(Processed) == "table" then return Processed; end;
		if Processed ~= nil then return { [Processed] = true }; end;
		return {};
	end;

	if Config.Multi then
		Config.Default = ResolveMultiDropdownValue(Config.Default);
	else
		Config.Default = ResolveSingleDropdownValue(Config.Default);
	end;

	local Dropdown = Instance.new("Frame")
	local DropdownIcon = Instance.new("ImageLabel")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local BasedLabel = Instance.new("TextLabel")

	Dropdown.Name = L2Hub.RandomString();
	Dropdown.Parent = Handler
	Dropdown.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
	Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Dropdown.BorderSizePixel = 0
	Dropdown.ClipsDescendants = true
	Dropdown.Size = UDim2.new(0, Config.Size, 0, 18)
	Dropdown.ZIndex = ZINdex + 13

	DropdownIcon.Name = L2Hub.RandomString();
	DropdownIcon.Parent = Dropdown
	DropdownIcon.AnchorPoint = Vector2.new(1, 0.5)
	DropdownIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	DropdownIcon.BackgroundTransparency = 1.000
	DropdownIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	DropdownIcon.BorderSizePixel = 0
	DropdownIcon.Position = UDim2.new(1, -2, 0.5, 0)
	DropdownIcon.Size = UDim2.new(0, 18, 0, 18)
	DropdownIcon.ZIndex = ZINdex + 14
	L2Hub:SetIconMode(DropdownIcon, "chevron-small-down")
	DropdownIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
	DropdownIcon.ImageTransparency = 0.250
	DropdownIcon.ScaleType = Enum.ScaleType.Fit

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Dropdown

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = Dropdown

	BasedLabel.Name = L2Hub.RandomString();
	BasedLabel.Parent = Dropdown
	BasedLabel.AnchorPoint = Vector2.new(0, 0.5)
	BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BasedLabel.BackgroundTransparency = 1.000
	BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BasedLabel.BorderSizePixel = 0
	BasedLabel.ClipsDescendants = true
	BasedLabel.Position = UDim2.new(0, 5, 0.5, 0)
	BasedLabel.Size = UDim2.new(1, -25, 0, 15)
	BasedLabel.ZIndex = ZINdex + 14
	BasedLabel.Font = Enum.Font.GothamBold
	BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
	BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	BasedLabel.TextSize = 12.000
	BasedLabel.TextTransparency = 0.5
	BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

	do
		local UIGradient = Instance.new("UIGradient")
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.85, 0.23), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient.Parent = BasedLabel;
	end;

	L2Hub:AddSignal(Dropdown.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(BasedLabel , SlowyTween , { TextTransparency = 0.200 })
	end)));

	L2Hub:AddSignal(Dropdown.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(BasedLabel , SlowyTween , { TextTransparency = 0.5 })
	end)));

	local DropdownLib = {
		OpenSignal = L2Hub:CreateSignal(false),
		Signals = {},
		Refuse = {},
		Items = {},
	};
	L2Hub:AttachLockMethods(DropdownLib, self.Root or Dropdown, Config);

	DropdownLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			L2Hub.PlayAnimate(Dropdown , SlowyTween , { BackgroundTransparency = 0 });
			L2Hub.PlayAnimate(DropdownIcon , SlowyTween , { TextTransparency = 0.250 });
			L2Hub.PlayAnimate(UIStroke , SlowyTween , { Transparency = 0.650 });
			L2Hub.PlayAnimate(BasedLabel , SlowyTween , { TextTransparency = 0.5 });
		else
			L2Hub.PlayAnimate(Dropdown , SlowyTween , { BackgroundTransparency = 1 });
			L2Hub.PlayAnimate(DropdownIcon , SlowyTween , { TextTransparency = 1 });
			L2Hub.PlayAnimate(UIStroke , SlowyTween , { Transparency = 1 });
			L2Hub.PlayAnimate(BasedLabel , SlowyTween , { TextTransparency = 1 });
		end
	end);

	DropdownLib.SetRender(Signal:GetValue())
	Signal:Connect(DropdownLib.SetRender);
	DropdownLib.ExtentSize = 0;

	do
		local DropdownHandler = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local SearchInput = Instance.new("Frame")
		local SearchCorner = Instance.new("UICorner")
		local SearchStroke = Instance.new("UIStroke")
		local SearchIcon = Instance.new("ImageLabel")
		local SearchBox = Instance.new("TextBox")
		local DropdownScrollFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local SelectAllRow = Instance.new("Frame")
		local SelectAllBtn = Instance.new("Frame")
		local SelectAllBtnCorner = Instance.new("UICorner")
		local SelectAllBtnStroke = Instance.new("UIStroke")
		local SelectAllLabel = Instance.new("TextLabel")
		local ClearAllBtn = Instance.new("Frame")
		local ClearAllBtnCorner = Instance.new("UICorner")
		local ClearAllBtnStroke = Instance.new("UIStroke")
		local ClearAllLabel = Instance.new("TextLabel")
		local Shadow = L2Hub:CreateShadow(DropdownHandler);

		local __WinRoot = (L2Hub.ActiveWindow and L2Hub.ActiveWindow.Root) or L2Hub.ScreenGui;

		DropdownHandler.Name = L2Hub.RandomString();
		DropdownHandler.Parent = __WinRoot;
		DropdownHandler.AnchorPoint = Vector2.new(0, 0)
		DropdownHandler.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		DropdownHandler.BackgroundTransparency = 1
		DropdownHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DropdownHandler.BorderSizePixel = 0
		DropdownHandler.ClipsDescendants = true
		DropdownHandler.Position = UDim2.fromOffset(0, 0)
		DropdownHandler.Size = UDim2.new(0, 125, 0, 50)
		DropdownHandler.Visible = false
		DropdownHandler.ZIndex = ZINdex + 125
		DropdownLib.BlockRoot = DropdownHandler;

		L2Hub:AddSignal(DropdownHandler:GetPropertyChangedSignal('BackgroundTransparency'):Connect(function()
			DropdownHandler.Visible = DropdownHandler.BackgroundTransparency < 0.9
		end));

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = DropdownHandler

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = DropdownHandler

		SearchInput.Name = L2Hub.RandomString();
		SearchInput.Parent = DropdownHandler
		SearchInput.AnchorPoint = Vector2.new(0.5, 0)
		SearchInput.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		SearchInput.BackgroundTransparency = 0.250
		SearchInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchInput.BorderSizePixel = 0
		SearchInput.ClipsDescendants = true
		SearchInput.Position = UDim2.new(0.5, 0, 0, 5)
		SearchInput.Size = UDim2.new(1, -10, 0, 26)
		SearchInput.Visible = Config.Search == true
		SearchInput.ZIndex = ZINdex + 127

		SearchCorner.CornerRadius = UDim.new(0, 5)
		SearchCorner.Parent = SearchInput

		SearchStroke.Transparency = 0.650
		SearchStroke.Color = Color3.fromRGB(45, 48, 58)
		SearchStroke.Parent = SearchInput

		SearchIcon.Name = L2Hub.RandomString();
		SearchIcon.Parent = SearchInput
		SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
		SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchIcon.BackgroundTransparency = 1.000
		SearchIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchIcon.BorderSizePixel = 0
		SearchIcon.Position = UDim2.new(0, 4, 0.5, 0)
		SearchIcon.Size = UDim2.new(0, 20, 0, 20)
		SearchIcon.ZIndex = ZINdex + 128
		L2Hub:SetIconMode(SearchIcon, "magnifying-glass")
		SearchIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		SearchIcon.ImageTransparency = 0.450
		SearchIcon.ScaleType = Enum.ScaleType.Fit

		SearchBox.Name = L2Hub.RandomString();
		SearchBox.Parent = SearchInput
		SearchBox.AnchorPoint = Vector2.new(0, 0.5)
		SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchBox.BackgroundTransparency = 1.000
		SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SearchBox.BorderSizePixel = 0
		SearchBox.ClearTextOnFocus = false
		SearchBox.PlaceholderText = "Search"
		SearchBox.Position = UDim2.new(0, 26, 0.5, 0)
		SearchBox.Size = UDim2.new(1, -31, 0, 20)
		SearchBox.ZIndex = ZINdex + 128
		SearchBox.Font = Enum.Font.GothamBold
		SearchBox.Text = ""
		SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		SearchBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 155)
		SearchBox.TextSize = 12.000
		SearchBox.TextTransparency = 0.250
		SearchBox.TextXAlignment = Enum.TextXAlignment.Left

		SelectAllRow.Name = L2Hub.RandomString();
		SelectAllRow.Parent = DropdownHandler
		SelectAllRow.AnchorPoint = Vector2.new(0.5, 0)
		SelectAllRow.BackgroundTransparency = 1
		SelectAllRow.BorderSizePixel = 0
		SelectAllRow.Position = UDim2.new(0.5, 0, 0, Config.Search and 35 or 5)
		SelectAllRow.Size = UDim2.new(1, -10, 0, 24)
		SelectAllRow.Visible = Config.Multi == true
		SelectAllRow.ZIndex = ZINdex + 127

		SelectAllBtn.Name = L2Hub.RandomString();
		SelectAllBtn.Parent = SelectAllRow
		SelectAllBtn.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		SelectAllBtn.BackgroundTransparency = 0.300
		SelectAllBtn.BorderSizePixel = 0
		SelectAllBtn.Position = UDim2.new(0, 0, 0, 0)
		SelectAllBtn.Size = UDim2.new(0.5, -3, 1, 0)
		SelectAllBtn.ZIndex = ZINdex + 128

		SelectAllBtnCorner.CornerRadius = UDim.new(0, 5)
		SelectAllBtnCorner.Parent = SelectAllBtn

		SelectAllBtnStroke.Transparency = 0.650
		SelectAllBtnStroke.Color = Color3.fromRGB(45, 48, 58)
		SelectAllBtnStroke.Parent = SelectAllBtn

		SelectAllLabel.Name = L2Hub.RandomString();
		SelectAllLabel.Parent = SelectAllBtn
		SelectAllLabel.BackgroundTransparency = 1
		SelectAllLabel.BorderSizePixel = 0
		SelectAllLabel.Size = UDim2.fromScale(1, 1)
		SelectAllLabel.ZIndex = ZINdex + 129
		SelectAllLabel.Font = Enum.Font.GothamBold
		SelectAllLabel.Text = "Select all"
		SelectAllLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		SelectAllLabel.TextSize = 11.000
		SelectAllLabel.TextTransparency = 0.250

		ClearAllBtn.Name = L2Hub.RandomString();
		ClearAllBtn.Parent = SelectAllRow
		ClearAllBtn.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		ClearAllBtn.BackgroundTransparency = 0.300
		ClearAllBtn.BorderSizePixel = 0
		ClearAllBtn.Position = UDim2.new(0.5, 3, 0, 0)
		ClearAllBtn.Size = UDim2.new(0.5, -3, 1, 0)
		ClearAllBtn.ZIndex = ZINdex + 128

		ClearAllBtnCorner.CornerRadius = UDim.new(0, 5)
		ClearAllBtnCorner.Parent = ClearAllBtn

		ClearAllBtnStroke.Transparency = 0.650
		ClearAllBtnStroke.Color = Color3.fromRGB(45, 48, 58)
		ClearAllBtnStroke.Parent = ClearAllBtn

		ClearAllLabel.Name = L2Hub.RandomString();
		ClearAllLabel.Parent = ClearAllBtn
		ClearAllLabel.BackgroundTransparency = 1
		ClearAllLabel.BorderSizePixel = 0
		ClearAllLabel.Size = UDim2.fromScale(1, 1)
		ClearAllLabel.ZIndex = ZINdex + 129
		ClearAllLabel.Font = Enum.Font.GothamBold
		ClearAllLabel.Text = "Clear all"
		ClearAllLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ClearAllLabel.TextSize = 11.000
		ClearAllLabel.TextTransparency = 0.250

		DropdownScrollFrame.Name = L2Hub.RandomString();
		DropdownScrollFrame.Parent = DropdownHandler
		DropdownScrollFrame.Active = true
		DropdownScrollFrame.AnchorPoint = Vector2.new(0.5, 0)
		DropdownScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownScrollFrame.BackgroundTransparency = 1.000
		DropdownScrollFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DropdownScrollFrame.BorderSizePixel = 0

		local SelectAllOffset = Config.Multi and 30 or 0;
		DropdownScrollFrame.Position = Config.Search and UDim2.new(0.5, 0, 0, 35 + SelectAllOffset) or UDim2.new(0.5, 0, 0, 2 + SelectAllOffset)
		DropdownScrollFrame.Size = Config.Search and UDim2.new(1, -5, 1, -38 - SelectAllOffset) or UDim2.new(1, -5, 1, -5 - SelectAllOffset)

		DropdownScrollFrame.ZIndex = ZINdex + 127
		DropdownScrollFrame.ScrollBarThickness = 0

		DropdownLib.RootItem = DropdownScrollFrame;

		UIListLayout.Parent = DropdownScrollFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local function GetSearchOffset()
			local Base = (Config.Search == true and 35) or 5;
			if Config.Multi then Base = Base + 30; end;
			return Base;
		end;

		local function ComputeTargetSize()
			local ContentH = UIListLayout.AbsoluteContentSize.Y;
			if ContentH <= 0 then
				ContentH = #Config.Values * 25;
			end;
			local W = (Dropdown.AbsoluteSize.X + 5) + DropdownLib.ExtentSize;
			if W <= 5 then W = 125; end;
			local H = math.min(ContentH + 5, 250) + GetSearchOffset();
			return W, H;
		end;

		local function SetPosition()
			if not Dropdown or not Dropdown.Parent then return; end;
			if not DropdownHandler or not DropdownHandler.Parent then return; end;
			if not __WinRoot or not __WinRoot.Parent then return; end;

			local FullW, FullH = ComputeTargetSize();

			local winAbs = __WinRoot.AbsolutePosition;
			local winSize = __WinRoot.AbsoluteSize;

			local dropAbs = Dropdown.AbsolutePosition;
			local dropSize = Dropdown.AbsoluteSize;

			local Pad = 8;
			local Gap = 6;

			local dropX = dropAbs.X - winAbs.X;
			local dropY = dropAbs.Y - winAbs.Y;

			local spaceBelow = winSize.Y - (dropY + dropSize.Y + Gap) - Pad;
			local spaceAbove = (dropY - Gap) - Pad;

			local useBelow;
			if spaceBelow >= FullH then useBelow = true;
			elseif spaceAbove >= FullH then useBelow = false;
			else useBelow = spaceBelow >= spaceAbove; end;

			local targetH = FullH;
			if useBelow and spaceBelow < FullH then
				targetH = math.max(60, spaceBelow);
			elseif not useBelow and spaceAbove < FullH then
				targetH = math.max(60, spaceAbove);
			end;

			local posY;
			if useBelow then
				posY = dropY + dropSize.Y + Gap;
			else
				posY = dropY - Gap - targetH;
			end;
			posY = math.clamp(posY, Pad, math.max(Pad, winSize.Y - targetH - Pad));

			local posX = dropX + (dropSize.X * 0.5) - (FullW * 0.5);
			posX = math.clamp(posX, Pad, math.max(Pad, winSize.X - FullW - Pad));

			DropdownHandler.AnchorPoint = Vector2.new(0, 0);
			DropdownHandler.Size = UDim2.fromOffset(FullW, targetH);
			DropdownHandler.Position = UDim2.fromOffset(posX, posY);
		end;

		local FollowSignal = nil;

		local function StartFollowing()
			if FollowSignal then
				FollowSignal:Disconnect();
				FollowSignal = nil;
			end;
			FollowSignal = RunService.RenderStepped:Connect(function()
				if not DropdownHandler or not DropdownHandler.Parent then return; end;
				if not DropdownHandler.Visible then return; end;
				if not Dropdown or not Dropdown.Parent then return; end;
				if not __WinRoot or not __WinRoot.Parent then return; end;
				SetPosition();
			end);
		end;

		local function StopFollowing()
			if FollowSignal then
				FollowSignal:Disconnect();
				FollowSignal = nil;
			end;
		end;

		local function RefreshSize()
			local ContentH = UIListLayout.AbsoluteContentSize.Y;
			DropdownScrollFrame.CanvasSize = UDim2.fromOffset(0, ContentH);
			if DropdownHandler.Visible then
				SetPosition();
			end;
		end;

		L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(RefreshSize));

		DropdownLib.ApplySearch = LPH_NO_VIRTUALIZE(function()
			local Query = string.lower(SearchBox.Text or "");
			for _,Item in next , DropdownLib.Items do
				if Item.Root then
					if Query == "" then
						Item.Root.Visible = true;
					else
						Item.Root.Visible = string.find(string.lower(Item.Text), Query, 1, true) ~= nil;
					end;
				end;
			end;
			RefreshSize();
		end);

		L2Hub:AddSignal(SearchBox:GetPropertyChangedSignal("Text"):Connect(LPH_NO_VIRTUALIZE(function()
			DropdownLib.ApplySearch();
		end)));

		L2Hub:AddSignal(Dropdown:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			if DropdownHandler.Visible then SetPosition(); end;
		end));
		L2Hub:AddSignal(Dropdown:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if DropdownHandler.Visible then SetPosition(); end;
		end));

		DropdownLib.SetFrameRender = LPH_NO_VIRTUALIZE(function(value)
			DropdownLib.OpenSignal:SetValue(value);

			if value then
				Shadow:Render(false);

				if Config.Search then
					SearchBox.Text = "";
				end;

				local W, H = ComputeTargetSize();
				DropdownHandler.Size = UDim2.new(0, W, 0, H);
				SetPosition();

				task.defer(function()
					if DropdownHandler and DropdownHandler.Visible then
						SetPosition();
						StartFollowing();
					end;
				end);

				L2Hub.PlayAnimate(DropdownHandler , SlowyTween , { BackgroundTransparency = 0.035 })
				L2Hub.PlayAnimate(DropdownIcon , SlowyTween , { Rotation = 180 })
				L2Hub.PlayAnimate(SearchInput , SlowyTween , { BackgroundTransparency = Config.Search and 0.250 or 1 })
				L2Hub.PlayAnimate(SearchStroke , SlowyTween , { Transparency = Config.Search and 0.650 or 1 })
				L2Hub.PlayAnimate(SearchIcon , SlowyTween , { TextTransparency = Config.Search and 0.450 or 1 })
				L2Hub.PlayAnimate(SearchBox , SlowyTween , { TextTransparency = Config.Search and 0.250 or 1 })

				if Config.Multi then
					L2Hub.PlayAnimate(SelectAllBtn, SlowyTween, { BackgroundTransparency = 0.300 })
					L2Hub.PlayAnimate(SelectAllBtnStroke, SlowyTween, { Transparency = 0.650 })
					L2Hub.PlayAnimate(SelectAllLabel, SlowyTween, { TextTransparency = 0.250 })
					L2Hub.PlayAnimate(ClearAllBtn, SlowyTween, { BackgroundTransparency = 0.300 })
					L2Hub.PlayAnimate(ClearAllBtnStroke, SlowyTween, { Transparency = 0.650 })
					L2Hub.PlayAnimate(ClearAllLabel, SlowyTween, { TextTransparency = 0.250 })
				end;

				if Config.AutoUpdate then
					DropdownLib:Generate();
				end;
			else
				StopFollowing();

				L2Hub.PlayAnimate(DropdownHandler , SlowyTween , { BackgroundTransparency = 1 })
				L2Hub.PlayAnimate(DropdownIcon , SlowyTween , { Rotation = 0 })
				SearchBox:ReleaseFocus();
				L2Hub.PlayAnimate(SearchInput , SlowyTween , { BackgroundTransparency = 1 })
				L2Hub.PlayAnimate(SearchStroke , SlowyTween , { Transparency = 1 })
				L2Hub.PlayAnimate(SearchIcon , SlowyTween , { TextTransparency = 1 })
				L2Hub.PlayAnimate(SearchBox , SlowyTween , { TextTransparency = 1 })

				if Config.Multi then
					L2Hub.PlayAnimate(SelectAllBtn, SlowyTween, { BackgroundTransparency = 1 })
					L2Hub.PlayAnimate(SelectAllBtnStroke, SlowyTween, { Transparency = 1 })
					L2Hub.PlayAnimate(SelectAllLabel, SlowyTween, { TextTransparency = 1 })
					L2Hub.PlayAnimate(ClearAllBtn, SlowyTween, { BackgroundTransparency = 1 })
					L2Hub.PlayAnimate(ClearAllBtnStroke, SlowyTween, { Transparency = 1 })
					L2Hub.PlayAnimate(ClearAllLabel, SlowyTween, { TextTransparency = 1 })
				end;

				Shadow:Render(false);
			end;
		end);

		if Config.Multi then
			local SelectAllInput = L2Hub:CreateInput(SelectAllBtn, function()
				Config.Default = {};
				for _, Value in next, Config.Values do
					Config.Default[Value] = true;
				end;
				BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
				for _, Refresh in next, DropdownLib.Refuse do
					task.spawn(Refresh);
				end;
				L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
			end)

			local ClearAllInput = L2Hub:CreateInput(ClearAllBtn, function()
				Config.Default = {};
				BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
				for _, Refresh in next, DropdownLib.Refuse do
					task.spawn(Refresh);
				end;
				L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
			end)

			L2Hub:AddSignal(SelectAllInput.MouseEnter:Connect(function()
				L2Hub.PlayAnimate(SelectAllBtn, SlowyTween, { BackgroundTransparency = 0.100 })
				L2Hub.PlayAnimate(SelectAllLabel, SlowyTween, { TextTransparency = 0 })
			end))

			L2Hub:AddSignal(SelectAllInput.MouseLeave:Connect(function()
				L2Hub.PlayAnimate(SelectAllBtn, SlowyTween, { BackgroundTransparency = 0.300 })
				L2Hub.PlayAnimate(SelectAllLabel, SlowyTween, { TextTransparency = 0.250 })
			end))

			L2Hub:AddSignal(ClearAllInput.MouseEnter:Connect(function()
				L2Hub.PlayAnimate(ClearAllBtn, SlowyTween, { BackgroundTransparency = 0.100 })
				L2Hub.PlayAnimate(ClearAllLabel, SlowyTween, { TextTransparency = 0 })
			end))

			L2Hub:AddSignal(ClearAllInput.MouseLeave:Connect(function()
				L2Hub.PlayAnimate(ClearAllBtn, SlowyTween, { BackgroundTransparency = 0.300 })
				L2Hub.PlayAnimate(ClearAllLabel, SlowyTween, { TextTransparency = 0.250 })
			end))
		end;

		DropdownLib.SetFrameRender(false);
	end;

	local SecureSignal;
	L2Hub:CreateInput(Dropdown , LPH_NO_VIRTUALIZE(function()
		if SecureSignal then
			SecureSignal:Disconnect();
			SecureSignal = nil;
		end;

		DropdownLib.SetFrameRender(true);
		L2Hub.IsMosueOverOtherFrame = true;

		SecureSignal = UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if not L2Hub:IsMouseOverFrame(DropdownLib.BlockRoot) and not L2Hub:IsMouseOverFrame(Dropdown) then
					if SecureSignal then
						SecureSignal:Disconnect();
						SecureSignal = nil;
					end;
					L2Hub.IsMosueOverOtherFrame = false;
					DropdownLib.SetFrameRender(false);
				end;
			end;
		end)
	end))

	DropdownLib.IsMatch = LPH_NO_VIRTUALIZE(function(v1)
		if typeof(Config.Default) =='table' then
			if Config.Default[v1] == true then
				return true;
			end
			for _, Value in next, Config.Default do
				if Value == v1 then
					return true;
				end;
			end;
		end
		if Config.Default == v1 then
			return true;
		end;
	end);

	function DropdownLib:Generate()
		for i,v in next , DropdownLib.RootItem:GetChildren() do
			if v:IsA('Frame') then
				v:Destroy();
			end;
		end;

		for i,v in next , DropdownLib.Signals do
			v:Disconnect();
		end;

		table.clear(DropdownLib.Signals);
		table.clear(DropdownLib.Refuse);
		table.clear(DropdownLib.Items);
		DropdownLib.ExtentSize = 0;
		DisabledMap = NormalizeOptionMap(Config.DisabledOptions);
		IconMap = NormalizeIconMap(Config.OptionsIcon);

		local Lastone;
		for i,Value in next , Config.Values do
			local ItemFrame = Instance.new("Frame")
			local ItemLabel = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")
			local OptionIcon = nil;
			local ValueKey = tostring(Value);
			local IsDisabled = DisabledMap[ValueKey] == true;
			local CustomIcon = IconMap[ValueKey];

			ItemFrame.Name = L2Hub.RandomString();
			ItemFrame.Parent = DropdownLib.RootItem
			ItemFrame.BackgroundColor3 = Color3.fromRGB(29, 31, 38)
			ItemFrame.BackgroundTransparency = 1.000
			ItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ItemFrame.BorderSizePixel = 0
			ItemFrame.Size = UDim2.new(1, 0, 0, 25)
			ItemFrame.ZIndex = ZINdex + 1258

			ItemLabel.Name = L2Hub.RandomString();
			ItemLabel.Parent = ItemFrame
			ItemLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ItemLabel.BackgroundTransparency = 1.000
			ItemLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ItemLabel.BorderSizePixel = 0
			ItemLabel.Position = UDim2.new(0, Config.Multi and (CustomIcon and 50 or 32) or (CustomIcon and 34 or 15), 0, 4)
			ItemLabel.Size = UDim2.new(0,1, 0, 15)
			ItemLabel.ZIndex = ZINdex + 1258
			ItemLabel.Font = Enum.Font.GothamBold
			ItemLabel.Text = tostring(Value);
			ItemLabel.TextColor3 = IsDisabled and Color3.fromRGB(140, 140, 155) or Color3.fromRGB(255, 255, 255)
			ItemLabel.TextSize = 13.000
			ItemLabel.TextTransparency = IsDisabled and 0.600 or 0.200
			ItemLabel.TextXAlignment = Enum.TextXAlignment.Left

			UICorner.CornerRadius = UDim.new(0, 10)
			UICorner.Parent = ItemFrame

			if CustomIcon then
				OptionIcon = Instance.new("ImageLabel")
				OptionIcon.Parent = ItemFrame
				OptionIcon.AnchorPoint = Vector2.new(0, 0.5)
				OptionIcon.BackgroundTransparency = 1
				OptionIcon.BorderSizePixel = 0
				OptionIcon.Position = UDim2.new(0, Config.Multi and 29 or 13, 0.5, 0)
				OptionIcon.Size = UDim2.new(0, 15, 0, 15)
				OptionIcon.ZIndex = ZINdex + 1259
				L2Hub:SetIconMode(OptionIcon, CustomIcon)
				OptionIcon.ImageColor3 = IsDisabled and Color3.fromRGB(120, 120, 135) or Color3.fromRGB(223, 223, 223)
				OptionIcon.ImageTransparency = IsDisabled and 0.650 or 0.300
				OptionIcon.ScaleType = Enum.ScaleType.Fit
			end;

			local sizetext = TextService:GetTextSize(ItemLabel.Text , ItemLabel.TextSize,ItemLabel.Font,Vector2.new(math.huge,math.huge));
			DropdownLib.ExtentSize = math.max(DropdownLib.ExtentSize , sizetext.X + (CustomIcon and 20 or 0));
			table.insert(DropdownLib.Items , {
				Root = ItemFrame,
				Text = tostring(Value),
				Disabled = IsDisabled,
			});

			local MIcon , MarkItem = nil , nil;

			if Config.Multi then
				local CheckBox = Instance.new("Frame")
				CheckBox.Name = L2Hub.RandomString();
				CheckBox.Parent = ItemFrame;
				CheckBox.AnchorPoint = Vector2.new(0, 0.5)
				CheckBox.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
				CheckBox.BackgroundTransparency = 0
				CheckBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				CheckBox.BorderSizePixel = 0
				CheckBox.Position = UDim2.new(0, 6, 0.5, 0)
				CheckBox.Size = UDim2.new(0, 16, 0, 16)
				CheckBox.ZIndex = ZINdex + 1259

				local CheckCorner = Instance.new("UICorner")
				CheckCorner.CornerRadius = UDim.new(0, 4)
				CheckCorner.Parent = CheckBox

				local CheckStroke = Instance.new("UIStroke")
				CheckStroke.Color = Color3.fromRGB(80, 82, 95)
				CheckStroke.Transparency = 0.400
				CheckStroke.Thickness = 1.2
				CheckStroke.Parent = CheckBox

				local CheckIcon = Instance.new("ImageLabel")
				CheckIcon.Name = L2Hub.RandomString();
				CheckIcon.Parent = CheckBox
				CheckIcon.AnchorPoint = Vector2.new(0.5, 0.5)
				CheckIcon.BackgroundTransparency = 1
				CheckIcon.BorderSizePixel = 0
				CheckIcon.Position = UDim2.fromScale(0.5, 0.5)
				CheckIcon.Size = UDim2.new(1, -4, 1, -4)
				CheckIcon.ZIndex = ZINdex + 1260
				L2Hub:SetIconMode(CheckIcon, "check")
				CheckIcon.ImageColor3 = Color3.fromRGB(0, 0, 0)
				CheckIcon.ImageTransparency = 1
				CheckIcon.ScaleType = Enum.ScaleType.Fit

				local VisiblewOfMult = LPH_NO_VIRTUALIZE(function()
					if DropdownLib.IsMatch(Value) then
						L2Hub.PlayAnimate(ItemLabel , VSlowTween , {
							TextTransparency = IsDisabled and 0.600 or 0.200,
							Position = UDim2.new(0, Config.Multi and (CustomIcon and 50 or 32) or (CustomIcon and 34 or 15), 0, 4)
						})
						L2Hub.PlayAnimate(CheckBox , SlowyTween , {
							BackgroundColor3 = IsDisabled and Color3.fromRGB(50, 50, 60) or L2Hub.AccentColor,
							BackgroundTransparency = 0
						})
						L2Hub.PlayAnimate(CheckStroke , SlowyTween , { Transparency = 1 })
						L2Hub.PlayAnimate(CheckIcon , SlowyTween , { ImageTransparency = IsDisabled and 0.500 or 0 })
						Lastone = ItemLabel;
					else
						L2Hub.PlayAnimate(ItemLabel , VSlowTween , {
							TextTransparency = IsDisabled and 0.650 or 0.5,
							Position = UDim2.new(0, Config.Multi and (CustomIcon and 50 or 32) or (CustomIcon and 34 or 15), 0, 4)
						})
						L2Hub.PlayAnimate(CheckBox , SlowyTween , {
							BackgroundColor3 = Color3.fromRGB(26, 28, 36),
							BackgroundTransparency = 0
						})
						L2Hub.PlayAnimate(CheckStroke , SlowyTween , { Transparency = 0.400 })
						L2Hub.PlayAnimate(CheckIcon , SlowyTween , { ImageTransparency = 1 })
					end;
				end);

				MIcon = CheckBox;
				MarkItem = VisiblewOfMult;
			else
				local DefaultVisible = LPH_NO_VIRTUALIZE(function()
					if DropdownLib.IsMatch(Value) then
						L2Hub.PlayAnimate(ItemLabel , SlowyTween , {
							TextTransparency = IsDisabled and 0.600 or 0.200
						})
						Lastone = ItemLabel;
					else
						L2Hub.PlayAnimate(ItemLabel , SlowyTween , {
							TextTransparency = IsDisabled and 0.650 or 0.5
						})
					end;
				end);
				MarkItem = DefaultVisible;
			end;

			MarkItem();
			table.insert(DropdownLib.Refuse , MarkItem)

			table.insert(DropdownLib.Signals,ItemFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
				if IsDisabled then return; end;
				L2Hub.PlayAnimate(ItemFrame , SlowyTween , { BackgroundTransparency = 0.1 })
			end)));

			table.insert(DropdownLib.Signals,ItemFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
				L2Hub.PlayAnimate(ItemFrame , SlowyTween , { BackgroundTransparency = 1 })
			end)));

			table.insert(DropdownLib.Signals , DropdownLib.OpenSignal:Connect(LPH_NO_VIRTUALIZE(function(val)
				if val then
					MarkItem();
					if OptionIcon then
						L2Hub.PlayAnimate(OptionIcon, SlowyTween , { TextTransparency = IsDisabled and 0.650 or 0.300 })
					end;
				else
					L2Hub.PlayAnimate(ItemLabel , SlowyTween , { TextTransparency = 1 })
					if OptionIcon then
						L2Hub.PlayAnimate(OptionIcon, SlowyTween , { TextTransparency = 1 })
					end;
				end;
			end)));

			if Config.Multi then
				local _,bth_signal = L2Hub:CreateInput(ItemFrame , LPH_NO_VIRTUALIZE(function()
					if IsDisabled then return; end;
					Config.Default[Value] = not Config.Default[Value];
					MarkItem();
					BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
					L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
				end));
				table.insert(DropdownLib.Signals , bth_signal);
			else
				local _,bth_signal = L2Hub:CreateInput(ItemFrame , LPH_NO_VIRTUALIZE(function()
					if IsDisabled then return; end;
					Config.Default = Value;
					for i,v in next , DropdownLib.Refuse do
						task.spawn(v);
					end;
					BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
					L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
				end));
				table.insert(DropdownLib.Signals , bth_signal);
			end;
		end;

		if DropdownLib.ApplySearch then
			DropdownLib.ApplySearch();
		end;
	end;

	DropdownLib:Generate();

	if type(Config.OptionsProvider) == "function" and tonumber(Config.RefreshInterval) then
		local Accumulator = 0;
		local Interval = math.max(tonumber(Config.RefreshInterval) or 1, 0.1);

		DropdownLib.RefreshSignal = L2Hub:AddSignal(RunService.RenderStepped:Connect(function(dt)
			if not Dropdown or not Dropdown.Parent then
				if DropdownLib.RefreshSignal then
					DropdownLib.RefreshSignal:Disconnect();
					DropdownLib.RefreshSignal = nil;
				end;
				return;
			end;
			Accumulator += dt or 0;
			if Accumulator < Interval then return; end;
			Accumulator = 0;
			local ok, values = pcall(Config.OptionsProvider);
			if ok and typeof(values) == "table" then
				Config.Values = values;
				if not Config.Multi then
					Config.Default = ResolveSingleDropdownValue(Config.Default);
					BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
				end;
				DropdownLib:Generate();
			end;
		end));
	end;

	function DropdownLib:GetValue()
		return Config.Default;
	end;

	function DropdownLib:SetValue(v)
		Config.Default = Config.Multi and ResolveMultiDropdownValue(v) or ResolveSingleDropdownValue(v);
		BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
		for i,v in next , DropdownLib.Refuse do
			task.spawn(v);
		end;
		if ShouldFireDropdownCallback(Config.Default) then
			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
		end;
		return DropdownLib;
	end;

	function DropdownLib:SetValues(a)
		Config.Values = a or {};
		if not Config.Multi then
			Config.Default = ResolveSingleDropdownValue(Config.Default);
			BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
		end;
		if not Config.AutoUpdate then
			DropdownLib:Generate();
		end;
		return DropdownLib;
	end;

	function DropdownLib:SetDisabledOptions(disabledOptions)
		Config.DisabledOptions = disabledOptions or {};
		DisabledMap = NormalizeOptionMap(Config.DisabledOptions);
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:AddDisabledOptions(disabledOptions)
		local NewMap = NormalizeOptionMap(disabledOptions);
		for Option,_ in next, NewMap do
			DisabledMap[Option] = true;
		end;
		Config.DisabledOptions = DisabledMap;
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:RemoveDisabledOptions(enabledOptions)
		local RemoveMap = NormalizeOptionMap(enabledOptions);
		for Option,_ in next, RemoveMap do
			DisabledMap[Option] = nil;
		end;
		Config.DisabledOptions = DisabledMap;
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:SetOptionsIcon(icons)
		Config.OptionsIcon = icons or {};
		IconMap = NormalizeIconMap(Config.OptionsIcon);
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:AddOptionsIcon(option, icon)
		Config.OptionsIcon = Config.OptionsIcon or {};
		Config.OptionsIcon[tostring(option)] = icon;
		IconMap = NormalizeIconMap(Config.OptionsIcon);
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:AddValue(value)
		table.insert(Config.Values,value);
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:RemoveValue(value)
		for Index = #Config.Values, 1, -1 do
			if Config.Values[Index] == value then
				table.remove(Config.Values,Index);
			end;
		end;
		if typeof(Config.Default) == "table" then
			Config.Default[value] = nil;
		elseif Config.Default == value then
			Config.Default = nil;
		end;
		BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
		DropdownLib:Generate();
		return DropdownLib;
	end;

	function DropdownLib:Clear()
		Config.Default = Config.Multi and {} or nil;
		BasedLabel.Text = L2Hub.ParseDropdown(Config.Default);
		for _,Refresh in next, DropdownLib.Refuse do
			task.spawn(Refresh);
		end;
		if ShouldFireDropdownCallback(Config.Default) then
			L2Hub:FireCallback(Config.Callback, Config.Name, Config.Default);
		end;
		return DropdownLib;
	end;

	function DropdownLib:Select(value)
		if Config.Multi then
			Config.Default = L2Hub.ProcessDropdown(Config.Default);
			Config.Default[value] = true;
			DropdownLib:SetValue(Config.Default);
		else
			DropdownLib:SetValue(value);
		end;
		return DropdownLib;
	end;

	function DropdownLib:Unselect(value)
		if Config.Multi then
			Config.Default = L2Hub.ProcessDropdown(Config.Default);
			Config.Default[value] = nil;
			DropdownLib:SetValue(Config.Default);
		elseif Config.Default == value then
			DropdownLib:Clear();
		end;
		return DropdownLib;
	end;

	function DropdownLib:IsSelected(value)
		return DropdownLib.IsMatch(value) == true;
	end;

	function DropdownLib:SetCallback(fn)
		Config.Callback = fn or EmptyFunction;
		return DropdownLib;
	end;

	function DropdownLib:SetSearch(value)
		Config.Search = value == true;
		if DropdownLib.ApplySearch then
			DropdownLib.ApplySearch();
		end;
		return DropdownLib;
	end;

	function DropdownLib:Open()
		DropdownLib.SetFrameRender(true);
		return DropdownLib;
	end;

	function DropdownLib:Close()
		DropdownLib.SetFrameRender(false);
		return DropdownLib;
	end;

	function DropdownLib:SetEnabled(value)
		Dropdown.Visible = value ~= false;
		return DropdownLib;
	end;

	if Config.Flag then
		L2Hub:RegisterFlag(Config.Flag, DropdownLib);
	end;

	return CaseInsensitive(DropdownLib);
end;

	return CaseInsensitive(handle);
end;

L2Hub.ProcessDropdown = LPH_NO_VIRTUALIZE(function(value)
	if typeof(value) == 'table' then
		local data = {};

		for i,v in next , value do
			if typeof(v) == 'boolean' and typeof(i) ~= 'number' then
				data[i] = v;
			else
				data[v] = true;
			end;
		end;

		return data;
	else
		return value;
	end;
end);

L2Hub.ParseDropdown = LPH_NO_VIRTUALIZE(function(value)
	if not value then return 'Select'; end;

	local Out;

	if typeof(value) == 'table' then
		if #value > 0 then
			local x = {};

			for i,v in next , value do
				table.insert(x , tostring(v))
			end;

			Out = table.concat(x,' , ');

			table.clear(x);
		else
			local x = {};

			for i,v in next , value do
				if v == true then
					table.insert(x , tostring(i));
				end			
			end;

			Out = table.concat(x,' , ');

			table.clear(x)

			if not Out:byte() then
				Out = 'Select';
			end
		end;
	else
		Out = tostring(value or 'Select');
	end;

	return Out;
end);

function L2Hub:ParseInput(Value , Numeric)
	if not Value then
		return (Numeric and nil) or "";	
	end;

	if Numeric then
		local out = string.gsub(tostring(Value), '[^0-9.%-]', '')

		if tonumber(out) then
			return tonumber(out);
		end;

		return nil;
	end;

	return Value;
end;

function L2Hub:CreateToolTips(Container: Frame , Name: string , Content: string)
	local Tooltips = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local TooltipName = Instance.new("TextLabel")
	local TooltipContent = Instance.new("TextLabel")
	local Shadow = L2Hub:CreateShadow(Tooltips);

	Tooltips.Name = L2Hub.RandomString();
	Tooltips.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	Tooltips.BackgroundTransparency = 0.075
	Tooltips.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tooltips.BorderSizePixel = 0
	Tooltips.ClipsDescendants = true
	Tooltips.Position = UDim2.new(255,255,255,255)
	Tooltips.Size = UDim2.new(0,0,0,0)
	Tooltips.ZIndex = 130

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Tooltips

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = Tooltips

	TooltipName.Name = L2Hub.RandomString();
	TooltipName.Parent = Tooltips
	TooltipName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TooltipName.BackgroundTransparency = 1.000
	TooltipName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TooltipName.BorderSizePixel = 0
	TooltipName.Position = UDim2.new(0, 15, 0, 5)
	TooltipName.Size = UDim2.new(0, 1, 0, 20)
	TooltipName.ZIndex = 132
	TooltipName.Font = Enum.Font.GothamBold
	TooltipName.Text = Name
	TooltipName.TextColor3 = Color3.fromRGB(255, 255, 255)
	TooltipName.TextSize = 15.000
	TooltipName.TextXAlignment = Enum.TextXAlignment.Left

	TooltipContent.Name = L2Hub.RandomString();
	TooltipContent.Parent = Tooltips
	TooltipContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TooltipContent.BackgroundTransparency = 1.000
	TooltipContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TooltipContent.BorderSizePixel = 0
	TooltipContent.Position = UDim2.new(0, 15, 0, 30)
	TooltipContent.Size = UDim2.new(0, 1, 0, 15)
	TooltipContent.ZIndex = 132
	TooltipContent.Font = Enum.Font.GothamBold
	TooltipContent.Text = Content
	TooltipContent.TextColor3 = Color3.fromRGB(255, 255, 255)
	TooltipContent.TextSize = 12.000
	TooltipContent.TextTransparency = 0.650
	TooltipContent.TextXAlignment = Enum.TextXAlignment.Left
	TooltipContent.TextYAlignment = Enum.TextYAlignment.Top

	local ToolTip = {};

	ToolTip.Update = LPH_NO_VIRTUALIZE(function()
		local SizeName = TextService:GetTextSize(TooltipName.Text , TooltipName.TextSize , TooltipName.Font , Vector2.new(math.huge,math.huge));
		local SizeContent = TextService:GetTextSize(TooltipContent.Text , TooltipContent.TextSize , TooltipContent.Font , Vector2.new(math.huge,math.huge));

		local MaxX = math.max(SizeName.X , SizeContent.X) + 65;
		local MaxY = SizeName.Y + SizeContent.Y + 30;

		L2Hub.PlayAnimate(Tooltips,SlowyTween , {
			Size = UDim2.new(0,MaxX,0,MaxY)
		})
	end)

	L2Hub:AddSignal(Tooltips:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
		if Tooltips.BackgroundTransparency > 0.9 then
			Tooltips.Visible = false;
			Tooltips.Parent = nil;
		else
			Tooltips.Visible = true;

			if L2Hub.Global3DRenderMode then
				Tooltips.Parent = L2Hub.GlobalSurfaceGui;
			else
				Tooltips.Parent = L2Hub.ScreenGui;
			end;
		end
	end)));

	ToolTip.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			Tooltips.Position = UDim2.fromOffset(Container.AbsolutePosition.X + Container.AbsoluteSize.X , Container.AbsolutePosition.Y + (Container.AbsoluteSize.Y + 25));

			L2Hub.PlayAnimate(Tooltips , SlowyTween , {
				BackgroundTransparency = 0.075
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			})

			L2Hub.PlayAnimate(TooltipName , SlowyTween , {
				TextTransparency = 0
			})

			L2Hub.PlayAnimate(TooltipContent , SlowyTween , {
				TextTransparency = 0.650
			})

			ToolTip.Update();
			Shadow:Render(false);
		else
			L2Hub.PlayAnimate(Tooltips , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(TooltipName , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(TooltipContent , SlowyTween , {
				TextTransparency = 1
			})

			Shadow:Render(false);
		end;
	end);

	ToolTip.SetRender(false);
	ToolTip.Update();

	local DelayThread;
	L2Hub:AddSignal(Container.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
		if DelayThread then
			task.cancel(DelayThread);
			DelayThread = nil;
		end;

		DelayThread = task.delay(1,ToolTip.SetRender,true);
	end)));

	L2Hub:AddSignal(Container.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
		if DelayThread then
			task.cancel(DelayThread);
			DelayThread = nil;
		end;

		ToolTip.SetRender(false);
		ToolTip.Update();
	end)))

	return ToolTip;
end;

function L2Hub:RegisiterItem(Frame: Frame , Signel)
	local idx = {};
	local LayerIndex = Frame.ZIndex;

	function idx:AddLabel(Name: string,Warp: boolean)
		local RichText = false;
		local AutoSize = false;
		local Stacked = false;

		if typeof(Name) == "table" then
			local Config = Name;
			Name = Config.Text or Config.Name or Config.Title or "Label";
			AutoSize = Config.AutomaticSize == true;
			Warp = Config.Wrap or Config.Warp or Config.Wrapped or AutoSize or Warp;
			RichText = Config.RichText;
		end;

		Name = tostring(Name or "Label");
		RichText = RichText == true;
		Warp = Warp == true;

		local BasedFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local BasedHandler = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local UICorner = Instance.new("UICorner")

		BasedFrame.Name = L2Hub.RandomString();
		BasedFrame.Parent = Frame
		BasedFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		BasedFrame.BackgroundTransparency = 1.000
		BasedFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedFrame.BorderSizePixel = 0
		BasedFrame.Size = UDim2.new(1, 0, 0, 30)
		BasedFrame.ZIndex = LayerIndex + 8

		L2Hub:AddQuery(BasedFrame , Name);

		BasedLabel.Name = L2Hub.RandomString();
		BasedLabel.Parent = BasedFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.ClipsDescendants = true
		BasedLabel.Position = UDim2.new(0, 11, 0, 6)
		BasedLabel.Size = UDim2.new(0,1, 0, 15)
		BasedLabel.ZIndex = LayerIndex + 9
		BasedLabel.Font = Enum.Font.GothamBold
		BasedLabel.RichText = RichText
		BasedLabel.Text = Name
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 13.000
		BasedLabel.TextTransparency = 0.35
		BasedLabel.TextTruncate = Enum.TextTruncate.None
		BasedLabel.TextWrapped = Warp
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left
		BasedLabel.TextYAlignment = (Warp and Enum.TextYAlignment.Top) or Enum.TextYAlignment.Center
		L2Hub:AddTextGradient(BasedLabel);

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = BasedFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		BasedHandler.Name = L2Hub.RandomString();
		BasedHandler.Parent = BasedFrame
		BasedHandler.AnchorPoint = Vector2.new(1, 0)
		BasedHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedHandler.BackgroundTransparency = 1.000
		BasedHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedHandler.BorderSizePixel = 0
		BasedHandler.Position = UDim2.new(1, -11, 0, 2)
		BasedHandler.Size = UDim2.new(1, -20, 0, 25)
		BasedHandler.ZIndex = LayerIndex + 12

		UIListLayout.Parent = BasedHandler
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Padding = UDim.new(0, 5)

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = BasedFrame

		local UpdateRowLayout = LPH_NO_VIRTUALIZE(function()
			task.defer(function()
				if not BasedFrame.Parent then
					return;
				end;

				local FrameWidth = BasedFrame.AbsoluteSize.X;

				if FrameWidth <= 0 then
					return;
				end;

				local ContentWidth = math.ceil(UIListLayout.AbsoluteContentSize.X);
				local MaxContentWidth = math.max(0, FrameWidth - 28);
				ContentWidth = math.clamp(ContentWidth, 0, MaxContentWidth);

				local HandlerHeight = math.max(25, UIListLayout.AbsoluteContentSize.Y);
				local LabelWidth = Stacked and math.max(0, FrameWidth - 22) or math.max(0, FrameWidth - ContentWidth - 28);
				local LabelTextSize = 13;
				local LabelHeight = 15;

				if Warp then
					BasedLabel.TextWrapped = true;
					BasedLabel.TextYAlignment = Enum.TextYAlignment.Top;
					if LabelWidth > 0 then
						LabelHeight = math.max(15, TextService:GetTextSize(
							BasedLabel.Text,
							LabelTextSize,
							BasedLabel.Font,
							Vector2.new(LabelWidth, math.huge)
						).Y);
					end;
				elseif LabelWidth > 0 then
					BasedLabel.TextWrapped = false;
					BasedLabel.TextYAlignment = Enum.TextYAlignment.Center;
					while LabelTextSize > 9 and TextService:GetTextSize(
						BasedLabel.Text,
						LabelTextSize,
						BasedLabel.Font,
						Vector2.new(math.huge, math.huge)
					).X > LabelWidth do
						LabelTextSize = LabelTextSize - 1;
					end;
				end;

				local TargetHeight = Stacked and math.max(30, LabelHeight + HandlerHeight + 18) or math.max(30, HandlerHeight + 5, LabelHeight + 13);

				BasedLabel.TextSize = LabelTextSize;
				BasedLabel.Size = UDim2.new(0, LabelWidth, 0, LabelHeight);
				if Stacked then
					BasedHandler.AnchorPoint = Vector2.new(0, 0);
					BasedHandler.Position = UDim2.new(0, 11, 0, LabelHeight + 11);
					BasedHandler.Size = UDim2.new(1, -22, 0, HandlerHeight);
				else
					BasedHandler.AnchorPoint = Vector2.new(1, 0);
					BasedHandler.Size = UDim2.new(0, ContentWidth, 0, 25);
					BasedHandler.Position = UDim2.new(1, -11, 0, math.max(2, math.floor((TargetHeight - 25) / 2)));
				end;
				BasedFrame.Size = UDim2.new(1, 0, 0, TargetHeight);
			end);
		end);

		L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(UpdateRowLayout));
		L2Hub:AddSignal(BasedFrame:GetPropertyChangedSignal('AbsoluteSize'):Connect(UpdateRowLayout));
		UpdateRowLayout();

		local UpdateWarp = LPH_NO_VIRTUALIZE(function()
			UpdateRowLayout();
		end);

		if Warp then
			UpdateWarp();
		end;

		local handle = L2Hub:RegisiterHandler(BasedHandler , Signel);

		handle.Root = BasedFrame;

		handle.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(BasedFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.35
				})

				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				})
			else
				L2Hub.PlayAnimate(BasedFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				})

				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				})
			end;
		end);

		function handle:SetVisible(val)
			BasedFrame.Visible = val;
			return handle;
		end;

		L2Hub:AddSignal(BasedFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(BasedFrame , SlowyTween , {
				BackgroundTransparency = 0.35
			});

			L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
				TextTransparency = 0.25
			})

		end)))

		L2Hub:AddSignal(BasedFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(BasedFrame , SlowyTween , {
				BackgroundTransparency = 1
			});

			L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
				TextTransparency = 0.35
			})
		end)))

		function handle:SetText(t)
			local oldtxt = BasedLabel.Text;

			BasedLabel.Text = tostring(t or "");
			UpdateRowLayout();

			if Warp and oldtxt ~= BasedLabel.Text then
				UpdateWarp();
			end;

			return handle;
		end;

		function handle:GetText()
			return BasedLabel.Text;
		end;

		function handle:SetRichText(value)
			BasedLabel.RichText = value == true;
			UpdateRowLayout();
			return handle;
		end;

		function handle:GetRichText()
			return BasedLabel.RichText;
		end;

		function handle:SetWrapped(value)
			Warp = value == true;
			BasedLabel.TextWrapped = Warp;
			BasedLabel.TextYAlignment = (Warp and Enum.TextYAlignment.Top) or Enum.TextYAlignment.Center;
			UpdateRowLayout();
			return handle;
		end;

		function handle:SetAutomaticSize(value)
			AutoSize = value == true;
			return handle:SetWrapped(AutoSize);
		end;

		function handle:SetStacked(value)
			Stacked = value == true;
			UIListLayout.HorizontalAlignment = (Stacked and Enum.HorizontalAlignment.Left) or Enum.HorizontalAlignment.Right;
			UpdateRowLayout();
			return handle;
		end;

		function handle:GetStacked()
			return Stacked;
		end;

		function handle:ToolTip(Content: string)
			handle.ToolTip = L2Hub:CreateToolTips(BasedFrame , Name , Content);

			return handle;
		end;

		handle.SetRender(Signel:GetValue());
		Signel:Connect(handle.SetRender);

		return CaseInsensitive(handle);
	end;

	function idx:AddButton(Config)
		Config = L2Hub:ProcessParams(Config , {
			Icon = 'chevron-large-left',
			IconPosition = "Left",
			Name = "Button",
			Callback = EmptyFunction,
			ToolTip = nil,
			Locked = false,
			TextLocked = "Locked",
		});

		local Button = {};
		local ButtonFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Icon = Instance.new("ImageLabel")

		L2Hub:AddQuery(ButtonFrame , Config.Name);

		ButtonFrame.Name = L2Hub.RandomString();
		ButtonFrame.Parent = Frame
		ButtonFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		ButtonFrame.BackgroundTransparency = 1.000
		ButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ButtonFrame.BorderSizePixel = 0
		ButtonFrame.Size = UDim2.new(1, 0, 0, 30)
		ButtonFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(Button, ButtonFrame, Config);

		BasedLabel.Name = L2Hub.RandomString();
		BasedLabel.Parent = ButtonFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.Position = UDim2.new(0, 35, 0, 6)
		BasedLabel.Size = UDim2.new(0,1, 0, 15)
		BasedLabel.ZIndex = LayerIndex + 9
		BasedLabel.Font = Enum.Font.GothamBold
		BasedLabel.Text = Config.Name;
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 13.000
		BasedLabel.TextTransparency = 0.200
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(BasedLabel);

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = ButtonFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ButtonFrame

		Icon.Name = L2Hub.RandomString();
		Icon.Parent = ButtonFrame
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 11, 0, 5)
		Icon.Size = UDim2.new(0, 18, 0, 18)
		Icon.ZIndex = LayerIndex + 9
		L2Hub:SetIconMode(Icon, Config.Icon)
		Icon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		Icon.ImageTransparency = 0.250
		Icon.ScaleType = Enum.ScaleType.Fit

		local function ResolveIconPosition(value)
			value = string.lower(tostring(value or "left"));

			if value == "right" then
				return "Right";
			end;

			return "Left";
		end;

		local function UpdateButtonLayout()
			Config.IconPosition = ResolveIconPosition(Config.IconPosition);

			if Config.IconPosition == "Right" then
				Icon.AnchorPoint = Vector2.new(1, 0);
				Icon.Position = UDim2.new(1, -11, 0, 5);
				BasedLabel.Position = UDim2.new(0, 11, 0, 6);
				BasedLabel.Size = UDim2.new(1, -46, 0, 15);
			else
				Icon.AnchorPoint = Vector2.new(0, 0);
				Icon.Position = UDim2.new(0, 11, 0, 5);
				BasedLabel.Position = UDim2.new(0, 35, 0, 6);
				BasedLabel.Size = UDim2.new(1, -46, 0, 15);
			end;
		end;

		UpdateButtonLayout();

		function Button:SetText(t)
			BasedLabel.Text = t;
			return Button;
		end;

		function Button:SetIcon(t)
			Config.Icon = t or Config.Icon;
			L2Hub:SetIconMode(Icon, Config.Icon)
			return Button;
		end;

		function Button:SetIconPosition(position)
			Config.IconPosition = ResolveIconPosition(position);
			UpdateButtonLayout();
			return Button;
		end;

		function Button:GetIconPosition()
			return Config.IconPosition;
		end;

		function Button:SetCallback(fn)
			Config.Callback = fn or EmptyFunction;
			return Button;
		end;

		function Button:Fire(...)
			L2Hub:FireCallback(Config.Callback, Config.Name, ...);
			return Button;
		end;

		function Button:Click(...)
			return Button:Fire(...);
		end;

		function Button:SetVisible(value)
			ButtonFrame.Visible = value ~= false;
			return Button;
		end;

		function Button:SetIconColor(color)
			Icon.ImageColor3 = color or Icon.ImageColor3;
			return Button;
		end;

		function Button:SetTextColor(color)
			BasedLabel.TextColor3 = color or BasedLabel.TextColor3;
			return Button;
		end;

		local bth = L2Hub:CreateInput(ButtonFrame , LPH_NO_VIRTUALIZE(function()
			L2Hub:FireCallback(Config.Callback, Config.Name);
		end));

		L2Hub:AddSignal(bth.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(ButtonFrame , SlowyTween , {
				BackgroundTransparency = 0.35
			});
		end)))

		L2Hub:AddSignal(bth.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(ButtonFrame , SlowyTween , {
				BackgroundTransparency = 1
			});
		end)))

		Button.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(ButtonFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.200
				});

				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				});

				L2Hub.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 0.250
				});
			else
				L2Hub.PlayAnimate(ButtonFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				});

				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 1
				});
			end;
		end);

		if Config.ToolTip then
			Button.ToolTip = L2Hub:CreateToolTips(ButtonFrame , Config.Name , Config.ToolTip);
		end;

		Button.SetRender(Signel:GetValue())
		Signel:Connect(Button.SetRender);

		return CaseInsensitive(Button);
	end;

	function idx:AddParagraph(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Content = tostring(Config or ""),
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "Information",
			Content = "",
			RichText = true,
			Locked = false,
			TextLocked = "Locked",
		});

		local Paragraph = {};
		local ParagraphFrame = Instance.new("Frame")
		local NameLabel = Instance.new("TextLabel")
		local ContentLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		L2Hub:AddQuery(ParagraphFrame , Config.Name);

		ParagraphFrame.Name = L2Hub.RandomString();
		ParagraphFrame.Parent = Frame
		ParagraphFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		ParagraphFrame.BackgroundTransparency = 1.000
		ParagraphFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ParagraphFrame.BorderSizePixel = 0
		ParagraphFrame.ClipsDescendants = true
		ParagraphFrame.Size = UDim2.new(1, 0, 0, 58)
		ParagraphFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(Paragraph, ParagraphFrame, Config);

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ParagraphFrame

		NameLabel.Name = L2Hub.RandomString();
		NameLabel.Parent = ParagraphFrame
		NameLabel.BackgroundTransparency = 1.000
		NameLabel.BorderSizePixel = 0
		NameLabel.Position = UDim2.new(0, 11, 0, 7)
		NameLabel.Size = UDim2.new(1, -22, 0, 16)
		NameLabel.ZIndex = LayerIndex + 9
		NameLabel.Font = Enum.Font.GothamBold
		NameLabel.RichText = Config.RichText == true
		NameLabel.Text = tostring(Config.Name)
		NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		NameLabel.TextSize = 13.000
		NameLabel.TextTransparency = 0.200
		NameLabel.TextXAlignment = Enum.TextXAlignment.Left
		NameLabel.TextYAlignment = Enum.TextYAlignment.Top
		L2Hub:AddTextGradient(NameLabel);

		ContentLabel.Name = L2Hub.RandomString();
		ContentLabel.Parent = ParagraphFrame
		ContentLabel.BackgroundTransparency = 1.000
		ContentLabel.BorderSizePixel = 0
		ContentLabel.Position = UDim2.new(0, 11, 0, 26)
		ContentLabel.Size = UDim2.new(1, -22, 0, 20)
		ContentLabel.ZIndex = LayerIndex + 9
		ContentLabel.Font = Enum.Font.GothamBold
		ContentLabel.RichText = Config.RichText == true
		ContentLabel.Text = tostring(Config.Content)
		ContentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ContentLabel.TextSize = 12.000
		ContentLabel.TextTransparency = 0.500
		ContentLabel.TextWrapped = true
		ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
		ContentLabel.TextYAlignment = Enum.TextYAlignment.Top

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = ParagraphFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		local function UpdateSize()
			local Width = math.max(120, ParagraphFrame.AbsoluteSize.X - 22);
			local ContentSize = TextService:GetTextSize(ContentLabel.Text,ContentLabel.TextSize,ContentLabel.Font,Vector2.new(Width,math.huge));
			local Height = math.max(58, ContentSize.Y + 38);

			ContentLabel.Size = UDim2.new(1, -22, 0, ContentSize.Y + 4);
			L2Hub.PlayAnimate(ParagraphFrame , SlowyTween , {
				Size = UDim2.new(1, 0, 0, Height)
			});
		end;

		task.defer(UpdateSize);
		L2Hub:AddSignal(ParagraphFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateSize));

		function Paragraph:SetName(name)
			Config.Name = tostring(name or "");
			NameLabel.Text = Config.Name;
			return Paragraph;
		end;

		function Paragraph:SetContent(content)
			Config.Content = tostring(content or "");
			ContentLabel.Text = Config.Content;
			UpdateSize();
			return Paragraph;
		end;

		function Paragraph:GetName()
			return Config.Name;
		end;

		function Paragraph:GetContent()
			return Config.Content;
		end;

		function Paragraph:SetRichText(value)
			Config.RichText = value == true;
			NameLabel.RichText = Config.RichText;
			ContentLabel.RichText = Config.RichText;
			return Paragraph;
		end;

		function Paragraph:GetRichText()
			return Config.RichText == true;
		end;

		function Paragraph:SetVisible(value)
			local isVisible = value ~= false;
			ParagraphFrame.Visible = isVisible;
			if not isVisible then
				ParagraphFrame.Size = UDim2.new(0, 0, 0, 0);
			else
				task.defer(UpdateSize);
			end
			return Paragraph;
		end;

		Paragraph.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(NameLabel , SlowyTween , {
					TextTransparency = 0.200
				});
				L2Hub.PlayAnimate(ContentLabel , SlowyTween , {
					TextTransparency = 0.500
				});
				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				});
			else
				L2Hub.PlayAnimate(NameLabel , SlowyTween , {
					TextTransparency = 1
				});
				L2Hub.PlayAnimate(ContentLabel , SlowyTween , {
					TextTransparency = 1
				});
				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				});
			end;
		end);

		Paragraph.SetRender(Signel:GetValue());
		Signel:Connect(Paragraph.SetRender);

		return CaseInsensitive(Paragraph);
	end;
	
local function __ResolveTone(tone)
	if typeof(tone) == "Color3" then return tone; end;

	if type(tone) == "table" then
		if tone.R and tone.G and tone.B then return Color3.new(tone.R, tone.G, tone.B); end;
		if tone[1] and tone[2] and tone[3] then return Color3.fromRGB(tone[1], tone[2], tone[3]); end;
		if type(tone.Hex) == "string" then
			local h = tone.Hex:gsub("#", "");
			if #h == 6 then
				local r, g, b = h:match("^(%x%x)(%x%x)(%x%x)$");
				if r then return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)); end;
			end;
		end;
	end;

	if type(tone) == "string" then
		local lower = string.lower(tone);
		if lower == "success" or lower == "green" then return Color3.fromRGB(135, 255, 143); end;
		if lower == "warning" or lower == "yellow" then return Color3.fromRGB(255, 200, 100); end;
		if lower == "error" or lower == "red" then return Color3.fromRGB(255, 102, 105); end;
		if lower == "muted" or lower == "gray" or lower == "grey" then return Color3.fromRGB(186, 186, 186); end;
		if lower == "white" then return Color3.fromRGB(255, 255, 255); end;
		if lower == "accent" then return L2Hub.AccentColor; end;

		local h = tone:gsub("#", "");
		if #h == 6 then
			local r, g, b = h:match("^(%x%x)(%x%x)(%x%x)$");
			if r then return Color3.fromRGB(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)); end;
		end;
	end;

	return L2Hub.AccentColor;
end;

function idx:AddStatus(Config)
	if typeof(Config) ~= "table" then
		Config = {
			Name = "Status",
			Value = tostring(Config or ""),
		};
	end;

	Config = L2Hub:ProcessParams(Config , {
		Name = "Status",
		Value = "",
		Tone = "Accent",
		Color = nil,
		Suffix = "",
		Prefix = "",
		Placeholder = "-",
		ShowColon = true,
		Flash = true,
		Update = nil,
		UpdateRate = 1,
		Locked = false,
		TextLocked = "Locked",
	});

	local Status = {};
	local StatusFrame = Instance.new("Frame")
	local NameLabel = Instance.new("TextLabel")
	local ValueLabel = Instance.new("TextLabel")
	local LineFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	L2Hub:AddQuery(StatusFrame , Config.Name);

	StatusFrame.Name = L2Hub.RandomString();
	StatusFrame.Parent = Frame
	StatusFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
	StatusFrame.BackgroundTransparency = 1.000
	StatusFrame.BorderSizePixel = 0
	StatusFrame.ClipsDescendants = true
	StatusFrame.Size = UDim2.new(1, 0, 0, 28)
	StatusFrame.ZIndex = LayerIndex + 8
	L2Hub:AttachLockMethods(Status, StatusFrame, Config);

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = StatusFrame

	NameLabel.Name = L2Hub.RandomString();
	NameLabel.Parent = StatusFrame
	NameLabel.BackgroundTransparency = 1.000
	NameLabel.BorderSizePixel = 0
	NameLabel.Position = UDim2.new(0, 11, 0, 6)
	NameLabel.Size = UDim2.new(0.55, -11, 0, 16)
	NameLabel.ZIndex = LayerIndex + 9
	NameLabel.Font = Enum.Font.GothamBold
	NameLabel.TextSize = 13.000
	NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameLabel.TextTransparency = 0.500
	NameLabel.TextXAlignment = Enum.TextXAlignment.Left
	NameLabel.TextTruncate = Enum.TextTruncate.AtEnd

	ValueLabel.Name = L2Hub.RandomString();
	ValueLabel.Parent = StatusFrame
	ValueLabel.BackgroundTransparency = 1.000
	ValueLabel.BorderSizePixel = 0
	ValueLabel.AnchorPoint = Vector2.new(1, 0)
	ValueLabel.Position = UDim2.new(1, -11, 0, 6)
	ValueLabel.Size = UDim2.new(0.45, -11, 0, 16)
	ValueLabel.ZIndex = LayerIndex + 9
	ValueLabel.Font = Enum.Font.GothamBold
	ValueLabel.TextSize = 13.000
	ValueLabel.TextColor3 = L2Hub.AccentColor
	ValueLabel.TextTransparency = 0.200
	ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
	ValueLabel.TextTruncate = Enum.TextTruncate.AtEnd

	LineFrame.Name = L2Hub.RandomString();
	LineFrame.Parent = StatusFrame
	LineFrame.AnchorPoint = Vector2.new(0.5, 1)
	LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame.BackgroundTransparency = 0.650
	LineFrame.BorderSizePixel = 0
	LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
	LineFrame.Size = UDim2.new(1, -20, 0, 1)
	LineFrame.ZIndex = LayerIndex + 11

	local LastRendered = nil;

local function ToneColor()
	if Config.Color ~= nil then
		return __ResolveTone(Config.Color);
	end;
	return __ResolveTone(Config.Tone);
end;

	local function RenderValue(value , animate)
		local text = Config.Prefix .. tostring(value == nil and Config.Placeholder or value) .. Config.Suffix;
		if text == LastRendered then return; end;
		local changed = LastRendered ~= nil and LastRendered ~= text;
		LastRendered = text;
		ValueLabel.Text = text;
		L2Hub.PlayAnimate(ValueLabel , SlowyTween , {
			TextColor3 = ToneColor()
		});
		if changed and Config.Flash and animate then
			L2Hub.PlayAnimate(ValueLabel , ManualTween , { TextTransparency = 0 });
			task.delay(0.12 , function()
				if ValueLabel.Parent then
					L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextTransparency = 0.200 });
				end;
			end);
		end;
	end;

	NameLabel.Text = Config.Name .. (Config.ShowColon and " :" or "");
	RenderValue(Config.Value , false);

	Status.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			L2Hub.PlayAnimate(NameLabel , SlowyTween , { TextTransparency = 0.500 });
			L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextTransparency = 0.200 });
			L2Hub.PlayAnimate(LineFrame , SlowyTween , { BackgroundTransparency = 0.650 });
		else
			L2Hub.PlayAnimate(NameLabel , SlowyTween , { TextTransparency = 1 });
			L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextTransparency = 1 });
			L2Hub.PlayAnimate(LineFrame , SlowyTween , { BackgroundTransparency = 1 });
		end;
	end);

	L2Hub:AddSignal(StatusFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(StatusFrame , SlowyTween , { BackgroundTransparency = 0.35 });
	end)));

	L2Hub:AddSignal(StatusFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(StatusFrame , SlowyTween , { BackgroundTransparency = 1 });
	end)));

	function Status:SetValue(value)
		RenderValue(value , true);
		return Status;
	end;

	function Status:GetValue()
		return LastRendered;
	end;

	function Status:SetName(name)
		Config.Name = tostring(name or "");
		NameLabel.Text = Config.Name .. (Config.ShowColon and " :" or "");
		return Status;
	end;

	function Status:SetTone(tone)
		Config.Tone = tone;
		L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextColor3 = ToneColor() });
		return Status;
	end;

	function Status:SetColor(color)
		Config.Color = color;
		L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextColor3 = ToneColor() });
		return Status;
	end;

	function Status:SetVisible(value)
		StatusFrame.Visible = value ~= false;
		return Status;
	end;

	if type(Config.Update) == "function" then
		local Rate = math.max(tonumber(Config.UpdateRate) or 1 , 0.05);
		local Alive = true;
		table.insert(Status._listeners or {} , function() Alive = false end);
		Status._listeners = Status._listeners or {};
		table.insert(Status._listeners , function() Alive = false end);
		L2Hub:AddSignal(StatusFrame.Destroying:Connect(function() Alive = false end));
		task.spawn(function()
			while Alive and StatusFrame.Parent do
				local Ok , Val , ToneOrTint = pcall(Config.Update);
				if Ok then
					if Val ~= nil then RenderValue(Val , true); end;
					if ToneOrTint ~= nil then
						if typeof(ToneOrTint) == "Color3" then
							Config.Color = ToneOrTint;
						else
							Config.Tone = ToneOrTint;
						end;
						L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextColor3 = ToneColor() });
					end;
				end;
				task.wait(Rate);
			end;
		end);
	end;

	Status.SetRender(Signel:GetValue());
	Signel:Connect(Status.SetRender);

	return CaseInsensitive(Status);
end;

function idx:AddStatusList(Config)
	Config = L2Hub:ProcessParams(Config or {} , {
		Name = "STATUS",
		Rows = {},
		Update = nil,
		UpdateRate = 1,
		MaxRows = 10,
		EmptyText = "Nothing yet",
		ShowColon = true,
		Flash = true,
		Locked = false,
		TextLocked = "Locked",
	});

	local StatusList = {
		Rows = {},
		_RowCache = {},
		_LastValues = {},
	};

	local Root = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Header = Instance.new("TextLabel")
	local ListHolder = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local EmptyLabel = Instance.new("TextLabel")

	L2Hub:AddQuery(Root , Config.Name);

	Root.Name = L2Hub.RandomString();
	Root.Parent = Frame
	Root.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
	Root.BackgroundTransparency = 1.000
	Root.BorderSizePixel = 0
	Root.ClipsDescendants = true
	Root.Size = UDim2.new(1, 0, 0, 34)
	Root.ZIndex = LayerIndex + 8
	L2Hub:AttachLockMethods(StatusList, Root, Config);

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Root

	Header.Name = L2Hub.RandomString();
	Header.Parent = Root
	Header.BackgroundTransparency = 1.000
	Header.BorderSizePixel = 0
	Header.Position = UDim2.new(0, 11, 0, 6)
	Header.Size = UDim2.new(1, -22, 0, 16)
	Header.ZIndex = LayerIndex + 9
	Header.Font = Enum.Font.GothamBold
	Header.TextSize = 11.000
	Header.TextColor3 = Color3.fromRGB(255, 255, 255)
	Header.TextTransparency = 0.500
	Header.TextXAlignment = Enum.TextXAlignment.Left
	Header.TextTruncate = Enum.TextTruncate.AtEnd
	Header.Text = string.upper(tostring(Config.Name or ""));
	Header.Visible = Header.Text ~= "";

	local HeaderOffset = Header.Visible and 26 or 4;

	ListHolder.Name = L2Hub.RandomString();
	ListHolder.Parent = Root
	ListHolder.Position = UDim2.new(0, 11, 0, HeaderOffset)
	ListHolder.Size = UDim2.new(1, -22, 0, 0)
	ListHolder.BackgroundTransparency = 1.000
	ListHolder.BorderSizePixel = 0
	ListHolder.ScrollBarThickness = 0
	ListHolder.ScrollingDirection = Enum.ScrollingDirection.Y
	ListHolder.CanvasSize = UDim2.new()
	ListHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ListHolder.ScrollingEnabled = false
	ListHolder.ZIndex = LayerIndex + 9

	UIListLayout.Parent = ListHolder
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 2)

	EmptyLabel.Name = L2Hub.RandomString();
	EmptyLabel.Parent = ListHolder
	EmptyLabel.BackgroundTransparency = 1.000
	EmptyLabel.BorderSizePixel = 0
	EmptyLabel.Size = UDim2.new(1, 0, 0, 20)
	EmptyLabel.Font = Enum.Font.GothamBold
	EmptyLabel.TextSize = 12.000
	EmptyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	EmptyLabel.TextTransparency = 0.500
	EmptyLabel.TextXAlignment = Enum.TextXAlignment.Left
	EmptyLabel.TextTruncate = Enum.TextTruncate.AtEnd
	EmptyLabel.Text = Config.EmptyText;
	EmptyLabel.LayoutOrder = 0;

	local function NormalizeEntry(entry)
		if type(entry) == "string" then
			return {
				Text = entry,
				Value = nil,
			};
		end;
		if type(entry) ~= "table" then
			return {
				Text = tostring(entry),
				Value = nil,
			};
		end;
		return {
			Text = entry.Text or entry.Name or entry[1] or "",
			Value = entry.Value ~= nil and entry.Value or entry[2],
			Tone = entry.Tone or entry.Color,
			Suffix = entry.Suffix,
			Prefix = entry.Prefix,
		};
	end;

	local function BuildRow(index)
		local RowFrame = Instance.new("Frame")
		local NameLbl = Instance.new("TextLabel")
		local ValueLbl = Instance.new("TextLabel")

		RowFrame.Name = L2Hub.RandomString();
		RowFrame.Parent = ListHolder
		RowFrame.BackgroundTransparency = 1.000
		RowFrame.BorderSizePixel = 0
		RowFrame.Size = UDim2.new(1, 0, 0, 20)
		RowFrame.LayoutOrder = index
		RowFrame.ZIndex = LayerIndex + 9

		NameLbl.Name = L2Hub.RandomString();
		NameLbl.Parent = RowFrame
		NameLbl.BackgroundTransparency = 1.000
		NameLbl.BorderSizePixel = 0
		NameLbl.Position = UDim2.new(0, 0, 0, 0)
		NameLbl.Size = UDim2.new(0.55, 0, 1, 0)
		NameLbl.Font = Enum.Font.GothamBold
		NameLbl.TextSize = 12.000
		NameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
		NameLbl.TextTransparency = 0.500
		NameLbl.TextXAlignment = Enum.TextXAlignment.Left
		NameLbl.TextTruncate = Enum.TextTruncate.AtEnd
		NameLbl.ZIndex = LayerIndex + 9

		ValueLbl.Name = L2Hub.RandomString();
		ValueLbl.Parent = RowFrame
		ValueLbl.BackgroundTransparency = 1.000
		ValueLbl.BorderSizePixel = 0
		ValueLbl.AnchorPoint = Vector2.new(1, 0)
		ValueLbl.Position = UDim2.new(1, 0, 0, 0)
		ValueLbl.Size = UDim2.new(0.45, 0, 1, 0)
		ValueLbl.Font = Enum.Font.GothamBold
		ValueLbl.TextSize = 12.000
		ValueLbl.TextColor3 = L2Hub.AccentColor
		ValueLbl.TextTransparency = 0.200
		ValueLbl.TextXAlignment = Enum.TextXAlignment.Right
		ValueLbl.TextTruncate = Enum.TextTruncate.AtEnd
		ValueLbl.ZIndex = LayerIndex + 9

		return {
			Frame = RowFrame,
			Name = NameLbl,
			Value = ValueLbl,
		};
	end;

	local function RefreshSize()
		local ContentH = math.max(UIListLayout.AbsoluteContentSize.Y , 20);
		local MaxH = (tonumber(Config.MaxRows) or 10) * 22;
		local VisibleH = math.min(ContentH , MaxH);
		local TotalH = HeaderOffset + VisibleH + 6;
		ListHolder.Size = UDim2.new(1, -22, 0, VisibleH);
		Root.Size = UDim2.new(1, 0, 0, TotalH);
		ListHolder.ScrollingEnabled = ContentH > MaxH;
	end;

	local function RenderRows(rows)
		StatusList.Rows = {};
		if type(rows) ~= "table" then rows = {}; end;

		local Count = 0;
		for i , raw in ipairs(rows) do
			Count += 1;
			local Entry = NormalizeEntry(raw);
			StatusList.Rows[Count] = Entry;
		end;

		local VisibleCache = StatusList._RowCache;

		for i = 1 , Count do
			local Entry = StatusList.Rows[i];
			local RowData = VisibleCache[i];
			if not RowData then
				RowData = BuildRow(i);
				VisibleCache[i] = RowData;
			end;
			RowData.Frame.Visible = true;
			RowData.Frame.LayoutOrder = i;

			local TextStr = tostring(Entry.Text or "");
			local ValueStr;
			local ToneTint;
			if Entry.Value ~= nil then
				local P = Entry.Prefix or Config.Prefix or "";
				local S = Entry.Suffix or Config.Suffix or "";
				ValueStr = P .. tostring(Entry.Value) .. S;
				ToneTint = __ResolveTone(Entry.Tone);
			else
				ValueStr = "";
				ToneTint = L2Hub.AccentColor;
			end;

			RowData.Name.Text = TextStr .. (Config.ShowColon and Entry.Value ~= nil and " :" or "");

			local Key = TextStr;
			local LastVal = StatusList._LastValues[Key];
			local Changed = LastVal ~= nil and LastVal ~= ValueStr;

			RowData.Value.Text = ValueStr;
			RowData.Value.TextColor3 = ToneTint;

			if Changed and Config.Flash then
				RowData.Value.TextTransparency = 0;
				task.delay(0.12 , function()
					if RowData.Value.Parent then
						L2Hub.PlayAnimate(RowData.Value , SlowyTween , { TextTransparency = 0.200 });
					end;
				end);
			else
				RowData.Value.TextTransparency = Entry.Value ~= nil and 0.200 or 1;
			end;

			StatusList._LastValues[Key] = ValueStr;
		end;

		for i = Count + 1 , #VisibleCache do
			VisibleCache[i].Frame.Visible = false;
		end;

		EmptyLabel.Visible = Count == 0;
		RefreshSize();
	end;

	L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(RefreshSize));

	function StatusList:Set(rows)
		RenderRows(rows);
		return StatusList;
	end;

	function StatusList:Get()
		return StatusList.Rows;
	end;

	function StatusList:SetName(name)
		Config.Name = tostring(name or "");
		Header.Text = string.upper(Config.Name);
		Header.Visible = Header.Text ~= "";
		HeaderOffset = Header.Visible and 26 or 4;
		ListHolder.Position = UDim2.new(0, 11, 0, HeaderOffset);
		RefreshSize();
		return StatusList;
	end;

	function StatusList:SetVisible(value)
		Root.Visible = value ~= false;
		return StatusList;
	end;

	StatusList.SetRender = LPH_NO_VIRTUALIZE(function(value)
		if value then
			L2Hub.PlayAnimate(Header , SlowyTween , { TextTransparency = 0.500 });
			for i , RowData in ipairs(StatusList._RowCache) do
				L2Hub.PlayAnimate(RowData.Name , SlowyTween , { TextTransparency = 0.500 });
				L2Hub.PlayAnimate(RowData.Value , SlowyTween , { TextTransparency = RowData.Value.Text ~= "" and 0.200 or 1 });
			end;
		else
			L2Hub.PlayAnimate(Header , SlowyTween , { TextTransparency = 1 });
			for i , RowData in ipairs(StatusList._RowCache) do
				L2Hub.PlayAnimate(RowData.Name , SlowyTween , { TextTransparency = 1 });
				L2Hub.PlayAnimate(RowData.Value , SlowyTween , { TextTransparency = 1 });
			end;
		end;
	end);

	RenderRows(Config.Rows);

	if type(Config.Update) == "function" then
		local Rate = math.max(tonumber(Config.UpdateRate) or 1 , 0.05);
		local Alive = true;
		L2Hub:AddSignal(Root.Destroying:Connect(function() Alive = false end));
		task.spawn(function()
			while Alive and Root.Parent do
				local Ok , NewRows = pcall(Config.Update);
				if Ok and type(NewRows) == "table" then
					RenderRows(NewRows);
				end;
				task.wait(Rate);
			end;
		end);
	end;

	StatusList.SetRender(Signel:GetValue());
	Signel:Connect(StatusList.SetRender);

	return CaseInsensitive(StatusList);
end;

	function idx:AddImage(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Image = tostring(Config or ""),
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "Image",
			Image = "",
			Size = UDim2.new(1, -20, 0, 120),
			Height = nil,
			ScaleType = Enum.ScaleType.Fit,
			Color = Color3.fromRGB(255, 255, 255),
			Transparency = 0,
			Corner = 6,
			Locked = false,
			TextLocked = "Locked",
		});

		local ImageLib = {};
		local ImageFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")
		local ImageCorner = Instance.new("UICorner")
		local LineFrame = Instance.new("Frame")

		if Config.Height then
			Config.Size = UDim2.new(1, -20, 0, tonumber(Config.Height) or 120);
		end;

		L2Hub:AddQuery(ImageFrame , Config.Name);

		ImageFrame.Name = L2Hub.RandomString();
		ImageFrame.Parent = Frame
		ImageFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		ImageFrame.BackgroundTransparency = 1.000
		ImageFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageFrame.BorderSizePixel = 0
		ImageFrame.ClipsDescendants = true
		ImageFrame.Size = UDim2.new(1, 0, 0, Config.Size.Y.Offset + 15)
		ImageFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(ImageLib, ImageFrame, Config);

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ImageFrame

		ImageLabel.Name = L2Hub.RandomString();
		ImageLabel.Parent = ImageFrame
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0)
		ImageLabel.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.5, 0, 0, 7)
		ImageLabel.Size = Config.Size
		ImageLabel.ZIndex = LayerIndex + 9
		ImageLabel.ImageColor3 = Config.Color
		ImageLabel.ImageTransparency = Config.Transparency
		ImageLabel.ScaleType = Config.ScaleType
		L2Hub:SetIconMode(ImageLabel, Config.Image);
		ImageLabel.ScaleType = Config.ScaleType;
		ImageLabel.ImageColor3 = Config.Color;
		ImageLabel.ImageTransparency = Config.Transparency;
		local ImageScale = ImageLabel:FindFirstChild("ModernIconScale");
		if ImageScale then
			ImageScale.Scale = 1;
		end;

		ImageCorner.CornerRadius = UDim.new(0, Config.Corner)
		ImageCorner.Parent = ImageLabel

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = ImageFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		local function UpdateSize()
			local Height = math.max(30, ImageLabel.Size.Y.Offset + 15);
			ImageFrame.Size = UDim2.new(1, 0, 0, Height);
		end;

		function ImageLib:SetImage(image)
			Config.Image = tostring(image or "");
			L2Hub:SetIconMode(ImageLabel, Config.Image);
			ImageLabel.ScaleType = Config.ScaleType;
			ImageLabel.ImageColor3 = Config.Color;
			ImageLabel.ImageTransparency = Config.Transparency;
			local ImageScale = ImageLabel:FindFirstChild("ModernIconScale");
			if ImageScale then
				ImageScale.Scale = 1;
			end;
			return ImageLib;
		end;

		function ImageLib:GetImage()
			return Config.Image;
		end;

		function ImageLib:SetSize(size)
			if typeof(size) == "UDim2" then
				Config.Size = size;
			elseif typeof(size) == "number" then
				Config.Size = UDim2.new(1, -20, 0, size);
			end;

			ImageLabel.Size = Config.Size;
			UpdateSize();
			return ImageLib;
		end;

		function ImageLib:SetHeight(height)
			return ImageLib:SetSize(tonumber(height) or ImageLabel.Size.Y.Offset);
		end;

		function ImageLib:SetScaleType(scaleType)
			Config.ScaleType = scaleType or Config.ScaleType;
			ImageLabel.ScaleType = Config.ScaleType;
			return ImageLib;
		end;

		function ImageLib:SetColor(color)
			Config.Color = color or Config.Color;
			ImageLabel.ImageColor3 = Config.Color;
			return ImageLib;
		end;

		function ImageLib:SetTransparency(value)
			Config.Transparency = tonumber(value) or Config.Transparency;
			ImageLabel.ImageTransparency = Config.Transparency;
			return ImageLib;
		end;

		function ImageLib:SetVisible(value)
			ImageFrame.Visible = value ~= false;
			return ImageLib;
		end;

		ImageLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(ImageLabel , SlowyTween , {
					ImageTransparency = Config.Transparency
				});
				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				});
			else
				L2Hub.PlayAnimate(ImageLabel , SlowyTween , {
					ImageTransparency = 1
				});
				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				});
			end;
		end);

		UpdateSize();
		ImageLib.SetRender(Signel:GetValue());
		Signel:Connect(ImageLib.SetRender);

		return CaseInsensitive(ImageLib);
	end;

	function idx:AddDivider(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Text = tostring(Config or ""),
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Text = "",
			Name = nil,
		});

		local Divider = {};
		local DividerFrame = Instance.new("Frame")
		local LeftLine = Instance.new("Frame")
		local RightLine = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")

		DividerFrame.Name = L2Hub.RandomString();
		DividerFrame.Parent = Frame
		DividerFrame.BackgroundTransparency = 1.000
		DividerFrame.BorderSizePixel = 0
		DividerFrame.Size = UDim2.new(1, 0, 0, 22)
		DividerFrame.ZIndex = LayerIndex + 8

		LeftLine.Name = L2Hub.RandomString();
		LeftLine.Parent = DividerFrame
		LeftLine.AnchorPoint = Vector2.new(0, 0.5)
		LeftLine.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LeftLine.BackgroundTransparency = 0.650
		LeftLine.BorderSizePixel = 0
		LeftLine.Position = UDim2.new(0, 10, 0.5, 0)
		LeftLine.Size = UDim2.new(0.5, -20, 0, 1)
		LeftLine.ZIndex = LayerIndex + 9

		TextLabel.Name = L2Hub.RandomString();
		TextLabel.Parent = DividerFrame
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.fromScale(0.5, 0.5)
		TextLabel.Size = UDim2.new(0, 0, 0, 16)
		TextLabel.ZIndex = LayerIndex + 9
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = tostring(Config.Text or Config.Name or "")
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 11.000
		TextLabel.TextTransparency = 0.500

		RightLine.Name = L2Hub.RandomString();
		RightLine.Parent = DividerFrame
		RightLine.AnchorPoint = Vector2.new(1, 0.5)
		RightLine.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		RightLine.BackgroundTransparency = 0.650
		RightLine.BorderSizePixel = 0
		RightLine.Position = UDim2.new(1, -10, 0.5, 0)
		RightLine.Size = UDim2.new(0.5, -20, 0, 1)
		RightLine.ZIndex = LayerIndex + 9

		local function UpdateDivider()
			local Text = TextLabel.Text;

			if Text == "" then
				TextLabel.Visible = false;
				LeftLine.Size = UDim2.new(1, -20, 0, 1);
				RightLine.Visible = false;
				return;
			end;

			TextLabel.Visible = true;
			RightLine.Visible = true;

			local MaxTextWidth = math.max(40, DividerFrame.AbsoluteSize.X - 70);
			local TextWidth = math.min(TextService:GetTextSize(Text, TextLabel.TextSize, TextLabel.Font, Vector2.new(math.huge, math.huge)).X + 16, MaxTextWidth);
			TextLabel.Size = UDim2.new(0, TextWidth, 0, 16);
			LeftLine.Size = UDim2.new(0.5, -(TextWidth / 2) - 12, 0, 1);
			RightLine.Size = UDim2.new(0.5, -(TextWidth / 2) - 12, 0, 1);
		end;

		function Divider:SetText(text)
			Config.Text = tostring(text or "");
			TextLabel.Text = Config.Text;
			UpdateDivider();
			return Divider;
		end;

		function Divider:GetText()
			return TextLabel.Text;
		end;

		function Divider:SetVisible(value)
			DividerFrame.Visible = value ~= false;
			return Divider;
		end;

		Divider.SetRender = LPH_NO_VIRTUALIZE(function(value)
			L2Hub.PlayAnimate(LeftLine , SlowyTween , {
				BackgroundTransparency = value and 0.650 or 1
			});
			L2Hub.PlayAnimate(RightLine , SlowyTween , {
				BackgroundTransparency = value and 0.650 or 1
			});
			L2Hub.PlayAnimate(TextLabel , SlowyTween , {
				TextTransparency = value and 0.500 or 1
			});
		end);

		UpdateDivider();
		L2Hub:AddSignal(DividerFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateDivider));
		Divider.SetRender(Signel:GetValue());
		Signel:Connect(Divider.SetRender);

		return CaseInsensitive(Divider);
	end;

	function idx:AddSpacer(Size)
		local Spacer = {};
		local Height = 8;

		if typeof(Size) == "table" then
			Height = tonumber(Size.Size or Size.Height or Size[1]) or Height;
		else
			Height = tonumber(Size) or Height;
		end;

		local SpacerFrame = Instance.new("Frame")
		SpacerFrame.Name = L2Hub.RandomString();
		SpacerFrame.Parent = Frame
		SpacerFrame.BackgroundTransparency = 1.000
		SpacerFrame.BorderSizePixel = 0
		SpacerFrame.Size = UDim2.new(1, 0, 0, Height)
		SpacerFrame.ZIndex = LayerIndex + 8

		function Spacer:SetSize(size)
			Height = tonumber(size) or Height;
			SpacerFrame.Size = UDim2.new(1, 0, 0, Height);
			return Spacer;
		end;

		function Spacer:GetSize()
			return Height;
		end;

		function Spacer:SetVisible(value)
			SpacerFrame.Visible = value ~= false;
			return Spacer;
		end;

		Spacer.SetRender = LPH_NO_VIRTUALIZE(function(value)
			SpacerFrame.Visible = value == true;
		end);

		Spacer.SetRender(Signel:GetValue());
		Signel:Connect(Spacer.SetRender);

		return CaseInsensitive(Spacer);
	end;

	function idx:AddProgressBar(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Value = tonumber(Config) or 0,
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "Progress",
			Value = 0,
			Max = 100,
			Type = "%",
			Locked = false,
			TextLocked = "Locked",
		});

		local Progress = {};
		local ProgressFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local ValueLabel = Instance.new("TextLabel")
		local BarBack = Instance.new("Frame")
		local BarBackCorner = Instance.new("UICorner")
		local BarFill = Instance.new("Frame")
		local BarFillCorner = Instance.new("UICorner")
		local LineFrame = Instance.new("Frame")

		L2Hub:AddQuery(ProgressFrame , Config.Name);

		ProgressFrame.Name = L2Hub.RandomString();
		ProgressFrame.Parent = Frame
		ProgressFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		ProgressFrame.BackgroundTransparency = 1.000
		ProgressFrame.BorderSizePixel = 0
		ProgressFrame.ClipsDescendants = true
		ProgressFrame.Size = UDim2.new(1, 0, 0, 45)
		ProgressFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(Progress, ProgressFrame, Config);

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ProgressFrame

		Title.Name = L2Hub.RandomString();
		Title.Parent = ProgressFrame
		Title.BackgroundTransparency = 1.000
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0, 11, 0, 6)
		Title.Size = UDim2.new(1, -90, 0, 15)
		Title.ZIndex = LayerIndex + 9
		Title.Font = Enum.Font.GothamBold
		Title.Text = tostring(Config.Name)
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 13.000
		Title.TextTransparency = 0.250
		Title.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(Title);

		ValueLabel.Name = L2Hub.RandomString();
		ValueLabel.Parent = ProgressFrame
		ValueLabel.BackgroundTransparency = 1.000
		ValueLabel.BorderSizePixel = 0
		ValueLabel.Position = UDim2.new(1, -80, 0, 6)
		ValueLabel.Size = UDim2.new(0, 69, 0, 15)
		ValueLabel.ZIndex = LayerIndex + 9
		ValueLabel.Font = Enum.Font.GothamBold
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 12.000
		ValueLabel.TextTransparency = 0.500
		ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

		BarBack.Name = L2Hub.RandomString();
		BarBack.Parent = ProgressFrame
		BarBack.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		BarBack.BorderSizePixel = 0
		BarBack.Position = UDim2.new(0, 11, 0, 27)
		BarBack.Size = UDim2.new(1, -22, 0, 8)
		BarBack.ZIndex = LayerIndex + 9

		BarBackCorner.CornerRadius = UDim.new(1, 0)
		BarBackCorner.Parent = BarBack

		BarFill.Name = L2Hub.RandomString();
		BarFill.Parent = BarBack
		BarFill.BackgroundColor3 = L2Hub.AccentColor
		BarFill.BorderSizePixel = 0
		BarFill.Size = UDim2.fromScale(0, 1)
		BarFill.ZIndex = LayerIndex + 10

		BarFillCorner.CornerRadius = UDim.new(1, 0)
		BarFillCorner.Parent = BarFill

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = ProgressFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		local function UpdateProgress()
			local MaxValue = math.max(tonumber(Config.Max) or 1, 0.0001);
			local Value = math.clamp(tonumber(Config.Value) or 0, 0, MaxValue);
			local Percent = Value / MaxValue;
			local DisplayValue = L2Hub.Rounding(Value, 2);
			local DisplayMax = L2Hub.Rounding(MaxValue, 2);

			if Config.Type == "%" then
				ValueLabel.Text = tostring(L2Hub.Rounding(Percent * 100, 0)).."%";
			else
				ValueLabel.Text = tostring(DisplayValue).."/"..tostring(DisplayMax)..tostring(Config.Type or "");
			end;

			L2Hub.PlayAnimate(BarFill , SlowyTween , {
				Size = UDim2.fromScale(Percent, 1),
				BackgroundColor3 = L2Hub.AccentColor
			});
		end;

		function Progress:SetValue(value)
			Config.Value = tonumber(value) or Config.Value;
			UpdateProgress();
			return Progress;
		end;

		function Progress:GetValue()
			return Config.Value;
		end;

		function Progress:SetMax(max)
			Config.Max = tonumber(max) or Config.Max;
			UpdateProgress();
			return Progress;
		end;

		function Progress:SetText(text)
			Config.Name = tostring(text or "");
			Title.Text = Config.Name;
			return Progress;
		end;

		function Progress:SetType(text)
			Config.Type = tostring(text or "");
			UpdateProgress();
			return Progress;
		end;

		function Progress:SetVisible(value)
			ProgressFrame.Visible = value ~= false;
			return Progress;
		end;

		Progress.SetRender = LPH_NO_VIRTUALIZE(function(value)
			L2Hub.PlayAnimate(Title , SlowyTween , { TextTransparency = value and 0.250 or 1 });
			L2Hub.PlayAnimate(ValueLabel , SlowyTween , { TextTransparency = value and 0.500 or 1 });
			L2Hub.PlayAnimate(BarBack , SlowyTween , { BackgroundTransparency = value and 0 or 1 });
			L2Hub.PlayAnimate(BarFill , SlowyTween , { BackgroundTransparency = value and 0 or 1 });
			L2Hub.PlayAnimate(LineFrame , SlowyTween , { BackgroundTransparency = value and 0.650 or 1 });
		end);

		UpdateProgress();
		Progress.SetRender(Signel:GetValue());
		Signel:Connect(Progress.SetRender);

		return CaseInsensitive(Progress);
	end;

	function idx:AddCodeBlock(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Code = tostring(Config or ""),
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "Code",
			Code = "",
			RichText = false,
			Copy = true,
			CopyText = "Copy",
			Locked = false,
			TextLocked = "Locked",
		});

		local CodeBlock = {};
		local CodeFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local CodeLabel = Instance.new("TextLabel")
		local CodeCorner = Instance.new("UICorner")
		local CodePadding = Instance.new("UIPadding")
		local CopyButton = Instance.new("Frame")
		local CopyCorner = Instance.new("UICorner")
		local CopyStroke = Instance.new("UIStroke")
		local CopyIcon = Instance.new("ImageLabel")
		local LineFrame = Instance.new("Frame")

		L2Hub:AddQuery(CodeFrame , Config.Name);

		CodeFrame.Name = L2Hub.RandomString();
		CodeFrame.Parent = Frame
		CodeFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		CodeFrame.BackgroundTransparency = 1.000
		CodeFrame.BorderSizePixel = 0
		CodeFrame.ClipsDescendants = true
		CodeFrame.Size = UDim2.new(1, 0, 0, 60)
		CodeFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(CodeBlock, CodeFrame, Config);

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = CodeFrame

		CodeLabel.Name = L2Hub.RandomString();
		CodeLabel.Parent = CodeFrame
		CodeLabel.BackgroundColor3 = Color3.fromRGB(18, 19, 25)
		CodeLabel.BackgroundTransparency = 0.150
		CodeLabel.BorderSizePixel = 0
		CodeLabel.Position = UDim2.new(0, 10, 0, 7)
		CodeLabel.Size = UDim2.new(1, -20, 0, 40)
		CodeLabel.ZIndex = LayerIndex + 9
		CodeLabel.Font = Enum.Font.Code
		CodeLabel.RichText = Config.RichText == true
		CodeLabel.Text = tostring(Config.Code)
		CodeLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
		CodeLabel.TextSize = 12.000
		CodeLabel.TextTransparency = 0.200
		CodeLabel.TextWrapped = true
		CodeLabel.TextXAlignment = Enum.TextXAlignment.Left
		CodeLabel.TextYAlignment = Enum.TextYAlignment.Top

		CodeCorner.CornerRadius = UDim.new(0, 5)
		CodeCorner.Parent = CodeLabel

		CodePadding.PaddingTop = UDim.new(0, 7)
		CodePadding.PaddingBottom = UDim.new(0, 7)
		CodePadding.PaddingLeft = UDim.new(0, 7)
		CodePadding.PaddingRight = UDim.new(0, Config.Copy ~= false and 35 or 7)
		CodePadding.Parent = CodeLabel

		CopyButton.Name = L2Hub.RandomString();
		CopyButton.Parent = CodeFrame
		CopyButton.AnchorPoint = Vector2.new(1, 0)
		CopyButton.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		CopyButton.BackgroundTransparency = Config.Copy ~= false and 0.100 or 1
		CopyButton.BorderSizePixel = 0
		CopyButton.ClipsDescendants = true
		CopyButton.Position = UDim2.new(1, -16, 0, 13)
		CopyButton.Size = UDim2.new(0, 24, 0, 24)
		CopyButton.Visible = Config.Copy ~= false
		CopyButton.ZIndex = LayerIndex + 12

		CopyCorner.CornerRadius = UDim.new(0, 5)
		CopyCorner.Parent = CopyButton

		CopyStroke.Transparency = 0.650
		CopyStroke.Color = Color3.fromRGB(45, 48, 58)
		CopyStroke.Parent = CopyButton

		CopyIcon.Name = L2Hub.RandomString();
		CopyIcon.Parent = CopyButton
		CopyIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		CopyIcon.BackgroundTransparency = 1
		CopyIcon.BorderSizePixel = 0
		CopyIcon.Position = UDim2.fromScale(0.5, 0.5)
		CopyIcon.Size = UDim2.new(0, 15, 0, 15)
		CopyIcon.ZIndex = LayerIndex + 13
		CopyIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		CopyIcon.ImageTransparency = 0.250
		CopyIcon.ScaleType = Enum.ScaleType.Fit
		L2Hub:SetIconMode(CopyIcon, "lucide:copy")

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = CodeFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		local function UpdateCodeSize()
			local Width = math.max(120, CodeFrame.AbsoluteSize.X - 32);
			local Size = TextService:GetTextSize(CodeLabel.Text,CodeLabel.TextSize,CodeLabel.Font,Vector2.new(Width,math.huge));
			local Height = math.max(40, Size.Y + 14);

			CodeLabel.Size = UDim2.new(1, -20, 0, Height);
			CodeFrame.Size = UDim2.new(1, 0, 0, Height + 15);
		end;

		local function GetClipboardWriter()
			return setclipboard or toclipboard or set_clipboard or (syn and syn.write_clipboard) or nil;
		end;

		function CodeBlock:Copy()
			local Writer = GetClipboardWriter();

			if not Writer then
				L2Hub:SetIconMode(CopyIcon, "lucide:x")
				task.delay(0.85, function()
					if CopyIcon and CopyIcon.Parent then
						L2Hub:SetIconMode(CopyIcon, "lucide:copy")
					end;
				end)
				return false;
			end;

			local Success = pcall(function()
				Writer(Config.Code);
			end);

			L2Hub:SetIconMode(CopyIcon, Success and "lucide:check" or "lucide:x")
			task.delay(0.85, function()
				if CopyIcon and CopyIcon.Parent then
					L2Hub:SetIconMode(CopyIcon, "lucide:copy")
				end;
			end)

			return Success;
		end;

		function CodeBlock:SetCode(code)
			Config.Code = tostring(code or "");
			CodeLabel.Text = Config.Code;
			UpdateCodeSize();
			return CodeBlock;
		end;

		function CodeBlock:GetCode()
			return Config.Code;
		end;

		function CodeBlock:SetRichText(value)
			Config.RichText = value == true;
			CodeLabel.RichText = Config.RichText;
			return CodeBlock;
		end;

		function CodeBlock:SetVisible(value)
			CodeFrame.Visible = value ~= false;
			return CodeBlock;
		end;

		function CodeBlock:SetCopyEnabled(value)
			Config.Copy = value == true;
			CopyButton.Visible = Config.Copy;
			CodePadding.PaddingRight = UDim.new(0, Config.Copy and 35 or 7);
			return CodeBlock;
		end;

		local CopyInput = L2Hub:CreateInput(CopyButton, function()
			CodeBlock:Copy();
		end);

		L2Hub:AddSignal(CopyInput.MouseEnter:Connect(function()
			L2Hub.PlayAnimate(CopyButton, SlowyTween, {
				BackgroundTransparency = 0
			});
			L2Hub.PlayAnimate(CopyIcon, SlowyTween, {
				TextTransparency = 0
			});
		end));

		L2Hub:AddSignal(CopyInput.MouseLeave:Connect(function()
			L2Hub.PlayAnimate(CopyButton, SlowyTween, {
				BackgroundTransparency = 0.100
			});
			L2Hub.PlayAnimate(CopyIcon, SlowyTween, {
				TextTransparency = 0.250
			});
		end));

		CodeBlock.SetRender = LPH_NO_VIRTUALIZE(function(value)
			L2Hub.PlayAnimate(CodeLabel , SlowyTween , {
				BackgroundTransparency = value and 0.150 or 1,
				TextTransparency = value and 0.200 or 1
			});
			L2Hub.PlayAnimate(CopyButton , SlowyTween , {
				BackgroundTransparency = (value and Config.Copy) and 0.100 or 1
			});
			L2Hub.PlayAnimate(CopyStroke , SlowyTween , {
				Transparency = (value and Config.Copy) and 0.650 or 1
			});
			L2Hub.PlayAnimate(CopyIcon , SlowyTween , {
				TextTransparency = (value and Config.Copy) and 0.250 or 1
			});
			L2Hub.PlayAnimate(LineFrame , SlowyTween , {
				BackgroundTransparency = value and 0.650 or 1
			});
		end);

		task.defer(UpdateCodeSize);
		L2Hub:AddSignal(CodeFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateCodeSize));
		CodeBlock.SetRender(Signel:GetValue());
		Signel:Connect(CodeBlock.SetRender);

		return CaseInsensitive(CodeBlock);
	end;

	function idx:AddDependencyBox(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Dependencies = Config and { Config } or {},
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "DependencyBox",
			Dependencies = {},
			Mode = "Visible",
			Locked = false,
			TextLocked = "Dependency required",
		});

		local DependencyBox = {};
		local DependencyFrame = Instance.new("Frame")
		local UIStroke = Instance.new("UIStroke")
		local UICorner = Instance.new("UICorner")
		local DependencyHandler = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local DependencySignal = L2Hub:CreateSignal(false);
		local IsRendered = Signel:GetValue() == true;
		local LastMatched;
		local CheckAccumulator = 0;

		local Mode = string.lower(tostring(Config.Mode or "Visible"));
		local LockMode = Mode == "locked" or Mode == "lock";

		local function ResolveDependencyObject(value)
			if typeof(value) == "string" then
				return L2Hub.Flags[value] or value;
			end;

			return value;
		end;

		local function GetDependencyValue(object)
			object = ResolveDependencyObject(object);

			if typeof(object) == "table" and object.GetValue then
				local success, result = pcall(function()
					return object:GetValue();
				end);

				if success then
					return result;
				end;
			end;

			return object;
		end;

		local function CompareDependency(actual, expected)
			if typeof(expected) == "function" then
				local success, result = pcall(expected, actual);
				return success and result == true;
			end;

			if expected == nil then
				return actual == true;
			end;

			if typeof(actual) == "table" then
				if typeof(expected) == "table" then
					for key,value in next, expected do
						if actual[key] ~= value and actual[value] ~= true then
							return false;
						end;
					end;

					return true;
				end;

				return actual[expected] == true or table.find(actual, expected) ~= nil;
			end;

			return actual == expected;
		end;

		local function DependencyMatches(dependency)
			if typeof(dependency) ~= "table" then
				return GetDependencyValue(dependency) == true;
			end;

			local Object = dependency.Object or dependency.Element or dependency[1] or dependency.Flag;
			local Expected = dependency.Value;

			if Expected == nil then
				Expected = dependency.Expected or dependency.Equals or dependency[2];
			end;

			return CompareDependency(GetDependencyValue(Object), Expected);
		end;

		local function DependenciesMatch()
			local Dependencies = Config.Dependencies or {};

			if #Dependencies <= 0 then
				return true;
			end;

			for _,Dependency in ipairs(Dependencies) do
				if not DependencyMatches(Dependency) then
					return false;
				end;
			end;

			return true;
		end;

		DependencyFrame.Name = L2Hub.RandomString();
		DependencyFrame.Parent = Frame
		DependencyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		DependencyFrame.BackgroundTransparency = 0.500
		DependencyFrame.BorderSizePixel = 0
		DependencyFrame.ClipsDescendants = true
		DependencyFrame.Size = UDim2.new(1, 0, 0, 0)
		DependencyFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(DependencyBox, DependencyFrame, {
			Locked = LockMode and not DependenciesMatch() or Config.Locked,
			TextLocked = Config.TextLocked,
		});

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = DependencyFrame

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = DependencyFrame

		DependencyHandler.Name = L2Hub.RandomString();
		DependencyHandler.Parent = DependencyFrame
		DependencyHandler.AnchorPoint = Vector2.new(0.5, 0)
		DependencyHandler.BackgroundTransparency = 1.000
		DependencyHandler.BorderSizePixel = 0
		DependencyHandler.ClipsDescendants = true
		DependencyHandler.Position = UDim2.new(0.5, 0, 0, 5)
		DependencyHandler.Size = UDim2.new(1, -10, 1, -10)
		DependencyHandler.ZIndex = LayerIndex + 9

		UIListLayout.Parent = DependencyHandler
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local Inner = L2Hub:RegisiterItem(DependencyHandler, DependencySignal);

		local function UpdateSize()
			local Matched = DependenciesMatch();
			local ShouldShow = IsRendered and (LockMode or Matched);
			local ContentHeight = UIListLayout.AbsoluteContentSize.Y;
			local TargetHeight = (ShouldShow and ContentHeight > 0) and (ContentHeight + 10) or 0;

			DependencyFrame.Visible = ShouldShow;
			DependencySignal:SetValue(IsRendered and (LockMode or Matched));
			DependencyBox:SetLocked(Config.Locked == true or (LockMode and not Matched));

			L2Hub.PlayAnimate(DependencyFrame, VSlowTween, {
				Size = UDim2.new(1, 0, 0, TargetHeight),
				BackgroundTransparency = ShouldShow and 0.500 or 1,
			});

			L2Hub.PlayAnimate(UIStroke, SlowyTween, {
				Transparency = ShouldShow and 0.650 or 1,
			});

			LastMatched = Matched;
		end;

		function DependencyBox:SetDependencies(dependencies)
			Config.Dependencies = dependencies or {};
			UpdateSize();
			return DependencyBox;
		end;

		function DependencyBox:GetDependencies()
			return Config.Dependencies;
		end;

		function DependencyBox:SetMode(mode)
			Config.Mode = tostring(mode or Config.Mode);
			Mode = string.lower(Config.Mode);
			LockMode = Mode == "locked" or Mode == "lock";
			UpdateSize();
			return DependencyBox;
		end;

		function DependencyBox:GetValue()
			return DependenciesMatch();
		end;

		function DependencyBox:SetVisible(value)
			IsRendered = value ~= false and Signel:GetValue() == true;
			UpdateSize();
			return DependencyBox;
		end;

		for key,value in next, Inner do
			if DependencyBox[key] == nil then
				DependencyBox[key] = value;
			end;
		end;

		L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateSize));

		Signel:Connect(function(value)
			IsRendered = value == true;
			UpdateSize();
		end);

		L2Hub:AddSignal(RunService.RenderStepped:Connect(function(dt)
			CheckAccumulator = CheckAccumulator + (dt or 0);

			if CheckAccumulator < 0.1 then
				return;
			end;

			CheckAccumulator = 0;

			local Matched = DependenciesMatch();
			if Matched ~= LastMatched then
				UpdateSize();
			end;
		end));

		UpdateSize();

		return CaseInsensitive(DependencyBox);
	end;

	function idx:AddDependencyGroupbox(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Name = tostring(Config or "Dependency Groupbox"),
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "Dependency Groupbox",
			Dependencies = {},
			Mode = "Visible",
			Collapsible = false,
			Collapsed = false,
			Locked = false,
			TextLocked = "Dependency required",
		});

		local Groupbox = {};
		local GroupFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Title = Instance.new("TextLabel")
		local CollapseIcon = Instance.new("ImageLabel")
		local GroupHandler = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local GroupSignal = L2Hub:CreateSignal(false);
		local IsRendered = Signel:GetValue() == true;
		local LastMatched;
		local CheckAccumulator = 0;
		local HeaderHeight = 28;

		local Mode = string.lower(tostring(Config.Mode or "Visible"));
		local LockMode = Mode == "locked" or Mode == "lock";
		local Collapsible = Config.Collapsible == true;
		local Collapsed = Config.Collapsed == true;

		local function ResolveDependencyObject(value)
			if typeof(value) == "string" then
				return L2Hub.Flags[value] or value;
			end;

			return value;
		end;

		local function GetDependencyValue(object)
			object = ResolveDependencyObject(object);

			if typeof(object) == "table" and object.GetValue then
				local success, result = pcall(function()
					return object:GetValue();
				end);

				if success then
					return result;
				end;
			end;

			return object;
		end;

		local function CompareDependency(actual, expected)
			if typeof(expected) == "function" then
				local success, result = pcall(expected, actual);
				return success and result == true;
			end;

			if expected == nil then
				return actual == true;
			end;

			if typeof(actual) == "table" then
				if typeof(expected) == "table" then
					for key,value in next, expected do
						if actual[key] ~= value and actual[value] ~= true then
							return false;
						end;
					end;

					return true;
				end;

				return actual[expected] == true or table.find(actual, expected) ~= nil;
			end;

			return actual == expected;
		end;

		local function DependencyMatches(dependency)
			if typeof(dependency) ~= "table" then
				return GetDependencyValue(dependency) == true;
			end;

			local Object = dependency.Object or dependency.Element or dependency[1] or dependency.Flag;
			local Expected = dependency.Value;

			if Expected == nil then
				Expected = dependency.Expected or dependency.Equals or dependency[2];
			end;

			return CompareDependency(GetDependencyValue(Object), Expected);
		end;

		local function DependenciesMatch()
			local Dependencies = Config.Dependencies or {};

			if #Dependencies <= 0 then
				return true;
			end;

			for _,Dependency in ipairs(Dependencies) do
				if not DependencyMatches(Dependency) then
					return false;
				end;
			end;

			return true;
		end;

		GroupFrame.Name = L2Hub.RandomString();
		GroupFrame.Parent = Frame
		GroupFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		GroupFrame.BackgroundTransparency = 0.500
		GroupFrame.BorderSizePixel = 0
		GroupFrame.ClipsDescendants = true
		GroupFrame.Size = UDim2.new(1, 0, 0, 0)
		GroupFrame.ZIndex = LayerIndex + 8
		L2Hub:AttachLockMethods(Groupbox, GroupFrame, {
			Locked = Config.Locked == true or (LockMode and not DependenciesMatch()),
			TextLocked = Config.TextLocked,
		});

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = GroupFrame

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = GroupFrame

		Title.Name = L2Hub.RandomString();
		Title.Parent = GroupFrame
		Title.BackgroundTransparency = 1.000
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0, 11, 0, 7)
		Title.Size = UDim2.new(1, -45, 0, 16)
		Title.ZIndex = LayerIndex + 10
		Title.Font = Enum.Font.GothamBold
		Title.Text = tostring(Config.Name)
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 13.000
		Title.TextTransparency = 0.200
		Title.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(Title);

		CollapseIcon.Name = L2Hub.RandomString();
		CollapseIcon.Parent = GroupFrame
		CollapseIcon.AnchorPoint = Vector2.new(1, 0)
		CollapseIcon.BackgroundTransparency = 1.000
		CollapseIcon.BorderSizePixel = 0
		CollapseIcon.Position = UDim2.new(1, -8, 0, 2)
		CollapseIcon.Size = UDim2.new(0, 22, 0, 22)
		CollapseIcon.Visible = Collapsible
		CollapseIcon.ZIndex = LayerIndex + 10
		L2Hub:SetIconMode(CollapseIcon, "chevron-small-down")
		CollapseIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		CollapseIcon.ImageTransparency = 0.500
		CollapseIcon.ScaleType = Enum.ScaleType.Fit

		GroupHandler.Name = L2Hub.RandomString();
		GroupHandler.Parent = GroupFrame
		GroupHandler.AnchorPoint = Vector2.new(0.5, 0)
		GroupHandler.BackgroundTransparency = 1.000
		GroupHandler.BorderSizePixel = 0
		GroupHandler.ClipsDescendants = true
		GroupHandler.Position = UDim2.new(0.5, 0, 0, HeaderHeight)
		GroupHandler.Size = UDim2.new(1, -10, 1, -HeaderHeight - 5)
		GroupHandler.ZIndex = LayerIndex + 9

		UIListLayout.Parent = GroupHandler
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local Inner = L2Hub:RegisiterItem(GroupHandler, GroupSignal);

		local function UpdateSize()
			local Matched = DependenciesMatch();
			local ShouldShow = IsRendered and (LockMode or Matched);
			local ShowContent = ShouldShow and not Collapsed;
			local ContentHeight = UIListLayout.AbsoluteContentSize.Y;
			local TargetHeight = ShouldShow and HeaderHeight or 0;

			if ShowContent and ContentHeight > 0 then
				TargetHeight = ContentHeight + HeaderHeight + 5;
			end;

			GroupFrame.Visible = ShouldShow;
			GroupHandler.Visible = ShowContent;
			GroupSignal:SetValue(ShowContent);
			Groupbox:SetLocked(Config.Locked == true or (LockMode and not Matched));

			L2Hub.PlayAnimate(GroupFrame, VSlowTween, {
				Size = UDim2.new(1, 0, 0, TargetHeight),
				BackgroundTransparency = ShouldShow and 0.500 or 1,
			});

			L2Hub.PlayAnimate(UIStroke, SlowyTween, {
				Transparency = ShouldShow and 0.650 or 1,
			});

			L2Hub.PlayAnimate(Title, SlowyTween, {
				TextTransparency = ShouldShow and 0.200 or 1,
			});

			L2Hub.PlayAnimate(CollapseIcon, SlowyTween, {
				ImageTransparency = (ShouldShow and Collapsible) and 0.500 or 1,
				Rotation = Collapsed and -90 or 0,
			});

			LastMatched = Matched;
		end;

		function Groupbox:SetText(text)
			Config.Name = tostring(text or "");
			Title.Text = Config.Name;
			return Groupbox;
		end;

		function Groupbox:GetText()
			return Title.Text;
		end;

		function Groupbox:SetDependencies(dependencies)
			Config.Dependencies = dependencies or {};
			UpdateSize();
			return Groupbox;
		end;

		function Groupbox:GetDependencies()
			return Config.Dependencies;
		end;

		function Groupbox:SetMode(mode)
			Config.Mode = tostring(mode or Config.Mode);
			Mode = string.lower(Config.Mode);
			LockMode = Mode == "locked" or Mode == "lock";
			UpdateSize();
			return Groupbox;
		end;

		function Groupbox:GetValue()
			return DependenciesMatch();
		end;

		function Groupbox:SetCollapsed(value)
			Collapsed = value == true;
			Config.Collapsed = Collapsed;
			UpdateSize();
			return Groupbox;
		end;

		function Groupbox:ToggleCollapsed()
			return Groupbox:SetCollapsed(not Collapsed);
		end;

		function Groupbox:GetCollapsed()
			return Collapsed;
		end;

		function Groupbox:SetCollapsible(value)
			Collapsible = value == true;
			Config.Collapsible = Collapsible;
			CollapseIcon.Visible = Collapsible;

			if not Collapsible then
				Collapsed = false;
				Config.Collapsed = false;
			end;

			UpdateSize();
			return Groupbox;
		end;

		function Groupbox:SetVisible(value)
			IsRendered = value ~= false and Signel:GetValue() == true;
			UpdateSize();
			return Groupbox;
		end;

		for key,value in next, Inner do
			if Groupbox[key] == nil then
				Groupbox[key] = value;
			end;
		end;

		if Collapsible then
			local CollapseInput = L2Hub:CreateInput(GroupFrame, LPH_NO_VIRTUALIZE(function()
				Groupbox:ToggleCollapsed();
			end));
			CollapseInput.ZIndex = LayerIndex + 20;
			CollapseInput.Size = UDim2.new(1, 0, 0, HeaderHeight);
		end;

		L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateSize));

		Signel:Connect(function(value)
			IsRendered = value == true;
			UpdateSize();
		end);

		L2Hub:AddSignal(RunService.RenderStepped:Connect(function(dt)
			CheckAccumulator = CheckAccumulator + (dt or 0);

			if CheckAccumulator < 0.1 then
				return;
			end;

			CheckAccumulator = 0;

			local Matched = DependenciesMatch();
			if Matched ~= LastMatched then
				UpdateSize();
			end;
		end));

		UpdateSize();

		return CaseInsensitive(Groupbox);
	end;

	function idx:AddUserFrame(Name : string , Profile: string , Expires : string)
		local UserFrame = Instance.new("Frame")
		local UserLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local LogoImage = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local UserStatusLabel = Instance.new("TextLabel")

		UserFrame.Name = L2Hub.RandomString();
		UserFrame.Parent = Frame
		UserFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		UserFrame.BackgroundTransparency = 1.000
		UserFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserFrame.BorderSizePixel = 0
		UserFrame.Size = UDim2.new(1, 0, 0, 60)
		UserFrame.ZIndex = LayerIndex + 8

		UserLabel.Name = L2Hub.RandomString();
		UserLabel.Parent = UserFrame
		UserLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UserLabel.BackgroundTransparency = 1.000
		UserLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserLabel.BorderSizePixel = 0
		UserLabel.Position = UDim2.new(0, 65, 0, 10)
		UserLabel.Size = UDim2.new(1, -35, 0, 15)
		UserLabel.ZIndex = LayerIndex + 9
		UserLabel.Font = Enum.Font.GothamBold
		UserLabel.Text = Name or 'User'
		UserLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		UserLabel.TextSize = 13.000
		UserLabel.TextTransparency = 0.200
		UserLabel.TextXAlignment = Enum.TextXAlignment.Left

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = UserFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = LayerIndex + 11

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = UserFrame

		LogoImage.Name = L2Hub.RandomString();
		LogoImage.Parent = UserFrame
		LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogoImage.BackgroundTransparency = 1.000
		LogoImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogoImage.BorderSizePixel = 0
		LogoImage.Position = UDim2.new(0, 10, 0, 5)
		LogoImage.Size = UDim2.new(0, 45, 0, 45)
		LogoImage.ZIndex = LayerIndex + 9
		LogoImage.Image = Profile or "rbxasset://textures/ui/clb_robux_20@3x.png";

		UICorner_2.CornerRadius = UDim.new(1, 0)
		UICorner_2.Parent = LogoImage

		UserStatusLabel.Name = L2Hub.RandomString();
		UserStatusLabel.Parent = UserFrame
		UserStatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UserStatusLabel.BackgroundTransparency = 1.000
		UserStatusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UserStatusLabel.BorderSizePixel = 0
		UserStatusLabel.Position = UDim2.new(0, 65, 0, 25)
		UserStatusLabel.Size = UDim2.new(1, -35, 0, 15)
		UserStatusLabel.ZIndex = LayerIndex + 9
		UserStatusLabel.Font = Enum.Font.GothamBold
		UserStatusLabel.Text = Expires or 'Never'
		UserStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		UserStatusLabel.TextSize = 13.000
		UserStatusLabel.TextTransparency = 0.200
		UserStatusLabel.TextXAlignment = Enum.TextXAlignment.Left

		local UserFrameItem = {};

		UserFrameItem.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				L2Hub.PlayAnimate(UserLabel,SlowyTween,{
					TextTransparency = 0.200
				})

				L2Hub.PlayAnimate(LineFrame,SlowyTween,{
					BackgroundTransparency = 0.650
				})

				L2Hub.PlayAnimate(LogoImage,SlowyTween,{
					ImageTransparency = 0
				})

				L2Hub.PlayAnimate(UserStatusLabel,SlowyTween,{
					TextTransparency = 0.200
				})
			else
				L2Hub.PlayAnimate(UserLabel,SlowyTween,{
					TextTransparency = 1
				})

				L2Hub.PlayAnimate(LineFrame,SlowyTween,{
					BackgroundTransparency = 1
				})

				L2Hub.PlayAnimate(LogoImage,SlowyTween,{
					ImageTransparency = 1
				})

				L2Hub.PlayAnimate(UserStatusLabel,SlowyTween,{
					TextTransparency = 1
				})
			end;
		end);

		UserFrameItem.SetRender(Signel:GetValue())
		Signel:Connect(UserFrameItem.SetRender);

		function UserFrameItem:SetUsername(name)
			UserLabel.Text = name or 'User'
		end;

		function UserFrameItem:SetProfile(Profile)
			LogoImage.Image = Profile or "rbxasset://textures/ui/clb_robux_20@3x.png";
		end;

		function UserFrameItem:SetExpires(Exp)
			UserStatusLabel.Text = Exp or 'Never';
		end;

		return CaseInsensitive(UserFrameItem);
	end;

	function idx:AddToggle(Config)
		if Config.Name then
			return self:AddLabel(Config.Name):AddToggle(Config)
		else
			error("Name is required for AddToggle in sections")
		end
	end

	function idx:AddSlider(Config)
		if Config.Name then
			return self:AddLabel(Config.Name):AddSlider(Config)
		else
			error("Name is required for AddSlider in sections")
		end
	end

	function idx:AddDropdown(Config)
		if Config.Name then
			return self:AddLabel(Config.Name):AddDropdown(Config)
		else
			error("Name is required for AddDropdown in sections")
		end
	end

	function idx:AddKeybind(Config)
		if Config.Name then
			return self:AddLabel(Config.Name):AddKeybind(Config)
		else
			error("Name is required for AddKeybind in sections")
		end
	end

	function idx:AddColorPicker(Config)
		if Config.Name then
			return self:AddLabel(Config.Name):AddColorPicker(Config)
		else
			error("Name is required for AddColorPicker in sections")
		end
	end

	function idx:AddTextInput(Config)
		if Config.Name then
			local IsTextarea = string.lower(tostring(Config.Type or "TextInput")) == "textarea";

			if IsTextarea then
				Config.FullWidth = Config.FullWidth ~= false;
				return self:AddLabel(Config.Name):SetStacked(true):AddTextInput(Config)
			end;

			return self:AddLabel(Config.Name):AddTextInput(Config)
		else
			error("Name is required for AddTextInput in sections")
		end
	end
	
	idx.AddInput = idx.AddTextInput;
	
	function idx:AddStatusShortcut(Config)
	    return self:AddStatus(Config);
    end

	return CaseInsensitive(idx);
end;

function L2Hub:CreateWindow(Config)
	Config = Config or {};
	local ConfigSettings = (typeof(Config.Config) == "table" and Config.Config) or {};

	if Config.Title ~= nil and Config.Name == nil then
		Config.Name = Config.Title;
	end;

	if Config.Image ~= nil and Config.Logo == nil then
		local image = tostring(Config.Image);
		Config.Logo = (image:find("rbxassetid://",1,true) and image) or ("rbxassetid://"..image);
	end;

	if typeof(Config.Color) == "Color3" then
		L2Hub.AccentColor = Config.Color;
	end;

	if ConfigSettings.ConfigFolder ~= nil and Config.ConfigFolder == nil then
		Config.ConfigFolder = ConfigSettings.ConfigFolder;
	end;

	if ConfigSettings.TextGradient ~= nil and Config.TextGradient == nil then
		Config.TextGradient = ConfigSettings.TextGradient;
	end;

	if Config.Size == nil then
		Config.Size = L2Hub.IsMobile and L2Hub.Scales.Mobile or L2Hub.Scales.Large;
	end;

	local GameName = "Premium Script"
pcall(function() GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)

    Config = L2Hub:ProcessParams(Config , {
	Logo = "rbxassetid://105349270202991",
	Name = "L2-HUB",
	Content = GameName,
	    Size = L2Hub.IsMobile and L2Hub.Scales.Mobile or L2Hub.Scales.Large,
	    Font = nil,
	    ConfigFolder = "L2Hub_Configs",
		Uitransparent = nil,
		ShowUser = true,
		Search = true,
		ConfigEnabled = true,
		TextGradient = true,
		RunningText = false,
		NotifyOnCallbackError = false,
		Loadingscreen = false,
		Enable3DRenderer = false,
		Keybind = "RightControl"
	});

	L2Hub:SetTextGradientEnabled(Config.TextGradient);
	if Config.Font ~= nil then
		L2Hub:SetFont(Config.Font);
	end;

	Config.ConfigFolder = tostring(Config.ConfigFolder):gsub("[/\\]+$","");
	
	
	-- Registrasi Active Window
	local Window = {
		Logo = Config.Logo,
		Name = Config.Name,
		Content = Config.Content,
		Size = Config.Size,
		ConfigFolder = Config.ConfigFolder,
		Font = Config.Font,
		Uitransparent = Config.Uitransparent,
		ShowUser = Config.ShowUser,
		SearchEnabled = Config.Search,
		ConfigEnabled = Config.ConfigEnabled and Config.Config ~= false,
		RunningText = Config.RunningText == true,
		ConfigAutoSaveFile = ConfigSettings.AutoSaveFile or "Default",
		ConfigAutoSave = ConfigSettings.AutoSave ~= false,
		ConfigAutoLoad = ConfigSettings.AutoLoad ~= false,
		ConfigOverwrite = ConfigSettings.Overwrite ~= false,
		ConfigEncrypted = ConfigSettings.Encrypted == true or string.lower(tostring(ConfigSettings.Format or "")) == "encoded",
		ConfigShowAutoSaveToggle = ConfigSettings.ShowAutoSaveToggle == true,
		ConfigSaveWindowState = ConfigSettings.SaveWindowState == true,
		Signal = L2Hub:CreateSignal(true),
		Tabs = {},
		CurrentTab = 1,
		NotifyOnCallbackError = Config.NotifyOnCallbackError == true,
		Loadingscreen = Config.Loadingscreen == true or Config.LoadingScreen == true or Config.Loading == true,
		OnDestroyCallbacks = {},
		Keybind = Config.Keybind,
		Enable3DRenderer = Config.Enable3DRenderer,
		IconLocked = false,
		HideName = false,
		RealUsername = LocalPlayer.DisplayName
	};

	if type(Config.OnDestroy) == "function" then
		table.insert(Window.OnDestroyCallbacks, Config.OnDestroy);
	end;

	L2Hub.GlobalLogo = Window.Logo;
	L2Hub.ActiveWindow = Window;

	local Logging = L2Hub:CreateLogger();
	if not isfolder(Window.ConfigFolder) then
		makefolder(Window.ConfigFolder);
	end;

	local WindowFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local LeftMenuFrame = Instance.new("Frame")
	local HeadFrame = Instance.new("Frame")
	local LogoImage = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local WindowName = Instance.new("TextLabel")
	local WindowContent = Instance.new("TextLabel")
	local LineFrame = Instance.new("Frame")
	local LeftScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local BottomFrame = Instance.new("Frame")
	local AccountProfile = Instance.new("ImageLabel")
	local UICorner_3 = Instance.new("UICorner")
	local AccountName = Instance.new("TextLabel")
	local ExpireLabel = Instance.new("TextLabel")
	local LineFrame_2 = Instance.new("Frame")
	local UserSettingButton = Instance.new("ImageLabel")
	local RightMenuFrame = Instance.new("Frame")
	local UIStroke = Instance.new("UIStroke")
	local UICorner_4 = Instance.new("UICorner")
	local RightHeader = Instance.new("Frame")
	local LineFrame_3 = Instance.new("Frame")
	local ConfigFrame = Instance.new("Frame")
	local UIStroke_2 = Instance.new("UIStroke")
	local UICorner_5 = Instance.new("UICorner")
	local ConfigIcon = Instance.new("ImageLabel")
	local LineFrame_4 = Instance.new("Frame")
	local ConfigName = Instance.new("TextLabel")
	local ConfigBthIcon = Instance.new("ImageLabel")
	local SearchFrame = Instance.new("Frame")
    local SearchIcon = Instance.new("ImageLabel")
    local SearchBox = Instance.new("TextBox")
    local CloseButton = Instance.new("ImageLabel")
    local MinimizeButton = Instance.new("ImageLabel")
    local TabContainer = Instance.new("Frame")


	WindowFrame.Name = L2Hub.RandomString();
	WindowFrame.Parent = L2Hub.ScreenGui;
	WindowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	WindowFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	WindowFrame.BackgroundTransparency = Window.Uitransparent or 0.055
	WindowFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowFrame.BorderSizePixel = 0
	WindowFrame.ClipsDescendants = true
	WindowFrame.Position = UDim2.new(255, 0, 255, 0)
	WindowFrame.Size = Window.Size
	WindowFrame.Active = true;
	Window.Root = WindowFrame;

	if Window.Loadingscreen then
		local LoadingOverlay = Instance.new("Frame")
		local LoadingPanel = Instance.new("Frame")
		local LoadingCorner = Instance.new("UICorner")
		local LoadingStroke = Instance.new("UIStroke")
		local LoadingIcon = Instance.new("ImageLabel")
		local LoadingTitle = Instance.new("TextLabel")
		local LoadingContent = Instance.new("TextLabel")

		LoadingOverlay.Name = L2Hub.RandomString();
		LoadingOverlay.Parent = L2Hub.ScreenGui
		LoadingOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		LoadingOverlay.BackgroundTransparency = 1
		LoadingOverlay.BorderSizePixel = 0
		LoadingOverlay.Size = UDim2.fromScale(1, 1)
		LoadingOverlay.ZIndex = 250

		LoadingPanel.Name = L2Hub.RandomString();
		LoadingPanel.Parent = LoadingOverlay
		LoadingPanel.AnchorPoint = Vector2.new(0.5, 0.5)
		LoadingPanel.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		LoadingPanel.BackgroundTransparency = 1
		LoadingPanel.BorderSizePixel = 0
		LoadingPanel.Position = UDim2.fromScale(0.5, 0.5)
		LoadingPanel.Size = UDim2.fromOffset(260, 92)
		LoadingPanel.ZIndex = 251

		LoadingCorner.CornerRadius = UDim.new(0, 10)
		LoadingCorner.Parent = LoadingPanel

		LoadingStroke.Color = Color3.fromRGB(45, 48, 58)
		LoadingStroke.Transparency = 1
		LoadingStroke.Parent = LoadingPanel

		LoadingIcon.Name = L2Hub.RandomString();
		LoadingIcon.Parent = LoadingPanel
		LoadingIcon.BackgroundTransparency = 1
		LoadingIcon.BorderSizePixel = 0
		LoadingIcon.Position = UDim2.new(0, 18, 0.5, -17)
		LoadingIcon.Size = UDim2.fromOffset(34, 34)
		LoadingIcon.ZIndex = 252
		LoadingIcon.Image = Window.Logo
		LoadingIcon.ImageColor3 = L2Hub.IconColor
		LoadingIcon.ImageTransparency = 1

		LoadingTitle.Name = L2Hub.RandomString();
		LoadingTitle.Parent = LoadingPanel
		LoadingTitle.BackgroundTransparency = 1
		LoadingTitle.BorderSizePixel = 0
		LoadingTitle.Position = UDim2.new(0, 64, 0, 22)
		LoadingTitle.Size = UDim2.new(1, -82, 0, 20)
		LoadingTitle.ZIndex = 252
		LoadingTitle.Font = Enum.Font.GothamBold
		LoadingTitle.Text = tostring(Config.LoadingTitle or Window.Name)
		LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		LoadingTitle.TextSize = 15
		LoadingTitle.TextTransparency = 1
		LoadingTitle.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(LoadingTitle);

		LoadingContent.Name = L2Hub.RandomString();
		LoadingContent.Parent = LoadingPanel
		LoadingContent.BackgroundTransparency = 1
		LoadingContent.BorderSizePixel = 0
		LoadingContent.Position = UDim2.new(0, 64, 0, 45)
		LoadingContent.Size = UDim2.new(1, -82, 0, 18)
		LoadingContent.ZIndex = 252
		LoadingContent.Font = Enum.Font.GothamBold
		LoadingContent.Text = tostring(Config.LoadingContent or "Loading...")
		LoadingContent.TextColor3 = Color3.fromRGB(255, 255, 255)
		LoadingContent.TextSize = 12
		LoadingContent.TextTransparency = 1
		LoadingContent.TextXAlignment = Enum.TextXAlignment.Left

		L2Hub.PlayAnimate(LoadingOverlay, SlowyTween, { BackgroundTransparency = 0.250 })
		L2Hub.PlayAnimate(LoadingPanel, SlowyTween, { BackgroundTransparency = 0.035 })
		L2Hub.PlayAnimate(LoadingStroke, SlowyTween, { Transparency = 0.650 })
		L2Hub.PlayAnimate(LoadingIcon, SlowyTween, { ImageTransparency = 0 })
		L2Hub.PlayAnimate(LoadingTitle, SlowyTween, { TextTransparency = 0 })
		L2Hub.PlayAnimate(LoadingContent, SlowyTween, { TextTransparency = 0.350 })

		task.delay(tonumber(Config.LoadingDuration) or 1.15, function()
			if not LoadingOverlay.Parent then
				return;
			end;

			L2Hub.PlayAnimate(LoadingOverlay, SlowyTween, { BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(LoadingPanel, SlowyTween, { BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(LoadingStroke, SlowyTween, { Transparency = 1 })
			L2Hub.PlayAnimate(LoadingIcon, SlowyTween, { ImageTransparency = 1 })
			L2Hub.PlayAnimate(LoadingTitle, SlowyTween, { TextTransparency = 1 })
			L2Hub.PlayAnimate(LoadingContent, SlowyTween, { TextTransparency = 1 })

			task.delay(0.2, function()
				if LoadingOverlay.Parent then
					LoadingOverlay:Destroy();
				end;
			end);
		end);
	end;

	if not L2Hub.EnabledBlur then
		WindowFrame.BackgroundTransparency = Window.Uitransparent or 0.0255
	end;

	local renderParentWindow = LPH_NO_VIRTUALIZE(function()
		if Window.__3DRender then
			if WindowFrame.BackgroundTransparency > 0.9 then
				WindowFrame.Visible = false;
				WindowFrame.Parent = nil
			else
				WindowFrame.Visible = true;

				L2Hub.PlayAnimate(WindowFrame,VSlowTween , {
					Position = UDim2.fromScale(0.5,0.5);
				});

				WindowFrame.Parent = Window.SurfaceGui;
			end;
		else
			if WindowFrame.BackgroundTransparency > 0.9 then
				WindowFrame.Visible = false;
				WindowFrame.Parent = nil
			else
				WindowFrame.Visible = true;
				WindowFrame.Parent = L2Hub.ScreenGui


			end;
		end;
	end);

	L2Hub:AddSignal(WindowFrame:GetPropertyChangedSignal('BackgroundTransparency'):Connect(renderParentWindow))

	Window.SetRender = LPH_NO_VIRTUALIZE(function(self , value)
		if value then
			L2Hub.PlayAnimate(WindowFrame , SlowyTween , {
				BackgroundTransparency = Window.Uitransparent or ((L2Hub.EnabledBlur and 0.055) or 0.0255),
				Size = Window.Size
			})

			L2Hub.PlayAnimate(LogoImage , SlowyTween , {
				ImageTransparency = 0
			})

			L2Hub.PlayAnimate(WindowName , SlowyTween , {
				TextTransparency = 0
			})

			L2Hub.PlayAnimate(WindowContent , SlowyTween , {
				TextTransparency = 0.650
			})

			L2Hub.PlayAnimate(LineFrame , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			L2Hub.PlayAnimate(AccountProfile , SlowyTween , {
				ImageTransparency = 0
			})

			L2Hub.PlayAnimate(AccountName , SlowyTween , {
				TextTransparency = 0
			})

			L2Hub.PlayAnimate(ExpireLabel , SlowyTween , {
				TextTransparency = 0.650
			})

			L2Hub.PlayAnimate(LineFrame_2 , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			L2Hub.PlayAnimate(UserSettingButton , SlowyTween , {
				TextTransparency = 0.5
			})

			L2Hub.PlayAnimate(RightMenuFrame , SlowyTween , {
				BackgroundTransparency = 0.600
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			})

			L2Hub.PlayAnimate(LineFrame_3 , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			L2Hub.PlayAnimate(ConfigFrame , SlowyTween , {
				BackgroundTransparency = 0.750
			})

			L2Hub.PlayAnimate(UIStroke_2 , SlowyTween , {
				Transparency = 0.650
			})

			L2Hub.PlayAnimate(ConfigIcon , SlowyTween , {
				TextTransparency = 0.250
			})

			L2Hub.PlayAnimate(LineFrame_4 , SlowyTween , {
				BackgroundTransparency = 0.650
			})

			L2Hub.PlayAnimate(ConfigName , SlowyTween , {
				TextTransparency = 0.350
			})

			L2Hub.PlayAnimate(ConfigBthIcon , SlowyTween , {
				TextTransparency = 0.250
			})

			L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
				TextTransparency = 0.250
			})

			L2Hub.PlayAnimate(SearchBox , SlowyTween , {
				TextTransparency = 0.350
			})

			L2Hub.PlayAnimate(CloseButton , SlowyTween , {
				TextTransparency = 0.450
			})
			
			L2Hub.PlayAnimate(MinimizeButton , SlowyTween , {
				TextTransparency = 0.450
			})

			Window.Shadow:Render(false);
		else

			L2Hub.PlayAnimate(WindowFrame , SlowyTween , {
				BackgroundTransparency = 1,
				Size = Window.Size + UDim2.fromOffset(-15,-15)
			})

			L2Hub.PlayAnimate(LogoImage , SlowyTween , {
				ImageTransparency = 1
			})

			L2Hub.PlayAnimate(WindowName , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(WindowContent , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(LineFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(AccountProfile , SlowyTween , {
				ImageTransparency = 1
			})

			L2Hub.PlayAnimate(AccountName , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(ExpireLabel , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(LineFrame_2 , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UserSettingButton , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(RightMenuFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(LineFrame_3 , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(ConfigFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke_2 , SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(ConfigIcon , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(LineFrame_4 , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(ConfigName , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(ConfigBthIcon , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(SearchBox , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(CloseButton , SlowyTween , {
				TextTransparency = 1
			})
			
			L2Hub.PlayAnimate(MinimizeButton , SlowyTween , {
				TextTransparency = 1
			})


			Window.Shadow:Render(false);
		end;
	end);

	Window.Shadow = L2Hub:CreateShadow(WindowFrame);
	Window.Shadow:Render(false);

	task.delay(0.25,function()
		WindowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Window:SetRender(true);
		L2Hub:AddSignal(Window.Signal:Connect(LPH_NO_VIRTUALIZE(function(...)
			Window:SetRender(...);
		end)))
	end)

	if L2Hub.EnabledBlur then
		L2Hub:CreateBlurModule(WindowFrame,Window.Signal);
	end;

	do
		local Frame = Instance.new("Frame")

		Frame.Parent = WindowFrame
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(1, 0, 0, 50)
		Frame.ZIndex = 7
		Frame.BackgroundTransparency = 1;

		L2Hub.Drag(Frame , WindowFrame , 0.15)
	end

	UICorner.Parent = WindowFrame

	LeftMenuFrame.Name = L2Hub.RandomString();
	LeftMenuFrame.Parent = WindowFrame
	LeftMenuFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftMenuFrame.BackgroundTransparency = 1.000
	LeftMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftMenuFrame.BorderSizePixel = 0
	LeftMenuFrame.Size = UDim2.new(0, 175, 1, 0)

	HeadFrame.Name = L2Hub.RandomString();
	HeadFrame.Parent = LeftMenuFrame
	HeadFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HeadFrame.BackgroundTransparency = 1.000
	HeadFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HeadFrame.BorderSizePixel = 0
	HeadFrame.ClipsDescendants = true
	HeadFrame.Size = UDim2.new(1, 0, 0, 50)
	HeadFrame.ZIndex = 7

	LogoImage.Name = L2Hub.RandomString();
	LogoImage.Parent = HeadFrame
	LogoImage.AnchorPoint = Vector2.new(0, 0.5)
	LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoImage.BackgroundTransparency = 1.000
	LogoImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoImage.BorderSizePixel = 0
	LogoImage.Position = UDim2.new(0, 10, 0.5, 0)
	LogoImage.Size = UDim2.new(0, 35, 0, 35)
	LogoImage.ZIndex = 7
	LogoImage.Image = Window.Logo
	LogoImage.ImageColor3 = L2Hub.IconColor

	UICorner_2.CornerRadius = UDim.new(0, 7)
	UICorner_2.Parent = LogoImage

	WindowName.Name = L2Hub.RandomString();
	WindowName.Parent = HeadFrame
	WindowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.BackgroundTransparency = 1.000
	WindowName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowName.BorderSizePixel = 0
	WindowName.Position = UDim2.new(0, 55, 0, 4)
	WindowName.Size = UDim2.new(1, -65, 0, 25)
	WindowName.ZIndex = 7
	WindowName.Font = Enum.Font.GothamBold
	WindowName.Text = Window.Name
	WindowName.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.TextSize = 18.000
	WindowName.TextXAlignment = Enum.TextXAlignment.Left
	L2Hub:AddTextGradient(WindowName);

	WindowContent.Name = L2Hub.RandomString();
	WindowContent.Parent = HeadFrame
	WindowContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowContent.BackgroundTransparency = 1.000
	WindowContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowContent.BorderSizePixel = 0
	WindowContent.Position = UDim2.new(0, 55, 0, 25)
	WindowContent.Size = UDim2.new(1, -65, 0, 15)
	WindowContent.ZIndex = 7
	WindowContent.Font = Enum.Font.GothamBold
	WindowContent.Text = Window.Content
	WindowContent.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowContent.TextSize = 9.000
	WindowContent.TextTransparency = 0.650
	WindowContent.TextXAlignment = Enum.TextXAlignment.Left
	WindowContent.TextTruncate = Enum.TextTruncate.None

	local function EnableHeaderAutoFit(Label, MaxTextSize, MinTextSize)
		MaxTextSize = MaxTextSize or Label.TextSize;
		MinTextSize = MinTextSize or 6;

		local function Refresh()
			task.defer(function()
				if not Label or not Label.Parent then
					return;
				end;

				local Width = math.max(1, Label.AbsoluteSize.X);
				local TextSize = MaxTextSize;

				while TextSize > MinTextSize and TextService:GetTextSize(
					Label.Text,
					TextSize,
					Label.Font,
					Vector2.new(math.huge, Label.AbsoluteSize.Y)
				).X > Width do
					TextSize = TextSize - 1;
				end;

				Label.TextSize = TextSize;
			end);
		end;

		L2Hub:AddSignal(Label:GetPropertyChangedSignal("Text"):Connect(Refresh));
		L2Hub:AddSignal(Label:GetPropertyChangedSignal("AbsoluteSize"):Connect(Refresh));
		Refresh();
	end;

	local function EnableHeaderRunningText(Label, Speed, Gap)
		Speed = Speed or 22;
		Gap = Gap or 45;

		local Clip = Instance.new("Frame");
		Clip.Name = L2Hub.RandomString();
		Clip.Parent = Label.Parent;
		Clip.BackgroundTransparency = 1;
		Clip.BorderSizePixel = 0;
		Clip.ClipsDescendants = true;
		Clip.Position = Label.Position;
		Clip.Size = Label.Size;
		Clip.ZIndex = Label.ZIndex;

		Label.Parent = Clip;
		Label.Position = UDim2.fromOffset(0, 0);
		Label.Size = UDim2.fromScale(1, 1);
		Label.TextTruncate = Enum.TextTruncate.None;

		local Clone = Label:Clone();
		Clone.Name = L2Hub.RandomString();
		Clone.Parent = Clip;
		Clone.Position = UDim2.fromOffset(0, 0);
		Clone.TextTruncate = Enum.TextTruncate.None;
		Clone.Visible = false;

		local TextWidth = 0;
		local ClipWidth = 0;
		local Overflow = false;
		local StartTick = tick();

		local function SyncClone()
			Clone.Text = Label.Text;
			Clone.TextColor3 = Label.TextColor3;
			Clone.TextTransparency = Label.TextTransparency;
			Clone.Font = Label.Font;
			Clone.FontFace = Label.FontFace;
			Clone.TextSize = Label.TextSize;
		end;

		local function Refresh()
			task.defer(function()
				if not Label.Parent or not Clip.Parent then
					return;
				end;

				SyncClone();
				TextWidth = math.ceil(TextService:GetTextSize(Label.Text, Label.TextSize, Label.Font, Vector2.new(math.huge, Clip.AbsoluteSize.Y)).X);
				ClipWidth = math.max(1, Clip.AbsoluteSize.X);
				Overflow = TextWidth > ClipWidth;

				if Overflow then
					Label.Size = UDim2.new(0, TextWidth, 1, 0);
					Clone.Size = UDim2.new(0, TextWidth, 1, 0);
					Clone.Visible = true;
					StartTick = tick();
				else
					Label.Position = UDim2.fromOffset(0, 0);
					Label.Size = UDim2.fromScale(1, 1);
					Clone.Visible = false;
				end;
			end);
		end;

		L2Hub:AddSignal(Label:GetPropertyChangedSignal("Text"):Connect(Refresh));
		L2Hub:AddSignal(Label:GetPropertyChangedSignal("TextSize"):Connect(Refresh));
		L2Hub:AddSignal(Label:GetPropertyChangedSignal("TextTransparency"):Connect(SyncClone));
		L2Hub:AddSignal(Label:GetPropertyChangedSignal("TextColor3"):Connect(SyncClone));
		L2Hub:AddSignal(Clip:GetPropertyChangedSignal("AbsoluteSize"):Connect(Refresh));
		L2Hub:AddSignal(RunService.RenderStepped:Connect(function()
			if not Label.Parent or not Clip.Parent then
				return;
			end;

			if not Overflow then
				return;
			end;

			local Cycle = TextWidth + Gap;
			local X = -(((tick() - StartTick) * Speed) % Cycle);
			Label.Position = UDim2.fromOffset(X, 0);
			Clone.Position = UDim2.fromOffset(X + Cycle, 0);
		end));

		Refresh();

		return Clip;
	end;

	EnableHeaderAutoFit(WindowContent, 9, 6);

	if Window.RunningText then
		EnableHeaderRunningText(WindowName, 24, 50);
	else
		WindowName.TextTruncate = Enum.TextTruncate.None;
	end;

	LineFrame.Name = L2Hub.RandomString();
	LineFrame.Parent = HeadFrame
	LineFrame.AnchorPoint = Vector2.new(0.5, 1)
	LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame.BackgroundTransparency = 0.650
	LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame.BorderSizePixel = 0
	LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
	LineFrame.Size = UDim2.new(1, -10, 0, 1)
	LineFrame.ZIndex = 5

	LeftScrollingFrame.Name = L2Hub.RandomString();
	LeftScrollingFrame.Parent = LeftMenuFrame
	LeftScrollingFrame.Active = true
	LeftScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
	LeftScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftScrollingFrame.BackgroundTransparency = 1.000
	LeftScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftScrollingFrame.BorderSizePixel = 0
	LeftScrollingFrame.Position = UDim2.new(0.5, 0, 0, 60)
	LeftScrollingFrame.Size = UDim2.new(1, -10, 1, -115)
	LeftScrollingFrame.ZIndex = 7
	LeftScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = LeftScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
		LeftScrollingFrame.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y + 1)
	end)))

	BottomFrame.Name = L2Hub.RandomString();
	BottomFrame.Parent = LeftMenuFrame
	BottomFrame.AnchorPoint = Vector2.new(0, 1)
	BottomFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BottomFrame.BackgroundTransparency = 1.000
	BottomFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BottomFrame.BorderSizePixel = 0
	BottomFrame.Position = UDim2.new(0, 0, 1, 0)
	BottomFrame.Size = UDim2.new(1, 0, 0, 50)
	BottomFrame.ZIndex = 7

	AccountProfile.Name = L2Hub.RandomString();
	AccountProfile.Parent = BottomFrame
	AccountProfile.AnchorPoint = Vector2.new(0, 0.5)
	AccountProfile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AccountProfile.BackgroundTransparency = 1.000
	AccountProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AccountProfile.BorderSizePixel = 0
	AccountProfile.Position = UDim2.new(0, 10, 0.5, 0)
	AccountProfile.Size = UDim2.new(0, 35, 0, 35)
	AccountProfile.ZIndex = 7
	AccountProfile.Image = L2Hub.UserProfile or ""

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = AccountProfile

	AccountName.Name = L2Hub.RandomString();
	AccountName.Parent = BottomFrame
	AccountName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AccountName.BackgroundTransparency = 1.000
	AccountName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AccountName.BorderSizePixel = 0
	AccountName.Position = UDim2.new(0, 55, 0, 5)
	AccountName.Size = UDim2.new(0, 100, 0, 25)
	AccountName.ZIndex = 7
	AccountName.Font = Enum.Font.GothamBold
	AccountName.Text = ""
	AccountName.TextColor3 = Color3.fromRGB(255, 255, 255)
	AccountName.TextSize = 14.000
	AccountName.TextXAlignment = Enum.TextXAlignment.Left
	AccountName.TextTruncate = Enum.TextTruncate.SplitWord;

	ExpireLabel.Name = L2Hub.RandomString();
	ExpireLabel.Parent = BottomFrame
	ExpireLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExpireLabel.BackgroundTransparency = 1.000
	ExpireLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ExpireLabel.BorderSizePixel = 0
	ExpireLabel.Position = UDim2.new(0, 55, 0, 25)
	ExpireLabel.Size = UDim2.new(0, 200, 0, 15)
	ExpireLabel.ZIndex = 7
	ExpireLabel.Font = Enum.Font.GothamBold
	ExpireLabel.Text = "never"
	ExpireLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	ExpireLabel.TextSize = 10.000
	ExpireLabel.TextTransparency = 0.650
	ExpireLabel.TextXAlignment = Enum.TextXAlignment.Left

	LineFrame_2.Name = L2Hub.RandomString();
	LineFrame_2.Parent = BottomFrame
	LineFrame_2.AnchorPoint = Vector2.new(0.5, 0)
	LineFrame_2.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame_2.BackgroundTransparency = 0.650
	LineFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame_2.BorderSizePixel = 0
	LineFrame_2.Position = UDim2.new(0.5, 0, 0, 0)
	LineFrame_2.Size = UDim2.new(1, -10, 0, 1)
	LineFrame_2.ZIndex = 5

	UserSettingButton.Name = L2Hub.RandomString();
	UserSettingButton.Parent = BottomFrame
	UserSettingButton.AnchorPoint = Vector2.new(1, 0.5)
	UserSettingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingButton.BackgroundTransparency = 1.000
	UserSettingButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserSettingButton.BorderSizePixel = 0
	UserSettingButton.Position = UDim2.new(1, -7, 0.5, 0)
	UserSettingButton.Size = UDim2.new(0, 25, 0, 25)
	UserSettingButton.ZIndex = 7
	L2Hub:SetIconMode(UserSettingButton, "chevron-large-right")
	UserSettingButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
	UserSettingButton.ImageTransparency = 0.5
	UserSettingButton.ScaleType = Enum.ScaleType.Fit

	if not Window.ShowUser then
		AccountProfile.Image = "";
		AccountProfile.ImageTransparency = 1;
		AccountProfile.BackgroundColor3 = Color3.fromRGB(26, 28, 36);
		AccountProfile.BackgroundTransparency = 0.250;
		L2Hub:SetIconMode(AccountProfile, "gear");
		AccountProfile.ImageColor3 = L2Hub.AccentColor;
		AccountProfile.ImageTransparency = 0.050;

		AccountName.Text = "Settings";
		AccountName.Size = UDim2.new(0, 120, 0, 25);
		ExpireLabel.Text = "Customize menu";
		ExpireLabel.Size = UDim2.new(0, 120, 0, 15);
	end;

	L2Hub:AddSignal(BottomFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(UserSettingButton,SlowyTween , {
			TextTransparency = 0.25
		})		
	end)))

	L2Hub:AddSignal(BottomFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
		L2Hub.PlayAnimate(UserSettingButton,SlowyTween , {
			TextTransparency = 0.5
		})		
	end)))

	RightMenuFrame.Name = L2Hub.RandomString();
	RightMenuFrame.Parent = WindowFrame
	RightMenuFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	RightMenuFrame.BackgroundTransparency = 0.600
	RightMenuFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RightMenuFrame.BorderSizePixel = 0
	RightMenuFrame.ClipsDescendants = true
	RightMenuFrame.Position = UDim2.new(0, 176, 0, 0)
	RightMenuFrame.Size = UDim2.new(1, -176, 1, 0)
	RightMenuFrame.ZIndex = 8

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = RightMenuFrame

	UICorner_4.CornerRadius = UDim.new(0, 13)
	UICorner_4.Parent = RightMenuFrame

	RightHeader.Name = L2Hub.RandomString();
	RightHeader.Parent = RightMenuFrame
	RightHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RightHeader.BackgroundTransparency = 1.000
	RightHeader.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RightHeader.BorderSizePixel = 0
	RightHeader.Size = UDim2.new(1, 0, 0, 50)
	RightHeader.ZIndex = 9

	LineFrame_3.Name = L2Hub.RandomString();
	LineFrame_3.Parent = RightHeader
	LineFrame_3.AnchorPoint = Vector2.new(0.5, 1)
	LineFrame_3.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame_3.BackgroundTransparency = 0.650
	LineFrame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame_3.BorderSizePixel = 0
	LineFrame_3.Position = UDim2.new(0.5, 0, 1, 0)
	LineFrame_3.Size = UDim2.new(1, -10, 0, 1)
	LineFrame_3.ZIndex = 9

	ConfigFrame.Name = L2Hub.RandomString();
	ConfigFrame.Parent = RightHeader
	ConfigFrame.AnchorPoint = Vector2.new(0, 0.5)
	ConfigFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 22)
	ConfigFrame.BackgroundTransparency = 0.750
	ConfigFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigFrame.BorderSizePixel = 0
	ConfigFrame.Position = UDim2.new(0, 10, 0.5, 0)
	ConfigFrame.Size = UDim2.new(0, 115, 0, 30)
	ConfigFrame.ZIndex = 9

	UIStroke_2.Transparency = 0.650
	UIStroke_2.Color = Color3.fromRGB(45, 48, 58)
	UIStroke_2.Parent = ConfigFrame

	UICorner_5.CornerRadius = UDim.new(0, 4)
	UICorner_5.Parent = ConfigFrame

	ConfigIcon.Name = L2Hub.RandomString();
	ConfigIcon.Parent = ConfigFrame
	ConfigIcon.AnchorPoint = Vector2.new(0, 0.5)
	ConfigIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigIcon.BackgroundTransparency = 1.000
	ConfigIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigIcon.BorderSizePixel = 0
	ConfigIcon.Position = UDim2.new(0, 2, 0.5, 0)
	ConfigIcon.Size = UDim2.new(0, 25, 0, 25)
	ConfigIcon.ZIndex = 9
	L2Hub:SetIconMode(ConfigIcon, "pencil-square")
	ConfigIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
	ConfigIcon.ImageTransparency = 0.250
	ConfigIcon.ScaleType = Enum.ScaleType.Fit

	LineFrame_4.Name = L2Hub.RandomString();
	LineFrame_4.Parent = ConfigFrame
	LineFrame_4.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
	LineFrame_4.BackgroundTransparency = 0.650
	LineFrame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineFrame_4.BorderSizePixel = 0
	LineFrame_4.Position = UDim2.new(0, 30, 0, 0)
	LineFrame_4.Size = UDim2.new(0, 1, 1, 0)

	ConfigName.Name = L2Hub.RandomString();
	ConfigName.Parent = ConfigFrame
	ConfigName.AnchorPoint = Vector2.new(0, 0.5)
	ConfigName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigName.BackgroundTransparency = 1.000
	ConfigName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigName.BorderSizePixel = 0
	ConfigName.Position = UDim2.new(0, 40, 0.5, 0)
	ConfigName.Size = UDim2.new(1, -7, 0, 15)
	ConfigName.ZIndex = 9
	ConfigName.Font = Enum.Font.GothamBold
	ConfigName.Text = "Default"
	ConfigName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ConfigName.TextSize = 12.000
	ConfigName.TextTransparency = 0.350
	ConfigName.TextXAlignment = Enum.TextXAlignment.Left

	ConfigBthIcon.Name = L2Hub.RandomString();
	ConfigBthIcon.Parent = ConfigFrame
	ConfigBthIcon.AnchorPoint = Vector2.new(1, 0.5)
	ConfigBthIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ConfigBthIcon.BackgroundTransparency = 1.000
	ConfigBthIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ConfigBthIcon.BorderSizePixel = 0
	ConfigBthIcon.Position = UDim2.new(1, -2, 0.5, 0)
	ConfigBthIcon.Size = UDim2.new(0, 25, 0, 25)
	ConfigBthIcon.ZIndex = 9
	L2Hub:SetIconMode(ConfigBthIcon, "chevron-small-down")
	ConfigBthIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
	ConfigBthIcon.ImageTransparency = 0.250
	ConfigBthIcon.ScaleType = Enum.ScaleType.Fit

	SearchFrame.Name = L2Hub.RandomString();
	SearchFrame.Parent = RightHeader
	SearchFrame.AnchorPoint = Vector2.new(1, 0.5)
	SearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchFrame.BackgroundTransparency = 1.000
	SearchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchFrame.BorderSizePixel = 0
	SearchFrame.ClipsDescendants = true
	SearchFrame.Position = UDim2.new(1, -80, 0.5, 0)
	SearchFrame.Size = UDim2.new(0, 30, 0, 30)
	SearchFrame.ZIndex = 12

	SearchIcon.Name = L2Hub.RandomString();
	SearchIcon.Parent = SearchFrame
	SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
	SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIcon.BackgroundTransparency = 1.000
	SearchIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchIcon.BorderSizePixel = 0
	SearchIcon.Position = UDim2.new(0, 2, 0.5, 0)
	SearchIcon.Size = UDim2.new(0, 25, 0, 25)
	SearchIcon.ZIndex = 12
	L2Hub:SetIconMode(SearchIcon, "magnifying-glass")
	SearchIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
	SearchIcon.ImageTransparency = 0.45
	SearchIcon.ScaleType = Enum.ScaleType.Fit

	SearchBox.Name = L2Hub.RandomString();
	SearchBox.Parent = SearchFrame
	SearchBox.AnchorPoint = Vector2.new(0, 0.5)
	SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.BackgroundTransparency = 1.000
	SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SearchBox.BorderSizePixel = 0
	SearchBox.Position = UDim2.new(0, 35, 0.5, 0)
	SearchBox.Size = UDim2.new(1, -35, 0, 25)
	SearchBox.ZIndex = 12
	SearchBox.ClearTextOnFocus = false
	SearchBox.Font = Enum.Font.GothamBold
	SearchBox.PlaceholderText = "Search"
	SearchBox.Text = ""
	SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	SearchBox.TextSize = 13.000
	SearchBox.TextTransparency = 1
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left
	
	MinimizeButton.Name = L2Hub.RandomString();
	MinimizeButton.Parent = RightHeader
	MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
	MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeButton.BackgroundTransparency = 1.000
	MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MinimizeButton.BorderSizePixel = 0
	MinimizeButton.Position = UDim2.new(1, -45, 0.5, 0)
	MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
	MinimizeButton.ZIndex = 12
	L2Hub:SetIconMode(MinimizeButton, "minus")
	MinimizeButton.ImageColor3 = Color3.fromRGB(223, 223, 223)
	MinimizeButton.ImageTransparency = 0.45
	MinimizeButton.ScaleType = Enum.ScaleType.Fit

	CloseButton.Name = L2Hub.RandomString();
	CloseButton.Parent = RightHeader
	CloseButton.AnchorPoint = Vector2.new(1, 0.5)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(1, -10, 0.5, 0)
	CloseButton.Size = UDim2.new(0, 30, 0, 30)
	CloseButton.ZIndex = 12
	L2Hub:SetIconMode(CloseButton, "x")
	CloseButton.ImageColor3 = Color3.fromRGB(223, 223, 223)
	CloseButton.ImageTransparency = 0.45
	CloseButton.ScaleType = Enum.ScaleType.Fit

	TabContainer.Name = L2Hub.RandomString();
	TabContainer.Parent = RightMenuFrame
	TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContainer.BackgroundTransparency = 1.000
	TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer.BorderSizePixel = 0
	TabContainer.ClipsDescendants = true
	TabContainer.Position = UDim2.new(0, 0, 0, 50)
	TabContainer.Size = UDim2.new(1, 0, 1, -50)
	TabContainer.ZIndex = 5

	if Window.SearchEnabled then
		Window.Searching = false;
		local Input = L2Hub:CreateInput(SearchIcon , LPH_NO_VIRTUALIZE(function()
			Window.Searching = not Window.Searching;

			if Window.Searching then
				L2Hub.PlayAnimate(SearchFrame , VSlowTween , {
					Size = UDim2.new(0, 220, 0, 30)
				})

				L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.25
				})

				L2Hub.PlayAnimate(SearchBox , VSlowTween , {
					TextTransparency = 0.350
				})
			else
				L2Hub.PlayAnimate(SearchFrame , VSlowTween , {
					Size = UDim2.new(0, 30, 0, 30)
				})

				L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.45
				})

				L2Hub.PlayAnimate(SearchBox , SlowyTween , {
					TextTransparency = 1
				})

				SearchBox.Text = "";
			end;
		end));	

		local wati_for_finish = tick();
		local last_thread;
		local max_time = 0.2;

		L2Hub:AddSignal(SearchBox:GetPropertyChangedSignal('Text'):Connect(LPH_NO_VIRTUALIZE(function()
			if not SearchBox.Text:byte() then
				for i,v in next , L2Hub.NameRegisitry do
					v.Root.Visible = true;
				end;

				return;	
			end;

			wati_for_finish = tick();

			if last_thread then
				task.cancel(last_thread);
				last_thread = nil;
			end;

			last_thread = task.delay(max_time,function()
				if SearchBox.Text:byte() and (tick() - wati_for_finish) > max_time then
					local RevealedMatch = false;

					for i,v in next , L2Hub.NameRegisitry do
						if string.find(string.lower(v.Idx) , string.lower(SearchBox.Text), 1, true) then
							v.Root.Visible = true;

							if not RevealedMatch then
								RevealedMatch = true;
								L2Hub:RevealQueryItem(v);
							end;
						else
							v.Root.Visible = false;
						end;
					end;
				end;
			end);
		end)));

		L2Hub:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
				TextTransparency = 0.25
			})
		end)))

		L2Hub:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			if Window.Searching then
				L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.25
				})
			else
				L2Hub.PlayAnimate(SearchIcon , SlowyTween , {
					TextTransparency = 0.45
				})
			end;
		end)));
	else
		SearchFrame.Visible = false;
	end;
	
	do
		local Input = L2Hub:CreateInput(MinimizeButton , LPH_NO_VIRTUALIZE(function()
			Window.Signal:SetValue(false);
			
			if not Window._MenuIcon then
				Window._MenuIcon = L2Hub:CreateMenuIcon({
					Image = Window.Logo,
					Size = 48,
					Draggable = not Window.IconLocked
				})
			end;
			Window._MenuIcon:OnWindowToggle(false)
			Window._MenuIcon:SetVisible(true);
		end));

		L2Hub:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(MinimizeButton , SlowyTween , {
				TextTransparency = 0.150
			})
		end)))

		L2Hub:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(MinimizeButton , SlowyTween , {
				TextTransparency = Window.Signal:GetValue() and 0.450 or 1
			})
		end)))
	end;

	do
		local Input = L2Hub:CreateInput(CloseButton , LPH_NO_VIRTUALIZE(function()
			Window:Dialog({
				Title = "Destroy Window?",
				Content = "Are you sure you want to destroy this window?",
				Buttons = {
					{
						Text = "Cancel",
						ReturnValue = false,
					},
					{
						Text = "Yes",
						Primary = true,
						ReturnValue = true,
					},
				},
				Callback = function(result)
					if result == true then
						Window:Destroy();
					end;
				end,
			});
		end));

		L2Hub:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(CloseButton , SlowyTween , {
				TextTransparency = 0.150
			})
		end)))

		L2Hub:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(CloseButton , SlowyTween , {
				TextTransparency = Window.Signal:GetValue() and 0.450 or 1
			})
		end)))
	end;

	if Window.Enable3DRenderer then
		local Part = Instance.new('Part');

		Part.Name = L2Hub.RandomString();
		Part.Anchored = true;
		Part.Transparency = 1;
		Part.CanCollide = false;
		Part.CanTouch = false;
		Part.AudioCanCollide = false;
		Part.CollisionGroup = L2Hub.RandomString();
		Part.CFrame = CFrame.new(0,0,0);
		Part.Size = Vector3.zero;

		local SurfaceGui = Instance.new("SurfaceGui")

		SurfaceGui.Parent = L2Hub.ScreenGui;
		SurfaceGui.Adornee = Part;
		SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		SurfaceGui.AlwaysOnTop = true
		SurfaceGui.LightInfluence = 1.000
		SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
		SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize;
		SurfaceGui.PixelsPerStud = 40;

		Window.SurfaceGui = SurfaceGui;
		L2Hub.GlobalSurfaceGui = SurfaceGui;

		local PerfectScale = Vector2.new(1920 , 1080 + 300)

		Window.Load3DBlock = LPH_NO_VIRTUALIZE(function()
			if not Window.Signal:GetValue() then
				local _,OnScreen = CurrentCamera:WorldToViewportPoint(Part.Position);

				if OnScreen then
					L2Hub.PlayAnimate(Part,VSlowTween , {
						CFrame = CurrentCamera.CFrame * CFrame.new(0,0,-15) * CFrame.Angles(0,math.rad(180),0);
					});
				end;

				return
			end;

			local Dimensions = 50;

			local XY_Incom = Vector2.new(PerfectScale.X + 5, PerfectScale.Y * 1.35) / (Dimensions / 2);
			local PerfectDistance = XY_Incom.Magnitude;
			local SizeIndicator = PerfectDistance / 1.35;

			Part.Parent = L2Hub.BlurModuleParent or workspace;

			L2Hub.PlayAnimate(Part,VSlowTween , {
				CFrame = (CurrentCamera.CFrame * CFrame.new(0,0,-25)) * CFrame.Angles(0,math.rad(180),0);
			});

			Part.Size = Vector3.new(PerfectScale.X / SizeIndicator,PerfectScale.Y / SizeIndicator,0);
		end);

		function Window:Set3DRender(val)
			Window.__3DRender = val;
			L2Hub.Global3DRenderMode = val;

			if val then
				Window.Load3DBlock();
			else


				Part.Parent = nil;
			end;

			renderParentWindow();
		end;
	end;

	function Window:AddTabLabel(Name: string)
		local TabLabel = Instance.new("TextLabel")

		TabLabel.Name = L2Hub.RandomString()
		TabLabel.Parent = LeftScrollingFrame
		TabLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabLabel.BackgroundTransparency = 1.000
		TabLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabLabel.BorderSizePixel = 0
		TabLabel.Size = UDim2.new(1, -7, 0, 15)
		TabLabel.ZIndex = 8
		TabLabel.Font = Enum.Font.GothamBold
		TabLabel.Text = Name
		TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabLabel.TextSize = 11.000
		TabLabel.TextTransparency = 0.500
		TabLabel.TextXAlignment = Enum.TextXAlignment.Left

		local SetRender = LPH_NO_VIRTUALIZE(function(val)
			if val then
				L2Hub.PlayAnimate(TabLabel , SlowyTween,{
					TextTransparency = 0.500
				})
			else
				L2Hub.PlayAnimate(TabLabel , SlowyTween,{
					TextTransparency = 1
				})
			end
		end)

		SetRender(Window.Signal:GetValue());

		return Window.Signal:Connect(SetRender);
	end;

	function Window:AddCategory(Config)
		if typeof(Config) ~= "table" then
			Config = {
				Name = tostring(Config or "Category"),
			};
		end;

		Config = L2Hub:ProcessParams(Config , {
			Name = "Category",
			Icon = "",
			Open = true,
		});

		local Category = {
			Tabs = {},
			Open = Config.Open ~= false,
		};

		local CategoryRoot = Instance.new("Frame")
		local CategoryLayout = Instance.new("UIListLayout")
		local Header = Instance.new("Frame")
		local HeaderCorner = Instance.new("UICorner")
		local HeaderStroke = Instance.new("UIStroke")
		local HeaderIcon = Instance.new("ImageLabel")
		local HeaderLabel = Instance.new("TextLabel")
		local ChevronIcon = Instance.new("ImageLabel")
		local TabsHolder = Instance.new("Frame")
		local TabsLayout = Instance.new("UIListLayout")

		CategoryRoot.Name = L2Hub.RandomString();
		CategoryRoot.Parent = LeftScrollingFrame
		CategoryRoot.BackgroundTransparency = 1
		CategoryRoot.BorderSizePixel = 0
		CategoryRoot.ClipsDescendants = true
		CategoryRoot.Size = UDim2.new(1, -1, 0, 30)
		CategoryRoot.ZIndex = 8

		CategoryLayout.Parent = CategoryRoot
		CategoryLayout.SortOrder = Enum.SortOrder.LayoutOrder
		CategoryLayout.Padding = UDim.new(0, 5)

		Header.Name = L2Hub.RandomString();
		Header.Parent = CategoryRoot
		Header.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		Header.BackgroundTransparency = 0.250
		Header.BorderSizePixel = 0
		Header.ClipsDescendants = true
		Header.Size = UDim2.new(1, 0, 0, 30)
		Header.ZIndex = 8

		HeaderCorner.CornerRadius = UDim.new(0, 6)
		HeaderCorner.Parent = Header

		HeaderStroke.Color = Color3.fromRGB(45, 48, 58)
		HeaderStroke.Transparency = 0.700
		HeaderStroke.Parent = Header

		HeaderIcon.Name = L2Hub.RandomString();
		HeaderIcon.Parent = Header
		HeaderIcon.AnchorPoint = Vector2.new(0, 0.5)
		HeaderIcon.BackgroundTransparency = 1
		HeaderIcon.BorderSizePixel = 0
		HeaderIcon.Position = UDim2.new(0, 8, 0.5, 0)
		HeaderIcon.Size = UDim2.new(0, 16, 0, 16)
		HeaderIcon.ZIndex = 9
		HeaderIcon.ImageColor3 = L2Hub.IconColor
		HeaderIcon.ScaleType = Enum.ScaleType.Fit
		L2Hub:SetIconMode(HeaderIcon, Config.Icon)
		HeaderIcon.Visible = tostring(Config.Icon or "") ~= ""

		HeaderLabel.Name = L2Hub.RandomString();
		HeaderLabel.Parent = Header
		HeaderLabel.AnchorPoint = Vector2.new(0, 0.5)
		HeaderLabel.BackgroundTransparency = 1
		HeaderLabel.BorderSizePixel = 0
		HeaderLabel.Position = HeaderIcon.Visible and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 10, 0.5, 0)
		HeaderLabel.Size = HeaderIcon.Visible and UDim2.new(1, -58, 0, 16) or UDim2.new(1, -38, 0, 16)
		HeaderLabel.ZIndex = 9
		HeaderLabel.Font = Enum.Font.GothamBold
		HeaderLabel.Text = Config.Name
		HeaderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		HeaderLabel.TextSize = 12.000
		HeaderLabel.TextTransparency = 0.080
		HeaderLabel.TextTruncate = Enum.TextTruncate.AtEnd
		HeaderLabel.TextXAlignment = Enum.TextXAlignment.Left

		ChevronIcon.Name = L2Hub.RandomString();
		ChevronIcon.Parent = Header
		ChevronIcon.AnchorPoint = Vector2.new(1, 0.5)
		ChevronIcon.BackgroundTransparency = 1
		ChevronIcon.BorderSizePixel = 0
		ChevronIcon.Position = UDim2.new(1, -7, 0.5, 0)
		ChevronIcon.Size = UDim2.new(0, 16, 0, 16)
		ChevronIcon.ZIndex = 9
		ChevronIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		ChevronIcon.ImageTransparency = 0.350
		ChevronIcon.ScaleType = Enum.ScaleType.Fit
		L2Hub:SetIconMode(ChevronIcon, "chevron-small-down")

		TabsHolder.Name = L2Hub.RandomString();
		TabsHolder.Parent = CategoryRoot
		TabsHolder.BackgroundTransparency = 1
		TabsHolder.BorderSizePixel = 0
		TabsHolder.ClipsDescendants = true
		TabsHolder.Size = UDim2.new(1, 0, 0, 0)
		TabsHolder.ZIndex = 8

		TabsLayout.Parent = TabsHolder
		TabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabsLayout.Padding = UDim.new(0, 5)

		local function UpdateSize()
			local tabsHeight = Category.Open and (TabsLayout.AbsoluteContentSize.Y + (#Category.Tabs > 0 and 1 or 0)) or 0;
			local rootHeight = 30 + (Category.Open and 5 or 0) + tabsHeight;

			if Category.Open then
				TabsHolder.Visible = true;
			end;

			L2Hub.PlayAnimate(TabsHolder, VSlowTween, {
				Size = UDim2.new(1, 0, 0, tabsHeight)
			});

			L2Hub.PlayAnimate(CategoryRoot, VSlowTween, {
				Size = UDim2.new(1, -1, 0, rootHeight)
			});

			L2Hub.PlayAnimate(ChevronIcon, SlowyTween, {
				Rotation = Category.Open and 0 or -90
			});

			if not Category.Open then
				task.delay(0.2, function()
					if not Category.Open then
						TabsHolder.Visible = false;
					end;
				end);
			end;
		end;

		function Category:SetOpen(value)
			Category.Open = value == true;
			UpdateSize();
			return Category;
		end;

		function Category:Toggle()
			return Category:SetOpen(not Category.Open);
		end;

		function Category:GetOpen()
			return Category.Open;
		end;

		function Category:SetName(name)
			Config.Name = tostring(name or "");
			HeaderLabel.Text = Config.Name;
			return Category;
		end;

		function Category:SetIcon(icon)
			Config.Icon = icon or "";
			L2Hub:SetIconMode(HeaderIcon, Config.Icon);
			HeaderIcon.Visible = tostring(Config.Icon or "") ~= "";
			HeaderLabel.Position = HeaderIcon.Visible and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 10, 0.5, 0);
			HeaderLabel.Size = HeaderIcon.Visible and UDim2.new(1, -58, 0, 16) or UDim2.new(1, -38, 0, 16);
			return Category;
		end;

		function Category:AddTab(TabConfig)
			local PreviousParent = Window.__NextTabParent;
			Window.__NextTabParent = TabsHolder;

			local Tab = Window:AddTab(TabConfig);

			Window.__NextTabParent = PreviousParent;
			table.insert(Category.Tabs, Tab);
			UpdateSize();

			return Tab;
		end;

		L2Hub:AddSignal(TabsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateSize))

		local Input = L2Hub:CreateInput(Header, function()
			Category:Toggle();
		end);

		L2Hub:AddSignal(Input.MouseEnter:Connect(function()
			L2Hub.PlayAnimate(Header, SlowyTween, {
				BackgroundTransparency = 0.150
			})
		end))

		L2Hub:AddSignal(Input.MouseLeave:Connect(function()
			L2Hub.PlayAnimate(Header, SlowyTween, {
				BackgroundTransparency = 0.250
			})
		end))

		L2Hub:AddSignal(Window.Signal:Connect(function(value)
			if value then
				L2Hub.PlayAnimate(Header, SlowyTween, {
					BackgroundTransparency = 0.250
				})
				L2Hub.PlayAnimate(HeaderStroke, SlowyTween, {
					Transparency = 0.700
				})
				L2Hub.PlayAnimate(HeaderIcon, SlowyTween, {
					TextTransparency = 0.250
				})
				L2Hub.PlayAnimate(HeaderLabel, SlowyTween, {
					TextTransparency = 0.080
				})
				L2Hub.PlayAnimate(ChevronIcon, SlowyTween, {
					TextTransparency = 0.350
				})
			else
				L2Hub.PlayAnimate(Header, SlowyTween, {
					BackgroundTransparency = 1
				})
				L2Hub.PlayAnimate(HeaderStroke, SlowyTween, {
					Transparency = 1
				})
				L2Hub.PlayAnimate(HeaderIcon, SlowyTween, {
					TextTransparency = 1
				})
				L2Hub.PlayAnimate(HeaderLabel, SlowyTween, {
					TextTransparency = 1
				})
				L2Hub.PlayAnimate(ChevronIcon, SlowyTween, {
					TextTransparency = 1
				})
			end;
		end))

		UpdateSize();

		return CaseInsensitive(Category);
	end;

	function Window:CreateHomeTab(Config)
		Config = L2Hub:ProcessParams(Config or {}, {
			Name = "Dashboard",
			Title = nil,
			Icon = "lucide:layout-dashboard",
			Content = "",
			SectionName = nil,
			Type = "Double",
			AutoSetup = true,
			DiscordInvite = "",
			SupportedExecutors = {},
			UnsupportedExecutors = {},
			Changelog = {},
			Segments = nil,
			Locked = false,
			TextLocked = "Locked",
		});

		local Tab = Window:AddTab({
			Name = Config.Title or Config.Name,
			Icon = Config.Icon,
			Type = Config.Type,
			Locked = Config.Locked,
			TextLocked = Config.TextLocked,
		});

		if Config.AutoSetup ~= false then
			if not Tab.CustomRoot and Tab.Root then
				Tab.CustomRoot = Instance.new("Frame");
				Tab.CustomRoot.Name = L2Hub.RandomString();
				Tab.CustomRoot.Parent = Tab.Root;
				Tab.CustomRoot.BackgroundTransparency = 1;
				Tab.CustomRoot.BorderSizePixel = 0;
				Tab.CustomRoot.Position = UDim2.fromOffset(0, 0);
				Tab.CustomRoot.Size = UDim2.fromScale(1, 1);
				Tab.CustomRoot.ZIndex = 10;
			end;

			if not Tab.CustomRoot then
				return CaseInsensitive(Tab);
			end;

			local Player = LocalPlayer;
			local ExecutorName = "Roblox Studio";
			local PlaceName = "Unknown Place";
			local Region = "Unknown";
			local TimeFunction = RunService:IsRunning() and time or os.clock;
			local FrameTimes = {};
			local StartedAt = TimeFunction();
			local ActivePage = "Details";

			pcall(function()
				if identifyexecutor then
					ExecutorName = tostring(select(1, identifyexecutor()));
				end;
			end);

			pcall(function()
				PlaceName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;
			end);

			pcall(function()
				Region = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(Player);
			end);

			local function SetText(Object, Text)
				if Object and Object.Parent then
					Object.Text = tostring(Text or "");
				end;
			end;

			local function AddCorner(Object, Radius)
				local Corner = Instance.new("UICorner");
				Corner.CornerRadius = UDim.new(0, Radius or 8);
				Corner.Parent = Object;
				return Corner;
			end;

			local function AddStroke(Object, Color, Transparency)
				local Stroke = Instance.new("UIStroke");
				Stroke.Color = Color or Color3.fromRGB(45, 48, 58);
				Stroke.Transparency = Transparency or 0.650;
				Stroke.Parent = Object;
				return Stroke;
			end;

			local function MakeText(Parent, Text, Size, Bold, Transparency)
				local Label = Instance.new("TextLabel");
				Label.Name = L2Hub.RandomString();
				Label.Parent = Parent;
				Label.BackgroundTransparency = 1;
				Label.BorderSizePixel = 0;
				Label.Font = Bold and Enum.Font.GothamBold or Enum.Font.GothamBold;
				Label.Text = tostring(Text or "");
				Label.TextColor3 = Color3.fromRGB(255, 255, 255);
				Label.TextSize = Size or 12;
				Label.TextTransparency = Transparency or 0;
				Label.TextXAlignment = Enum.TextXAlignment.Left;
				Label.TextYAlignment = Enum.TextYAlignment.Center;
				Label.TextTruncate = Enum.TextTruncate.AtEnd;
				Label.ZIndex = 14;
				return Label;
			end;

			local function FitTextToWidth(Label, BaseSize, MinSize, Wrapped)
				BaseSize = BaseSize or Label.TextSize;
				MinSize = MinSize or 8;
				Label.TextSize = BaseSize;
				task.defer(function()
					if not Label or not Label.Parent then
						return;
					end;

					local Width = math.max(1, Label.AbsoluteSize.X);
					local Height = math.max(1, Label.AbsoluteSize.Y);
					local Size = BaseSize;
					while Size > MinSize do
						local Bounds = TextService:GetTextSize(Label.Text, Size, Label.Font, Wrapped and Vector2.new(Width, math.huge) or Vector2.new(math.huge, Height));
						if Bounds.X <= Width and (not Wrapped or Bounds.Y <= Height) then
							break;
						end;
						Size -= 1;
					end;
					Label.TextSize = Size;
				end);
			end;

			local function MakePanel(Parent, Size, Position)
				local Panel = Instance.new("Frame");
				Panel.Name = L2Hub.RandomString();
				Panel.Parent = Parent;
				Panel.BackgroundColor3 = Color3.fromRGB(13, 17, 22);
				Panel.BackgroundTransparency = 0.100;
				Panel.BorderSizePixel = 0;
				Panel.ClipsDescendants = true;
				Panel.Size = Size;
				Panel.Position = Position or UDim2.fromOffset(0, 0);
				Panel.ZIndex = 12;
				AddCorner(Panel, 8);
				AddStroke(Panel, Color3.fromRGB(45, 48, 58), 0.680);
				return Panel;
			end;

			local function MakeIcon(Parent, Icon, Size, Color)
				local Image = Instance.new("ImageLabel");
				Image.Name = L2Hub.RandomString();
				Image.Parent = Parent;
				Image.BackgroundTransparency = 1;
				Image.BorderSizePixel = 0;
				Image.Size = UDim2.fromOffset(Size or 18, Size or 18);
				Image.ScaleType = Enum.ScaleType.Fit;
				Image.ImageColor3 = Color or Color3.fromRGB(255, 255, 255);
				Image.ZIndex = 15;
				L2Hub:SetIconMode(Image, Icon or "");
				return Image;
			end;

			local function MakeButton(Parent, Text, Icon, Callback)
				local Button = MakePanel(Parent, UDim2.fromOffset(0, 34));
				Button.BackgroundTransparency = 0.250;
				Button.Size = UDim2.new(1, 0, 0, 34);

				local IconImage = MakeIcon(Button, Icon, 16, L2Hub.AccentColor);
				IconImage.Position = UDim2.new(0, 12, 0.5, -8);

				local Label = MakeText(Button, Text, 12, true, 0.050);
				Label.Position = UDim2.new(0, 36, 0, 0);
				Label.Size = UDim2.new(1, -44, 1, 0);

				local Input = L2Hub:CreateInput(Button, Callback or EmptyFunction);
				L2Hub:AddSignal(Input.MouseEnter:Connect(function()
					L2Hub.PlayAnimate(Button, SlowyTween, { BackgroundTransparency = 0.080 });
				end));
				L2Hub:AddSignal(Input.MouseLeave:Connect(function()
					L2Hub.PlayAnimate(Button, SlowyTween, { BackgroundTransparency = 0.250 });
				end));

				return Button;
			end;

			local function GetGreeting()
				local Hour = os.date("*t").hour;
				if Hour >= 4 and Hour < 12 then
					return "Good Morning";
				elseif Hour >= 12 and Hour < 19 then
					return "How's Your Day Going?";
				elseif Hour >= 19 and Hour <= 23 then
					return "Sweet Dreams";
				end;
				return "You should be asleep";
			end;

			local function GetElapsed()
				local Elapsed = math.max(0, TimeFunction() - StartedAt);
				if Elapsed < 60 then
					return tostring(math.floor(Elapsed)).."s";
				elseif Elapsed < 3600 then
					return tostring(math.floor(Elapsed / 60)).."m";
				end;
				return tostring(math.floor(Elapsed / 3600)).."h";
			end;

			local Root = Instance.new("Frame");
			Root.Name = L2Hub.RandomString();
			Root.Parent = Tab.CustomRoot;
			Root.BackgroundTransparency = 1;
			Root.BorderSizePixel = 0;
			Root.Size = UDim2.new(1, -12, 0, 450);
			Root.ZIndex = 11;
			Tab.HomeRoot = Root;

			local Profile = MakePanel(Root, UDim2.new(1, 0, 0, 74), UDim2.fromOffset(0, 4));
			local AvatarBox = MakePanel(Profile, UDim2.fromOffset(58, 58), UDim2.fromOffset(10, 8));
			AvatarBox.BackgroundTransparency = 0.200;

			local Avatar = Instance.new("ImageLabel");
			Avatar.Name = L2Hub.RandomString();
			Avatar.Parent = AvatarBox;
			Avatar.BackgroundTransparency = 1;
			Avatar.BorderSizePixel = 0;
			Avatar.Size = UDim2.fromScale(1, 1);
			Avatar.Image = L2Hub.UserProfile or "";
			Avatar.ZIndex = 15;
			AddCorner(Avatar, 8);

			local Welcome = MakeText(Profile, "Hello, "..tostring(Player.DisplayName), 18, true, 0);
			Welcome.Position = UDim2.new(0, 82, 0, 17);
			Welcome.Size = UDim2.new(1, -98, 0, 24);
			L2Hub:AddTextGradient(Welcome);

			local Username = MakeText(Profile, "@"..tostring(Player.Name), 12, false, 0.350);
			Username.Position = UDim2.new(0, 82, 0, 41);
			Username.Size = UDim2.new(1, -98, 0, 18);

			local Segments = MakePanel(Root, UDim2.new(1, 0, 0, 48), UDim2.fromOffset(0, 86));
			local SegmentLayout = Instance.new("UIListLayout");
			SegmentLayout.Parent = Segments;
			SegmentLayout.FillDirection = Enum.FillDirection.Horizontal;
			SegmentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			SegmentLayout.VerticalAlignment = Enum.VerticalAlignment.Center;
			SegmentLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			SegmentLayout.Padding = UDim.new(0, 8);

			local ContentHolder = Instance.new("Frame");
			ContentHolder.Name = L2Hub.RandomString();
			ContentHolder.Parent = Root;
			ContentHolder.BackgroundTransparency = 1;
			ContentHolder.BorderSizePixel = 0;
			ContentHolder.Position = UDim2.fromOffset(0, 144);
			ContentHolder.Size = UDim2.new(1, 0, 1, -144);
			ContentHolder.ZIndex = 11;

			local DetailsPage = Instance.new("Frame");
			DetailsPage.Name = L2Hub.RandomString();
			DetailsPage.Parent = ContentHolder;
			DetailsPage.BackgroundTransparency = 1;
			DetailsPage.BorderSizePixel = 0;
			DetailsPage.Size = UDim2.fromScale(1, 1);
			DetailsPage.ZIndex = 11;

			local ScriptPage = Instance.new("Frame");
			ScriptPage.Name = L2Hub.RandomString();
			ScriptPage.Parent = ContentHolder;
			ScriptPage.BackgroundTransparency = 1;
			ScriptPage.BorderSizePixel = 0;
			ScriptPage.Size = UDim2.fromScale(1, 1);
			ScriptPage.Visible = false;
			ScriptPage.ZIndex = 11;

			local UiPage = Instance.new("Frame");
			UiPage.Name = L2Hub.RandomString();
			UiPage.Parent = ContentHolder;
			UiPage.BackgroundTransparency = 1;
			UiPage.BorderSizePixel = 0;
			UiPage.Size = UDim2.fromScale(1, 1);
			UiPage.Visible = false;
			UiPage.ZIndex = 11;

			local SegmentButtons = {};
			local SegmentCount = 0;
			local Pages = {
				Details = DetailsPage,
				Script = ScriptPage,
				UI = UiPage,
			};

			local function SelectPage(PageName)
				ActivePage = PageName;
				for Name,Page in next, Pages do
					Page.Visible = Name == PageName;
				end;
				for Name,Button in next, SegmentButtons do
					L2Hub.PlayAnimate(Button.Root, SlowyTween, {
						BackgroundTransparency = Name == PageName and 0.080 or 0.550
					});
					Button.Icon.ImageColor3 = Name == PageName and L2Hub.AccentColor or Color3.fromRGB(210, 210, 220);
					Button.Label.TextTransparency = Name == PageName and 0 or 0.250;
				end;
			end;

			local VisibleSegmentCount = 3;

			local function MakeSegment(Name, Text, Icon)
				local WidthScale = 1 / math.max(VisibleSegmentCount, 1);
				local Button = MakePanel(Segments, UDim2.new(WidthScale, -10, 0, 34));
				Button.BackgroundTransparency = 0.550;
				SegmentCount += 1;
				Button.LayoutOrder = SegmentCount;
				local Inner = Instance.new("Frame");
				local InnerLayout = Instance.new("UIListLayout");

				Inner.Name = L2Hub.RandomString();
				Inner.Parent = Button;
				Inner.AnchorPoint = Vector2.new(0.5, 0.5);
				Inner.BackgroundTransparency = 1;
				Inner.BorderSizePixel = 0;
				Inner.Position = UDim2.fromScale(0.5, 0.5);
				Inner.Size = UDim2.new(1, -18, 1, 0);
				Inner.ZIndex = 14;

				InnerLayout.Parent = Inner;
				InnerLayout.FillDirection = Enum.FillDirection.Horizontal;
				InnerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				InnerLayout.VerticalAlignment = Enum.VerticalAlignment.Center;
				InnerLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				InnerLayout.Padding = UDim.new(0, 7);

				local IconImage = MakeIcon(Button, Icon, 17, Color3.fromRGB(210, 210, 220));
				IconImage.Parent = Inner;
				IconImage.LayoutOrder = 1;
				local Label = MakeText(Button, Text, 13, true, 0.250);
				Label.Parent = Inner;
				Label.LayoutOrder = 2;
				Label.Size = UDim2.new(0, math.max(24, TextService:GetTextSize(tostring(Text), 13, Enum.Font.GothamBold, Vector2.new(math.huge, math.huge)).X + 2), 0, 18);
				Label.TextXAlignment = Enum.TextXAlignment.Left;
				Label.TextTruncate = Enum.TextTruncate.None;
				SegmentButtons[Name] = {
					Root = Button,
					Icon = IconImage,
					Label = Label,
				};
				L2Hub:CreateInput(Button, function()
					SelectPage(Name);
				end);

				local function FitSegmentText()
					local AvailableWidth = math.max(20, Inner.AbsoluteSize.X - IconImage.AbsoluteSize.X - InnerLayout.Padding.Offset);
					local TextWidth = TextService:GetTextSize(Label.Text, Label.TextSize, Label.Font, Vector2.new(math.huge, math.huge)).X + 4;

					Label.Size = UDim2.new(0, math.min(TextWidth, AvailableWidth), 0, 18);
					Label.TextTruncate = TextWidth > AvailableWidth and Enum.TextTruncate.AtEnd or Enum.TextTruncate.None;
				end;

				L2Hub:AddSignal(Inner:GetPropertyChangedSignal("AbsoluteSize"):Connect(FitSegmentText))
				task.defer(FitSegmentText);
			end;

			local SegmentConfig = typeof(Config.Segments) == "table" and Config.Segments or {};
			local DetailsSegment = SegmentConfig.Details or SegmentConfig[1] or {};
			local ScriptSegment = SegmentConfig.Script or SegmentConfig[2] or {};
			local UISegment = SegmentConfig.UI or SegmentConfig.Ui or SegmentConfig[3] or {};

			local ShowDetailsSegment = DetailsSegment.Show ~= false and Config.ShowDetailsSegment ~= false;
			local ShowScriptSegment = ScriptSegment.Show ~= false and Config.ShowScriptSegment ~= false;
			local ShowUISegment = UISegment.Show ~= false and Config.ShowUISegment ~= false;

			VisibleSegmentCount = (ShowDetailsSegment and 1 or 0) + (ShowScriptSegment and 1 or 0) + (ShowUISegment and 1 or 0);

			if VisibleSegmentCount <= 0 then
				ShowDetailsSegment = true;
				VisibleSegmentCount = 1;
			end;

			if ShowDetailsSegment then
				MakeSegment("Details", DetailsSegment.Text or DetailsSegment.Name or Config.DetailsText or "Details And Info", DetailsSegment.Icon or Config.DetailsIcon or "lucide:layout-grid");
			end;

			if ShowScriptSegment then
				MakeSegment("Script", ScriptSegment.Text or ScriptSegment.Name or Config.ScriptText or "Script Changelog", ScriptSegment.Icon or Config.ScriptIcon or "lucide:code-2");
			end;

			if ShowUISegment then
				MakeSegment("UI", UISegment.Text or UISegment.Name or Config.UIText or Config.UiText or "UI Changelog", UISegment.Icon or Config.UIIcon or Config.UiIcon or "lucide:file-text");
			end;

			local LeftColumn = Instance.new("Frame");
			LeftColumn.Name = L2Hub.RandomString();
			LeftColumn.Parent = DetailsPage;
			LeftColumn.BackgroundTransparency = 1;
			LeftColumn.BorderSizePixel = 0;
			LeftColumn.Size = UDim2.new(0.52, -5, 1, 0);
			LeftColumn.ZIndex = 11;

			local RightColumn = Instance.new("Frame");
			RightColumn.Name = L2Hub.RandomString();
			RightColumn.Parent = DetailsPage;
			RightColumn.BackgroundTransparency = 1;
			RightColumn.BorderSizePixel = 0;
			RightColumn.Position = UDim2.new(0.52, 5, 0, 0);
			RightColumn.Size = UDim2.new(0.48, -5, 1, 0);
			RightColumn.ZIndex = 11;

			local ServerCard = MakePanel(LeftColumn, UDim2.new(1, 0, 0, 154), UDim2.fromOffset(0, 0));
			local ServerTitle = MakeText(ServerCard, "Server", 15, true, 0);
			ServerTitle.Position = UDim2.fromOffset(16, 14);
			ServerTitle.Size = UDim2.new(1, -32, 0, 18);
			local ServerSub = MakeText(ServerCard, "Information on the session you're currently in", 10, false, 0.480);
			ServerSub.Position = UDim2.fromOffset(16, 32);
			ServerSub.Size = UDim2.new(1, -32, 0, 14);

			local StatLabels = {};
			local function MakeStat(Parent, Title, Value, X, Y, W)
				local Stat = MakePanel(Parent, UDim2.new(W, -6, 0, 42), UDim2.new(X, 3, 0, Y));
				Stat.BackgroundTransparency = 0.250;
				local T = MakeText(Stat, Title, 10, true, 0.130);
				T.Position = UDim2.fromOffset(10, 7);
				T.Size = UDim2.new(1, -20, 0, 13);
				local V = MakeText(Stat, Value, 10, false, 0.350);
				V.Position = UDim2.fromOffset(10, 21);
				V.Size = UDim2.new(1, -20, 0, 13);
				return V;
			end;

			StatLabels.Players = MakeStat(ServerCard, "Players", "0 playing", 0, 58, 0.5);
			StatLabels.Capacity = MakeStat(ServerCard, "Maximum Players", tostring(Players.MaxPlayers).." can join", 0.5, 58, 0.5);
			StatLabels.Latency = MakeStat(ServerCard, "Latency", "...", 0, 104, 0.33);
			StatLabels.Region = MakeStat(ServerCard, "Server Region", tostring(Region), 0.33, 104, 0.34);
			StatLabels.Runtime = MakeStat(ServerCard, "In server for", "0s", 0.67, 104, 0.33);

			local DiscordCard = MakePanel(LeftColumn, UDim2.new(1, 0, 0, 68), UDim2.fromOffset(0, 164));
			DiscordCard.BackgroundColor3 = L2Hub.AccentColor;
			DiscordCard.BackgroundTransparency = 0.180;
			local DiscordGradient = Instance.new("UIGradient");
			DiscordGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, L2Hub.AccentColor),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 17, 22)),
			});
			DiscordGradient.Parent = DiscordCard;
			local DiscordTitle = MakeText(DiscordCard, "Discord", 20, true, 0);
			DiscordTitle.Position = UDim2.fromOffset(18, 12);
			DiscordTitle.Size = UDim2.new(1, -36, 0, 25);
			local DiscordSub = MakeText(DiscordCard, tostring(Config.DiscordInvite or "") ~= "" and "Tap to copy Discord invite" or "No Discord invite configured", 12, false, 0.250);
			DiscordSub.Position = UDim2.fromOffset(18, 38);
			DiscordSub.Size = UDim2.new(1, -36, 0, 18);
			L2Hub:CreateInput(DiscordCard, function()
				if tostring(Config.DiscordInvite or "") == "" then
					return;
				end;
				local Link = "https://discord.gg/"..tostring(Config.DiscordInvite);
				if setclipboard then setclipboard(Link); elseif toclipboard then toclipboard(Link); elseif set_clipboard then set_clipboard(Link); end;
				Window:Notify({ Title = "Copied", Content = Link, Duration = 2, Icon = "lucide:check" });
			end);

			local ExecutorCard = MakePanel(RightColumn, UDim2.new(1, 0, 0, 92), UDim2.fromOffset(0, 0));
			local ExecutorStatus = "Unknown";
			local ExecutorColor = L2Hub.AccentColor;
			if table.find(Config.SupportedExecutors, ExecutorName) then
				ExecutorStatus = "Your executor seems to support this script.";
				ExecutorColor = Color3.fromRGB(45, 180, 115);
			elseif table.find(Config.UnsupportedExecutors, ExecutorName) then
				ExecutorStatus = "Your executor may not support this script.";
				ExecutorColor = Color3.fromRGB(220, 70, 70);
			end;
			ExecutorCard.BackgroundColor3 = ExecutorColor;
			ExecutorCard.BackgroundTransparency = 0.180;
			local ExecutorGradient = Instance.new("UIGradient");
			ExecutorGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, ExecutorColor),
				ColorSequenceKeypoint.new(0.58, Color3.fromRGB(13, 17, 22)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
			});
			ExecutorGradient.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.080),
				NumberSequenceKeypoint.new(0.55, 0),
				NumberSequenceKeypoint.new(1, 0),
			});
			ExecutorGradient.Parent = ExecutorCard;
			local ExecutorTitle = MakeText(ExecutorCard, ExecutorName, 17, true, 0);
			ExecutorTitle.Position = UDim2.fromOffset(18, 18);
			ExecutorTitle.Size = UDim2.new(1, -36, 0, 22);
			local ExecutorSub = MakeText(ExecutorCard, ExecutorStatus, 12, false, 0.150);
			ExecutorSub.Position = UDim2.fromOffset(18, 43);
			ExecutorSub.Size = UDim2.new(1, -36, 0, 34);
			ExecutorSub.TextWrapped = true;
			ExecutorSub.TextTruncate = Enum.TextTruncate.None;
			ExecutorSub.TextYAlignment = Enum.TextYAlignment.Top;
			FitTextToWidth(ExecutorSub, 12, 8, true);

			local FriendsCard = MakePanel(RightColumn, UDim2.new(1, 0, 0, 166), UDim2.fromOffset(0, 102));
			local FriendsTitle = MakeText(FriendsCard, "Friends", 16, true, 0);
			FriendsTitle.Position = UDim2.fromOffset(16, 12);
			FriendsTitle.Size = UDim2.new(1, -32, 0, 20);
			local FriendsSub = MakeText(FriendsCard, "Find out what your friends are currently doing", 10, false, 0.480);
			FriendsSub.Position = UDim2.fromOffset(16, 32);
			FriendsSub.Size = UDim2.new(1, -32, 0, 14);
			local FriendLabels = {};
			FriendLabels.InServer = MakeStat(FriendsCard, "In Server", "...", 0, 58, 0.5);
			FriendLabels.Offline = MakeStat(FriendsCard, "Offline", "...", 0.5, 58, 0.5);
			FriendLabels.Online = MakeStat(FriendsCard, "Online", "...", 0, 104, 0.5);
			FriendLabels.All = MakeStat(FriendsCard, "All", "...", 0.5, 104, 0.5);

			local function FillChangelog(Page, Entries, EmptyText)
				local Holder = MakePanel(Page, UDim2.new(1, 0, 1, 0), UDim2.fromOffset(0, 0));
				local Layout = Instance.new("UIListLayout");
				Layout.Parent = Holder;
				Layout.SortOrder = Enum.SortOrder.LayoutOrder;
				Layout.Padding = UDim.new(0, 8);

				local Padding = Instance.new("UIPadding");
				Padding.Parent = Holder;
				Padding.PaddingTop = UDim.new(0, 12);
				Padding.PaddingLeft = UDim.new(0, 12);
				Padding.PaddingRight = UDim.new(0, 12);

				if typeof(Entries) ~= "table" or #Entries <= 0 then
					local Empty = MakeText(Holder, EmptyText, 13, false, 0.250);
					Empty.Size = UDim2.new(1, 0, 0, 26);
					return;
				end;

				for Index,Entry in ipairs(Entries) do
					local Item = MakePanel(Holder, UDim2.new(1, 0, 0, 64));
					Item.LayoutOrder = Index;
					local Title = MakeText(Item, tostring(Entry.Title or Entry.Name or ("Update "..Index)), 14, true, 0);
					Title.Position = UDim2.fromOffset(14, 10);
					Title.Size = UDim2.new(1, -28, 0, 18);
					local Desc = MakeText(Item, tostring(Entry.Description or Entry.Content or Entry.Date or ""), 11, false, 0.300);
					Desc.Position = UDim2.fromOffset(14, 31);
					Desc.Size = UDim2.new(1, -28, 0, 20);
				end;
			end;

			FillChangelog(ScriptPage, Config.ScriptChangelog or Config.Changelog, "No script changelog.");
			FillChangelog(UiPage, Config.UIChangelog or Config.UiChangelog, "No UI changelog.");

			local FriendCache = {
				All = "...",
				Online = "...",
				Offline = "...",
				InServer = "...",
				Cooldown = 0,
			};

			local function UpdateFriends()
				if FriendCache.Cooldown > 0 then
					FriendCache.Cooldown -= 1;
					return;
				end;

				FriendCache.Cooldown = 30;

				task.spawn(function()
					local OnlineFriends = 0;
					local TotalFriends = 0;
					local InServer = 0;

					pcall(function()
						OnlineFriends = #Player:GetFriendsOnline();
					end);

					pcall(function()
						local Pages = Players:GetFriendsAsync(Player.UserId);
						while true do
							for _,Data in ipairs(Pages:GetCurrentPage()) do
								TotalFriends += 1;
								if Players:FindFirstChild(Data.Username) then
									InServer += 1;
								end;
							end;
							if Pages.IsFinished then
								break;
							end;
							Pages:AdvanceToNextPageAsync();
						end;
					end);

					FriendCache.All = tostring(TotalFriends).." friends";
					FriendCache.Online = tostring(OnlineFriends).." friends";
					FriendCache.Offline = tostring(math.max(TotalFriends - OnlineFriends, 0)).." friends";
					FriendCache.InServer = InServer > 0 and tostring(InServer).." friends" or "no friends";
				end);
			end;

			local Accumulator = 0;
			local function UpdateHome(dt)
				local Now = TimeFunction();
				for Index = #FrameTimes, 1, -1 do
					if FrameTimes[Index] < Now - 1 then
						table.remove(FrameTimes, Index);
					end;
				end;
				table.insert(FrameTimes, Now);

				Accumulator += dt or 0;
				if Accumulator < 0.5 then
					return;
				end;
				Accumulator = 0;

				local Ping = "...";
				pcall(function()
					Ping = tostring(math.floor((Player:GetNetworkPing() * 1000) + 0.5)).."ms";
				end);

				SetText(Welcome, "Hello, "..tostring(Player.DisplayName));
				SetText(Username, GetGreeting().." | @"..tostring(Player.Name));
				SetText(StatLabels.Players, tostring(#Players:GetPlayers()).." playing");
				SetText(StatLabels.Capacity, tostring(Players.MaxPlayers).." can join");
				SetText(StatLabels.Latency, Ping);
				SetText(StatLabels.Runtime, GetElapsed());
				SetText(FriendLabels.InServer, FriendCache.InServer);
				SetText(FriendLabels.Offline, FriendCache.Offline);
				SetText(FriendLabels.Online, FriendCache.Online);
				SetText(FriendLabels.All, FriendCache.All);
				UpdateFriends();
			end;

			SelectPage("Details");

			local HomeSignal = L2Hub:AddSignal(RunService.RenderStepped:Connect(UpdateHome));
			table.insert(Window.OnDestroyCallbacks, function()
				if HomeSignal then
					HomeSignal:Disconnect();
				end;
			end);

			function Tab:GetHomeSection()
				return Tab.HomeRoot;
			end;

			return CaseInsensitive(Tab);
		end;

		local Section = Tab:AddSection({
			Name = Config.SectionName or Config.Title or Config.Name,
			Position = Config.AutoSetup ~= false and "Left" or "Center",
			Collapsible = Config.Collapsible == true,
			Box = Config.Box == true,
			Icon = Config.SectionIcon,
		});

		Tab.HomeSection = Section;

		if Config.AutoSetup ~= false then
			local Player = LocalPlayer;
			local ExecutorName = "Roblox Studio";
			local PlaceName = "Unknown Place";
			local Region = "Unknown";
			local TimeFunction = RunService:IsRunning() and time or os.clock;
			local FrameTimes = {};
			local StartedAt = TimeFunction();

			pcall(function()
				if identifyexecutor then
					ExecutorName = tostring(select(1, identifyexecutor()));
				end;
			end);

			pcall(function()
				PlaceName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;
			end);

			pcall(function()
				Region = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(Player);
			end);

			local function GetGreeting()
				local Hour = os.date("*t").hour;

				if Hour >= 4 and Hour < 12 then
					return "Good Morning";
				elseif Hour >= 12 and Hour < 19 then
					return "How's Your Day Going?";
				elseif Hour >= 19 and Hour <= 23 then
					return "Sweet Dreams";
				end;

				return "You should be asleep";
			end;

			local function GetElapsed()
				local Elapsed = math.max(0, TimeFunction() - StartedAt);

				if Elapsed < 60 then
					return tostring(math.floor(Elapsed)).."s";
				elseif Elapsed < 3600 then
					return tostring(math.floor(Elapsed / 60)).."m";
				end;

				return tostring(math.floor(Elapsed / 3600)).."h";
			end;

			Section:AddParagraph({
				Name = "Welcome, "..tostring(Player.DisplayName),
				Content = tostring(Config.Content ~= "" and Config.Content or (GetGreeting().." | @"..Player.Name)),
			});

			local StatusSection = Tab:AddSection({
				Name = "Status",
				Position = "Right",
				Icon = "lucide:activity",
			});

			local ServerSection = Tab:AddSection({
				Name = "Server",
				Position = "Left",
				Icon = "lucide:server",
			});

			local PlayerLabel = StatusSection:AddLabel({
				Text = "Players: "..tostring(#Players:GetPlayers()).."/"..tostring(Players.MaxPlayers),
			});

			local RuntimeLabel = StatusSection:AddLabel({
				Text = "Runtime: 0s",
			});

			local PerformanceLabel = StatusSection:AddLabel({
				Text = "FPS: ... | Ping: ...",
			});

			local ExecutorStatus = "Unknown";

			if table.find(Config.SupportedExecutors, ExecutorName) then
				ExecutorStatus = "Supported";
			elseif table.find(Config.UnsupportedExecutors, ExecutorName) then
				ExecutorStatus = "Unsupported";
			end;

			StatusSection:AddParagraph({
				Name = ExecutorName,
				Content = "Executor: "..ExecutorStatus,
			});

			ServerSection:AddParagraph({
				Name = PlaceName,
				Content = "PlaceId: "..tostring(game.PlaceId).."\nJobId: "..tostring(game.JobId).."\nRegion: "..tostring(Region),
			});

			ServerSection:AddButton({
				Name = "Copy Join Script",
				Icon = "lucide:copy",
				Callback = function()
					local JoinScript = ('game:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s", game:GetService("Players").LocalPlayer)'):format(tostring(game.PlaceId), tostring(game.JobId));

					if setclipboard then
						setclipboard(JoinScript);
					elseif toclipboard then
						toclipboard(JoinScript);
					elseif set_clipboard then
						set_clipboard(JoinScript);
					end;

					Window:Notify({
						Title = "Copied",
						Content = "Join script copied.",
						Duration = 2,
						Icon = "lucide:check",
					});
				end,
			});

			if tostring(Config.DiscordInvite or "") ~= "" then
				ServerSection:AddButton({
					Name = "Copy Discord",
					Icon = "lucide:message-circle",
					Callback = function()
						local Link = "https://discord.gg/"..tostring(Config.DiscordInvite);

						if setclipboard then
							setclipboard(Link);
						elseif toclipboard then
							toclipboard(Link);
						elseif set_clipboard then
							set_clipboard(Link);
						end;

						Window:Notify({
							Title = "Copied",
							Content = Link,
							Duration = 2,
							Icon = "lucide:check",
						});
					end,
				});
			end;

			if typeof(Config.Changelog) == "table" and #Config.Changelog > 0 then
				local ChangelogSection = Tab:AddSection({
					Name = "Changelog",
					Position = "Right",
					Icon = "lucide:list-checks",
					Collapsible = true,
				});

				for Index,Entry in ipairs(Config.Changelog) do
					if Index > 4 then
						break;
					end;

					if typeof(Entry) == "table" then
						ChangelogSection:AddParagraph({
							Name = tostring(Entry.Title or Entry.Name or ("Update "..Index)),
							Content = tostring(Entry.Date and (Entry.Date.."\n") or "")..tostring(Entry.Description or Entry.Content or ""),
						});
					else
						ChangelogSection:AddLabel({
							Text = tostring(Entry),
						});
					end;
				end;
			end;

			local Accumulator = 0;
			local function UpdateHome(dt)
				Accumulator = Accumulator + (dt or 0);
				local Now = TimeFunction();

				for Index = #FrameTimes, 1, -1 do
					if FrameTimes[Index] < Now - 1 then
						table.remove(FrameTimes, Index);
					end;
				end;

				table.insert(FrameTimes, Now);

				if Accumulator < 0.5 then
					return;
				end;

				Accumulator = 0;

				local Ping = "...";
				pcall(function()
					Ping = tostring(math.floor((Player:GetNetworkPing() * 1000) + 0.5)).."ms";
				end);

				if PlayerLabel.SetText then
					PlayerLabel:SetText("Players: "..tostring(#Players:GetPlayers()).."/"..tostring(Players.MaxPlayers));
				end;

				if RuntimeLabel.SetText then
					RuntimeLabel:SetText("Runtime: "..GetElapsed());
				end;

				if PerformanceLabel.SetText then
					PerformanceLabel:SetText("FPS: "..tostring(#FrameTimes).." | Ping: "..Ping);
				end;
			end;

			local HomeSignal = L2Hub:AddSignal(RunService.RenderStepped:Connect(UpdateHome));
			table.insert(Window.OnDestroyCallbacks, function()
				if HomeSignal then
					HomeSignal:Disconnect();
				end;
			end);
		elseif tostring(Config.Content or "") ~= "" then
			Section:AddParagraph({
				Name = Config.ParagraphName or Config.Title or Config.Name,
				Content = Config.Content,
			});
		end;

		if typeof(Config.Buttons) == "table" then
			for _,ButtonConfig in ipairs(Config.Buttons) do
				Section:AddButton(ButtonConfig);
			end;
		end;

		function Tab:GetHomeSection()
			return Section;
		end;

		return CaseInsensitive(Tab);
	end;

	function Window:AddTab(Config)
		Config = L2Hub:ProcessParams(Config , {
			Icon = "crosshairs",
			Name = "Tab",
			Type = "Double",
			Locked = false,
			TextLocked = "Locked",
		});

		local Tab = {
			Signal = L2Hub:CreateSignal(false);
		};

		local TabButton = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local TabIcon = Instance.new("ImageLabel")
		local TabContentLabel = Instance.new("TextLabel")

		Tab.Idx = TabButton;

		TabButton.Name = L2Hub.RandomString();
		TabButton.Parent = Window.__NextTabParent or LeftScrollingFrame
		TabButton.BackgroundColor3 = Color3.fromRGB(41, 45, 49)
		TabButton.BackgroundTransparency = 0.500
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.ClipsDescendants = true
		TabButton.Size = UDim2.new(1, -1, 0, 30)
		TabButton.ZIndex = 8
		L2Hub:AttachLockMethods(Tab, TabButton, Config);

		UICorner.CornerRadius = UDim.new(0, 6)
		UICorner.Parent = TabButton

		TabIcon.Name = L2Hub.RandomString();
		TabIcon.Parent = TabButton
		TabIcon.AnchorPoint = Vector2.new(0, 0.5)
		TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabIcon.BackgroundTransparency = 1.000
		TabIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabIcon.BorderSizePixel = 0
		TabIcon.Position = UDim2.new(0, 2, 0.5, 0)
		TabIcon.Size = UDim2.new(0, 25, 0, 25)
		TabIcon.ZIndex = 9
		L2Hub:SetIconMode(TabIcon, Config.Icon);
		TabIcon.ImageColor3 = L2Hub.AccentColor
		TabIcon.ScaleType = Enum.ScaleType.Fit

		TabContentLabel.Name = L2Hub.RandomString();
		TabContentLabel.Parent = TabButton
		TabContentLabel.AnchorPoint = Vector2.new(0, 0.5)
		TabContentLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContentLabel.BackgroundTransparency = 1.000
		TabContentLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabContentLabel.BorderSizePixel = 0
		TabContentLabel.Position = UDim2.new(0, 30, 0.5, 0)
		TabContentLabel.Size = UDim2.new(1, -7, 0, 15)
		TabContentLabel.ZIndex = 9
		TabContentLabel.Font = Enum.Font.GothamBold
		TabContentLabel.Text = Config.Name
		TabContentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabContentLabel.TextSize = 12.000
		TabContentLabel.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(TabContentLabel);

		local TabFrame = Instance.new("Frame")
		local LeftScroll = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local RightScroll = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local CenterScroll = Instance.new("ScrollingFrame")
		local UIListLayout_3 = Instance.new("UIListLayout")
		local FlowScroll = Instance.new("ScrollingFrame")
		local UIListLayout_4 = Instance.new("UIListLayout")

		TabFrame.Name = L2Hub.RandomString();
		TabFrame.Parent = TabContainer
		TabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabFrame.BackgroundTransparency = 1.000
		TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabFrame.BorderSizePixel = 0
		TabFrame.ClipsDescendants = true
		TabFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		TabFrame.Size = UDim2.new(1, 0, 1, 0)
		TabFrame.Visible = true;

		LeftScroll.Name = L2Hub.RandomString();
		LeftScroll.Parent = TabFrame
		LeftScroll.Active = true
		LeftScroll.AnchorPoint = Vector2.new(0.5, 0.5)
		LeftScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LeftScroll.BackgroundTransparency = 1.000
		LeftScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LeftScroll.BorderSizePixel = 0
		LeftScroll.ClipsDescendants = false
		LeftScroll.Position = UDim2.new(0.25, 0, 0.5, 0)
		LeftScroll.Size = UDim2.new(0.5, 0, 1, -5)
		LeftScroll.ScrollBarThickness = 0

		UIListLayout.Parent = LeftScroll
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			LeftScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout.AbsoluteContentSize.Y + 1)
		end)))

		RightScroll.Name = L2Hub.RandomString();
		RightScroll.Parent = TabFrame
		RightScroll.Active = true
		RightScroll.AnchorPoint = Vector2.new(0.5, 0.5)
		RightScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		RightScroll.BackgroundTransparency = 1.000
		RightScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		RightScroll.BorderSizePixel = 0
		RightScroll.ClipsDescendants = false
		RightScroll.Position = UDim2.new(0.75, 0, 0.5, 0)
		RightScroll.Size = UDim2.new(0.5, 0, 1, -5)
		RightScroll.ScrollBarThickness = 0

		UIListLayout_2.Parent = RightScroll
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		CenterScroll.Name = L2Hub.RandomString();
		CenterScroll.Parent = TabFrame
		CenterScroll.Active = true
		CenterScroll.AnchorPoint = Vector2.new(0.5, 0.5)
		CenterScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CenterScroll.BackgroundTransparency = 1.000
		CenterScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CenterScroll.BorderSizePixel = 0
		CenterScroll.ClipsDescendants = false
		CenterScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
		CenterScroll.Size = UDim2.new(1, 0, 1, -5)
		CenterScroll.ScrollBarThickness = 0
		CenterScroll.ZIndex = 6
		CenterScroll.Visible = false

		UIListLayout_3.Parent = CenterScroll
		UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 5)

		local IsSingleTab = string.lower(tostring(Config.Type)) == "single";
		local UpdateTabColumnLayout;

		UpdateTabColumnLayout = LPH_NO_VIRTUALIZE(function()
			if not CenterScroll.Visible then
				CenterScroll.AnchorPoint = Vector2.new(0.5, 0.5)
				CenterScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
				CenterScroll.Size = UDim2.new(1, 0, 1, -5)

				LeftScroll.AnchorPoint = Vector2.new(0.5, 0.5)
				LeftScroll.Position = IsSingleTab and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.25, 0, 0.5, 0)
				LeftScroll.Size = IsSingleTab and UDim2.new(1, 0, 1, -5) or UDim2.new(0.5, 0, 1, -5)

				if RightScroll and RightScroll.Parent then
					RightScroll.AnchorPoint = Vector2.new(0.5, 0.5)
					RightScroll.Position = UDim2.new(0.75, 0, 0.5, 0)
					RightScroll.Size = UDim2.new(0.5, 0, 1, -5)
				end;

				return;
			end;

			local MaxCenterHeight = math.max(80, TabFrame.AbsoluteSize.Y * 0.45);
			local CenterHeight = math.clamp(UIListLayout_3.AbsoluteContentSize.Y + 1, 0, MaxCenterHeight);
			local ColumnOffset = CenterHeight + 5;

			CenterScroll.AnchorPoint = Vector2.new(0.5, 0)
			CenterScroll.Position = UDim2.new(0.5, 0, 0, 0)
			CenterScroll.Size = UDim2.new(1, 0, 0, CenterHeight)

			LeftScroll.AnchorPoint = Vector2.new(0.5, 0)
			LeftScroll.Position = IsSingleTab and UDim2.new(0.5, 0, 0, ColumnOffset) or UDim2.new(0.25, 0, 0, ColumnOffset)
			LeftScroll.Size = IsSingleTab and UDim2.new(1, 0, 1, -ColumnOffset - 5) or UDim2.new(0.5, 0, 1, -ColumnOffset - 5)

			if RightScroll and RightScroll.Parent then
				RightScroll.AnchorPoint = Vector2.new(0.5, 0)
				RightScroll.Position = UDim2.new(0.75, 0, 0, ColumnOffset)
				RightScroll.Size = UDim2.new(0.5, 0, 1, -ColumnOffset - 5)
			end;
		end);

		L2Hub:AddSignal(UIListLayout_3:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			CenterScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout_3.AbsoluteContentSize.Y + 1)
			UpdateTabColumnLayout();
		end)))

		L2Hub:AddSignal(TabFrame:GetPropertyChangedSignal('AbsoluteSize'):Connect(LPH_NO_VIRTUALIZE(function()
			UpdateTabColumnLayout();
		end)))

		FlowScroll.Name = L2Hub.RandomString();
		FlowScroll.Parent = TabFrame
		FlowScroll.Active = true
		FlowScroll.AnchorPoint = Vector2.new(0.5, 0.5)
		FlowScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		FlowScroll.BackgroundTransparency = 1.000
		FlowScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		FlowScroll.BorderSizePixel = 0
		FlowScroll.ClipsDescendants = false
		FlowScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
		FlowScroll.Size = UDim2.new(1, 0, 1, -5)
		FlowScroll.ScrollBarThickness = 0
		FlowScroll.ZIndex = 7

		UIListLayout_4.Parent = FlowScroll
		UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_4.Padding = UDim.new(0, 5)

		Tab.Root = TabFrame;
		Tab.LeftScroll = LeftScroll;
		Tab.RightScroll = RightScroll;
		Tab.CenterScroll = CenterScroll;
		Tab.CustomRoot = FlowScroll;

		LeftScroll.Visible = false
		RightScroll.Visible = false
		CenterScroll.Visible = false

		L2Hub:AddSignal(UIListLayout_4:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			FlowScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout_4.AbsoluteContentSize.Y + 1)
		end)))

		local FlowOrder = 0;
		local PendingPairRow = nil;

		local function CreateFlowRow(kind)
			FlowOrder = FlowOrder + 1;

			local Row = Instance.new("Frame")
			local RowLayout = Instance.new("UIListLayout")

			Row.Name = L2Hub.RandomString();
			Row.Parent = FlowScroll
			Row.BackgroundTransparency = 1
			Row.BorderSizePixel = 0
			Row.ClipsDescendants = false
			Row.Size = UDim2.new(1, 0, 0, 0)
			Row.ZIndex = 8
			Row.LayoutOrder = FlowOrder

			RowLayout.Parent = Row
			RowLayout.FillDirection = Enum.FillDirection.Horizontal
			RowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			RowLayout.SortOrder = Enum.SortOrder.LayoutOrder
			RowLayout.Padding = UDim.new(0, 0)

			local LeftCell = Instance.new("Frame")
			local LeftLayout = Instance.new("UIListLayout")
			local RightCell = Instance.new("Frame")
			local RightLayout = Instance.new("UIListLayout")

			LeftCell.Name = L2Hub.RandomString();
			LeftCell.Parent = Row
			LeftCell.BackgroundTransparency = 1
			LeftCell.BorderSizePixel = 0
			LeftCell.ClipsDescendants = false
			LeftCell.LayoutOrder = 1
			LeftCell.Size = kind == "center" and UDim2.new(1, 0, 0, 0) or UDim2.new(0.5, 0, 0, 0)
			LeftCell.ZIndex = 8

			LeftLayout.Parent = LeftCell
			LeftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
			LeftLayout.Padding = UDim.new(0, 5)

			RightCell.Name = L2Hub.RandomString();
			RightCell.Parent = Row
			RightCell.BackgroundTransparency = 1
			RightCell.BorderSizePixel = 0
			RightCell.ClipsDescendants = false
			RightCell.LayoutOrder = 2
			RightCell.Size = UDim2.new(0.5, 0, 0, 0)
			RightCell.Visible = kind ~= "center"
			RightCell.ZIndex = 8

			RightLayout.Parent = RightCell
			RightLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
			RightLayout.Padding = UDim.new(0, 5)

			local function UpdateRowSize()
				local leftHeight = LeftLayout.AbsoluteContentSize.Y;
				local rightHeight = RightCell.Visible and RightLayout.AbsoluteContentSize.Y or 0;
				local height = math.max(leftHeight, rightHeight);

				Row.Size = UDim2.new(1, 0, 0, height);
				LeftCell.Size = UDim2.new(LeftCell.Size.X.Scale, 0, 0, height);
				RightCell.Size = UDim2.new(RightCell.Size.X.Scale, 0, 0, height);
				FlowScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout_4.AbsoluteContentSize.Y + 1);
			end;

			L2Hub:AddSignal(LeftLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(UpdateRowSize))
			L2Hub:AddSignal(RightLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(UpdateRowSize))

			return {
				Root = Row,
				Left = LeftCell,
				Right = RightCell,
				Kind = kind,
				HasLeft = false,
				HasRight = false,
				Update = UpdateRowSize,
			};
		end;

		local function ResolveFlowParent(Position)
			local PositionName = string.lower(tostring(Position or "left"));

			if PositionName == "center" then
				PendingPairRow = nil;
				return CreateFlowRow("center").Left;
			end;

			if IsSingleTab then
				PendingPairRow = nil;
				return CreateFlowRow("center").Left;
			end;

			if PositionName ~= "right" then
				PositionName = "left";
			end;

			if PendingPairRow and PendingPairRow.Kind == "pair" then
				if PositionName == "right" then
					PendingPairRow.HasRight = true;
					return PendingPairRow.Right;
				end;

				PendingPairRow.HasLeft = true;
				return PendingPairRow.Left;
			end;

			local NewRow = CreateFlowRow("pair");
			PendingPairRow = NewRow;

			if PositionName == "right" then
				NewRow.HasRight = true;
				return NewRow.Right;
			end;

			NewRow.HasLeft = true;
			return NewRow.Left;
		end;

		if IsSingleTab then
			UIListLayout_2:Destroy();
			RightScroll:Destroy();
			RightScroll = LeftScroll;
			UIListLayout_2 = UIListLayout;
			LeftScroll.Size = UDim2.new(1, 0, 1, -5);
			LeftScroll.Position = UDim2.new(0.5, 0, 0.5, 0)
		else
			L2Hub:AddSignal(UIListLayout_2:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
				RightScroll.CanvasSize = UDim2.fromOffset(0,UIListLayout_2.AbsoluteContentSize.Y + 1)
			end)))
		end;

		UpdateTabColumnLayout();

		L2Hub:AddSignal(TabIcon:GetPropertyChangedSignal('ImageTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if TabIcon.ImageTransparency > 0.4 then
				UIListLayout.Parent = nil;
				UIListLayout_2.Parent = nil;
				UIListLayout_3.Parent = nil;
				UIListLayout_4.Parent = nil;
				TabFrame.Visible = false;
				TabFrame.Parent = nil
			else
				UIListLayout.Parent = LeftScroll;
				UIListLayout_2.Parent = RightScroll;
				UIListLayout_3.Parent = CenterScroll;
				UIListLayout_4.Parent = FlowScroll;
				TabFrame.Visible = true;
				TabFrame.Parent = TabContainer;
			end;
		end)));

		Tab.SetValue = LPH_NO_VIRTUALIZE(function(value)
			if value and Tab.GetLocked and Tab:GetLocked() then
				value = false;
			end;

			Tab.Signal:SetValue(value);

			if value then
				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.500
				})

				L2Hub.PlayAnimate(TabIcon , SlowyTween , {
					TextTransparency = 0,
					TextColor3 = L2Hub.AccentColor
				})

				L2Hub.PlayAnimate(TabContentLabel , SlowyTween , {
					TextTransparency = 0
				})
			else
				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 1
				})

				L2Hub.PlayAnimate(TabIcon , SlowyTween , {
					TextTransparency = 0.5,
					TextColor3 = Color3.fromRGB(252, 252, 252)
				})

				L2Hub.PlayAnimate(TabContentLabel , SlowyTween , {
					TextTransparency = 0.5
				})
			end;
		end);

		local BaseTabSetLocked = Tab.SetLocked;
		function Tab:SetLocked(value)
			if BaseTabSetLocked then
				BaseTabSetLocked(Tab, value);
			end;

			if value == true and Window.Tabs[Window.CurrentTab] == Tab then
				Tab.SetValue(false);

				for Index,OtherTab in ipairs(Window.Tabs) do
					if OtherTab ~= Tab and (not OtherTab.GetLocked or not OtherTab:GetLocked()) then
						Window.CurrentTab = Index;
						OtherTab.SetValue(true);
						break;
					end;
				end;
			end;

			return Tab;
		end;

		function Tab:Select()
			if Tab.GetLocked and Tab:GetLocked() then
				return Tab;
			end;

			for i,v in next , Window.Tabs do
				if v == Tab then
					v.SetValue(true);
					Window.CurrentTab = i;
				else
					v.SetValue(false);
				end;
			end;

			return Tab;
		end;

		table.insert(Window.Tabs,Tab);

		if Window.Tabs[Window.CurrentTab] and Window.Tabs[Window.CurrentTab].GetLocked and Window.Tabs[Window.CurrentTab]:GetLocked() and (not Tab.GetLocked or not Tab:GetLocked()) then
			Window.CurrentTab = #Window.Tabs;
		end;

		if Window.Tabs[Window.CurrentTab] == Tab then
			Tab.SetValue(true)
		else
			Tab.SetValue(false);
		end;

		local over = L2Hub:CreateInput(TabButton,LPH_NO_VIRTUALIZE(function()
			if Tab.GetLocked and Tab:GetLocked() then
				return;
			end;

			for i,v in next , Window.Tabs do
				if v.Idx == TabButton then
					v.SetValue(true);
					Window.CurrentTab = i;
				else
					v.SetValue(false);
				end;
			end;
		end));

		L2Hub:AddSignal(over.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			if Window.Tabs[Window.CurrentTab] == Tab then
				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.500
				})
			else
				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.8
				})
			end;
		end)))

		L2Hub:AddSignal(over.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			if Window.Tabs[Window.CurrentTab] == Tab then
				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 0.500
				})
			else
				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 1
				})
			end;
		end)))

		Window.Signal:Connect(LPH_NO_VIRTUALIZE(function(value)
			if value then
				if Window.Tabs[Window.CurrentTab] == Tab then
					Tab.SetValue(true)
				else
					Tab.SetValue(false);
				end;
			else
				Tab.SetValue(false);

				L2Hub.PlayAnimate(TabButton , SlowyTween , {
					BackgroundTransparency = 1
				})

				L2Hub.PlayAnimate(TabIcon , SlowyTween , {
					TextTransparency = 1,
				})

				L2Hub.PlayAnimate(TabContentLabel , SlowyTween , {
					TextTransparency = 1
				})
			end;
		end));

		function Tab:AddSection(Config)
			Config = L2Hub:ProcessParams(Config , {
				Name = "SECTION",
				Position = 'left',
				Collapsible = false,
				Collapsed = false,
				Box = false,
				Icon = nil,
				IconColor = Color3.fromRGB(223, 223, 223),
				TextSize = 11,
				TextXAlignment = "Left",
				Locked = false,
				TextLocked = "Locked",
			});
			local SectionBoxed = Config.Collapsible == true and Config.Box == true;
			local function ResolveTextXAlignment(value)
				local Alignment = string.lower(tostring(value or "left"));

				if Alignment == "center" then
					return Enum.TextXAlignment.Center;
				elseif Alignment == "right" then
					return Enum.TextXAlignment.Right;
				end;

				return Enum.TextXAlignment.Left;
			end;
			local function GetSectionHeaderHeight()
				local TextHeight = (tonumber(Config.TextSize) or 11) + 9;
				local IconHeight = (Config.Icon and tostring(Config.Icon) ~= "") and 25 or 20;

				return math.max(20, TextHeight, IconHeight);
			end;

			local SectionFrame = Instance.new("Frame")
			local SectionIcon = Instance.new("ImageLabel")
			local SectionLabel = Instance.new("TextLabel")
			local SectionCollapseIcon = Instance.new("ImageLabel")
			local SectionHandler = Instance.new("Frame")
			local SectionHeaderSpacer = Instance.new("Frame")
			local UIStroke = Instance.new("UIStroke")
			local UICorner = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")

			SectionFrame.Name = L2Hub.RandomString();
			local SectionPosition = string.lower(tostring(Config.Position));
			SectionFrame.Parent = ResolveFlowParent(SectionPosition)
			SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionFrame.BackgroundTransparency = 1.000
			SectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionFrame.BorderSizePixel = 0
			SectionFrame.ClipsDescendants = true
			SectionFrame.Size = UDim2.new(1, -5, 0, 0)
			SectionFrame.ZIndex = 9

			SectionIcon.Name = L2Hub.RandomString();
			SectionIcon.Parent = SectionFrame
			SectionIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionIcon.BackgroundTransparency = 1.000
			SectionIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionIcon.BorderSizePixel = 0
			SectionIcon.Size = UDim2.new(0, 15, 0, 15)
			SectionIcon.ZIndex = 11
			SectionIcon.ImageColor3 = Config.IconColor
			SectionIcon.ImageTransparency = Config.Icon and 0.500 or 1
			SectionIcon.ScaleType = Enum.ScaleType.Fit
			if Config.Icon then
				L2Hub:SetIconMode(SectionIcon, Config.Icon);
			end;

			SectionLabel.Name = L2Hub.RandomString();
			SectionLabel.Parent = SectionFrame
			SectionLabel.AnchorPoint = Vector2.new(0, 0)
			SectionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionLabel.BackgroundTransparency = 1.000
			SectionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionLabel.BorderSizePixel = 0
			SectionLabel.Position = UDim2.new(0, 11, 0, 0)
			SectionLabel.Size = UDim2.new(1, -46, 0, 15)
			SectionLabel.ZIndex = 11
			SectionLabel.Font = Enum.Font.GothamBold
			SectionLabel.Text = Config.Name
			SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			SectionLabel.TextSize = tonumber(Config.TextSize) or 11
			SectionLabel.TextTransparency = 0.500
			SectionLabel.TextXAlignment = ResolveTextXAlignment(Config.TextXAlignment)
			L2Hub:AddTextGradient(SectionLabel);

			SectionCollapseIcon.Name = L2Hub.RandomString();
			SectionCollapseIcon.Parent = SectionFrame
			SectionCollapseIcon.AnchorPoint = Vector2.new(1, 0)
			SectionCollapseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionCollapseIcon.BackgroundTransparency = 1.000
			SectionCollapseIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionCollapseIcon.BorderSizePixel = 0
			SectionCollapseIcon.Position = SectionBoxed and UDim2.new(1, -8, 0, 1) or UDim2.new(1, -8, 0, -4)
			SectionCollapseIcon.Size = UDim2.new(0, 24, 0, 24)
			SectionCollapseIcon.Visible = Config.Collapsible == true
			SectionCollapseIcon.ZIndex = 12
			L2Hub:SetIconMode(SectionCollapseIcon, "chevron-small-down")
			SectionCollapseIcon.ImageColor3 = Color3.fromRGB(223, 223, 223)
			SectionCollapseIcon.ImageTransparency = 0.500
			SectionCollapseIcon.ScaleType = Enum.ScaleType.Fit

			SectionHandler.Name = L2Hub.RandomString();
			SectionHandler.Parent = SectionFrame
			SectionHandler.AnchorPoint = Vector2.new(0.5, 0)
			SectionHandler.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			SectionHandler.BackgroundTransparency = 0.500
			SectionHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SectionHandler.BorderSizePixel = 0
			SectionHandler.ClipsDescendants = true
			SectionHandler.Position = SectionBoxed and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0.5, 0, 0, GetSectionHeaderHeight())
			SectionHandler.Size = SectionBoxed and UDim2.new(1, -10, 1, 0) or UDim2.new(1, -10, 1, -GetSectionHeaderHeight() - 1)
			SectionHandler.ZIndex = 9

			SectionHeaderSpacer.Name = L2Hub.RandomString();
			SectionHeaderSpacer.Parent = SectionHandler
			SectionHeaderSpacer.BackgroundTransparency = 1.000
			SectionHeaderSpacer.BorderSizePixel = 0
			SectionHeaderSpacer.LayoutOrder = -100000
			SectionHeaderSpacer.Size = UDim2.new(1, 0, 0, GetSectionHeaderHeight() + 4)
			SectionHeaderSpacer.Visible = SectionBoxed
			SectionHeaderSpacer.ZIndex = 9

			UIStroke.Transparency = 0.650
			UIStroke.Color = Color3.fromRGB(45, 48, 58)
			UIStroke.Parent = SectionHandler

			UICorner.CornerRadius = UDim.new(0, 10)
			UICorner.Parent = SectionHandler

			UIListLayout.Parent = SectionHandler
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			local CollapseInput;
			local function UpdateSectionHeaderLayout()
				local HasIcon = Config.Icon ~= nil and tostring(Config.Icon) ~= "";
				local HeaderHeight = GetSectionHeaderHeight();
				local TextSize = tonumber(Config.TextSize) or 11;
				local LabelHeight = math.max(15, TextSize + 4);
				local IconSize = math.clamp(TextSize + 2, 14, 20);
				local HeaderY = math.max(0, math.floor((HeaderHeight - LabelHeight) / 2));
				local IconY = math.max(0, math.floor((HeaderHeight - IconSize) / 2));
				local ChevronY = math.floor((HeaderHeight - 24) / 2);
				local IconX = 11;
				local LabelX = HasIcon and 32 or 11;
				local RightPadding = Config.Collapsible == true and 38 or 11;

				SectionIcon.Visible = HasIcon;
				SectionIcon.Position = UDim2.new(0, IconX, 0, IconY);
				SectionIcon.Size = UDim2.new(0, IconSize, 0, IconSize);
				SectionIcon.ImageColor3 = Config.IconColor;
				SectionIcon.ImageTransparency = HasIcon and 0.500 or 1;
				SectionLabel.TextSize = TextSize;
				SectionLabel.Position = UDim2.new(0, LabelX, 0, HeaderY);
				SectionLabel.Size = UDim2.new(1, -(LabelX + RightPadding), 0, LabelHeight);
				SectionLabel.TextXAlignment = ResolveTextXAlignment(Config.TextXAlignment);
				SectionCollapseIcon.Position = UDim2.new(1, -8, 0, ChevronY);
				SectionHeaderSpacer.Size = UDim2.new(1, 0, 0, GetSectionHeaderHeight() + 4);
				SectionHandler.Position = SectionBoxed and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0.5, 0, 0, GetSectionHeaderHeight());
				SectionHandler.Size = SectionBoxed and UDim2.new(1, -10, 1, 0) or UDim2.new(1, -10, 1, -GetSectionHeaderHeight() - 1);
				if CollapseInput then
					CollapseInput.Size = UDim2.new(1, 0, 0, GetSectionHeaderHeight());
				end;
			end;

			UpdateSectionHeaderLayout();

			local Section = L2Hub:RegisiterItem(SectionHandler , Tab.Signal);
			Section.Collapsible = Config.Collapsible == true;
			Section.Collapsed = Config.Collapsed == true;
			Section.Root = SectionFrame;
			L2Hub:AttachLockMethods(Section, SectionFrame, Config);
			L2Hub.SectionOwners[SectionHandler] = Section;

			local IsSectionRendered = Tab.Signal:GetValue();
			local function UpdateSectionSize()
				if not IsSectionRendered then
					SectionFrame.Size = UDim2.new(1, -5, 0, 0);
					return;
				end;

				local ContentHeight = UIListLayout.AbsoluteContentSize.Y;
				local HeaderHeight = GetSectionHeaderHeight();
				local HeaderSpacerHeight = SectionBoxed and (HeaderHeight + 4) or 0;
				local BoxPadding = 0;
				local RealContentHeight = math.max(0, ContentHeight - HeaderSpacerHeight);
				local TargetHeight = SectionBoxed and (HeaderSpacerHeight + BoxPadding) or HeaderHeight;

				if not Section.Collapsed and RealContentHeight > 1 then
					TargetHeight = SectionBoxed and (HeaderSpacerHeight + RealContentHeight + BoxPadding) or (ContentHeight + HeaderHeight - 0.5);
				end;

				L2Hub.PlayAnimate(SectionFrame , VSlowTween , {
					Size = UDim2.new(1, -5, 0, TargetHeight)
				})
			end;

			local function RenderCollapsedState()
				local ShowContent = IsSectionRendered and not Section.Collapsed;

				SectionHandler.Visible = SectionBoxed and IsSectionRendered or ShowContent;
				UIListLayout.Parent = SectionHandler;

				if Section.Collapsible then
					L2Hub.PlayAnimate(SectionCollapseIcon,SlowyTween,{
						Rotation = Section.Collapsed and -90 or 0,
						ImageTransparency = IsSectionRendered and 0.500 or 1
					})
				end;

				UpdateSectionSize();
			end;

			L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(UpdateSectionSize)));

			function Section:SetCollapsed(value)
				if not Section.Collapsible then
					Section.Collapsible = true;
					Config.Collapsible = true;
					SectionCollapseIcon.Visible = true;
				end;

				Section.Collapsed = value == true;
				Config.Collapsed = Section.Collapsed;
				RenderCollapsedState();
				return Section;
			end;

			function Section:ToggleCollapsed()
				return Section:SetCollapsed(not Section.Collapsed);
			end;

			function Section:GetCollapsed()
				return Section.Collapsed;
			end;

			function Section:SetCollapsible(value)
				Section.Collapsible = value == true;
				Config.Collapsible = Section.Collapsible;
				SectionBoxed = Section.Collapsible and Config.Box == true;
				SectionCollapseIcon.Visible = Section.Collapsible;
				SectionHeaderSpacer.Visible = SectionBoxed;
				UpdateSectionHeaderLayout();

				if not Section.Collapsible then
					Section.Collapsed = false;
					Config.Collapsed = false;
				end;

				RenderCollapsedState();
				return Section;
			end;

			function Section:SetBox(value)
				Config.Box = value == true;
				SectionBoxed = Section.Collapsible and Config.Box == true;
				SectionHeaderSpacer.Visible = SectionBoxed;
				UpdateSectionHeaderLayout();
				RenderCollapsedState();
				return Section;
			end;

			function Section:GetBox()
				return SectionBoxed;
			end;

			function Section:SetIcon(icon)
				Config.Icon = icon;

				if Config.Icon and tostring(Config.Icon) ~= "" then
					L2Hub:SetIconMode(SectionIcon, Config.Icon);
				end;

				UpdateSectionHeaderLayout();
				RenderCollapsedState();
				return Section;
			end;

			function Section:SetIconColor(color)
				Config.IconColor = color or Config.IconColor;
				UpdateSectionHeaderLayout();
				return Section;
			end;

			function Section:SetTextSize(size)
				Config.TextSize = tonumber(size) or Config.TextSize;
				UpdateSectionHeaderLayout();
				RenderCollapsedState();
				return Section;
			end;

			function Section:SetTextXAlignment(alignment)
				Config.TextXAlignment = alignment or Config.TextXAlignment;
				UpdateSectionHeaderLayout();
				return Section;
			end;

			if Config.Collapsible then
				CollapseInput = L2Hub:CreateInput(SectionFrame , LPH_NO_VIRTUALIZE(function()
					Section:ToggleCollapsed();
				end));
				CollapseInput.ZIndex = 12;
				CollapseInput.Size = UDim2.new(1, 0, 0, GetSectionHeaderHeight());
			end;

			Section.SetRender = LPH_NO_VIRTUALIZE(function(value)
				IsSectionRendered = value == true;
				if value then
					L2Hub.PlayAnimate(SectionIcon,SlowyTween,{
						ImageTransparency = (Config.Icon and tostring(Config.Icon) ~= "") and 0.500 or 1
					})

					L2Hub.PlayAnimate(SectionLabel,SlowyTween,{
						TextTransparency = 0.500
					})

					L2Hub.PlayAnimate(SectionHandler,SlowyTween,{
						BackgroundTransparency = 0.500
					})

					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.650
					})
				else
					L2Hub.PlayAnimate(SectionIcon,SlowyTween,{
						ImageTransparency = 1
					})

					L2Hub.PlayAnimate(SectionLabel,SlowyTween,{
						TextTransparency = 1
					})

					L2Hub.PlayAnimate(SectionHandler,SlowyTween,{
						BackgroundTransparency = 1
					})

					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 1
					})
				end;

				RenderCollapsedState();
			end);

			Section.SetRender(Tab.Signal:GetValue());
			Tab.Signal:Connect(Section.SetRender);

			return CaseInsensitive(Section);
		end;

		function Tab:AddTabbox(Config)
			if typeof(Config) ~= "table" then
				Config = {
					Name = Config,
				};
			end;

			Config = L2Hub:ProcessParams(Config , {
				Name = "TABBOX",
				Position = 'left',
				Side = nil,
				Locked = false,
				TextLocked = "Locked",
			});

			local TabboxFrame = Instance.new("Frame")
			local TabboxLabel = Instance.new("TextLabel")
			local TabboxHolder = Instance.new("Frame")
			local UIStroke = Instance.new("UIStroke")
			local UICorner = Instance.new("UICorner")
			local ButtonHolder = Instance.new("Frame")
			local ButtonLayout = Instance.new("UIListLayout")

			local Tabbox = {
				Tabs = {},
				ActiveTab = nil,
			};

			TabboxFrame.Name = L2Hub.RandomString();
			local TabboxPosition = (Config.Side == 1 and "left") or (Config.Side == 2 and "right") or string.lower(Config.Position);

			TabboxFrame.Parent = ResolveFlowParent(TabboxPosition)
			TabboxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabboxFrame.BackgroundTransparency = 1.000
			TabboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabboxFrame.BorderSizePixel = 0
			TabboxFrame.ClipsDescendants = true
			TabboxFrame.Size = UDim2.new(1, -5, 0, 55)
			TabboxFrame.ZIndex = 9
			L2Hub:AttachLockMethods(Tabbox, TabboxFrame, Config);

			TabboxLabel.Name = L2Hub.RandomString();
			TabboxLabel.Parent = TabboxFrame
			TabboxLabel.AnchorPoint = Vector2.new(0.5, 0)
			TabboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabboxLabel.BackgroundTransparency = 1.000
			TabboxLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabboxLabel.BorderSizePixel = 0
			TabboxLabel.Position = UDim2.new(0.5, 0, 0, 0)
			TabboxLabel.Size = UDim2.new(1, -35, 0, 15)
			TabboxLabel.ZIndex = 9
			TabboxLabel.Font = Enum.Font.GothamBold
			TabboxLabel.Text = Config.Name
			TabboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TabboxLabel.TextSize = 11.000
			TabboxLabel.TextTransparency = 0.500
			TabboxLabel.TextXAlignment = Enum.TextXAlignment.Left
			L2Hub:AddTextGradient(TabboxLabel);

			TabboxHolder.Name = L2Hub.RandomString();
			TabboxHolder.Parent = TabboxFrame
			TabboxHolder.AnchorPoint = Vector2.new(0.5, 0)
			TabboxHolder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			TabboxHolder.BackgroundTransparency = 0.500
			TabboxHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TabboxHolder.BorderSizePixel = 0
			TabboxHolder.ClipsDescendants = true
			TabboxHolder.Position = UDim2.new(0.5, 0, 0, 20)
			TabboxHolder.Size = UDim2.new(1, -10, 1, -21)
			TabboxHolder.ZIndex = 9

			UIStroke.Transparency = 0.650
			UIStroke.Color = Color3.fromRGB(45, 48, 58)
			UIStroke.Parent = TabboxHolder

			UICorner.CornerRadius = UDim.new(0, 10)
			UICorner.Parent = TabboxHolder

			ButtonHolder.Name = L2Hub.RandomString();
			ButtonHolder.Parent = TabboxHolder
			ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonHolder.BackgroundTransparency = 1.000
			ButtonHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonHolder.BorderSizePixel = 0
			ButtonHolder.Position = UDim2.new(0, 5, 0, 5)
			ButtonHolder.Size = UDim2.new(1, -10, 0, 28)
			ButtonHolder.ZIndex = 10

			ButtonLayout.Parent = ButtonHolder
			ButtonLayout.FillDirection = Enum.FillDirection.Horizontal
			ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ButtonLayout.Padding = UDim.new(0, 5)

			local UpdateSize = LPH_NO_VIRTUALIZE(function()
				local ActiveTab = Tabbox.ActiveTab;
				local height = 41;

				if ActiveTab and ActiveTab.Layout then
					height = ActiveTab.Layout.AbsoluteContentSize.Y + 41;
				end;

				if height <= 41 then
					height = 55;
				end;

				L2Hub.PlayAnimate(TabboxFrame , VSlowTween , {
					Size = UDim2.new(1, -5, 0, height + 19.5)
				})
			end);

			local UpdateParentRender = LPH_NO_VIRTUALIZE(function(value)
				if value then
					L2Hub.PlayAnimate(TabboxLabel,SlowyTween,{
						TextTransparency = 0.500
					})

					L2Hub.PlayAnimate(TabboxHolder,SlowyTween,{
						BackgroundTransparency = 0.500
					})

					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.650
					})
				else
					L2Hub.PlayAnimate(TabboxLabel,SlowyTween,{
						TextTransparency = 1
					})

					L2Hub.PlayAnimate(TabboxHolder,SlowyTween,{
						BackgroundTransparency = 1
					})

					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 1
					})
				end;

				for _,SubTab in ipairs(Tabbox.Tabs) do
					SubTab.Signal:SetValue(value and Tabbox.ActiveTab == SubTab);
					SubTab.Root.Visible = Tabbox.ActiveTab == SubTab;
					SubTab.RenderButton(value and Tabbox.ActiveTab == SubTab);
				end;
			end);

			function Tabbox:AddTab(Name , IconName)
				local TabConfig = {};

				if typeof(Name) == "table" then
					TabConfig = Name;
					IconName = TabConfig.Icon or TabConfig.IconName or IconName;
					Name = TabConfig.Name or TabConfig.Title or "Tab";
				end;

				local SubTab = {
					Name = Name or "Tab",
					Icon = IconName or "folder",
					Signal = L2Hub:CreateSignal(false),
				};

				TabConfig.Locked = TabConfig.Locked == true;
				TabConfig.TextLocked = TabConfig.TextLocked or "Locked";

				local Button = Instance.new("Frame")
				local ButtonCorner = Instance.new("UICorner")
				local ButtonStroke = Instance.new("UIStroke")
				local Icon = Instance.new("ImageLabel")
				local Label = Instance.new("TextLabel")
				local Container = Instance.new("Frame")
				local Layout = Instance.new("UIListLayout")

				Button.Name = L2Hub.RandomString();
				Button.Parent = ButtonHolder
				Button.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.ClipsDescendants = true
				Button.Size = UDim2.new(0, 0, 1, 0)
				Button.ZIndex = 11
				L2Hub:AttachLockMethods(SubTab, Button, TabConfig);

				ButtonCorner.CornerRadius = UDim.new(0, 5)
				ButtonCorner.Parent = Button

				ButtonStroke.Transparency = 1
				ButtonStroke.Color = Color3.fromRGB(45, 48, 58)
				ButtonStroke.Parent = Button

				Icon.Name = L2Hub.RandomString();
				Icon.Parent = Button
				Icon.AnchorPoint = Vector2.new(0, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(0, 7, 0.5, 0)
				Icon.Size = UDim2.new(0, 18, 0, 18)
				Icon.ZIndex = 12
				L2Hub:SetIconMode(Icon, SubTab.Icon)
				Icon.ImageColor3 = Color3.fromRGB(223, 223, 223)
				Icon.ImageTransparency = 0.500
				Icon.ScaleType = Enum.ScaleType.Fit
				-- Hide icon so the label can use the full button width
				Icon.Visible = true

				Label.Name = L2Hub.RandomString();
				Label.Parent = Button
				Label.AnchorPoint = Vector2.new(0, 0.5)
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label.BackgroundTransparency = 1.000
				Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Label.BorderSizePixel = 0
				-- Start from x=3 (no icon offset) and use full button width
				Label.Position = UDim2.new(0, 25, 0.5, 0)
				Label.Size = UDim2.new(1, -25, 0, 15)
				Label.ZIndex = 12
				Label.Font = Enum.Font.GothamBold
				Label.Text = SubTab.Name
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				-- Smaller text size so names fit even with many tabs
				Label.TextSize = 9.000
				Label.TextTransparency = 0.500
				Label.TextXAlignment = Enum.TextXAlignment.Center
				Label.TextTruncate = Enum.TextTruncate.AtEnd
				L2Hub:AddTextGradient(Label);

				Container.Name = L2Hub.RandomString();
				Container.Parent = TabboxHolder
				Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Container.BackgroundTransparency = 1.000
				Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Container.BorderSizePixel = 0
				Container.ClipsDescendants = true
				Container.Position = UDim2.new(0, 5, 0, 36)
				Container.Size = UDim2.new(1, -10, 1, -39)
				Container.Visible = false
				Container.ZIndex = 10

				Layout.Parent = Container
				Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				Layout.SortOrder = Enum.SortOrder.LayoutOrder

				SubTab.Root = Container;
				SubTab.Layout = Layout;
				SubTab.Button = Button;

				local widthScale = 1 / math.max(#Tabbox.Tabs + 1,1);
				for _,ExistingTab in ipairs(Tabbox.Tabs) do
					ExistingTab.Button.Size = UDim2.new(widthScale, -4, 1, 0);
				end;
				Button.Size = UDim2.new(widthScale, -4, 1, 0);

				local RenderButton = LPH_NO_VIRTUALIZE(function(active)
					if active then
						L2Hub.PlayAnimate(Button,SlowyTween,{
							BackgroundTransparency = 0.150
						})

						L2Hub.PlayAnimate(ButtonStroke,SlowyTween,{
							Transparency = 0.650
						})

						L2Hub.PlayAnimate(Icon,SlowyTween,{
							TextTransparency = 0,
							TextColor3 = L2Hub.AccentColor
						})

						L2Hub.PlayAnimate(Label,SlowyTween,{
							TextTransparency = 0
						})
					else
						L2Hub.PlayAnimate(Button,SlowyTween,{
							BackgroundTransparency = 1
						})

						L2Hub.PlayAnimate(ButtonStroke,SlowyTween,{
							Transparency = 1
						})

						L2Hub.PlayAnimate(Icon,SlowyTween,{
							TextTransparency = Tab.Signal:GetValue() and 0.500 or 1,
							TextColor3 = Color3.fromRGB(223, 223, 223)
						})

						L2Hub.PlayAnimate(Label,SlowyTween,{
							TextTransparency = Tab.Signal:GetValue() and 0.500 or 1
						})
					end;
				end);

				function SubTab:Show()
					if Tabbox.GetLocked and Tabbox:GetLocked() then
						return SubTab;
					end;

					if SubTab.GetLocked and SubTab:GetLocked() then
						return SubTab;
					end;

					Tabbox.ActiveTab = SubTab;

					for _,Item in ipairs(Tabbox.Tabs) do
						local isActive = Item == SubTab and Tab.Signal:GetValue();

						Item.Root.Visible = Item == SubTab;
						Item.Signal:SetValue(isActive);
						Item.RenderButton(Item == SubTab and Tab.Signal:GetValue());
					end;

					UpdateSize();
				end;

				function SubTab:Hide()
					Container.Visible = false;
					SubTab.Signal:SetValue(false);
					RenderButton(false);
				end;

				SubTab.RenderButton = RenderButton;

				L2Hub:AddSignal(Layout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
					if Tabbox.ActiveTab == SubTab then
						UpdateSize();
					end;
				end)))

				local Input = L2Hub:CreateInput(Button , LPH_NO_VIRTUALIZE(function()
					if Tabbox.GetLocked and Tabbox:GetLocked() then
						return;
					end;

					if SubTab.GetLocked and SubTab:GetLocked() then
						return;
					end;

					SubTab:Show();
				end));

				L2Hub:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					if Tabbox.ActiveTab ~= SubTab and Tab.Signal:GetValue() then
						L2Hub.PlayAnimate(Button,SlowyTween,{
							BackgroundTransparency = 0.650
						})
					end;
				end)))

				L2Hub:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					if Tabbox.ActiveTab ~= SubTab then
						RenderButton(false);
					end;
				end)))

				local Handler = L2Hub:RegisiterItem(Container , SubTab.Signal);
				SubTab.Handler = Handler;

				function Handler:Select()
					if SubTab.GetLocked and SubTab:GetLocked() then
						return Handler;
					end;

					SubTab:Show();
					return Handler;
				end;

				function Handler:SetLocked(value)
					if SubTab.SetLocked then
						SubTab:SetLocked(value);
					end;

					if value == true and Tabbox.ActiveTab == SubTab then
						SubTab:Hide();

						for _,Item in ipairs(Tabbox.Tabs) do
							if Item ~= SubTab and (not Item.GetLocked or not Item:GetLocked()) then
								Item:Show();
								break;
							end;
						end;
					end;

					return Handler;
				end;

				function Handler:GetLocked()
					return SubTab.GetLocked and SubTab:GetLocked() or false;
				end;

				function Handler:SetTextLocked(text)
					if SubTab.SetTextLocked then
						SubTab:SetTextLocked(text);
					end;

					return Handler;
				end;

				function Handler:SetIcon(icon)
					SubTab.Icon = icon or SubTab.Icon;
					L2Hub:SetIconMode(Icon, SubTab.Icon);
					return Handler;
				end;

				function Handler:SetText(text)
					Tabbox.Tabs[SubTab.Name] = nil;
					SubTab.Name = text or SubTab.Name;
					Tabbox.Tabs[SubTab.Name] = SubTab;
					Label.Text = SubTab.Name;
					return Handler;
				end;

				table.insert(Tabbox.Tabs,SubTab);
				Tabbox.Tabs[SubTab.Name] = SubTab;

				if not Tabbox.ActiveTab then
					SubTab:Show();
				else
					SubTab:Hide();
				end;

				UpdateSize();

				return CaseInsensitive(Handler);
			end;

			function Tabbox:Select(Name)
				local SubTab = Tabbox.Tabs[Name];

				if SubTab then
					SubTab:Show();
				end;

				return Tabbox;
			end;

			function Tabbox:SetVisible(value)
				TabboxFrame.Visible = value;
			end;

			UpdateParentRender(Tab.Signal:GetValue());
			Tab.Signal:Connect(UpdateParentRender);
			UpdateSize();

			return CaseInsensitive(Tabbox);
		end;

		function Tab:AddLeftTabbox(Name)
			return Tab:AddTabbox({
				Name = Name,
				Position = "left",
			});
		end;

		function Tab:AddRightTabbox(Name)
			return Tab:AddTabbox({
				Name = Name,
				Position = "right",
			});
		end;

		function Tab:AddCenterTabbox(Name)
			return Tab:AddTabbox({
				Name = Name,
				Position = "center",
			});
		end;

		return CaseInsensitive(Tab);
	end;

	function Window:_InitConfig()
		local ConfigSignal = L2Hub:CreateSignal(false);
		local ConfigLib = {
			Signals = {},
		};

		local ConfigMenu = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local UIStroke = Instance.new("UIStroke")
		local InputFrame = Instance.new("Frame")
		local BasedLabel = Instance.new("TextLabel")
		local LineFrame = Instance.new("Frame")
		local BasedHandler = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local TextInput = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIStroke_2 = Instance.new("UIStroke")
		local TextBox = Instance.new("TextBox")
		local LoadConfig = Instance.new("Frame")
		local Icon = Instance.new("ImageLabel")
		local UICorner_3 = Instance.new("UICorner")
		local UICorner_4 = Instance.new("UICorner")

		local shadow = L2Hub:CreateShadow(ConfigMenu);

		ConfigLib.SetRender = LPH_NO_VIRTUALIZE(function(value)
			if value then
				ConfigMenu.Position = UDim2.fromOffset(ConfigFrame.AbsolutePosition.X + 110 , ConfigFrame.AbsolutePosition.Y + 96)

				L2Hub.PlayAnimate(ConfigMenu , SlowyTween , {
					BackgroundTransparency = 0.035,
					Position = UDim2.fromOffset(ConfigFrame.AbsolutePosition.X + 110 , ConfigFrame.AbsolutePosition.Y + 95)
				})	

				L2Hub.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 0.650
				})
				L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 0.200
				})	

				L2Hub.PlayAnimate(UIStroke_2 , SlowyTween , {
					Transparency = 0.65
				})	

				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 0.650
				})	
				L2Hub.PlayAnimate(TextInput , SlowyTween , {
					BackgroundTransparency = 0
				})	
				L2Hub.PlayAnimate(TextBox , SlowyTween , {
					TextTransparency = 0.350
				})	
				L2Hub.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 0.350
				})	

				L2Hub.PlayAnimate(ConfigBthIcon , SlowyTween , {
					Rotation = 180
				})	

				shadow:Render(true)
			else
				L2Hub.PlayAnimate(ConfigBthIcon , SlowyTween , {
					Rotation = 0
				})

				L2Hub.PlayAnimate(ConfigMenu , SlowyTween , {
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(ConfigFrame.AbsolutePosition.X + 110 , ConfigFrame.AbsolutePosition.Y + 96)
				})	

				L2Hub.PlayAnimate(UIStroke_2 , SlowyTween , {
					Transparency = 1
				})	

				L2Hub.PlayAnimate(UIStroke , SlowyTween , {
					Transparency = 1
				})
				L2Hub.PlayAnimate(BasedLabel , SlowyTween , {
					TextTransparency = 1
				})	
				L2Hub.PlayAnimate(LineFrame , SlowyTween , {
					BackgroundTransparency = 1
				})	
				L2Hub.PlayAnimate(TextInput , SlowyTween , {
					BackgroundTransparency = 1
				})	
				L2Hub.PlayAnimate(TextBox , SlowyTween , {
					TextTransparency = 1
				})	
				L2Hub.PlayAnimate(Icon , SlowyTween , {
					TextTransparency = 1
				})	

				shadow:Render(false)
			end;
		end);

		L2Hub:AddSignal(ConfigMenu:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if ConfigMenu.BackgroundTransparency > 0.9 then
				ConfigMenu.Visible = false;
				UIListLayout.Parent = nil;
				ConfigMenu.Parent = nil;
			else

				ConfigMenu.Visible = true;
				UIListLayout.Parent = ConfigMenu

				if L2Hub.Global3DRenderMode then
					ConfigMenu.Parent = L2Hub.GlobalSurfaceGui;
				else
					ConfigMenu.Parent = L2Hub.ScreenGui;
				end;
			end
		end)))

		ConfigMenu.Name = L2Hub.RandomString();
		ConfigMenu.Parent = L2Hub.ScreenGui;
		ConfigMenu.AnchorPoint = Vector2.new(0.5, 0)
		ConfigMenu.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		ConfigMenu.BackgroundTransparency = 0.035
		ConfigMenu.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ConfigMenu.BorderSizePixel = 0
		ConfigMenu.ClipsDescendants = true
		ConfigMenu.Position = UDim2.new(255,255,255,255)
		ConfigMenu.Size = UDim2.new(0, 220,0, 110)
		ConfigMenu.ZIndex = 151

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = ConfigMenu

		UIListLayout.Parent = ConfigMenu
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 4)

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = ConfigMenu

		InputFrame.Name = L2Hub.RandomString();
		InputFrame.Parent = ConfigMenu
		InputFrame.BackgroundColor3 = Color3.fromRGB(25, 27, 33)
		InputFrame.BackgroundTransparency = 1.000
		InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		InputFrame.BorderSizePixel = 0
		InputFrame.Size = UDim2.new(1, 0, 0, 30)
		InputFrame.ZIndex = 154

		BasedLabel.Name = L2Hub.RandomString();
		BasedLabel.Parent = InputFrame
		BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.BackgroundTransparency = 1.000
		BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedLabel.BorderSizePixel = 0
		BasedLabel.Position = UDim2.new(0, 11, 0, 6)
		BasedLabel.Size = UDim2.new(0,1, 0, 15)
		BasedLabel.ZIndex = 154
		BasedLabel.Font = Enum.Font.GothamBold
		BasedLabel.Text = "Config"
		BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		BasedLabel.TextSize = 13.000
		BasedLabel.TextTransparency = 0.200
		BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

		LineFrame.Name = L2Hub.RandomString();
		LineFrame.Parent = InputFrame
		LineFrame.AnchorPoint = Vector2.new(0.5, 1)
		LineFrame.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		LineFrame.BackgroundTransparency = 0.650
		LineFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineFrame.BorderSizePixel = 0
		LineFrame.Position = UDim2.new(0.5, 0, 1, 0)
		LineFrame.Size = UDim2.new(1, -20, 0, 1)
		LineFrame.ZIndex = 154

		BasedHandler.Name = L2Hub.RandomString();
		BasedHandler.Parent = InputFrame
		BasedHandler.AnchorPoint = Vector2.new(1, 0)
		BasedHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		BasedHandler.BackgroundTransparency = 1.000
		BasedHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
		BasedHandler.BorderSizePixel = 0
		BasedHandler.Position = UDim2.new(1, -11, 0, 2)
		BasedHandler.Size = UDim2.new(1, -20, 0, 25)
		BasedHandler.ZIndex = 154

		UIListLayout_2.Parent = BasedHandler
		UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout_2.Padding = UDim.new(0, 5)

		L2Hub:AddSignal(UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			if #ConfigLib.Signals <= 0 then
				L2Hub.PlayAnimate(ConfigMenu , SlowyTween , {
					Size = UDim2.new(0, 220,0, UIListLayout.AbsoluteContentSize.Y + 0);
				})
			else
				L2Hub.PlayAnimate(ConfigMenu , SlowyTween , {
					Size = UDim2.new(0, 220,0, UIListLayout.AbsoluteContentSize.Y + 5);
				})
			end;

		end)));

		TextInput.Name = L2Hub.RandomString();
		TextInput.Parent = BasedHandler
		TextInput.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		TextInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextInput.BorderSizePixel = 0
		TextInput.ClipsDescendants = true
		TextInput.Size = UDim2.new(0, 100, 0, 18)
		TextInput.ZIndex = 154

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = TextInput

		UIStroke_2.Transparency = 0.650
		UIStroke_2.Color = Color3.fromRGB(45, 48, 58)
		UIStroke_2.Parent = TextInput

		TextBox.Parent = TextInput
		TextBox.AnchorPoint = Vector2.new(0, 0.5)
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextBox.BorderSizePixel = 0
		TextBox.Position = UDim2.new(0, 5, 0.5, 0)
		TextBox.Size = UDim2.new(1, -5, 0, 17)
		TextBox.ZIndex = 154
		TextBox.ClearTextOnFocus = false
		TextBox.Font = Enum.Font.GothamBold
		TextBox.PlaceholderText = "Config Name ..."
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 11.000
		TextBox.TextTransparency = 0.350
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		LoadConfig.Name = L2Hub.RandomString();
		LoadConfig.Parent = BasedHandler
		LoadConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
		LoadConfig.BackgroundTransparency = 1.000
		LoadConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LoadConfig.BorderSizePixel = 0
		LoadConfig.ClipsDescendants = true
		LoadConfig.Size = UDim2.new(0, 20, 0, 18)
		LoadConfig.ZIndex = 153

		Icon.Name = L2Hub.RandomString();
		Icon.Parent = LoadConfig
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		Icon.Size = UDim2.new(1, 0, 1, 0)
		Icon.ZIndex = 153
		L2Hub:SetIconMode(Icon, "plus-large")
		Icon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		Icon.ImageTransparency = 0.350
		Icon.ScaleType = Enum.ScaleType.Fit

		UICorner_3.CornerRadius = UDim.new(0, 4)
		UICorner_3.Parent = LoadConfig

		UICorner_4.CornerRadius = UDim.new(0, 10)
		UICorner_4.Parent = InputFrame

		local OpenButton = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")

		OpenButton.Name = L2Hub.RandomString();
		OpenButton.Parent = ConfigFrame
		OpenButton.AnchorPoint = Vector2.new(0, 0.5)
		OpenButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		OpenButton.BackgroundTransparency = 1.000
		OpenButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OpenButton.BorderSizePixel = 0
		OpenButton.Position = UDim2.new(0, 31, 0.5, 0)
		OpenButton.Size = UDim2.new(1, -31, 1, 0)
		OpenButton.ZIndex = 10
		OpenButton.Font = Enum.Font.SourceSans
		OpenButton.Text = ""
		OpenButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		OpenButton.TextSize = 14.000

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = OpenButton

		ConfigLib.SetRender(false);
		ConfigSignal:Connect(ConfigLib.SetRender);
		ConfigLib.UnsafeThread = nil;
		ConfigLib.SelectedConfig = Window.ConfigAutoSaveFile or "Default";
		ConfigName.Text = ConfigLib.SelectedConfig;

		local UpdateSize = LPH_NO_VIRTUALIZE(function()
			local size = TextService:GetTextSize(ConfigName.Text , ConfigName.TextSize,ConfigName.Font,Vector2.new(math.huge,math.huge));

			L2Hub.PlayAnimate(ConfigFrame,SlowyTween , {
				Size = UDim2.fromOffset(size.X + 75, 30)
			});
		end);

		UpdateSize();

		function ConfigLib:GetData(performance)
			local ikc = {};
			
			local cd = 0;
			-- Config hanya menyimpan element yang punya Flag/Key/ConfigKey.
			-- Flag dipakai sebagai key unik untuk save/load value.
			for Flag,v in next , L2Hub.Flags do
				if v and v.GetValue then
					local data = v:GetValue();

					if typeof(data) == 'Color3' then
						table.insert(ikc,{
							Idx = Flag,
							Value = data:ToHex(),
						});
					else
						table.insert(ikc,{
							Idx = Flag,
							Value = data
						});
					end;
				end;
				
				if performance then
					if cd % 35 == 1 then
						task.wait()
					end
				end;
				
				cd += 1;
			end;

			local JsonData = HttpService:JSONEncode(ikc);

			if Window.ConfigEncrypted then
				return L2Hub.Base64Encode(Encryption.new(JsonData));
			end;

			return JsonData;
		end;

		function ConfigLib:WriteConfig(ConfigNameStr, Overwrite, performance)
			ConfigNameStr = tostring(ConfigNameStr or ConfigLib.SelectedConfig or "Default");
			ConfigNameStr = string.sub(ConfigNameStr, 1, 24);

			if not ConfigNameStr:byte() or ConfigNameStr:find('/',1,true) or ConfigNameStr:find('\\',1,true) then
				Logging.new("folder","Invalid config name!",3.5);
				return false;
			end;

			if not isfolder(Window.ConfigFolder) then
				makefolder(Window.ConfigFolder);
			end;

			local path = Window.ConfigFolder..'/'..ConfigNameStr;
			local Exists = isfile(path);
			local ShouldOverwrite = Overwrite;

			if ShouldOverwrite == nil then
				ShouldOverwrite = Window.ConfigOverwrite;
			end;

			if Exists and not ShouldOverwrite then
				Logging.new("folder","Config "..tostring(ConfigNameStr).." already exists!",3.5);
				return false;
			end;

			writefile(path,ConfigLib:GetData(performance));

			ConfigLib.SelectedConfig = ConfigNameStr;
			ConfigName.Text = ConfigNameStr;
			UpdateSize();

			Logging.new("folder",(Exists and "Overwritten " or "Created ")..tostring(ConfigNameStr),3.5);
			return true;
		end;

		function ConfigLib:RewriteSelectedAsJson()
			local WasEncrypted = Window.ConfigEncrypted;
			Window.ConfigEncrypted = false;

			local Saved = ConfigLib:WriteConfig(ConfigLib.SelectedConfig or "Default", true);
			Window.ConfigEncrypted = WasEncrypted;

			return Saved;
		end;

		function ConfigLib:DecodeData(data)
			local success, decoded = pcall(function()
				return HttpService:JSONDecode(data);
			end);

			if success and typeof(decoded) == "table" then
				return decoded;
			end;

			success, decoded = pcall(function()
				return HttpService:JSONDecode(Encryption.reverse(L2Hub.Base64Decode(data)));
			end);

			if success and typeof(decoded) == "table" then
				return decoded;
			end;

			return {};
		end;

		function ConfigLib:LoadData(data)
			local coded = ConfigLib:DecodeData(data);

			for i,v in next , coded do
				if v.Idx then
					if L2Hub.Flags[v.Idx] then
						task.spawn(function()
							L2Hub.Flags[v.Idx]:SetValue(v.Value)
						end)
					else
						L2Hub.PendingFlagValues[v.Idx] = v.Value;
					end;
				end;
			end;
		end;

		function ConfigLib:RefreshConfig()
			if not isfolder(Window.ConfigFolder) then
				makefolder(Window.ConfigFolder);
			end;
			
			if not isfile(Window.ConfigFolder..'/'..ConfigLib.SelectedConfig) then
				writefile(Window.ConfigFolder..'/'..ConfigLib.SelectedConfig,ConfigLib:GetData());
			end;
			
			for i,v in next,ConfigMenu:GetChildren() do
				if v:GetAttribute('ConfigItem') then
					v:Destroy();
				end;
			end;

			for i,v in next , ConfigLib.Signals do
				v:Disconnect();
			end

			table.clear(ConfigLib.Signals);

			local ConfigList = {};
			for i,v in next , listfiles(Window.ConfigFolder) do

				local name = string.sub(v , #Window.ConfigFolder + 2);

				table.insert(ConfigList , name)
			end;

			for i,ConfigNameStr in next , ConfigList do
				local ConfigItemFrame = Instance.new("Frame")
				local BasedHandler = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local DeleteConfig = Instance.new("Frame")
				local Icon = Instance.new("ImageLabel")
				local UICorner = Instance.new("UICorner")
				local OverwriteConfig = Instance.new("Frame")
				local Icon_3 = Instance.new("ImageLabel")
				local UICorner_4 = Instance.new("UICorner")
				local LoadConfig = Instance.new("Frame")
				local Icon_2 = Instance.new("ImageLabel")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")
				local BasedLabel = Instance.new("TextLabel")
				local UIStroke = Instance.new("UIStroke")

				ConfigItemFrame.Name = L2Hub.RandomString();
				ConfigItemFrame.Parent = ConfigMenu
				ConfigItemFrame.BackgroundColor3 = Color3.fromRGB(21, 20, 27)
				ConfigItemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ConfigItemFrame.BorderSizePixel = 0
				ConfigItemFrame.Size = UDim2.new(1, -10, 0, 30)
				ConfigItemFrame.ZIndex = 153
				ConfigItemFrame:SetAttribute('ConfigItem',true);

				BasedHandler.Name = L2Hub.RandomString();
				BasedHandler.Parent = ConfigItemFrame
				BasedHandler.AnchorPoint = Vector2.new(1, 0)
				BasedHandler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BasedHandler.BackgroundTransparency = 1.000
				BasedHandler.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BasedHandler.BorderSizePixel = 0
				BasedHandler.Position = UDim2.new(1, -11, 0, 2)
				BasedHandler.Size = UDim2.new(1, -20, 0, 25)
				BasedHandler.ZIndex = 153

				UIListLayout.Parent = BasedHandler
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				UIListLayout.Padding = UDim.new(0, 5)

				DeleteConfig.Name = L2Hub.RandomString();
				DeleteConfig.Parent = BasedHandler
				DeleteConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
				DeleteConfig.BackgroundTransparency = 1.000
				DeleteConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DeleteConfig.BorderSizePixel = 0
				DeleteConfig.ClipsDescendants = true
				DeleteConfig.Size = UDim2.new(0, 20, 0, 18)
				DeleteConfig.ZIndex = 153

				Icon.Name = L2Hub.RandomString();
				Icon.Parent = DeleteConfig
				Icon.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon.Size = UDim2.new(1, 0, 1, 0)
				Icon.ZIndex = 153
				L2Hub:SetIconMode(Icon, "trash-can")
				Icon.ImageColor3 = Color3.fromRGB(223, 223, 223)
				Icon.ImageTransparency = 0.400
				Icon.ScaleType = Enum.ScaleType.Fit

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = DeleteConfig

				OverwriteConfig.Name = L2Hub.RandomString();
				OverwriteConfig.Parent = BasedHandler
				OverwriteConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
				OverwriteConfig.BackgroundTransparency = 1.000
				OverwriteConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OverwriteConfig.BorderSizePixel = 0
				OverwriteConfig.ClipsDescendants = true
				OverwriteConfig.Size = UDim2.new(0, 20, 0, 18)
				OverwriteConfig.ZIndex = 153

				Icon_3.Name = L2Hub.RandomString();
				Icon_3.Parent = OverwriteConfig
				Icon_3.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon_3.BackgroundTransparency = 1.000
				Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon_3.BorderSizePixel = 0
				Icon_3.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon_3.Size = UDim2.new(1, 0, 1, 0)
				Icon_3.ZIndex = 153
				L2Hub:SetIconMode(Icon_3, "pencil-square")
				Icon_3.ImageColor3 = Color3.fromRGB(223, 223, 223)
				Icon_3.ImageTransparency = 0.400
				Icon_3.ScaleType = Enum.ScaleType.Fit

				UICorner_4.CornerRadius = UDim.new(0, 4)
				UICorner_4.Parent = OverwriteConfig

				LoadConfig.Name = L2Hub.RandomString();
				LoadConfig.Parent = BasedHandler
				LoadConfig.BackgroundColor3 = Color3.fromRGB(39, 40, 49)
				LoadConfig.BackgroundTransparency = 1.000
				LoadConfig.BorderColor3 = Color3.fromRGB(0, 0, 0)
				LoadConfig.BorderSizePixel = 0
				LoadConfig.ClipsDescendants = true
				LoadConfig.Size = UDim2.new(0, 20, 0, 18)
				LoadConfig.ZIndex = 153

				Icon_2.Name = L2Hub.RandomString();
				Icon_2.Parent = LoadConfig
				Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
				Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon_2.BackgroundTransparency = 1.000
				Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon_2.BorderSizePixel = 0
				Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Icon_2.Size = UDim2.new(1, 0, 1, 0)
				Icon_2.ZIndex = 153
				L2Hub:SetIconMode(Icon_2, "arrow-right-from-portrait-rectangle")
				Icon_2.ImageColor3 = Color3.fromRGB(223, 223, 223)
				Icon_2.ImageTransparency = 0.400
				Icon_2.ScaleType = Enum.ScaleType.Fit

				UICorner_2.CornerRadius = UDim.new(0, 4)
				UICorner_2.Parent = LoadConfig

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = ConfigItemFrame

				BasedLabel.Name = L2Hub.RandomString();
				BasedLabel.Parent = ConfigItemFrame
				BasedLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BasedLabel.BackgroundTransparency = 1.000
				BasedLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BasedLabel.BorderSizePixel = 0
				BasedLabel.Position = UDim2.new(0, 11, 0, 7)
				BasedLabel.Size = UDim2.new(0, 1, 0, 15)
				BasedLabel.ZIndex = 153
				BasedLabel.Font = Enum.Font.GothamBold
				BasedLabel.Text = ConfigNameStr
				BasedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				BasedLabel.TextSize = 13.000
				BasedLabel.TextTransparency = 0.200
				BasedLabel.TextXAlignment = Enum.TextXAlignment.Left

				UIStroke.Transparency = 0.500
				UIStroke.Color = Color3.fromRGB(45, 48, 58)
				UIStroke.Parent = ConfigItemFrame

				local Render = LPH_NO_VIRTUALIZE(function(rst)
					if rst then
						L2Hub.PlayAnimate(ConfigItemFrame,SlowyTween,{
							BackgroundTransparency = 0
						})

						L2Hub.PlayAnimate(Icon,SlowyTween,{
							TextTransparency = 0.400
						})

						L2Hub.PlayAnimate(Icon_3,SlowyTween,{
							TextTransparency = 0.400
						})

						L2Hub.PlayAnimate(Icon_2,SlowyTween,{
							TextTransparency = 0.400
						})

						L2Hub.PlayAnimate(BasedLabel,SlowyTween,{
							TextTransparency = 0.200
						})

						L2Hub.PlayAnimate(UIStroke,SlowyTween,{
							Transparency = 0.500
						})
					else
						L2Hub.PlayAnimate(ConfigItemFrame,SlowyTween,{
							BackgroundTransparency = 1
						})

						L2Hub.PlayAnimate(Icon,SlowyTween,{
							TextTransparency = 1
						})

						L2Hub.PlayAnimate(Icon_3,SlowyTween,{
							TextTransparency = 1
						})

						L2Hub.PlayAnimate(Icon_2,SlowyTween,{
							TextTransparency = 1
						})

						L2Hub.PlayAnimate(BasedLabel,SlowyTween,{
							TextTransparency = 1
						})

						L2Hub.PlayAnimate(UIStroke,SlowyTween,{
							Transparency = 1
						})
					end;
				end)

				Render(ConfigSignal:GetValue());
				table.insert(ConfigLib.Signals , ConfigSignal:Connect(Render));

				table.insert(ConfigLib.Signals , ConfigItemFrame.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.25
					})
				end)));

				table.insert(ConfigLib.Signals , ConfigItemFrame.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(UIStroke,SlowyTween,{
						Transparency = 0.500
					})
				end)));

				local deleter,signal = L2Hub:CreateInput(DeleteConfig,function()
					if ConfigNameStr == "Default" then
						Logging.new("trash-can","You can't delete default config!",3.5)
						return;
					end;
					
					delfile(Window.ConfigFolder..'/'..ConfigNameStr);

					UpdateSize();

					ConfigLib:RefreshConfig();

					Logging.new("trash-can",'Deleted '..tostring(ConfigNameStr),3.5)
				end);

				local _,overwrite_signal = L2Hub:CreateInput(OverwriteConfig,function()
					if ConfigLib:WriteConfig(ConfigNameStr, true) then
						ConfigLib.SelectedConfig = ConfigNameStr;
						ConfigName.Text = ConfigNameStr;

						UpdateSize();
						ConfigLib:RefreshConfig();
					end;
				end);

				local _,load_signal = L2Hub:CreateInput(LoadConfig,function()
					local path = Window.ConfigFolder..'/'..ConfigNameStr;

					if isfile(path) then
						local data = readfile(path);

						ConfigLib:LoadData(data);

						ConfigLib.SelectedConfig = ConfigNameStr;
						ConfigName.Text = ConfigNameStr;

						UpdateSize();

						ConfigLib:RefreshConfig();

						Logging.new("folder",'Loaded '..tostring(ConfigNameStr),3.5)
					end
				end);

				table.insert(ConfigLib.Signals , signal);
				table.insert(ConfigLib.Signals , overwrite_signal);
				table.insert(ConfigLib.Signals , load_signal);

				table.insert(ConfigLib.Signals , deleter.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(Icon,SlowyTween,{
						TextTransparency = 0.2,
						TextColor3 = Color3.fromRGB(223, 125, 125)
					})
				end)))

				table.insert(ConfigLib.Signals , deleter.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(Icon,SlowyTween,{
						TextTransparency = 0.400,
						TextColor3 = Color3.fromRGB(223, 223, 223)
					})
				end)))

				table.insert(ConfigLib.Signals , OverwriteConfig.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(Icon_3,SlowyTween,{
						TextTransparency = 0.2,
						TextColor3 = L2Hub.AccentColor
					})
				end)))

				table.insert(ConfigLib.Signals , OverwriteConfig.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(Icon_3,SlowyTween,{
						TextTransparency = 0.400,
						TextColor3 = Color3.fromRGB(223, 223, 223)
					})
				end)))

				table.insert(ConfigLib.Signals , LoadConfig.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(Icon_2,SlowyTween,{
						TextTransparency = 0.2,
						TextColor3 = L2Hub.AccentColor
					})
				end)))

				table.insert(ConfigLib.Signals , LoadConfig.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
					L2Hub.PlayAnimate(Icon_2,SlowyTween,{
						TextTransparency = 0.400,
						TextColor3 = Color3.fromRGB(223, 223, 223)
					})
				end)))
			end;

			table.clear(ConfigList);
		end;
		
		task.delay(1,function()
			local ConfigNameStr = ConfigLib.SelectedConfig or "Default";
			local path = Window.ConfigFolder..'/'..ConfigNameStr;

			if Window.ConfigAutoLoad then
				if isfile(path) then
					local data = readfile(path);

					ConfigLib:LoadData(data);

					ConfigLib.SelectedConfig = ConfigNameStr;
					ConfigName.Text = ConfigNameStr;

					UpdateSize();

					ConfigLib:RefreshConfig();

					Logging.new("folder","Loaded "..tostring(ConfigNameStr),3.5);
				end;
			end;

			if not Window.ConfigSaveWindowState and not Window.Destroyed then
				Window.Signal:SetValue(true);
				Window:SetRender(true);

				if Window._MenuIcon then
					Window._MenuIcon:OnWindowToggle(true);
				end;
			end;

			if Window.ConfigAutoSave then
				task.spawn(function()
					while true do task.wait(5.75);
						local selected = ConfigLib.SelectedConfig or ConfigNameStr;
						local selectedPath = Window.ConfigFolder..'/'..selected;

						if Window.ConfigAutoSave and isfile(selectedPath) then
							writefile(selectedPath,ConfigLib:GetData(true));
						end;
					end;
				end);
			end;
		end);

		local hover_write = L2Hub:CreateInput(ConfigIcon,function()
			if ConfigLib:WriteConfig(ConfigLib.SelectedConfig or "Default", true) then
				ConfigLib:RefreshConfig();
			end;
		end);

		L2Hub:AddSignal(hover_write.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(ConfigIcon,SlowyTween,{
				TextTransparency = 0.1
			})
		end)));

		L2Hub:AddSignal(hover_write.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(ConfigIcon,SlowyTween,{
				TextTransparency = 0.25
			})
		end)));


		local mv = L2Hub:CreateInput(LoadConfig , function()
			local cfg_name = TextBox.Text;

			if cfg_name and cfg_name:byte() and not cfg_name:find('/',1,true) and not cfg_name:find('\\',1,true) then
				cfg_name = string.sub(cfg_name , 1 , 24);

				if ConfigLib:WriteConfig(cfg_name, Window.ConfigOverwrite) then
					TextBox.Text = "";
					ConfigLib:RefreshConfig();
				end;
			end;
		end);

		L2Hub:AddSignal(mv.MouseEnter:Connect(function()
			L2Hub.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.1
			})
		end))

		L2Hub:AddSignal(mv.MouseLeave:Connect(function()
			L2Hub.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.35
			})
		end))

		ConfigLib:RefreshConfig();

		OpenButton.MouseButton1Click:Connect(LPH_NO_VIRTUALIZE(function()
			if ConfigLib.UnsafeThread then
				ConfigLib.UnsafeThread:Disconnect();
				ConfigLib.UnsafeThread = nil;
			end;

			ConfigSignal:SetValue(true);

			ConfigLib.UnsafeThread = UserInputService.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					if not L2Hub:IsMouseOverFrame(ConfigMenu) then
						if ConfigLib.UnsafeThread then
							ConfigLib.UnsafeThread:Disconnect();
							ConfigLib.UnsafeThread = nil;
						end;

						ConfigSignal:SetValue(false);
					end;
				end;
			end)
		end));

		return ConfigLib;
	end;

	if Window.ConfigEnabled then
		Window.ConfigManager = Window:_InitConfig();
	else
		ConfigFrame.Visible = false;
	end;

	local UserSettings = L2Hub:CreateOptionWindow(BottomFrame , BottomFrame.ZIndex + 13);
	local reciveSignal;
	L2Hub:CreateInput(BottomFrame , LPH_NO_VIRTUALIZE(function()
		if reciveSignal then
			reciveSignal:Disconnect();
			reciveSignal = nil;	
		end;

		UserSettings.Signal:SetValue(true);

		reciveSignal = UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				if not L2Hub:IsMouseOverFrame(UserSettings.Root) and not L2Hub:IsMouseOverFrame(BottomFrame) and not L2Hub.IsMosueOverOtherFrame then
					if reciveSignal then
						reciveSignal:Disconnect();
						reciveSignal = nil;	
					end;

					UserSettings.Signal:SetValue(false);
				end
			end
		end);
	end))

	Window.UserSettings = UserSettings;

	if Window.ConfigEnabled and Window.ConfigShowAutoSaveToggle then
		UserSettings:AddLabel("Auto Save"):AddToggle({
			Default = Window.ConfigAutoSave,
			Callback = function(value)
				Window.ConfigAutoSave = value;
			end,
		});
	end;

			UserSettings:AddLabel("Menu Scale"):AddDropdown({
				Default = L2Hub.IsMobile and "Mobile" or "Large",
				Values = { "Large", "Default", "Mobile", "Small", "Compact" },
				Callback = function(value)
					if L2Hub.Scales[value] then
						Window:SetSize(L2Hub.Scales[value]);
						Logging.new("crop","Scale changed to "..tostring(value),5);
			end;
		end,
	});

	UserSettings:AddLabel("Text Gradient"):AddToggle({
		Default = L2Hub.TextGradientEnabled,
		Callback = function(value)
			L2Hub:SetTextGradientEnabled(value);
		end,
	});
	
	UserSettings:AddLabel("Lock Icon"):AddToggle({
		Default = Window.IconLocked,
		Callback = function(value)
			Window.IconLocked = value;
			if Window._MenuIcon then
				Window._MenuIcon:SetDraggable(not value);
			end
		end,
	});

	UserSettings:AddLabel("Hide Name"):AddToggle({
		Default = Window.HideName,
		Callback = function(value)
			Window.HideName = value;
			Window:SetAccount({
				Username = Window.RealUsername,
				Profile = Window.Profile,
				Expires = Window.Expires
			});
		end,
	});

	function Window:AddToggle(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = "Toggle",
			Default = false,
			Flag = nil,
			Callback = EmptyFunction,
		});

		return Window.UserSettings:AddLabel(Config.Name):AddToggle(Config);
	end;

	function Window:AddButton(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = "Button",
			Icon = "chevron-large-left",
			Callback = EmptyFunction,
			ToolTip = nil,
		});

		return Window.UserSettings:AddButton(Config);
	end;

	function Window:SetAccount(Config)
		Config = L2Hub:ProcessParams(Config , {
			Profile = L2Hub.UserProfile,
			Username = LocalPlayer.DisplayName,
			Expires = "Never",
		});

		Window.RealUsername = Config.Username or Window.RealUsername or LocalPlayer.DisplayName;
		local DisplayName = Window.HideName and (string.sub(Window.RealUsername, 1, 2) .. "*******") or Window.RealUsername;

		if not Window.ShowUser then
			AccountProfile.Image = "";
			AccountProfile.ImageTransparency = 0.050;
			AccountProfile.BackgroundColor3 = Color3.fromRGB(26, 28, 36);
			AccountProfile.BackgroundTransparency = 0.250;
			L2Hub:SetIconMode(AccountProfile, "gear");
			AccountProfile.ImageColor3 = L2Hub.AccentColor;
			AccountName.Text = "Settings";
			ExpireLabel.Text = "Customize menu";
			Window.Username = "Settings";
			Window.Profile = "";
			Window.Expires = "Customize menu";

			if Window.UserSettings.UserFrame then
				Window.UserSettings.UserFrame:SetUsername(Window.Username);
				Window.UserSettings.UserFrame:SetProfile(Window.Profile);
				Window.UserSettings.UserFrame:SetExpires(Window.Expires);
			else
				Window.UserSettings.UserFrame = UserSettings:AddUserFrame(Window.Username , Window.Profile , Window.Expires);
			end;

			return;
		end;

		AccountName.Text = DisplayName;
		AccountProfile.Image = Config.Profile;
		ExpireLabel.Text = Config.Expires;

		Window.Username = DisplayName;
		Window.Profile = Config.Profile or Window.Profile;
		Window.Expires = Config.Expires or Window.Expires;

		if Window.UserSettings.UserFrame then
			Window.UserSettings.UserFrame:SetUsername(Window.Username);
			Window.UserSettings.UserFrame:SetProfile(Window.Profile);
			Window.UserSettings.UserFrame:SetExpires(Window.Expires);
		else
			Window.UserSettings.UserFrame = UserSettings:AddUserFrame(Window.Username , Window.Profile , Window.Expires);
		end;
	end;

	function Window:SetSize(newsize)
		Window.Size = newsize;

		if Window.Signal:GetValue() then
			L2Hub.PlayAnimate(WindowFrame , VSlowTween , {
				Size = Window.Size
			})
		end
	end;

	function Window:SetConfigOverwrite(value)
		Window.ConfigOverwrite = value == true;
		return Window;
	end;

	function Window:SaveConfig(ConfigNameStr, Overwrite)
		if not Window.ConfigManager or not Window.ConfigManager.WriteConfig then
			return false;
		end;

		return Window.ConfigManager:WriteConfig(ConfigNameStr or Window.ConfigManager.SelectedConfig or "Default", Overwrite);
	end;

	function Window:LoadConfig(ConfigNameStr)
		if not Window.ConfigManager then
			return false;
		end;

		ConfigNameStr = tostring(ConfigNameStr or Window.ConfigManager.SelectedConfig or "Default");
		local path = Window.ConfigFolder..'/'..ConfigNameStr;

		if not isfile(path) then
			return false;
		end;

		Window.ConfigManager:LoadData(readfile(path));
		Window.ConfigManager.SelectedConfig = ConfigNameStr;
		ConfigName.Text = ConfigNameStr;

		return true;
	end;

	function Window:RewriteConfigAsJson()
		if not Window.ConfigManager or not Window.ConfigManager.RewriteSelectedAsJson then
			return false;
		end;

		return Window.ConfigManager:RewriteSelectedAsJson();
	end;

	function Window:OnDestroy(fn)
		if type(fn) == "function" then
			table.insert(Window.OnDestroyCallbacks, fn);
		end;

		return Window;
	end;

	function Window:SafeCallback(fn, Context, ...)
		return L2Hub:FireCallback(fn, Context, ...);
	end;

	function Window:InputDialog(Config)
		Config = L2Hub:ProcessParams(Config , {
			Title = "Input",
			Content = "",
			Name = "Value",
			Placeholder = "",
			Default = "",
			Inputs = nil,
			ConfirmText = "Confirm",
			CancelText = "Cancel",
			Callback = EmptyFunction,
		});

		local Inputs = Config.Inputs;

		if typeof(Inputs) ~= "table" then
			Inputs = {
				{
					Name = Config.Name,
					Placeholder = Config.Placeholder,
					Default = Config.Default,
					Numeric = Config.Numeric,
				},
			};
		end;

		local Dialog = {
			Closed = false,
			Values = {},
			Boxes = {},
		};

		local Overlay = Instance.new("Frame")
		local Panel = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Title = Instance.new("TextLabel")
		local Content = Instance.new("TextLabel")
		local InputHolder = Instance.new("Frame")
		local InputLayout = Instance.new("UIListLayout")
		local ButtonHolder = Instance.new("Frame")
		local ButtonLayout = Instance.new("UIListLayout")
		local Shadow = L2Hub:CreateShadow(Panel);

		local PanelHeight = 148 + (#Inputs * 42);

		Overlay.Name = L2Hub.RandomString();
		Overlay.Parent = WindowFrame
		Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Overlay.BackgroundTransparency = 1
		Overlay.BorderSizePixel = 0
		Overlay.Size = UDim2.fromScale(1, 1)
		Overlay.ZIndex = 190
		Overlay.Active = true

		Panel.Name = L2Hub.RandomString();
		Panel.Parent = Overlay
		Panel.AnchorPoint = Vector2.new(0.5, 0.5)
		Panel.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		Panel.BackgroundTransparency = 1
		Panel.BorderSizePixel = 0
		Panel.ClipsDescendants = true
		Panel.Position = UDim2.fromScale(0.5, 0.5)
		Panel.Size = UDim2.new(0, 345, 0, PanelHeight - 15)
		Panel.ZIndex = 191

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = Panel

		UIStroke.Transparency = 1
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Panel

		Title.Name = L2Hub.RandomString();
		Title.Parent = Panel
		Title.BackgroundTransparency = 1
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0, 18, 0, 15)
		Title.Size = UDim2.new(1, -36, 0, 20)
		Title.ZIndex = 192
		Title.Font = Enum.Font.GothamBold
		Title.Text = Config.Title
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 15
		Title.TextTransparency = 1
		Title.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(Title);

		Content.Name = L2Hub.RandomString();
		Content.Parent = Panel
		Content.BackgroundTransparency = 1
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 18, 0, 43)
		Content.Size = UDim2.new(1, -36, 0, Config.Content == "" and 0 or 34)
		Content.ZIndex = 192
		Content.Font = Enum.Font.GothamBold
		Content.Text = Config.Content
		Content.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content.TextSize = 13
		Content.TextTransparency = 1
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top

		InputHolder.Name = L2Hub.RandomString();
		InputHolder.Parent = Panel
		InputHolder.BackgroundTransparency = 1
		InputHolder.BorderSizePixel = 0
		InputHolder.Position = UDim2.new(0, 18, 0, Config.Content == "" and 48 or 82)
		InputHolder.Size = UDim2.new(1, -36, 0, #Inputs * 42)
		InputHolder.ZIndex = 192

		InputLayout.Parent = InputHolder
		InputLayout.SortOrder = Enum.SortOrder.LayoutOrder
		InputLayout.Padding = UDim.new(0, 8)

		local function ReadValues()
			local Values = {};

			for Index,Box in ipairs(Dialog.Boxes) do
				local InputConfig = Inputs[Index] or {};
				local Key = InputConfig.Flag or InputConfig.Key or InputConfig.Name or tostring(Index);
				Values[Key] = Box.Text;
			end;

			Dialog.Values = Values;

			if #Dialog.Boxes == 1 then
				return Dialog.Boxes[1].Text, Values;
			end;

			return Values;
		end;

		for Index,InputConfig in ipairs(Inputs) do
			if typeof(InputConfig) ~= "table" then
				InputConfig = {
					Name = tostring(InputConfig or "Value"),
				};
				Inputs[Index] = InputConfig;
			end;

			InputConfig = L2Hub:ProcessParams(InputConfig , {
				Name = "Value",
				Placeholder = "",
				Default = "",
				Numeric = false,
			});

			local Row = Instance.new("Frame")
			local Label = Instance.new("TextLabel")
			local BoxFrame = Instance.new("Frame")
			local BoxCorner = Instance.new("UICorner")
			local BoxStroke = Instance.new("UIStroke")
			local Box = Instance.new("TextBox")

			Row.Name = L2Hub.RandomString();
			Row.Parent = InputHolder
			Row.BackgroundTransparency = 1
			Row.BorderSizePixel = 0
			Row.Size = UDim2.new(1, 0, 0, 34)
			Row.ZIndex = 192
			Row.LayoutOrder = Index

			Label.Name = L2Hub.RandomString();
			Label.Parent = Row
			Label.BackgroundTransparency = 1
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0, 0, 0, 0)
			Label.Size = UDim2.new(0.42, -6, 1, 0)
			Label.ZIndex = 193
			Label.Font = Enum.Font.GothamBold
			Label.Text = tostring(InputConfig.Name)
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 12
			Label.TextTransparency = 1
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Label.TextTruncate = Enum.TextTruncate.AtEnd

			BoxFrame.Name = L2Hub.RandomString();
			BoxFrame.Parent = Row
			BoxFrame.AnchorPoint = Vector2.new(1, 0.5)
			BoxFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 22)
			BoxFrame.BackgroundTransparency = 1
			BoxFrame.BorderSizePixel = 0
			BoxFrame.Position = UDim2.new(1, 0, 0.5, 0)
			BoxFrame.Size = UDim2.new(0.58, 0, 0, 30)
			BoxFrame.ZIndex = 193

			BoxCorner.CornerRadius = UDim.new(0, 5)
			BoxCorner.Parent = BoxFrame

			BoxStroke.Color = Color3.fromRGB(45, 48, 58)
			BoxStroke.Transparency = 1
			BoxStroke.Parent = BoxFrame

			Box.Name = L2Hub.RandomString();
			Box.Parent = BoxFrame
			Box.BackgroundTransparency = 1
			Box.BorderSizePixel = 0
			Box.ClearTextOnFocus = false
			Box.Position = UDim2.new(0, 8, 0, 0)
			Box.Size = UDim2.new(1, -16, 1, 0)
			Box.ZIndex = 194
			Box.Font = Enum.Font.GothamBold
			Box.Text = tostring(InputConfig.Default or "")
			Box.PlaceholderText = tostring(InputConfig.Placeholder or "")
			Box.TextColor3 = Color3.fromRGB(255, 255, 255)
			Box.PlaceholderColor3 = Color3.fromRGB(140, 140, 155)
			Box.TextSize = 12
			Box.TextTransparency = 1
			Box.TextXAlignment = Enum.TextXAlignment.Left

			if InputConfig.Numeric then
				L2Hub:AddSignal(Box:GetPropertyChangedSignal("Text"):Connect(function()
					Box.Text = Box.Text:gsub("[^%d%.%-]", "");
				end))
			end;

			table.insert(Dialog.Boxes, Box);

			L2Hub.PlayAnimate(Label, SlowyTween, { TextTransparency = 0.250 })
			L2Hub.PlayAnimate(BoxFrame, SlowyTween, { BackgroundTransparency = 0.150 })
			L2Hub.PlayAnimate(BoxStroke, SlowyTween, { Transparency = 0.700 })
			L2Hub.PlayAnimate(Box, SlowyTween, { TextTransparency = 0.150 })
		end;

		ButtonHolder.Name = L2Hub.RandomString();
		ButtonHolder.Parent = Panel
		ButtonHolder.AnchorPoint = Vector2.new(1, 1)
		ButtonHolder.BackgroundTransparency = 1
		ButtonHolder.BorderSizePixel = 0
		ButtonHolder.Position = UDim2.new(1, -14, 1, -14)
		ButtonHolder.Size = UDim2.new(1, -28, 0, 30)
		ButtonHolder.ZIndex = 192

		ButtonLayout.Parent = ButtonHolder
		ButtonLayout.FillDirection = Enum.FillDirection.Horizontal
		ButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ButtonLayout.Padding = UDim.new(0, 8)

		function Dialog:Close(Result)
			if Dialog.Closed then
				return Result;
			end;

			Dialog.Closed = true;

			L2Hub.PlayAnimate(Overlay, SlowyTween, { BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(Panel, SlowyTween, { BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(UIStroke, SlowyTween, { Transparency = 1 })
			L2Hub.PlayAnimate(Title, SlowyTween, { TextTransparency = 1 })
			L2Hub.PlayAnimate(Content, SlowyTween, { TextTransparency = 1 })
			Shadow:Render(false);

			task.delay(0.18, function()
				if Overlay.Parent then
					Overlay:Destroy();
				end;
			end);

			L2Hub:FireCallback(Config.Callback, Config.Title, Result, Dialog.Values);

			return Result;
		end;

		local function AddDialogButton(Text, Primary, Callback)
			local Button = Instance.new("Frame")
			local ButtonCorner = Instance.new("UICorner")
			local ButtonStroke = Instance.new("UIStroke")
			local ButtonLabel = Instance.new("TextLabel")

			Button.Name = L2Hub.RandomString();
			Button.Parent = ButtonHolder
			Button.BackgroundColor3 = Primary and L2Hub.AccentColor or Color3.fromRGB(26, 28, 36)
			Button.BackgroundTransparency = 1
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Size = UDim2.new(0, math.max(78, TextService:GetTextSize(tostring(Text), 12, Enum.Font.GothamBold, Vector2.new(math.huge, math.huge)).X + 28), 0, 28)
			Button.ZIndex = 193

			ButtonCorner.CornerRadius = UDim.new(0, 5)
			ButtonCorner.Parent = Button

			ButtonStroke.Transparency = 1
			ButtonStroke.Color = Primary and L2Hub.AccentColor or Color3.fromRGB(45, 48, 58)
			ButtonStroke.Parent = Button

			ButtonLabel.Name = L2Hub.RandomString();
			ButtonLabel.Parent = Button
			ButtonLabel.BackgroundTransparency = 1
			ButtonLabel.BorderSizePixel = 0
			ButtonLabel.Size = UDim2.fromScale(1, 1)
			ButtonLabel.ZIndex = 194
			ButtonLabel.Font = Enum.Font.GothamBold
			ButtonLabel.Text = Text
			ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonLabel.TextSize = 12
			ButtonLabel.TextTransparency = 1

			local Input = L2Hub:CreateInput(Button, Callback);

			L2Hub:AddSignal(Input.MouseEnter:Connect(function()
				L2Hub.PlayAnimate(Button, SlowyTween, { BackgroundTransparency = Primary and 0 or 0.100 })
			end))

			L2Hub:AddSignal(Input.MouseLeave:Connect(function()
				L2Hub.PlayAnimate(Button, SlowyTween, { BackgroundTransparency = Primary and 0.100 or 0.250 })
			end))

			L2Hub.PlayAnimate(Button, SlowyTween, { BackgroundTransparency = Primary and 0.100 or 0.250 })
			L2Hub.PlayAnimate(ButtonStroke, SlowyTween, { Transparency = Primary and 1 or 0.650 })
			L2Hub.PlayAnimate(ButtonLabel, SlowyTween, { TextTransparency = 0 })
		end;

		AddDialogButton(Config.CancelText, false, function()
			Dialog:Close(nil);
		end);

		AddDialogButton(Config.ConfirmText, true, function()
			Dialog:Close(ReadValues());
		end);

		L2Hub.PlayAnimate(Overlay, SlowyTween, { BackgroundTransparency = 0.350 })
		L2Hub.PlayAnimate(Panel, VSlowTween, { BackgroundTransparency = 0.035, Size = UDim2.new(0, 360, 0, PanelHeight) })
		L2Hub.PlayAnimate(UIStroke, SlowyTween, { Transparency = 0.650 })
		L2Hub.PlayAnimate(Title, SlowyTween, { TextTransparency = 0 })
		L2Hub.PlayAnimate(Content, SlowyTween, { TextTransparency = 0.250 })
		Shadow:Render(false);

		task.defer(function()
			if Dialog.Boxes[1] then
				Dialog.Boxes[1]:CaptureFocus();
			end;
		end);

		function Dialog:GetValue()
			return ReadValues();
		end;

		function Dialog:SetValue(Value, Key)
			if Key == nil and Dialog.Boxes[1] then
				Dialog.Boxes[1].Text = tostring(Value or "");
				return Dialog;
			end;

			for Index,InputConfig in ipairs(Inputs) do
				local Name = InputConfig.Flag or InputConfig.Key or InputConfig.Name or tostring(Index);
				if tostring(Name) == tostring(Key) and Dialog.Boxes[Index] then
					Dialog.Boxes[Index].Text = tostring(Value or "");
				end;
			end;

			return Dialog;
		end;

		return CaseInsensitive(Dialog);
	end;

	function Window:Dialog(Config)
		Config = L2Hub:ProcessParams(Config , {
			Title = "Dialog",
			Content = "",
			Icon = "lucide:message-square",
			Buttons = {},
			Callback = EmptyFunction,
		});

		local Dialog = {
			Closed = false,
		};

		local Overlay = Instance.new("Frame")
		local Panel = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local AccentBar = Instance.new("Frame")
		local AccentCorner = Instance.new("UICorner")
		local IconHolder = Instance.new("Frame")
		local IconCorner = Instance.new("UICorner")
		local IconStroke = Instance.new("UIStroke")
		local DialogIcon = Instance.new("ImageLabel")
		local Title = Instance.new("TextLabel")
		local Content = Instance.new("TextLabel")
		local Divider = Instance.new("Frame")
		local ButtonHolder = Instance.new("Frame")
		local ButtonLayout = Instance.new("UIListLayout")
		local ContentHeight = math.clamp(TextService:GetTextSize(tostring(Config.Content or ""), 13, Enum.Font.GothamBold, Vector2.new(310, math.huge)).Y + 4, 38, 76);
		local PanelHeight = math.max(188, 132 + ContentHeight);
		local PanelClosedSize = UDim2.new(0, 365, 0, PanelHeight - 18);
		local PanelOpenSize = UDim2.new(0, 392, 0, PanelHeight);

		Overlay.Name = L2Hub.RandomString();
		Overlay.Parent = WindowFrame
		Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Overlay.BackgroundTransparency = 1
		Overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Overlay.BorderSizePixel = 0
		Overlay.Size = UDim2.fromScale(1, 1)
		Overlay.ZIndex = 180
		Overlay.Active = true

		Panel.Name = L2Hub.RandomString();
		Panel.Parent = Overlay
		Panel.AnchorPoint = Vector2.new(0.5, 0.5)
		Panel.BackgroundColor3 = Color3.fromRGB(13, 17, 22)
		Panel.BackgroundTransparency = 1
		Panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Panel.BorderSizePixel = 0
		Panel.ClipsDescendants = true
		Panel.Position = UDim2.fromScale(0.5, 0.5)
		Panel.Size = PanelClosedSize
		Panel.ZIndex = 181

		UICorner.CornerRadius = UDim.new(0, 12)
		UICorner.Parent = Panel

		UIStroke.Transparency = 1
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Panel

		local Shadow = L2Hub:CreateShadow(Panel);

		AccentBar.Name = L2Hub.RandomString();
		AccentBar.Parent = Panel
		AccentBar.BackgroundColor3 = L2Hub.AccentColor
		AccentBar.BackgroundTransparency = 1
		AccentBar.BorderSizePixel = 0
		AccentBar.Position = UDim2.fromOffset(0, 0)
		AccentBar.Size = UDim2.new(1, 0, 0, 3)
		AccentBar.ZIndex = 182

		AccentCorner.CornerRadius = UDim.new(0, 12)
		AccentCorner.Parent = AccentBar

		IconHolder.Name = L2Hub.RandomString();
		IconHolder.Parent = Panel
		IconHolder.BackgroundColor3 = L2Hub.AccentColor
		IconHolder.BackgroundTransparency = 1
		IconHolder.BorderSizePixel = 0
		IconHolder.Position = UDim2.fromOffset(18, 18)
		IconHolder.Size = UDim2.fromOffset(34, 34)
		IconHolder.ZIndex = 182

		IconCorner.CornerRadius = UDim.new(0, 8)
		IconCorner.Parent = IconHolder

		IconStroke.Color = L2Hub.AccentColor
		IconStroke.Transparency = 1
		IconStroke.Parent = IconHolder

		DialogIcon.Name = L2Hub.RandomString();
		DialogIcon.Parent = IconHolder
		DialogIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		DialogIcon.BackgroundTransparency = 1
		DialogIcon.BorderSizePixel = 0
		DialogIcon.Position = UDim2.fromScale(0.5, 0.5)
		DialogIcon.Size = UDim2.fromOffset(18, 18)
		DialogIcon.ZIndex = 183
		DialogIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
		DialogIcon.ImageTransparency = 1
		L2Hub:SetIconMode(DialogIcon, Config.Icon)

		Title.Name = L2Hub.RandomString();
		Title.Parent = Panel
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0, 64, 0, 18)
		Title.Size = UDim2.new(1, -82, 0, 21)
		Title.ZIndex = 183
		Title.Font = Enum.Font.GothamBold
		Title.Text = Config.Title
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 16
		Title.TextTransparency = 1
		Title.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(Title);

		Content.Name = L2Hub.RandomString();
		Content.Parent = Panel
		Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content.BackgroundTransparency = 1
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 64, 0, 43)
		Content.Size = UDim2.new(1, -82, 0, ContentHeight)
		Content.ZIndex = 183
		Content.Font = Enum.Font.GothamBold
		Content.Text = Config.Content
		Content.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content.TextSize = 13
		Content.TextTransparency = 1
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top

		Divider.Name = L2Hub.RandomString();
		Divider.Parent = Panel
		Divider.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
		Divider.BackgroundTransparency = 1
		Divider.BorderSizePixel = 0
		Divider.Position = UDim2.new(0, 14, 1, -54)
		Divider.Size = UDim2.new(1, -28, 0, 1)
		Divider.ZIndex = 182

		ButtonHolder.Name = L2Hub.RandomString();
		ButtonHolder.Parent = Panel
		ButtonHolder.AnchorPoint = Vector2.new(1, 1)
		ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ButtonHolder.BackgroundTransparency = 1
		ButtonHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ButtonHolder.BorderSizePixel = 0
		ButtonHolder.Position = UDim2.new(1, -16, 1, -14)
		ButtonHolder.Size = UDim2.new(1, -32, 0, 32)
		ButtonHolder.ZIndex = 182

		ButtonLayout.Parent = ButtonHolder
		ButtonLayout.FillDirection = Enum.FillDirection.Horizontal
		ButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ButtonLayout.Padding = UDim.new(0, 8)

		function Dialog:Close(Result)
			if Dialog.Closed then
				return Result;
			end;

			Dialog.Closed = true;

			L2Hub.PlayAnimate(Overlay,SlowyTween,{
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(Panel,SlowyTween,{
				BackgroundTransparency = 1,
				Size = PanelClosedSize
			})

			L2Hub.PlayAnimate(UIStroke,SlowyTween,{
				Transparency = 1
			})

			L2Hub.PlayAnimate(AccentBar,SlowyTween,{
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(IconHolder,SlowyTween,{
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(IconStroke,SlowyTween,{
				Transparency = 1
			})

			L2Hub.PlayAnimate(DialogIcon,SlowyTween,{
				ImageTransparency = 1
			})

			L2Hub.PlayAnimate(Title,SlowyTween,{
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(Content,SlowyTween,{
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(Divider,SlowyTween,{
				BackgroundTransparency = 1
			})

			Shadow:Render(false);

			task.delay(0.18,function()
				Overlay:Destroy();
			end);

			L2Hub:FireCallback(Config.Callback, Config.Title, Result);

			return Result;
		end;

		if #Config.Buttons <= 0 then
			Config.Buttons = {
				{
					Text = "OK",
					Primary = true,
				},
			};
		end;

		for Index,ButtonConfig in ipairs(Config.Buttons) do
			ButtonConfig = L2Hub:ProcessParams(ButtonConfig , {
				Text = "Button",
				Primary = false,
				Callback = EmptyFunction,
			});

			local Button = Instance.new("Frame")
			local ButtonCorner = Instance.new("UICorner")
			local ButtonStroke = Instance.new("UIStroke")
			local ButtonLabel = Instance.new("TextLabel")

			Button.Name = L2Hub.RandomString();
			Button.Parent = ButtonHolder
			Button.BackgroundColor3 = ButtonConfig.Primary and L2Hub.AccentColor or Color3.fromRGB(26, 28, 36)
			Button.BackgroundTransparency = 1
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Size = UDim2.new(0, math.max(78, TextService:GetTextSize(tostring(ButtonConfig.Text), 12, Enum.Font.GothamBold, Vector2.new(math.huge, math.huge)).X + 32), 0, 32)
			Button.ZIndex = 183
			Button.LayoutOrder = Index

			ButtonCorner.CornerRadius = UDim.new(0, 7)
			ButtonCorner.Parent = Button

			ButtonStroke.Transparency = 1
			ButtonStroke.Color = ButtonConfig.Primary and L2Hub.AccentColor or Color3.fromRGB(45, 48, 58)
			ButtonStroke.Parent = Button

			ButtonLabel.Name = L2Hub.RandomString();
			ButtonLabel.Parent = Button
			ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonLabel.BackgroundTransparency = 1
			ButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonLabel.BorderSizePixel = 0
			ButtonLabel.Size = UDim2.fromScale(1, 1)
			ButtonLabel.ZIndex = 184
			ButtonLabel.Font = ButtonConfig.Primary and Enum.Font.GothamBold or Enum.Font.GothamBold
			ButtonLabel.Text = ButtonConfig.Text
			ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonLabel.TextSize = 12
			ButtonLabel.TextTransparency = 1

			local Input = L2Hub:CreateInput(Button , LPH_NO_VIRTUALIZE(function()
				local Result = ButtonConfig.ReturnValue;

				if Result == nil then
					Result = ButtonConfig.Text;
				end;

				L2Hub:FireCallback(ButtonConfig.Callback, ButtonConfig.Text, Result);
				Dialog:Close(Result);
			end));

			L2Hub:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
				L2Hub.PlayAnimate(Button,SlowyTween,{
					BackgroundTransparency = ButtonConfig.Primary and 0 or 0.080
				})
			end)))

			L2Hub:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
				L2Hub.PlayAnimate(Button,SlowyTween,{
					BackgroundTransparency = ButtonConfig.Primary and 0.100 or 0.250
				})
			end)))

			L2Hub.PlayAnimate(Button,SlowyTween,{
				BackgroundTransparency = ButtonConfig.Primary and 0.100 or 0.250
			})

			L2Hub.PlayAnimate(ButtonStroke,SlowyTween,{
				Transparency = ButtonConfig.Primary and 1 or 0.650
			})

			L2Hub.PlayAnimate(ButtonLabel,SlowyTween,{
				TextTransparency = 0
			})
		end;

		L2Hub.PlayAnimate(Overlay,SlowyTween,{
			BackgroundTransparency = 0.280
		})

		L2Hub.PlayAnimate(Panel,VSlowTween,{
			BackgroundTransparency = 0.025,
			Size = PanelOpenSize
		})

		L2Hub.PlayAnimate(UIStroke,SlowyTween,{
			Transparency = 0.650
		})

		L2Hub.PlayAnimate(AccentBar,SlowyTween,{
			BackgroundTransparency = 0
		})

		L2Hub.PlayAnimate(IconHolder,SlowyTween,{
			BackgroundTransparency = 0.820
		})

		L2Hub.PlayAnimate(IconStroke,SlowyTween,{
			Transparency = 0.350
		})

		L2Hub.PlayAnimate(DialogIcon,SlowyTween,{
			ImageTransparency = 0
		})

		L2Hub.PlayAnimate(Title,SlowyTween,{
			TextTransparency = 0
		})

		L2Hub.PlayAnimate(Content,SlowyTween,{
			TextTransparency = 0.250
		})

		L2Hub.PlayAnimate(Divider,SlowyTween,{
			BackgroundTransparency = 0.720
		})

		Shadow:Render(false);

		return CaseInsensitive(Dialog);
	end;

	function Window:ProgressDialog(Config)
		Config = L2Hub:ProcessParams(Config , {
			Title = "Progress",
			Content = "",
			Value = 0,
			Max = 100,
			Type = "%",
			Cancelable = false,
			CancelText = "Cancel",
			AutoClose = false,
			Callback = EmptyFunction,
		});

		local Dialog = {
			Closed = false,
		};

		local Overlay = Instance.new("Frame")
		local Panel = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Title = Instance.new("TextLabel")
		local Content = Instance.new("TextLabel")
		local ValueLabel = Instance.new("TextLabel")
		local BarBack = Instance.new("Frame")
		local BarBackCorner = Instance.new("UICorner")
		local BarFill = Instance.new("Frame")
		local BarFillCorner = Instance.new("UICorner")
		local CancelButton = Instance.new("Frame")
		local CancelCorner = Instance.new("UICorner")
		local CancelStroke = Instance.new("UIStroke")
		local CancelLabel = Instance.new("TextLabel")

		Overlay.Name = L2Hub.RandomString();
		Overlay.Parent = WindowFrame
		Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Overlay.BackgroundTransparency = 1
		Overlay.BorderSizePixel = 0
		Overlay.Size = UDim2.fromScale(1, 1)
		Overlay.ZIndex = 180
		Overlay.Active = true

		Panel.Name = L2Hub.RandomString();
		Panel.Parent = Overlay
		Panel.AnchorPoint = Vector2.new(0.5, 0.5)
		Panel.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		Panel.BackgroundTransparency = 1
		Panel.BorderSizePixel = 0
		Panel.ClipsDescendants = true
		Panel.Position = UDim2.fromScale(0.5, 0.5)
		Panel.Size = UDim2.new(0, 335, 0, Config.Cancelable and 150 or 125)
		Panel.ZIndex = 181

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = Panel

		UIStroke.Transparency = 1
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = Panel

		local Shadow = L2Hub:CreateShadow(Panel);

		Title.Name = L2Hub.RandomString();
		Title.Parent = Panel
		Title.BackgroundTransparency = 1
		Title.BorderSizePixel = 0
		Title.Position = UDim2.new(0, 18, 0, 15)
		Title.Size = UDim2.new(1, -36, 0, 20)
		Title.ZIndex = 182
		Title.Font = Enum.Font.GothamBold
		Title.Text = tostring(Config.Title)
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 15
		Title.TextTransparency = 1
		Title.TextXAlignment = Enum.TextXAlignment.Left
		L2Hub:AddTextGradient(Title);

		Content.Name = L2Hub.RandomString();
		Content.Parent = Panel
		Content.BackgroundTransparency = 1
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 18, 0, 43)
		Content.Size = UDim2.new(1, -36, 0, 32)
		Content.ZIndex = 182
		Content.Font = Enum.Font.GothamBold
		Content.Text = tostring(Config.Content)
		Content.TextColor3 = Color3.fromRGB(255, 255, 255)
		Content.TextSize = 13
		Content.TextTransparency = 1
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top

		ValueLabel.Name = L2Hub.RandomString();
		ValueLabel.Parent = Panel
		ValueLabel.BackgroundTransparency = 1
		ValueLabel.BorderSizePixel = 0
		ValueLabel.Position = UDim2.new(1, -88, 0, 80)
		ValueLabel.Size = UDim2.new(0, 70, 0, 16)
		ValueLabel.ZIndex = 182
		ValueLabel.Font = Enum.Font.GothamBold
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 12
		ValueLabel.TextTransparency = 1
		ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

		BarBack.Name = L2Hub.RandomString();
		BarBack.Parent = Panel
		BarBack.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		BarBack.BackgroundTransparency = 1
		BarBack.BorderSizePixel = 0
		BarBack.Position = UDim2.new(0, 18, 0, 84)
		BarBack.Size = UDim2.new(1, -112, 0, 9)
		BarBack.ZIndex = 182

		BarBackCorner.CornerRadius = UDim.new(1, 0)
		BarBackCorner.Parent = BarBack

		BarFill.Name = L2Hub.RandomString();
		BarFill.Parent = BarBack
		BarFill.BackgroundColor3 = L2Hub.AccentColor
		BarFill.BackgroundTransparency = 1
		BarFill.BorderSizePixel = 0
		BarFill.Size = UDim2.fromScale(0, 1)
		BarFill.ZIndex = 183

		BarFillCorner.CornerRadius = UDim.new(1, 0)
		BarFillCorner.Parent = BarFill

		CancelButton.Name = L2Hub.RandomString();
		CancelButton.Parent = Panel
		CancelButton.AnchorPoint = Vector2.new(1, 1)
		CancelButton.BackgroundColor3 = Color3.fromRGB(26, 28, 36)
		CancelButton.BackgroundTransparency = 1
		CancelButton.BorderSizePixel = 0
		CancelButton.ClipsDescendants = true
		CancelButton.Position = UDim2.new(1, -14, 1, -14)
		CancelButton.Size = UDim2.new(0, 86, 0, 28)
		CancelButton.Visible = Config.Cancelable == true
		CancelButton.ZIndex = 182

		CancelCorner.CornerRadius = UDim.new(0, 5)
		CancelCorner.Parent = CancelButton

		CancelStroke.Transparency = 1
		CancelStroke.Color = Color3.fromRGB(45, 48, 58)
		CancelStroke.Parent = CancelButton

		CancelLabel.Name = L2Hub.RandomString();
		CancelLabel.Parent = CancelButton
		CancelLabel.BackgroundTransparency = 1
		CancelLabel.BorderSizePixel = 0
		CancelLabel.Size = UDim2.fromScale(1, 1)
		CancelLabel.ZIndex = 183
		CancelLabel.Font = Enum.Font.GothamBold
		CancelLabel.Text = tostring(Config.CancelText)
		CancelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		CancelLabel.TextSize = 12
		CancelLabel.TextTransparency = 1

		local function UpdateProgress()
			local MaxValue = math.max(tonumber(Config.Max) or 1, 0.0001);
			local Value = math.clamp(tonumber(Config.Value) or 0, 0, MaxValue);
			local Percent = Value / MaxValue;

			if Config.Type == "%" then
				ValueLabel.Text = tostring(L2Hub.Rounding(Percent * 100, 0)).."%";
			else
				ValueLabel.Text = tostring(L2Hub.Rounding(Value, 2)).."/"..tostring(L2Hub.Rounding(MaxValue, 2))..tostring(Config.Type or "");
			end;

			L2Hub.PlayAnimate(BarFill, SlowyTween, {
				Size = UDim2.fromScale(Percent, 1),
				BackgroundColor3 = L2Hub.AccentColor
			});
		end;

		function Dialog:Close(Result)
			if Dialog.Closed then
				return Result;
			end;

			Dialog.Closed = true;

			L2Hub.PlayAnimate(Overlay,SlowyTween,{ BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(Panel,SlowyTween,{
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 335, 0, Config.Cancelable and 150 or 125)
			})
			L2Hub.PlayAnimate(UIStroke,SlowyTween,{ Transparency = 1 })
			L2Hub.PlayAnimate(Title,SlowyTween,{ TextTransparency = 1 })
			L2Hub.PlayAnimate(Content,SlowyTween,{ TextTransparency = 1 })
			L2Hub.PlayAnimate(ValueLabel,SlowyTween,{ TextTransparency = 1 })
			L2Hub.PlayAnimate(BarBack,SlowyTween,{ BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(BarFill,SlowyTween,{ BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(CancelButton,SlowyTween,{ BackgroundTransparency = 1 })
			L2Hub.PlayAnimate(CancelStroke,SlowyTween,{ Transparency = 1 })
			L2Hub.PlayAnimate(CancelLabel,SlowyTween,{ TextTransparency = 1 })
			Shadow:Render(false);

			task.delay(0.18,function()
				Overlay:Destroy();
			end);

			L2Hub:FireCallback(Config.Callback, Config.Title, Result);
			return Result;
		end;

		function Dialog:SetValue(value)
			Config.Value = tonumber(value) or Config.Value;
			UpdateProgress();

			if Config.AutoClose == true and (tonumber(Config.Value) or 0) >= (tonumber(Config.Max) or 100) then
				Dialog:Close(true);
			end;

			return Dialog;
		end;

		function Dialog:SetMax(max)
			Config.Max = tonumber(max) or Config.Max;
			UpdateProgress();
			return Dialog;
		end;

		function Dialog:SetContent(text)
			Config.Content = tostring(text or "");
			Content.Text = Config.Content;
			return Dialog;
		end;

		function Dialog:SetTitle(text)
			Config.Title = tostring(text or "");
			Title.Text = Config.Title;
			return Dialog;
		end;

		function Dialog:SetType(text)
			Config.Type = tostring(text or "");
			UpdateProgress();
			return Dialog;
		end;

		function Dialog:GetValue()
			return Config.Value;
		end;

		if Config.Cancelable then
			local Input = L2Hub:CreateInput(CancelButton , LPH_NO_VIRTUALIZE(function()
				Dialog:Close(false);
			end));

			L2Hub:AddSignal(Input.MouseEnter:Connect(LPH_NO_VIRTUALIZE(function()
				L2Hub.PlayAnimate(CancelButton,SlowyTween,{ BackgroundTransparency = 0.100 })
			end)))

			L2Hub:AddSignal(Input.MouseLeave:Connect(LPH_NO_VIRTUALIZE(function()
				L2Hub.PlayAnimate(CancelButton,SlowyTween,{ BackgroundTransparency = 0.250 })
			end)))
		end;

		UpdateProgress();

		L2Hub.PlayAnimate(Overlay,SlowyTween,{ BackgroundTransparency = 0.350 })
		L2Hub.PlayAnimate(Panel,VSlowTween,{
			BackgroundTransparency = 0.035,
			Size = UDim2.new(0, 350, 0, Config.Cancelable and 165 or 140)
		})
		L2Hub.PlayAnimate(UIStroke,SlowyTween,{ Transparency = 0.650 })
		L2Hub.PlayAnimate(Title,SlowyTween,{ TextTransparency = 0 })
		L2Hub.PlayAnimate(Content,SlowyTween,{ TextTransparency = 0.250 })
		L2Hub.PlayAnimate(ValueLabel,SlowyTween,{ TextTransparency = 0.500 })
		L2Hub.PlayAnimate(BarBack,SlowyTween,{ BackgroundTransparency = 0 })
		L2Hub.PlayAnimate(BarFill,SlowyTween,{ BackgroundTransparency = 0 })

		if Config.Cancelable then
			L2Hub.PlayAnimate(CancelButton,SlowyTween,{ BackgroundTransparency = 0.250 })
			L2Hub.PlayAnimate(CancelStroke,SlowyTween,{ Transparency = 0.650 })
			L2Hub.PlayAnimate(CancelLabel,SlowyTween,{ TextTransparency = 0 })
		end;

		Shadow:Render(false);

		return CaseInsensitive(Dialog);
	end;

	Window:SetAccount();

	L2Hub:AddSignal(UserInputService.InputBegan:Connect(LPH_NO_VIRTUALIZE(function(value,ISTYPING)
		if value.KeyCode == Window.Keybind or value.KeyCode.Name == Window.Keybind then
			if not ISTYPING then
				Window:ToggleInterface()
			end
		end;
	end)));

	function Window:ToggleInterface()
		if Window.Destroyed then
			return;
		end;

		Window.Signal:SetValue(not Window.Signal:GetValue());

		if Window.__3DRender then
			Window.Load3DBlock();
		end;
	end;

	function Window:SetFont(FontConfig)
		Window.Font = FontConfig;
		return L2Hub:SetFont(FontConfig);
	end;

	function Window:Destroy()
		if Window.Destroyed then
			return;
		end;

		Window.Destroyed = true;
		Window.Signal:SetValue(false);

		for _,Callback in ipairs(Window.OnDestroyCallbacks) do
			L2Hub:FireCallback(Callback, "OnDestroy", Window);
		end;

		if L2Hub.ActiveWindow == Window then
			L2Hub.ActiveWindow = nil;
		end;

		task.delay(0.2,function()
			if Window._MenuIcon and Window._MenuIcon.Root then
				Window._MenuIcon.Root:Destroy();
			end;

			if Window.SurfaceGui then
				Window.SurfaceGui:Destroy();
			end;

			WindowFrame:Destroy();
		end);
	end;

	-- Register this window as the active window so bindables can fire it
	L2Hub.ActiveWindow = Window;

	function Window:Watermark(Config)
		if typeof(Config) == "table" then
			local WatermarkLib = L2Hub.__WatermarkCache or Window:Watermark();

			return WatermarkLib:AddBlock(Config.Icon or Config.IconName or "", Config.Name or Config.Title or "Watermark");
		end;

		if L2Hub.__WatermarkCache then
			return L2Hub.__WatermarkCache;
		end;

		local Watermark_lb = {};
		local Watermark = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local Shadow = L2Hub:CreateShadow(Watermark);

		Watermark.Name = L2Hub.RandomString();
		Watermark.Parent = L2Hub.ScreenGui
		Watermark.AnchorPoint = Vector2.new(1, 0)
		Watermark.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
		Watermark.BackgroundTransparency = 0.200
		Watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Watermark.BorderSizePixel = 0
		Watermark.ClipsDescendants = true
		Watermark.Active = true   -- required: allows child ImageButtons to receive clicks
		Watermark.Position = UDim2.new(1, -10, 0, 10)
		Watermark.Size = UDim2.new(0, 120, 0, 30)
		Watermark.ZIndex = 16

		UICorner.CornerRadius = UDim.new(0, 25)
		UICorner.Parent = Watermark

		UIListLayout.Parent = Watermark
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right

		local empty_space = Instance.new('Frame');

		empty_space.Size = UDim2.fromOffset(15,0);
		empty_space.BackgroundTransparency = 1;
		empty_space.Parent = Watermark;
		empty_space.LayoutOrder = 5;

		Watermark:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if Watermark.BackgroundTransparency > 0.9 then
				Watermark.Visible = false;
				Watermark.Parent = nil;
			else
				Watermark.Parent = L2Hub.ScreenGui
				Watermark.Visible = true;
			end;
		end));

		UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(LPH_NO_VIRTUALIZE(function()
			L2Hub.PlayAnimate(Watermark , SlowyTween , {
				Size = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 5, 0, 30)
			})
		end));

		L2Hub.__WatermarkCache = Watermark_lb;

		Shadow:Render(false);

		Watermark_lb.Renders = {};
		Watermark_lb.Status = true;

		function Watermark_lb:SetRender(value)
			Watermark_lb.Status = value;

			if value then
				L2Hub.PlayAnimate(Watermark,SlowyTween , {
					BackgroundTransparency = 0.200
				})

				Shadow:Render(false);

				for i,v in next , Watermark_lb.Renders do
					pcall(v,true);
				end;
			else
				L2Hub.PlayAnimate(Watermark,SlowyTween , {
					BackgroundTransparency = 1
				})

				Shadow:Render(false);

				for i,v in next , Watermark_lb.Renders do
					pcall(v,false);
				end;
			end
		end;

		function Watermark_lb:AddBlock(IconStr , Name)
			local InnerBlock = {};

			local Frame = Instance.new("Frame")
			local Content = Instance.new("TextLabel")
			local Icon = Instance.new("ImageLabel")

			Frame.Parent = Watermark
			Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Frame.BackgroundTransparency = 1.000
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Active = true   -- required: allows child ImageButton to receive clicks
			Frame.Size = UDim2.new(0, 50, 0, 30)
			Frame.ZIndex = 17  -- must be >= Content/Icon ZIndex so CreateInput button (ZIndex+10=27) sits on top

			Content.Name = L2Hub.RandomString();
			Content.Parent = Frame
			Content.AnchorPoint = Vector2.new(0, 0.5)
			Content.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
			Content.BackgroundTransparency = 1.000
			Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 35, 0.5, 0)
			Content.Size = UDim2.new(0, 1, 0, 25)
			Content.ZIndex = 17
			Content.Font = Enum.Font.GothamBold
			Content.Text = Name
			Content.TextColor3 = Color3.fromRGB(186, 186, 186)
			Content.TextSize = 15.000
			Content.TextTransparency = 0.200
			Content.TextXAlignment = Enum.TextXAlignment.Left
			L2Hub:AddTextGradient(Content);

			Icon.Name = L2Hub.RandomString();
			Icon.Parent = Frame
			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
			Icon.BackgroundTransparency = 1.000
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Icon.BorderSizePixel = 0
			Icon.Position = UDim2.new(0, 10, 0.5, 0)
			Icon.Size = UDim2.new(0, 20, 0, 20)
			Icon.ZIndex = 17
			L2Hub:SetIconMode(Icon, IconStr)
			Icon.ImageColor3 = L2Hub.AccentColor
			Icon.ImageTransparency = 0.250
			Icon.ScaleType = Enum.ScaleType.Fit

			InnerBlock.Update = LPH_NO_VIRTUALIZE(function(value)
				local size = TextService:GetTextSize(Content.Text , Content.TextSize,Content.Font,Vector2.new(math.huge,math.huge))

				if InnerBlock.Visible then
					L2Hub.PlayAnimate(Frame,VSlowTween,{
						Size = UDim2.new(0, size.X + 35, 0, 30)
					})
				else
					L2Hub.PlayAnimate(Frame,VSlowTween,{
						Size = UDim2.new(0, 0, 0, 30)
					})
				end;
			end);

			InnerBlock.Visible = true;

			InnerBlock.Update();

			function InnerBlock:SetVisible(v)
				InnerBlock.Visible = v;

				if Watermark_lb.Status then
					InnerBlock.SetRender(v);
				end;

				InnerBlock.Update();
			end;

			InnerBlock.SetRender = LPH_NO_VIRTUALIZE(function(value)
				if value and InnerBlock.Visible then
					L2Hub.PlayAnimate(Content,SlowyTween , {
						TextTransparency = 0.200
					})

					L2Hub.PlayAnimate(Icon,SlowyTween , {
						TextTransparency = 0.250
					})
				else

					L2Hub.PlayAnimate(Content,SlowyTween , {
						TextTransparency = 1
					})

					L2Hub.PlayAnimate(Icon,SlowyTween , {
						TextTransparency = 1
					})
				end;
			end);

			table.insert(Watermark_lb.Renders,InnerBlock.SetRender);

			function InnerBlock:SetText(t)
				Content.Text = t;

				InnerBlock.Update();
			end;

			function InnerBlock:Input(func)
				-- If caller passes a function, use it.
				-- If nil, default to firing the real-time keybind toggle.
				local handler = func or function()
					L2Hub:FireKeybind();
				end;

				local btn, signal = L2Hub:CreateInput(Frame, handler);
				btn.Active = true;
				btn.ZIndex = Frame.ZIndex + 10;
				return signal;
			end;

			return CaseInsensitive(InnerBlock);
		end;

		return CaseInsensitive(Watermark_lb);
	end;

	Window:SetRender(false);

	-- ── Icon Settings (built-in UserSettings section) ─────────────
	-- Called automatically if a MenuIcon was created before this window.
	-- Adds: Icon Size slider, Draggable toggle, Icon Colour picker.
	function Window:_RegisterMenuIconSettings(MenuIcon)
		if not MenuIcon then return; end;

		Window.UserSettings:AddLabel('Icon Size'):AddSlider({
			Min      = 32,
			Max      = 96,
			Default  = MenuIcon._size,
			Rounding = 0,
			Type     = "px",
			Size     = 100,
			Callback = function(v)
				MenuIcon:SetSize(v);
			end,
		});

		Window.UserSettings:AddLabel('Icon Draggable'):AddToggle({
			Default  = MenuIcon._draggable,
			Callback = function(v)
				MenuIcon:SetDraggable(v);
			end,
		});
	end;

	-- Patch ToggleInterface to pulse the MenuIcon if one is registered
	local _orig_Toggle = Window.ToggleInterface;
	function Window:ToggleInterface()
		if Window.Destroyed then
			return;
		end;

		_orig_Toggle(self);
		if Window._MenuIcon then
			Window._MenuIcon:OnWindowToggle(Window.Signal:GetValue());
		end;
	end;

	-- Convenience: attach a MenuIcon to this window
	function Window:AttachMenuIcon(MenuIcon)
		Window._MenuIcon = MenuIcon;
		Window:_RegisterMenuIconSettings(MenuIcon);
	end;

	function Window:Notify(Config)
		return L2Hub.Notifier.new(Config);
	end;

	Window.Indicators = LPH_NO_VIRTUALIZE(function(Config)
		local Indicator = L2Hub.Indicators.new(Config);
		Indicator:SetRender(true);
		return Indicator;
	end);

	function Window:Indicator(Config)
		return Window.Indicators(Config);
	end;

	return CaseInsensitive(Window);
end;

function L2Hub:CreateNotification()
	if L2Hub.__Notification_Cache then
		return L2Hub.__Notification_Cache;
	end;

	local Notifier = {};
	local Notification = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Notification.Name = L2Hub.RandomString();
	Notification.Parent = L2Hub.ScreenGui;
	Notification.AnchorPoint = Vector2.new(1, 0)
	Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Notification.BackgroundTransparency = 1.000
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(1, -25, 0, 25)
	Notification.Size = UDim2.new(0, 25, 0, 25)

	UIListLayout.Parent = Notification
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 0)

	L2Hub.__Notification_Cache = Notifier;

	function Notifier.new(Config)
		Config = Config or {};
		local CustomIcon = Config.Icon;

		Config = L2Hub:ProcessParams(Config , {
			Title = "Notification",
			Content = "Hello World!",
			Logo = L2Hub.GlobalLogo or "rbxasset://textures/ui/VerifiedBadgeNameIcon.png",
			Icon = CustomIcon,
			Duration = 5,
		});

		local IconSource = Config.Icon or Config.Logo;
		local IconId = L2Hub:GetIconId(IconSource);
		local IsImageIcon = IconId ~= "";

		if L2Hub.__WatermarkCache then
			L2Hub.PlayAnimate(Notification,SlowyTween , {
				Position = UDim2.new(1, -25, 0, 55)
			});
		end;

		local ContainerFrame = Instance.new("Frame")
		local NotifyFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local LogoImage = Instance.new("ImageLabel")
		local LogoIcon = Instance.new("ImageLabel")
		local UICorner_2 = Instance.new("UICorner")
		local NotifyName = Instance.new("TextLabel")
		local NotifyContent = Instance.new("TextLabel");
		local shadow = L2Hub:CreateShadow(NotifyFrame , true);

		ContainerFrame.Name = L2Hub.RandomString();
		ContainerFrame.Parent = Notification
		ContainerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContainerFrame.BackgroundTransparency = 1.000
		ContainerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContainerFrame.BorderSizePixel = 0
		ContainerFrame.Size = UDim2.new(0, 0, 0, 100)

		NotifyFrame.Name = L2Hub.RandomString();
		NotifyFrame.Parent = ContainerFrame
		NotifyFrame.AnchorPoint = Vector2.new(1, 0)
		NotifyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		NotifyFrame.BackgroundTransparency = 0.075
		NotifyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyFrame.BorderSizePixel = 0
		NotifyFrame.ClipsDescendants = true
		NotifyFrame.Position = UDim2.new(0, 750, 0, 0)
		NotifyFrame.Size = UDim2.new(0, 220, 0, 55)
		NotifyFrame.ZIndex = 130

		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = NotifyFrame

		UIStroke.Transparency = 0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = NotifyFrame

		LogoImage.Name = L2Hub.RandomString();
		LogoImage.Parent = NotifyFrame
		LogoImage.AnchorPoint = Vector2.new(0, 0.5)
		LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogoImage.BackgroundTransparency = 1.000
		LogoImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogoImage.BorderSizePixel = 0
		LogoImage.Position = UDim2.new(0, 8, 0.5, 0)
		LogoImage.Size = UDim2.new(0, 28, 0, 28)
		LogoImage.ZIndex = 131
		LogoImage.Image = IsImageIcon and IconId or ""
		LogoImage.ImageColor3 = L2Hub.IconColor;
		LogoImage.ImageTransparency = IsImageIcon and 0 or 1

		UICorner_2.CornerRadius = UDim.new(0, 7)
		UICorner_2.Parent = LogoImage

		LogoIcon.Name = L2Hub.RandomString();
		LogoIcon.Parent = NotifyFrame
		LogoIcon.AnchorPoint = Vector2.new(0, 0.5)
		LogoIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogoIcon.BackgroundTransparency = 1.000
		LogoIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogoIcon.BorderSizePixel = 0
		LogoIcon.Position = UDim2.new(0, 8, 0.5, 0)
		LogoIcon.Size = UDim2.new(0, 28, 0, 28)
		LogoIcon.ZIndex = 131
		L2Hub:SetIconMode(LogoIcon, IsImageIcon and "" or tostring(IconSource or "bell"))
		LogoIcon.ImageColor3 = L2Hub.IconColor
		LogoIcon.ImageTransparency = IsImageIcon and 1 or 0.150
		LogoIcon.ScaleType = Enum.ScaleType.Fit

		NotifyName.Name = L2Hub.RandomString();
		NotifyName.Parent = NotifyFrame
		NotifyName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyName.BackgroundTransparency = 1.000
		NotifyName.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyName.BorderSizePixel = 0
		NotifyName.Position = UDim2.new(0, 42, 0, 5)
		NotifyName.Size = UDim2.new(0, 200, 0, 16)
		NotifyName.ZIndex = 132
		NotifyName.Font = Enum.Font.GothamBold
		NotifyName.Text = Config.Title
		NotifyName.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotifyName.TextSize = 13.000
		NotifyName.TextXAlignment = Enum.TextXAlignment.Left

		NotifyContent.Name = L2Hub.RandomString();
		NotifyContent.Parent = NotifyFrame
		NotifyContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyContent.BackgroundTransparency = 1.000
		NotifyContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyContent.BorderSizePixel = 0
		NotifyContent.Position = UDim2.new(0, 42, 0, 22)
		NotifyContent.Size = UDim2.new(0, 200, 0, 13)
		NotifyContent.ZIndex = 132
		NotifyContent.Font = Enum.Font.GothamBold
		NotifyContent.Text = Config.Content
		NotifyContent.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotifyContent.TextSize = 10.000
		NotifyContent.TextTransparency = 0.650
		NotifyContent.TextXAlignment = Enum.TextXAlignment.Left

		local Size1 = TextService:GetTextSize(NotifyName.Text,NotifyName.TextSize,NotifyName.Font,Vector2.new(math.huge,math.huge));
		local Size2 = TextService:GetTextSize(NotifyContent.Text,NotifyContent.TextSize,NotifyContent.Font,Vector2.new(math.huge,math.huge));

		local MainSize = math.max(Size1.X , Size2.X);

		-- Compact notification: smaller height, width auto-fits text
		NotifyFrame.Size = UDim2.new(0, MainSize + 52, 0, 46);

		shadow:Render(true)
		L2Hub.PlayAnimate(NotifyFrame , VSlowTween , {
			Position = UDim2.new(1, 0, 0, 0)
		})

		ContainerFrame.Size = UDim2.new(0, 0, 0, 56)

		task.delay(Config.Duration or 5 , LPH_NO_VIRTUALIZE(function()

			if L2Hub.__WatermarkCache then
				L2Hub.PlayAnimate(Notification,SlowyTween , {
					Position = UDim2.new(1, -25, 0, 55)
				});
			end;

			shadow:Render(false)

			L2Hub.PlayAnimate(NotifyFrame , SlowyTween , {
				BackgroundTransparency = 1
			})

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			})

			L2Hub.PlayAnimate(LogoImage , SlowyTween , {
				ImageTransparency = 1
			})

			L2Hub.PlayAnimate(LogoIcon , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(NotifyName , SlowyTween , {
				TextTransparency = 1
			})

			L2Hub.PlayAnimate(NotifyContent , SlowyTween , {
				TextTransparency = 1
			})

			task.wait(0.125);

			L2Hub.PlayAnimate(ContainerFrame , SlowyTween , {
				Size = UDim2.new(0, 0, 0, 0)
			})

			task.wait(0.125);

			ContainerFrame:Destroy();
		end))
	end;

	return Notifier;
end;

function L2Hub:CreateLogger()
	if L2Hub.__LogSystem then
		return 	L2Hub.__LogSystem;
	end;

	local Logging = {};
	local Log = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Log.Name = L2Hub.RandomString();
	Log.Parent = L2Hub.ScreenGui
	Log.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Log.BackgroundTransparency = 1.000
	Log.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Log.BorderSizePixel = 0
	Log.Position = UDim2.new(0, 25, 0, 5 + math.abs(L2Hub.ScreenGui.AbsolutePosition.Y))
	Log.Size = UDim2.new(0, 25, 0, 25)

	UIListLayout.Parent = Log
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 12)

	L2Hub.__LogSystem = Logging;

	function Logging.new(IconStr: string , Message: string , Duration: number)
		Duration = Duration or 3;
		Message = Message or "Log";
		IconStr = IconStr or "crosshairs";

		local LogFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local LogContent = Instance.new("TextLabel")
		local Line = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Icon = Instance.new("ImageLabel")
		local Shadow = L2Hub:CreateShadow(LogFrame , true);

		LogFrame.Name = L2Hub.RandomString();
		LogFrame.Parent = Log
		LogFrame.AnchorPoint = Vector2.new(0.5, 0)
		LogFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		LogFrame.BackgroundTransparency =  1--0.075
		LogFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogFrame.BorderSizePixel = 0
		LogFrame.ClipsDescendants = true
		LogFrame.Position = UDim2.new(0,0,0,0)
		LogFrame.Size = UDim2.new(0, 0, 0, 20)
		LogFrame.ZIndex = 130

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = LogFrame

		UIStroke.Transparency = 1--0.650
		UIStroke.Color = Color3.fromRGB(45, 48, 58)
		UIStroke.Parent = LogFrame

		LogContent.Name = L2Hub.RandomString();
		LogContent.Parent = LogFrame
		LogContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LogContent.BackgroundTransparency = 1.000
		LogContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LogContent.BorderSizePixel = 0
		LogContent.Position = UDim2.new(0, 25, 0, 2)
		LogContent.Size = UDim2.new(0, 200, 0, 15)
		LogContent.ZIndex = 132
		LogContent.Font = Enum.Font.GothamBold
		LogContent.Text = Message
		LogContent.TextColor3 = Color3.fromRGB(255, 255, 255)
		LogContent.TextSize = 12.000
		LogContent.TextTransparency = 1--0.250
		LogContent.TextXAlignment = Enum.TextXAlignment.Left

		Line.Name = L2Hub.RandomString();
		Line.Parent = LogFrame
		Line.AnchorPoint = Vector2.new(0, 0.5)
		Line.BackgroundColor3 = L2Hub.AccentColor
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BackgroundTransparency = 1 --0
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, -2, 0.5, 0)
		Line.Size = UDim2.new(0, 5, 1, 0)
		Line.ZIndex = 131

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = Line

		Icon.Name = L2Hub.RandomString();
		Icon.Parent = LogFrame
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 7, 0, 3)
		Icon.Size = UDim2.new(0, 15, 0, 15)
		Icon.ZIndex = 133
		L2Hub:SetIconMode(Icon, IconStr)
		Icon.ImageColor3 = Color3.fromRGB(223, 223, 223)
		Icon.ImageTransparency = 1--0.250
		Icon.ScaleType = Enum.ScaleType.Fit

		local size = TextService:GetTextSize(LogContent.Text,LogContent.TextSize,LogContent.Font,Vector2.new(math.huge,math.huge));

		L2Hub.PlayAnimate(LogFrame , SlowyTween , {
			Size = UDim2.new(0, size.X + 35, 0, 20),
			BackgroundTransparency =  0.075
		});

		task.delay(0.15,LPH_NO_VIRTUALIZE(function()
			Shadow:Render(false);

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 0.650
			});

			L2Hub.PlayAnimate(LogContent , SlowyTween , {
				TextTransparency = 0.25
			});

			L2Hub.PlayAnimate(Line , SlowyTween , {
				BackgroundTransparency = 0
			});

			L2Hub.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 0.25
			});

			task.wait(Duration + 0.1);

			Shadow:Render(false);

			L2Hub.PlayAnimate(LogFrame , SlowyTween , {
				BackgroundTransparency =  1
			});

			L2Hub.PlayAnimate(UIStroke , SlowyTween , {
				Transparency = 1
			});

			L2Hub.PlayAnimate(LogContent , SlowyTween , {
				TextTransparency = 1
			});

			L2Hub.PlayAnimate(Line , SlowyTween , {
				BackgroundTransparency = 1
			});

			L2Hub.PlayAnimate(Icon , SlowyTween , {
				TextTransparency = 1
			});

			task.wait(0.25);

			LogFrame:Destroy();
		end))
	end;

	return CaseInsensitive(Logging)
end;

function L2Hub:CreateIndicator()
	local IndicatorFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	IndicatorFrame.Name = L2Hub.RandomString();
	IndicatorFrame.Parent = L2Hub.ScreenGui;
	IndicatorFrame.AnchorPoint = Vector2.new(0, 0.5)
	IndicatorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	IndicatorFrame.BackgroundTransparency = 1.000
	IndicatorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	IndicatorFrame.BorderSizePixel = 0
	IndicatorFrame.Position = UDim2.new(0, 15, 0.5, 0)
	IndicatorFrame.Size = UDim2.new(0, 100, 0, 100)
	IndicatorFrame.ZIndex = 15

	UIListLayout.Parent = IndicatorFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 10)

	local Indicators = {};

	Indicators.Color = {
		Red = Color3.fromRGB(255, 102, 105),
		Green = Color3.fromRGB(135, 255, 143),
		White = Color3.fromRGB(186, 186, 186),
	};

	Indicators.Root = IndicatorFrame;

	function Indicators.new(Config)
		Config = L2Hub:ProcessParams(Config , {
			Name = "Indicator",
			Icon = 'crosshairs',
			Color = 'Red',
		});

		local Indicator = {
			CurrentColor = Config.Color,	
			Visible = false,
		};

		local IndicatorItem = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Line = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")
		local Icon = Instance.new("ImageLabel")
		local Content = Instance.new("TextLabel")
		local Shadow = L2Hub:CreateShadow(IndicatorItem);

		IndicatorItem.Name = L2Hub.RandomString();
		IndicatorItem.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
		IndicatorItem.BackgroundTransparency = 1
		IndicatorItem.BorderColor3 = Color3.fromRGB(0, 0, 0)
		IndicatorItem.BorderSizePixel = 0
		IndicatorItem.ClipsDescendants = true
		IndicatorItem.Size = UDim2.new(0, 85, 0, 40)
		IndicatorItem.ZIndex = 16
		IndicatorItem.Visible = false;

		IndicatorItem:GetPropertyChangedSignal('BackgroundTransparency'):Connect(LPH_NO_VIRTUALIZE(function()
			if IndicatorItem.BackgroundTransparency > 0.9 then
				IndicatorItem.Parent = nil;
				IndicatorItem.Visible = false;
			else
				IndicatorItem.Parent = IndicatorFrame;
				IndicatorItem.Visible = true;
			end;
		end))

		UICorner.CornerRadius = UDim.new(0, 25)
		UICorner.Parent = IndicatorItem

		Line.Name = L2Hub.RandomString();
		Line.Parent = IndicatorItem
		Line.AnchorPoint = Vector2.new(0, 0.5)
		Line.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 2, 0.5, 0)
		Line.BackgroundTransparency = 1;
		Line.Size = UDim2.new(0, 3, 0.649999976, 0)
		Line.ZIndex = 17

		UICorner_2.CornerRadius = UDim.new(0, 25)
		UICorner_2.Parent = Line

		UIGradient.Rotation = 90
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		UIGradient.Parent = Line

		Icon.Name = L2Hub.RandomString();
		Icon.Parent = IndicatorItem
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, 10, 0.5, 0)
		Icon.Size = UDim2.new(0, 25, 0, 25)
		Icon.ZIndex = 17
		L2Hub:SetIconMode(Icon, Config.Icon)
		Icon.ImageColor3 = Color3.fromRGB(186, 186, 186)
		Icon.ImageTransparency = 1
		Icon.ScaleType = Enum.ScaleType.Fit

		Content.Name = L2Hub.RandomString();
		Content.Parent = IndicatorItem
		Content.AnchorPoint = Vector2.new(0, 0.5)
		Content.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
		Content.BackgroundTransparency = 1.000
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 40, 0.5, 0)
		Content.Size = UDim2.new(1, -40, 0, 25)
		Content.ZIndex = 17
		Content.Font = Enum.Font.GothamBold
		Content.Text = Config.Name
		Content.TextColor3 = Color3.fromRGB(186, 186, 186)
		Content.TextSize = 20.000
		Content.TextTransparency = 1
		Content.TextXAlignment = Enum.TextXAlignment.Left

		Indicator.Update = LPH_NO_VIRTUALIZE(function()
			local text = TextService:GetTextSize(Content.Text,Content.TextSize , Content.Font , Vector2.new(math.huge,math.huge));

			L2Hub.PlayAnimate(IndicatorItem , SlowyTween , {
				Size = UDim2.new(0, text.X + 60, 0, 40);
			})
		end);

		Indicator.SetRender = LPH_NO_VIRTUALIZE(function(self , value)
			Indicator.Visible = value;

			if value then
				L2Hub.PlayAnimate(IndicatorItem , SlowyTween , {
					BackgroundTransparency = 0.200
				});

				L2Hub.PlayAnimate(Line , SlowyTween , {
					BackgroundTransparency = 0,
					BackgroundColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				L2Hub.PlayAnimate(Icon , VSlowTween , {
					TextTransparency = 0.250,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				L2Hub.PlayAnimate(Content , VSlowTween , {
					TextTransparency = 0.2,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				Shadow:Render(false);
			else
				L2Hub.PlayAnimate(IndicatorItem , SlowyTween , {
					BackgroundTransparency = 1
				});

				L2Hub.PlayAnimate(Line , SlowyTween , {
					BackgroundTransparency = 1,
					BackgroundColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				L2Hub.PlayAnimate(Icon , VSlowTween , {
					TextTransparency = 1,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				L2Hub.PlayAnimate(Content , VSlowTween , {
					TextTransparency = 1,
					TextColor3 = Indicators.Color[Indicator.CurrentColor]
				});

				Shadow:Render(false);
			end;

			Indicator.Update();
		end);

		Indicator.Update();
		Indicator:SetRender(false);

		function Indicator:SetColor(new_color)
			Indicator.CurrentColor = new_color;

			if Indicator.Visible then
				Indicator:SetRender(true);
			end;
		end;

		function Indicator:SetText(name)
			Config.Name = name;

			Content.Text = Config.Name;

			Indicator.Update();
		end;

		return CaseInsensitive(Indicator);
	end;

	return CaseInsensitive(Indicators);
end;

L2Hub.Logging = L2Hub:CreateLogger();
L2Hub.Notifier = L2Hub:CreateNotification();
L2Hub.Indicators = L2Hub:CreateIndicator();

function L2Hub:Unload()
	if not L2Hub.UnloadEnabled then
		return;	
	end;

	L2Hub.ScreenGui:Destroy();

	for i,v in next , L2Hub.GlobalSignals do
		pcall(v.Disconnect,v)
	end;
end;

function L2Hub:Window(Config)
	return L2Hub:CreateWindow(Config);
end;

return CaseInsensitive(L2Hub);

end)()
local Window = L2Hub:CreateWindow({
Title = "L2 HUB",
Size = UDim2.new(0, 520, 0, 320),
Uitransparent = 0.05,
ConfigFolder = "L2Hub_Configs/ViolenceDistrict",
Config = {
AutoSaveFile = "Default",
AutoSave = false,
AutoLoad = false
}
})
local VDSettings = {
ESP = {
Enabled = false,
Styles = {Chams = true, Box = false, Skeleton = false},
Info = {Names = false, Distance = false, Health = false, ItemStatus = false},
Targets = {Survivor = false, Killer = false},
FillTrans = 0.5,
OutlineTrans = 0.3,
TextSize = 12,
Colors = {
Survivor = Color3.fromRGB(0, 255, 0),
Killer = Color3.fromRGB(255, 0, 0)
}
},
WorldESP = {
Enabled = false,
MaxDistance = 150,
Targets = {Generators = false, Hooks = false, Gates = false, Windows = false, Pallets = false, Zombies = false,             Pumpkins = false},
ShowName = false,
ShowDistance = false,
Colors = {
Generators = Color3.fromRGB(0, 170, 255),
Hooks = Color3.fromRGB(255, 0, 0),
Gates = Color3.fromRGB(255, 255, 0),
Windows = Color3.fromRGB(255, 255, 255),
Pallets = Color3.fromRGB(255, 170, 0),
Zombies = Color3.fromRGB(170, 0, 255),
Pumpkins = Color3.fromRGB(255, 130, 0)
}
},
Camera = {
FOVEnabled = false,
FOVValue = 70,
UnlockZoom = false,
MaxZoom = 400,
DBDCam = false,
DBDSmoothness = 0.2
},
Lighting = {
Fullbright = false,
FullbrightValue = 180,
NoFog = false
},
Misc = {
SkipCutscene = false,
Noclip = false,
SpeedHack = false,
SpeedValue = 0.2,
StreamMode = false,
NextKiller = false,
NextMap = false
},
Survivor = {
AutoSkillMode = "Disabled",
BoostGenEnabled = false,
BypassGenMode = "Manual Repair",
Flowstate = false,
PerfectVault = false,
AutoCrouch = false,
GodMode = false,
AntiFall = false,
Invis = { Enabled = false, State = false },
FakePerks = {
QuickRecovery = false,
PerfectLanding = false,
Flowstate = false,
Cooldown = 10
}
},
Combat = {
Parry = {
Enabled = false,
Aggressive = false,
Distance = 8,
ShowCircle = false,
Color = Color3.fromRGB(170, 0, 255)
}
},
Aim = {
SilentAim = false,
TargetPart = "Torso",
TargetMode = "Killer",
Prediction = true,
BulletSpeed = 200,
Laser = false,
LaserColor = Color3.fromRGB(255, 0, 0),
FlashSilent = false,
FlashYOffset = 1.5
},
Killer = {
AimbotEnabled = false,
MeleeLockDistance = 12,
AimbotSmoothness = 5,
HoldingM2 = false,
DashLockEnabled = false,
Spear = {
Enabled = false,
AutoPredict = false,
FovRadius = 150,
FovColor = Color3.fromRGB(108, 92, 231),
FovTransparency = 0.5,
ShowTracker = false,
ShowFOV = false,
CustomSpeed = 180,
CustomGravity = 96.05,
LeadMultiplier = 1.4,
PROF = {
aura = { v0 = 180, g = 96.05, windup = 0.10, latency = 0.04, maxlead = 25, scale = 1.00 },
normal = { v0 = 180, g = 96.05, windup = 0.10, latency = 0.04, maxlead = 45, scale = 1.10 }
}
}
}
}
local Cache = {
ESPInstances = {},
WorldESPInstances = {},
ValidWorldObjects = {},
CachedZombies = {},
mapConnections = {},
VFX = {},
GUI = {},
lastCamCFrame = workspace.CurrentCamera and workspace.CurrentCamera.CFrame or CFrame.new(),
instantLastVisible = false,
lastGoalRot = nil,
prevRot = nil,
lastPressTime = 0,
ProcessedGens = {},
AutoRepairEnabled = false,
AutoRepairThread = nil,
AutoCurrentPoint = nil,
AutoCurrentGenModel = nil,
LastFireTime = 0,
AutoFireInterval = 0.5,
RepairAnimTrack = nil,
GenCache = {},
GenCacheTimer = 0,
FloatingGenUI = nil,
DragConfigPath = "L2Hub_GenBypassPos.json",
VaultAnimIds = { ["rbxassetid://83873880822918"] = "rbxassetid://136962284480779" },
ActiveVaultTracks = {},
FastVaultConn = nil,
FastVaultAnimConn = nil,
ParryLast = 0,
ActiveAttackers = {},
CircleLines = {},
lastUtilScan = 0,
lastHum = nil,
lastGodMode = nil,
HeadIconGui = nil,
DashLockState = {
isAimLocking = false,
currentTarget = nil,
lockTimerThread = nil,
lastLockTime = 0
},
FakePerksState = {
boostActive = false,
plBoostActive = false,
fsOnCooldown = false,
lastQR = 0,
lastPL = 0,
lastFS = 0,
conns = {}
},
TargetButtons = {},
ICON_VISIBLE = "rbxassetid://105268904095276",
ICON_INVISIBLE = "rbxassetid://134729363093940",
SpooferConns = {},
KillerAttackAnims = {
["rbxassetid://78432063483146"] = "attack", ["rbxassetid://121216847022485"] = "attack",
["rbxassetid://74968262036854"] = "attack", ["rbxassetid://132817836308238"] = "attack",
["rbxassetid://82666958311998"] = "attack", ["rbxassetid://111920872708571"] = "attack",
["rbxassetid://106871536134254"] = "attack", ["rbxassetid://109402730355822"] = "attack",
["rbxassetid://130593238885843"] = "attack", ["rbxassetid://138720291317243"] = "attack",
["rbxassetid://139369275981139"] = "attack", ["rbxassetid://133963973694098"] = "attack",
["rbxassetid://78935059863801"] = "attack", ["rbxassetid://118907603246885"] = "lungehold",
["rbxassetid://135002183282873"] = "lungehold", ["rbxassetid://113255068724446"] = "lungehold",
["rbxassetid://129784271201071"] = "lungehold", ["rbxassetid://105374834496520"] = "lungehold",
["rbxassetid://117070354890871"] = "lungehold", ["rbxassetid://115244153053858"] = "lungehold",
["rbxassetid://110355011987939"] = "lungehold", ["rbxassetid://117042998468241"] = "lungehold",
["rbxassetid://122812055447896"] = "lungehold"
},
Spear = {
target = nil,
lookVector = nil,
velHistory = {},
Visuals = {
FOVCircle = Drawing.new("Circle"),
TrackerCircle = Drawing.new("Circle"),
TrackerLine = Drawing.new("Line")
}
}
}
Cache.Spear.Visuals.FOVCircle.Color = VDSettings.Killer.Spear.FovColor
Cache.Spear.Visuals.FOVCircle.Thickness = 1
Cache.Spear.Visuals.FOVCircle.Filled = false
Cache.Spear.Visuals.FOVCircle.Transparency = VDSettings.Killer.Spear.FovTransparency
Cache.Spear.Visuals.TrackerCircle.Color = Color3.fromRGB(255, 0, 0)
Cache.Spear.Visuals.TrackerCircle.Thickness = 1.5
Cache.Spear.Visuals.TrackerCircle.Filled = false
Cache.Spear.Visuals.TrackerCircle.Transparency = 1
Cache.Spear.Visuals.TrackerLine.Color = Color3.fromRGB(255, 0, 0)
Cache.Spear.Visuals.TrackerLine.Thickness = 2
Cache.Spear.Visuals.TrackerLine.Transparency = 1
local function GetPlayerRole(player)
if player.Team and (player.Team.Name == "Killer" or player.Team.Name == "Killers" or string.find(string.lower(player.Team.Name), "iller")) then
return "Killer"
end
return "Survivor"
end
local function ClearESP(player)
if Cache.ESPInstances[player] then
local inst = Cache.ESPInstances[player]
if inst.Highlight then inst.Highlight:Destroy() end
if inst.Billboard then inst.Billboard:Destroy() end
if inst.BoxOutline then inst.BoxOutline:Remove() end
if inst.Box then inst.Box:Remove() end
if inst.Corners then
for _, line in pairs(inst.Corners) do line:Remove() end
for _, line in pairs(inst.CornerOutlines) do line:Remove() end
end
if inst.HealthBarBack then inst.HealthBarBack:Remove() end
if inst.HealthBar then inst.HealthBar:Remove() end
if inst.Skeleton then
for _, line in pairs(inst.Skeleton) do line:Remove() end
end
Cache.ESPInstances[player] = nil
end
end
local function CreateLine()
local line = Drawing.new("Line")
line.Thickness = 1.5
line.Transparency = 1
return line
end
local function UpdateESP()
local cam = workspace.CurrentCamera
if not cam then return end
local localPlayerChar = Players.LocalPlayer.Character
local localRoot = localPlayerChar and localPlayerChar:FindFirstChild("HumanoidRootPart")
for _, player in ipairs(Players:GetPlayers()) do
if player ~= Players.LocalPlayer then
local char = player.Character
local root = char and char:FindFirstChild("HumanoidRootPart")
local hum = char and char:FindFirstChild("Humanoid")
local role = GetPlayerRole(player)
if VDSettings.ESP.Enabled and VDSettings.ESP.Targets[role] and root and hum and hum.Health > 0 then
if not Cache.ESPInstances[player] then
Cache.ESPInstances[player] = { Skeleton = {} }
local inst = Cache.ESPInstances[player]
local highlight = Instance.new("Highlight")
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlight.Parent = CoreGui
inst.Highlight = highlight
local billboard = Instance.new("BillboardGui")
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(0, 200, 0, 50)
billboard.StudsOffset = Vector3.new(0, 3, 0)
billboard.Parent = CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Font = Enum.Font.GothamBold
textLabel.TextStrokeTransparency = 0
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Parent = billboard
inst.Billboard = billboard
inst.Text = textLabel
inst.Corners = {}
inst.CornerOutlines = {}
for i = 1, 8 do
local outline = Drawing.new("Line")
outline.Thickness = 3
outline.Color = Color3.new(0, 0, 0)
inst.CornerOutlines[i] = outline
local inline = Drawing.new("Line")
inline.Thickness = 1.5
inst.Corners[i] = inline
end
for i = 1, 15 do
inst.Skeleton[i] = CreateLine()
end
local hbBack = Drawing.new("Line")
hbBack.Thickness = 4
hbBack.Color = Color3.new(0, 0, 0)
inst.HealthBarBack = hbBack
local hb = Drawing.new("Line")
hb.Thickness = 2
hb.Color = Color3.new(0, 1, 0)
inst.HealthBar = hb
end
local inst = Cache.ESPInstances[player]
local espColor = VDSettings.ESP.Colors[role]
local bb = inst.Billboard
local txt = inst.Text
bb.Adornee = root
local hasTextESP = VDSettings.ESP.Info.Names or VDSettings.ESP.Info.Distance or VDSettings.ESP.Info.ItemStatus
if hasTextESP then
bb.Enabled = true
txt.TextSize = VDSettings.ESP.TextSize
txt.TextColor3 = espColor
local dist = localRoot and math.floor((localRoot.Position - root.Position).Magnitude) or 0
local displayText = ""
if VDSettings.ESP.Info.Names then displayText = player.Name end
if VDSettings.ESP.Info.Distance then displayText = displayText .. (displayText ~= "" and "\n" or "") .. "[" .. dist .. "m]" end
if VDSettings.ESP.Info.ItemStatus then
local item = player:GetAttribute("EquippedItem")
if not item or item == "" then item = "None" end
displayText = displayText .. (displayText ~= "" and "\n" or "") .. "[Item: " .. item .. "]"
end
txt.Text = displayText
else
bb.Enabled = false
end
local hl = inst.Highlight
if VDSettings.ESP.Styles.Chams then
hl.Enabled = true
hl.Adornee = char
hl.FillColor = espColor
hl.OutlineColor = espColor
hl.FillTransparency = VDSettings.ESP.FillTrans
hl.OutlineTransparency = VDSettings.ESP.OutlineTrans
else
hl.Enabled = false
end
local rootPos, onScreen = cam:WorldToViewportPoint(root.Position)
if inst.Box then inst.Box.Visible = false end
if inst.BoxOutline then inst.BoxOutline.Visible = false end
if inst.Corners then
for i = 1, 8 do
inst.Corners[i].Visible = false
inst.CornerOutlines[i].Visible = false
end
end
for _, line in pairs(inst.Skeleton) do line.Visible = false end
if inst.HealthBarBack then inst.HealthBarBack.Visible = false end
if inst.HealthBar then inst.HealthBar.Visible = false end
if onScreen then
local head = char:FindFirstChild("Head")
local headPos, legPos, width, height, x, y
if head then
headPos = cam:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
legPos = cam:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
height = math.abs(headPos.Y - legPos.Y)
width = height / 2
x = rootPos.X - width / 2
y = rootPos.Y - height / 2
end
if VDSettings.ESP.Info.Health and head then
local healthPct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
inst.HealthBarBack.From = Vector2.new(x - 6, y)
inst.HealthBarBack.To = Vector2.new(x - 6, y + height)
inst.HealthBarBack.Visible = true
inst.HealthBar.From = Vector2.new(x - 6, y + height)
inst.HealthBar.To = Vector2.new(x - 6, y + height - (height * healthPct))
inst.HealthBar.Color = Color3.new(1 - healthPct, healthPct, 0)
inst.HealthBar.Visible = true
end
if VDSettings.ESP.Styles.Box and head then
local length = width / 3
local TL = Vector2.new(x, y)
local TR = Vector2.new(x + width, y)
local BL = Vector2.new(x, y + height)
local BR = Vector2.new(x + width, y + height)
local lines = {
{TL, TL + Vector2.new(length, 0)}, {TL, TL + Vector2.new(0, length)},
{TR, TR - Vector2.new(length, 0)}, {TR, TR + Vector2.new(0, length)},
{BL, BL + Vector2.new(length, 0)}, {BL, BL - Vector2.new(0, length)},
{BR, BR - Vector2.new(length, 0)}, {BR, BR - Vector2.new(0, length)}
}
for i = 1, 8 do
inst.CornerOutlines[i].From = lines[i][1]
inst.CornerOutlines[i].To = lines[i][2]
inst.CornerOutlines[i].Visible = true
inst.Corners[i].From = lines[i][1]
inst.Corners[i].To = lines[i][2]
inst.Corners[i].Color = espColor
inst.Corners[i].Visible = true
end
end
if VDSettings.ESP.Styles.Skeleton then
local function DrawBone(index, p1, p2)
local line = inst.Skeleton[index]
if char:FindFirstChild(p1) and char:FindFirstChild(p2) then
local pt1, on1 = cam:WorldToViewportPoint(char[p1].Position)
local pt2, on2 = cam:WorldToViewportPoint(char[p2].Position)
if on1 and on2 then
line.From = Vector2.new(pt1.X, pt1.Y)
line.To = Vector2.new(pt2.X, pt2.Y)
line.Color = espColor
line.Visible = true
end
end
end
if char:FindFirstChild("UpperTorso") then
DrawBone(1, "Head", "UpperTorso"); DrawBone(2, "UpperTorso", "LowerTorso")
DrawBone(3, "UpperTorso", "RightUpperArm"); DrawBone(4, "RightUpperArm", "RightLowerArm")
DrawBone(5, "RightLowerArm", "RightHand"); DrawBone(6, "UpperTorso", "LeftUpperArm")
DrawBone(7, "LeftUpperArm", "LeftLowerArm"); DrawBone(8, "LeftLowerArm", "LeftHand")
DrawBone(9, "LowerTorso", "RightUpperLeg"); DrawBone(10, "RightUpperLeg", "RightLowerLeg")
DrawBone(11, "RightLowerLeg", "RightFoot"); DrawBone(12, "LowerTorso", "LeftUpperLeg")
DrawBone(13, "LeftUpperLeg", "LeftLowerLeg"); DrawBone(14, "LeftLowerLeg", "LeftFoot")
elseif char:FindFirstChild("Torso") then
DrawBone(1, "Head", "Torso"); DrawBone(2, "Torso", "Right Arm")
DrawBone(3, "Torso", "Left Arm"); DrawBone(4, "Torso", "Right Leg")
DrawBone(5, "Torso", "Left Leg")
end
end
end
else
ClearESP(player)
end
end
end
end
Players.PlayerRemoving:Connect(ClearESP)
local function GetWorldTargetPart(obj, targetType)
if targetType == "Generators" then
return obj:FindFirstChild("HitBox", true) or obj:FindFirstChild("GeneratorPoint", true)
elseif targetType == "Pallets" then
local candidates = {
obj:FindFirstChild("HumanoidRootPart", true), obj:FindFirstChild("PrimaryPartPallet", true),
obj:FindFirstChild("Primary1", true), obj:FindFirstChild("Primary2", true),
obj:FindFirstChild("PalletPoint", true), obj:FindFirstChild("PalletPointSlide", true)
}
for _, p in ipairs(candidates) do if p and p:IsA("BasePart") then return p end end
elseif targetType == "Windows" then
local v = obj:FindFirstChild("VaultPoint", true) or obj:FindFirstChild("VaultTrigger", true)
if v and v:IsA("BasePart") then return v end
elseif targetType == "Zombies" then
return obj:FindFirstChild("HumanoidRootPart", true) or obj:FindFirstChild("UpperTorso", true) or obj:FindFirstChild("Torso", true)
elseif targetType == "Pumpkins" then
return obj:FindFirstChild("HB") or obj:FindFirstChild("shell") or obj:FindFirstChild("inside") or obj.PrimaryPart
end
return obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true) or obj
end
local function ProcessMapObject(obj)
if obj:IsA("Model") then
local nameLower = string.lower(obj.Name)
local targetType, targetName = nil, nil
if string.find(nameLower, "generator") then targetType, targetName = "Generators", "Generator"
elseif string.find(nameLower, "hook") then targetType, targetName = "Hooks", "Hook"
elseif (string.find(nameLower, "gate") or obj:FindFirstChild("ExitLever")) then targetType, targetName = "Gates", "Gate"
elseif string.find(nameLower, "window") then targetType, targetName = "Windows", "Window"
elseif string.find(nameLower, "pallet") then targetType, targetName = "Pallets", "Pallet"
elseif string.find(nameLower, "pumpkin") and obj:FindFirstChild("HB") and obj:FindFirstChild("shell") then
targetType, targetName = "Pumpkins", obj.Name
elseif (string.find(nameLower, "zombie") or string.find(nameLower, "scp")) then
if obj:FindFirstChildOfClass("Humanoid") then table.insert(Cache.CachedZombies, obj) end
targetType, targetName = "Zombies", obj.Name
end
if targetType then
local targetPart = GetWorldTargetPart(obj, targetType)
if targetType == "Windows" or targetType == "Pallets" then
for _, v in pairs(obj:GetDescendants()) do
if v:IsA("BasePart") and v.Transparency >= 1 then v.Transparency = 0.99 end
end
end
Cache.ValidWorldObjects[obj] = {Type = targetType, Name = targetName, TargetPart = targetPart or obj}
end
end
end
local function RemoveMapObject(obj)
if Cache.ValidWorldObjects[obj] then
if Cache.WorldESPInstances[obj] then
if Cache.WorldESPInstances[obj].Highlight then Cache.WorldESPInstances[obj].Highlight:Destroy() end
if Cache.WorldESPInstances[obj].Billboard then Cache.WorldESPInstances[obj].Billboard:Destroy() end
Cache.WorldESPInstances[obj] = nil
end
Cache.ValidWorldObjects[obj] = nil
end
end
local function InitMapScanner()
table.clear(Cache.ValidWorldObjects)
table.clear(Cache.CachedZombies)
for _, inst in pairs(Cache.WorldESPInstances) do
if inst.Highlight then inst.Highlight:Destroy() end
if inst.Billboard then inst.Billboard:Destroy() end
end
table.clear(Cache.WorldESPInstances)
for _, conn in ipairs(Cache.mapConnections) do conn:Disconnect() end
table.clear(Cache.mapConnections)
local currentMap = workspace:FindFirstChild("Map")
if not currentMap then return end
for _, obj in ipairs(currentMap:GetDescendants()) do ProcessMapObject(obj) end
table.insert(Cache.mapConnections, currentMap.DescendantAdded:Connect(ProcessMapObject))
table.insert(Cache.mapConnections, currentMap.DescendantRemoving:Connect(RemoveMapObject))
end
workspace.ChildAdded:Connect(function(child)
if child.Name == "Map" then
task.wait(2)
InitMapScanner()
end
end)
task.spawn(InitMapScanner)
local function GetGeneratorInfo(model)
local pct = tonumber(model:GetAttribute("RepairProgress") or model:GetAttribute("Progress")) or 0
if pct >= 0 and pct <= 1.001 then pct = pct * 100 end
pct = math.clamp(pct, 0, 100)
local repairers = tonumber(model:GetAttribute("PlayersRepairingCount")) or 0
local paused = model:GetAttribute("ProgressPaused") == true
local kickcount = tonumber(model:GetAttribute("kickcount") or model:GetAttribute("KickCount")) or 0
local parts = { "Gen " .. tostring(math.floor(pct + 0.5)) .. "%" }
if repairers > 0 then table.insert(parts, "(" .. repairers .. "p)") end
if paused then table.insert(parts, "Pause") end
if kickcount > 0 then table.insert(parts, "K:" .. kickcount) end
local hue = math.clamp((pct / 100) * 0.33, 0, 0.33)
return table.concat(parts, " "), Color3.fromHSV(hue, 1, 1)
end
local function UpdateWorldESP()
if not VDSettings.WorldESP.Enabled then
for obj, inst in pairs(Cache.WorldESPInstances) do
if inst.Highlight then inst.Highlight:Destroy() end
if inst.Billboard then inst.Billboard:Destroy() end
end
table.clear(Cache.WorldESPInstances)
return
end
local localRoot = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
for obj, data in pairs(Cache.ValidWorldObjects) do
if obj and obj.Parent then
if VDSettings.WorldESP.Targets[data.Type] then
if not Cache.WorldESPInstances[obj] then
Cache.WorldESPInstances[obj] = {}
local targetPart = data.TargetPart
local highlight = Instance.new("Highlight")
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlight.Adornee = obj
highlight.Parent = CoreGui
Cache.WorldESPInstances[obj].Highlight = highlight
local billboard = Instance.new("BillboardGui")
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(0, 200, 0, 50)
billboard.StudsOffset = Vector3.new(0, 3, 0)
billboard.Adornee = targetPart
billboard.Parent = CoreGui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Font = Enum.Font.GothamBold
textLabel.TextStrokeTransparency = 0
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextYAlignment = Enum.TextYAlignment.Bottom
textLabel.Parent = billboard
Cache.WorldESPInstances[obj].Billboard = billboard
Cache.WorldESPInstances[obj].Text = textLabel
end
local espColor = VDSettings.WorldESP.Colors[data.Type]
local displayText = data.Name
if data.Type == "Generators" then
local genText, genColor = GetGeneratorInfo(obj)
displayText = genText
espColor = genColor
end
local hl = Cache.WorldESPInstances[obj].Highlight
hl.FillColor = espColor
hl.OutlineColor = espColor
hl.FillTransparency = VDSettings.ESP.FillTrans
hl.OutlineTransparency = VDSettings.ESP.OutlineTrans
local bb = Cache.WorldESPInstances[obj].Billboard
local txt = Cache.WorldESPInstances[obj].Text
local dist = 0
if localRoot and data.TargetPart then
local partPos = data.TargetPart:IsA("Model") and data.TargetPart:GetPivot().Position or data.TargetPart.Position
dist = math.floor((localRoot.Position - partPos).Magnitude)
end
local withinDist = dist <= (VDSettings.WorldESP.MaxDistance or 150)
local isAlwaysVisible = (data.Type == "Generators" or data.Type == "Gates")
local isVisible = withinDist or isAlwaysVisible
hl.Enabled = isVisible
if (VDSettings.WorldESP.ShowName or VDSettings.WorldESP.ShowDistance) and isVisible then
bb.Enabled = true
txt.TextSize = VDSettings.ESP.TextSize
txt.TextColor3 = espColor
local finalString = ""
if VDSettings.WorldESP.ShowName then finalString = displayText end
if VDSettings.WorldESP.ShowDistance then
finalString = (finalString ~= "" and (finalString .. "\n[" .. dist .. "m]") or ("[" .. dist .. "m]"))
end
txt.Text = finalString
else
bb.Enabled = false
end
else
if Cache.WorldESPInstances[obj] then
if Cache.WorldESPInstances[obj].Highlight then Cache.WorldESPInstances[obj].Highlight:Destroy() end
if Cache.WorldESPInstances[obj].Billboard then Cache.WorldESPInstances[obj].Billboard:Destroy() end
Cache.WorldESPInstances[obj] = nil
end
end
end
end
for obj, inst in pairs(Cache.WorldESPInstances) do
if not Cache.ValidWorldObjects[obj] or not obj.Parent or not VDSettings.WorldESP.Targets[Cache.ValidWorldObjects[obj].Type] then
if inst.Highlight then inst.Highlight:Destroy() end
if inst.Billboard then inst.Billboard:Destroy() end
Cache.WorldESPInstances[obj] = nil
end
end
end
local function UpdateCamera()
local cam = workspace.CurrentCamera
if not cam then return end
if VDSettings.Camera.FOVEnabled then
if cam.FieldOfView ~= VDSettings.Camera.FOVValue then
cam.FieldOfView = VDSettings.Camera.FOVValue
end
end
if VDSettings.Camera.UnlockZoom then
Players.LocalPlayer.CameraMinZoomDistance = 0.5
Players.LocalPlayer.CameraMaxZoomDistance = VDSettings.Camera.MaxZoom
end
if VDSettings.Camera.DBDCam then
local targetCFrame = cam.CFrame
local smoothPos = Cache.lastCamCFrame.Position:Lerp(targetCFrame.Position, VDSettings.Camera.DBDSmoothness)
cam.CFrame = CFrame.new(smoothPos) * targetCFrame.Rotation
Cache.lastCamCFrame = cam.CFrame
else
Cache.lastCamCFrame = cam.CFrame
end
end
local Lighting = game:GetService("Lighting")
local function ProcessEffect(v)
if v:IsA("PostEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") then
if Cache.VFX[v] == nil then Cache.VFX[v] = {Type = "Effect", Enabled = v.Enabled} end
pcall(function() v.Enabled = false end)
elseif v:IsA("Atmosphere") or v:IsA("Clouds") or v:IsA("Sky") then
if Cache.VFX[v] == nil then Cache.VFX[v] = {Type = "Atmosphere", Parent = v.Parent} end
pcall(function() v.Parent = nil end)
end
end
local function ProcessGUI(gui)
local n = string.lower(gui.Name)
if (gui:IsA("ScreenGui") or gui:IsA("ImageLabel")) and (
string.find(n, "film") or string.find(n, "grain") or string.find(n, "noise") or
string.find(n, "blink") or string.find(n, "effect") or string.find(n, "misc") or
string.find(n, "vignette") or n == "darkness"
) then
pcall(function()
if gui:IsA("ScreenGui") then
if Cache.GUI[gui] == nil then Cache.GUI[gui] = gui.Enabled end
gui.Enabled = false
else
if Cache.GUI[gui] == nil then Cache.GUI[gui] = gui.Visible end
gui.Visible = false
end
end)
end
end
local OrigFog = { Saved = false }
local isApplyingFog = false
local function ApplyNoFog(state)
if state then
isApplyingFog = true
if not OrigFog.Saved then
OrigFog.FogStart = Lighting.FogStart
OrigFog.FogEnd = Lighting.FogEnd
OrigFog.Saved = true
end
Lighting.FogEnd = 100000
Lighting.FogStart = 100000
for _, v in ipairs(Lighting:GetChildren()) do ProcessEffect(v) end
if workspace.CurrentCamera then
for _, v in ipairs(workspace.CurrentCamera:GetChildren()) do ProcessEffect(v) end
end
local pGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
if pGui then for _, gui in ipairs(pGui:GetDescendants()) do ProcessGUI(gui) end end
local lp = Players.LocalPlayer
if lp then
if OrigFog.filmgrain == nil then OrigFog.filmgrain = lp:GetAttribute("filmgrain") end
if OrigFog.epilepsymode == nil then OrigFog.epilepsymode = lp:GetAttribute("epilepsymode") end
lp:SetAttribute("noshadows", true)
lp:SetAttribute("filmgrain", false)
lp:SetAttribute("epilepsymode", false)
end
isApplyingFog = false
else
isApplyingFog = true
if OrigFog.Saved then
Lighting.FogStart = OrigFog.FogStart
Lighting.FogEnd = OrigFog.FogEnd
OrigFog.Saved = false
else
Lighting.FogStart = 0
Lighting.FogEnd = 10000
end
local lp = Players.LocalPlayer
if lp then
lp:SetAttribute("noshadows", false)
if OrigFog.filmgrain ~= nil then lp:SetAttribute("filmgrain", OrigFog.filmgrain) end
if OrigFog.epilepsymode ~= nil then lp:SetAttribute("epilepsymode", OrigFog.epilepsymode) end
OrigFog.filmgrain = nil
OrigFog.epilepsymode = nil
end
for obj, data in pairs(Cache.VFX) do
if obj then
pcall(function()
if data.Type == "Atmosphere" then obj.Parent = data.Parent else obj.Enabled = data.Enabled end
end)
end
end
table.clear(Cache.VFX)
for guiObj, wasEnabled in pairs(Cache.GUI) do
if guiObj then
pcall(function()
if guiObj:IsA("ScreenGui") then guiObj.Enabled = wasEnabled else guiObj.Visible = wasEnabled end
end)
end
end
table.clear(Cache.GUI)
isApplyingFog = false
end
end
Lighting.DescendantAdded:Connect(function(child) if VDSettings.Lighting.NoFog then task.defer(ProcessEffect, child) end end)
if workspace.CurrentCamera then
workspace.CurrentCamera.DescendantAdded:Connect(function(child) if VDSettings.Lighting.NoFog then task.defer(ProcessEffect, child) end end)
end
task.spawn(function()
local pGui = Players.LocalPlayer:WaitForChild("PlayerGui", 5)
if pGui then pGui.DescendantAdded:Connect(function(child) if VDSettings.Lighting.NoFog then task.defer(ProcessGUI, child) end end) end
end)
local OrigLighting = { Saved = false }
local isApplyingLight = false
local function ApplyFullbright()
if isApplyingLight then return end
if VDSettings.Lighting.Fullbright then
isApplyingLight = true
pcall(function()
if not OrigLighting.Saved then
OrigLighting.Ambient = Lighting.Ambient
OrigLighting.OutdoorAmbient = Lighting.OutdoorAmbient
OrigLighting.ColorShift_Bottom = Lighting.ColorShift_Bottom
OrigLighting.ColorShift_Top = Lighting.ColorShift_Top
OrigLighting.Brightness = Lighting.Brightness
OrigLighting.ClockTime = Lighting.ClockTime
OrigLighting.ExposureCompensation = Lighting.ExposureCompensation
OrigLighting.GlobalShadows = Lighting.GlobalShadows
OrigLighting.Saved = true
end
local val = VDSettings.Lighting.FullbrightValue
local col = Color3.fromRGB(val, val, val)
if Lighting.Ambient ~= col then Lighting.Ambient = col end
if Lighting.OutdoorAmbient ~= col then Lighting.OutdoorAmbient = col end
if Lighting.ColorShift_Bottom ~= col then Lighting.ColorShift_Bottom = col end
if Lighting.ColorShift_Top ~= col then Lighting.ColorShift_Top = col end
if Lighting.Brightness ~= 2 then Lighting.Brightness = 2 end
if Lighting.ClockTime ~= 12 then Lighting.ClockTime = 12 end
if Lighting.ExposureCompensation ~= 0 then Lighting.ExposureCompensation = 0 end
if Lighting.GlobalShadows ~= false then Lighting.GlobalShadows = false end
end)
isApplyingLight = false
else
if OrigLighting.Saved then
isApplyingLight = true
pcall(function()
Lighting.Ambient = OrigLighting.Ambient
Lighting.OutdoorAmbient = OrigLighting.OutdoorAmbient
Lighting.ColorShift_Bottom = OrigLighting.ColorShift_Bottom
Lighting.ColorShift_Top = OrigLighting.ColorShift_Top
Lighting.Brightness = OrigLighting.Brightness
Lighting.ClockTime = OrigLighting.ClockTime
Lighting.ExposureCompensation = OrigLighting.ExposureCompensation
Lighting.GlobalShadows = OrigLighting.GlobalShadows
OrigLighting.Saved = false
end)
isApplyingLight = false
end
end
end
Lighting.Changed:Connect(function(prop)
if VDSettings.Lighting.Fullbright and not isApplyingLight then
if prop == "Ambient" or prop == "OutdoorAmbient" or prop == "Brightness" or prop == "ClockTime" or prop == "GlobalShadows" or prop == "ExposureCompensation" then
ApplyFullbright()
end
end
if VDSettings.Lighting.NoFog and not isApplyingFog then
if prop == "FogEnd" or prop == "FogStart" then
isApplyingFog = true
Lighting.FogEnd = 100000
Lighting.FogStart = 100000
isApplyingFog = false
end
end
end)
local PerfState = {
TextureOn = false,
TreeOn = false,
Parts = setmetatable({}, {__mode = "k"}),
Decals = setmetatable({}, {__mode = "k"}),
Textures = setmetatable({}, {__mode = "k"}),
SurfAppearances = setmetatable({}, {__mode = "k"}),
Atmospheres = setmetatable({}, {__mode = "k"}),
TreeParts = setmetatable({}, {__mode = "k"}),
TreeVFX = setmetatable({}, {__mode = "k"}),
TerrainSaved = false,
EnvSaved = false,
EnvDiffuse = 0,
EnvSpecular = 0,
T_WaterWaveSize = 0,
T_WaterWaveSpeed = 0,
T_WaterReflectance = 0,
T_WaterTransparency = 1,
T_Decoration = true
}
local function PerfIsLeafName(n, parentName)
n = string.lower(n)
if parentName then parentName = string.lower(parentName) end
if string.find(n, "bark") or string.find(n, "trunk") or string.find(n, "branch") or string.find(n, "wood") or string.find(n, "stem") or string.find(n, "pole") then
return false
end
if string.find(n, "leaf") or string.find(n, "leaves") or string.find(n, "bush") or string.find(n, "foliage") or string.find(n, "canopy") or string.find(n, "grass") or string.find(n, "ivy") or string.find(n, "vine") or string.find(n, "plant") or string.find(n, "ttrarrar") or string.find(n, "snake plant") then
return true
end
if string.find(n, "plane") or string.find(n, "material") or string.find(n, "meshpart") then
if parentName and (string.find(parentName, "tree") or string.find(parentName, "bush") or string.find(parentName, "plant") or string.find(parentName, "ivy") or string.find(parentName, "leaf")) then
return true
end
end
return false
end
local function PerfIsGrassName(n)
n = string.lower(n)
return string.find(n, "grass") ~= nil
or string.find(n, "ivy") ~= nil
or string.find(n, "vine") ~= nil
or string.find(n, "plant") ~= nil
end
local function ApplyPerfReduceTexture(state)
task.spawn(function()
if state and not PerfState.TextureOn then
PerfState.TextureOn = true
if not PerfState.TerrainSaved then
pcall(function()
PerfState.T_WaterWaveSize = workspace.Terrain.WaterWaveSize
PerfState.T_WaterWaveSpeed = workspace.Terrain.WaterWaveSpeed
PerfState.T_WaterReflectance = workspace.Terrain.WaterReflectance
PerfState.T_WaterTransparency = workspace.Terrain.WaterTransparency
PerfState.T_Decoration = workspace.Terrain.Decoration
end)
PerfState.TerrainSaved = true
end
pcall(function()
workspace.Terrain.WaterWaveSize = 0
workspace.Terrain.WaterWaveSpeed = 0
workspace.Terrain.WaterReflectance = 0
workspace.Terrain.WaterTransparency = 1
workspace.Terrain.Decoration = false
for _, mat in ipairs(Enum.Material:GetEnumItems()) do
workspace.Terrain:SetMaterialColor(mat, Color3.fromRGB(150, 150, 150))
end
end)
if not PerfState.EnvSaved then
PerfState.EnvDiffuse = Lighting.EnvironmentDiffuseScale
PerfState.EnvSpecular = Lighting.EnvironmentSpecularScale
PerfState.EnvSaved = true
end
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0
local descendants = workspace:GetDescendants()
for i, v in ipairs(descendants) do
if not PerfState.TextureOn then break end
if v:IsA("BasePart") then
if not PerfState.Parts[v] then
PerfState.Parts[v] = {
Material = v.Material,
Reflectance = v.Reflectance,
CastShadow = v.CastShadow,
Transparency = v.Transparency,
GrassHidden = false
}
end
pcall(function()
v.Material = Enum.Material.SmoothPlastic
v.Reflectance = 0
v.CastShadow = false
if PerfIsGrassName(v.Name) then
v.Transparency = 1
v.CanCollide = false
v.CanTouch = false
PerfState.Parts[v].GrassHidden = true
end
end)
elseif v:IsA("Decal") then
if PerfState.Decals[v] == nil then PerfState.Decals[v] = v.Transparency end
pcall(function() v.Transparency = 1 end)
elseif v:IsA("Texture") then
if PerfState.Textures[v] == nil then PerfState.Textures[v] = v.Transparency end
pcall(function() v.Transparency = 1 end)
elseif v:IsA("SurfaceAppearance") then
if PerfState.SurfAppearances[v] == nil then PerfState.SurfAppearances[v] = v.Parent end
pcall(function() v.Parent = nil end)
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
pcall(function() v.Enabled = false end)
elseif v:IsA("Clouds") or v:IsA("Atmosphere") then
if PerfState.Atmospheres[v] == nil then PerfState.Atmospheres[v] = v.Parent end
pcall(function() v.Parent = nil end)
end
if i % 400 == 0 then task.wait() end
end
elseif not state and PerfState.TextureOn then
PerfState.TextureOn = false
if PerfState.TerrainSaved then
pcall(function()
workspace.Terrain.WaterWaveSize = PerfState.T_WaterWaveSize
workspace.Terrain.WaterWaveSpeed = PerfState.T_WaterWaveSpeed
workspace.Terrain.WaterReflectance = PerfState.T_WaterReflectance
workspace.Terrain.WaterTransparency = PerfState.T_WaterTransparency
workspace.Terrain.Decoration = PerfState.T_Decoration
end)
PerfState.TerrainSaved = false
end
if PerfState.EnvSaved then
Lighting.EnvironmentDiffuseScale = PerfState.EnvDiffuse
Lighting.EnvironmentSpecularScale = PerfState.EnvSpecular
PerfState.EnvSaved = false
end
for atmo, parent in pairs(PerfState.Atmospheres) do
if atmo then pcall(function() atmo.Parent = parent end) end
end
table.clear(PerfState.Atmospheres)
local count = 0
for part, data in pairs(PerfState.Parts) do
if part and part.Parent then
pcall(function()
part.Material = data.Material
part.Reflectance = data.Reflectance
part.CastShadow = data.CastShadow
if data.GrassHidden then
part.Transparency = data.Transparency
part.CanCollide = true
part.CanTouch = true
end
end)
end
count = count + 1
if count % 400 == 0 then task.wait() end
end
table.clear(PerfState.Parts)
for d, t in pairs(PerfState.Decals) do
if d and d.Parent then pcall(function() d.Transparency = t end) end
end
table.clear(PerfState.Decals)
for t, v in pairs(PerfState.Textures) do
if t and t.Parent then pcall(function() t.Transparency = v end) end
end
table.clear(PerfState.Textures)
for s, p in pairs(PerfState.SurfAppearances) do
if s then pcall(function() s.Parent = p end) end
end
table.clear(PerfState.SurfAppearances)
end
end)
end
local function ApplyPerfRemoveTree(state)
task.spawn(function()
if state and not PerfState.TreeOn then
PerfState.TreeOn = true
local descendants = workspace:GetDescendants()
for i, v in ipairs(descendants) do
if not PerfState.TreeOn then break end
if v:IsA("BasePart") then
local pName = v.Parent and v.Parent.Name or ""
if PerfIsLeafName(v.Name, pName) then
if not PerfState.TreeParts[v] then
PerfState.TreeParts[v] = {
Transparency = v.Transparency,
CanCollide = v.CanCollide,
CanTouch = v.CanTouch
}
end
pcall(function()
v.Transparency = 1
v.CanCollide = false
v.CanTouch = false
end)
end
elseif v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
local pName = v.Parent and v.Parent.Name or ""
if PerfIsLeafName(v.Name, pName) or PerfIsLeafName(pName) then
if PerfState.TreeVFX[v] == nil then PerfState.TreeVFX[v] = v.Enabled end
pcall(function() v.Enabled = false end)
end
end
if i % 400 == 0 then task.wait() end
end
elseif not state and PerfState.TreeOn then
PerfState.TreeOn = false
local count = 0
for part, data in pairs(PerfState.TreeParts) do
if part and part.Parent then
pcall(function()
part.Transparency = data.Transparency
part.CanCollide = data.CanCollide
part.CanTouch = data.CanTouch
end)
end
count = count + 1
if count % 400 == 0 then task.wait() end
end
table.clear(PerfState.TreeParts)
for vfx, en in pairs(PerfState.TreeVFX) do
if vfx and vfx.Parent then pcall(function() vfx.Enabled = en end) end
end
table.clear(PerfState.TreeVFX)
end
end)
end
task.spawn(function()
while task.wait(1) do
if VDSettings.Misc.SkipCutscene then
pcall(function()
local map = workspace:FindFirstChild("Map")
if map then
local endscreenFolder = map:FindFirstChild("endscreen", true)
if endscreenFolder then
for _, obj in ipairs(endscreenFolder:GetDescendants()) do
if obj:IsA("LocalScript") then obj.Disabled = true end
end
endscreenFolder:Destroy()
end
end
local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
if PlayerGui then
local endScreenUI = PlayerGui:FindFirstChild("EndScreen")
if endScreenUI and endScreenUI:IsA("ScreenGui") then endScreenUI:Destroy() end
end
local cam = workspace.CurrentCamera
if cam and cam.CameraType == Enum.CameraType.Scriptable then cam.CameraType = Enum.CameraType.Custom end
end)
end
end
end)
local function getSkillCheckUI()
local pGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
if not pGui then return nil, nil end
local prompt = pGui:FindFirstChild("SkillCheckPromptGui") or pGui:FindFirstChild("SkillCheckPromptGui-con")
if prompt then
local check = prompt:FindFirstChild("Check")
if check and check.Visible then
return check:FindFirstChild("Line", true), check:FindFirstChild("Goal", true)
end
end
return nil, nil
end
local function doSkillCheckClick()
local pGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
local mobileBtn = nil
if pGui then
local survivorMob = pGui:FindFirstChild("Survivor-mob", true)
if survivorMob then
local controls = survivorMob:FindFirstChild("Controls", true)
if controls then
mobileBtn = controls:FindFirstChild("action") or controls:FindFirstChild("Gui-mob")
end
end
end
if mobileBtn and type(firesignal) == "function" then
firesignal(mobileBtn.MouseButton1Down)
task.delay(0.05, function()
if mobileBtn and mobileBtn.Parent then
firesignal(mobileBtn.MouseButton1Up)
firesignal(mobileBtn.MouseButton1Click)
end
end)
else
vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.01)
vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end
end
local function UpdateAutoSkillCheck()
if VDSettings.Survivor.AutoSkillMode == "Disabled" then return end
local line, goal = getSkillCheckUI()
if not (line and goal) then
Cache.instantLastVisible = false
Cache.lastGoalRot = nil
Cache.prevRot = nil
return
end
local lineRot = line.Rotation
local goalRot = goal.Rotation
local now = tick()
if now - Cache.lastPressTime < 0.15 then
Cache.prevRot = lineRot
return
end
if VDSettings.Survivor.AutoSkillMode == "Instant" then
if not Cache.instantLastVisible or goalRot ~= Cache.lastGoalRot then
line.Rotation = goalRot + 109
Cache.lastGoalRot = goalRot
Cache.instantLastVisible = true
Cache.lastPressTime = now
doSkillCheckClick()
end
else
local relRot = (lineRot - goalRot) % 360
local prevRelRot = -1
if Cache.prevRot and Cache.lastGoalRot == goalRot then
prevRelRot = (Cache.prevRot - goalRot) % 360
end
Cache.lastGoalRot = goalRot
local minRot, maxRot
if VDSettings.Survivor.AutoSkillMode == "Perfect" then
minRot, maxRot = 104, 114
elseif VDSettings.Survivor.AutoSkillMode == "Normal" then
minRot, maxRot = 114, 155
else
return
end
local inside = relRot >= minRot and relRot <= maxRot
local skipped = prevRelRot >= 0 and prevRelRot < minRot and relRot > maxRot
if inside or skipped then
if skipped then
line.Rotation = goalRot + ((minRot + maxRot) / 2)
end
Cache.lastPressTime = now
doSkillCheckClick()
end
end
Cache.prevRot = lineRot
end
local RepairEvent = nil
pcall(function() RepairEvent = repStorage.Remotes.Generator.RepairEvent end)
local function GetAllGenerators()
local now = tick()
if now - Cache.GenCacheTimer < 5 then return Cache.GenCache end
Cache.GenCache = {}
Cache.GenCacheTimer = now
for obj, data in pairs(Cache.ValidWorldObjects) do
if data.Type == "Generators" and obj.Parent then
local isRealGen = obj:GetAttribute("RepairProgress") ~= nil
or obj:GetAttribute("kickcount") ~= nil
or obj:GetAttribute("ProgressRepair") ~= nil
if isRealGen then
table.insert(Cache.GenCache, obj)
end
end
end
return Cache.GenCache
end
local function PlayRepairAnim()
local char = Players.LocalPlayer.Character
if not char then return end
local hum = char:FindFirstChildOfClass("Humanoid")
local animator = hum and hum:FindFirstChildOfClass("Animator")
if not animator then return end
if Cache.RepairAnimTrack and Cache.RepairAnimTrack.IsPlaying then return end
pcall(function()
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://92960319113695"
Cache.RepairAnimTrack = animator:LoadAnimation(anim)
Cache.RepairAnimTrack.Priority = Enum.AnimationPriority.Action
Cache.RepairAnimTrack:Play()
end)
end
local function StopRepairAnim()
if Cache.RepairAnimTrack and Cache.RepairAnimTrack.IsPlaying then
pcall(function() Cache.RepairAnimTrack:Stop() end)
end
Cache.RepairAnimTrack = nil
end
local function GetGeneratorPoints(genModel)
local points = {}
pcall(function()
for _, obj in pairs(genModel:GetChildren()) do
if obj.Name:find("GeneratorPoint") and obj:IsA("BasePart") then
table.insert(points, obj)
end
end
end)
return points
end
local function StopAutoRepair()
StopRepairAnim()
local pointToStop = Cache.AutoCurrentPoint
Cache.AutoCurrentPoint = nil
if pointToStop and RepairEvent then
pcall(function() RepairEvent:FireServer(pointToStop, false) end)
end
end
local function StartAutoRepairLoop(genModel)
Cache.AutoCurrentGenModel = genModel
if Cache.AutoRepairThread then
task.cancel(Cache.AutoRepairThread)
Cache.AutoRepairThread = nil
end
StopAutoRepair()
Cache.AutoRepairThread = task.spawn(function()
while Cache.AutoRepairEnabled and VDSettings.Survivor.BoostGenEnabled do
local char = Players.LocalPlayer.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
if not hrp then task.wait(0.1) continue end
local foundPoint = nil
for _, gen in pairs(GetAllGenerators()) do
for _, point in pairs(GetGeneratorPoints(gen)) do
if (hrp.Position - point.Position).Magnitude <= 5 then
foundPoint = point
break
end
end
if foundPoint then break end
end
if foundPoint then
Cache.AutoCurrentPoint = foundPoint
local now = tick()
if now - Cache.LastFireTime >= Cache.AutoFireInterval then
PlayRepairAnim()
if RepairEvent then pcall(function() RepairEvent:FireServer(foundPoint, true) end) end
Cache.LastFireTime = now
end
else
if Cache.AutoCurrentPoint then
StopAutoRepair()
Cache.AutoRepairEnabled = false
if Cache.AutoCurrentGenModel then
Cache.ProcessedGens[Cache.AutoCurrentGenModel] = nil
Cache.AutoCurrentGenModel = nil
end
break
end
end
task.wait(0.1)
end
StopAutoRepair()
end)
end
local function waitForRepairing(point, timeout)
local start = tick()
while tick() - start < (timeout or 1) do
if point:GetAttribute("IsRepairing") == true then return true end
task.wait(0.05)
end
return false
end
local function DoMultiRepairPlain(targetPoint)
local genModel = targetPoint.Parent
if Cache.ProcessedGens[genModel] then return end
Cache.ProcessedGens[genModel] = true
local allPoints = GetGeneratorPoints(genModel)
local character = Players.LocalPlayer.Character
local hrp = character and character:FindFirstChild("HumanoidRootPart")
if not hrp or not RepairEvent then Cache.ProcessedGens[genModel] = nil return end
local originalCFrame = hrp.CFrame
local ok = pcall(function()
for _, point in pairs(allPoints) do
if point ~= targetPoint and point.Parent then
hrp.Anchored = true
hrp.CFrame = point.CFrame
task.wait(0.15)
pcall(function() RepairEvent:FireServer(point, true) end)
if not waitForRepairing(point, 0.8) then
pcall(function() RepairEvent:FireServer(point, false) end)
task.wait(0.1)
hrp.CFrame = point.CFrame
task.wait(0.15)
pcall(function() RepairEvent:FireServer(point, true) end)
waitForRepairing(point, 0.5)
end
hrp.Anchored = false
task.wait(0.05)
end
end
end)
pcall(function()
if hrp and hrp.Parent then
hrp.Anchored = false
hrp.CFrame = originalCFrame
end
end)
task.wait(0.1)
if VDSettings.Survivor.BypassGenMode == "Manual Repair" then
pcall(function() RepairEvent:FireServer(targetPoint, false) end)
elseif VDSettings.Survivor.BypassGenMode == "Auto Repair" then
Cache.AutoRepairEnabled = true
StartAutoRepairLoop(genModel)
end
end
task.spawn(function()
while true do
task.wait(2)
local character = Players.LocalPlayer.Character
local hrp = character and character:FindFirstChild("HumanoidRootPart")
if not hrp then continue end
for genModel in pairs(Cache.ProcessedGens) do
if not genModel or not genModel.Parent then
Cache.ProcessedGens[genModel] = nil
continue
end
local points = GetGeneratorPoints(genModel)
local nearAny = false
for _, point in pairs(points) do
if point.Parent and (hrp.Position - point.Position).Magnitude <= 10 then
nearAny = true
break
end
end
if not nearAny then
Cache.ProcessedGens[genModel] = nil
end
end
end
end)
local function loadBypassButtonPosition()
local pos = nil
pcall(function()
if isfile and readfile and isfile(Cache.DragConfigPath) then
local raw = readfile(Cache.DragConfigPath)
local data = HttpService:JSONDecode(raw)
if data and data.XScale ~= nil and data.XOffset ~= nil and data.YScale ~= nil and data.YOffset ~= nil then
pos = UDim2.new(data.XScale, data.XOffset, data.YScale, data.YOffset)
end
end
end)
return pos
end
local function saveBypassButtonPosition(udim2Pos)
pcall(function()
if writefile then
writefile(Cache.DragConfigPath, HttpService:JSONEncode({
XScale  = udim2Pos.X.Scale,
XOffset = udim2Pos.X.Offset,
YScale  = udim2Pos.Y.Scale,
YOffset = udim2Pos.Y.Offset,
}))
end
end)
end
local function ToggleBoostGenUI(state)
if not state then
Cache.ProcessedGens = {}
Cache.AutoRepairEnabled = false
Cache.AutoCurrentGenModel = nil
if Cache.AutoRepairThread then
task.cancel(Cache.AutoRepairThread)
Cache.AutoRepairThread = nil
end
StopAutoRepair()
end
if Cache.FloatingGenUI then
Cache.FloatingGenUI:Destroy()
Cache.FloatingGenUI = nil
end
pcall(function()
if CoreGui:FindFirstChild("BoostGenFloatingUI") then CoreGui.BoostGenFloatingUI:Destroy() end
if Players.LocalPlayer:FindFirstChild("PlayerGui") and Players.LocalPlayer.PlayerGui:FindFirstChild("BoostGenFloatingUI") then
Players.LocalPlayer.PlayerGui.BoostGenFloatingUI:Destroy()
end
end)
if state then
Cache.FloatingGenUI = Instance.new("ScreenGui")
Cache.FloatingGenUI.Name = "BoostGenFloatingUI"
Cache.FloatingGenUI.ResetOnSpawn = false
Cache.FloatingGenUI.DisplayOrder = 9999
pcall(function() Cache.FloatingGenUI.Parent = (gethui and gethui() or CoreGui) end)
if not Cache.FloatingGenUI.Parent then
Cache.FloatingGenUI.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end
local GenBtn = Instance.new("ImageButton")
GenBtn.Name = "GenButton"
GenBtn.Size = UDim2.new(0, 75, 0, 75)
GenBtn.AnchorPoint = Vector2.new(1, 0.5)
local savedPos = loadBypassButtonPosition()
GenBtn.Position = savedPos or UDim2.new(1, -20, 0.5, 0)
GenBtn.BackgroundTransparency = 1
GenBtn.Image = "rbxassetid://73955247819019"
GenBtn.ScaleType = Enum.ScaleType.Fit
GenBtn.BorderSizePixel = 0
GenBtn.AutoButtonColor = false
GenBtn.Active = true
GenBtn.ZIndex = 2
GenBtn.Parent = Cache.FloatingGenUI
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.5, 0)
corner.Parent = GenBtn
local function updateButtonColor()
if not GenBtn then return end
local char = Players.LocalPlayer.Character
if not char then
GenBtn.ImageColor3 = Color3.new(1, 1, 1)
return
end
local ci = char:FindFirstChild("CheckInterractable")
if not ci then
GenBtn.ImageColor3 = Color3.new(1, 1, 1)
return
end
local repairing = ci:GetAttribute("isRepairing") or ci:GetAttribute("IsRepairing")
GenBtn.ImageColor3 = repairing and Color3.fromRGB(255, 140, 0) or Color3.new(1, 1, 1)
end
local btnCheckConn
local function bindCheck(character)
if not character then return end
local ci = character:WaitForChild("CheckInterractable", 5)
if ci then
if btnCheckConn then btnCheckConn:Disconnect() end
btnCheckConn = ci:GetAttributeChangedSignal("isRepairing"):Connect(updateButtonColor)
ci:GetAttributeChangedSignal("IsRepairing"):Connect(updateButtonColor)
updateButtonColor()
end
end
if Players.LocalPlayer.Character then bindCheck(Players.LocalPlayer.Character) end
Players.LocalPlayer.CharacterAdded:Connect(bindCheck)
local dragging, dragInput, dragStart, startPos
GenBtn.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = GenBtn.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
if dragging then
dragging = false
saveBypassButtonPosition(GenBtn.Position)
end
end
end)
end
end)
GenBtn.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
GenBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
GenBtn.MouseButton1Click:Connect(function()
if not VDSettings.Survivor.BoostGenEnabled then return end
local character = Players.LocalPlayer.Character
local hrp = character and character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
local bestPoint, bestDist = nil, math.huge
for _, gen in pairs(GetAllGenerators()) do
for _, point in pairs(GetGeneratorPoints(gen)) do
local d = (hrp.Position - point.Position).Magnitude
if d < bestDist then
bestDist = d
bestPoint = point
end
end
end
if bestPoint and bestDist <= 8 then
DoMultiRepairPlain(bestPoint)
else
Window:Notify({Title = "Error", Content = "There are no generators near you!", Duration = 3})
end
end)
end
end
local CachedVaultAnim = Instance.new("Animation")
CachedVaultAnim.AnimationId = "rbxassetid://136962284480779"
task.spawn(function()
if not game:IsLoaded() then game.Loaded:Wait() end
local SurvivorAnimationsController = nil
local maxAttempts = 10
local attempts = 0
while not SurvivorAnimationsController and attempts < maxAttempts do
attempts = attempts + 1
local success, result = pcall(function()
local Modules = repStorage:WaitForChild("Modules", 5)
if not Modules then return nil end
local Survivors = Modules:WaitForChild("Survivors", 5)
if not Survivors then return nil end
local Controller = Survivors:WaitForChild("SurvivorAnimationsController", 5)
if not Controller then return nil end
return require(Controller)
end)
if success and result then
SurvivorAnimationsController = result
else
task.wait(1)
end
end
if SurvivorAnimationsController then
local original_isFacingStraightEnough = SurvivorAnimationsController._isFacingStraightEnough
SurvivorAnimationsController._isFacingStraightEnough = function(self, ...)
if VDSettings.Survivor.PerfectVault then
self.characterspeed = 20
return true, 0
end
return original_isFacingStraightEnough(self, ...)
end
if SurvivorAnimationsController._validateFastVault then
local original_validateFastVault = SurvivorAnimationsController._validateFastVault
SurvivorAnimationsController._validateFastVault = function(self, ...)
if VDSettings.Survivor.PerfectVault then
self.characterspeed = 20
return true
end
return original_validateFastVault(self, ...)
end
end
local original_onVaultAnimation = SurvivorAnimationsController._onVaultAnimation
SurvivorAnimationsController._onVaultAnimation = function(self, ...)
if VDSettings.Survivor.PerfectVault then
local args = { ... }
args[2] = true
return original_onVaultAnimation(self, unpack(args))
end
return original_onVaultAnimation(self, ...)
end
end
end)
local function HookSurvivorVault(char)
if not char then return end
local hum = char:WaitForChild("Humanoid", 5)
if not hum then return end
local animator = hum:WaitForChild("Animator", 5)
if not animator then return end
if Cache.FastVaultConn then Cache.FastVaultConn:Disconnect(); Cache.FastVaultConn = nil end
if Cache.FastVaultAnimConn then Cache.FastVaultAnimConn:Disconnect(); Cache.FastVaultAnimConn = nil end
table.clear(Cache.ActiveVaultTracks)
local loadedReplacementTrack = nil
pcall(function()
loadedReplacementTrack = animator:LoadAnimation(CachedVaultAnim)
loadedReplacementTrack.Priority = Enum.AnimationPriority.Action
end)
if VDSettings.Survivor.Flowstate and char:GetAttribute("Flowstate") ~= true then
char:SetAttribute("Flowstate", true)
end
local isSettingFlowstate = false
Cache.FastVaultConn = char:GetAttributeChangedSignal("Flowstate"):Connect(function()
if not VDSettings.Survivor.Flowstate or VDSettings.Survivor.FakePerks.Flowstate then return end
if isSettingFlowstate then return end
if char:GetAttribute("Flowstate") ~= true then
isSettingFlowstate = true
task.defer(function()
if char and char.Parent and VDSettings.Survivor.Flowstate then
char:SetAttribute("Flowstate", true)
end
isSettingFlowstate = false
end)
end
end)
local isReplacingAnim = false
Cache.FastVaultAnimConn = animator.AnimationPlayed:Connect(function(track)
if isReplacingAnim then return end
if not VDSettings.Survivor.Flowstate and not VDSettings.Survivor.PerfectVault then return end
if track == loadedReplacementTrack then return end
local anim = track.Animation
if not anim or not anim.AnimationId then return end
local animId = anim.AnimationId
if VDSettings.Survivor.Flowstate and string.find(animId, "83873880822918", 1, true) then
isReplacingAnim = true
track:Stop(0)
if loadedReplacementTrack then
loadedReplacementTrack:Play(0.05, 1, 1.25)
end
isReplacingAnim = false
elseif VDSettings.Survivor.PerfectVault then
local animName = string.lower(anim.Name or "")
if string.find(animName, "vault", 1, true) or string.find(animName, "jump", 1, true) then
track:AdjustSpeed(1.15)
end
end
end)
end
Players.LocalPlayer.CharacterAdded:Connect(HookSurvivorVault)
if Players.LocalPlayer.Character then HookSurvivorVault(Players.LocalPlayer.Character) end
local function Clip3DLineToScreen(cam, p1, p2)
local camCF = cam.CFrame
local v1 = camCF:PointToObjectSpace(p1)
local v2 = camCF:PointToObjectSpace(p2)
if v1.Z > 0 and v2.Z > 0 then return false, nil, nil end
if v1.Z > 0 then
local t = (-0.1 - v1.Z) / (v2.Z - v1.Z)
v1 = v1:Lerp(v2, t)
elseif v2.Z > 0 then
local t = (-0.1 - v2.Z) / (v1.Z - v2.Z)
v2 = v2:Lerp(v1, t)
end
local wp1 = camCF:PointToWorldSpace(v1)
local wp2 = camCF:PointToWorldSpace(v2)
local s1 = cam:WorldToViewportPoint(wp1)
local s2 = cam:WorldToViewportPoint(wp2)
return true, Vector2.new(s1.X, s1.Y), Vector2.new(s2.X, s2.Y)
end
local function UpdateParryVisuals()
if not VDSettings.Combat.Parry.ShowCircle or not VDSettings.Combat.Parry.Enabled then
if Cache.ParryAdornments then
for _, adorn in pairs(Cache.ParryAdornments) do adorn.Visible = false end
end
return
end
local myChar = Players.LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
if not myRoot then
if Cache.ParryAdornments then
for _, adorn in pairs(Cache.ParryAdornments) do adorn.Visible = false end
end
return
end
local rayOrigin = myRoot.Position
local rayDirection = Vector3.new(0, -10, 0)
local raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {myChar}
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
local hit = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
local floorY = hit and hit.Position.Y or (myRoot.Position.Y - 3)
local basePos = Vector3.new(myRoot.Position.X, floorY + 0.05, myRoot.Position.Z)
local radius = VDSettings.Combat.Parry.Distance
if not Cache.ParryAdornments then Cache.ParryAdornments = {} end
local lineIdx = 1
for i = 0, 350, 20 do
local rad1 = math.rad(i)
local rad2 = math.rad(i + 10)
local p1 = basePos + Vector3.new(math.cos(rad1) * radius, 0, math.sin(rad1) * radius)
local p2 = basePos + Vector3.new(math.cos(rad2) * radius, 0, math.sin(rad2) * radius)
local midPoint = p1:Lerp(p2, 0.5)
local length = (p1 - p2).Magnitude
if not Cache.ParryAdornments[lineIdx] then
local adorn = Instance.new("BoxHandleAdornment")
adorn.Name = "ParryDash" .. lineIdx
adorn.ZIndex = 0
adorn.AlwaysOnTop = false
adorn.Adornee = workspace.Terrain
pcall(function() adorn.Parent = (gethui and gethui() or CoreGui) end)
if not adorn.Parent then adorn.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end
Cache.ParryAdornments[lineIdx] = adorn
end
local adorn = Cache.ParryAdornments[lineIdx]
adorn.Size = Vector3.new(0.15, 0.05, length)
adorn.Color3 = VDSettings.Combat.Parry.Color
adorn.CFrame = CFrame.lookAt(midPoint, p2)
adorn.Visible = true
lineIdx = lineIdx + 1
end
for i = lineIdx, #Cache.ParryAdornments do
if Cache.ParryAdornments[i] then Cache.ParryAdornments[i].Visible = false end
end
end
local function ExecuteParry()
if tick() - Cache.ParryLast < 0.2 then return end
Cache.ParryLast = tick()
local pGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
local mobBtn = pGui and pGui:FindFirstChild("Survivor-mob") and pGui["Survivor-mob"]:FindFirstChild("Controls") and pGui["Survivor-mob"].Controls:FindFirstChild("Gui-mob")
if mobBtn and type(firesignal) == "function" then
firesignal(mobBtn.MouseButton1Down)
task.delay(0.05, function()
if mobBtn and mobBtn.Parent then firesignal(mobBtn.MouseButton1Up) end
end)
else
local parryRemote = repStorage:FindFirstChild("Remotes") and repStorage.Remotes:FindFirstChild("Items") and repStorage.Remotes.Items:FindFirstChild("Parrying Dagger") and repStorage.Remotes.Items["Parrying Dagger"]:FindFirstChild("parry")
if parryRemote then
pcall(function() parryRemote:FireServer() end)
else
vim:SendMouseButtonEvent(0, 0, 1, true, game, 0)
task.wait(0.05)
vim:SendMouseButtonEvent(0, 0, 1, false, game, 0)
end
end
end
local function CheckAndParry(killerChar)
local myChar = Players.LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
local killerRoot = killerChar and killerChar:FindFirstChild("HumanoidRootPart")
if not myRoot or not killerRoot then return end
local dist = (myRoot.Position - killerRoot.Position).Magnitude
if VDSettings.Combat.Parry.Aggressive then
local ping = math.clamp(Players.LocalPlayer:GetNetworkPing(), 0, 0.3)
local killerVel = killerRoot.AssemblyLinearVelocity
local flatVel = Vector3.new(killerVel.X, 0, killerVel.Z)
local predictedPos = killerRoot.Position + (flatVel * ping)
local predictedDist = (myRoot.Position - predictedPos).Magnitude
if predictedDist <= (VDSettings.Combat.Parry.Distance + 2) then
local dirToMe = (myRoot.Position - killerRoot.Position).Unit
if flatVel.Magnitude > 8 and flatVel.Unit:Dot(dirToMe) > 0.5 then
ExecuteParry()
return
end
end
end
if dist <= VDSettings.Combat.Parry.Distance then
ExecuteParry()
end
end
local function TriggerCrouch()
pcall(function()
local b = Players.LocalPlayer:FindFirstChild("PlayerGui")
for segment in string.gmatch("Survivor-mob.Controls.crouch.icon", "[^%.]+") do
if b then b = b:FindFirstChild(segment) end
end
if b and b:IsA("GuiObject") and b.Visible and b.Parent and b.Parent:IsA("GuiButton") then
local btn = b.Parent
if UserInputService.TouchEnabled and type(firesignal) == "function" then
firesignal(btn.MouseButton1Click)
task.wait(1.4)
firesignal(btn.MouseButton1Click)
return
end
end
vim:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
task.wait(1.4)
vim:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
end)
end
local function HookKillerAnimation(killerPlayer)
if killerPlayer == Players.LocalPlayer then return end
local function onCharacterAdded(char)
task.wait(1)
local hum = char:WaitForChild("Humanoid", 3)
if hum then
local animator = hum:WaitForChild("Animator", 3)
if animator then
animator.AnimationPlayed:Connect(function(track)
if track and track.Animation then
local animIdStr = tostring(track.Animation.AnimationId)
if VDSettings.Survivor.AutoCrouch and string.find(animIdStr, "80411309607666") then
local myChar = Players.LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
local kRoot = char:FindFirstChild("HumanoidRootPart")
if myRoot and kRoot then
if (myRoot.Position - kRoot.Position).Magnitude <= 40 then task.spawn(TriggerCrouch) end
end
end
if VDSettings.Combat.Parry.Enabled then
local animType = Cache.KillerAttackAnims[animIdStr]
if animType then
Cache.ActiveAttackers[killerPlayer] = {char = char, track = track, type = animType}
end
end
end
end)
end
end
end
if killerPlayer.Character then onCharacterAdded(killerPlayer.Character) end
killerPlayer.CharacterAdded:Connect(onCharacterAdded)
end
local function UpdateParry()
if not VDSettings.Combat.Parry.Enabled then return end
for plr, data in pairs(Cache.ActiveAttackers) do
if not plr or not plr.Parent or not data.track or not data.track.IsPlaying then
Cache.ActiveAttackers[plr] = nil
else
if data.type == "attack" and data.track.TimePosition < 0.25 then
CheckAndParry(data.char)
elseif data.type == "lungehold" then
CheckAndParry(data.char)
end
end
end
end
local function UpdateUtility()
if tick() - Cache.lastUtilScan < 0.2 then return end
Cache.lastUtilScan = tick()
local myChar = Players.LocalPlayer.Character
local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
if not hum then return end
if hum ~= Cache.lastHum then
Cache.lastHum = hum
Cache.lastGodMode = nil
end
if VDSettings.Survivor.GodMode ~= Cache.lastGodMode then
Cache.lastGodMode = VDSettings.Survivor.GodMode
pcall(function()
hum:SetStateEnabled(Enum.HumanoidStateType.Dead, not VDSettings.Survivor.GodMode)
hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not VDSettings.Survivor.GodMode)
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not VDSettings.Survivor.GodMode)
end)
end
if VDSettings.Survivor.GodMode then
pcall(function()
if hum.Health < hum.MaxHealth and hum.Health > 0 then hum.Health = hum.MaxHealth end
local badStates = {"Injured", "Bleeding", "Hurt", "Broken", "Wounded", "Knocked", "Downed", "Carried", "Grabbed", "Ragdolled", "IsKnocked", "IsCarried", "Disabled", "Stunned"}
for _, attr in ipairs(badStates) do
if myChar:GetAttribute(attr) == true then myChar:SetAttribute(attr, false) end
local val = myChar:FindFirstChild(attr)
if val then
if val:IsA("BoolValue") and val.Value == true then val.Value = false
elseif (val:IsA("NumberValue") or val:IsA("IntValue")) and val.Value ~= 0 then val.Value = 0 end
end
end
if hum.PlatformStand then hum.PlatformStand = false end
if hum.Sit then hum.Sit = false end
hum.AutoRotate = true
end)
end
end
local function ApplyInvisibility()
local char = Players.LocalPlayer.Character
if not char then return end
if VDSettings.Survivor.Invis.State then
for _, v in ipairs(char:GetDescendants()) do
if (v:IsA("BasePart") or v:IsA("Decal")) and v.Name ~= "HumanoidRootPart" then
if not v:GetAttribute("OriTrans") then
v:SetAttribute("OriTrans", v.Transparency)
end
if v:GetAttribute("OriTrans") < 1 then
v.Transparency = 0.5
end
end
end
else
for _, v in ipairs(char:GetDescendants()) do
if (v:IsA("BasePart") or v:IsA("Decal")) and v.Name ~= "HumanoidRootPart" then
local ori = v:GetAttribute("OriTrans")
if ori then v.Transparency = ori end
end
end
end
end
local function SetupHeadIcon(char)
if Cache.HeadIconGui then Cache.HeadIconGui:Destroy(); Cache.HeadIconGui = nil end
if not VDSettings.Survivor.Invis.Enabled then return end
local hrp = char:WaitForChild("HumanoidRootPart", 5)
if not hrp then return end
Cache.HeadIconGui = Instance.new("BillboardGui")
Cache.HeadIconGui.Name = "InvisHeadIcon"
Cache.HeadIconGui.Adornee = hrp
Cache.HeadIconGui.Size = UDim2.new(0, 45, 0, 45)
Cache.HeadIconGui.StudsOffset = Vector3.new(0, 3.5, 0)
Cache.HeadIconGui.AlwaysOnTop = true
Cache.HeadIconGui.Active = true
Cache.HeadIconGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
local btn = Instance.new("ImageButton")
btn.Size = UDim2.new(1, 0, 1, 0)
btn.BackgroundTransparency = 1
btn.Image = VDSettings.Survivor.Invis.State and Cache.ICON_INVISIBLE or Cache.ICON_VISIBLE
btn.ImageColor3 = VDSettings.Survivor.Invis.State and Color3.fromRGB(150, 255, 150) or Color3.fromRGB(255, 255, 255)
btn.Active = true
btn.Parent = Cache.HeadIconGui
btn.Activated:Connect(function()
VDSettings.Survivor.Invis.State = not VDSettings.Survivor.Invis.State
btn.Image = VDSettings.Survivor.Invis.State and Cache.ICON_INVISIBLE or Cache.ICON_VISIBLE
btn.ImageColor3 = VDSettings.Survivor.Invis.State and Color3.fromRGB(150, 255, 150) or Color3.fromRGB(255, 255, 255)
ApplyInvisibility()
end)
end
local function isSlowVaulting(char)
local hum = char:FindFirstChildOfClass("Humanoid")
local animator = hum and hum:FindFirstChildOfClass("Animator")
if animator then
for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
if track.Animation and string.find(tostring(track.Animation.AnimationId), "126081405469607") then
return true
end
end
end
return false
end
local function SetupFakePerks(char)
if not char then return end
for _, conn in pairs(Cache.FakePerksState.conns) do conn:Disconnect() end
Cache.FakePerksState.conns = {}
table.insert(Cache.FakePerksState.conns, char:GetAttributeChangedSignal("isvaulting"):Connect(function()
if not VDSettings.Survivor.FakePerks.QuickRecovery then return end
if char:GetAttribute("isvaulting") == true then
task.spawn(function()
task.wait(0.05)
local isSlow = isSlowVaulting(char)
if not isSlow then task.wait(0.05); isSlow = isSlowVaulting(char) end
if not isSlow and char:GetAttribute("isvaulting") == true then
if Cache.FakePerksState.boostActive then return end
if (tick() - Cache.FakePerksState.lastQR) < VDSettings.Survivor.FakePerks.Cooldown then return end
Cache.FakePerksState.boostActive = true
Cache.FakePerksState.lastQR = tick()
local startTime = tick()
task.spawn(function()
while VDSettings.Survivor.FakePerks.QuickRecovery and (tick() - startTime) < 3 do
if char.Parent then char:SetAttribute("speedboost", 1.4) end
task.wait()
end
if char.Parent then char:SetAttribute("speedboost", 1) end
Cache.FakePerksState.boostActive = false
end)
end
end)
end
end))
table.insert(Cache.FakePerksState.conns, char:GetAttributeChangedSignal("speedboost"):Connect(function()
if not VDSettings.Survivor.FakePerks.PerfectLanding then return end
local currentBoost = char:GetAttribute("speedboost")
if currentBoost == 0.625 then
if Cache.FakePerksState.plBoostActive then return end
if (tick() - Cache.FakePerksState.lastPL) < VDSettings.Survivor.FakePerks.Cooldown then return end
Cache.FakePerksState.plBoostActive = true
Cache.FakePerksState.lastPL = tick()
local startTime = tick()
task.spawn(function()
while VDSettings.Survivor.FakePerks.PerfectLanding and (tick() - startTime) < 3 do
if char.Parent then char:SetAttribute("speedboost", 1.4) end
task.wait()
end
if char.Parent then char:SetAttribute("speedboost", 1) end
Cache.FakePerksState.plBoostActive = false
end)
end
end))
local hum = char:WaitForChild("Humanoid", 3)
local animator = hum and hum:WaitForChild("Animator", 3)
if animator then
table.insert(Cache.FakePerksState.conns, animator.AnimationPlayed:Connect(function(track)
if not VDSettings.Survivor.FakePerks.Flowstate then return end
if track.Animation and string.find(tostring(track.Animation.AnimationId), "136962284480779") then
local stoppedConn
stoppedConn = track.Stopped:Connect(function()
if stoppedConn then stoppedConn:Disconnect() end
Cache.FakePerksState.lastFS = tick()
Cache.FakePerksState.fsOnCooldown = true
if char.Parent then char:SetAttribute("Flowstate", false) end
task.delay(VDSettings.Survivor.FakePerks.Cooldown, function()
Cache.FakePerksState.fsOnCooldown = false
if VDSettings.Survivor.FakePerks.Flowstate and char.Parent then
char:SetAttribute("Flowstate", true)
end
end)
end)
end
end))
end
table.insert(Cache.FakePerksState.conns, char:GetAttributeChangedSignal("Flowstate"):Connect(function()
if not VDSettings.Survivor.FakePerks.Flowstate then return end
local current = char:GetAttribute("Flowstate")
if current == true then
if Cache.FakePerksState.fsOnCooldown or (tick() - Cache.FakePerksState.lastFS) < VDSettings.Survivor.FakePerks.Cooldown then
char:SetAttribute("Flowstate", false)
end
elseif current == false then
if not Cache.FakePerksState.fsOnCooldown and (tick() - Cache.FakePerksState.lastFS) >= VDSettings.Survivor.FakePerks.Cooldown then
char:SetAttribute("Flowstate", true)
end
end
end))
task.wait(0.5)
if VDSettings.Survivor.FakePerks.Flowstate and char.Parent then
char:SetAttribute("Flowstate", true)
end
end
local function CreateTargetModeOverlay()
if Cache.TargetModeGui then Cache.TargetModeGui:Destroy() end
Cache.TargetModeGui = Instance.new("ScreenGui")
Cache.TargetModeGui.Name = "SilentAimTargetOverlay"
Cache.TargetModeGui.ResetOnSpawn = false
Cache.TargetModeGui.Enabled = VDSettings.Aim.SilentAim
pcall(function() Cache.TargetModeGui.Parent = (gethui and gethui() or CoreGui) end)
if not Cache.TargetModeGui.Parent then Cache.TargetModeGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end
local TargetFrame = Instance.new("Frame")
TargetFrame.Size = UDim2.new(0, 160, 0, 130)
TargetFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
TargetFrame.AnchorPoint = Vector2.new(0.5, 0.5)
TargetFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TargetFrame.BorderSizePixel = 0
TargetFrame.Active = true
TargetFrame.Parent = Cache.TargetModeGui
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = TargetFrame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 20)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "TARGET MODE"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 11
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = TargetFrame
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 20, 0, 20)
minBtn.Position = UDim2.new(1, -25, 0, 5)
minBtn.BackgroundTransparency = 1
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.Parent = TargetFrame
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -20, 1, -35)
btnContainer.Position = UDim2.new(0, 10, 0, 30)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = TargetFrame
local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0, 6)
layout.Parent = btnContainer
local function createTargetBtn(name, text, keybind)
local btn = Instance.new("TextButton")
btn.Name = name
btn.Size = UDim2.new(1, 0, 0, 25)
btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
btn.Text = text .. " (" .. keybind .. ")"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamSemibold
btn.TextSize = 12
btn.Parent = btnContainer
local c = Instance.new("UICorner")
c.CornerRadius = UDim.new(0, 6)
c.Parent = btn
Cache.TargetButtons[name] = btn
return btn
end
createTargetBtn("Killer", "Killer", "K")
createTargetBtn("Survivor", "Survivor", "J")
createTargetBtn("Zombie", "Zombie", "L")
local minimized = false
minBtn.MouseButton1Click:Connect(function()
minimized = not minimized
if minimized then
TargetFrame.Size = UDim2.new(0, 160, 0, 30)
btnContainer.Visible = false
minBtn.Text = "+"
else
TargetFrame.Size = UDim2.new(0, 160, 0, 130)
btnContainer.Visible = true
minBtn.Text = "-"
end
end)
local dragging, dragInput, dragStart, startPos
TargetFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true; dragStart = input.Position; startPos = TargetFrame.Position
input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
end
end)
TargetFrame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
TargetFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
local function updateTargetUI(mode)
VDSettings.Aim.TargetMode = mode
for btnName, btn in pairs(Cache.TargetButtons) do
btn.BackgroundColor3 = (btnName == mode) and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(45, 45, 50)
end
end
updateTargetUI(VDSettings.Aim.TargetMode)
for name, btn in pairs(Cache.TargetButtons) do
btn.MouseButton1Click:Connect(function() updateTargetUI(name) end)
end
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed or not VDSettings.Aim.SilentAim then return end
if input.KeyCode == Enum.KeyCode.K then updateTargetUI("Killer")
elseif input.KeyCode == Enum.KeyCode.J then updateTargetUI("Survivor")
elseif input.KeyCode == Enum.KeyCode.L then updateTargetUI("Zombie") end
end)
end
task.spawn(CreateTargetModeOverlay)
local function GetTargetPartPos(char)
if not char then return nil end
local partName = VDSettings.Aim.TargetPart
if partName == "Root" then partName = "HumanoidRootPart" end
local part = char:FindFirstChild(partName)
if not part and partName == "Torso" then part = char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart") end
if part and part:IsA("BasePart") then return part.Position end
local hrp = char:FindFirstChild("HumanoidRootPart")
return hrp and hrp.Position or char:GetPivot().Position
end
local function GetMuzzlePos()
local myChar = Players.LocalPlayer.Character
if not myChar then return nil end
local tool = myChar:FindFirstChild("Twist of Fate")
if not tool then return nil end
local muzzle = tool:FindFirstChild("Muzzle", true) or tool:FindFirstChild("gun", true) or tool:FindFirstChild("Handle")
if muzzle and muzzle:IsA("BasePart") then return muzzle.Position end
local rightArm = myChar:FindFirstChild("Right Arm") or myChar:FindFirstChild("RightHand")
if rightArm then return rightArm.Position end
return nil
end
local function UpdateFlashlightAim()
local isEquipped = Players.LocalPlayer:GetAttribute("EquippedItem") == "Flashlight"
if not VDSettings.Aim.FlashSilent or not Cache.IsAimingFlash or not isEquipped then return end
local myChar = Players.LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
if not myRoot then return end
local bestTarget = nil
local closestDist = math.huge
local cam = workspace.CurrentCamera
if not cam then return end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= Players.LocalPlayer and plr.Team and (plr.Team.Name == "Killer" or plr.Team.Name == "Killers" or string.find(string.lower(plr.Team.Name), "iller")) and plr.Character then
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hum and hum.Health > 0 and hrp and not plr.Character:GetAttribute("Knocked") then
local dist = (hrp.Position - myRoot.Position).Magnitude
if dist < closestDist then
closestDist = dist
bestTarget = hrp
end
end
end
end
if bestTarget then
local targetPos = bestTarget.Position + Vector3.new(0, VDSettings.Aim.FlashYOffset, 0)
cam.CFrame = cam.CFrame:Lerp(CFrame.lookAt(cam.CFrame.Position, targetPos), 0.5)
local goalHrp = CFrame.lookAt(myRoot.Position, Vector3.new(targetPos.X, myRoot.Position.Y, targetPos.Z))
myRoot.CFrame = myRoot.CFrame:Lerp(goalHrp, 0.5)
end
end
local function UpdateCombat()
local isEquipped = Players.LocalPlayer:GetAttribute("EquippedItem") == "Twist of Fate"
local myChar = Players.LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
if not VDSettings.Aim.SilentAim or not myRoot or not isEquipped then
Cache.TargetPos = nil
Cache.LookVector = nil
Cache.IsAiming = false
if Cache.LaserBeam then Cache.LaserBeam.Transparency = 1 end
return
end
local cam = workspace.CurrentCamera
if not cam then return end
local bestDist3D = math.huge
local bestTargetPlayer = nil
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= Players.LocalPlayer and plr.Team then
local teamName = string.lower(plr.Team.Name)
local isValidTarget = false
if VDSettings.Aim.TargetMode == "Killer" and string.find(teamName, "killer") then isValidTarget = true
elseif VDSettings.Aim.TargetMode == "Survivor" and string.find(teamName, "survivor") then isValidTarget = true end
if isValidTarget and plr.Character then
local char = plr.Character
local hum = char:FindFirstChildOfClass("Humanoid")
local pos = GetTargetPartPos(char)
if hum and hum.Health > 0 and typeof(pos) == "Vector3" then
local dist3D = (pos - myRoot.Position).Magnitude
if dist3D < bestDist3D then
bestDist3D = dist3D
bestTargetPlayer = plr
end
end
end
end
end
local bestTargetEntity = nil
if VDSettings.Aim.TargetMode == "Zombie" then
for _, obj in ipairs(Cache.CachedZombies) do
if obj and obj.Parent then
local hum = obj:FindFirstChildOfClass("Humanoid")
local root = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart
if hum and hum.Health > 0 and root then
local dist3D = (root.Position - myRoot.Position).Magnitude
if dist3D < bestDist3D then bestDist3D = dist3D; bestTargetEntity = obj end
end
end
end
end
local finalTargetChar = bestTargetPlayer and bestTargetPlayer.Character or bestTargetEntity
if finalTargetChar then
local bestPos = GetTargetPartPos(finalTargetChar)
if not bestPos and bestTargetEntity then bestPos = bestTargetEntity:FindFirstChild("HumanoidRootPart") and bestTargetEntity.HumanoidRootPart.Position or bestTargetEntity:GetPivot().Position end
if typeof(bestPos) == "Vector3" then
local muzzlePos = GetMuzzlePos() or cam.CFrame.Position
local aimPoint = bestPos
if VDSettings.Aim.Prediction then
local targetVel = Vector3.zero
local hrp = finalTargetChar:FindFirstChild("HumanoidRootPart")
if hrp then targetVel = hrp.AssemblyLinearVelocity end
local flatVel = Vector3.new(targetVel.X, 0, targetVel.Z)
local dist = (bestPos - muzzlePos).Magnitude
local travelTime = dist / VDSettings.Aim.BulletSpeed
local ping = math.clamp(Players.LocalPlayer:GetNetworkPing(), 0, 0.2)
aimPoint = bestPos + (flatVel * (travelTime + ping))
end
Cache.TargetPos = aimPoint
Cache.LookVector = (aimPoint - muzzlePos).Unit
Cache.CurrentMuzzle = muzzlePos
end
else
Cache.TargetPos = nil
Cache.LookVector = nil
end
if VDSettings.Aim.Laser and Cache.IsAiming and Cache.TargetPos and Cache.CurrentMuzzle then
if not Cache.LaserBeam then
Cache.LaserBeam = Instance.new("Part")
Cache.LaserBeam.Name = "ToFLaser"
Cache.LaserBeam.Anchored = true
Cache.LaserBeam.CanCollide = false
Cache.LaserBeam.CanTouch = false
Cache.LaserBeam.CastShadow = false
Cache.LaserBeam.Material = Enum.Material.Neon
Cache.LaserBeam.Parent = workspace
end
local mPos = Cache.CurrentMuzzle
local tPos = Cache.TargetPos
local dist = (mPos - tPos).Magnitude
Cache.LaserBeam.Size = Vector3.new(0.05, 0.05, dist)
Cache.LaserBeam.CFrame = CFrame.lookAt(mPos, tPos) * CFrame.new(0, 0, -dist / 2)
Cache.LaserBeam.Color = VDSettings.Aim.LaserColor
Cache.LaserBeam.Transparency = 0.4
else
if Cache.LaserBeam then Cache.LaserBeam.Transparency = 1 end
end
end
local function UpdateKillerAimbot()
if not VDSettings.Killer.AimbotEnabled or not VDSettings.Killer.HoldingM2 then return end
local myTeam = Players.LocalPlayer.Team
if not myTeam or (myTeam.Name ~= "Killer" and myTeam.Name ~= "Killers" and not string.find(string.lower(myTeam.Name), "iller")) then return end
local cam = workspace.CurrentCamera
local myChar = Players.LocalPlayer.Character
local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
if not myRoot then return end
local closestTarget = nil
local shortestDist = VDSettings.Killer.MeleeLockDistance
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= Players.LocalPlayer and plr.Team and plr.Team.Name == "Survivors" and plr.Character then
local hrp = plr.Character:FindFirstChild("UpperTorso") or plr.Character:FindFirstChild("Torso") or plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if hrp and hum and hum.Health > 0 then
local dist = (hrp.Position - myRoot.Position).Magnitude
if dist <= shortestDist then
local pos, onScreen = cam:WorldToViewportPoint(hrp.Position)
if onScreen then
shortestDist = dist
closestTarget = hrp
end
end
end
end
end
if closestTarget then
local smoothFactor = VDSettings.Killer.AimbotSmoothness / 10
local targetCFrame = CFrame.lookAt(cam.CFrame.Position, closestTarget.Position)
if smoothFactor >= 1 then
cam.CFrame = targetCFrame
else
cam.CFrame = cam.CFrame:Lerp(targetCFrame, smoothFactor)
end
end
end
local function GetClosestTargetForDash()
local closestPlayer = nil
local shortestDistance = math.huge
local myChar = Players.LocalPlayer.Character
local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
if not myHRP then return nil end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= Players.LocalPlayer and plr.Team and plr.Team.Name == "Survivors" and plr.Character then
local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
local isDowned = plr.Character:GetAttribute("Knocked") == true or plr.Character:GetAttribute("IsHooked") == true
if targetHRP and hum and hum.Health > 0 and not isDowned then
local distance = (myHRP.Position - targetHRP.Position).Magnitude
if distance < shortestDistance and distance < 100 then
shortestDistance = distance
closestPlayer = plr.Character
end
end
end
end
return closestPlayer
end
local function TriggerDashLock()
if not VDSettings.Killer.DashLockEnabled then return end
if Cache.DashLockState.isAimLocking then return end
if tick() - Cache.DashLockState.lastLockTime < 0.2 then return end
local myTeam = Players.LocalPlayer.Team
if not myTeam or (myTeam.Name ~= "Killer" and myTeam.Name ~= "Killers" and not string.find(string.lower(myTeam.Name), "iller")) then return end
Cache.DashLockState.lastLockTime = tick()
Cache.DashLockState.currentTarget = GetClosestTargetForDash()
if Cache.DashLockState.currentTarget and Cache.DashLockState.currentTarget:FindFirstChild("HumanoidRootPart") then
Cache.DashLockState.isAimLocking = true
if Cache.DashLockState.lockTimerThread then task.cancel(Cache.DashLockState.lockTimerThread) end
Cache.DashLockState.lockTimerThread = task.delay(2, function()
Cache.DashLockState.isAimLocking = false
Cache.DashLockState.currentTarget = nil
Cache.DashLockState.lockTimerThread = nil
end)
end
end
local function UpdateDashLock()
if Cache.DashLockState.isAimLocking and Cache.DashLockState.currentTarget and Cache.DashLockState.currentTarget:FindFirstChild("HumanoidRootPart") then
local cam = workspace.CurrentCamera
if not cam then return end
local targetPosition = Cache.DashLockState.currentTarget.HumanoidRootPart.Position
local newCameraCFrame = CFrame.lookAt(cam.CFrame.Position, targetPosition)
cam.CFrame = cam.CFrame:Lerp(newCameraCFrame, 0.6)
else
Cache.DashLockState.isAimLocking = false
end
end
local function solvePitch(p, d, dy)
d = math.max(d, 0.1)
local s2 = p.v0 * p.v0
local root = s2 * s2 - p.g * (p.g * d * d + 2 * dy * s2)
local outOfRange = false
if root < 0 then root = 0; outOfRange = true end
local tanTheta = (s2 - math.sqrt(root)) / (p.g * d)
local theta = math.atan(tanTheta)
local t = d / (p.v0 * math.cos(theta))
return theta, outOfRange, t
end
local function getCharacterVelocity(char)
local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
if not root or not root:IsA("BasePart") then return Vector3.zero end
local now = os.clock()
local last = Cache.Spear.velHistory[char]
local measured = Vector3.zero
if last and now - last.t > 0.02 then
measured = (root.Position - last.pos) / (now - last.t)
if measured.Magnitude > 150 then measured = last.smooth or Vector3.zero end
end
local smooth = last and last.smooth or measured
smooth = smooth:Lerp(measured, 0.65)
Cache.Spear.velHistory[char] = { pos = root.Position, t = now, smooth = smooth }
if smooth.Magnitude < 1 then return Vector3.zero end
return Vector3.new(smooth.X, 0, smooth.Z)
end
Players.PlayerRemoving:Connect(function(p)
if p.Character then Cache.Spear.velHistory[p.Character] = nil end
end)
local function UpdateSpearAimbot()
local cam = workspace.CurrentCamera
local center = cam and Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2) or Vector2.zero
local set = VDSettings.Killer.Spear
local vis = Cache.Spear.Visuals
if not set.Enabled or Players.LocalPlayer:GetAttribute("SelectedKiller") ~= "Veil" then
Cache.Spear.target = nil
Cache.Spear.lookVector = nil
vis.FOVCircle.Visible = false
vis.TrackerLine.Visible = false
vis.TrackerCircle.Visible = false
return
end
if set.ShowFOV and cam then
vis.FOVCircle.Position = center
vis.FOVCircle.Radius = set.FovRadius
vis.FOVCircle.Color = set.FovColor
vis.FOVCircle.Transparency = set.FovTransparency
vis.FOVCircle.Visible = true
else
vis.FOVCircle.Visible = false
end
local char = Players.LocalPlayer.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
if not cam or not hrp then return end
local nearest = nil
local bestDist = set.FovRadius
for _, p in ipairs(Players:GetPlayers()) do
local isSurvivor = false
if p ~= Players.LocalPlayer and p.Team then
local tn = string.lower(p.Team.Name)
if not string.find(tn, "iller") then
isSurvivor = true
end
end
if isSurvivor and p.Character then
local pc = p.Character
local isDown = pc:GetAttribute("Knocked") == true or pc:GetAttribute("HookProgressDepleting") == true
if not isDown then
local hum = pc:FindFirstChildOfClass("Humanoid")
local targetPart = pc:FindFirstChild("UpperTorso") or pc:FindFirstChild("Torso") or pc:FindFirstChild("HumanoidRootPart")
if hum and hum.Health > 0 and targetPart then
local sp, on = cam:WorldToViewportPoint(targetPart.Position)
if on and sp.Z > 0 then
local sd = (Vector2.new(sp.X, sp.Y) - center).Magnitude
if sd < bestDist then
bestDist = sd
nearest = p
end
end
end
end
end
end
if nearest and nearest.Character then
local tpPart = nearest.Character:FindFirstChild("UpperTorso") or nearest.Character:FindFirstChild("Torso") or nearest.Character:FindFirstChild("HumanoidRootPart")
if tpPart then
local tp = tpPart.Position
local hand = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
local origin = (hand and hand:IsA("BasePart")) and hand.Position or hrp.Position
local dir = tp - origin
local dist = dir.Magnitude
if dist > 0.1 and dist <= 1000 then
local isAuraActive = char:GetAttribute("special") == true
local prof
if isAuraActive then
prof = { v0 = set.PROF.aura.v0, g = set.PROF.aura.g, windup = 0.10, latency = 0.04, maxlead = 25, scale = set.LeadMultiplier }
else
prof = { v0 = set.CustomSpeed, g = set.CustomGravity, windup = 0.10, latency = 0.04, maxlead = 45, scale = set.LeadMultiplier }
end
local h0 = Vector3.new(dir.X, 0, dir.Z)
local _, _, tFlight = solvePitch(prof, h0.Magnitude, dir.Y)
local aimPoint = tp
if set.AutoPredict then
local vel = getCharacterVelocity(nearest.Character)
if vel.Magnitude > 0.5 then
local ping = 0.08
pcall(function() ping = math.clamp(Players.LocalPlayer:GetNetworkPing(), 0, 0.35) end)
local delay = tFlight + prof.windup + ping + prof.latency
for i = 1, 2 do
local lead = vel * delay * prof.scale
local maxLead = math.clamp(dist * 0.6, 3, prof.maxlead)
if lead.Magnitude > maxLead then lead = lead.Unit * maxLead end
aimPoint = tp + lead
local ad = aimPoint - origin
local ah = Vector3.new(ad.X, 0, ad.Z)
local _, _, t2 = solvePitch(prof, math.max(ah.Magnitude, 0.1), ad.Y)
delay = t2 + prof.windup + ping + prof.latency
end
end
end
local adir = aimPoint - origin
local ah = Vector3.new(adir.X, 0, adir.Z)
local ahDist = ah.Magnitude
local pitch = solvePitch(prof, ahDist, adir.Y)
if ahDist > 0.001 then
Cache.Spear.lookVector = ah.Unit * math.cos(pitch) + Vector3.new(0, math.sin(pitch), 0)
else
Cache.Spear.lookVector = adir.Unit
end
Cache.Spear.target = nearest
if set.ShowTracker and VDSettings.Killer.HoldingM2 then
local sp, on = cam:WorldToViewportPoint(tpPart.Position)
if on and sp.Z > 0 and (Vector2.new(sp.X, sp.Y) - center).Magnitude <= set.FovRadius then
vis.TrackerLine.From = Vector2.new(center.X, cam.ViewportSize.Y)
vis.TrackerLine.To = Vector2.new(sp.X, sp.Y)
vis.TrackerLine.Visible = true
vis.TrackerCircle.Position = Vector2.new(sp.X, sp.Y)
vis.TrackerCircle.Radius = math.clamp(1000 / dist, 10, 40)
vis.TrackerCircle.Visible = true
else
vis.TrackerLine.Visible = false; vis.TrackerCircle.Visible = false
end
else
vis.TrackerLine.Visible = false; vis.TrackerCircle.Visible = false
end
else
Cache.Spear.target = nil; Cache.Spear.lookVector = nil
vis.TrackerLine.Visible = false; vis.TrackerCircle.Visible = false
end
else
Cache.Spear.target = nil; Cache.Spear.lookVector = nil
vis.TrackerLine.Visible = false; vis.TrackerCircle.Visible = false
end
end
end
UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then
return
end
if input.UserInputType == Enum.UserInputType.MouseButton2 then
local myChar = Players.LocalPlayer.Character
if myChar and myChar:FindFirstChild("Twist of Fate") then
Cache.IsAiming = true
end
if myChar and myChar:FindFirstChild("Flashlight") then
Cache.IsAimingFlash = true
end
end
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.MouseButton2 then
VDSettings.Killer.HoldingM2 = true
end
if input.UserInputType == Enum.UserInputType.MouseButton2 then
TriggerDashLock()
end
end)
UserInputService.InputEnded:Connect(function(input, gameProcessed)
if input.UserInputType == Enum.UserInputType.MouseButton2 then
Cache.IsAiming = false
Cache.IsAimingFlash = false
end
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
VDSettings.Killer.HoldingM2 = false
end
end)
local KillerAttackPaths = {
"Slasher-mob.Controls.attack",
"Masked-mob.Controls.attack",
"Killer-mob.Controls.attack",
"Abysswalker-mob.Controls.attack",
"Cure-mob.Controls.attack",
"Stalker-mob.Controls.attack",
"Slasher-mob.Controls.move1",
"Veil-mob.Controls.attack",
"Hidden-mob.Controls.move2"
}
task.spawn(function()
while task.wait(1) do
pcall(function()
local pGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
if not pGui then return end
local survivorMob = pGui:FindFirstChild("Survivor-mob")
if survivorMob then
local controls = survivorMob:FindFirstChild("Controls")
if controls then
local guiMob = controls:FindFirstChild("Gui-mob")
if guiMob and guiMob:IsA("GuiButton") and not guiMob:GetAttribute("AimHooked") then
guiMob:SetAttribute("AimHooked", true)
guiMob.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
local myChar = Players.LocalPlayer.Character
if myChar and myChar:FindFirstChild("Twist of Fate") then Cache.IsAiming = true end
if myChar and myChar:FindFirstChild("Flashlight") then Cache.IsAimingFlash = true end
end
end)
guiMob.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
Cache.IsAiming = false
Cache.IsAimingFlash = false
end
end)
end
end
end
for _, path in ipairs(KillerAttackPaths) do
local current = pGui
for segment in string.gmatch(path, "[^%.]+") do
if current then current = current:FindFirstChild(segment) end
end
if current and current:IsA("GuiButton") and not current:GetAttribute("AimHooked") then
current:SetAttribute("AimHooked", true)
current.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
VDSettings.Killer.HoldingM2 = true
if path == "Hidden-mob.Controls.move2" then TriggerDashLock() end
end
end)
current.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
VDSettings.Killer.HoldingM2 = false
end
end)
end
end
end)
end
end)
local function setupUnequipDetection(char)
if char then
char.ChildRemoved:Connect(function(child)
if child.Name == "Twist of Fate" then Cache.IsAiming = false end
if child.Name == "Flashlight" then Cache.IsAimingFlash = false end
end)
end
end
if Players.LocalPlayer.Character then setupUnequipDetection(Players.LocalPlayer.Character) end
Players.LocalPlayer.CharacterAdded:Connect(setupUnequipDetection)
local function EnableStreamMode()
local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
if not PlayerGui then return end
local function applySpooferToObj(obj)
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
local function updateText()
if not VDSettings.Misc.StreamMode then return end
local currentText = obj.Text
local changed = false
if not obj:GetAttribute("OriginalText") then
obj:SetAttribute("OriginalText", currentText)
end
for _, p in ipairs(Players:GetPlayers()) do
if string.find(currentText, p.Name) or string.find(currentText, p.DisplayName) then
currentText = string.gsub(currentText, p.Name, "L2")
currentText = string.gsub(currentText, p.DisplayName, "L2")
changed = true
end
end
if changed and obj.Text ~= currentText then
obj.Text = currentText
end
end
updateText()
local conn = obj:GetPropertyChangedSignal("Text"):Connect(updateText)
table.insert(Cache.SpooferConns, conn)
elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
local function updateImage()
if not VDSettings.Misc.StreamMode then return end
local currentImg = obj.Image
local changed = false
for _, p in ipairs(Players:GetPlayers()) do
if string.find(currentImg, tostring(p.UserId)) then
if not obj:GetAttribute("OriginalImage") then
obj:SetAttribute("OriginalImage", currentImg)
end
changed = true
break
end
end
if changed and obj.Image ~= "rbxassetid://120932910004936" then
obj.Image = "rbxassetid://120932910004936"
end
end
updateImage()
local conn = obj:GetPropertyChangedSignal("Image"):Connect(updateImage)
table.insert(Cache.SpooferConns, conn)
end
end
for _, obj in ipairs(PlayerGui:GetDescendants()) do applySpooferToObj(obj) end
local conn = PlayerGui.DescendantAdded:Connect(function(obj) task.defer(function() applySpooferToObj(obj) end) end)
table.insert(Cache.SpooferConns, conn)
end
local function DisableStreamMode()
for _, conn in ipairs(Cache.SpooferConns) do
if conn.Connected then conn:Disconnect() end
end
table.clear(Cache.SpooferConns)
local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
if PlayerGui then
for _, obj in ipairs(PlayerGui:GetDescendants()) do
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
local oriText = obj:GetAttribute("OriginalText")
if oriText then
obj.Text = oriText
obj:SetAttribute("OriginalText", nil)
end
elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
local oriImage = obj:GetAttribute("OriginalImage")
if oriImage then
obj.Image = oriImage
obj:SetAttribute("OriginalImage", nil)
end
end
end
end
end
local function UpdateMisc(dt)
local char = Players.LocalPlayer.Character
local hum = char and char:FindFirstChildOfClass("Humanoid")
local hrp = char and char:FindFirstChild("HumanoidRootPart")
if not hum or not hrp then return end
if VDSettings.Misc.SpeedHack then
local isKnocked = char:GetAttribute("Knocked") == true
or char:GetAttribute("Downed") == true
or char:GetAttribute("Carried") == true
or char:GetAttribute("Ragdolled") == true
local isCrouching = char:GetAttribute("Crouching") == true
or char:GetAttribute("Crouchingserver") == true
if not isKnocked and not isCrouching then
local moveDir = hum.MoveDirection
if moveDir.Magnitude > 0 then
local extraSpeed = VDSettings.Misc.SpeedValue * 15
hrp.CFrame = hrp.CFrame + (moveDir * extraSpeed * (dt or 0.016))
end
end
end
end
RunService.Stepped:Connect(function()
if VDSettings.Misc.Noclip then
local char = Players.LocalPlayer.Character
if char then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end
end
end)
local function DetectMapName()
local map = workspace:FindFirstChild("Map")
if not map then return nil end
if map:FindFirstChild("random shakes") or map:FindFirstChild("SCP-173 Room") or map:FindFirstChild("SCP-205 Room") then
return "Site 68"
elseif map:FindFirstChild("HooksMeat") then
return "BLOODBATH! Club"
elseif map:FindFirstChild("Gate") and map.Gate:FindFirstChild("vfx") then
return "Firelink Shrine"
elseif map:FindFirstChild("Bldg_Addon_RooftopUnit_A") or map:FindFirstChild("Rooftop") then
return "Mercy Hospital Rooftop"
elseif map:FindFirstChild("White Armored Car") then
return "Mount Massive Asylum"
elseif map:FindFirstChild("Dumbster") then
return "The Bay Harbor"
elseif map:FindFirstChild("water pump") then
return "Valdelobos Village"
elseif map:FindFirstChild("LargeBoulder01") then
return "Woodview Cabin"
end
return "Unknown"
end
local DashboardTab = Window:CreateHomeTab({
Name = "Dashboard",
Title = "Dashboard",
Icon = "lucide:layout-dashboard",
AutoSetup = true,
SupportedExecutors = {"Delta", "Arceus X", "Codex", "Hydrogen", "Krampus", "Fluxus", "Real"},
UnsupportedExecutors = {"Xeno", "Solara"},
DiscordInvite = "https://discord.gg/rvsgBsnUxA",
})
local VisualTab = Window:AddTab({ Name = "Visuals", Icon = "eye", Type = "Single" })
local VisualTabbox = VisualTab:AddCenterTabbox("Visual Features")
local SubTabESP = VisualTabbox:AddTab({ Name = "Player ESP", Icon = "user" })
local SubTabCamera = VisualTabbox:AddTab({ Name = "Camera", Icon = "camera-small" })
local SubTabLighting = VisualTabbox:AddTab({ Name = "Lighting", Icon = "sun" })
local PlayerESPGroup = SubTabESP:AddDependencyGroupbox({
Name        = "Player ESP",
Icon        = "user",
Collapsible = true,
Collapsed   = false,
})
PlayerESPGroup:AddToggle({
Name     = "Enable Player ESP",
Flag     = "Toggle_ESP_Enable",
Default  = false,
Callback = function(state)
VDSettings.ESP.Enabled = state
end,
})
PlayerESPGroup:AddDropdown({
Name     = "Select Target",
Flag     = "Filter_ESP_Targets",
Multi    = true,
Values   = {"Survivor", "Killer"},
Default  = {},
Callback = function(v)
VDSettings.ESP.Targets.Survivor = v["Survivor"] or false
VDSettings.ESP.Targets.Killer = v["Killer"] or false
end,
})
PlayerESPGroup:AddDropdown({
Name     = "ESP Style",
Flag     = "Filter_ESP_Styles",
Multi    = true,
Values   = {"Chams", "Box", "Skeleton"},
Default  = {},
Callback = function(v)
VDSettings.ESP.Styles.Chams = v["Chams"] or false
VDSettings.ESP.Styles.Box = v["Box"] or false
VDSettings.ESP.Styles.Skeleton = v["Skeleton"] or false
for _, p in ipairs(Players:GetPlayers()) do
ClearESP(p)
end
end,
})
PlayerESPGroup:AddDropdown({
Name     = "Info Status",
Flag     = "Filter_ESP_Info",
Multi    = true,
Values   = {"Names", "Distance", "Health", "Item Status"},
Default  = {},
Callback = function(v)
VDSettings.ESP.Info.Names = v["Names"] or false
VDSettings.ESP.Info.Distance = v["Distance"] or false
VDSettings.ESP.Info.Health = v["Health"] or false
VDSettings.ESP.Info.ItemStatus = v["Item Status"] or false
end,
})
PlayerESPGroup:AddSlider({
Name     = "Fill Transparency",
Flag     = "Slider_ESP_FillTrans",
Min      = 0,
Max      = 1,
Default  = 0.5,
Rounding = 2,
Callback = function(v) VDSettings.ESP.FillTrans = v end,
})
PlayerESPGroup:AddSlider({
Name     = "Outline Transparency",
Flag     = "Slider_ESP_OutlineTrans",
Min      = 0,
Max      = 1,
Default  = 0.3,
Rounding = 2,
Callback = function(v) VDSettings.ESP.OutlineTrans = v end,
})
PlayerESPGroup:AddSlider({
Name     = "Text Size",
Flag     = "Slider_ESP_TextSize",
Min      = 8,
Max      = 24,
Default  = 12,
Rounding = 0,
Callback = function(v) VDSettings.ESP.TextSize = v end,
})
PlayerESPGroup:AddColorPicker({
Name     = "Survivor Color",
Flag     = "Color_ESP_Survivor",
Default  = Color3.fromRGB(0, 255, 0),
Callback = function(v) VDSettings.ESP.Colors.Survivor = v end,
})
PlayerESPGroup:AddColorPicker({
Name     = "Killer Color",
Flag     = "Color_ESP_Killer",
Default  = Color3.fromRGB(255, 0, 0),
Callback = function(v) VDSettings.ESP.Colors.Killer = v end,
})
local WorldESPGroup = SubTabESP:AddDependencyGroupbox({
Name        = "World Highlight ESP",
Icon        = "globe-simplified",
Collapsible = true,
Collapsed   = false,
})
WorldESPGroup:AddToggle({
Name     = "Enable World ESP",
Flag     = "Toggle_WorldESP_Enabled",
Default  = false,
Callback = function(state) VDSettings.WorldESP.Enabled = state end,
})
WorldESPGroup:AddDropdown({
Name     = "Select World Objects",
Flag     = "Filter_WorldESP_Targets",
Multi    = true,
Values   = {"Generators", "Hooks", "Gates", "Windows", "Pallets", "SCP / Zombie", "Pumpkins"},
Default  = {},
Callback = function(v)
VDSettings.WorldESP.Targets.Generators = v["Generators"] or false
VDSettings.WorldESP.Targets.Hooks = v["Hooks"] or false
VDSettings.WorldESP.Targets.Gates = v["Gates"] or false
VDSettings.WorldESP.Targets.Windows = v["Windows"] or false
VDSettings.WorldESP.Targets.Pallets = v["Pallets"] or false
VDSettings.WorldESP.Targets.Zombies = v["SCP / Zombie"] or false
VDSettings.WorldESP.Targets.Pumpkins = v["Pumpkins"] or false
end,
})
WorldESPGroup:AddToggle({
Name     = "World Nametags",
Flag     = "Toggle_WorldESP_ShowName",
Default  = false,
Callback = function(state) VDSettings.WorldESP.ShowName = state end,
})
WorldESPGroup:AddToggle({
Name     = "World Distance ESP",
Flag     = "Toggle_WorldESP_ShowDistance",
Default  = false,
Callback = function(state) VDSettings.WorldESP.ShowDistance = state end,
})
WorldESPGroup:AddSlider({
Name     = "World Max Distance",
Flag     = "Slider_WorldESP_MaxDistance",
Min      = 50,
Max      = 1000,
Default  = 150,
Rounding = 0,
Callback = function(v) VDSettings.WorldESP.MaxDistance = v end,
})
WorldESPGroup:AddColorPicker({
Name     = "Generator Color",
Flag     = "Color_WorldESP_Generators",
Default  = VDSettings.WorldESP.Colors.Generators,
Callback = function(v) VDSettings.WorldESP.Colors.Generators = v end,
})
WorldESPGroup:AddColorPicker({
Name     = "Hook Color",
Flag     = "Color_WorldESP_Hooks",
Default  = VDSettings.WorldESP.Colors.Hooks,
Callback = function(v) VDSettings.WorldESP.Colors.Hooks = v end,
})
WorldESPGroup:AddColorPicker({
Name     = "Window Color",
Flag     = "Color_WorldESP_Windows",
Default  = VDSettings.WorldESP.Colors.Windows,
Callback = function(v) VDSettings.WorldESP.Colors.Windows = v end,
})
WorldESPGroup:AddColorPicker({
Name     = "Pallet Color",
Flag     = "Color_WorldESP_Pallets",
Default  = VDSettings.WorldESP.Colors.Pallets,
Callback = function(v) VDSettings.WorldESP.Colors.Pallets = v end,
})
WorldESPGroup:AddColorPicker({
Name     = "Pumpkin Color",
Flag     = "Color_WorldESP_Pumpkins",
Default  = VDSettings.WorldESP.Colors.Pumpkins,
Callback = function(v) VDSettings.WorldESP.Colors.Pumpkins = v end,
})
local CameraGroup = SubTabCamera:AddDependencyGroupbox({
Name        = "Camera Adjustments",
Icon        = "camera-small",
Collapsible = true,
Collapsed   = false,
})
CameraGroup:AddToggle({
Name     = "Enable FOV Modifier",
Flag     = "Toggle_Camera_FOVEnabled",
Default  = false,
Callback = function(state) VDSettings.Camera.FOVEnabled = state end,
})
CameraGroup:AddSlider({
Name     = "Field of View",
Flag     = "Slider_Camera_FOVValue",
Min      = 70,
Max      = 120,
Default  = 70,
Rounding = 0,
Callback = function(v) VDSettings.Camera.FOVValue = v end,
})
CameraGroup:AddToggle({
Name     = "Unlock Camera Zoom",
Flag     = "Toggle_Camera_UnlockZoom",
Default  = false,
Callback = function(state)
VDSettings.Camera.UnlockZoom = state
if not state then
Players.LocalPlayer.CameraMaxZoomDistance = 128
Players.LocalPlayer.CameraMinZoomDistance = 0.5
end
end,
})
CameraGroup:AddSlider({
Name     = "Max Zoom Distance",
Flag     = "Slider_Camera_MaxZoom",
Min      = 128,
Max      = 2000,
Default  = 400,
Rounding = 0,
Callback = function(v) VDSettings.Camera.MaxZoom = v end,
})
local DBDSmoothGroup = SubTabCamera:AddDependencyGroupbox({
Name        = "DBD Smooth Camera",
Icon        = "sun",
Collapsible = true,
Collapsed   = false,
})
DBDSmoothGroup:AddToggle({
Name     = "Enable Smooth Camera",
Flag     = "Toggle_Camera_DBDCam",
Default  = false,
Callback = function(state)
VDSettings.Camera.DBDCam = state
if state and workspace.CurrentCamera then
Cache.lastCamCFrame = workspace.CurrentCamera.CFrame
end
end,
})
DBDSmoothGroup:AddSlider({
Name     = "Camera Smoothness",
Flag     = "Slider_Camera_DBDSmoothness",
Min      = 1,
Max      = 10,
Default  = 2,
Rounding = 1,
Callback = function(v)
VDSettings.Camera.DBDSmoothness = math.clamp(v * 0.1, 0.1, 1)
end,
})
local LightGroup = SubTabLighting:AddDependencyGroupbox({
Name        = "Performance Boost",
Icon        = "sun",
Collapsible = true,
Collapsed   = false,
})
LightGroup:AddToggle({
Name     = "Fullbright",
Flag     = "Toggle_Lighting_Fullbright",
Default  = false,
Callback = function(state)
VDSettings.Lighting.Fullbright = state
ApplyFullbright()
end,
})
LightGroup:AddSlider({
Name     = "Fullbright Brightness",
Flag     = "Slider_Lighting_FullbrightValue",
Min      = 100,
Max      = 255,
Default  = 180,
Rounding = 0,
Callback = function(v)
VDSettings.Lighting.FullbrightValue = v
if VDSettings.Lighting.Fullbright then
ApplyFullbright()
end
end,
})
LightGroup:AddToggle({
Name     = "No Fog & Disable Effects",
Flag     = "Toggle_Lighting_NoFog",
Default  = false,
Callback = function(state)
VDSettings.Lighting.NoFog = state
ApplyNoFog(state)
end,
})
LightGroup:AddToggle({
Name     = "Skip Cutscene",
Flag     = "Toggle_Misc_SkipCutscene",
Default  = false,
Callback = function(v) VDSettings.Misc.SkipCutscene = v end,
})
LightGroup:AddToggle({
Name     = "Reduce Texture",
Flag     = "Toggle_Lighting_ReduceTexture",
Default  = false,
Callback = function(state)
ApplyPerfReduceTexture(state)
if state then
Window:Notify({ Title = "Performance Boost", Content = "Textures, Terrain & Grass Reduced!", Duration = 3 })
end
end,
})
LightGroup:AddToggle({
Name     = "Remove Tree",
Flag     = "Toggle_Lighting_RemoveTree",
Default  = false,
Callback = function(state)
ApplyPerfRemoveTree(state)
if state then
Window:Notify({ Title = "Performance Boost", Content = "Tree Leaves Removed", Duration = 3 })
end
end,
})
local SurvivorTab = Window:AddTab({ Name = "Survivor", Icon = "user", Type = "Single" })
local SurvivorTabbox = SurvivorTab:AddCenterTabbox("Survivor Features")
local SubTabAutomation = SurvivorTabbox:AddTab({ Name = "Automation", Icon = "gear" })
local SubTabCombat = SurvivorTabbox:AddTab({ Name = "Combat", Icon = "swords" })
local SubTabUtility = SurvivorTabbox:AddTab({ Name = "Utility", Icon = "shield-check" })
local GenGroup = SubTabAutomation:AddDependencyGroupbox({
Name        = "Generator Exploits",
Icon        = "gear",
Collapsible = true,
Collapsed   = false,
})
GenGroup:AddDropdown({
Name     = "Auto Skill Check Mode",
Flag     = "Filter_Survivor_AutoSkillMode",
Default  = "Disabled",
Values   = {"Disabled", "Normal", "Perfect", "Instant"},
Multi    = false,
Callback = function(v) VDSettings.Survivor.AutoSkillMode = v end,
})
GenGroup:AddDropdown({
Name     = "Bypass Gen Mode",
Flag     = "Filter_Survivor_BypassGenMode",
Default  = "Manual Repair",
Values   = {"Manual Repair", "Auto Repair"},
Multi    = false,
Callback = function(v) VDSettings.Survivor.BypassGenMode = v end,
})
GenGroup:AddToggle({
Name     = "Enable Boost Generator",
Flag     = "Toggle_Survivor_BoostGenEnabled",
Default  = false,
Callback = function(state)
VDSettings.Survivor.BoostGenEnabled = state
ToggleBoostGenUI(state)
end,
})
local VaultGroup = SubTabAutomation:AddDependencyGroupbox({
Name        = "Vault Exploits",
Icon        = "lucide:door-open-arrow-to-bottom-right",
Collapsible = true,
Collapsed   = false,
})
VaultGroup:AddToggle({
Name     = "Fast Vault (Flowstate)",
Flag     = "Toggle_Survivor_Flowstate",
Default  = false,
Callback = function(v)
VDSettings.Survivor.Flowstate = v
local char = Players.LocalPlayer.Character
if char then
if v then
if char:GetAttribute("Flowstate") ~= true then char:SetAttribute("Flowstate", true) end
else
if char:GetAttribute("Flowstate") == true then char:SetAttribute("Flowstate", false) end
end
end
end,
})
VaultGroup:AddToggle({
Name     = "Perfect Vault",
Flag     = "Toggle_Survivor_PerfectVault",
Default  = false,
Callback = function(v) VDSettings.Survivor.PerfectVault = v end,
})
local ParryGroup = SubTabCombat:AddDependencyGroupbox({
Name        = "Auto Parry (Dagger)",
Icon        = "swords",
Collapsible = true,
Collapsed   = false,
})
ParryGroup:AddToggle({
Name     = "Auto Parry",
Flag     = "Toggle_Parry_Enabled",
Default  = false,
Callback = function(v) VDSettings.Combat.Parry.Enabled = v end,
})
ParryGroup:AddToggle({
Name     = "Auto Parry Aggressive (Predict)",
Flag     = "Toggle_Parry_Aggressive",
Default  = false,
Callback = function(v) VDSettings.Combat.Parry.Aggressive = v end,
})
ParryGroup:AddSlider({
Name     = "Parry Distance",
Flag     = "Slider_Parry_Distance",
Min      = 4,
Max      = 25,
Default  = 8,
Rounding = 1,
Callback = function(v) VDSettings.Combat.Parry.Distance = v end,
})
ParryGroup:AddToggle({
Name     = "Show Parry Circle",
Flag     = "Toggle_Parry_ShowCircle",
Default  = false,
Callback = function(v) VDSettings.Combat.Parry.ShowCircle = v end,
})
ParryGroup:AddColorPicker({
Name     = "Parry Circle Color",
Flag     = "Color_Parry_Color",
Default  = VDSettings.Combat.Parry.Color,
Callback = function(v) VDSettings.Combat.Parry.Color = v end,
})
local EvasionGroup = SubTabUtility:AddDependencyGroupbox({
Name        = "Evasion & Defense",
Icon        = "shield-check",
Collapsible = true,
Collapsed   = false,
})
EvasionGroup:AddToggle({
Name     = "Auto Crouch (Abysswalker)",
Flag     = "Toggle_Survivor_AutoCrouch",
Default  = false,
Callback = function(v) VDSettings.Survivor.AutoCrouch = v end,
})
EvasionGroup:AddToggle({
Name     = "God Mode",
Flag     = "Toggle_Survivor_GodMode",
Default  = false,
Callback = function(v) VDSettings.Survivor.GodMode = v end,
})
EvasionGroup:AddToggle({
Name     = "Anti Fall",
Flag     = "Toggle_Survivor_AntiFall",
Default  = false,
Callback = function(v) VDSettings.Survivor.AntiFall = v end,
})
local InvisGroup = SubTabUtility:AddDependencyGroupbox({
Name        = "Invisibility [OP]",
Icon        = "eye-slash",
Collapsible = true,
Collapsed   = false,
})
InvisGroup:AddToggle({
Name     = "Enable Invis System",
Flag     = "Toggle_Survivor_InvisEnabled",
Default  = false,
Callback = function(v)
VDSettings.Survivor.Invis.Enabled = v
if v then
VDSettings.Survivor.Invis.State = false
ApplyInvisibility()
if Players.LocalPlayer.Character then
SetupHeadIcon(Players.LocalPlayer.Character)
end
else
VDSettings.Survivor.Invis.State = false
ApplyInvisibility()
if Cache.HeadIconGui then
Cache.HeadIconGui:Destroy()
Cache.HeadIconGui = nil
end
end
end,
})
InvisGroup:AddKeybind({
Name     = "Invis Toggle Key",
Flag     = "Keybind_Survivor_InvisToggle",
Default  = "None",
Mode     = "Toggle",
Callback = function(Name, State, Key, Mode)
if not VDSettings.Survivor.Invis.Enabled then return end
if Mode == "Toggle" then
VDSettings.Survivor.Invis.State = not VDSettings.Survivor.Invis.State
else
VDSettings.Survivor.Invis.State = State
end
ApplyInvisibility()
if Cache.HeadIconGui then
local btn = Cache.HeadIconGui:FindFirstChildOfClass("ImageButton")
if btn then
btn.Image = VDSettings.Survivor.Invis.State and Cache.ICON_INVISIBLE or Cache.ICON_VISIBLE
btn.ImageColor3 = VDSettings.Survivor.Invis.State and Color3.fromRGB(150, 255, 150) or Color3.fromRGB(255, 255, 255)
end
end
end,
})
local FakePerksGroup = SubTabUtility:AddDependencyGroupbox({
Name        = "Fake Perks (OP)",
Icon        = "star",
Collapsible = true,
Collapsed   = false,
})
FakePerksGroup:AddToggle({
Name     = "Fake Quick Recovery",
Flag     = "Toggle_FakePerks_QuickRecovery",
Default  = false,
Callback = function(v) VDSettings.Survivor.FakePerks.QuickRecovery = v end,
})
FakePerksGroup:AddToggle({
Name     = "Fake Perfect Landing",
Flag     = "Toggle_FakePerks_PerfectLanding",
Default  = false,
Callback = function(v)
VDSettings.Survivor.FakePerks.PerfectLanding = v
if not v and Players.LocalPlayer.Character and Cache.FakePerksState.plBoostActive then
Players.LocalPlayer.Character:SetAttribute("speedboost", 1)
Cache.FakePerksState.plBoostActive = false
end
end,
})
FakePerksGroup:AddToggle({
Name     = "Fake Flowstate",
Flag     = "Toggle_FakePerks_Flowstate",
Default  = false,
Callback = function(v)
VDSettings.Survivor.FakePerks.Flowstate = v
local char = Players.LocalPlayer.Character
if char then
if v then char:SetAttribute("Flowstate", true) else char:SetAttribute("Flowstate", false) end
end
end,
})
FakePerksGroup:AddSlider({
Name     = "Fake Perks Cooldown",
Flag     = "Slider_FakePerks_Cooldown",
Min      = 0,
Max      = 180,
Default  = 10,
Rounding = 0,
Callback = function(v)
VDSettings.Survivor.FakePerks.Cooldown = v
local char = Players.LocalPlayer.Character
if VDSettings.Survivor.FakePerks.Flowstate and char then
Cache.FakePerksState.fsOnCooldown = false
Cache.FakePerksState.lastFS = tick()
char:SetAttribute("Flowstate", true)
end
end,
})
local AimTab = Window:AddTab({ Name = "Aim", Icon = "crosshairs", Type = "Single" })
local AimTabbox = AimTab:AddCenterTabbox("Aim Features")
local SubTabSilentAim = AimTabbox:AddTab({ Name = "Silent Aim ToF", Icon = "crosshairs" })
local SubTabFlashlight = AimTabbox:AddTab({ Name = "Aim Flashlight", Icon = "lucide:flashlight" })
local SilentAimGroup = SubTabSilentAim:AddDependencyGroupbox({
Name        = "Silent Aim Twist of Fate",
Icon        = "crosshairs",
Collapsible = true,
Collapsed   = false,
})
SilentAimGroup:AddToggle({
Name     = "Silent Aim",
Flag     = "Toggle_Aim_SilentAim",
Default  = false,
Callback = function(v)
VDSettings.Aim.SilentAim = v
if Cache.TargetModeGui then Cache.TargetModeGui.Enabled = v end
end,
})
SilentAimGroup:AddDropdown({
Name     = "Target Part",
Flag     = "Filter_Aim_TargetPart",
Default  = "Torso",
Values   = {"Head", "Torso", "Root"},
Multi    = false,
Callback = function(v) VDSettings.Aim.TargetPart = v end,
})
SilentAimGroup:AddToggle({
Name     = "Enable Prediction",
Flag     = "Toggle_Aim_Prediction",
Default  = true,
Callback = function(v) VDSettings.Aim.Prediction = v end,
})
SilentAimGroup:AddSlider({
Name     = "Predict Bullet Speed",
Flag     = "Slider_Aim_BulletSpeed",
Min      = 50,
Max      = 1000,
Default  = 200,
Rounding = 0,
Callback = function(v) VDSettings.Aim.BulletSpeed = v end,
})
SilentAimGroup:AddToggle({
Name     = "Laser Pointer",
Flag     = "Toggle_Aim_Laser",
Default  = false,
Callback = function(v) VDSettings.Aim.Laser = v end,
})
SilentAimGroup:AddColorPicker({
Name     = "Laser Color",
Flag     = "Color_Aim_LaserColor",
Default  = Color3.fromRGB(255, 0, 0),
Callback = function(color) VDSettings.Aim.LaserColor = color end,
})
local FlashGroup = SubTabFlashlight:AddDependencyGroupbox({
Name        = "Silent Aim Flashlight",
Icon        = "lucide:flashlight",
Collapsible = true,
Collapsed   = false,
})
FlashGroup:AddToggle({
Name     = "Silent Aim Flashlight",
Flag     = "Toggle_Aim_FlashSilent",
Default  = false,
Callback = function(v) VDSettings.Aim.FlashSilent = v end,
})
FlashGroup:AddSlider({
Name     = "Flash Head Offset (Y)",
Flag     = "Slider_Aim_FlashYOffset",
Min      = 1,
Max      = 15,
Default  = 8,
Rounding = 1,
Callback = function(v) VDSettings.Aim.FlashYOffset = v end,
})
local KillerTab = Window:AddTab({ Name = "Killer", Icon = "flame", Type = "Single" })
local KillerTabbox = KillerTab:AddCenterTabbox("Killer Features")
local SubTabKillerAimbot = KillerTabbox:AddTab({ Name = "Aimbot", Icon = "swords" })
local SubTabVeilSpear = KillerTabbox:AddTab({ Name = "Silent Aim Veil", Icon = "lucide:focus" })
local KillerAimbotGroup = SubTabKillerAimbot:AddDependencyGroupbox({
Name        = "Ability",
Icon        = "swords",
Collapsible = true,
Collapsed   = false,
})
KillerAimbotGroup:AddToggle({
Name     = "Aimbot",
Flag     = "Toggle_Killer_AimbotEnabled",
Default  = false,
Callback = function(v) VDSettings.Killer.AimbotEnabled = v end,
})
KillerAimbotGroup:AddSlider({
Name     = "Melee Lock Distance",
Flag     = "Slider_Killer_MeleeLockDistance",
Min      = 5,
Max      = 30,
Default  = 12,
Rounding = 0,
Callback = function(v) VDSettings.Killer.MeleeLockDistance = v end,
})
KillerAimbotGroup:AddSlider({
Name     = "Aimbot Smoothness",
Flag     = "Slider_Killer_AimbotSmoothness",
Min      = 1,
Max      = 10,
Default  = 5,
Rounding = 0,
Callback = function(v) VDSettings.Killer.AimbotSmoothness = v end,
})
local HiddenAbilityGroup = SubTabKillerAimbot:AddDependencyGroupbox({
Name        = "Hidden Abilities",
Icon        = "ninja",
Collapsible = true,
Collapsed   = false,
})
HiddenAbilityGroup:AddToggle({
Name     = "Aim Lock Hidden",
Flag     = "Toggle_Killer_DashLockEnabled",
Default  = false,
Callback = function(v) VDSettings.Killer.DashLockEnabled = v end,
})
local VeilGroup = SubTabVeilSpear:AddDependencyGroupbox({
Name        = "Silent Aim Veil",
Icon        = "lucide:focus",
Collapsible = true,
Collapsed   = false,
})
VeilGroup:AddToggle({
Name     = "Enable Silent Veil",
Flag     = "Toggle_Spear_Enabled",
Default  = false,
Callback = function(v) VDSettings.Killer.Spear.Enabled = v end,
})
VeilGroup:AddToggle({
Name     = "Auto Predict",
Flag     = "Toggle_Spear_AutoPredict",
Default  = false,
Callback = function(v) VDSettings.Killer.Spear.AutoPredict = v end,
})
VeilGroup:AddSlider({
Name     = "Lead Multiplier",
Flag     = "Slider_Spear_LeadMultiplier",
Min      = 0.1,
Max      = 5,
Default  = 1.4,
Rounding = 1,
Callback = function(v) VDSettings.Killer.Spear.LeadMultiplier = v end,
})
VeilGroup:AddSlider({
Name     = "Spear Speed",
Flag     = "Slider_Spear_CustomSpeed",
Min      = 50,
Max      = 200,
Default  = 165,
Rounding = 0,
Callback = function(v) VDSettings.Killer.Spear.CustomSpeed = v end,
})
VeilGroup:AddSlider({
Name     = "Spear Gravity",
Flag     = "Slider_Spear_CustomGravity",
Min      = 10,
Max      = 200,
Default  = 103,
Rounding = 0,
Callback = function(v) VDSettings.Killer.Spear.CustomGravity = v end,
})
VeilGroup:AddToggle({
Name     = "ESP Tracker Target",
Flag     = "Toggle_Spear_ShowTracker",
Default  = false,
Callback = function(v) VDSettings.Killer.Spear.ShowTracker = v end,
})
VeilGroup:AddToggle({
Name     = "Show Veil FOV",
Flag     = "Toggle_Spear_ShowFOV",
Default  = false,
Callback = function(v) VDSettings.Killer.Spear.ShowFOV = v end,
})
VeilGroup:AddSlider({
Name     = "Veil FOV Radius",
Flag     = "Slider_Spear_FovRadius",
Min      = 30,
Max      = 500,
Default  = 150,
Rounding = 0,
Callback = function(v) VDSettings.Killer.Spear.FovRadius = v end,
})
VeilGroup:AddColorPicker({
Name     = "FOV Color",
Flag     = "Color_Spear_FovColor",
Default  = Color3.fromRGB(108, 92, 231),
Callback = function(v) VDSettings.Killer.Spear.FovColor = v end,
})
VeilGroup:AddSlider({
Name     = "FOV Transparency",
Flag     = "Slider_Spear_FovTransparency",
Min      = 0.1,
Max      = 1,
Default  = 0.5,
Rounding = 1,
Callback = function(v) VDSettings.Killer.Spear.FovTransparency = v end,
})
local AuraModGroup = SubTabVeilSpear:AddDependencyGroupbox({
Name        = "Aura Mode Modifier",
Icon        = "flame",
Collapsible = true,
Collapsed   = false,
})
AuraModGroup:AddSlider({
Name     = "Aura Spear Speed",
Flag     = "Slider_Spear_AuraV0",
Min      = 50,
Max      = 400,
Default  = 165,
Rounding = 0,
Callback = function(v) VDSettings.Killer.Spear.PROF.aura.v0 = v end,
})
AuraModGroup:AddSlider({
Name     = "Aura Spear Gravity",
Flag     = "Slider_Spear_AuraG",
Min      = 10,
Max      = 200,
Default  = 96,
Rounding = 0,
Callback = function(v) VDSettings.Killer.Spear.PROF.aura.g = v end,
})
local MiscTab = Window:AddTab({ Name = "Misc", Icon = "box", Type = "Single" })
local MiscTabbox = MiscTab:AddCenterTabbox("Miscellaneous")
local SubTabMovement = MiscTabbox:AddTab({ Name = "Movement", Icon = "person-running" })
local SubTabInfo = MiscTabbox:AddTab({ Name = "Info Overlay", Icon = "circle-i" })
local PhysicsGroup = SubTabMovement:AddDependencyGroupbox({
Name        = "Character Physics",
Icon        = "person-running",
Collapsible = true,
Collapsed   = false,
})
PhysicsGroup:AddToggle({
Name     = "Noclip",
Flag     = "Toggle_Misc_Noclip",
Default  = false,
Callback = function(v)
VDSettings.Misc.Noclip = v
if not v then
local char = Players.LocalPlayer.Character
if char then
local bodyParts = {"HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "Head"}
for _, partName in ipairs(bodyParts) do
local part = char:FindFirstChild(partName)
if part and part:IsA("BasePart") then
part.CanCollide = true
end
end
end
end
end,
})
PhysicsGroup:AddToggle({
Name     = "Speed Hack",
Flag     = "Toggle_Misc_SpeedHack",
Default  = false,
Callback = function(v) VDSettings.Misc.SpeedHack = v end,
})
PhysicsGroup:AddSlider({
Name     = "Speed Value",
Flag     = "Slider_Misc_SpeedValue",
Min      = 0.1,
Max      = 1,
Default  = 0.2,
Rounding = 1,
Callback = function(v) VDSettings.Misc.SpeedValue = v end,
})
local StreamGroup = SubTabMovement:AddDependencyGroupbox({
Name        = "Streamer Options",
Icon        = "video-camera",
Collapsible = true,
Collapsed   = false,
})
StreamGroup:AddToggle({
Name     = "Stream Mode",
Flag     = "Toggle_Misc_StreamMode",
Default  = false,
Callback = function(v)
VDSettings.Misc.StreamMode = v
if v then
EnableStreamMode()
else
DisableStreamMode()
end
end,
})
local InfoGroup = SubTabInfo:AddDependencyGroupbox({
Name        = "Game Info Panel",
Icon        = "circle-i",
Collapsible = true,
Collapsed   = false,
})
InfoGroup:AddToggle({
Name     = "Next Killer Prediction",
Flag     = "Toggle_Misc_NextKiller",
Default  = false,
Callback = function(v) VDSettings.Misc.NextKiller = v end,
})
InfoGroup:AddToggle({
Name     = "Next Map Prediction",
Flag     = "Toggle_Misc_NextMap",
Default  = false,
Callback = function(v) VDSettings.Misc.NextMap = v end,
})
InfoGroup:AddStatusList({
Name       = "Prediction",
UpdateRate = 1,
ShowColon  = true,
Rows       = {},
Update     = function()
local Rows = {}
if VDSettings.Misc.NextKiller then
local PlayersList = Players:GetPlayers()
table.sort(PlayersList, function(a, b)
local aAllow = a:GetAttribute("AllowKiller") or false
local bAllow = b:GetAttribute("AllowKiller") or false
if aAllow ~= bAllow then return aAllow end
return (a:GetAttribute("KillerChance") or 0) > (b:GetAttribute("KillerChance") or 0)
end)
local NextKiller = PlayersList[1]
local KillerText
if NextKiller then
KillerText = (NextKiller == Players.LocalPlayer) and "KAMU (You)" or NextKiller.Name
else
KillerText = "Waiting..."
end
table.insert(Rows, {
Text  = "Next Killer",
Value = KillerText,
Tone  = "Error",
})
else
table.insert(Rows, {
Text  = "Next Killer",
Value = "[Disabled]",
Tone  = "Muted",
})
end
if VDSettings.Misc.NextMap then
local MapFolder = workspace:FindFirstChild("Map")
local MapText
local MapTone
if MapFolder then
MapText = DetectMapName()
MapTone = "Accent"
else
MapText = "Lobby / Loading..."
MapTone = "Warning"
end
table.insert(Rows, {
Text  = "Next Map",
Value = MapText,
Tone  = MapTone,
})
else
table.insert(Rows, {
Text  = "Next Map",
Value = "[Disabled]",
Tone  = "Muted",
})
end
return Rows
end,
})
Window:Notify({
Title = "Violence District",
Content = "Play to #Dominate",
Duration = 5
})
task.spawn(function()
pcall(function()
if type(hookmetamethod) == "function" and type(getnamecallmethod) == "function" and type(checkcaller) == "function" then
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
local method = getnamecallmethod()
local args = {...}
if not checkcaller() and method == "FireServer" and typeof(self) == "Instance" then
local sName = self.Name
if VDSettings.Survivor.AntiFall and sName == "Fall" then return end
if VDSettings.Survivor.Invis.State and sName == "UpdateCharacterLook" then
local newArgs = {}
for i, v in ipairs(args) do
if typeof(v) == "CFrame" then newArgs[i] = v * CFrame.new(0, 5000, 0) else newArgs[i] = v end
end
return oldNamecall(self, unpack(newArgs))
end
if VDSettings.Killer.Spear.Enabled and sName == "Spearthrow" then
local aimVec = Cache.Spear.lookVector
if typeof(aimVec) == "Vector3" then
if typeof(args[1]) == "table" and args[1].Direction ~= nil then
args[1].Direction = aimVec.Unit
elseif typeof(args[1]) == "Vector3" then
args[1] = aimVec
end
end
return oldNamecall(self, unpack(args))
end
if VDSettings.Aim.SilentAim and typeof(Cache.LookVector) == "Vector3" and typeof(Cache.TargetPos) == "Vector3" then
if self.Parent and self.Parent.Name == "Twist of Fate" then
if sName == "Fire" then
for i = 1, #args do
if typeof(args[i]) == "Vector3" then args[i] = Cache.LookVector end
end
return oldNamecall(self, unpack(args))
elseif sName == "VisualizeBullet" then
for i = 1, #args do
if typeof(args[i]) == "Vector3" then
if args[i].Magnitude > 10 then args[i] = Cache.TargetPos else args[i] = Cache.LookVector end
elseif typeof(args[i]) == "CFrame" then
local myRoot = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if myRoot then args[i] = CFrame.lookAt(myRoot.Position, Cache.TargetPos) end
end
end
return oldNamecall(self, unpack(args))
end
end
end
end
return oldNamecall(self, ...)
end)
end
end)
end)
Players.LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.5)
SetupHeadIcon(char)
SetupFakePerks(char)
if VDSettings.Survivor.Invis.State then task.wait(0.5) ApplyInvisibility() end
end)
if Players.LocalPlayer.Character then
task.spawn(function()
SetupHeadIcon(Players.LocalPlayer.Character)
SetupFakePerks(Players.LocalPlayer.Character)
end)
end
for _, plr in ipairs(Players:GetPlayers()) do HookKillerAnimation(plr) end
Players.PlayerAdded:Connect(HookKillerAnimation)
RunService.RenderStepped:Connect(function()
pcall(UpdateESP)
pcall(UpdateWorldESP)
pcall(UpdateCamera)
pcall(UpdateAutoSkillCheck)
pcall(UpdateParryVisuals)
pcall(UpdateKillerAimbot)
pcall(UpdateSpearAimbot)
pcall(UpdateFlashlightAim)
pcall(UpdateDashLock)
end)
RunService.Heartbeat:Connect(function(dt)
pcall(UpdateParry)
pcall(UpdateUtility)
pcall(UpdateCombat)
pcall(UpdateMisc, dt)
end)