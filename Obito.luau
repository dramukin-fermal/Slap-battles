local lyrics = [[
They say my hunger's a problem
They tell me to curb my appetite
They say I can't keep myself from trying
A bite of every plate in sight
They worship patience, a virtue
Oh, they tell me gluttony's a sin
But my desire, it's bottomless
I wanna slit your throat and eat 'til I get sick (whoo)
The slaughter's on, I'd love to see you come undone
Unsatisfied until I've got you flayed alive
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
To truss you up in pretty patterns
Oh, to dress your flesh up with the works
Perfectly portioned by a dagger
Serving the finest leftover dessert
Why would I desecrate a carcass?
Oh, why let the offal go to waste?
It's love that guides my cleaver with such tenderness
A perfect strike to fix the horror on your face (whoo)
The slaughter's mine, oh, blood and viscera divine
Preserved and primed, each muscle divvied up to dine
And in the high 我存在 tasting 血淋淋的愛
I'll devour all of you in time
Oh, your heart, aortic work of art
My love, my knife to carve it out your life
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
To snap the sinew, I want to get within you
I want to not forgive you, rigor mortis, mold, and mildew
But, dear, you should be grateful that I won't waste a good meal
That all my love's precision carves a cut to simply die for
To snap the sinew, I want to get within you
I want to scar the tissue butterfly and rectify you
I need to be your afterlife Eucharist
I deify God, oh, fuck the fork and knife
I'll rip in hands and teeth and take a bite
the slaughter's on, I'd love to see you come undone
Unsatisfied until I've got you flayed alive
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
And now the slaughter's mine, my darling, get under the knife
Your broken pride, a cut so perfect in its prime
All that I see, 63 為讓我心醉的你
I'll be waiting so impatiently
Oh, your heart, aortic work of art
My love, my knife to carve it out your life
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
Still praying, hopeless, and in vain
]]
print(lyrics)

local lyrics2 = [[
They say my hunger's a problem
They tell me to curb my appetite
They say I can't keep myself from trying
A bite of every plate in sight
They worship patience, a virtue
Oh, they tell me gluttony's a sin
But my desire, it's bottomless
I wanna slit your throat and eat 'til I get sick (whoo)
The slaughter's on, I'd love to see you come undone
Unsatisfied until I've got you flayed alive
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
To truss you up in pretty patterns
Oh, to dress your flesh up with the works
Perfectly portioned by a dagger
Serving the finest leftover dessert
Why would I desecrate a carcass?
Oh, why let the offal go to waste?
It's love that guides my cleaver with such tenderness
A perfect strike to fix the horror on your face (whoo)
The slaughter's mine, oh, blood and viscera divine
Preserved and primed, each muscle divvied up to dine
And in the high 我存在 tasting 血淋淋的愛
I'll devour all of you in time
Oh, your heart, aortic work of art
My love, my knife to carve it out your life
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
To snap the sinew, I want to get within you
I want to not forgive you, rigor mortis, mold, and mildew
But, dear, you should be grateful that I won't waste a good meal
That all my love's precision carves a cut to simply die for
To snap the sinew, I want to get within you
I want to scar the tissue butterfly and rectify you
I need to be your afterlife Eucharist
I deify God, oh, fuck the fork and knife
I'll rip in hands and teeth and take a bite
the slaughter's on, I'd love to see you come undone
Unsatisfied until I've got you flayed alive
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
And now the slaughter's mine, my darling, get under the knife
Your broken pride, a cut so perfect in its prime
All that I see, 63 為讓我心醉的你
I'll be waiting so impatiently
Oh, your heart, aortic work of art
My love, my knife to carve it out your life
So grab a plate, have a taste 這口味讓我沉醉
I'm still preying on a butcher's vein
Still praying, hopeless, and in vain
]]
print(lyrics2)

local lyrics3 = [[
We could leave the lights on
Sun tan
We could get lunch
Aw, man
I think that I like you
(You do?)
Yeah
But something bugs me 'bout the way you lick your envelopes so

I'm out on the block again
So hopped up that I can't pretend
Two time
Stay friends
Problem that you can't defend
Hands up, feel okay
Whose heart could I break today?
Two time
Stay friends
Problem that you can't defend
Oh...

Slip me in your pocket
Chew the way out
Oh man, was that your last piece of gum?
(Come on!) But we both wanted some
I know, and you can get in the hole too
E-R, what can you say
I never read the package anyway

I'm out on the block again
So hopped up that I can't pretend
Two time
Stay friends
Problem that you can't defend
Hands up, feel okay
Whose heart could I break today?
Two time
Stay friends
Problem that you can't defend
]]
print(lyrics3)

game.StarterGui:SetCore("SendNotification", {Title = "Credit", Text = "@Indifferenceguy", Duration = 3})
if not PublicIds then
PublicIds = {
	-- Animation IDs
	Anim = {
		-- Glove attack animations (for detection)
		gloveAttack = {
			"13526154547", -- slap
			"16102850016", -- dual slap
			"13526158494", -- extended slap
			"16294032647", -- slapstick slap
			"90524879630106", -- slapstick slap2
			"134954960138305", -- friction slap
			"109511274923523", -- boxer 1
			"133068451086106", -- boxer 2
			"116559255414365", -- boxer 3
			"82224515307861", -- triple 1
			"126666659393201", -- triple 2
			"92696348598076", -- triple 3
			"86093582820019", -- Glaxe 1
			"97212410160106", -- Glaxe 2
			"16102722988", -- bull
			"135557283152371", -- silly
			"123504660542524", -- chainsaw
			"82587790769712", -- roaring slash1
			"91161384418500", -- roaring slash2
			"130226050212192", -- roaring ability 
			"120061731209987", -- spin mastery
			"78054964739049", -- opera ability 
			"129946691741815", -- jockey poke stand
			"99967316402301", -- jocket poke sit
			"15636048652", -- "heavy slap"
		},
		
		-- Custom attack animations
		customAttack = {
			"113925147812007", -- snowballsmash slap
			"13526154547", -- clock tyrant slap
			"15875650254", -- pan 1
			"15875619432", -- pan 2
			"16570306782", -- beatdown
		},
		
		-- Forbidden animations (immune states)
		forbidden = {
			"16102819260", -- parry
			"13671935940", -- rob idle 
			"13675136513", -- rob transformation 
			"17569574003", -- spoonful float
			"17332793965", -- sbeve idle
			"13552944381", -- Counter taunt 
			"17332790610", -- sbeve idle2
			"18139201258", -- elgato pet1
			"18139141113", -- elgato pet2
		},
		
		-- Attack animations
		slap1 = "92696348598076",
		slap2 = "91161384418500",
		slap3 = "135557283152371",
		critslap = "91293014684381",
		
		backflip = "16738720919",
		frontflip = "108032463038278",
		roll = "16299510063",
		backdash = "100674694858812",
		dive = "16580505922",
		sleep = "181526230",
		katonLoop = "135382023562522",
		katonEnd = "15561810697",
		suckHandsign = "89262415952223",
		
		norm_idle = "128748352096170",
		tool_idle = "109152521102987",
		norm_walk = "101931532422335",
		tool_walk = "113565532838951",
		norm_E_sprint = "100875567481070",
		norm_E_atk = "117334637291968",
		norm_R = "89140327802925",
		air_E = "122236786027040",
		air_R_roll = "108032463038278",
		air_R_stomp = "16176961083",
		tool_E = "78920796244566",
		tool_R = "111722716436245",
		void_E = "16144808533",
		void_R = "78920796244566",
		tool_T = "89140327802925",
	},
	
	-- Sound Effects IDs
	SFX = {
		equipSuccess = "3314301672",
		equipFail = "877986525",
		
		msharigan = "102015222706067",
		intangibility = "133147551245824"
	},
	
	-- Image IDs
	Images = {
		-- Button images
		RButton = "82975918449230",
		EButton = "117753257776333",
		TButton = "104952241285295",
		FButton = "103761490643698",
		QButton = "79116086097383",
		banner = "132094587",
		
		-- Custom images
		robloxDefaultBtn = "97166444",
		iconBadge = "982385992",
		banner = "80274437200197",
		
		kamui = "133332579354332",
	},
	
	Models = {
		mask = "rbxassetid://4652820133",
		kamuiEye = "rbxassetid://10244330",
	},
	PlaceIds = {
	},
}
end

RButtonImageId = PublicIds.Images.RButton
EButtonImageId = PublicIds.Images.EButton
BannerImageId = PublicIds.Images.banner
TButtonImageId = PublicIds.Images.TButton
FButtonImageId = PublicIds.Images.FButton
QButtonImageId = PublicIds.Images.QButton

GloveSettings = GloveSettings or {
	ShowHitboxes = true,
	MuteClientSFX = false,
	HideVisual = false
}

----------BYPASS----------
_G.NamecallBypass = true 
if not _G.NamecallBypass then
	_G.NamecallBypass = hookmetamethod(game, "__namecall", function(self, ...)
	   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
		   return
	   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
		   return
	   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
		   return
	   end
	   return _G.NamecallBypass(self, ...)
	end)
end

----------LOADSTRING----------
local SlapSystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/dramukin-fermal/Slap-battles/refs/heads/module/SlapSystemPlus.lua"))()
local Moai, CloneName = loadstring(game:HttpGet("https://raw.githubusercontent.com/dramukin-fermal/Slap-battles/refs/heads/module/Special_Text.lua"))()

----------VARIABLES----------
local PlaceId, JobId = game.PlaceId, game.JobId
local Camera = game.Workspace.CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local RunService2 = game:FindService("RunService")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local ContextActionService = game:GetService("ContextActionService")

local isMobile = UserInputService.TouchEnabled
local Lobby = workspace.Lobby
local GloveStands = Lobby.GloveStands

local STUN = true
local LoopWSValue = 22
local isSneaking, isPhasing, isVoiding = false, false, false
local DamageIFrame = false
local DamageConnection, PartDamageConnection, AliveConnection, DeathConnection, DisableScriptConnection, JumpConnection
local HitCD

----------GLOVE SETTINGS----------
local NewGlove = "Obito"
local NewToolName = "Grafted Thorn"
local NewTooltip = "*it's grafted on your body"
local GloveRequirement = "Riftshot"
local GloveRequirementAlt = "Untitled Tag Glove"
local woodRod

if GloveRequirementAlt == "" then GloveRequirementAlt = nil end

local GeneralCustomGloveFolder = ReplicatedStorage:FindFirstChild("DonjoCustomStorage")
if not GeneralCustomGloveFolder then
	GeneralCustomGloveFolder = Instance.new("Folder", ReplicatedStorage)
	GeneralCustomGloveFolder.Name = "DonjoCustomStorage"
end

local CustomAnimationFolder = GeneralCustomGloveFolder:FindFirstChild("AnimStorage" .. NewGlove)
if not CustomAnimationFolder then
	CustomAnimationFolder = Instance.new("Folder", GeneralCustomGloveFolder)
	CustomAnimationFolder.Name = "AnimStorage" .. NewGlove
end

----------STAND SETTINGS----------
local GloveStand_Design = {
	AbilityStat = "kamui dimension",
	PowerStat = 52,
	SpeedStat = 16,
	Key = "PRESS E TO USE",
	Require = (not GloveRequirementAlt and 'OWN THE "' .. GloveRequirement:upper() .. '" GLOVE') or ('OWN THE "' .. GloveRequirement:upper() .. '" & "' .. GloveRequirementAlt:upper() .. '" GLOVE'),
	SlapRequired = false,
	Design = {
		BannerImageId = PublicIds.Images.banner,
		GloveMaterial = Enum.Material.Plastic,
		GloveColor = Color3.new(0,0,0),
		GloveTransparency = 0,
		GloveReflectance = 0.01,
	}
}
----------UTILITY FUNCTIONS----------
local function ListDestroy(...)
	for i, obj in ipairs({...}) do
		if obj and obj.Parent then
			obj:Destroy()
			obj = nil
		end
	end
end

local function DisableConnections(...)
	local connects = {...}
	for i,v in pairs(connects) do
		v:Disconnect() 
		v = nil
	end
end 

local function swait()
	RunService.Stepped:Wait()
end

local twait = function(t)
	task.wait(t)
end

local EquippedValue = ReplicatedStorage.PlayerData[LocalPlayer.Name].Inventory.Equipped
local function GetRealGlove()
	local data = game:GetService("HttpService"):JSONDecode(EquippedValue.Value)
	if data and data.Glove then
		return data.Glove
	else
		return nil
	end
end

local function PlayButtonVisible(Value)
	for i,v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
		if v.Name == "GoToPortal" then
			v.Visible = Value
		end
	end
end

local function HaveGlove(Name)
	if LocalPlayer and LocalPlayer:FindFirstChild("_unlockedGloves") then
		if LocalPlayer._unlockedGloves:FindFirstChild(Name) and LocalPlayer._unlockedGloves[Name].Value == true then
			return true
		end
	end
	return false
end

local function FixGloveEquip()
	if LocalPlayer.leaderstats.Glove.Value == NewGlove then return end
	if LocalPlayer.leaderstats.Glove.Value ~= GetRealGlove() then
		LocalPlayer.leaderstats.Glove.Value = GetRealGlove()
	end
end

local antiFlopConnection = nil
local function AntiFlop(bool)
	if bool then
		if antiFlopConnection then return end
		antiFlopConnection = RunService.Heartbeat:Connect(function()
			local character = LocalPlayer.Character
			if character then
				local humanoid = character:FindFirstChildWhichIsA("Humanoid")
				if humanoid and humanoid:GetState() == Enum.HumanoidStateType.FallingDown then
					humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
				end
			end
		end)
	else
		if antiFlopConnection then
			antiFlopConnection:Disconnect()
			antiFlopConnection = nil
		end
	end
end

----------MATH----------
local inf = math.huge
local random = math.random
local rad = math.rad
local wait = task.wait
local spawn = task.spawn

----------GUI FUNCTIONS----------
local function UICorner(instance, radius)
	local corner = Instance.new("UICorner", instance)
	corner.CornerRadius = UDim.new(0, radius)
	return corner
end

local function UIStroke(instance, thickness, Color)
	local Stroke = Instance.new("UIStroke", instance)
	Stroke.Color = Color or Color3.new(0, 0, 0)
	Stroke.Thickness = thickness
	return Stroke
end

local function UIGradient(Parent, ColorO, ColorI)
	local Color = Instance.new("UIGradient", Parent)
	local ColorPicked = ColorO or ThemeColor
	local ColorPicked2 = ColorI or Color3.new(1,1,1)
	Color.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, ColorPicked),ColorSequenceKeypoint.new(1, ColorPicked2)})
	Color.Transparency = NumberSequence.new(0)
	Color.Rotation = 90
	return Color
end

local function BubbleNotify(message, duration)
	spawn(function()
		local screenGui = LocalPlayer.PlayerGui:FindFirstChild("RetroAbilityChangePopUp")
		if not screenGui then
			screenGui = Instance.new("ScreenGui")
			screenGui.Name = "RetroAbilityChangePopUp"
			screenGui.Parent = LocalPlayer.PlayerGui
			screenGui.ResetOnSpawn = false
		end
		for i,v in pairs(screenGui:GetChildren()) do
			v:Destroy()
		end
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "ChangeNotification"
		textLabel.Text = message
		textLabel.TextColor3 = Color3.new(1,1,1)
		textLabel.TextSize = 30
		textLabel.Font = Enum.Font.Cartoon
		textLabel.BackgroundTransparency = 1
		textLabel.BorderSizePixel = 0
		textLabel.Size = UDim2.new(0, 0, 0, 0)
		textLabel.Position = UDim2.new(0.5, 0, -.2, 0)
		textLabel.AnchorPoint = Vector2.new(0.5, 0)
		textLabel.Parent = screenGui
		
		local uiStroke = UIStroke(textLabel, 1)
		
		local scaleTween = TweenService:Create(textLabel,TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),{TextTransparency = 0, Size = UDim2.new(0, 450, 0, 90)})
		scaleTween:Play()
		
		local duration = duration or 1
		wait(duration)
		
		local scaleDownTween = TweenService:Create(textLabel,TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),{TextTransparency = 1, Size = UDim2.new(0, 400, 0, 80)})
		scaleDownTween:Play()
		
		scaleDownTween.Completed:Connect(function()
			textLabel:Destroy()
		end)
	end)
end

local function AddContextActionButton(Text, ImageId, Pos, func, downfunc, upfunc)
	local CASC = LocalPlayer.PlayerGui:FindFirstChild("CustomGlove_ContextAction_GUI")
	if not CASC then
		CASC = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
		CASC.Name = "CustomGlove_ContextAction_GUI"
		CASC.ResetOnSpawn = false
	end
	if not isMobile then return end
	local CAF = CASC:FindFirstChild("ContextActionFrame")
	if not CAF then
		CAF = Instance.new("Frame", CASC)
		CAF.BackgroundTransparency = 1
		CAF.Position = UDim2.new(.7, 0, .5, 0)
		CAF.Size = UDim2.new(0.3, 0, 0.5, 0)
		CAF.Name = "ContextActionFrame"
	end
	local CAB = Instance.new("ImageButton", CAF)
	CAB.Size = UDim2.new(0.45, 0, 0.45, 0)
	CAB.Name = "ContextActionButton"..Text
	CAB.Position = Pos
	CAB.BackgroundColor3 = Color3.new(0, 0, 0)
	CAB.Image = "https://www.roblox.com/asset/?id=" .. ImageId
	CAB.ImageTransparency = 1
	CAB.BackgroundTransparency = 1
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", CAB)
	CAB.AnchorPoint = Vector2.new(0.5, 0.5)
	
	local ActionIcon = Instance.new("ImageLabel", CAB)
	ActionIcon.Size = UDim2.new(0.65, 0, 0.65, 0)
	ActionIcon.Position = UDim2.new(0.175, 0, 0.175, 0)
	ActionIcon.BackgroundColor3 = Color3.new(0, 0, 0)
	ActionIcon.ImageColor3 = Color3.new(1,1,1)
	ActionIcon.Image = "rbxassetid://" .. ImageId
	ActionIcon.ImageTransparency = 0
	ActionIcon.BackgroundTransparency = 1
	ActionIcon.Active  = false
	
	local tweenInfoHover = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfoClick = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local normalSize = ActionIcon.Size
	local normalPosition = ActionIcon.Position
	
	local function getCenteredPosition(originalPos, originalSize, newSize)
		local newXScale = originalPos.X.Scale + (originalSize.X.Scale - newSize.X.Scale) / 2
		local newXOffset = originalPos.X.Offset + (originalSize.X.Offset - newSize.X.Offset) / 2
		local newYScale = originalPos.Y.Scale + (originalSize.Y.Scale - newSize.Y.Scale) / 2
		local newYOffset = originalPos.Y.Offset + (originalSize.Y.Offset - newSize.Y.Offset) / 2
		return UDim2.new(newXScale, newXOffset, newYScale, newYOffset)
	end
	
	local hoverScale = 0.95
	local clickScale = 1.1
	
	local hoverSize = UDim2.new(normalSize.X.Scale * hoverScale, normalSize.X.Offset * hoverScale, normalSize.Y.Scale * hoverScale, normalSize.Y.Offset * hoverScale)
	local hoverPosition = getCenteredPosition(normalPosition, normalSize, hoverSize)
	
	local clickSize = UDim2.new(normalSize.X.Scale * clickScale, normalSize.X.Offset * clickScale, normalSize.Y.Scale * clickScale, normalSize.Y.Offset * clickScale)
	local clickPosition = getCenteredPosition(normalPosition, normalSize, clickSize)
	
	local normalColor = ActionIcon.ImageColor3
	local hoverColor = Color3.new(ActionIcon.ImageColor3.R /2, ActionIcon.ImageColor3.G/2, ActionIcon.ImageColor3.B/2)
	
	if func then CAB.MouseButton1Click:Connect(func) end 
	if downfunc then CAB.MouseButton1Down:Connect(downfunc) end
	if upfunc then CAB.MouseButton1Click:Connect(upfunc) end
	
	CAB.MouseEnter:Connect(function()
		TweenService:Create(ActionIcon, tweenInfoHover, {Size = hoverSize, Position = hoverPosition, ImageColor3 = hoverColor}):Play()
	end)
	
	CAB.MouseLeave:Connect(function()
		TweenService:Create(ActionIcon, tweenInfoHover, {Position = normalPosition, ImageColor3 = normalColor, Size = normalSize}):Play()
	end)
	
	LocalPlayer.CharacterAdded:Connect(function()
		if CAF then CAF:Destroy() end
	end)
	
	pcall(function()
		LocalPlayer.Character.Humanoid.Died:Connect(function()
			if CAF then CAF:Destroy() end
		end)
	end)
	
	return CAB
end

local function AddCooldownLabel(parent, size, pos, time)
	if not parent or not parent.Parent then return end 
	local frame = Instance.new("Frame")
	frame.Size = size
	frame.Position = pos
	frame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
	frame.BackgroundTransparency = 0
	frame.BorderSizePixel = 0.5
	frame.Parent = parent
	
	local cooldownBar = Instance.new("Frame")
	cooldownBar.Size = UDim2.new(1, 0, 1, 0)
	cooldownBar.Position = UDim2.new(0, 0, 0, 0)
	cooldownBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	cooldownBar.BackgroundTransparency = 0
	cooldownBar.BorderSizePixel = 0
	cooldownBar.Parent = frame
	
	local cancel = false
	local tween = nil
	
	local function startTween()
		local tweenInfo = TweenInfo.new(time,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
		local goal = {Size = UDim2.new(0, 0, 1, 0),Position = UDim2.new(0, 0, 0, 0)}
		tween = TweenService:Create(cooldownBar, tweenInfo, goal)
		tween:Play()
		tween.Completed:Connect(function()
			if not cancel then
				frame:Destroy()
			end
		end)
	end
	startTween()
	local function CancelCD()
		cancel = true
		if tween then
			tween:Cancel()
		end
		frame:Destroy()
	end
	
	local function DestroyCD()
		cancel = true
		if tween then
			tween:Cancel()
		end
		frame:Destroy()
	end
	
	return {Frame = frame,CancelCD = CancelCD,DestroyCD = DestroyCD}
end

local function AddRobloxDefaultButton(Text, TS, Pos, func, args)
	local args = args or nil
	local CASC = LocalPlayer.PlayerGui:FindFirstChild("CustomGlove_ContextAction_GUI")

	if not CASC then
		CASC = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
		CASC.Name = "CustomGlove_ContextAction_GUI"
		CASC.ResetOnSpawn = false
	end

	local CAF = CASC:FindFirstChild("ContextActionFrame")
	if not CAF then
		CAF = Instance.new("Frame", CASC)
		CAF.BackgroundTransparency = 1
		CAF.Position = UDim2.new(.7, 0, .5, 0)
		CAF.Size = UDim2.new(0.3, 0, 0.5, 0)
		CAF.Name = "ContextActionFrame"
	end
	local CAB = Instance.new("ImageButton", CAF)
	CAB.Size = UDim2.new(0.25, 0, 0.25, 0)
	CAB.Name = "ContextActionButton"..Text
	CAB.Position = Pos
	CAB.BackgroundColor3 = Color3.new(0, 0, 0)
	CAB.Image = "https://www.roblox.com/asset/?id=" .. PublicIds.Images.robloxDefaultBtn
	CAB.ImageTransparency = 0
	CAB.BackgroundTransparency = 1
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", CAB)
	CAB.AnchorPoint = Vector2.new(0.5, 0.5)
	
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Size = UDim2.new(.8, 0, .8, 0)
	TextLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Text = Text
	TextLabel.TextSize = TS or 16
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextColor3 = Color3.new(1,1,1)
	TextLabel.Font = Enum.Font.Cartoon
	TextLabel.Parent = CAB
	
	local tweenInfoHover = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfoClick = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local normalColor = CAB.ImageColor3
	local hoverColor = Color3.new(CAB.ImageColor3.R /2, CAB.ImageColor3.G/2, CAB.ImageColor3.B/2)
	
	CAB.MouseButton1Click:Connect(function()
		func(args)
	end)
	
	CAB.MouseEnter:Connect(function()
		TweenService:Create(CAB, tweenInfoHover, {ImageColor3 = hoverColor}):Play()
	end)
	
	
	CAB.MouseLeave:Connect(function()
		TweenService:Create(CAB, tweenInfoClick, {ImageColor3 = normalColor}):Play()
	end)
	
	LocalPlayer.CharacterAdded:Connect(function()
		if CAF then CAF:Destroy() end
	end)
	
	pcall(function()
		LocalPlayer.Character.Humanoid.Died:Connect(function()
			if CAF then CAF:Destroy() end
		end)
	end)
	
	return CAB
end

----------CHARACTER CHECK----------
local function GetBodyParts(plr)
	if plr and plr.Character then
		local Character = plr.Character
		local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 1)
		local Humanoid = Character:FindFirstChild("Humanoid")
		return Character, Humanoid, HumanoidRootPart
	end
end

local function FullCharacter(plr, ignore)
	local player = plr or LocalPlayer
	local ignore = ignore or {}
	local ragdoll_ignore = ignore.ragdoll or false
	local health_ignore = ignore.health or false
	local height_ignore = ignore.height or false
	local immune_ignore = ignore.immune or false
	
	if not player.Character then return false end
	
	local char = player.Character
	local humanoid = char:FindFirstChildWhichIsA("Humanoid")
	local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	local root = char:FindFirstChild("HumanoidRootPart")
	local head = char:FindFirstChild("Head")
	
	if not (torso and humanoid and root) then return false end
	if not health_ignore and humanoid.Health <= 0 then return false end
	
	if player ~= LocalPlayer then
		for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
			for _, id in pairs(PublicIds.Anim.forbidden) do
				if track.Animation.AnimationId == "rbxassetid://"..id then
					return false
				end
			end
		end
		
		if head and head:FindFirstChild("UnoReverseCard") and not immune_ignore then return false end
		if char:FindFirstChild("Stevebody") then return false end
		if char:FindFirstChild("rock") then return false end
		if root.BrickColor == BrickColor.new("New Yeller") and not immune_ignore then return false end
		if char:FindFirstChild("Mirage") and not immune_ignore then return false end
		if char:FindFirstChild("Sphere") then return false end
		if root:FindFirstChild("Digging") and not immune_ignore then return false end
		if char:FindFirstChild("isInArena") and char.isInArena.Value == false and not immune_ignore then return false end
		if player.leaderstats and player.leaderstats.Glove.Value == "Spectator" and not immune_ignore then return false end
		if char:FindFirstChild("RobTransformed") and char.RobTransformed.Value ~= false and not immune_ignore then return false end
		
		local startPos = root.Position
		local ray = workspace:Raycast(startPos, Vector3.new(0, -500, 0), RaycastParams.new({
			FilterDescendantsInstances = {char},
			FilterType = Enum.RaycastFilterType.Blacklist
		}))
		
		if height_ignore then return true end
		if ray and ray.Instance.Transparency ~= 1 then return true end
		
		return false
	end
	
	if ragdoll_ignore then return true end
	if not ragdoll_ignore and char:FindFirstChild("Ragdolled") and char.Ragdolled.Value == false then return true end
	
	return false
end

----------PLAYER FINDING----------
local function getNearestPlayer(Range, morecheck)
	local nearestPlayer = nil
	local shortestDistance = Range
	if not FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then return end
	
	local localPosition = LocalPlayer.Character.HumanoidRootPart.Position

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and FullCharacter(player, {height = true, ragdoll = true}) and (morecheck or FullCharacter(player)) then
			local targetPosition = player.Character.HumanoidRootPart.Position
			local distance = (targetPosition - localPosition).magnitude

			if distance < shortestDistance then
				shortestDistance = distance
				nearestPlayer = player
			end
		end
	end

	return nearestPlayer, shortestDistance
end

local function IsPlayerChild(v, check, randollnocount)
	if not v.Parent or v:IsA("Tool") then return false end
	local randollnocount = randollnocount or false
	local player = Players:GetPlayerFromCharacter(v.Parent)
	if player and player ~= LocalPlayer then
		if check then
			if FullCharacter(player, {ragdoll = true}) then
				return true
			end
		else
			return true
		end
	end
	return false
end

local AntiCollisionRunning = false
local function AntiCollision(value)
	AntiCollisionRunning = value
	if AntiCollisionRunning then
		task.spawn(function()
			while AntiCollisionRunning do
				for _, player in pairs(Players:GetPlayers()) do
					if player ~= LocalPlayer and FullCharacter(player, {height = true, health = true, ragdoll = true}) then
						local character = player.Character
						if character then
							for _, part in pairs(character:GetDescendants()) do
								if part:IsA("BasePart") and part.Name ~= "rock" then
									part.CanCollide = false
								end
							end
						end
					end
				end
				twait()
			end
		end)
	end
end

----------SOUNDS----------
local function PlaySFX(par, Id, Vol, Loop, TP)
	if GloveSettings.MuteClientSFX then return end
	local Sound = Instance.new("Sound")
	Sound.Parent = par
	Sound.Name = "rbxassetid://".. Id
	Sound.SoundId = "rbxassetid://".. Id
	Sound.Volume = Vol or 1
	Sound.Looped = Loop or false
	Sound:Play()
	Sound.TimePosition = TP or 0
	Sound.Ended:Connect(function()
		Sound:Destroy()
	end)
	return Sound
end

----------ANIMATIONS----------
local function ReplaceAnim(Name, Id)
	if not tostring(Id):find("asset") then Id = "rbxassetid://" .. Id end
	for i,v in pairs(LocalPlayer.Character.Animate:GetChildren()) do
		if v.Name == Name then
			for i,g in pairs(v:GetChildren()) do
				g.AnimationId = Id
			end
		end
	end
end

local function IsAnimLoaded(Name)
	if not FullCharacter() or not CustomAnimationFolder then return false end
	local humanoid = LocalPlayer.Character.Humanoid
	local animation = CustomAnimationFolder:FindFirstChild(Name)
	
	if not animation then return false end
	for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
		if track.Animation == animation then
			return true
		end
	end
	return false
end

local function IsPlayingAnim(name, id)
	local humanoid = LocalPlayer.Character.Humanoid
	if not humanoid then return false end
	
	local animId = id and ("rbxassetid://"..id) or name
	
	if type(name) == "number" or string.find(tostring(name), "assetid") then
		animId = "rbxassetid://"..name
	end
	
	for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
		local anim = track.Animation
		if anim and anim.AnimationId == animId then
			return true
		end
	end
	return false
end

local function LoadAnim(Name, Anim)
	if not FullCharacter() or not CustomAnimationFolder then return end
	
	if IsAnimLoaded(Name) then
		return CustomAnimationFolder:FindFirstChild(Name)
	end
	
	local humanoid = LocalPlayer.Character.Humanoid
	local animation = CustomAnimationFolder:FindFirstChild(Name)
	
	if animation == nil then
		animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://"..Anim
		animation.Name = Name
		animation.Parent = CustomAnimationFolder 
	else
		animation.AnimationId = "rbxassetid://"..Anim
	end
	
	if animation then
		local animInstance = humanoid:LoadAnimation(animation)
	end
	
	return animation 
end

local function PlayAnim(Name, Anim, Speed, TimePosition)
	if type(Name) == "number" or string.find(tostring(Name), "assetid") then
		Name, Anim, Speed, TimePosition = "rbxassetid://"..Name, Name, Anim, Speed
	end
	
	local animation = LoadAnim(Name, Anim)
	if animation then
		local humanoid = LocalPlayer.Character.Humanoid
		local animInstance = nil
		
		for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
			if track.Animation == animation then
				animInstance = track
				break
			end
		end
		
		if not animInstance then
			animInstance = humanoid:LoadAnimation(animation)
		end
		
		animInstance:Play()
		animInstance:AdjustSpeed(Speed)
		if TimePosition then
			animInstance.TimePosition = TimePosition
		end
	end
	return animation 
end

local function StopAnim(Name, Anim)
	local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
	if not Humanoid then return end
	if type(Name) == "number" or string.find(tostring(Name), "assetid") then
		Name, Anim = nil, Name
	end
	local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
	for _, v in pairs(ActiveTracks) do
		if v.Animation.AnimationId == "rbxassetid://"..Anim then
			v:Stop()
		end
	end
end

local function AnimTP(Name, Anim, TimePosition)
	local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
	if not Humanoid then return end
	if type(Name) == "number" or string.find(tostring(Name), "assetid") then
		Name, Anim, TimePosition = nil, Name, Anim
	end
	local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
	for _, v in pairs(ActiveTracks) do
		if v.Animation.AnimationId == "rbxassetid://"..Anim then
			v.TimePosition = TimePosition
		end
	end
end

local function AnimSpeed(Name, Anim, Speed)
	local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
	if not Humanoid then return end
	if type(Name) == "number" or string.find(tostring(Name), "assetid") then
		Name, Anim, Speed = nil, Name, Anim
	end
	local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
	for _, v in pairs(ActiveTracks) do
		if v.Animation.AnimationId == "rbxassetid://"..Anim then
			v:AdjustSpeed(Speed)
		end
	end
end

local function FOVTween(EndFov, Time)
	local Info = TweenInfo.new(Time, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local Properties = {FieldOfView = EndFov}
	local tween = TweenService:Create(Camera, Info, Properties)
	tween:Play()
	return info, Properties, tween
end

----------HITBOX----------
local function AddHitbox(position, size, duration, Ragdoll_Destroy_Hitbox, callback)
    local duration = duration or math.huge
    local lp = LocalPlayer
    local Character = lp.Character or lp.CharacterAdded:Wait()
    local Torso = Character:WaitForChild("HumanoidRootPart")
    local Ragdoll_Destroy_Hitbox = Ragdoll_Destroy_Hitbox or false
    
    local hitbox = Instance.new("Part", workspace.Terrain)
    hitbox.Size = size
    hitbox.Anchored = false
    hitbox.CanCollide = false
    hitbox.CFrame = Torso.CFrame
    hitbox.Transparency = 1
    hitbox.Color = Color3.new(1,0,0)
    hitbox.Material = Enum.Material.ForceField
    hitbox.CastShadow = false 
    
    local weld = Instance.new("Weld")
    weld.Part0 = hitbox
    weld.Part1 = Torso
    weld.C0 = position
    weld.Parent = hitbox
    hitbox.CanCollide = false
    hitbox.Massless = true
    
    local hitboxObj = {}
    local destroyed = false
    
    function hitboxObj:Green()
        if destroyed then return end
        local notify = Instance.new("Part")
        notify.Size = size
        notify.Anchored = true
        notify.CanCollide = false
        notify.CFrame = Torso.CFrame * position
        notify.Transparency = 0.3
        notify.Color = Color3.new(0,1,0)
        notify.Material = Enum.Material.ForceField
        notify.CastShadow = false
        notify.Parent = workspace.Terrain
        Debris:AddItem(notify, 0.5)
    end
    
    function hitboxObj:Destroy()
        if destroyed then return end
        destroyed = true
        if hitbox and hitbox.Parent then
            hitbox:Destroy()
        end
        if touchedConnection then
            touchedConnection:Disconnect()
        end
    end
    
    task.spawn(function()
        while true do
            if GloveSettings.ShowHitboxes ~= true then break end
            if hitbox and hitbox.Parent and hitbox.Color == Color3.new(1,0,0) then
                local hitbox_visible = Instance.new("Part")
                hitbox_visible.Parent = hitbox
                hitbox_visible.Transparency = .7
                hitbox_visible.Anchored = true
                hitbox_visible.CFrame = hitbox.CFrame
                hitbox_visible.Color = Color3.new(1,0,0)
                hitbox_visible.Material = Enum.Material.ForceField
                hitbox_visible.Size = size
                hitbox_visible.CanCollide = false
                hitbox_visible.Massless = true
                hitbox_visible.CastShadow = false 
                Debris:AddItem(hitbox_visible, .2)
                wait(.01)
            else
                break
            end
        end
    end)
    
    local function HitboxTouch()
        if destroyed then return end
        hitbox.Color = Color3.new(0,1,0)
        if GloveSettings.ShowHitboxes ~= false then
            hitbox.Transparency = .7
        end
        hitbox.Anchored = true
        for i,v in pairs(hitbox:GetChildren()) do
            if v:IsA("Weld") or v.Name == "hitbox_visible" then
                v:Destroy()
            end
        end
        Debris:AddItem(hitbox, .7)
    end
    
    local touchedConnection
    local hasTriggered = false 
    local function wrappedCallback(...)
        if touchedConnection and not hasTriggered and not destroyed then
            local result = callback(...)
            if result then
                hasTriggered = true
                HitboxTouch()
            end
        end
    end
    
    touchedConnection = hitbox.Touched:Connect(wrappedCallback)
    
    if not Ragdoll_Destroy_Hitbox then
        pcall(function()
            lp.Character.Ragdolled.Changed:Connect(function(val)
                if val then hitboxObj:Destroy() end
            end)
        end)
    end
    
    task.spawn(function()
        task.wait(duration)
        if hitbox and hitbox.Parent and hitbox.Color == Color3.new(1,0,0) then
            hitboxObj:Destroy()
        end
    end)
    
    return hitbox, hitboxObj
end
----------SLAP AURA----------
local SlapSFX = 0
local function HitPlayer_Range(Glove, User, Range, Value)
	if not SlapSystem.supportCheck(Glove) then return end
	local Value = Value or true
	for i,v in pairs(Players:GetChildren()) do
		if v ~= LocalPlayer and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character and v == User then
			if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
				if FullCharacter(v, {health= true, height = true, ragdoll = true}) then
					local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
					if Magnitude <= Range then
						SlapSystem.executeHit(Glove, v.Character.HumanoidRootPart, Value)
						return true
					end
				 end
			end
		end
	end
end

local function HitNPC(Glove, Mob, Range, Value)
	if not SlapSystem.supportCheck(Glove) then return end
	local Value = Value or true
	if Mob and Mob.Parent then
		local isPlayer = Players:GetPlayerFromCharacter(Mob)
		if not isPlayer and Mob:FindFirstChild("HumanoidRootPart") then
			SlapSystem.executeHit(Glove, Mob.HumanoidRootPart, Value)
			return true
		end
	end
end

local function HitAura(Glove, Range, Value)
	if not SlapSystem.supportCheck(Glove) then return end
	local Value = Value or true
	for i,v in pairs(Players:GetChildren()) do
		if v ~= LocalPlayer and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
			if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
				if FullCharacter(v, {ragdoll = true, health = true, height = true}) then
					local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
					if Magnitude <= Range then
						SlapSystem.executeHit(Glove, v.Character.HumanoidRootPart, Value)
					end
				end
			end
		end
	end
end

local function HitAura_Break(Glove, Range, Value)
	if not SlapSystem.supportCheck(Glove) then return end
	local Value = Value or true
	for i,v in pairs(Players:GetChildren()) do
		if v ~= LocalPlayer and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
			if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
				if FullCharacter(v, {ragdoll = true, health = true, height = true}) then
					local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
					if Magnitude <= Range then
						SlapSystem.executeHit(Glove, v.Character.HumanoidRootPart, Value)
						break 
					end
				end
			end
		end
	end
end

----------TOOL FUNCTIONS----------
local function GetTool(gloveName)
	local character = LocalPlayer.Character
	if character and FullCharacter(LocalPlayer, {ragdoll = true, height = true, health = true}) then
		local toolInCharacter = character:FindFirstChildWhichIsA("Tool")
		if toolInCharacter and toolInCharacter.Name == gloveName then 
			return toolInCharacter
		end
	end

	local backpack = LocalPlayer.Backpack
	if backpack then
		local toolInBackpack = backpack:FindFirstChildWhichIsA("Tool")
		if toolInBackpack and toolInBackpack.Name == Name then
			return toolInBackpack
		end
	end

	return nil
end

---------- STATUS FUNCTIONS ----------
local function OnDeathFunc()
	LocalPlayer.Character.Archivable = true
end

local function StillAliveFunc()
	if FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then
		LocalPlayer.Character.Humanoid.WalkSpeed = LoopWSValue
		LocalPlayer.Character.Humanoid.JumpPower = 50
		if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude == 0 and not STUN then
			--StopAnim("walk", PublicIds.Anim.walk)
		end
		AnimSpeed("norm_walk", PublicIds.Anim.norm_walk, LocalPlayer.Character.Humanoid.WalkSpeed * 0.05)
		AnimSpeed("tool_walk", PublicIds.Anim.tool_walk, LocalPlayer.Character.Humanoid.WalkSpeed * 0.06)
	end
end

local normalDmgMultiplier, stunDmgMultiplier = 4,3
local function TakeKnockback(attackerChar, power)
	local character = LocalPlayer.Character
	local humanoid = character and character:FindFirstChild("Humanoid")
	local targetRoot = character and character:FindFirstChild("HumanoidRootPart")
	local attackerRoot = attackerChar and attackerChar:FindFirstChild("HumanoidRootPart")
	
	local normalDmg = normalDmgMultiplier * 5
	local stunDmg = stunDmgMultiplier * 5
	
	if not humanoid or not targetRoot or not attackerRoot then return end
	local hp = humanoid.Health
	local isFree = not STUN
	local knockbackMultiplier = 2
	
	if (isFree and hp <= normalDmg) or hp <= stunDmg then
		knockbackMultiplier = 10
	elseif (hp / humanoid.MaxHealth) * 100 < 50 then
		knockbackMultiplier = 2.5
	end
	if humanoid.FloorMaterial == Enum.Material.Air and knockbackMultiplier < 5 then
		knockbackMultiplier = knockbackMultiplier/1.5
	end
	local launchVelocity = attackerRoot.CFrame.LookVector * power * knockbackMultiplier
	local launchVY = launchVelocity.Y < 5 and launchVelocity.Y + 50 or launchVelocity.Y
	if (isFree and hp <= normalDmg) or (not isFree and hp <= stunDmg) then
		launchVY = math.sqrt(launchVelocity.X^2 + launchVelocity.Z^2) * math.tan(math.rad(30))
		if launchVY < 50 then launchVY = 50 end
	end
	launchVelocity = Vector3.new(launchVelocity.X, launchVY, launchVelocity.Z)

	if isFree or hp <= stunDmg then targetRoot.Velocity = launchVelocity end

	if (isFree and hp <= normalDmg) or (not isFree and hp <= stunDmg) then task.wait(.2) end

	if hp > 0 then
		for _ = 1, (isFree and normalDmgMultiplier or stunDmgMultiplier) do
			ReplicatedStorage.Events.Collector:FireServer("self_inflict")
		end
	end
end
local function OnDamageFunc(hit)
	if DamageIFrame or isSneaking or isVoiding then return end
	if STUN and not HitCD then return end
	if hit and hit.Parent then
		if hit.Parent:IsA("Tool") and hit.Parent.Activate then
			local Glove = hit.Parent
			local Attacker = Players:GetPlayerFromCharacter(Glove.Parent)
			if Attacker and Attacker ~= LocalPlayer then
				if Attacker.Character and Attacker.Character:FindFirstChild("Humanoid") and (not Attacker.Character:FindFirstChild("Ragdolled") or Attacker.Character.Ragdolled.Value ~= true) then
					local AttackerHum = Attacker.Character:FindFirstChild("Humanoid")
					local animations = AttackerHum:GetPlayingAnimationTracks()
					for _, animation in pairs(animations) do
						if animation.Animation:IsA("Animation") then
							local animId = animation.Animation.AnimationId:split("//")[2] or animation.Animation.AnimationId
							if table.find(PublicIds.Anim.gloveAttack, animId) or table.find(PublicIds.Anim.customAttack, animId) then
								DamageIFrame = true
								TakeKnockback(Attacker.Character, 50)
								wait(1)
								DamageIFrame = false
								return
							end
						end
					end
				end
			end
		elseif Players:GetPlayerFromCharacter(hit.Parent) then
			local Attacker = Players:GetPlayerFromCharacter(hit.Parent)
			if Attacker:FindFirstChildWhichIsA("Tool") then return end
			if Attacker.Character and Attacker.Character:FindFirstChild("Humanoid") and (not Attacker.Character:FindFirstChild("Ragdolled") or Attacker.Character.Ragdolled.Value ~= true) then
				local AttackerHum = Attacker.Character:FindFirstChild("Humanoid")
				local animations = AttackerHum:GetPlayingAnimationTracks()
				for _, animation in pairs(animations) do
					if animation.Animation:IsA("Animation") then
						local animId = animation.Animation.AnimationId:split("//")[2] or animation.Animation.AnimationId
						if table.find(PublicIds.Anim.gloveAttack, animId) or table.find(PublicIds.Anim.customAttack, animId) then
							DamageIFrame = true
							TakeKnockback(Attacker.Character, 50)
							wait(1)
							DamageIFrame = false
							return
						end
					end
				end
			end
		end
	end
end

local TouchDmg_Objs = {
    {Name = "LavaBrick", Damage = 5, Delay = 0.25},
    {Name = "LavaSpinner", Damage = 10, Delay = 0.25},
    {Name = "Mace", Damage = 10, Delay = .8},
    {Name = "BusModel", Damage = 60, Delay = 5},
    {Name = "Sword", Damage = 5, Delay = 0.8},
    {Name = "puddles", Damage = 5, Delay = 0.2},
    {Name = "Scythe", Damage = 15, Delay = 1},
    {Name = "Slice", Damage = 20, Delay = 1},
    {Name = "Slash", Damage = 20, Delay = 1},
    {Name = "Explosion", Damage = 20, Delay = 1},
    {Name = "Bubble", Damage = 5, Delay = 0.5},
    {Name = "Field", Damage = 5, Delay = 0.15},
    {Name = "Lightning", Damage = 30, Delay = 0.7},
    {Name = "Blackhole", Damage = 20, Delay = 1},
    {Name = "Shard", Damage = 20, Delay = 0.45},
    {Name = "StiltGlove", Damage = 10, Delay = 1},
    {Name = "Pong", Damage = 30, Delay = 2},
    {Name = "HingePart", Damage = 5, Delay = 1},
}

local isTouchingDmgPart = false

local function OnPartDamageFunc()
    local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
    if not HumanoidRootPart then return end
    
    local function GetPartData(part)
        local name = part.Name:lower()
        local parentName = part.Parent and part.Parent.Name:lower() or ""
        
        for _, obj in ipairs(TouchDmg_Objs) do
            local objName = obj.Name:lower()
            if name:find(objName) or parentName:find(objName) then
                return obj
            end
        end
        return nil
    end
    
    local touchingParts = HumanoidRootPart:GetTouchingParts()
    local isCurrentlyTouching = false
    local partData = nil
    
    for _, part in ipairs(touchingParts) do
        local data = GetPartData(part)
        if data then
            isCurrentlyTouching = true
            partData = data
            break
        end
    end
    
    if isCurrentlyTouching then
        if not isTouchingDmgPart then
            isTouchingDmgPart = true
            task.spawn(function()
                while isTouchingDmgPart and Humanoid and Humanoid.Health > 0 and not STUN and not isPhasing and not isSneaking and not isVoiding do
                    local stillTouching = false
                    local currentParts = HumanoidRootPart:GetTouchingParts()
                    for _, p in ipairs(currentParts) do
                        if GetPartData(p) then
                            stillTouching = true
                            break
                        end
                    end
                    
                    if not stillTouching then
                        isTouchingDmgPart = false
                        break
                    end
                    
                    local times = math.floor(partData.Damage / 5)
                    for i = 1, times do
                        ReplicatedStorage.Events.Collector:FireServer("self_inflict")
                    end
                    task.wait(partData.Delay)
                end
                isTouchingDmgPart = false
            end)
        end
    else
        isTouchingDmgPart = false
    end
end


local function inAir(plr)
	local plr = plr or LocalPlayer
	return plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.FloorMaterial == Enum.Material.Air
end
local function holdingTool()
	return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(NewToolName)
end
local function equipGlove(name, edit)
	if GetRealGlove() ~= name then
		local start = tick()
		workspace.Sounds.Select.Volume = 0
		spawn(function()
			repeat wait() until workspace.Sounds.Select.Playing or tick() - start > 2
			workspace.Sounds.Select.Playing = false
		end)
		fireclickdetector(workspace.Lobby[name].ClickDetector)
		if edit then
			spawn(function()
				local start = tick()
				repeat LocalPlayer.leaderstats.Glove.Value = NewGlove twait() until tick() - start > .5
				workspace.Sounds.Select.Volume = 3
			end)
		end
	end
end

---------- ABILITY FUNCTIONS ----------
local GloveCommonClient = require(game.ReplicatedFirst.Dependencies.GloveCommonClient)

local Cooldown = {
	EAbility = true, EAbility_Tool = true,
	RAbility = true,
	TAbility = true, TAbility_Tool = true,
	FAbility = true,
	CAbility = true
}

local SpecialCooldown = {
	ZAbility = true,
	XAbility = true
}

local function SetCD(value)
	for i in pairs(Cooldown) do
		Cooldown[i] = value
	end
end

local function SetSpecialCD(value)
	for i in pairs(SpecialCooldown) do
		SpecialCooldown[i] = value
	end
end


local SlapDelay = 0.6
local function InitSlapSystem(tool)
	if tool then 
		 SlapDebounce = false
		local AllowSlap = false
		TouchConnection = tool:FindFirstChild("Glove").Touched:Connect(function(hit)
			if SlapDebounce or AllowSlap ~= true then return end
			local player = Players:GetPlayerFromCharacter(hit.Parent)
			local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
			if player and humanoid and player.Character and player ~= LocalPlayer then
				HitPlayer_Range(GetRealGlove(), player, 9e9, false)
				SlapDebounce = true
			elseif not player and hit.Parent:FindFirstChild("HumanoidRootPart") then 
				 HitNPC(GetRealGlove(), hit.Parent, 9e9)
				SlapDebounce = true
			end
			if SlapDebounce then
				wait(.01)
				SlapDebounce= false 
			end 
		end)
		tool.Activated:Connect(function()
			if AllowSlap then return end
			LocalPlayer.Character.Humanoid:LoadAnimation(ReplicatedStorage.Slap, game.Players.LocalPlayer.Character.Humanoid):Stop()
			LocalPlayer.Character.Humanoid:LoadAnimation(ReplicatedStorage.Slap, game.Players.LocalPlayer.Character.Humanoid):Play()
			AllowSlap = true
			wait(SlapDelay)
			AllowSlap = false
		end)
	end
end

local function InitSlapSystem(tool)
	if tool then
		local Hit1 = 2
		HitCD = false
		TouchConnection = tool.Activated:Connect(function()
			if HitCD or STUN or isSneaking or isVoiding then return end
			HitCD = true  
			STUN = true
			local HBSize = Vector3.new(8,6,7) 
			if Hit1 == 1 then
				PlayAnim("slap2", PublicIds.Anim.slap2, 1)
			elseif Hit1 == 2 then
				PlayAnim("slap1", PublicIds.Anim.slap1, 1)
			elseif Hit1 == 3 then
				PlayAnim("slap3", PublicIds.Anim.slap3, 1)
				Hit1 = 0
			end
			Hit1 = 2
			wait(.2)
			local hitboxpart = AddHitbox(CFrame.new(0,0,5), HBSize, .3, false, function(hit)
				local player = Players:GetPlayerFromCharacter(hit.Parent)
				local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				if player and humanoid and player.Character and player ~= LocalPlayer and FullCharacter(player, {ragdoll = true, health = true, height = true}) then
					HitPlayer_Range(GetRealGlove(), player, 9e9, false)
					return true
				elseif not player and hit.Parent:FindFirstChild("HumanoidRootPart") then 
					HitNPC(GetRealGlove(), hit.Parent, 9e9, false)
					return true
				end
			end)
			wait(.3)
			STUN = false
			wait(.1)
			HitCD = false
		end)
	end
end

local function ParryVFX()
	ReplicatedStorage.GeneralAbility:FireServer("ParryDash")
	local ParryVFX = require(LocalPlayer.PlayerScripts.BACKEND.Systems.VFXReplication.ParryDash)
	ParryVFX({char = LocalPlayer.Character})
end

local function nccam()
	local sc = (debug and debug.setconstant) or setconstant
	local gc = (debug and debug.getconstants) or getconstants
	if not sc or not getgc or not gc then return end
	local pop = LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
	for _, v in pairs(getgc()) do
		if type(v) == 'function' and getfenv(v).script == pop then
			for i, v1 in pairs(gc(v)) do
				if tonumber(v1) == .25 then
					sc(v, i, 0)
				elseif tonumber(v1) == 0 then
					sc(v, i, .25)
				end
			end
		end
	end
end

local NoclipConnection
local function noclip(value)
	if NoclipConnection then
		DisableConnections(NoclipConnection)
	end
	if value then
		local function NoclipLoop()
			if LocalPlayer.Character ~= nil then
				for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true then
						child.CanCollide = false
					end
				end
			end
		end
		NoclipConnection = RunService.Stepped:Connect(NoclipLoop)
	else
		if LocalPlayer.Character then
			for _, child in pairs(LocalPlayer.Character:GetChildren()) do
				if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
					child.CanCollide = true
				end
			end
		end
	end
end

local sneakTable = {
	sneakPos = CFrame.new(random(-10000,10000), -4000, random(-10000,10000)),
	sneakSeat, colorCorrection, bloom, ui
}

local function toggleSneaking(value)
	isSneaking = value
	if isSneaking then
		ListDestroy(sneakTable.ui, sneakTable.colorCorrection, sneakTable.bloom)
		local ui = LocalPlayer.PlayerGui.SkullUi:Clone()
		ui.Parent = LocalPlayer.PlayerGui
		ui.Enabled = true
		sneakTable.ui = ui
		ui.TextLabel:Destroy()
		local imageLabel = ui.ImageLabel
		imageLabel.ImageTransparency = 1
		imageLabel.ImageColor3 = Color3.new(0,0,0)
		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local goal = {ImageTransparency = 0.2}
		local tween = TweenService:Create(imageLabel, tweenInfo, goal):Play()
		local colorCorrection = Instance.new("ColorCorrectionEffect", Lighting)
		colorCorrection.TintColor = Color3.fromRGB(255, 100, 100)
		sneakTable.colorCorrection = colorCorrection
		
		local bloom = Instance.new("BloomEffect", Lighting)
		bloom.Size = 16
		bloom.Intensity = 0
		sneakTable.bloom = bloom
		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
		local tween = TweenService:Create(bloom, tweenInfo, { Intensity = 0.3 })
		tween:Play()
	else
		if sneakTable.colorCorrection and sneakTable.bloom then
			local tweenInfo2 = TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
			local tween2 = TweenService:Create(sneakTable.bloom, tweenInfo2, { Intensity = 0 })
			tween2:Play()
			tween2.Completed:Connect(function()
				sneakTable.colorCorrection:Destroy()
				sneakTable.bloom:Destroy()
			end)
		end
		if sneakTable.ui and sneakTable.ui:FindFirstChild("ImageLabel") then
			local imageLabel = sneakTable.ui.ImageLabel
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
			local goal = {ImageTransparency = 1}
			local tween = TweenService:Create(imageLabel, tweenInfo, goal):Play()
			task.delay(0.1, function()
				sneakTable.ui:Destroy()
			end)
		end
	end
	if isSneaking then
		local Hrp = LocalPlayer.Character.HumanoidRootPart
		local oldPos = Hrp.CFrame
		Camera.CameraType = Enum.CameraType.Scriptable
		wait()
		LocalPlayer.Character:PivotTo(sneakTable.sneakPos)
		task.wait(0.15)
		Camera.CameraType = Enum.CameraType.Custom
		ListDestroy(sneakTable.sneakSeat)
		
		local seat = Instance.new("Seat", workspace)
		seat.Anchored = false
		seat.CanCollide = false
		seat.Transparency = 1
		seat.Massless = false
		seat.CFrame = sneakTable.sneakPos
		sneakTable.sneakSeat = seat
		
		local weld = Instance.new("Weld", seat)
		weld.Part0 = seat
		weld.Part1 = LocalPlayer.Character:FindFirstChild("Torso")
		
		wait()
		seat.CFrame = oldPos
		local connect
		connect = LocalPlayer.CharacterAdded:Connect(function()
			ListDestroy(sneakTable.sneakSeat, sneakTable.bloom, sneakTable.colorCorrection, sneakTable.ui)
			connect:Disconnect()
		end)
	else
		ListDestroy(sneakTable.sneakSeat)
	end
end

local voidphaseTable = {
	isSwimming = false, isFlying = false,
	oldGravity = 196.2, swimConnection = nil, gravResetConnection = nil,
	noOverlapTimer = nil, currentFlySpeed = 2, mfly1 = nil, mfly2 = nil, PhaseCore = nil,
	disablePhase = nil, isOverlappingFunc = nil
}

local canVoidPhase = true
local function toggleVoidPhase(value)
	isVoiding = value
	nccam()
	noclip(value)
	
	if isVoiding then
		local ui = LocalPlayer.PlayerGui.SkullUi:Clone()
		ui.Parent = LocalPlayer.PlayerGui
		ui.Name = "Sharigan red eyes hurt"
		ui.Enabled = true
		ui.TextLabel:Destroy()
		local imageLabel = ui.ImageLabel
		imageLabel.ImageTransparency = 1
		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		local goal = {ImageTransparency = 0.5}
		local tween = TweenService:Create(imageLabel, tweenInfo, goal):Play()
	else
		local ui = LocalPlayer.PlayerGui:FindFirstChild("Sharigan red eyes hurt")
		if ui and ui:FindFirstChild("ImageLabel") then
			local imageLabel = ui.ImageLabel
			local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
			local goal = {ImageTransparency = 1}
			local tween = TweenService:Create(imageLabel, tweenInfo, goal)
			tween:Play()
			task.delay(0.5, function()
				ui:Destroy()
			end)
		end
	end
	
	if not isVoiding then
		ReplicatedStorage.GeneralAbility:FireServer(unpack({"setcollisiongroup", "DefaultCharacterCollisionGroup"}))
		isPhasing = false
		
		if voidphaseTable.isSwimming then
			workspace.Gravity = 196.2
			if voidphaseTable.gravResetConnection then voidphaseTable.gravResetConnection:Disconnect() end
			if voidphaseTable.swimConnection then voidphaseTable.swimConnection:Disconnect() end
			local char = LocalPlayer.Character
			if char then
				local hum = char:FindFirstChildWhichIsA("Humanoid")
				if hum then
					for _, v in pairs(Enum.HumanoidStateType:GetEnumItems()) do
						if v ~= Enum.HumanoidStateType.None then hum:SetStateEnabled(v, true) end
					end
				end
			end
			voidphaseTable.isSwimming = false
		end
		
		if voidphaseTable.isFlying then
			pcall(function()
				local char = LocalPlayer.Character
				if char then
					local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
					if root then
						if root:FindFirstChild("bodyGyroDeathFlight") then root:FindFirstChild("bodyGyroDeathFlight"):Destroy() end
						if root:FindFirstChild("bodyvelocityDeathFlight") then root:FindFirstChild("bodyvelocityDeathFlight"):Destroy() end
					end
					local hum = char:FindFirstChildWhichIsA("Humanoid")
					if hum then hum.PlatformStand = false end
				end
			end)
			if voidphaseTable.mfly1 then voidphaseTable.mfly1:Disconnect() end
			if voidphaseTable.mfly2 then voidphaseTable.mfly2:Disconnect() end
			voidphaseTable.isFlying = false
		end
		
		if voidphaseTable.PhaseCore then voidphaseTable.PhaseCore:Destroy() end
		return
	end
	canVoidPhase = true
	ReplicatedStorage.GeneralAbility:FireServer(unpack({"setcollisiongroup", "NoCollideCharacterCollisionGroup"}))
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	
	local p = Instance.new("Part", Character)
	p.Name = "Kamui voidclip"
	p.Size = Vector3.new(1,3,1)
	p.CanCollide = false
	p.Massless = true
	p.Transparency = 1
	p.Anchored = false
	local weld = Instance.new("Weld", p)
	weld.Part0 = HumanoidRootPart
	weld.Part1 = p
	weld.C0 = CFrame.new(0,-.5,0)
	voidphaseTable.PhaseCore = p
	
	voidphaseTable.isOverlappingFunc = function()
		for _, part in ipairs(p:GetTouchingParts()) do
			if part:IsA("BasePart") and not part:IsDescendantOf(Character) and part.CanCollide and part.Transparency ~= 1 and not Players:GetPlayerFromCharacter(part.Parent) then
				return true
			end
		end
		return false
	end
	
	local function enableSwim()
		if not canVoidPhase then return end
		local char = LocalPlayer.Character
		if not char then return end
		local hum = char:FindFirstChildWhichIsA("Humanoid")
		if not hum or voidphaseTable.isSwimming then return end
		voidphaseTable.oldGravity = 196.2
		workspace.Gravity = 0
		voidphaseTable.gravResetConnection = hum.Died:Connect(function()
			if voidphaseTable.disablePhase then voidphaseTable.disablePhase() end
		end)
		for _, v in pairs(Enum.HumanoidStateType:GetEnumItems()) do
			if v ~= Enum.HumanoidStateType.None then hum:SetStateEnabled(v, false) end
		end
		hum:ChangeState(Enum.HumanoidStateType.Swimming)
		voidphaseTable.swimConnection = RunService.Heartbeat:Connect(function()
			pcall(function()
				local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
				if root and hum and hum.MoveDirection == Vector3.new() and not UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					root.Velocity = Vector3.new()
				end
			end)
		end)
		voidphaseTable.isSwimming = true
		isPhasing = false
	end
	
	local function enableFly(vflySpeed)
		if not canVoidPhase then return end
		vflySpeed = vflySpeed or 1
		voidphaseTable.currentFlySpeed = vflySpeed
		local char = LocalPlayer.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
		local hum = char:FindFirstChildWhichIsA("Humanoid")
		if not root or not hum then return end
		
		if voidphaseTable.isFlying then
			if voidphaseTable.disablePhase then voidphaseTable.disablePhase() end
		end
		
		local v3zero = Vector3.new(0,0,0)
		local v3inf = Vector3.new(9e9,9e9,9e9)
		local controlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
		
		local bv = Instance.new("BodyVelocity")
		bv.Name = "bodyvelocityDeathFlight"
		bv.Parent = root
		bv.MaxForce = v3zero
		bv.Velocity = v3zero
		
		local bg = Instance.new("BodyGyro")
		bg.Name = "bodyGyroDeathFlight"
		bg.Parent = root
		bg.MaxTorque = v3inf
		bg.P = 1000
		bg.D = 50
		
		voidphaseTable.mfly1 = LocalPlayer.CharacterAdded:Connect(function(newChar)
			wait()
			local newRoot = newChar:FindFirstChild("HumanoidRootPart") or newChar:FindFirstChild("Torso")
			if newRoot then
				local newBv = Instance.new("BodyVelocity")
				newBv.Name = "bodyvelocityDeathFlight"
				newBv.Parent = newRoot
				newBv.MaxForce = v3zero
				newBv.Velocity = v3zero
				local newBg = Instance.new("BodyGyro")
				newBg.Name = "bodyGyroDeathFlight"
				newBg.Parent = newRoot
				newBg.MaxTorque = v3inf
				newBg.P = 1000
				newBg.D = 50
			end
		end)
		
		voidphaseTable.mfly2 = RunService.RenderStepped:Connect(function()
			local currentChar = LocalPlayer.Character
			if not currentChar then return end
			local currentRoot = currentChar:FindFirstChild("HumanoidRootPart") or currentChar:FindFirstChild("Torso")
			if not currentRoot then return end
			local vel = currentRoot:FindFirstChild("bodyvelocityDeathFlight")
			local gyro = currentRoot:FindFirstChild("bodyGyroDeathFlight")
			local humObj = currentChar:FindFirstChildWhichIsA("Humanoid")
			if not vel or not gyro or not humObj then return end
			
			vel.MaxForce = v3inf
			gyro.MaxTorque = v3inf
			humObj.PlatformStand = true
			gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
			vel.Velocity = v3zero
			
			local dir = controlModule:GetMoveVector()
			if dir.X ~= 0 then
				vel.Velocity = vel.Velocity + workspace.CurrentCamera.CFrame.RightVector * (dir.X * (voidphaseTable.currentFlySpeed * 50))
			end
			if dir.Z ~= 0 then
				vel.Velocity = vel.Velocity - workspace.CurrentCamera.CFrame.LookVector * (dir.Z * (voidphaseTable.currentFlySpeed * 50))
			end
		end)
		
		voidphaseTable.isFlying = true
		isPhasing = true 
	end

	voidphaseTable.disablePhase = function()
		if voidphaseTable.isSwimming then
			workspace.Gravity = 196.2
			if voidphaseTable.gravResetConnection then voidphaseTable.gravResetConnection:Disconnect() end
			if voidphaseTable.swimConnection then voidphaseTable.swimConnection:Disconnect() end
			local char = LocalPlayer.Character
			if char then
				local hum = char:FindFirstChildWhichIsA("Humanoid")
				if hum then
					for _, v in pairs(Enum.HumanoidStateType:GetEnumItems()) do
						if v ~= Enum.HumanoidStateType.None then hum:SetStateEnabled(v, true) end
					end
				end
			end
			voidphaseTable.isSwimming = false
			isPhasing = false
		end
		
		if voidphaseTable.isFlying then

				local char = LocalPlayer.Character
				if char then
					local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
					if root then
						if root:FindFirstChild("bodyGyroDeathFlight") then root:FindFirstChild("bodyGyroDeathFlight"):Destroy() end
						if root:FindFirstChild("bodyvelocityDeathFlight") then root:FindFirstChild("bodyvelocityDeathFlight"):Destroy() end
					end
					local hum = char:FindFirstChildWhichIsA("Humanoid")
					if hum then hum.PlatformStand = false end
				end
			if voidphaseTable.mfly1 then voidphaseTable.mfly1:Disconnect() end
			if voidphaseTable.mfly2 then voidphaseTable.mfly2:Disconnect() end
			voidphaseTable.isFlying = false
		end
	end
	
	task.spawn(function()
		while isVoiding and FullCharacter() do
			if voidphaseTable.isOverlappingFunc() and not STUN then
				voidphaseTable.noOverlapTimer = nil
				for i,v in next, LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks() do
					v:Stop()
				end
				if not voidphaseTable.isSwimming then enableSwim() end
				if not voidphaseTable.isFlying then enableFly(1) end
			else
				if not voidphaseTable.noOverlapTimer then
					voidphaseTable.noOverlapTimer = tick()
				elseif tick() - voidphaseTable.noOverlapTimer >= 0.03 then
					if voidphaseTable.isSwimming then voidphaseTable.disablePhase() end
					if voidphaseTable.isFlying then voidphaseTable.disablePhase() end
					voidphaseTable.noOverlapTimer = nil
				end
			end
			wait()
		end
	end)
	
	spawn(function()
		while isVoiding do
			if not isPhasing then
				ReplicatedStorage.Events.pinata_candy:FireServer()
			end
			wait(.1)
		end
	end)
	local antiglitchCandyVFX = LocalPlayer.Character.ChildAdded:Connect(function(v)
		if v.Name == "Area" then
			repeat wait() until v.Parent
			v:Destroy()
		end
		if not isVoiding then
			DisableConnections(antiglitchCandyVFX)
		end
	end)
end

local KamuiUI = nil
local KamuiUIConnection = nil

local function KamuiEye(val)
	if not KamuiUI or not KamuiUI.Parent then
		KamuiUI = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
		KamuiUI.Name = "KamuiGui"
		KamuiUI.Enabled = false
		
		local imageLabel = Instance.new("ImageLabel", KamuiUI)
		imageLabel.Name = "KamuiEye"
		imageLabel.Image = "rbxthumb://type=Asset&id=".. PublicIds.Images.kamui .."&w=150&h=150"
		imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel.Position = UDim2.fromScale(0.5, 0.5)
		imageLabel.Size = UDim2.new(0,0,0,0)
		imageLabel.BackgroundTransparency = 1
		imageLabel.ImageTransparency = 0
		imageLabel.Visible = true
	end
	
	local screenGui = KamuiUI
	local imageLabel = screenGui:FindFirstChild("KamuiEye")
	
	if screenGui.Enabled then
		if activeConnection then
			activeConnection:Disconnect()
			activeConnection = nil
		end
		for _, obj in ipairs(screenGui:GetChildren()) do
			if obj:IsA("Tween") and obj.PlaybackState ~= Enum.PlaybackState.Completed then
				obj:Cancel()
			end
		end
		screenGui.Enabled = false
	end
	
	imageLabel.Size = UDim2.new(0,0,0,0)
	imageLabel.ImageTransparency = 0
	imageLabel.Rotation = 0
	screenGui.Enabled = true
	
	PlaySFX(workspace, PublicIds.SFX.msharigan, 1)
	
	local tweenInfo1 = TweenInfo.new(.6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local tween1 = TweenService:Create(imageLabel, tweenInfo1, {Size = UDim2.new(0,300,0,300)})
	tween1:Play()
	
	local rotation = 0
	KamuiUIConnection = game:GetService("RunService").Heartbeat:Connect(function(dt)
		local x = val and -2 or 2
		rotation = rotation + dt * 360 * x
		imageLabel.Rotation = rotation % 360
	end)
	
	tween1.Completed:Connect(function()
		task.wait(0.5)
		
		local tweenInfo2 = TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		local tween2 = TweenService:Create(imageLabel, tweenInfo2, {
			Size = UDim2.new(0,0,0,0),
			ImageTransparency = 1
		})
		tween2:Play()
		
		tween2.Completed:Connect(function()
			DisableConnections(KamuiUIConnection)
			screenGui.Enabled = false
		end)
	end)
end

local function rotatePlayer(value, fast)
	local char = LocalPlayer.Character
	if not char then return end
	
	local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
	if not root then return end
	
	local hum = char:FindFirstChildWhichIsA("Humanoid")
	if hum then
		hum.PlatformStand = true
	end
	
	local startPosition = root.Position
	local startCFrame = root.CFrame
	
	local bv = Instance.new("BodyVelocity", root)
	bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	bv.Velocity = Vector3.new(0, 0, 0)
	
	local duration = fast and .5 or 1
	local speed = 720
	local startTime = tick()
	local accumulatedAngle = 0
	if value then speed = -720 end
	local connection
	connection = RunService.Heartbeat:Connect(function(deltaTime)
		local elapsed = tick() - startTime
		if elapsed >= duration then
			connection:Disconnect()
			bv:Destroy()
			if hum then hum.PlatformStand = false end
			return
		end
		
		local offset = startPosition - root.Position
		bv.Velocity = offset / deltaTime
		
		accumulatedAngle = accumulatedAngle + speed * deltaTime
		local angleRad = math.rad(accumulatedAngle)
		
		root.CFrame = startCFrame * CFrame.Angles(0, 0, angleRad) + (root.Position - startCFrame.Position)
	end)
end

local kamuiTP = {
    Places = {
        Arena = CFrame.new(0,10,0),
        Slapple = CFrame.new(-380, 70, -12),
        Cannon = CFrame.new(264,60,195),
    },
    Order = {
        Cannon = "Arena",
        Arena = "Slapple",
        Slapple = "Cannon",
    },
    Current = "Cannon",
    Teleport = function(self)
        LocalPlayer.Character.HumanoidRootPart.CFrame = self.Places[self.Current]
    end,
    Next = function(self)
        self.Current = self.Order[self.Current]
        return self.Current
    end,
    Reset = function(self)
        self.Current = "Cannon"
    end,
    GetCurrent = function(self)
        return self.Current
    end
}

local function EAbility(btn)
	if STUN then return end
	if (holdingTool() and Cooldown.EAbility_Tool) or (not holdingTool() and Cooldown.EAbility) then return end
	STUN = true
	local btn = btn and btn:FindFirstChild("ImageLabel")
	local usedTool = holdingTool() 
	if usedTool then
		Cooldown.EAbility_Tool = true
	else
		Cooldown.EAbility = true
	end
	local abilityCD
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	LoopWSValue = 5
	equipGlove("Untitled Tag Glove", true)
	if isSneaking then
		local target = getNearestPlayer(50)
		if target and usedTool then
			toggleSneaking(false)
			LocalPlayer:SetAttribute("DisableMobileShiftLock", true)
			local targetPos = target.Character:GetPivot()
			local behindTarget
			behindTarget = targetPos.Position + Vector3.new(0,10,0)
			local newPos = behindTarget
			LocalPlayer.Character:PivotTo(CFrame.new(newPos, targetPos.Position))
			local targetHrp = target.Character.HumanoidRootPart
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 65}):Play()
			PlayAnim("tool_E", PublicIds.Anim.tool_E)
			local bv = Instance.new("BodyVelocity", HumanoidRootPart)
			bv.MaxForce = Vector3.new(0,0,0)
			local bg = Instance.new("BodyGyro", HumanoidRootPart)
			bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.P = 50000
			bg.CFrame = CFrame.lookAt(HumanoidRootPart.Position, target.Character.HumanoidRootPart.Position)
			
			if inAir() then
				bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				bv.Velocity = Vector3.new(0,0,0)
			end
			twait(0.3)
			bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 75}):Play()

			local directionToTarget = (target.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Unit
			bv.Velocity = directionToTarget * 150
			ParryVFX()
			
			spawn(function()
				while bv and bv.Parent and target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") do
					bg.CFrame = CFrame.lookAt(HumanoidRootPart.Position, target.Character.HumanoidRootPart.Position)
					wait()
				end
				bg:Destroy()
			end)
			
			AntiCollision(true)
			local target
			local backStabbed = false
			
			local hitbox = AddHitbox(CFrame.new(0, 0, 0), Vector3.new(13, 12, 13), 0.2, false, function(hit)
				local hitHumanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				local player = Players:GetPlayerFromCharacter(hit.Parent)
				
				if hitHumanoid and player and player.Character and player ~= LocalPlayer then
					target = player
					if inAir() then
						spawn(function()
							repeat wait()
								bv.Velocity *= .7
							until not bv or not bv.Parent
						end)
					else
						bv.Velocity = bv.Velocity * 0.8
					end
					
					local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
					if localRoot and targetRoot then
						local localLook = localRoot.CFrame.LookVector
						local targetLook = targetRoot.CFrame.LookVector
						local dotProduct = localLook:Dot(targetLook)
						local angle = math.acos(math.clamp(dotProduct, -1, 1))
						local angleDegrees = math.deg(angle)
						if angleDegrees <= 60 then
							backStabbed = true
							ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
							HitPlayer_Range(GetRealGlove(), target, 9e9, true)
						else
							if inAir() and not backStabbed then
								ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
							end
							HitAura(GetRealGlove(), 26, false)
						end
					end
					return true
				end
			end)
			
			local start = tick()
			repeat twait() until target or tick() - start >= 0.1
			spawn(function()
				wait(.3)
				StopAnim("Grab", PublicIds.Anim.tool_E)
				ReplicatedStorage.UTGGeneric:FireServer("disableRunMode")
				tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
			end) 
			twait(.05)
			AntiCollision(false)
			ListDestroy(bv, bg)
			LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
			twait(.2)
			abilityCD = 6
			AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
			spawn(function()
				GloveCommonClient:Cooldown(LocalPlayer.Character, 8, "Kamui: Rift Severance", "R_ABILITY")
				Cooldown.FAbility = true
				wait(8)
				Cooldown.FAbility = false
			end)
		elseif not target then
			abilityCD = .5
			AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
		end
	elseif isVoiding then
		if holdingTool() and isPhasing then
			canVoidPhase = false
			ListDestroy(HumanoidRootPart:FindFirstChild("bodyvelocityDeathFlight"))
			wait()
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 65}):Play()
			PlayAnim("tool_E", PublicIds.Anim.tool_E)
			local bv = Instance.new("BodyVelocity", HumanoidRootPart)
			bv.MaxForce = Vector3.new(0,0,0)
			bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			bv.Velocity = Vector3.new(0,0,0)
			spawn(function()
				local bg = Instance.new("BodyGyro", HumanoidRootPart)
				bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
				bg.P = 50000
				repeat
					bg.CFrame = Camera.CFrame
					wait()
				until not bv or not bv.Parent
				bg:Destroy()
			end)
			local stncStop, outedGround = false, false
			spawn(function()
				repeat wait()
					if not voidphaseTable.isOverlappingFunc() then outedGround = true toggleVoidPhase(false) break end
				until stncStop
			end)
			wait(0.3)
			bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 75}):Play()
			bv.Velocity = Camera.CFrame.LookVector * 130
			AntiCollision(true)
			local target
			local hitbox = AddHitbox(CFrame.new(0, 0, 0), Vector3.new(8, 10, 8), 0.2, false, function(hit)
				local hitHumanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				local player = Players:GetPlayerFromCharacter(hit.Parent)
				
				if hitHumanoid and player and player.Character and player ~= LocalPlayer then
					target = player
					spawn(function()
						if bv and bv.Parent then
							repeat wait()
								bv.Velocity *= .7
							until not bv or not bv.Parent
						end
					end)	
					local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
					if localRoot and targetRoot then
						ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
						HitAura(GetRealGlove(), 26, false)
					end
					return true
				end
			end)
		
			wait(.1)
			spawn(function()
				wait(.3)
				StopAnim("Grab", PublicIds.Anim.tool_E)
				ReplicatedStorage.UTGGeneric:FireServer("disableRunMode")
				tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
			end) 
			stncStop = true
			AntiCollision(false)
			ListDestroy(bv)
			canVoidPhase = true
			if outedGround then
				GloveCommonClient:Cooldown(LocalPlayer.Character, 6, "Kamui: Intangibility", "R_ABILITY")
				spawn(function() 
					Cooldown.RAbility = true
					wait(6)
					Cooldown.RAbility = false
				end)
			end
			abilityCD = target and 4 or 3
			AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
		elseif not holdingTool() and isPhasing then
			local target
			local hitboxpart = AddHitbox(CFrame.new(0,-15,0), Vector3.new(30,30,30), .05, false, function(hit)
				local player = Players:GetPlayerFromCharacter(hit.Parent)
				if player and FullCharacter(player, {ragdoll = true}) and player ~= LocalPlayer then
					target = player
					return true
				end
			end)
			local st = tick()
			repeat wait() until tick() - st >= .05 or target 
			if target then
				canVoidPhase = false
				local stncStop, outedGround = false, false
				AntiCollision(true)
				spawn(function()
					repeat wait()
						if not voidphaseTable.isOverlappingFunc() then outedGround = true toggleVoidPhase(false) break end
					until stncStop
				end)
				ListDestroy(HumanoidRootPart:FindFirstChild("bodyvelocityDeathFlight"))
				LocalPlayer:SetAttribute("DisableMobileShiftLock", true)
				local bv = Instance.new("BodyVelocity")
				bv.MaxForce = Vector3.new(9e9,9e9,9e9)
				bv.Velocity = Vector3.new(0, 0, 0)
				bv.Parent = HumanoidRootPart

				local targetPos = target.Character.HumanoidRootPart.Position
				local belowPos = Vector3.new(targetPos.X, targetPos.Y - 7, targetPos.Z)
				HumanoidRootPart.CFrame = CFrame.new(belowPos)

				local bg = Instance.new("BodyGyro")
				bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
				bg.P = 500000
				bg.CFrame = CFrame.Angles(math.pi/2, 0, 0)
				bg.Parent = HumanoidRootPart
				Humanoid.PlatformStand = true
				local st2 = tick()
				PlayAnim("sleep", PublicIds.Anim.sleep, 1)
				repeat 
					targetPos = target.Character.HumanoidRootPart.Position
					belowPos = Vector3.new(targetPos.X, targetPos.Y - 7, targetPos.Z)
					HumanoidRootPart.CFrame = CFrame.new(belowPos) * CFrame.Angles(math.rad(90), 0, 0)
				wait() until tick() - st2 >= .15
				StopAnim("sleep", PublicIds.Anim.sleep)
				ListDestroy(bg)
				local bg = Instance.new("BodyGyro")
				bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
				bg.P = 500000
				bg.CFrame = CFrame.Angles(math.pi/2, 0, 0)
				bg.Parent = HumanoidRootPart
				bg.CFrame = CFrame.Angles(math.pi, 0, 0)
				ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
				spawn(function()
					ParryVFX()
					HitPlayer_Range(GetRealGlove(), target, 9e9, true)
					wait(.5)
					HitPlayer_Range(GetRealGlove(), target, 9e9, true)
				end)
				ReplicatedStorage.UTGGeneric:FireServer("disableRunMode")
				local force = 200
				bv.Velocity = Vector3.new(0,1,0) * force

				while force > 20 do
					wait()
					force = force * .9
					bv.Velocity = Vector3.new(0,1,0) * force
				end

				ListDestroy(bv, bg)
				Humanoid.PlatformStand = false
				LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
				canVoidPhase = true
				stncStop = true
				AntiCollision(false)
				if outedGround then
					GloveCommonClient:Cooldown(LocalPlayer.Character, 6, "Kamui: Intangibility", "R_ABILITY")
					spawn(function() 
						Cooldown.RAbility = true
						wait(6)
						Cooldown.RAbility = false
					end)
				end
			end
			abilityCD = target and 4 or 2
			GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Earth Release: Rising Kick", "E_ABILITY")
		elseif not isPhasing and holdingTool() then
			if Character.Humanoid.MoveDirection.Magnitude ~= 0 then 
				canVoidPhase = false
				LoopWSValue = 180
				ParryVFX()
				local attachment0, attachment1, trail  
				if not GloveSettings.HideVisual then
					attachment0 = Instance.new("Attachment", HumanoidRootPart)
					attachment0.Name = "TrailAttachment0"
					attachment0.Position = Vector3.new(0, 1.5, 0)
					attachment1 = Instance.new("Attachment", HumanoidRootPart)
					attachment1.Name = "TrailAttachment1"
					attachment1.Position = Vector3.new(0, -1.5, 0)
					trail = Instance.new("Trail", HumanoidRootPart)
					trail.Attachment0 = attachment0
					trail.Attachment1 = attachment1
					trail.Lifetime = 0.5
					trail.MaxLength = 30
					trail.FaceCamera = true
					trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))})
					trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
					trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
				end
				local target
				local HB = AddHitbox(CFrame.new(0,0,5), Vector3.new(10,10,5), 1.5, false, function(hit)
					local player = Players:GetPlayerFromCharacter(hit.Parent)
					local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
					if player and humanoid and player.Character and player ~= LocalPlayer and FullCharacter(player, {height = true, ragdoll = true}) then
						target = player
						return true
					end
				end)
				PlayAnim("norm_E", PublicIds.Anim.norm_E_sprint, 2)
				repeat wait() LoopWSValue *= 0.98
				until LoopWSValue <= 60 or target or Character.Humanoid.MoveDirection.Magnitude == 0
				if not target then ListDestroy(HB) end
				StopAnim("norm_E", PublicIds.Anim.norm_E_sprint)
				pcall(function()
					local tween = TweenService:Create(trail, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Lifetime = 0})
					local tween2 = TweenService:Create(trail, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {MaxLength = 0})
					tween:Play()
					tween2:Play()
				end)
				spawn(function()
					wait(.5)
					ListDestroy(trail, attachment0, attachment1)
				end)
				if target then
					ParryVFX()
					PlayAnim("norm_E_atk", PublicIds.Anim.norm_E_atk, 2)
					HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + (HumanoidRootPart.CFrame.LookVector * -5)
					local targetHrp = target.Character.HumanoidRootPart
					Camera.CFrame = CFrame.new(targetHrp.Position.X, Camera.CFrame.Y, targetHrp.Position.Z)
					toggleVoidPhase(false)
					wait(.05)
					ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
					HitPlayer_Range(GetRealGlove(), target, 9e9, false)
				else
					toggleVoidPhase(false)
				end
				abilityCD = target and 5 or 4
				canVoidPhase = true
				GloveCommonClient:Cooldown(LocalPlayer.Character, 6, "Kamui: Intangibility", "R_ABILITY")
				spawn(function() 
					Cooldown.RAbility = true
					wait(6)
					Cooldown.RAbility = false
				end) 
				AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
			end
		elseif not isPhasing and not inAir() and not holdingTool() then
			PlayAnim("dive", PublicIds.Anim.dive)
			local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(0.5), {CFrame = HumanoidRootPart.CFrame - Vector3.new(0,5,0)})
			tween:Play()
			wait(.5)
			StopAnim("dive", PublicIds.Anim.dive)
			abilityCD = 1
			GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Whac-A-Mole jutsu", "E_ABILITY")
		end
	elseif not isPhasing then
		if inAir() and not holdingTool() then
			workspace.Gravity = 1000
			local startHeight = HumanoidRootPart.Position.Y
			local extraPower = 0
			spawn(function()
				repeat 
					task.wait(.1)
					if extraPower < 200 then
						extraPower = extraPower + 10
					end
				until not inAir() or not FullCharacter()
			end)
			repeat 
				wait()
			until not inAir() or not FullCharacter()
			workspace.Gravity = 196.2
			if not FullCharacter() then return end
			PlayAnim("slide", PublicIds.Anim.air_E)
			LocalPlayer:SetAttribute("DisableMobileShiftLock", true)
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 40}):Play()
			local bv = Instance.new("BodyVelocity", HumanoidRootPart)
			local basePower = 100 + extraPower
			bv.Velocity = HumanoidRootPart.CFrame.LookVector * basePower
			bv.MaxForce = Vector3.new(9e9, 0, 9e9)
			
			local power = basePower
			spawn(function()
				while bv and bv.Parent do
					bv.Velocity = HumanoidRootPart.CFrame.LookVector * power
					twait()
				end
			end)
			local tweenInfo = TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 110}):Play()
			local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
			ReplicatedStorage.Events.butcherEvent:FireServer("start")
			ParryVFX()
			spawn(function()
				local hitPlayers = {}
			    local hb, hbmod = AddHitbox(CFrame.new(0, 0, 2), Vector3.new(10,7,12), 3, false, function(hit)
			        local player = Players:GetPlayerFromCharacter(hit.Parent)
			        if not player or player == LocalPlayer then return end
			        if hitPlayers[player] then return end
			        local character = player.Character
			        if not character or not FullCharacter(player, {ragdoll = true, height = true, health = true}) then return end
			        local humanoid = character:FindFirstChildOfClass("Humanoid")
			        hitPlayers[player] = true
			        HitPlayer_Range(GetRealGlove(), player, 9e9)
					pcall(function() hbmod:Green() end)
			        task.spawn(function()
			            task.wait(2)
			            hitPlayers[player] = nil
			        end)
			    end)
				AntiCollision(true)
				while power > 40 do
					twait()
				end
				AntiCollision(false)
				ListDestroy(hb)
			end)
			repeat
				power *= 0.95
				spawn(function()
					
				end)
			twait(.005) until power <= 40
			StopAnim("slide", PublicIds.Anim.air_E)
			bv:Destroy()
			ReplicatedStorage.Events.butcherEvent:FireServer("end")
			
			LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
			abilityCD = 4
			GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Helm Sweep", "E_ABILITY")
		elseif holdingTool() then
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 65}):Play()
			PlayAnim("tool_E", PublicIds.Anim.tool_E)
			local bv = Instance.new("BodyVelocity", HumanoidRootPart)
			bv.MaxForce = Vector3.new(0,0,0)
			if inAir() then
				bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				bv.Velocity = Vector3.new(0,0,0)
				spawn(function()
					local bg = Instance.new("BodyGyro", HumanoidRootPart)
					bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
					bg.P = 50000
					repeat
						bg.CFrame = Camera.CFrame
						wait()
					until not bv or not bv.Parent
					bg:Destroy()
				end)
			end
			twait(0.3)
			bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 75}):Play()
			ParryVFX()
			if inAir() then
				bv.Velocity = Camera.CFrame.LookVector * 130
			else
				bv.Velocity = HumanoidRootPart.CFrame.LookVector * 90
			end
			
			AntiCollision(true)
			local target
			local backStabbed = false
			
			local hitbox = AddHitbox(CFrame.new(0, 0, 0), Vector3.new(13, 12, 13), 0.2, false, function(hit)
				local hitHumanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
				local player = Players:GetPlayerFromCharacter(hit.Parent)
				
				if hitHumanoid and player and player.Character and player ~= LocalPlayer then
					target = player
					if inAir() then
						spawn(function()
							repeat wait()
								bv.Velocity *= .7
							until not bv or not bv.Parent
						end)
					else
						bv.Velocity = bv.Velocity * 0.8
					end
					
					local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
					if localRoot and targetRoot then
						local localLook = localRoot.CFrame.LookVector
						local targetLook = targetRoot.CFrame.LookVector
						local dotProduct = localLook:Dot(targetLook)
						local angle = math.acos(math.clamp(dotProduct, -1, 1))
						local angleDegrees = math.deg(angle)
						if angleDegrees <= 60 then
							backStabbed = true
							ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
							HitPlayer_Range(GetRealGlove(), target, 9e9, true)
						else
							if inAir() and not backStabbed then
								ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
							end
							HitAura(GetRealGlove(), 26, false)
						end
					end
					return true
				end
			end)
			local start = tick()
			repeat twait() until target or tick() - start >= 0.1
			spawn(function()
				wait(.3)
				StopAnim("Grab", PublicIds.Anim.tool_E)
				ReplicatedStorage.UTGGeneric:FireServer("disableRunMode")
				tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
			end) 
			twait(.05)
			AntiCollision(false)
			ListDestroy(bv)
			twait(.2)
			abilityCD = target and 5 or 4
			abilityCD = backStabbed and 3 or abilityCD
			AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
		elseif not holdingTool() and not inAir() then
local target
local localPlayerName = LocalPlayer.Name
AddHitbox(CFrame.new(0, -8, 20), Vector3.new(30, 20, 80), .05, false, function(hit)
	local player = Players:GetPlayerFromCharacter(hit.Parent)
	if player and FullCharacter(player, {ragdoll = true, health = true}) and player ~= LocalPlayer then
		local character = player.Character
		local root = character and character:FindFirstChild("HumanoidRootPart")
		if root then
			if character:FindFirstChild("LastSlappedBy") and character.LastSlappedBy.Value == localPlayerName then
				target = player
				return true
			end
			if HumanoidRootPart then
				if not target or (root.Position - HumanoidRootPart.Position).Magnitude < (target.Character and target.Character:FindFirstChild("HumanoidRootPart") and (target.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude or math.huge) then
					target = player
				end
			elseif not target then
				target = player
			end
		end
	end
end)
local st = tick()
repeat twait() until tick() - st >= .05
			if target and FullCharacter(target, {ragdoll = true, health = true}) then
				local targetHRP = target.Character.HumanoidRootPart
				local localHRP = HumanoidRootPart
				local yDiff = math.abs(targetHRP.Position.Y - localHRP.Position.Y)
				
				if yDiff <= 30 then
					PlayAnim("dive", PublicIds.Anim.dive)
					noclip(true)
					nccam()
					local tween = TweenService:Create(localHRP, TweenInfo.new(0.4), {CFrame = localHRP.CFrame - Vector3.new(0,8,0)})
					tween:Play()
					wait(0.3)
					StopAnim("dive", PublicIds.Anim.dive)
					LocalPlayer:SetAttribute("DisableMobileShiftLock", true)
					wait()
					local bv = Instance.new("BodyVelocity")
					bv.MaxForce = Vector3.new(9e9,9e9,9e9)
					bv.Velocity = Vector3.new(0, 0, 0)
					bv.Parent = HumanoidRootPart
					local bg
					if FullCharacter(target, {height = true, ragdoll = true, health = true}) then 
						local targetPos = target.Character.HumanoidRootPart.Position
						local belowPos = Vector3.new(targetPos.X, targetPos.Y - 7, targetPos.Z)
						HumanoidRootPart.CFrame = CFrame.new(belowPos)
		
						bg = Instance.new("BodyGyro")
						bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bg.P = 500000
						bg.CFrame = CFrame.Angles(math.pi/2, 0, 0)
						bg.Parent = HumanoidRootPart
						Humanoid.PlatformStand = true
						local st2 = tick()
						PlayAnim("sleep", PublicIds.Anim.sleep, 1)
						repeat 
							targetPos = target.Character.HumanoidRootPart.Position
							belowPos = Vector3.new(targetPos.X, targetPos.Y - 15, targetPos.Z)
							HumanoidRootPart.CFrame = CFrame.new(belowPos) * CFrame.Angles(math.rad(90), 0, 0)
						wait() until tick() - st2 >= .2
						StopAnim("sleep", PublicIds.Anim.sleep)
						ListDestroy(bg)
						bg = Instance.new("BodyGyro")
						bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bg.P = 500000
						bg.CFrame = CFrame.Angles(math.pi/2, 0, 0)
						bg.Parent = HumanoidRootPart
						bg.CFrame = CFrame.Angles(math.pi, 0, 0)
						ParryVFX()
						HitAura(GetRealGlove(), 26, false)	
						local force = 150
						bv.Velocity = Vector3.new(0,1,0) * force
	
						while force > 60 do
							wait()
							force = force * 0.88
							bv.Velocity = Vector3.new(0,force,0)
						end
					end
					ListDestroy(bv, bg)
					Humanoid.PlatformStand = false
					noclip(false)
					nccam()
					wait(.05)
					LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
					abilityCD = 4
					GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Earth Release: Earth Burst Stamp", "E_ABILITY")
				else
					abilityCD = .5
					GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Earth Release: Earth Burst Stamp", "E_ABILITY")
				end
			else
				abilityCD = .5
				GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Earth Release: Earth Burst Stamp", "E_ABILITY")
			end
		end
	end
	STUN = false
	LoopWSValue = 25
	wait(abilityCD)
	if usedTool then
		Cooldown.EAbility_Tool = false
	else
		Cooldown.EAbility = false
	end
end

local function RAbility()
	if not STUN and FullCharacter() and isSneaking and not Cooldown.RAbility and not Cooldown.FAbility then
		local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
		STUN = true
		Cooldown.FAbility = true 
		KamuiEye(false)
		kamuiTP:Teleport()
		HumanoidRootPart.Velocity = Vector3.new(0,0,0)
		wait()
		rotatePlayer(true)
		wait(.5)
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 50}):Play()
		spawn(function()
			wait(1)
			tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
		end)
		wait(.5)
		toggleSneaking(false)
		GloveCommonClient:Cooldown(LocalPlayer.Character, 8, "Kamui: Teleportation", "R_ABILITY")
		STUN = false
		wait(8)
		Cooldown.FAbility = false 
		return 
	end
	if not STUN and Cooldown.FAbility or Cooldown.RAbility then
		BubbleNotify("Kamui is on cooldown", 2)
	end
	if Cooldown.RAbility or Cooldown.FAbility or STUN or isPhasing or isSneaking then return end
	Cooldown.RAbility,STUN = true, true
	local abilityCD
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	if isVoiding then
		abilityCD = 6
		toggleVoidPhase(false)
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 80}):Play()
		spawn(function()
			wait(.1)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
		end)
		GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Kamui: Intangibility", "R_ABILITY")
	else
		spawn(toggleVoidPhase,true)
		PlaySFX(workspace, PublicIds.SFX.intangibility, 5)
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 60}):Play()
		spawn(function()
			wait(.1)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
		end)
		local current = kamuiTP:GetCurrent()
		BubbleNotify("Target place: ".. current, 2)
		ReplicatedStorage.Events.Silly:FireServer("jump")
		ReplicatedStorage.Events.Elf:FireServer("vfx_craft_done")
		LoopWSValue = 25
		abilityCD = .5
		GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Kamui: Intangibility", "R_ABILITY")
	end
	STUN = false
	LoopWSValue = 25
	wait(abilityCD)
	Cooldown.RAbility = false
end


local function FAbility()
	if not HitCD and not STUN and FullCharacter() and isVoiding and not isPhasing and not Cooldown.RAbility and not Cooldown.FAbility then
		local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
		STUN = true
		HitCD = true
		Cooldown.RAbility = true
		toggleVoidPhase(false)
		equipGlove("Riftshot", true)
		PlayAnim("suck", PublicIds.Anim.suckHandsign)
		ReplicatedStorage.Events.Elf:FireServer("vfx_craft_done")
		local aim = HumanoidRootPart.CFrame +  HumanoidRootPart.CFrame.LookVector
		local args = {[1] = aim,[2] = 1,[3] = "R_ABILITY"}
		ReplicatedStorage.Events.riftshot:FireServer(unpack(args))
		local StartTime = tick()
		local arrow
		repeat wait()
		for i,v in ipairs(workspace:GetChildren()) do
		    if v.Name == "arrow" then
		            local Distance = (HumanoidRootPart.Position - v.Position).Magnitude
		            if Distance <= 10 then
		                arrow = v
		                break
		            end
		    end
		end
		until tick() - StartTime >= 0.5 or arrow
		StopAnim("suck", 89262415952223)
		if arrow then
			arrow.Size = Vector3.new(.1,.1,.1)
			pcall(function() arrow.Color = Color3.new(0,0,0) end)
			local s1 = tick()
			local weld
			repeat weld = arrow:FindFirstChild("weld") wait() until tick() - s1 >= .5 or weld and weld.Parent
			local st = tick()
			if weld then
				repeat wait() until tick() - st >= .7 or (weld and weld.Part0 ~= nil)
				if game.Players:GetPlayerFromCharacter(weld.Part0.Parent) or Players:GetPlayerFromCharacter(weld.Part0.Parent.Parent) then
					KamuiEye(false)
					kamuiTP:Teleport()
					HumanoidRootPart.Velocity = Vector3.new(0,0,0)
					wait()
					rotatePlayer(true)
					wait(.5)
					local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
					local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 50}):Play()
					spawn(function()
						wait(1)
						tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
						tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
					end)
					local args = {[1] = HumanoidRootPart.CFrame - Vector3.new(0,1,0),[2] = 2,[3] = "R_ABILITY"}
					ReplicatedStorage.Events.riftshot:FireServer(unpack(args))
				else
					ListDestroy(arrow)
				end
			else
				ListDestroy(arrow)
			end
			Debris:AddItem(arrow,1)
		end
		STUN = false
		HitCD = false
		local abilityCD = 9
		GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Kamui: Void's Embrace", "E_ABILITY")
		wait(abilityCD)
		Cooldown.RAbility = false
		return 
	end
	if not HitCD and not STUN and Cooldown.FAbility or Cooldown.RAbility then
		BubbleNotify("Kamui is on cooldown", 2)
	end
	if Cooldown.FAbility or Cooldown.RAbility or STUN or isPhasing or isVoiding then return end
	Cooldown.FAbility,STUN, HitCD = true, true, true
	local abilityCD
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	if isSneaking then
		abilityCD = 8
		KamuiEye(false)
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 50}):Play()
		spawn(function()
			wait(1)
			tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
		end)
		wait(.5)
		toggleSneaking(false)
		rotatePlayer(true)
		LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
		LoopWSValue = 25
		wait(1)
		GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Kamui: Rift Severance", "R_ABILITY")
	else
		KamuiEye()
		local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 50}):Play()
		spawn(function()
			wait(1)
			tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			tween = TweenService:create(Camera, tweenInfo, {FieldOfView = 70}):Play()
		end)
		rotatePlayer(true)
		LocalPlayer:SetAttribute("DisableMobileShiftLock", true)
		wait(1.1)
		LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
		if not DamageIFrame then
			spawn(toggleSneaking,true)
			local current = kamuiTP:GetCurrent()
			BubbleNotify("Target place: ".. current, 2)
			LoopWSValue = 35
			abilityCD = .5
		else
			BubbleNotify("Kamui is cancelled!", 2)
			LoopWSValue = 25
			abilityCD = 8
		end
		GloveCommonClient:Cooldown(LocalPlayer.Character, abilityCD, "Kamui: Rift Severance", "E_ABILITY")
	end
	STUN = false
	HitCD = false
	wait(abilityCD)
	Cooldown.FAbility = false
end


local function createFireball()
	if GloveSettings.HideVisual then return end
	local character = LocalPlayer.Character
	if not character then return end
	local head = character:WaitForChild("Head")
	local forwardDirection = head.CFrame.LookVector
	
	local fireball = Instance.new("Part")
	fireball.Shape = Enum.PartType.Ball
	fireball.Size = Vector3.zero
	fireball.BrickColor = BrickColor.new("Neon orange")
	fireball.Material = Enum.Material.Neon
	fireball.Color = Color3.fromRGB(255, 200, 0)
	fireball.Anchored = true
	fireball.CanCollide = false
	fireball.Transparency = 0
	
	local pointLight = Instance.new("PointLight")
	pointLight.Color = Color3.fromRGB(255, 150, 0)
	pointLight.Range = 15
	pointLight.Brightness = 0.3
	pointLight.Parent = fireball
	
	local fireParticle = workspace.Lobby.Sun.Attachment.RealisticFire:Clone()
	fireParticle.Parent = fireball
	fireParticle.Rate = 50
	fireParticle.Lifetime = NumberRange.new(0.3, 0.6)
	fireParticle.SpreadAngle = Vector2.new(40, 40)
	fireParticle.Speed = NumberRange.new(3, 7)
	
	local startPos = head.Position + forwardDirection * 0.8
	local midPos = startPos + forwardDirection * 25
	
	fireball.Position = startPos
	fireball.Parent = workspace
	fireball.Transparency = 0.95
	
	local tweenInfo1 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenSize1 = TweenService:Create(fireball, tweenInfo1, {Size = Vector3.new(10, 10, 10)})
	local tweenPos1 = TweenService:Create(fireball, tweenInfo1, {Position = midPos})
	local tweenColor1 = TweenService:Create(fireball, tweenInfo1, {Color = Color3.fromRGB(255, 50, 0)})
	local tweenLight1 = TweenService:Create(pointLight, tweenInfo1, {Color = Color3.fromRGB(255, 20, 0)})
	
	tweenSize1:Play()
	tweenPos1:Play()
	tweenColor1:Play()
	tweenLight1:Play()
	
	task.wait(0.5)
	
	local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	local tweenTransparency = TweenService:Create(fireball, tweenInfo2, {Transparency = 1})
	
	tweenTransparency:Play()
	
	task.wait(1)
	fireball:Destroy()
end

local function TAbility(btn)
	if not STUN and FullCharacter() and (isSneaking or isVoiding) and not Cooldown.RAbility and not Cooldown.FAbility then
		local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
		STUN = true
		kamuiTP:Next()
		local current = kamuiTP:GetCurrent()
		BubbleNotify("Target place: ".. current, 2)
		wait(.1)
		STUN = false
		return 
	end
	if Cooldown.TAbility or STUN or isPhasing or isVoiding or isSneaking then return end
	Cooldown.TAbility = true
	STUN = true
	local btn = btn and btn:FindFirstChild("ImageLabel")
	local abilityCD
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	pcall(function()
		if not holdingTool() then
			Humanoid:EquipTool(LocalPlayer.Backpack[NewToolName])
		end
	end)
	equipGlove("Untitled Tag Glove", true)
	HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 100, 0)
	local startTime = tick()
	PlayAnim("toolT", PublicIds.Anim.tool_T, 1)
	ReplicatedStorage.Events.Silly:FireServer("jump")
	while startTime + 1 > tick() and FullCharacter() and (inAir() or startTime + 0.2 > tick()) do
		local lookVelocity = Character.HumanoidRootPart.CFrame.LookVector * 90
		local currentY = Character.HumanoidRootPart.AssemblyLinearVelocity.Y
		Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(lookVelocity.X, currentY, lookVelocity.Z)
		wait()
	end
	LoopWSValue = 7
	local hb = AddHitbox(CFrame.new(0, 0, 0), Vector3.new(15, 15, 20), .05, false, function(hit)
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if player and player ~= LocalPlayer and FullCharacter(player, {ragdoll = true, health = true, height = true}) then
			ReplicatedStorage.UTGGeneric:FireServer("enableRunMode")
			HitAura(GetRealGlove(), 30, true)
			ReplicatedStorage.UTGGeneric:FireServer("disableRunMode")
			return true
		end
	end)
	wait(.7)
	StopAnim("toolT", PublicIds.Anim.tool_T)
	LoopWSValue = 25
	abilityCD = 8
	AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
	STUN = false
	wait(abilityCD)
	Cooldown.TAbility = false
end

local function CAbility(btn)
	if Cooldown.CAbility or STUN or isPhasing or isVoiding or isSneaking then return end
	Cooldown.CAbility = true
	STUN = true
	local btn = btn and btn:FindFirstChild("ImageLabel")
	local abilityCD
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	equipGlove("Untitled Tag Glove", true)
	abilityCD = 4
	LoopWSValue = 5
	pcall(function()
		Humanoid:UnequipTools()
	end)
	if not inAir() then
		local bv = Instance.new("BodyVelocity", HumanoidRootPart)
		bv.Name = "bv"
		bv.MaxForce = Vector3.new(9e9,9e9,9e9)
		bv.Velocity = (HumanoidRootPart.CFrame.LookVector * 150) + (HumanoidRootPart.CFrame.UpVector * 40)
		wait(.05)
		bv:Destroy()
	end
	FOVTween(60, .2)
	PlayAnim("katonEnd", PublicIds.Anim.katonEnd, 0, .5)
	PlayAnim("katonCharge", PublicIds.Anim.katonLoop, 3, .5)
	local bv = Instance.new("BodyVelocity", HumanoidRootPart)
	bv.Name = "bv"
	bv.MaxForce = Vector3.new(9e9,9e9,9e9)
	local backwardDirection = -HumanoidRootPart.CFrame.LookVector
	bv.Velocity = Vector3.new(backwardDirection.X * 25, 40, backwardDirection.Z * 25)
	wait(0.13)
	Humanoid.PlatformStand = true
	StopAnim("katonCharge", PublicIds.Anim.katonLoop)
	LocalPlayer:SetAttribute("DisableMobileShiftLock", true)
	bv.Velocity = Vector3.new(0,0,0)
	
	local bg = Instance.new("BodyGyro", HumanoidRootPart)
	bg.Name = "bg"
	bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bg.P = 500000
	bg.D = 500
	bg.CFrame = HumanoidRootPart.CFrame * CFrame.Angles(-math.pi/2.9,0, 0)
	wait(.1)
	bv.Velocity = Vector3.new(backwardDirection.X * 50, 50, backwardDirection.Z * 50)
	local cooldownHits = {}
	local hb = AddHitbox(CFrame.new(0, 0, 15), Vector3.new(20, 20, 30), .2, false, function(hit)
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if player and player ~= LocalPlayer and FullCharacter(player, {ragdoll = true, health = true, height = true}) then
		ReplicatedStorage.Events.Opera:FireServer(unpack({[1] = {["state"] = "overclock_slap",["victim"] = player}}))
			HitAura(GetRealGlove(), 30, true)
			return true
		end
	end)
	FOVTween(90, .5)
	ReplicatedStorage.Events.Elf:FireServer("vfx_craft_done")
	wait(.1)
	Humanoid.PlatformStand = false
	ListDestroy(bv, bg)
	ReplicatedStorage.Events.Elf:FireServer("vfx_craft_done")
	for i = 1, 40 do
		spawn(createFireball)
	end
	FOVTween(70, .2)
	ReplicatedStorage.Events.Elf:FireServer("remove_smoke")
	LoopWSValue = 25
	StopAnim("katonEnd", PublicIds.Anim.katonEnd)
	ListDestroy(bg, hb)
	LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
	AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), abilityCD)
	STUN = false
	wait(abilityCD)
	Cooldown.CAbility = false
end


----------MAIN GLOVE CUSTOM----------
if not HaveGlove("Riftshot") then
	loadstring(game:HttpGet('https://pastefy.app/TJp1w6pc/raw'))()
	wait(10)
	LocalPlayer:Kick("Turn OFF Delta's Verify Teleport so we can get required glove.")
	return
end
if not HaveGlove("Untitled Tag Glove") then
	loadstring(game:HttpGet('https://pastefy.app/gApOAHzR/raw'))()
	wait(10)
	LocalPlayer:Kick("Turn OFF Delta's Verify Teleport so we can get required glove.")
	return
end

local function XAbility(btn)
	if SpecialCooldown.XAbility or STUN or isPhasing then return end
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	if FullCharacter() then
		SpecialCooldown.XAbility = true
		STUN = true
		if not inAir() then
			PlayAnim("roll", PublicIds.Anim.roll, 1)
		else
			PlayAnim("frontflip", PublicIds.Anim.frontflip, 1.3, .2)
		end
		local bv = Instance.new("BodyVelocity", HumanoidRootPart)
		bv.MaxForce = Vector3.new(9e9,0,9e9)
		bv.Velocity = HumanoidRootPart.CFrame.LookVector * 70
		for i = 1,4 do
			bv.Velocity = bv.Velocity * .9
			wait(.1)
		end
		bv:Destroy()
		StopAnim("frontflip", PublicIds.Anim.frontflip)
		local cd = isSneaking and .3 or 2
		AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), cd)
		STUN = false
		wait(cd)
		SpecialCooldown.XAbility = false
	end 
end

local function ZAbility(btn)
	if SpecialCooldown.ZAbility or STUN or isPhasing then return end
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	if FullCharacter() then
		SpecialCooldown.ZAbility = true
		STUN = true
		local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
		bv.Name = "bv"
		if inAir() then
			bv.Velocity = (HumanoidRootPart.CFrame.LookVector * -80) + (HumanoidRootPart.CFrame.UpVector * 1)
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
			PlayAnim("Backdash", PublicIds.Anim.backdash, 0, .1)
			wait(.1)
			ListDestroy(bv)
			wait(.1)
			StopAnim("Backdash", PublicIds.Anim.backdash)
		else
			bv.Velocity = (HumanoidRootPart.CFrame.LookVector * -70) + (HumanoidRootPart.CFrame.UpVector * 40)
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
			PlayAnim("Backflip", PublicIds.Anim.backflip, 1.2)
			wait(0.1)
			ListDestroy(bv)
			wait(.2)
			StopAnim("Backflip", PublicIds.Anim.backflip)
		end
		local cd = isSneaking and .3 or 2
		AddCooldownLabel(btn, UDim2.new(.8,0,.13,0), UDim2.new(.1,0,1.05,0), cd)
		STUN = false
		wait(cd)
		SpecialCooldown.ZAbility = false
	end 
end

local function InitWoodRod(toolInstance)
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	local RA = Character:WaitForChild("Right Arm", 2)
	local woodenReceiver = nil
	local isEquipped = false
	local sizeTween = nil
	local posTween = nil
	
	if RA and toolInstance then
		woodenReceiver = Instance.new("Part", RA)
		woodenReceiver.Name = "woodRod"
		woodenReceiver.Shape = Enum.PartType.Cylinder
		woodenReceiver.Material = Enum.Material.Wood
		woodenReceiver.Color = Color3.fromRGB(107, 66, 13)
		woodenReceiver.CanCollide = false
		woodenReceiver.Massless = true
		woodenReceiver.Transparency = 1
		woodenReceiver.Size = Vector3.new(0.25, 0.25, 0.25)
		
		local weld = Instance.new("Weld")
		weld.Name = "Weld"
		weld.Part0 = RA
		weld.Part1 = woodenReceiver
		weld.C0 = CFrame.new(0, 0, -0.3)
		weld.C1 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90))
		weld.Parent = woodenReceiver
		
		local retractedSize = Vector3.new(0.1, 0.25, 0.25)
		local extendedSize = Vector3.new(2.75, 0.25, 0.25)
		local retractedPos = CFrame.new(0, -0.5, -0.3)
		local extendedPos = CFrame.new(0, -2, -0.3)
		
		local function extendBar()
			woodenReceiver.Transparency = 0
			
			sizeTween = TweenService:Create(woodenReceiver, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = extendedSize})
			sizeTween:Play()
			
			posTween = TweenService:Create(weld, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {C0 = extendedPos})
			posTween:Play()
		end
		
		local function retractBar()
			sizeTween = TweenService:Create(woodenReceiver, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = retractedSize})
			sizeTween:Play()
			
			posTween = TweenService:Create(weld, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {C0 = retractedPos})
			posTween:Play()
			
			task.wait(0.2)
			if not isEquipped then
				woodenReceiver.Transparency = 1
			end
		end
		
		local function checkTools(hasTool)
			if hasTool then
				if GloveSettings.HideVisual then return end
				isEquipped = true
				extendBar()
			else
				if woodenReceiver.Transparency == 0 then
					isEquipped = false
					retractBar()
				end
			end
		end
		
		toolInstance.Equipped:Connect(function()
			checkTools(true)
		end)
		
		toolInstance.Unequipped:Connect(function()
			checkTools(false)
		end)
		spawn(function()
			repeat twait() until RA:FindFirstChild("harpoon_anim")
			if GloveSettings.HideVisual then
				for i,v in pairs(RA.harpoon_anim:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
					RA.harpoon_anim.CanCollide = false
				end
				woodenReceiver:Destroy()
			else
				RA.harpoon_anim:Destroy()
			end
		end)
		ReplicatedStorage.Events.butcherAttack:InvokeServer("addhook")
	end
end

local function LoadOutfit()
	if GloveSettings.HideVisual then return end 
	local eye = game:GetObjects(PublicIds.Models.kamuiEye)[1]
	local mask = game:GetObjects(PublicIds.Models.mask)[1]
	local head = LocalPlayer.Character:WaitForChild("Head")
	mask.Parent = head 
	mask.Massless = true
	mask.Anchored = false
	mask.CanCollide = false
	mask.Name = "Tobi mask"
	mask:PivotTo(head.CFrame)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = head
	weld.Part1 = mask
	weld.Parent = mask
	local attachment = Instance.new("Attachment")
	attachment.Parent = head
	attachment.Position = Vector3.new(0.3, 0, -0.45)
	local blackPart = Instance.new("Part")
	blackPart.Size = Vector3.new(0.3, 0.3, .25)
	blackPart.Material = Enum.Material.Neon
	blackPart.Massless = true
	blackPart.Color = Color3.new(0, 0, 0)
	blackPart.Anchored = false
	blackPart.CanCollide = false
	blackPart.CFrame = attachment.WorldCFrame
	blackPart.Parent = head
	eye.Anchored = false
	eye.CanCollide = false
	eye.Massless = true
	eye:PivotTo(attachment.WorldCFrame)
	eye.Parent = head
	eye.Size = Vector3.new(0,0,0)
	eye.Name = "Kamui"
	eye.Mesh.Scale = Vector3.new(.4,.4,.4)
	eye.Mesh.Offset = Vector3.new(0.015,0,-0.05)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = head
	weld.Part1 = eye
	weld.Parent = eye
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = head
	weld.Part1 = blackPart
	weld.Parent = blackPart
end

LocalPlayer.leaderstats.Glove.Value = GetRealGlove()
CustomGlove = function(AllowReEquip)
	if not AllowReEquip and LocalPlayer.leaderstats.Glove.Value == NewGlove then return end
	
	RealGlove = GetRealGlove()
	local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
	
	local function equipCustom(ReExectute)
		if RealGlove ~= GloveRequirement then
			LocalPlayer.leaderstats.Glove.Value = RealGlove
			return
		end
		
		local TimeEnded
		local tool
		
		LocalPlayer.leaderstats.Glove.Value = NewGlove
		twait(0.1)
		LocalPlayer.leaderstats.Glove.Value = NewGlove

		while TimeEnded == nil do
			if LocalPlayer.leaderstats.Glove.Value ~= NewGlove then return end
			repeat
				tool = GetTool(GloveRequirement)
				twait()
			until tool or not FullCharacter(LocalPlayer, {health = true}) or LocalPlayer.leaderstats.Glove.Value ~= NewGlove
			
			if tool then
				if tool.Name == RealGlove then
					TimeEnded = false
					break
				else
					tool = nil
					LocalPlayer.leaderstats.Glove.Value = GetRealGlove()
					return
				end
			end
			twait()
		end
		
		if tool and Character:FindFirstChild("entered") and LocalPlayer.leaderstats.Glove.Value == NewGlove then
			Camera.CameraType = Enum.CameraType.Scriptable
			spawn(function()
				for i = 1,20 do
					LocalPlayer.Character:PivotTo(CFrame.new(0, random(100000,1000000), 0))
					twait()
				end
			end)
			tool.Parent = nil
			Humanoid.Health = 0
			twait(3.75)
			repeat twait() until FullCharacter()
			local Character, Humanoid, HumanoidRootPart = GetBodyParts(LocalPlayer)
			HumanoidRootPart.CFrame = workspace.Origo.CFrame * CFrame.new(random(-50, 50), 0, random(-50, 50))
			Camera.CameraType = Enum.CameraType.Custom
			
			tool.Parent = LocalPlayer.Backpack
			local toolLS = tool:FindFirstChildWhichIsA("LocalScript")
			if toolLS then
				toolLS.Enabled = false
			end
			InitWoodRod(tool)
			LoadOutfit()
			PlayButtonVisible(false)
			tool.Handle.Transparency = 1
			for i, v in pairs(tool:GetDescendants()) do
				if v:IsA("ParticleEmitter") or v:IsA("Texture") then
					v:Destroy()
				elseif v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			workspace.Gravity = 196.2
			tool.Name = NewToolName and tostring(NewToolName) or tostring(NewGlove)
			tool.ToolTip = tostring(NewTooltip)
			local ContextActionGui = LocalPlayer.PlayerGui:FindFirstChild("ContextActionGui")
			if ContextActionGui then
				ContextActionGui.Enabled = false
				pcall(function()
					ContextActionGui.ContextButtonFrame:ClearAllChildren()
				end)
			end
			pcall(function()
				LocalPlayer.PlayerGui.crosshair:Destroy()
			end)
			local doubleJumpUsed = false
			JumpConnection = UserInputService.JumpRequest:Connect(function()
				local character = LocalPlayer.Character
				local humanoid = character and character:FindFirstChild("Humanoid")
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				
				if humanoid and humanoidRootPart and not STUN then
					if inAir() and not humanoid.Jump then
						if not doubleJumpUsed or isSneaking then
							humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 50, humanoidRootPart.Velocity.Z)
							doubleJumpUsed = true
							if isSneaking then 
								wait(.1)
								doubleJumpUsed = false 
							else
								repeat wait() until not inAir()
								doubleJumpUsed = false 
							end
						end
					else
						doubleJumpUsed = false
					end
				end
			end)
			DisableScriptConnection = LocalPlayer.CharacterAdded:Connect(OnChararacterAddedFunc)
			DamageConnection = Humanoid.Touched:Connect(OnDamageFunc)
			PartDamageConnection = Humanoid.Touched:Connect(OnPartDamageFunc)
			DeathConnection = Character.Humanoid.Died:Connect(OnDeathFunc)
			AliveConnection = RunService.Heartbeat:Connect(StillAliveFunc)

			InitSlapSystem(tool)
			tool.Equipped:Connect(function()
				ReplaceAnim("walk", PublicIds.Anim.tool_walk) 
			end)
			tool.Unequipped:Connect(function()
				ReplaceAnim("walk", PublicIds.Anim.norm_walk)
			end)
			
			ReplaceAnim("toolnone", PublicIds.Anim.tool_idle)
			spawn(function()
				while FullCharacter() do
					if Character.Humanoid.MoveDirection.Magnitude ~= 0 or not holdingTool() or inAir() then 
						StopAnim("toolnone", PublicIds.Anim.tool_idle)
					elseif not IsPlayingAnim("toolnone", PublicIds.Anim.tool_idle) and holdingTool() then
						PlayAnim("toolnone", PublicIds.Anim.tool_idle)
					end
					wait()
				end
			end)
			ReplaceAnim("walk", PublicIds.Anim.norm_walk)
			--ReplaceAnim("idle", PublicIds.Anim.norm_idle)
			STUN = false
			HitCD = false
			kamuiTP:Reset()
			spawn(AntiFlop,true)
			spawn(SetCD, false)
			spawn(SetSpecialCD, false)
			LoopWSValue = 25
			
			Humanoid:UnequipTools()
			Character.Humanoid:EquipTool(tool)
			
			local EAbility = EAbility
			local RAbility = RAbility
			local TAbility = TAbility
			local FAbility = FAbility
			local CAbility = CAbility
			local ZAbility = ZAbility
			
			local ZBtn, XBtn
			if isMobile then
				AddContextActionButton("R", PublicIds.Images.RButton, UDim2.new(0.975, -25, -0.225, -25), RAbility)
				EBtn = AddContextActionButton("E", PublicIds.Images.EButton, UDim2.new(0.725, -25, -0.025, -25), function() EAbility(EBtn) end)
				TBtn = AddContextActionButton("T", PublicIds.Images.TButton, UDim2.new(0.725, -25, -0.425, -25), function() TAbility(TBtn) end)
				AddContextActionButton("F", PublicIds.Images.FButton, UDim2.new(0.975, -25, -0.625, -25), FAbility)
				CBtn = AddContextActionButton("C", PublicIds.Images.QButton, UDim2.new(0.725, -25, -0.825, -25), function() CAbility(CBtn) end)
				ZBtn = AddRobloxDefaultButton("Z", 10, UDim2.new(0.2, 0, -1, 0), function() ZAbility(ZBtn) end)
				XBtn = AddRobloxDefaultButton("X", 10, UDim2.new(0.4, 0, -1, 0), function() XAbility(XBtn) end)
			end
			KeyboardAbilityConnection = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
				if input.KeyCode == Enum.KeyCode.E then
					EAbility()
				elseif input.KeyCode == Enum.KeyCode.R then
					RAbility()
				elseif input.KeyCode == Enum.KeyCode.T then
					TAbility()
				elseif input.KeyCode == Enum.KeyCode.F then
					FAbility("hold")
				elseif input.KeyCode == Enum.KeyCode.C then
					CAbility()
				elseif input.KeyCode == Enum.KeyCode.Z then
					ZAbility()
				elseif input.KeyCode == Enum.KeyCode.X then
					XAbility()
				end
			end)
			KeyboardAbilityConnection2 = UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
				if input.KeyCode == Enum.KeyCode.F then
					FAbility("release")
				end
			end)
		else
			OnChararacterAddedFunc()
		end
	end

	OnChararacterAddedFunc = function()
		DisableConnections(AliveConnection, JumpConnection, KeyboardSupportConnection, KeyboardSupportConnection2,DisableScriptConnection, DamageConnection, PartDamageConnection, TargetSystemConnection, TargetPlayerDiedConnection, TargetPlayerAddedConnection)
		LocalPlayer:SetAttribute("DisableMobileShiftLock", false)
		
		if isVoiding then
			toggleVoidPhase(false)
		end
		PlayButtonVisible(true)
		AntiFlop(false)
		STUN = true
		FOVTween(70, 1)
		
		isSneaking = false
		SetCD(true)
		SetSpecialCD(true)
		
		local ContextActionGui = LocalPlayer.PlayerGui:FindFirstChild("ContextActionGui")
		if ContextActionGui and isMobile then
			ContextActionGui.Enabled = true
		end
		
		twait(0.1)
		if LocalPlayer.leaderstats.Glove.Value == NewGlove and (GetRealGlove() == GloveRequirement or GetRealGlove() == GloveRequirementAlt) then
			if GetRealGlove() == GloveRequirementAlt then
				equipGlove(GloveRequirement, true)
				wait(.5)
			end
			CustomGlove(true)
		end
	end
	equipCustom()
end

----------GLOVE STAND----------
local function SoundCreate(Parent, Name, Id, Volume)
	local Sound = Parent:FindFirstChild(Name)
	if not Sound then
		Sound = Instance.new("Sound", Parent)
		Sound.Name = Name
		Sound.SoundId = "rbxassetid://".. Id
		Sound.Volume = Volume
	end
	return Sound
end

local function EmitAcceptVFX(parent)
	local SuccessEquipSFX = SoundCreate(parent, "SuccessEquipSFX", PublicIds.SFX.equipSuccess, 3)
	pcall(function()
	spawn(function()
		SuccessEquipSFX:Play()
		local Attach = Instance.new("Attachment", parent)
		Attach.CFrame = CFrame.new(-.5,0,0)
		Attach.Name = "attachment"
		for i, v in pairs(game:GetService("ReplicatedStorage").GloveEquipParticle.Attachment:GetChildren()) do
			local clone = v:Clone()
			clone.Parent = Attach
			clone.Enabled = true
			clone:Emit(5)
			spawn(function()
				twait(.2)
				clone.Enabled = false
			end)
		end 
		twait(5)
		Attach:Destroy()
	end)
	end)
end

local function EmitFailVFX(parent)
	local FailEquipSFX = SoundCreate(parent, "FailEquipSFX", PublicIds.SFX.equipFail,2, 2)
	pcall(function()
	spawn(function()
		spawn(function()
			FailEquipSFX:Play()
			twait(.4)
			FailEquipSFX:Stop()
		end)
		local Attach = Instance.new("Attachment", parent)
		Attach.CFrame = CFrame.new(-.5,0,0)
		Attach.Name = "attachment"
		for i, v in pairs(game:GetService("ReplicatedStorage").GloveEquipParticle.Attachment2:GetChildren()) do
			local clone = v:Clone()
			clone.Parent = Attach
			clone.Enabled = true
			clone.LightEmission = 10
			clone:Emit(10)
			spawn(function()
				twait(.2)
				clone.Enabled = false
			end)
		end 
		twait(5)
		Attach:Destroy()
	end)
	end)
end

local Custom_Glovestands_Folder = Lobby:FindFirstChild("Donjo_Custom_Glovestands_Folder")
if not Custom_Glovestands_Folder then
    Custom_Glovestands_Folder = Instance.new("Folder", Lobby)
    Custom_Glovestands_Folder.Name = "Donjo_Custom_Glovestands_Folder"
end
local NewStandModel = Custom_Glovestands_Folder:FindFirstChild(NewGlove .. "[Stand]")
if NewStandModel then 
    NewStandModel:Destroy()
end

local OriginGloveModel = Lobby.Extended
local OriginStandModel = GloveStands.Extended
NewStandModel = OriginStandModel:Clone()
NewGloveModel = OriginGloveModel:Clone()
NewStandModel.Parent = Custom_Glovestands_Folder
NewGloveModel.Parent = NewStandModel
NewStandModel.Name = NewGlove .. "[Stand]"
NewGloveModel.Name = NewGlove .. "[Glove]"
local GloveClickDetector = NewGloveModel:FindFirstChild("ClickDetector")
if GloveClickDetector then 
    GloveClickDetector:Destroy()
    GloveClickDetector = Instance.new("ClickDetector", NewGloveModel)
end

NewStandModel:PivotTo(game:GetService("Workspace").Lobby.HunterHatch.Model:GetPivot() * CFrame.Angles(0,math.rad(90),0) * CFrame.new(0,1,0))

local GloveDesc = NewStandModel.GloveDesc
local DescOutline = NewStandModel.GloveDesc.DescOutline
local SlapsInfoPart = NewStandModel.SlapsInfoPart
local DescFrame = DescOutline.DescFrame
local BannerFrame = DescFrame.ImageLabel
local IconBadge = SlapsInfoPart.SurfaceGui.ImageLabel
local RequirementText = SlapsInfoPart.SurfaceGui.TextLabel
local GloveAbilityTypeText = DescFrame.AbilityType
local GloveNameText = DescFrame:FindFirstChild("Name")
local GloveAbilityNameText = DescFrame.Ability
local GlovePowerText = DescFrame.Power
local GloveSpeedText = DescFrame.Speed

GloveNameText.Text = NewGlove
GlovePowerText.Text = "Power: " .. "???"
GloveSpeedText.Text = "Speed: " .. "???"
GloveAbilityNameText.Text = "ABILITY: " .. "Kamui"
GloveAbilityTypeText.Text = "ACTIVE"
BannerFrame.Image = "rbxthumb://type=Asset&id=".. PublicIds.Images.banner .."&w=150&h=150"
DescFrame.BackgroundColor3 = Color3.new(1,1,1)
RequirementText.Size = UDim2.new(1,0,1,0)
RequirementText.Text = "Own the Riftshot and UTG gloves"
IconBadge:Destroy()
NewGloveModel:Destroy()
local mask = game:GetObjects(PublicIds.Models.mask)[1]
mask.Size = mask.Size * 2
mask:PivotTo(NewStandModel:GetPivot() * CFrame.new(0,4,0) * CFrame.Angles(0,math.rad(-90),0))
mask.Parent = NewStandModel 
mask.Anchored = true
mask.CanCollide = false
mask.Name = "Tobi mask"
NewGloveModel = mask

local GloveClickDetector = NewGloveModel:FindFirstChild("ClickDetector")
if GloveClickDetector then 
    GloveClickDetector:Destroy()
end
GloveClickDetector = Instance.new("ClickDetector", NewGloveModel)

GloveClickDetector.MouseClick:Connect(function()
	FixGloveEquip()
	local highlight = mask:FindFirstChild("GloveHighlight")
	if highlight == nil then 
		highlight = Instance.new("Highlight", mask)
		highlight.Name = "GloveHighlight"
		highlight.Adornee = mask
		highlight.FillTransparency = 1
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.FillColor = Color3.fromRGB(255, 255, 255)
		highlight.OutlineTransparency = 1
		highlight.DepthMode = Enum.HighlightDepthMode.Occluded
	end
	if GetRealGlove() ~= GloveRequirement then
		equipGlove(GloveRequirement)
		twait(.3)
	end
	RealGlove = GetRealGlove(EquippedValue.Value)
	if RealGlove ~= GloveRequirement then 
		if not HaveGlove(GloveRequirement) then
			EmitFailVFX(NewGloveModel)
			game.StarterGui:SetCore("SendNotification", {Title = "System", Text = "You don't have owned " .. GloveRequirement, Duration = 2})
			return 
		end
	end
	if RealGlove ~= GloveRequirement then
		equipGlove(GloveRequirement)
		wait(.5)
	end
	RealGlove = GetRealGlove()
	if RealGlove == GloveRequirement then
		spawn(CustomGlove)
		spawn(function() EmitAcceptVFX(NewGloveModel) end)
		TweenService:Create(highlight, TweenInfo.new(0, Enum.EasingStyle.Linear), {OutlineTransparency = 0}):Play() 
		TweenService:Create(highlight, TweenInfo.new(0, Enum.EasingStyle.Linear), {FillTransparency = .3}):Play() 
		wait()
		TweenService:Create(highlight, TweenInfo.new(.8, Enum.EasingStyle.Linear), {OutlineTransparency = 1}):Play()
		TweenService:Create(highlight, TweenInfo.new(.8, Enum.EasingStyle.Linear), {FillTransparency = 1}):Play()
	else
		EmitFailVFX(NewGloveModel)
	end
end)
