
-- Anyway comments mean AI generated?
-- Bro i am not a super human that can remember hundred line of code
-- i need it to list orders to know where to find to update and edit my functions 😭 

-- anyway, go ahead and skid it if you want
local DebugOn = true
local function debug(Value)
	if DebugOn then
		print(Value)
	end 
end
game.StarterGui:SetCore("SendNotification", {Title = "CREDIT!", Text = "Script made by DonjoSyntax", Duration = 10})

--[[VARIABLES 1]]--
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

--[[Bypass]]--
if not _G.BypassedSBGeneralAntiCheat then
	local Namecall
	Namecall = hookmetamethod(game, "__namecall", function(self, ...)
	   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
	       return
	   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
	       return
	   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
	       return
	   end
	   return Namecall(self, ...)
	end)
	_G.BypassedSBGeneralAntiCheat = true 
end

--[[Default Settings]]--
if not DeathSettings then
	DeathSettings = {
		HideClientVFX = false,
		HideClientDialogue = false,
		HideVisibleScythe = false,
		MuteClientSFX = true,
		ClientDeathTheme = false,
		ShowHitboxes = false,
		CustomTheme = 1843497734,
		Invincible = true
	}
end
local HideClientsVFX = DeathSettings.HideClientsVFX or false 
local HideClientDialogue = DeathSettings.HideClientDialogue or false 
local MuteClientSFX = DeathSettings.MuteClientSFX
local DeathThemeEnabled = DeathSettings.ClientDeathTheme
local HideVisibleScythe = DeathSettings.HideVisibleScythe
local InvincibleMode = DeathSettings.Invincible
local InvincibleModeAbility = InvincibleMode
local CustomTheme = tonumber(DeathSettings.CustomTheme) or 1843497734

--[[Call loadstring functions]]--
local GloveHitsFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/DonjoScripts/General-SB-/refs/heads/SlapBattles/GloveHits.lua"))()
local lobby, GloveStands, RegularPortal = loadstring(game:HttpGet('https://raw.githubusercontent.com/DonjoScripts/General-SB-/refs/heads/SlapBattles/SlapBattles-PartsName.lua'))()
local Moai, CloneName = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DonjoScripts/General-SB-/refs/heads/SlapBattles/GlovesAbuser-Value.lua'),true))()

local function PlaySoundRemote(Name, Volume, Universal)
	local SoundParent = Universal and LocalPlayer.Character.Humanoid
    local Volume = Volume or 1
    local args = {
        [1] = Name,
        [2] = LocalPlayer.Character.HumanoidRootPart
    }
    coroutine.wrap(function()
	    for i = 1, Volume do
	        spawn(function()
	            ReplicatedStorage.PlaySoundRemote:InvokeServer(unpack(args))
	        end)
	    end
    end)()
end

local function CreateClientSound(ParentSet, Id, Vol, Loop)
	if DeathSettings.MuteClientSFX then return end
    local Sound = Instance.new("Sound")
	Sound.Parent = ParentSet
    Sound.Name = "rbxassetid://".. Id
    Sound.SoundId = "rbxassetid://".. Id
    Sound.Volume = Vol or 1
	Sound.Looped = Loop or false
	Sound:Play()
	Sound.Ended:Connect(function()
		Sound:Destroy()
	end)
	return Sound
end
-- other functions call
local createCooldown


local cloneref = cloneref or blankfunction
if not cloneref then
	getgenv().cloneref=function(service)
		return game:GetService(service)
	end
end
local function ClonerefService(service)
	return cloneref(game:GetService(service))
end
local function PlayButtonVisible(Value)
	for i,v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
		if v.Name == "GoToPortal" then
			v.Visible = Value
		end
	end
end

--[[VARIABLES 2]]--
local FullCharacter
local BoostValue = 0

local BrawlerMode = false
local ScytheMode = false
local ParryReduceKB
local NewGlove = "Death"
local NewTooltip = "Death thirteen - probably not a jojo reference"
local OLGlove = ""
local PCKeyBind 
local PCKeyBindInputEnd 

-- VFX function 
local AddClientShadow
local AddClientRock
local RockRayTP
local AddClientVFX
local AddClientTrail
local AuraColor1 = Color3.new(1,0.45, 0)
local AuraColor2 = Color3.new(1,0,0)
local AddAura
-- ShiftLock 
local SLActive = false
local SLHRPPos = Vector3.new(0, 0, 0)

-- math
local inf = math.huge
local ran = math.random
local rad = math.rad


--[[Functions]]--
-- Guis
local SG = game.CoreGui:FindFirstChild("Death_GloveCustom")
if not SG then
	SG = Instance.new("ScreenGui", game.CoreGui)
	SG.Name = "Death_GloveCustom"
	SG.DisplayOrder = -9999
end

local colorcorrect = Lighting:FindFirstChild("BLAST [DEATH]")
if not colorcorrect then
	 colorcorrect = Instance.new("ColorCorrectionEffect", Lighting)
	 colorcorrect.Name = "BLAST [DEATH]"
end

local function AddCorner(instance, radius)
    local corner = Instance.new("UICorner", instance)
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

local function AddStroke(instance, thickness, Color)
	local Stroke = Instance.new("UIStroke", instance)
	Stroke.Color = Color or Color3.new(0, 0, 0)
	Stroke.Thickness = thickness
	return Stroke
end

local ThemeColor = Color3.new(1,0,0)
local function DarkenColor(color, factor)
    return Color3.new(color.R * factor, color.G * factor, color.B * factor)
end

local function AddGradient(Parent, ColorO, ColorI)
	local Color = Instance.new("UIGradient", Parent)
	local ColorPicked = ColorO or ThemeColor
	local ColorPicked2 = ColorI or Color3.new(1,1,1)
	Color.Color = ColorSequence.new({
	    ColorSequenceKeypoint.new(0, ColorPicked),
	    ColorSequenceKeypoint.new(1, ColorPicked2)
	})
	Color.Transparency = NumberSequence.new(0)
	Color.Rotation = 90
end



--[[CooldownMaker]]--
if not game.CoreGui:FindFirstChild("CD Maker") then
    local CDNotifSG = Instance.new("ScreenGui", game.CoreGui)
    CDNotifSG.Name = "CD Maker"
end

local CDNotifSG = game.CoreGui:FindFirstChild("CD Maker")
if not CDNotifSG:FindFirstChild("CDFrameCenter") then
    local CDFrameCenter = Instance.new("Frame")
    CDFrameCenter.Size = UDim2.new(0.2, 0, 1, 0)
    CDFrameCenter.Position = UDim2.new(0.8, 0, 0, 0)
    CDFrameCenter.BackgroundTransparency = 1
    CDFrameCenter.Parent = CDNotifSG
    CDFrameCenter.Name = "CDFrameCenter"
end

local CDFrameCenter = CDNotifSG:FindFirstChild("CDFrameCenter")
local CDbars = {}

local function updateCDbarPositions()
    for i, CDbar in ipairs(CDbars) do
        local targetPos = UDim2.new(0.55, 0, 0.25 - (i - 1) * 0.05, 0)
        TweenService:Create(CDbar, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end
end

local function createCooldown(Notify)
    if Notify.Fill == nil then Notify.Fill = 0 end
    Notify.Time = Notify.Time - 0.025

    local CDbar = Instance.new("Frame", CDFrameCenter)
    CDbar.Size = UDim2.new(0.4, 0, 0.03, 0)
    CDbar.BackgroundColor3 = Color3.new(0, 0.4, 0)
    CDbar.BorderSizePixel = 3
    CDbar.BorderColor3 = Color3.new(0, 0, 0)
    CDbar.Active = true
	table.insert(CDbars, CDbar)
    local CDpos
    for i, v in ipairs(CDbars) do
	    if i > 1 then
	        CDbar.Position = UDim2.new(1.5, 0, 0.25 - (i - 1) * 0.05, 0)
	    else
		    CDbar.Position = UDim2.new(2, 0, 0.25, 0)
	    end
	end

    local timeBar = Instance.new("Frame")
    timeBar.BackgroundColor3 = Color3.new(0, 0.6, 0)
    timeBar.BorderSizePixel = 0
    timeBar.Parent = CDbar

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = Notify.Title
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextScaled = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = CDbar

    local showTween = TweenService:Create(CDbar, TweenInfo.new(0.3), {Position = UDim2.new(0.8, 0, #CDbars * -0.05 + 1.25 , 0)})
    showTween:Play()
    
    updateCDbarPositions()

    local startTime = tick()
    local cooldownEnded = false

    RunService.RenderStepped:Connect(function()
        if not cooldownEnded then
            local elapsedTime = tick() - startTime
            if elapsedTime < Notify.Time then
                timeBar.Size = UDim2.new(1 - (elapsedTime / Notify.Time), 0, 1, 0)
            else
                timeBar.Size = UDim2.new(0, 0, 1, 0)
                cooldownEnded = true

                if Notify.Fill > 0 then
                    local fillTime = startTime + Notify.Time
                    RunService.RenderStepped:Connect(function()
                        local fillElapsedTime = tick() - fillTime
                        if fillElapsedTime < Notify.Fill then
                            timeBar.Size = UDim2.new((fillElapsedTime / Notify.Fill), 0, 1, 0)
                        end
                    end)
                end
            end
        end
    end)

    local function endCooldown()
        if CDbar then
            cooldownEnded = true
            local TargetPos
            for i, v in ipairs(CDbars) do 
			    if i > 1 then
			        TargetPos = UDim2.new(1.5, 0, 0.25 - (i - 1) * 0.05, 0)
			    else
				    TargetPos = UDim2.new(1.5, 0, 0.25, 0)
			    end
			end
			table.remove(CDbars, table.find(CDbars, CDbar))
            local hideTween = TweenService:Create(CDbar, TweenInfo.new(0.3), {Position = TargetPos})
            hideTween:Play()
            hideTween.Completed:Connect(function()
                CDbar:Destroy()
                updateCDbarPositions()
            end)
        end
    end

    delay(Notify.Time + Notify.Fill + 0.1 , function()
        endCooldown()
    end)
    return CDbar
end

-- Slap aura
local SlapAuraSFX = 935843979
local function SlapTarget(Glove, User, Range)
    for i,v in pairs(Players:GetChildren()) do
        if v ~= LocalPlayer and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character and v == User then
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
                if FullCharacter(v, {health= true, height = true, ragdoll = true}) then
	                local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Magnitude <= Range then
	                    GloveHitsFunction[Glove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
	                    if ScytheMode then
	                        CreateClientSound(LocalPlayer.Character.Head, SlapAuraSFX, 4)
							PlaySoundRemote("Mech_Attack_1_C1", 15)
							CreateClientSound(v.Character.HumanoidRootPart, 623904185, 4)
							AddClientVFX("Damaged", v.Character.HumanoidRootPart)
	                    elseif BrawlerMode then
							PlaySoundRemote("Bowling6", 20)
							CreateClientSound(v.Character.HumanoidRootPart, 623904185, 4)
						end
	                    break
					end
                 end
            end
        end
    end
end

local function SlapMob(Glove, Mob, Range)
    if Mob and Mob.Parent then
        if Mob.Name == "Imp" and Mob:FindFirstChild("Body") then
	        GloveHitsFunction[Glove]:FireServer(v.Body, true)
	        if ScytheMode then
	            CreateClientSound(LocalPlayer.Character.Head, SlapAuraSFX, 4)
				CreateClientSound(v.Body, 623904185, 4)
				AddClientVFX("Damaged", v.Body)
				PlaySoundRemote("Mech_Attack_1_C1", 15)
	        elseif BrawlerMode then
				PlaySoundRemote("Bowling6", 20)
				CreateClientSound(v.Body, 623904185, 4)
			end
		elseif Mob.Name:find(CloneName) and Mob:FindFirstChild("HumanoidRootPart") then
			GloveHitsFunction[Glove]:FireServer(Mob.HumanoidRootPart, true)
	        if ScytheMode then
	            CreateClientSound(LocalPlayer.Character.Head, SlapAuraSFX, 4)
				CreateClientSound(Mob.HumanoidRootPart, 623904185, 4)
				AddClientVFX("Damaged", Mob.HumanoidRootPart)
				PlaySoundRemote("Mech_Attack_1_C1", 15)
	        elseif BrawlerMode then
				PlaySoundRemote("Bowling6", 20)
				CreateClientSound(Mob.HumanoidRootPart, 623904185, 4)
			end
		end
    end
end

local function SlapAura(Glove, Range)
    for i,v in pairs(Players:GetChildren()) do
        if v ~= LocalPlayer and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
                if FullCharacter(v, {ragdoll = true, health = true, height = true}) then
                    local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Magnitude <= Range then
                        GloveHitsFunction[Glove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)                        
	                    if ScytheMode then
	                        CreateClientSound(v.Character.HumanoidRootPart, 623904185, 4)
							AddClientVFX("Damaged", v.Character.HumanoidRootPart)
							PlaySoundRemote("Mech_Attack_1_C1", 15)
	                    elseif BrawlerMode then
							PlaySoundRemote("Bowling6", 20)
							CreateClientSound(v.Character.HumanoidRootPart, 623904185, 4)
						end
                    end
                end
            end
        end
    end
end
local function SlapAura2(Glove, Range)
    for i,v in pairs(Players:GetChildren()) do
        if v ~= LocalPlayer and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
                if FullCharacter(v, {ragdoll = true, health = true, height = true}) then
                    local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Magnitude <= Range then
                        GloveHitsFunction[Glove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
	                    if ScytheMode then
	                        CreateClientSound(v.Character.HumanoidRootPart, 623904185, 4)
							AddClientVFX("Damaged", v.Character.HumanoidRootPart)
							PlaySoundRemote("Mech_Attack_1_C1", 15)
	                    elseif BrawlerMode then
							PlaySoundRemote("Bowling6", 20)
							CreateClientSound(v.Character.HumanoidRootPart, 623904185, 4)
						end
                        break 
                    end
                end
            end
        end
    end
end

-- Check Character
local ForbiddenAnimationsId = {
	16102819260, -- parry
	13671935940, -- rob idle 
	13675136513, -- rob transformation 
	17569574003, -- spoonful float
	17332793965, -- sbeve idle
	13552944381, -- Counter taunt 
	17332790610, -- sbeve idle2
	18139201258, -- elgato pet1
	18139141113, -- elgato pet2
}

function FullCharacter(plr, ignore)
    local player = plr or LocalPlayer
    local ignore = ignore or {}
    local ragig = ignore.ragdoll or false
    local healthig = ignore.health or false
    local heightig = ignore.height or false
    local invincig = ignore.invinc or false 
    
    if player.Character then
        if player.Character:FindFirstChild("Head") and 
           player.Character:FindFirstChild("Torso") and 
           player.Character:FindFirstChild("Humanoid") and 
           player.Character:FindFirstChild("HumanoidRootPart") and 
           (healthig or player.Character.Humanoid.Health > 0) then

            if player ~= LocalPlayer then
                local humanoid = player.Character.Humanoid
                local playingAnimations = humanoid:GetPlayingAnimationTracks()
                local isPlayingForbiddenAnimation = false

                for _, track in pairs(playingAnimations) do
                    for _, id in pairs(ForbiddenAnimationsId) do
                        if track.Animation.AnimationId == "rbxassetid://" .. tostring(id) then
                            isPlayingForbiddenAnimation = true
                            break
                        end
                    end
                    if isPlayingForbiddenAnimation then break end
                end
                if isPlayingForbiddenAnimation then
                    return false
                end
                if (invincig or not player.Character.Head:FindFirstChild("UnoReverseCard")) and 
                   not player.Character:FindFirstChild("Stevebody") and 
                   not player.Character:FindFirstChild("rock") and 
                   (invincig or player.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller")) and 
                   (invincig or not player.Character:FindFirstChild("Mirage")) and 
                   not player.Character:FindFirstChild("Sphere") and 
                   not player.Character:FindFirstChild("CarKeysCar") and 
                   (invincig or not player.Character.HumanoidRootPart:FindFirstChild("Digging")) and 
                   (invincig or player.leaderstats.Glove.Value ~= "Spectator") then
                    if player.Character:FindFirstChild("RobTransformed") then
                        if player.Character.RobTransformed.Value ~= false and not invincig then
                            return false
                        end
                    end
                    local rootPart = player.Character.HumanoidRootPart
                    local origin = rootPart.Position
                    local direction = Vector3.new(0, -1, 0)
                    local length = 200
                    
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {player.Character}
                    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                    
                    local raycastResult = workspace:Raycast(origin, direction * length, raycastParams)
                    if heightig or (raycastResult and raycastResult.Instance.Transparency ~= 1) then
                        return true
                    end
                    
                    return false
                end
                return false
            end

            if ragig then
                return true
            elseif not ragig and player.Character:FindFirstChild("Ragdolled") and player.Character.Ragdolled.Value == false then
                return true
            end
        end
    end
    return false
end



-- find players
local function getNearestPlayer(Range)
    local nearestPlayer = nil
    local shortestDistance = Range
    if not FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then return end
    
    local localPosition = LocalPlayer.Character.HumanoidRootPart.Position

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and FullCharacter(player) then
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

-- chat msg
local function swait()
	game:GetService("RunService").Stepped:Wait()
end
function ImmuneDialogue(msg, timr, size)
    if HideClientDialogue or not FullCharacter(LocalPlayer, {health = true, height = true, ragdoll = true})  then return end
    spawn(function()
        msg = msg
        timr = timr or 1
        local MRC_A = BrickColor.new("White")
        local MRC_B = BrickColor.new("Really black")

        local containerPart = Instance.new("Part")
        containerPart.Anchored = true
        containerPart.CanCollide = false
        containerPart.Transparency = 1
        containerPart.Size = Vector3.new(1, 1, 1)
        containerPart.CFrame = LocalPlayer.Character.Head.CFrame * CFrame.new(0,1,0)
        containerPart.Parent = game.Workspace.Terrain

        local namebillboard = Instance.new("BillboardGui")
        namebillboard.Size = UDim2.new(20, 0, 1, 0)
        namebillboard.Name = "NameBillboard"
        namebillboard.StudsOffset = Vector3.new(0, 0, 0) -- Offset ban đầu
        namebillboard.Parent = containerPart

        local textt = Instance.new("TextBox")
        local gs = AddStroke(textt, 1.5, Color3.new(0, 0, 0))
        textt.TextWrapped = true
        textt.BackgroundTransparency = 1
        textt.BackgroundColor3 = Color3.new(1, 1, 1)
        textt.TextSize = size or 18
        textt.TextScaled = true
        textt.Font = Enum.Font.Arcade
        textt.Text = msg or ''
        textt.TextStrokeTransparency = 0
        textt.TextStrokeColor3 = MRC_B.Color
        textt.TextColor = MRC_A
        textt.Size = UDim2.new(1, 0, 1, 0)
        textt.Parent = namebillboard

        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new(
            timr, -- Thời gian
            Enum.EasingStyle.Linear,
            Enum.EasingDirection.InOut
        )

        local properties = {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }
        local prop2 = {
        ["CFrame"] = containerPart.CFrame * CFrame.new(0,1,0)
        }
        
        
        local tween = tweenService:Create(textt, tweenInfo, properties)
        CreateClientSound(LocalPlayer.Character.Head, 927636725, 10)
        tween:Play()
        local tween2 = tweenService:Create(containerPart, tweenInfo, prop2)
        tween2:Play()

        tween.Completed:Wait()
        containerPart:Destroy()
    end)
end


local function TalkDialogue(msg, timr, size)
	if HideClientDialogue or not FullCharacter(LocalPlayer, {health = true, height = true, ragdoll = true}) then return end
    spawn(function()
        msg = "* " .. msg
        timr = timr or 30
        local MRC_A = BrickColor.new("White")
        local MRC_B = BrickColor.new("Really black")
        local namebillboard = Instance.new("BillboardGui")
        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
            LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
        end
        local textt = Instance.new("TextBox")
        namebillboard.Size = UDim2.new(20, 0,1, 0)
        namebillboard.Name = "NameBillboard"
        namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
        namebillboard.Parent = LocalPlayer.Character.Head
        textt.TextWrapped = true
        textt.BackgroundTransparency = 1
        textt.BackgroundColor3 = Color3.new(1, 1, 1)
        textt.TextSize = size or 14
        textt.TextScaled = true
        textt.Font = Enum.Font.Arcade
        textt.Text = msg or ''
        textt.TextStrokeTransparency = 0
        textt.TextStrokeColor3 = MRC_B.Color
        textt.TextColor = MRC_A
        textt.Size = UDim2.new(1, 0, 1, 0)
        textt.Parent = namebillboard
        for i = 1,string.len(msg),1 do
            local newtxt = string.sub(msg,1,i)
            textt.Text = newtxt
            textt.Text = newtxt
            namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
            CreateClientSound(LocalPlayer.Character.Head, 927636725, 10)
            task.wait(.01)
        end
        local RM = math.random(1,2)
        local DR = 0
        task.wait(20)
        for i=1,timr do swait()
            if RM == 1 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            elseif RM == 2 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            end
        end
        namebillboard:Destroy()
    end)
end

local function DreemurDialogue(msg, timr, size)
	if HideClientDialogue or not FullCharacter(LocalPlayer, {health = true, height = true, ragdoll = true})  then return end
    spawn(function()
        timr = 30
        local r = true
        local MRC_A = BrickColor.new("White")
        local MRC_B = BrickColor.new("Really black")
        local namebillboard = Instance.new("BillboardGui")
        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
            LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
        end
        local textt = Instance.new("TextBox")
        namebillboard.Size = UDim2.new(20, 0,3, 0)
        namebillboard.Name = "NameBillboard"
        namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
        namebillboard.Parent = LocalPlayer.Character.Head
        namebillboard.Brightness = 4
        textt.TextWrapped = true
        textt.BackgroundTransparency = 1
        textt.BackgroundColor3 = Color3.new(1, 1, 1)
        textt.TextSize = size or 35
        textt.TextScaled = true
        textt.Font = Enum.Font.Arcade
        textt.Text = msg or ''
        textt.TextStrokeTransparency = 1
        textt.TextStrokeColor3 = MRC_B.Color
        textt.TextColor = MRC_A
        textt.Size = UDim2.new(1, 0, 1, 0)
        textt.Parent = namebillboard
        local ghost_textt1 = textt:Clone()
        ghost_textt1.Parent = namebillboard
        ghost_textt1.ZIndex = -5
        ghost_textt1.TextTransparency = .05
        local ghost_textt2 = textt:Clone()
        ghost_textt2.Parent = namebillboard
        ghost_textt2.ZIndex = -5
        ghost_textt2.TextTransparency = .05
        local ghost_textt3 = textt:Clone()
        ghost_textt3.Parent = namebillboard
        ghost_textt3.ZIndex = -5
        ghost_textt3.TextTransparency = .05
        task.spawn(function()
            while true do
                pcall(function()
                    textt.Position = UDim2.new(0,math.random(-50,50)/10,0,math.random(-50,50)/100)
                    ghost_textt1.Position = UDim2.new(0,math.random(-25,25),0,math.random(-25,25))
                    ghost_textt1.TextTransparency = .7 - textt.TextTransparency
                    ghost_textt1.Text = textt.Text
                    ghost_textt2.Position = UDim2.new(0,math.random(-25,25),0,math.random(-25,25))
                    ghost_textt2.TextTransparency = .7 - textt.TextTransparency
                    ghost_textt2.Text = textt.Text
                    ghost_textt3.Position = UDim2.new(0,math.random(-25,25),0,math.random(-25,25))
                    ghost_textt3.TextTransparency = .7 - textt.TextTransparency
                    ghost_textt3.Text = textt.Text
                    task.wait() end)
                if r == false then break end
            end
        end)
        for i = 1,string.len(msg),1 do
            local newtxt = string.sub(msg,1,i)
            textt.Text = newtxt
            textt.Text = newtxt
            namebillboard.StudsOffset = Vector3.new(0, 5.25, 0.01)
            CreateClientSound(LocalPlayer.Character.Head, 3015952289, 3)
            task.wait(.2) end
        local RM = math.random(1,2)
        local DR = 0
        task.wait(20)
        for i=1,timr do swait()
            if RM == 1 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            elseif RM == 2 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            end
        end
        r = true
        namebillboard:Destroy()
    end)
end
-- effects
local function CreateAttachment(Set)
	if Set.Parent:FindFirstChild(Set.Name) then
		Set.Parent:FindFirstChild(Set.Name):Destroy()
	end
	local attachment = Instance.new("Attachment", Set.Parent)
	attachment.Visible = false
    attachment.Name = Set.Name
	attachment.CFrame = Set.CFrame
	attachment.Rotation = Set.Rotation
	return attachment
end

local function Destroy(...)
    for i, obj in ipairs({...}) do
        if obj and obj.Parent then
            obj:Destroy()
            obj = nil
        end
    end
end

local function CreateParticleEmitter(Set)
   if Set.Parent:FindFirstChild(Set.Name) then
      Set.Parent:FindFirstChild(Set.Name):Destroy()
   end
	local emitter = Instance.new("ParticleEmitter", Set.Parent)
	emitter.Name = Set.Name
	emitter.Texture = "rbxassetid://" .. Set.TextureId
	emitter.Speed = Set.Speed
	emitter.Rate = Set.Rate
	emitter.Lifetime = Set.Lifetime
	emitter.VelocitySpread = 0 
	emitter.Enabled = true
	emitter.Drag = Set.Drag
	emitter.Acceleration = Set.Acceleration
	emitter.Transparency = Set.Transparency
	emitter.VelocityInheritance = Set.VelocityInheritance
	emitter.Color = Set.Color
	if Set.Size then
	    emitter.Size = Set.Size
    end
	emitter.SpreadAngle = Set.SpreadAngle
	emitter.Rotation = Set.Rotation
	emitter.RotSpeed = Set.RotSpeed
	emitter.LockedToPart = true
    emitter.LightEmission = Set.LightEmission
    if Set.UnLockCam == true then
		emitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
	end
	return emitter
end

local function getRandomPositionAroundPlayer(radius)
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = player.Character.HumanoidRootPart
    local angle = math.random() * 2 * math.pi
    local x = radius * math.cos(angle)
    local z = radius * math.sin(angle)
    local newPosition = (rootPart.CFrame * CFrame.new(x, 2, z)).Position
    return newPosition
end

function AddClientShadow(player, duration, moveup, speedMoveUp)
	if HideClientsVFX or not FullCharacter(player, {ragdoll = true, height = true}) then return end
	local speedMoveUp = speedMoveUp or 1
    local character = player.Character
    if not character then return end
    local partsToClone = {"Head", "Torso", "Right Arm", "Left Arm", "Right Leg", "Left Leg"}
    
    local function createShadow(part)
        local shadowPart = part:Clone()
        for _, descendant in ipairs(shadowPart:GetDescendants()) do
            descendant:Destroy()
        end
        shadowPart.Name = "Shadow_" .. part.Name .. "_" .. player.Name
        shadowPart.Material = Enum.Material.SmoothPlastic
        shadowPart.Color = Color3.new(0, 0, 0)
        shadowPart.Transparency = 0.5
        shadowPart.CanCollide = false
        shadowPart.Anchored = true
        shadowPart.Parent = workspace.Terrain
        shadowPart.Position = part.Position
        local targetPosition = part.Position + Vector3.new(0, 10, 0)

        if moveup then
            local distance = (targetPosition - part.Position).Magnitude
            local durationMoveUp = distance / speedMoveUp
            local tweenInfoMove = TweenInfo.new(durationMoveUp, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
            local tweenGoalMove = {Position = targetPosition}
            local tweenMove = TweenService:Create(shadowPart, tweenInfoMove, tweenGoalMove)
            tweenMove:Play()
        end
        local tweenInfoFade = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local tweenGoalFade = {Transparency = 1}
        local tweenFade = TweenService:Create(shadowPart, tweenInfoFade, tweenGoalFade)
        tweenFade:Play()
        tweenFade.Completed:Wait()
        shadowPart:Destroy()
    end
    for _, partName in ipairs(partsToClone) do
        local part = character:FindFirstChild(partName)
        if part then
            coroutine.wrap(createShadow)(part)
        end
    end
end

function AddClientRock(Pos, Distance, Size, lava, despawnTime,params)
	if HideClientsVFX then return end
    local random = Random.new()
    local size
    size = Size or Vector3.new(2, 2, 2)
    local pos = Pos
    despawnTime = despawnTime or 3

    local ray = workspace:Raycast(Pos, (Vector3.new(0, -10, 0)*Distance), params)
    if ray and ray.Instance and not Players:GetPlayerFromCharacter(ray.Instance.Parent) and ray.Instance.Transparency == 0 and ray.Instance.Anchored == true then
        local part = Instance.new("Part")
        
        part.CFrame = CFrame.new(ray.Position, Pos) * CFrame.Angles(math.random(-180,180),math.random(-180,180),math.random(-180,180))
        part.Size = size
        part.Parent = workspace:FindFirstChildOfClass("Terrain")

        part.Material = ray.Instance.Material    
        part.Color = ray.Instance.Color
        part.Anchored = true
        part.CanTouch = false
        part.CanCollide = false
        part.Transparency = 0
        part.Position = part.Position - Vector3.new(0,part.Size.Y,0)
        game.Debris:AddItem(part,despawnTime)
        TweenService:Create(part,TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = part.Position + Vector3.new(0,part.Size.Y,0)}):Play()
        if lava then
            part.Color = Color3.new(1,0,0)
            part.Material = Enum.Material.CrackedLava
        end
        local rand1 = math.random(-180,180)
        local rand2 = math.random(-180,180)
        local rand3 = math.random(-180,180)
        task.spawn(function()
            task.wait(despawnTime-2.5)
            TweenService:Create(part,TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),{Position = part.Position + Vector3.new(0,-part.Size.Y, 0),Orientation = part.Orientation + Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))}):Play()
        end)
    end        
end

function RockRayTP(studs)
    if HideClientsVFX or not FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then return end
    local humanoidRootPart = LocalPlayer.Character.HumanoidRootPart
    humanoidRootPart.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * studs
    for i = 1, studs - 3 do
        coroutine.wrap(function()
            local ppos = humanoidRootPart.Position - humanoidRootPart.CFrame.LookVector * i 
            AddClientRock(ppos + Vector3.new(0, 5, 0), 1, Vector3.new(2, 2, 2), false, 3)
        end)()
    end
end

function AddClientVFX(type, parent)
	if HideClientsVFX or not FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then return end
	local parent = parent or game.Players.LocalPlayer.Character.HumanoidRootPart
	if type == "RapidBlink" then
		local emitter = Instance.new("ParticleEmitter")		
		emitter.Brightness = 25
		emitter.Parent = LocalPlayer.Character.HumanoidRootPart
		emitter.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.new(0.98, 0, 0.02)), ColorSequenceKeypoint.new(1, Color3.new(0.98, 0, 0.02))}
		emitter.Drag = 2.8
		emitter.EmissionDirection = Enum.NormalId.Front
		emitter.FlipbookFramerate = NumberRange.new(1.4, 1.4)
		emitter.LightEmission = -5
		emitter.LightInfluence = 0.1
		emitter.Lifetime = NumberRange.new(0.14, 0.21)
		emitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		emitter.Rate = 0
		emitter.Rotation = NumberRange.new(-360, 360)
		emitter.Size = NumberSequence.new{NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.1, 2.39, 0), NumberSequenceKeypoint.new(0.2, 4, 0), NumberSequenceKeypoint.new(0.3, 4.98, 0), NumberSequenceKeypoint.new(0.4, 5.64, 0), NumberSequenceKeypoint.new(0.5, 6.11, 0), NumberSequenceKeypoint.new(0.6, 6.47, 0), NumberSequenceKeypoint.new(0.7, 6.74, 0), NumberSequenceKeypoint.new(0.8, 6.97, 0), NumberSequenceKeypoint.new(0.9, 7.14, 0), NumberSequenceKeypoint.new(1, 7.29, 0)}
		emitter.Speed = NumberRange.new(0.02, 0.02)
		emitter.SpreadAngle = Vector2.new(360, -360)
		emitter.Texture = "rbxassetid://14579645898"
		emitter.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.28, 0.66, 0.037097398191690445), NumberSequenceKeypoint.new(0.49, 0.87, 0.026792600750923157), NumberSequenceKeypoint.new(1, 1, 0)}
		emitter.TimeScale = 0.7
		emitter.ZOffset = 0.48
	    emitter:Emit(10)
		AddClientVFX("EquipScythe")
	    Debris:AddItem(emitter, 3)
	elseif type=="ScytheLMB" or type=="ScytheLMB2" then
		local Attachment = Instance.new("Attachment")
		Attachment.Parent = LocalPlayer.Character.HumanoidRootPart
		Attachment.Name = "VFXAttachment"
		Attachment.Rotation = Vector3.new(180,0,0)
        local Emitter = Instance.new("ParticleEmitter")
        Emitter.Acceleration = Vector3.new(0, 0, 0)
        Emitter.Brightness = 10
        Emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)), ColorSequenceKeypoint.new(1, Color3.new(1,0,0))})
        Emitter.Drag = 0
        Emitter.EmissionDirection = Enum.NormalId.Top
        Emitter.FlipbookFramerate = NumberRange.new(71.88479614257812, 71.88479614257812)
        Emitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
        Emitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
        Emitter.LightEmission = 0
        Emitter.LightInfluence = 0
        Emitter.Lifetime = NumberRange.new(0.15000000596046448, 0.4000000059604645)
        Emitter.LockedToPart = true
        Emitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
        Emitter.Rate = 0
        Emitter.Rotation = NumberRange.new(-160, -160)
        Emitter.RotSpeed = NumberRange.new(-70, -70)
        Emitter.Shape = Enum.ParticleEmitterShape.Box
        Emitter.ShapePartial = 1
        Emitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
        Emitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
        Emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 10, 0), NumberSequenceKeypoint.new(1, 10, 0)})
        Emitter.Speed = NumberRange.new(0.0006797999958507717, 0.0006797999958507717)
        Emitter.SpreadAngle = Vector2.new(0, 0)
        Emitter.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 0, 0)})
        Emitter.Texture = "rbxassetid://13805841956"
        Emitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
        Emitter.VelocityInheritance = 0
        Emitter.WindAffectsDrag = false
        Emitter.TimeScale = 1
        Emitter.ZOffset = 4
        Emitter.Enabled = true
		Emitter.Parent = Attachment
		if type=="ScytheLMB2" then
			Attachment.Rotation = Vector3.new(math.rad(-180),0,0)
			Emitter.Rotation = NumberRange.new(math.rad(90), math.rad(90))
		end
		Emitter:Emit(5)
        Debris:AddItem(Attachment, 2)
    elseif type == "Boost" then
	    local Emitter = Instance.new("ParticleEmitter")
		Emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(0.48, Color3.new(1,0,0)), ColorSequenceKeypoint.new(1, Color3.new(1,1,1))})
		Emitter.LightEmission = 1
		Emitter.Lifetime = NumberRange.new(0.3, 0.4)
		Emitter.LockedToPart = false
		Emitter.Rate = 0
		Emitter.Rotation = NumberRange.new(-180, 180)
		Emitter.RotSpeed = NumberRange.new(22.5, 22.5)
		Emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 9.18, 0), NumberSequenceKeypoint.new(1, 4.59, 0)})
		Emitter.Speed = NumberRange.new(0, 0)
		Emitter.Texture = "rbxassetid://867619398"
		Emitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2, 0), NumberSequenceKeypoint.new(1, 1, 0)})
		Emitter.ZOffset = 4
		Emitter.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		Emitter:Emit(1)
		Debris:AddItem(emitter, 1.5)
	elseif type == "TP" then
		local Emitter = Instance.new("ParticleEmitter")
		Emitter.Acceleration = Vector3.new(0, 0, 0)
		Emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0.45,0)), ColorSequenceKeypoint.new(1, Color3.new(1,0,0))})
		Emitter.Drag = 9
		Emitter.LightEmission = 1
		Emitter.Lifetime = NumberRange.new(0.4, 0.8)
		Emitter.Rate = 0
		Emitter.Rotation = NumberRange.new(-180, 180)
		Emitter.RotSpeed = NumberRange.new(500, 500)
		Emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8, 0), NumberSequenceKeypoint.new(1, 1, 0)})
		Emitter.Speed = NumberRange.new(22.96, 38.27)
		Emitter.SpreadAngle = Vector2.new(90, 90)
		Emitter.Texture = "rbxassetid://1053546634"
		Emitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.6, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
		Emitter.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		Emitter:Emit(5)
		Debris:AddItem(Emitter, 3)
	elseif type == "EquipScythe" then
		local Emitter = Instance.new("ParticleEmitter")
		Emitter.Brightness = 25
		Emitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.98,0,0.02)), ColorSequenceKeypoint.new(1, Color3.new(0.98,0,0.02))})
		Emitter.Drag = 2.8
		Emitter.FlipbookFramerate = NumberRange.new(1.4, 1.4)
		Emitter.LightEmission = -5
		Emitter.LightInfluence = 0.1
		Emitter.Lifetime = NumberRange.new(0.14, 0.29)
		Emitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		Emitter.Rate = 0
		Emitter.Rotation = NumberRange.new(-360, 360)
		Emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.08, 5.81, 1.5062634944915771), NumberSequenceKeypoint.new(0.26, 10.33, 1.6378309726715088), NumberSequenceKeypoint.new(1, 18.45, 2.1518073081970215)})
		Emitter.Speed = NumberRange.new(0.04, 0.04)
		Emitter.SpreadAngle = Vector2.new(16, 16)
		Emitter.Texture = "rbxassetid://14292325666"
		Emitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.28, 0.66, 0.037097398191690445), NumberSequenceKeypoint.new(0.49, 0.87, 0.026792600750923157), NumberSequenceKeypoint.new(1, 1, 0)})
		Emitter.TimeScale = 0.7
		Emitter.ZOffset = 0.48
		Emitter.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		Emitter:Emit(1)
		Debris:AddItem(emitter, 1)
	elseif type == "Damaged" then
		local ParticleEmitter_0 = Instance.new("ParticleEmitter")
		ParticleEmitter_0.Brightness = 5
		ParticleEmitter_0.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0.32,0)), ColorSequenceKeypoint.new(0.53, Color3.new(0.28,0.09,0)), ColorSequenceKeypoint.new(1, Color3.new(0,0,0))})
		ParticleEmitter_0.EmissionDirection = Enum.NormalId.Left
		ParticleEmitter_0.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter_0.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_0.Lifetime = NumberRange.new(0.3, 0.5)
		ParticleEmitter_0.LockedToPart = true
		ParticleEmitter_0.Orientation = Enum.ParticleOrientation.VelocityParallel
		ParticleEmitter_0.Rate = 0
		ParticleEmitter_0.Rotation = NumberRange.new(90, 90)
		ParticleEmitter_0.ShapeInOut = Enum.ParticleEmitterShapeInOut.InAndOut
		ParticleEmitter_0.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0.629145622253418), NumberSequenceKeypoint.new(0.1, 0.32, 0.629145622253418), NumberSequenceKeypoint.new(0.2, 0.48, 0.629145622253418), NumberSequenceKeypoint.new(0.3, 0.55, 0.629145622253418), NumberSequenceKeypoint.new(0.4, 0.59, 0.629145622253418), NumberSequenceKeypoint.new(0.5, 0.61, 0.629145622253418), NumberSequenceKeypoint.new(0.6, 0.62, 0.629145622253418), NumberSequenceKeypoint.new(0.7, 0.63, 0.629145622253418), NumberSequenceKeypoint.new(0.8, 0.63, 0.629145622253418), NumberSequenceKeypoint.new(0.9, 0.63, 0.629145622253418), NumberSequenceKeypoint.new(1, 0.63, 0.629145622253418)})
		ParticleEmitter_0.Speed = NumberRange.new(0, 10)
		ParticleEmitter_0.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter_0.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(1, 1.39, 0)})
		ParticleEmitter_0.Texture = "rbxassetid://13973332586"
		ParticleEmitter_0.Parent=parent
		
		local ParticleEmitter_1 = Instance.new("ParticleEmitter")
		ParticleEmitter_1.Brightness = 5
		ParticleEmitter_1.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0.32,0)), ColorSequenceKeypoint.new(0.53, Color3.new(0.28,0.09,0)), ColorSequenceKeypoint.new(1, Color3.new(0,0,0))})
		ParticleEmitter_1.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_1.Lifetime = NumberRange.new(0.4, 0.7)
		ParticleEmitter_1.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		ParticleEmitter_1.Rate = 0
		ParticleEmitter_1.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter_1.RotSpeed = NumberRange.new(-100, 400)
		ParticleEmitter_1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.03, 2.32, 1.0077149868011475), NumberSequenceKeypoint.new(0.12, 2.84, 1.0077149868011475), NumberSequenceKeypoint.new(0.25, 3.01, 1.0077149868011475), NumberSequenceKeypoint.new(0.37, 3.12, 1.0077149868011475), NumberSequenceKeypoint.new(0.5, 3.21, 1.0077149868011475), NumberSequenceKeypoint.new(0.6, 3.32, 1.0077149868011475), NumberSequenceKeypoint.new(0.7, 3.39, 1.0077149868011475), NumberSequenceKeypoint.new(0.8, 3.44, 1.0077149868011475), NumberSequenceKeypoint.new(0.9, 3.48, 1.0077149868011475), NumberSequenceKeypoint.new(1, 3.53, 1.0077149868011475)})
		ParticleEmitter_1.Speed = NumberRange.new(0, 0)
		ParticleEmitter_1.Texture = "rbxassetid://10316078099"
		ParticleEmitter_1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9, 0), NumberSequenceKeypoint.new(1, 1, 0)})
		ParticleEmitter_1.Parent=parent
		
		local ParticleEmitter_2 = Instance.new("ParticleEmitter")
		ParticleEmitter_2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.16,0.06,0)), ColorSequenceKeypoint.new(1, Color3.new(0.16,0.04,0))})
		ParticleEmitter_2.EmissionDirection = Enum.NormalId.Right
		ParticleEmitter_2.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter_2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_2.Lifetime = NumberRange.new(0.4, 0.75)
		ParticleEmitter_2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		ParticleEmitter_2.Rate = 0
		ParticleEmitter_2.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter_2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0.16341237723827362), NumberSequenceKeypoint.new(0.2, 5.2, 0.8688017129898071), NumberSequenceKeypoint.new(1, 6.11, 0.8282042741775513)})
		ParticleEmitter_2.Speed = NumberRange.new(0, 0)
		ParticleEmitter_2.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter_2.Texture = "rbxassetid://16860307403"
		ParticleEmitter_2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8, 0), NumberSequenceKeypoint.new(1, 0.87, 0)})
		ParticleEmitter_2.Parent=parent
		
		local ParticleEmitter_3 = Instance.new("ParticleEmitter")
		ParticleEmitter_3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.16,0.06,0)), ColorSequenceKeypoint.new(1, Color3.new(0.16,0.04,0))})
		ParticleEmitter_3.Drag = 10
		ParticleEmitter_3.Rate = 0
		ParticleEmitter_3.EmissionDirection = Enum.NormalId.Back
		ParticleEmitter_3.FlipbookFramerate = NumberRange.new(32, 32)
		ParticleEmitter_3.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter_3.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_3.Lifetime = NumberRange.new(0.3, 1.3)
		ParticleEmitter_3.Rotation = NumberRange.new(0, 360)
		ParticleEmitter_3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.06, 0), NumberSequenceKeypoint.new(1, 2.06, 0)})
		ParticleEmitter_3.Speed = NumberRange.new(17.1, 34.2)
		ParticleEmitter_3.SpreadAngle = Vector2.new(0, 360)
		ParticleEmitter_3.Texture = "rbxassetid://11871320339"
		ParticleEmitter_3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8, 0), NumberSequenceKeypoint.new(1, 0.87, 0)})
		ParticleEmitter_3.ZOffset = 0.56
		ParticleEmitter_3.Parent=parent
		
		local ParticleEmitter_4 = Instance.new("ParticleEmitter")
		ParticleEmitter_4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.16,0.06,0)), ColorSequenceKeypoint.new(1, Color3.new(0.16,0.04,0))})
		ParticleEmitter_4.Lifetime = NumberRange.new(0.15, 0.15)
		ParticleEmitter_4.Rate = 0
		ParticleEmitter_4.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter_4.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.52, 4.89, 0), NumberSequenceKeypoint.new(1, 0, 0)})
		ParticleEmitter_4.Speed = NumberRange.new(0, 0)
		ParticleEmitter_4.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter_4.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 0, 1.3125)})
		ParticleEmitter_4.Texture = "rbxassetid://12118255430"
		ParticleEmitter_4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8, 0), NumberSequenceKeypoint.new(1, 0.87, 0)})
		ParticleEmitter_4.ZOffset = 0.13
		ParticleEmitter_4.Parent=parent
		
		local ParticleEmitter_5 = Instance.new("ParticleEmitter")
		ParticleEmitter_5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.16,0.06,0)), ColorSequenceKeypoint.new(1, Color3.new(0.16,0.04,0))})
		ParticleEmitter_5.EmissionDirection = Enum.NormalId.Right
		ParticleEmitter_5.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter_5.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_5.Lifetime = NumberRange.new(0.4, 0.75)
		ParticleEmitter_5.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		ParticleEmitter_5.Rate = 0
		ParticleEmitter_5.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter_5.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0.16341237723827362), NumberSequenceKeypoint.new(0.2, 5.2, 0.8688017129898071), NumberSequenceKeypoint.new(1, 6.11, 0.8282042741775513)})
		ParticleEmitter_5.Speed = NumberRange.new(0, 0)
		ParticleEmitter_5.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter_5.Texture = "rbxassetid://16860307403"
		ParticleEmitter_5.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8, 0), NumberSequenceKeypoint.new(1, 0.87, 0)})
		ParticleEmitter_5.Parent=parent
		
		local ParticleEmitter_7 = Instance.new("ParticleEmitter")
		ParticleEmitter_7.Brightness = 5
		ParticleEmitter_7.Rate = 0
		ParticleEmitter_7.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0.32,0)), ColorSequenceKeypoint.new(0.53, Color3.new(0.28,0.09,0)), ColorSequenceKeypoint.new(1, Color3.new(0,0,0))})
		ParticleEmitter_7.FlipbookFramerate = NumberRange.new(30, 30)
		ParticleEmitter_7.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2
		ParticleEmitter_7.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_7.Lifetime = NumberRange.new(0.22, 0.99)
		ParticleEmitter_7.Rotation = NumberRange.new(-360, 360)
		ParticleEmitter_7.RotSpeed = NumberRange.new(360, 360)
		ParticleEmitter_7.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, -8.19, 4.095999717712402), NumberSequenceKeypoint.new(0.1, -0.91, 4.095999717712402), NumberSequenceKeypoint.new(0.2, 1.51, 4.095999717712402), NumberSequenceKeypoint.new(0.3, 2.62, 4.095999717712402), NumberSequenceKeypoint.new(0.4, 3.23, 4.095999717712402), NumberSequenceKeypoint.new(0.5, 3.6, 4.095999717712402), NumberSequenceKeypoint.new(0.6, 3.83, 4.095999717712402), NumberSequenceKeypoint.new(0.7, 3.97, 4.095999717712402), NumberSequenceKeypoint.new(0.8, 4.05, 4.095999717712402), NumberSequenceKeypoint.new(0.9, 4.08, 4.095999717712402), NumberSequenceKeypoint.new(1, 4.1, 4.095999717712402)})
		ParticleEmitter_7.Speed = NumberRange.new(0, 0)
		ParticleEmitter_7.SpreadAngle = Vector2.new(200, 200)
		ParticleEmitter_7.Texture = "rbxassetid://15124806555"
		ParticleEmitter_7.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.01, 0, 0), NumberSequenceKeypoint.new(0.1, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
		ParticleEmitter_7.Parent=parent
		
		local ParticleEmitter_8 = Instance.new("ParticleEmitter")
		ParticleEmitter_8.Brightness = 5
		ParticleEmitter_8.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0.32,0)), ColorSequenceKeypoint.new(0.53, Color3.new(0.28,0.09,0)), ColorSequenceKeypoint.new(1, Color3.new(0,0,0))})
		ParticleEmitter_8.Drag = 11
		ParticleEmitter_8.Lifetime = NumberRange.new(0.3, 0.5)
		ParticleEmitter_8.Orientation = Enum.ParticleOrientation.VelocityParallel
		ParticleEmitter_8.Rate = 0
		ParticleEmitter_8.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.1, 0.74, 0), NumberSequenceKeypoint.new(1, 0, 0)})
		ParticleEmitter_8.Speed = NumberRange.new(26.91, 53.83)
		ParticleEmitter_8.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter_8.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -1.5, 0), NumberSequenceKeypoint.new(1, -1.5, 0)})
		ParticleEmitter_8.Texture = "rbxassetid://14438793270"
		ParticleEmitter_8.Parent=parent
		
		local ParticleEmitter_9 = Instance.new("ParticleEmitter")
		ParticleEmitter_9.Brightness = 5
		ParticleEmitter_9.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0.32,0)), ColorSequenceKeypoint.new(0.53, Color3.new(0.28,0.09,0)), ColorSequenceKeypoint.new(1, Color3.new(0,0,0))})
		ParticleEmitter_9.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		ParticleEmitter_9.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		ParticleEmitter_9.Lifetime = NumberRange.new(0.5, 0.7)
		ParticleEmitter_9.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		ParticleEmitter_9.Rate = 0
		ParticleEmitter_9.Rotation = NumberRange.new(0, 360)
		ParticleEmitter_9.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.1, 3.42, 0.9507780075073242), NumberSequenceKeypoint.new(0.2, 3.94, 0.8171340823173523), NumberSequenceKeypoint.new(0.3, 4.17, 0.5811212062835693), NumberSequenceKeypoint.new(0.4, 4.31, 0.4461458623409271), NumberSequenceKeypoint.new(0.5, 4.4, 0.354714572429657), NumberSequenceKeypoint.new(0.6, 4.47, 0.2820219099521637), NumberSequenceKeypoint.new(0.7, 4.54, 0.2156599462032318), NumberSequenceKeypoint.new(0.8, 4.61, 0.1488618701696396), NumberSequenceKeypoint.new(0.9, 4.68, 0.07774095237255096), NumberSequenceKeypoint.new(1, 4.75, 0)})
		ParticleEmitter_9.Speed = NumberRange.new(0.11, 0.11)
		ParticleEmitter_9.SpreadAngle = Vector2.new(360, 360)
		ParticleEmitter_9.Texture = "rbxassetid://16879953929"
		ParticleEmitter_9.Parent=parent
		
		ParticleEmitter_0:Emit(80)
		Debris:AddItem(ParticleEmitter_0, 3)
		ParticleEmitter_1:Emit(90)
		Debris:AddItem(ParticleEmitter_1, 3)
		ParticleEmitter_2:Emit(0)
		Debris:AddItem(ParticleEmitter_2, 3)
		ParticleEmitter_3:Emit(40)
		Debris:AddItem(ParticleEmitter_3, 3)
		ParticleEmitter_4:Emit(80)
		Debris:AddItem(ParticleEmitter_4, 3)
		ParticleEmitter_5:Emit(80)
		Debris:AddItem(ParticleEmitter_5, 3)
		ParticleEmitter_7:Emit(50)
		Debris:AddItem(ParticleEmitter_7, 3)
		ParticleEmitter_8:Emit(60)
		Debris:AddItem(ParticleEmitter_8, 3)
		ParticleEmitter_9:Emit(10)
		Debris:AddItem(ParticleEmitter_9, 3)
	elseif type == "FlameAura" then
	    local ParticleEmitter_2 = Instance.new("ParticleEmitter")
	    ParticleEmitter_2.Brightness = 0
	    ParticleEmitter_2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_2.FlipbookFramerate = NumberRange.new(25, 25)
	    ParticleEmitter_2.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
	    ParticleEmitter_2.Lifetime = NumberRange.new(1, 1)
	    ParticleEmitter_2.LockedToPart = true
	    ParticleEmitter_2.Rate = 25
	    ParticleEmitter_2.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.65, 0.6499999761581421), NumberSequenceKeypoint.new(1, 0.65, 0.6499999761581421)})
	    ParticleEmitter_2.Speed = NumberRange.new(0, 0)
	    ParticleEmitter_2.Texture = "rbxassetid://18802780455"
	    ParticleEmitter_2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.12, 0.35, 0), NumberSequenceKeypoint.new(0.5, 0, 0), NumberSequenceKeypoint.new(0.87, 0.25, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_2.ZOffset = 0.3
	    ParticleEmitter_2.Parent = parent
	    
	    local ParticleEmitter_3 = Instance.new("ParticleEmitter")
	    ParticleEmitter_3.Brightness = 25
	    ParticleEmitter_3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_3.FlipbookFramerate = NumberRange.new(25, 25)
	    ParticleEmitter_3.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
	    ParticleEmitter_3.LightEmission = -4
	    ParticleEmitter_3.Lifetime = NumberRange.new(1, 1)
	    ParticleEmitter_3.LockedToPart = true
	    ParticleEmitter_3.Rate = 25
	    ParticleEmitter_3.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.65, 0.6499999761581421), NumberSequenceKeypoint.new(1, 0.65, 0.6499999761581421)})
	    ParticleEmitter_3.Speed = NumberRange.new(0, 0)
	    ParticleEmitter_3.Texture = "rbxassetid://18802780455"
	    ParticleEmitter_3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.12, 0.35, 0), NumberSequenceKeypoint.new(0.5, 0, 0), NumberSequenceKeypoint.new(0.87, 0.25, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_3.ZOffset = -1
	    ParticleEmitter_3.Parent = parent
	    
	    local ParticleEmitter_4 = Instance.new("ParticleEmitter")
	    ParticleEmitter_4.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_4.Drag = 8
	    ParticleEmitter_4.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
	    ParticleEmitter_4.Lifetime = NumberRange.new(0.35, 0.75)
	    ParticleEmitter_4.LockedToPart = true
	    ParticleEmitter_4.Rate = 25
	    ParticleEmitter_4.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_4.RotSpeed = NumberRange.new(-1000, 1000)
	    ParticleEmitter_4.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.17, 0.07, 0.07061808556318283), NumberSequenceKeypoint.new(0.33, 0.1, 0.10000000149011612), NumberSequenceKeypoint.new(0.5, 0.12, 0.10000000149011612), NumberSequenceKeypoint.new(0.67, 0.14, 0.10000000149011612), NumberSequenceKeypoint.new(0.83, 0.15, 0.10000000149011612), NumberSequenceKeypoint.new(1, 0, 0)})
	    ParticleEmitter_4.Speed = NumberRange.new(5, 15)
	    ParticleEmitter_4.SpreadAngle = Vector2.new(360, -360)
	    ParticleEmitter_4.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.18, 0), NumberSequenceKeypoint.new(0.14, 0.15, 0), NumberSequenceKeypoint.new(1, 0, 0)})
	    ParticleEmitter_4.Texture = "rbxassetid://11720115906"
	    ParticleEmitter_4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.08, 0.3, 0), NumberSequenceKeypoint.new(0.5, 0, 0), NumberSequenceKeypoint.new(0.85, 0.27, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_4.ZOffset = 0.3
	    ParticleEmitter_4.Parent = parent
	    
	    local ParticleEmitter_5 = Instance.new("ParticleEmitter")
	    ParticleEmitter_5.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_5.Drag = 8
	    ParticleEmitter_5.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
	    ParticleEmitter_5.Lifetime = NumberRange.new(0.35, 0.75)
	    ParticleEmitter_5.LockedToPart = true
	    ParticleEmitter_5.Rate = 25
	    ParticleEmitter_5.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_5.RotSpeed = NumberRange.new(-1000, 1000)
	    ParticleEmitter_5.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.17, 0.07, 0.07061808556318283), NumberSequenceKeypoint.new(0.33, 0.1, 0.10000000149011612), NumberSequenceKeypoint.new(0.5, 0.12, 0.10000000149011612), NumberSequenceKeypoint.new(0.67, 0.14, 0.10000000149011612), NumberSequenceKeypoint.new(0.83, 0.15, 0.10000000149011612), NumberSequenceKeypoint.new(1, 0, 0)})
	    ParticleEmitter_5.Speed = NumberRange.new(5, 15)
	    ParticleEmitter_5.SpreadAngle = Vector2.new(360, -360)
	    ParticleEmitter_5.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.18, 0), NumberSequenceKeypoint.new(0.14, 0.15, 0), NumberSequenceKeypoint.new(1, 0, 0)})
	    ParticleEmitter_5.Texture = "rbxassetid://11720115906"
	    ParticleEmitter_5.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.08, 0.3, 0), NumberSequenceKeypoint.new(0.5, 0, 0), NumberSequenceKeypoint.new(0.85, 0.27, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_5.ZOffset = 0.3
	    ParticleEmitter_5.Parent = parent
	    
	    local ParticleEmitter_6 = Instance.new("ParticleEmitter")
	    ParticleEmitter_6.Brightness = 25
	    ParticleEmitter_6.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_6.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
	    ParticleEmitter_6.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
	    ParticleEmitter_6.LightEmission = -5
	    ParticleEmitter_6.Lifetime = NumberRange.new(0.55, 0.55)
	    ParticleEmitter_6.LockedToPart = true
	    ParticleEmitter_6.Rate = 35
	    ParticleEmitter_6.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_6.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 2.38, 0)})
	    ParticleEmitter_6.Speed = NumberRange.new(0, 0)
	    ParticleEmitter_6.SpreadAngle = Vector2.new(360, -360)
	    ParticleEmitter_6.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0.5249998569488525), NumberSequenceKeypoint.new(1, 0, 0.4875004291534424)})
	    ParticleEmitter_6.Texture = "rbxassetid://13469932784"
	    ParticleEmitter_6.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.07, 0.23, 0), NumberSequenceKeypoint.new(0.49, 0, 0), NumberSequenceKeypoint.new(0.86, 0.12, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_6.ZOffset = -1
	    ParticleEmitter_6.Parent = parent
	    
	    local ParticleEmitter_8 = Instance.new("ParticleEmitter")
	    ParticleEmitter_8.Brightness = 0
	    ParticleEmitter_8.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_8.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
	    ParticleEmitter_8.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
	    ParticleEmitter_8.Lifetime = NumberRange.new(0.55, 0.55)
	    ParticleEmitter_8.LockedToPart = true
	    ParticleEmitter_8.Rate = 35
	    ParticleEmitter_8.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_8.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, 2.38, 0)})
	    ParticleEmitter_8.Speed = NumberRange.new(0, 0)
	    ParticleEmitter_8.SpreadAngle = Vector2.new(360, -360)
	    ParticleEmitter_8.Texture = "rbxassetid://17551589693"
	    ParticleEmitter_8.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.07, 0.23, 0), NumberSequenceKeypoint.new(0.49, 0, 0), NumberSequenceKeypoint.new(0.86, 0.12, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_8.ZOffset = 0.2
	    ParticleEmitter_8.Parent = parent
	    
	    local ParticleEmitter_9 = Instance.new("ParticleEmitter")
	    ParticleEmitter_9.Brightness = 5
	    ParticleEmitter_9.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, AuraColor1), ColorSequenceKeypoint.new(1, AuraColor2)})
	    ParticleEmitter_9.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
	    ParticleEmitter_9.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
	    ParticleEmitter_9.LightEmission = -1
	    ParticleEmitter_9.Lifetime = NumberRange.new(0.25, 0.55)
	    ParticleEmitter_9.LockedToPart = true
	    ParticleEmitter_9.Rate = 15
	    ParticleEmitter_9.Rotation = NumberRange.new(-360, 360)
	    ParticleEmitter_9.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6, 0), NumberSequenceKeypoint.new(1, 0.6, 0)})
	    ParticleEmitter_9.Speed = NumberRange.new(0, 0)
	    ParticleEmitter_9.SpreadAngle = Vector2.new(360, -360)
	    ParticleEmitter_9.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0.33750009536743164), NumberSequenceKeypoint.new(1, 0, 0.5249998569488525)})
	    ParticleEmitter_9.Texture = "rbxassetid://13803462600"
	    ParticleEmitter_9.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.49, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
	    ParticleEmitter_9.ZOffset = 0.3
	    ParticleEmitter_9.Parent = parent
	end
end

local function Horn()
	pcall(function()
	    if GloveStands.Killstreak.CultAuraAttachments:FindFirstChild("Horns") then
		    Character = LocalPlayer.Character
		    if Character.Head.FaceCenterAttachment:FindFirstChild("Horn1") and Character.Head.FaceCenterAttachment:FindFirstChild("Horn2") then
			    Character.Head.FaceCenterAttachment.Horn2:Destroy()
			    Character.Head.FaceCenterAttachment.Horn2:Destroy()
			end
	        local CHorn1 = lobby.GloveStands.Killstreak.CultAuraAttachments:FindFirstChild("Horns"):Clone()
	        local CHorn2 = lobby.GloveStands.Killstreak.CultAuraAttachments:FindFirstChild("Horns"):Clone()
	        CHorn1.Name = "Horn1"
	        CHorn2.Name = "Horn2"
	        CHorn2.Parent = Character.Head.FaceCenterAttachment 
	        CHorn1.Parent = Character.Head.FaceCenterAttachment 
	        CHorn2.Acceleration = Vector3.new(2, 2, -1)
	        CHorn1.Acceleration = Vector3.new(-2, 2, -1)
	        CHorn1.EmissionDirection = Enum.NormalId.Right
	        CHorn2.EmissionDirection = Enum.NormalId.Left
	        CHorn1.Size = NumberSequence.new(.4, 0)
	        CHorn2.Size = NumberSequence.new(.4, 0)
	        CHorn1.Lifetime = NumberRange.new(.5)
	        CHorn2.Lifetime = NumberRange.new(.5)
	        CHorn1.Rate = 200
	        CHorn2.Rate = 200
	    end
    end)
end

function AddClientTrail(type, time, time2)
	if HideClientsVFX or not FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then return end
	local time2 = time2 or time
	local root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	if type == 1 then
		local att0 = Instance.new("Attachment", root)
		local att1 = Instance.new("Attachment", root)
		att0.Position = Vector3.new(0, root.Size.Y/1.5, 0)
		att1.Position = Vector3.new(0, -root.Size.Y/1.5, 0)
		
		local trail = Instance.new("Trail")
		trail.Parent = root
		trail.Attachment0 = att0
		trail.Attachment1 = att1
		trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1,1)})
		trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))})
		trail.LightEmission = 1
		trail.Brightness = 2
		trail.Lifetime = time
		trail.FaceCamera = true
		task.wait(.1)
		Debris:AddItem(att0, time2)
		Debris:AddItem(att1, time2)
		Debris:AddItem(trail, time2)
	elseif type == 2 then
		local att0 = Instance.new("Attachment", root)
		local att1 = Instance.new("Attachment", root)
		att0.Position = Vector3.new(0, root.Size.Y/1.5, 0)
		att1.Position = Vector3.new(0, -root.Size.Y/1.5, 0)
		
		local trail = Instance.new("Trail")
		trail.Parent = root
		trail.Attachment0 = att0
		trail.Attachment1 = att1
		trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1,1)})
		trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))})
		trail.LightEmission = 1
		trail.Brightness = 2
		trail.Lifetime = time
		trail.FaceCamera = true
		return att0, att1, trail
	end
end

-- parts
local function AntiBarriers(Value)
	pcall(function()
		local Cube = game:GetService("Workspace").Arena.CubeOfDeathArea:FindFirstChild("the cube of death(i heard it kills)")
		if Cube then
			Cube.CanTouch = not Value
		end
		for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
	        if v.ClassName == "Part" and v.Name == "BLOCK" then
	            v.CanTouch = not Value
	        end
	    end
		workspace.DEATHBARRIER.CanTouch = not Value
		workspace.DEATHBARRIER2.CanTouch = not Value
		workspace.dedBarrier.CanTouch = not Value
		workspace.ArenaBarrier.CanTouch = not Value
		workspace.AntiDefaultArena.CanTouch = not Value
	end)
end

-- camera
local function UpdatePos()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local humanoidRootPart = LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart
        if humanoidRootPart then
            SLHRPPos = humanoidRootPart.Position
        end
    end
end

local function UpdateAutoRotate(BOOL)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").AutoRotate = BOOL
    end
end

local function GetUpdatedCameraCFrame()
    if Camera then
	    return CFrame.new(SLHRPPos,Vector3.new(Camera.CFrame.LookVector.X * 9e9,SLHRPPos.Y,Camera.CFrame.LookVector.Z * 9e9))
	end
end

local function EnableShiftlock()
    UpdatePos()
    UpdateAutoRotate(false)
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RootPart
    if humanoidRootPart then
        humanoidRootPart.CFrame = GetUpdatedCameraCFrame()
    end
    if Camera then
        Camera.CFrame = Camera.CFrame * CFrame.new(1.7,0,0)
    end
end


local function DisableShiftlock()
    UpdatePos()
    UpdateAutoRotate(true)
    pcall(function()
        if SLActive then 
            SLActive:Disconnect() 
            SLActive = nil 
        end 
    end)
    if Camera then
        Camera.CFrame = Camera.CFrame * CFrame.new(-1.7,0,0)
    end
end


local function ShiftLock()
    if not SLActive then
        SLActive = RunService.RenderStepped:Connect(function()
            EnableShiftlock()
        end)
    else
        DisableShiftlock()
    end
end

local function FOVTween(StartFov, EndFov, Time)
	local TweenService = game:GetService("TweenService")
	task.spawn(function()
	    local Info = TweenInfo.new(Time, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	    local Properties = {FieldOfView = EndFov}
	    local tween = TweenService:Create(Camera, Info, Properties)
	    tween:Play()
	    tween.Completed:Wait()
    end)
    return info, Properties, tween
end

local start = tick()
function shakeCamera(initialTrauma, shakeCentre, blur) 
	coroutine.wrap(function()
	    local iterator = 0
	    local seed = Random.new():NextNumber()
	    local blurEffect = nil
	    if blur == true then
	        blurEffect = Instance.new("BlurEffect")
	        blurEffect.Size = 0
	        blurEffect.Parent = game.Lighting
	    end
	    while initialTrauma > 0 do
	        game:GetService("RunService").RenderStepped:Wait()
	        local now = tick() - start
	        iterator += 1
			local shake = (initialTrauma ^ 2)
	        if shakeCentre then
	            local distance = (workspace.CurrentCamera.CFrame.Position - shakeCentre).Magnitude
	            shake = shake / math.clamp((distance * 0.1), 0.7, inf)
	        end
	        if blurEffect then
	            blurEffect.Size = shake * 12
	        end
	        local falloffSpeed = 1.6
	        initialTrauma = math.clamp(initialTrauma - falloffSpeed * game:GetService("RunService").RenderStepped:Wait(), 0, 1)
	    end
	    if blurEffect then
	        blurEffect:Destroy()
	    end
    end)()
end
-- animations
local function ReplaceAnim(Name, Id)
	for i,v in pairs(LocalPlayer.Character.Animate:GetChildren()) do
		if v.Name == Name then
			for i,g in pairs(v:GetChildren()) do
				g.AnimationId = "rbxassetid://" .. Id
			end
		end
	end
end
DeathAnimationPack = ReplicatedStorage:FindFirstChild("Glove_Custom_Death_Animations_Storage")
if not DeathAnimationPack then
	DeathAnimationPack = Instance.new("Folder", ReplicatedStorage)
	DeathAnimationPack.Name = "Glove_Custom_Death_Animations_Storage"
end

local function LoadAnim(Name, Anim)
	if not FullCharacter(LocalPlayer) then return end
	DeathAnimationPack = ReplicatedStorage:FindFirstChild("Glove_Custom_Death_Animations_Storage")
	if not DeathAnimationPack then
		DeathAnimationPack = Instance.new("Folder", ReplicatedStorage)
		DeathAnimationPack.Name = "Glove_Custom_Death_Animations_Storage"
	end
    local animation = DeathAnimationPack:FindFirstChild(Name)
    if animation == nil then
        animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://"..Anim
        animation.Name = Name
        animation.Parent = DeathAnimationPack 
    else
        animation.AnimationId = "rbxassetid://"..Anim
    end
    if animation then
        local animInstance = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
    end
    return animation 
end

local function LoadAllAnim()
	LoadAnim("EarthSlam", 14772482253)
	LoadAnim("Sprint", 15775758181)
	LoadAnim("Backflip", 16738720919)
	LoadAnim("ScytheSpinning2", 16102682904)
	LoadAnim("ScytheSpinning", 15437009238)
	LoadAnim("SuperJump", 16102806530)
	LoadAnim("Stomp2", 16102767550)
	LoadAnim("Stomp", 15437009238)
	LoadAnim("Dash", 15436359788)
	LoadAnim("Roll", 16299510063)
	LoadAnim("SeismicDescent", 15437009238)
	LoadAnim("ScytheAttack", 16102535685)
	LoadAnim("ScytheCharge", 16102532028)
	LoadAnim("ScytheLMB", 16102426718)
	LoadAnim("LeapEnded", 14772482253)
	LoadAnim("DeathPunch", 89369444327104)
	LoadAnim("DeathPunch2", 113771475869829)
	LoadAnim("Flight", 17569574003)
	LoadAnim("Parry", 16102819260)
	LoadAnim("Dodge", 102311271621551)
	LoadAnim("Punch1", 92696348598076)
	LoadAnim("Punch2", 126666659393201)
	LoadAnim("Float", 16102548006)
end

local function PlayAnim(Name, Anim, Speed)
    local animation = DeathAnimationPack:FindFirstChild(Name)
    if animation == nil then
        animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://"..Anim
        animation.Name = Name
        animation.Parent = DeathAnimationPack 
    elseif animation and Anim then 
        animation.AnimationId = "rbxassetid://"..Anim
    end
    if animation then
        local animInstance = LocalPlayer.Character.Humanoid:LoadAnimation(animation)
        animInstance:Play()
        animInstance:AdjustSpeed(Speed)
    end
    return animation 
end

local function StopAnim(Name, Anim)
    local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
    if not Humanoid then return end
    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
    for _, v in pairs(ActiveTracks) do
        if v.Animation.AnimationId == "rbxassetid://"..Anim then
            v:Stop()
        end
    end
end


local function AnimSpeed(Name, Anim, Speed)
    local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
    if not Humanoid then return end
    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
    for _, v in pairs(ActiveTracks) do
        if v.Animation.AnimationId == "rbxassetid://"..Anim then
            v:AdjustSpeed(Speed)
        end
    end
end
-- remote events
local function HoldScythe()
	if not HideVisibleScythe then
		ReplicatedStorage.Scythe:FireServer("ScytheWeapon")
	end
end


local function AddHitbox(Pos, Size, WeldNPartName, time, touchFunction, IgnoreRagdoll, ignoredie)
    local time = time or inf
    local ignoredie = ignoredie or false
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Torso = Character:WaitForChild("HumanoidRootPart")

    local oldHitbox = workspace.Terrain:FindFirstChild("_CustomGloveAbilityHitbox_"..WeldNPartName)
    if oldHitbox and oldHitbox:IsA("Part") then
        oldHitbox:Destroy()
    end

    local part = Instance.new("Part", workspace.Terrain)
    part.Name = "_DeathGlove_Hitbox_" ..WeldNPartName
    part.Size = Size
    part.Anchored = false
    part.CanCollide = false
    part.CFrame = Torso.CFrame
    if DeathSettings.ShowHitboxes == true then
	    part.Transparency = 0.8
    else
	    part.Transparency = 1
    end

    local weld = Instance.new("Weld")
    weld.Part0 = part
    weld.Part1 = Torso
    weld.C0 = Pos
    weld.Parent = part
    part.CanCollide = false
    part.Massless = true

    if touchFunction then
        part.Touched:Connect(touchFunction)
    end

    spawn(function() 
        task.wait(time) 
        if part and part.Parent then
            part:Destroy()
        end
    end)
    if not IgnoreRagdoll then return part end
    pcall(function()
	    LocalPlayer.Character.Ragdolled.Changed:Connect(function(val)
		    if FullCharacter(LocalPlayer, {ragdoll = true, height = true, health = ignoredie}) and val == true then
			    part:Destroy()
		    end
	    end)
    end)
    return part
end

local function IsPlayerChild(v, check, iginvinc)
	if not v.Parent or v:IsA("Tool") then return false end
	local checkinvinc = checkinvinc or false
	local player = Players:GetPlayerFromCharacter(v.Parent)
	if player and player ~= game.Players.LocalPlayer then
		if check then
			if FullCharacter(player, {ragdoll = true, health = true, invinc = iginvinc}) then
				return true
			end
		else
			return true
		end
	end
	return false
end

local function SetCollidePlayers(value)
	for i,p in pairs(Players:GetPlayers()) do
		local char = p.Character
		if char and p ~= LocalPlayer then
			for i,v in pairs(char:GetChildren()) do
				if v:IsA("BasePart") or v:IsA("Part") then v.CanCollide = value end
			end
		end
	end
end

CanStopScript = true
local PlayerDeadFunc
local BuffEffect_TouchedConnection
local ArenaReturnConnection
local AntiKnockBackConnection
local DeathCubeBoost = false
local EnabledPassive
local DeathFlight
local STUN
local CanMelle
local CanRapidSlash
local SuperJumpCD
local SeismicDescentCD
local StompCD
local DashCD
local DashCD2
local ScytheSpinCD
local ScytheSpin
local CleavesIllusionCD
local RampageCD

LocalPlayer = game.Players.LocalPlayer
local ControlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
local function DeathPassive()
	if LocalPlayer.PlayerScripts.BACKEND.Systems.VFXReplication:FindFirstChild("LampBlind") then
		LocalPlayer.PlayerScripts.BACKEND.Systems.VFXReplication.LampBlind:Destroy()
	end
	if LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
		LocalPlayer.PlayerGui.SquidInk:Destroy()
	end
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
		LocalPlayer.Character.YouHaveGotMail.Disabled = true
	end
	while EnabledPassive do
	    if FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then
			spawn(function()
		      for _,v in pairs(Players:GetChildren()) do
				   if v and v.Character and v.Character:FindFirstChild("rock") then
				       v.Character:FindFirstChild("rock").CanTouch = false
				       v.Character:FindFirstChild("rock").CanQuery = false
				   end
					task.wait(.1)
				end
			end)
			spawn(function()
				for _,v in pairs(Players:GetChildren()) do
				    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("stevebody") then
				        v.Character:FindFirstChild("stevebody").CanTouch = false
				        v.Character:FindFirstChild("stevebody").CanQuery = false
				        v.Character:FindFirstChild("stevebody").CanCollide = false
				    end
					task.wait(.1)
				end
			end)
			if Camera and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and Camera.CameraSubject ~= LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and Camera.CameraSubject == game.Workspace:FindFirstChild(LocalPlayer.Name.."'s_falsehead") then
				Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			end
			spawn(function()
				for i,v in pairs(game.Workspace:GetChildren()) do
				    if v.Name == "Union" or v.Name == "Snowball" or v.Name:find("Lava") or v.Name == "Part" then
						if v.CanTouch ~= false and v.CanCollide ~= false then 
					        v.CanTouch = false
					        v.CanQuery = false
							v.CanCollide = false
						end
				    end
					task.wait(.1)
				end
			end)
			if not ParryReduceKB then
		        if DeathCubeBoost == true then
		            LocalPlayer.Character.Humanoid.WalkSpeed = 35
		            LocalPlayer.Character.Humanoid.JumpPower = 75
				elseif DeathCubeBoost == false then 
					LocalPlayer.Character.Humanoid.WalkSpeed = 20
		            LocalPlayer.Character.Humanoid.JumpPower = 50
				end
			end
			local touchGui = LocalPlayer.PlayerGui:FindFirstChild("TouchGui")
	        if touchGui and touchGui.TouchControlFrame then
	            local jumpButton = touchGui.TouchControlFrame:FindFirstChild("JumpButton")
	            if jumpButton then
	                jumpButton.Visible = false
	            end
	        end
	        for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
			    if v.Name == "DeathMark" then
				    if Lighting:FindFirstChild("DeathMarkColorCorrection") then Lighting.DeathMarkColorCorrection:Destroy() end
			    end
			end
		else
			debug("Breaked passive due no full character") break
		end
		task.wait(.1)
	end
end

local function CubeOfBoost()
	if workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless") then
		workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless"):Destroy()
	end
	local CubeBuff = Instance.new("Part", workspace.Arena.CubeOfDeathArea)
	CubeBuff.Position = game:GetService("Workspace").Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CFrame.Position - Vector3.new(0, 1.7, 0)
	CubeBuff.Anchored = true
	CubeBuff.Name = "Death's bless"
	CubeBuff.Size = Vector3.new(.5, 60, 60)
	CubeBuff.Material = Enum.Material.Neon 
	CubeBuff.Color = Color3.new(0, 0, 0) 
	CubeBuff.Shape = Enum.PartType.Cylinder 
	CubeBuff.CFrame = CubeBuff.CFrame * CFrame.Angles(0, 0, math.rad(90))
	
	local CubeBuff2 = CubeBuff:Clone()
	CubeBuff2.Size = Vector3.new(.4, 62.5, 62.5)
	CubeBuff2.Color = Color3.new(1,1,1) 
	CubeBuff2.CFrame = CubeBuff.CFrame
	CubeBuff2.Parent = CubeBuff
end

local function BuffEffect_Touched(hit)
	local Player = LocalPlayer
    if DeathCubeBoost == false then
        if hit:IsDescendantOf(Player.Character) then
	        local touchingPlayer = Players:GetPlayerFromCharacter(hit.Parent)
	        if touchingPlayer and touchingPlayer.UserId == Player.UserId then
				BoostValue = 20
		        CreateClientSound(LocalPlayer.Character.Head ,3508218059, 5)
		        DeathCubeBoost = true
				AddClientVFX("Boost")
			end
	    end
	end
end

local function GotoArena()
	if not FullCharacter(LocalPlayer) then return end
	AddClientVFX("TP")
    LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(math.random(-60, 60),-5,math.random(-60, 60))
    CreateClientSound(LocalPlayer.Character.Head ,115832406258950, 5)
    PlaySoundRemote("Fire_Power_Buff_Activate", 10, true)
	local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
    bv.MaxForce = Vector3.new(inf, inf, inf)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Name = "bv"
	Debris:AddItem(bv, 0.2)
	if Lighting:FindFirstChild("Blindcolorcorrection") then Lighting:FindFirstChild("Blindcolorcorrection"):Destroy() return end
	local colorCorrection = Instance.new("ColorCorrectionEffect")
	colorCorrection.Parent = Lighting
	colorCorrection.Name = "Blindcolorcorrection"
	colorCorrection.Brightness = -1
	colorCorrection.Saturation = 0
	task.wait(0.15)
	colorCorrection:Destroy()
end

local function FrontTeleport()
	if not FullCharacter(LocalPlayer) then return end
	AddClientShadow(LocalPlayer, .5, true)
	local humanoidRootPart = LocalPlayer.Character.HumanoidRootPart
    humanoidRootPart.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * 20
    CreateClientSound(game:GetService("SoundService") ,115832406258950, 3)
    PlaySoundRemote("Sword_Slash_1", 10, true)
end

local function TeleportAbility()
    if not FullCharacter(LocalPlayer) then return end
    local origin = Vector3.new(0, 0, 0)
    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Origo.CFrame.Position).Magnitude
    
    if distance > 441 then
        GotoArena()
    else
        FrontTeleport()
    end
end

local function ArenaReturn_Touched(hit)
	local Player = LocalPlayer
    if hit:IsDescendantOf(Player.Character) then
        local touchingPlayer = Players:GetPlayerFromCharacter(hit.Parent)
        if touchingPlayer and touchingPlayer == game.Players.LocalPlayer then
	        GotoArena()
		end
	end
end

local function AbilityCDSet(Value)
	EnabledPassive = not Value
	CanMelle = not Value
	STUN = Value
	CanRapidSlash = not Value
	SuperJumpCD = Value
	SeismicDescentCD = Value
	StompCD = Value
	DashCD = Value
	DashCD2 = Value
	ScytheSpinCD = Value
	ScytheSpin = Value
	RampageCD = Value
	CleavesIllusionCD = Value
	DeathFlight = Value
end

local function EquipGloveFunc()
	if not ScytheMode and LocalPlayer.Backpack:FindFirstChild(NewGlove) then
		LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild(NewGlove))
	elseif ScytheMode and LocalPlayer.Character:FindFirstChild(NewGlove) then
		LocalPlayer.Character.Humanoid:UnequipTools()
	end
end

-- Abilities 
-- walkfling by inf yield 
getgenv().OldPos = CFrame.new(0,0,0) 
local OrgDestroyHeight = ClonerefService("Workspace").FallenPartsDestroyHeight
local FlingTarget=function(TargetPlayer, timr)
	if not FullCharacter(LocalPlayer, {height = true}) then return end
	local Character=LocalPlayer.Character
	local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
	local RootPart=Humanoid and Humanoid.RootPart

	local TCharacter=TargetPlayer.Character
	local THumanoid
	local TRootPart
	local THead
	local Accessory
	local Handle

	if TCharacter:FindFirstChildOfClass("Humanoid") then
		THumanoid=TCharacter:FindFirstChildOfClass("Humanoid")
	end
	if THumanoid and THumanoid.RootPart then
		TRootPart=THumanoid.RootPart
	end
	if TCharacter:FindFirstChild("Head") then
		THead=TCharacter.Head
	end
	if TCharacter:FindFirstChildOfClass("Accessory") then
		Accessory=TCharacter:FindFirstChildOfClass("Accessory")
	end
	if Accessoy and Accessory:FindFirstChild("Handle") then
		Handle=Accessory.Handle
	end

	if Character and Humanoid and RootPart then

			getgenv().OldPos=Character.HumanoidRootPart.CFrame

		if THumanoid and THumanoid.Sit and not AllBool then
			return 
		end
		if THead then
			ClonerefService("Workspace").CurrentCamera.CameraSubject=THead
		elseif not THead and Handle then
			ClonerefService("Workspace").CurrentCamera.CameraSubject=Handle
		elseif THumanoid and TRootPart then
			ClonerefService("Workspace").CurrentCamera.CameraSubject=THumanoid
		end
		if not TCharacter:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local FPos=function(BasePart,Pos,Ang)
			RootPart.CFrame=CFrame.new(BasePart.Position)*Pos*Ang
			Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position)*Pos*Ang)
			RootPart.Velocity=Vector3.new(9e7,9e7*10,9e7)
			RootPart.RotVelocity=Vector3.new(9e8,9e8,9e8)
		end

		local SFBasePart=function(BasePart)
			local TimeToWait=timr or 1
			local Time=tick()
			local Angle=0

			repeat
				if RootPart and THumanoid then
					if BasePart.Velocity.Magnitude<50 then
						Angle=Angle+100
						FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(2.25,1.5,-2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(-2.25,-1.5,2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
						task.wait()
					else
						FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(math.rad(90),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,-TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(0,0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude / 1.25),CFrame.Angles(math.rad(90),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))
						task.wait()
						FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
						task.wait()
					end
				else
					break
				end
			until BasePart.Velocity.Magnitude>500 or BasePart.Parent~=TargetPlayer.Character or TargetPlayer.Parent~=Players or not TargetPlayer.Character==TCharacter or THumanoid.Sit or Humanoid.Health <=0 or tick()>Time+TimeToWait
		end

		ClonerefService("Workspace").FallenPartsDestroyHeight=0/0

		local BV=Instance.new("BodyVelocity")
		BV.Name="EpikVelocity"
		BV.Parent=RootPart
		BV.Velocity=Vector3.new(9e8,9e8,9e8)
		BV.MaxForce=Vector3.new(1/0,1/0,1/0)

		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)

		if TRootPart and THead then
			if (TRootPart.CFrame.p-THead.CFrame.p).Magnitude>5 then
				SFBasePart(THead)
			else
				SFBasePart(TRootPart)
			end
		elseif TRootPart and not THead then
			SFBasePart(TRootPart)
		elseif not TRootPart and THead then
			SFBasePart(THead)
		elseif not TRootPart and not THead and Accessory and Handle then
			SFBasePart(Handle)
		end

		BV:Destroy()
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		ClonerefService("Workspace").CurrentCamera.CameraSubject=Humanoid

		repeat
			RootPart.CFrame=getgenv().OldPos*CFrame.new(0,.5,0)
			Character:SetPrimaryPartCFrame(getgenv().OldPos*CFrame.new(0,.5,0))
			Humanoid:ChangeState("GettingUp")
			table.foreach(Character:GetChildren(),function(_,x)
				if x:IsA("BasePart") then
					x.Velocity,x.RotVelocity=Vector3.new(),Vector3.new()
				end
			end)
			task.wait()
		until (RootPart.Position-getgenv().OldPos.p).Magnitude<25
		ClonerefService("Workspace").FallenPartsDestroyHeight=-999
	end
end


local attackAnimationIds = {
    "rbxassetid://13526154547",
    "rbxassetid://16102722988",
    "rbxassetid://16102850016",
    "rbxassetid://13526158494",
    "rbxassetid://16570306782",
    "rbxassetid://15875619432",
    "rbxassetid://109511274923523",
    "rbxassetid://133068451086106",
    "rbxassetid://116559255414365",
    "rbxassetid://18855887722",
    "rbxassetid://16294032647"
}

local attackKeywords = {
    "hit",
    "slap",
    "attack"
}

local debounceDodge = false
local function DeathInvincibleAnimation(hit)
    if hit and hit.Parent and not debounceDodge and InvincibleMode and not InvincibleModeAttack then
        if hit.Parent:IsA("Tool") and hit.Parent.Activate then
            local player = game.Players:GetPlayerFromCharacter(hit.Parent.Parent)
            if player and player ~= LocalPlayer then
                local otherCharacter = player.Character
                if otherCharacter then
                    local otherHumanoid = otherCharacter:FindFirstChild("Humanoid")
                    if otherHumanoid then
                        local animations = otherHumanoid:GetPlayingAnimationTracks()
                        for _, animation in pairs(animations) do
                            if animation.Animation:IsA("Animation") then
                                if table.find(attackAnimationIds, animation.Animation.AnimationId) then
                                    debounceDodge = true
                                    if ParryReduceKB then
	                                    ImmuneDialogue("BLOCKED!", .5)
                                    else
	                                    ImmuneDialogue("NO EFFECT!", .5)
                                    end
                                    spawn(function()
	                                    wait(.3)
	                                    if FullCharacter(LocalPlayer, {height = true}) then
		                                    if LocalPlayer.Character:FindFirstChild("entered") or (LocalPlayer.Character:FindFirstChild("Ragdolled") and LocalPlayer.Character.Ragdolled.Value == true) then
			                                    InvincibleModeAbility = false
		                                    end
	                                    end
                                    end)
                                    wait(.5)
                                    debounceDodge = false
                                    return
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


local unmobilefly = function()
    pcall(function()
        DeathFlight = false
        local root = LocalPlayer.Character.HumanoidRootPart
        root:FindFirstChild("bodyGyroDeathFlight"):Destroy()
        root:FindFirstChild("bodyvelocityDeathFlight"):Destroy()
        LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
        mfly1:Disconnect()
        mfly2:Disconnect()
        StopAnim("Flight", 17569574003)
    end)
end

local mobilefly = function(VFlyspeed, vfly)
    unmobilefly(LocalPlayer)
    DeathFlight = true
    PlayAnim("Flight", 17569574003)
    VFlyspeed = VFlyspeed or 1
    
    local root = LocalPlayer.Character.HumanoidRootPart
    local camera = workspace.CurrentCamera
    local v3none = Vector3.new()
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)

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

    mfly1 = LocalPlayer.CharacterAdded:Connect(function()
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
    end)

    mfly2 = RunService.RenderStepped:Connect(function()
        root = LocalPlayer.Character.HumanoidRootPart
        camera = workspace.CurrentCamera
        if LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild("bodyvelocityDeathFlight") and root:FindFirstChild("bodyGyroDeathFlight") then
            local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local VelocityHandler = root:FindFirstChild("bodyvelocityDeathFlight")
            local GyroHandler = root:FindFirstChild("bodyGyroDeathFlight")

            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            if not vfly then humanoid.PlatformStand = true end
            GyroHandler.CFrame = camera.CoordinateFrame
            VelocityHandler.Velocity = v3none

            local direction = controlModule:GetMoveVector()
            if direction.X > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (VFlyspeed * 50))
            end
            if direction.X < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (VFlyspeed * 50))
            end
            if direction.Z > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (VFlyspeed * 50))
            end
            if direction.Z < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (VFlyspeed * 50))
            end
        end
    end)
end

local function RetroAbility(type)
	ReplicatedStorage.RetroAbility:FireServer(unpack({[1] = "PlayAnim",[2] = type}))
	ReplicatedStorage.RetroAbility:FireServer(unpack({[1] = type}))
end

local function ExtraAbility(val)
	if not FullCharacter(LocalPlayer, {ragdoll = true, height = true}) then return end
	if DeathCubeBoost then
		if STUN then return end
		StopAnim("Parry", 16102819260)
		if not DeathFlight then
			mobilefly(1, false)
		else
			unmobilefly()
		end
	else
		if tostring(val) == "down" then
			if STUN then return end
			STUN = true
			StopAnim("Parry", 16102819260)
			local parr = PlayAnim("Parry", 16102819260,0)
			ParryReduceKB = RunService.RenderStepped:Connect(function()
				if FullCharacter(LocalPlayer, {ragdoll = true, height = true}) and not DeathCubeBoost then
				LocalPlayer.Character.Humanoid.WalkSpeed = 5
					if LocalPlayer.Character.Ragdolled.Value ~= true then return end 
					for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
					    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v:IsDescendantOf(LocalPlayer.Character) then 
							v.Velocity = Vector3.new(0,0,0)
						end
					end
				else
					if ParryReduceKB then ParryReduceKB:Disconnect() ParryReduceKB = nil end
				end
			end)
		elseif tostring(val) == "up" then
			StopAnim("Parry", 16102819260)
			STUN = false
			if ParryReduceKB then
				ParryReduceKB:Disconnect()
				ParryReduceKB = nil
			end
		end
	end
end
local function RapidSlashAbility()
    if not CanRapidSlash or not ScytheMode or STUN or DeathFlight or not FullCharacter(LocalPlayer) then return end
    CanRapidSlash = false
    STUN = true
	HoldScythe()
	TalkDialogue("rapid slash")
	task.spawn(function()
	    task.wait(2)
	    if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
	        LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
	    end
	end)
	CreateClientSound(LocalPlayer.Character.Torso,7765431296, 5)
    PlayAnim("ScytheCharge", 16102532028, 2.4)
    task.wait(.3)
    AddClientVFX("RapidBlink")
    ReplicatedStorage.slapstick:FireServer("fullcharged")
    ReplicatedStorage.slapstick:FireServer("runeffect")
    ReplicatedStorage.slapstick:FireServer("cancelrun")
	AddClientTrail(1, .3)
    StopAnim("ScytheCharge", 16102532028)
    PlayAnim("ScytheAttack", 16102535685, 1)
    ReplicatedStorage.slapstick:FireServer("dash")
	RockRayTP(50)
	shakeCamera(30, LocalPlayer.Character.HumanoidRootPart.Position, true)
	CreateClientSound(LocalPlayer.Character.Head,4861863043, 5)
    shakeCamera(7, Character.HumanoidRootPart.Position, true)
    createCooldown({Title = "Rapid Slash", Time = 3})
    task.wait(.3)
    STUN = false
    task.wait(2)
    CanRapidSlash = true
    StopAnim("ScytheAttack", 16102535685)
end

local function SeismicDescentAbility()
	if not ScytheMode or not FullCharacter(LocalPlayer) or SeismicDescentCD or STUN or DeathFlight then return end
	SeismicDescentCD = true
	DashCD2 = true
	STUN = true
	CreateClientSound(LocalPlayer.Character.Torso, 201858045, 10)
	PlaySoundRemote("Ice_Sword_Spell_Cast", 10)
	if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
		TalkDialogue("Seismic Descent")
		HoldScythe()
		task.spawn(function()
		    task.wait(2)
		    if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
		AddClientTrail(1, .3, .8)
	    local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(inf, inf, inf)
	    bv.Velocity = Vector3.new(0, 100, 0)
	    bv.Name = "bv"
	    LocalPlayer.Character.Humanoid.AutoRotate = false
	    PlayAnim("SeismicDescent", 15437009238, 1.8)
	    Debris:AddItem(bv, .5)
	    task.wait(.1)
	    Destroy(bv)
	    local bv2 = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv2.MaxForce = Vector3.new(inf, inf, inf)
	    bv2.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 150
	    bv2.Name = "bv"
	    Debris:AddItem(bv2, .1)
	    task.wait(.1)
	    bv2:Destroy()
	    task.wait(.4)
	    LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SeismicDescent", 15437009238)
	    SlapAura(OLGlove, 20)
	    PlaySoundRemote("Fire_8_Bit_Explosion_3", 30)
	    if StompCD == false then RetroAbility("Bomb") else ReplicatedStorage.slapstick:FireServer("fullcharged") end
		LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
		for i = 1,20 do
			local ppos=getRandomPositionAroundPlayer(5)
			AddClientRock(ppos, 100, Vector3.new(2,2,2), DeathCubeBoost, 3)
		end
	    local BvB = LocalPlayer.Character.HumanoidRootPart:WaitForChild("BodyVelocity", .5)
	    if BvB and BvB.Name ~= "bv" then
	        BvB:Destroy()
			LocalPlayer.Character.Humanoid.AutoRotate = true
			shakeCamera(3, LocalPlayer.Character.HumanoidRootPart.Position, true)
		end
		createCooldown({Title = "Seismic Descent", Time = 1.5})
	else
		TalkDialogue("Seismic Descent")
		HoldScythe()
		task.spawn(function()
		    task.wait(2)
		    if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
		AddClientTrail(1, .3, .8)
	    local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(inf, inf, inf)
	    bv.Velocity = Vector3.new(0, 600, 0)
	    bv.Name = "bv"
	    LocalPlayer.Character.Humanoid.AutoRotate = false
		LocalPlayer.Character.Humanoid.JumpPower = 0
	    PlayAnim("SeismicDescent", 15437009238, 2.4)
	    Debris:AddItem(bv, .5)
	    task.wait(.1)
	    Destroy(bv)
	    local bv2 = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv2.MaxForce = Vector3.new(inf, inf, inf)
	    bv2.Velocity = (LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 250) + Vector3.new(0, -200, 0)
	    bv2.Name = "bv"
	    Debris:AddItem(bv2, .1)
	    task.wait(.1)
	    bv2:Destroy()
		task.wait(.1)
	    LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SeismicDescent", 15437009238)
		PlayAnim("LeapEnded", 14772482253, 1.25)
		task.wait(.225)
		SlapAura(OLGlove, 20)
		if StompCD == false then RetroAbility("Bomb") else ReplicatedStorage.slapstick:FireServer("fullcharged") end
		for i = 1,20 do
			local ppos=getRandomPositionAroundPlayer(4)
			AddClientRock(ppos, 100, Vector3.new(2,2,2), DeathCubeBoost, 3)
			ppos=getRandomPositionAroundPlayer(8)
			AddClientRock(ppos, 100, Vector3.new(3, 3, 3), DeathCubeBoost, 3)
		end
		LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
	    local BvB = LocalPlayer.Character.HumanoidRootPart:WaitForChild("BodyVelocity", .5)
	    if BvB and BvB.Name ~= "bv" then
	        BvB:Destroy()
			LocalPlayer.Character.Humanoid.AutoRotate = true
			shakeCamera(3, LocalPlayer.Character.HumanoidRootPart.Position, true)
		end
		PlaySoundRemote("Fire_8_Bit_Explosion_3", 30)
		task.wait(.1)
		StopAnim("LeapEnded", 14772482253)
		LocalPlayer.Character.Humanoid.JumpPower = 50
		if LocalPlayer.PlayerGui:FindFirstChild("TouchGui") and LocalPlayer.PlayerGui:FindFirstChild("TouchGui").TouchControlFrame and LocalPlayer.PlayerGui:FindFirstChild("TouchGui").TouchControlFrame:FindFirstChild("JumpButton") then
			LocalPlayer.PlayerGui:FindFirstChild("TouchGui").TouchControlFrame:FindFirstChild("JumpButton").Visible = false
		end
		createCooldown({Title = "Seismic Descent", Time = 1.5})
	end
	task.wait(.5)
	STUN = false
	task.wait(1)
	SeismicDescentCD = false
	DashCD2 = false
end

local function VoidStompAbility()
	if not ScytheMode or not FullCharacter(LocalPlayer) or StompCD then return end
	if STUN or DeathFlight then return end
	local NearestPlayer, NearestPlrdistance = getNearestPlayer(150)
	if NearestPlayer and NearestPlayer.Character and NearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
		TalkDialogue("Void Leap")
		HoldScythe()
		task.spawn(function()
		    task.wait(2)
		    if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
		StompCD = true
		STUN = true 
		ReplicatedStorage.slapstick:FireServer("fullcharged")
		if NearestPlrdistance <= 20 then
			RetroAbility("Ban Hammer")
		else
			ReplicatedStorage.Prop:FireServer()
		end
		task.wait(.25)
		for i = 1,20 do
			local ppos=getRandomPositionAroundPlayer(5)
			AddClientRock(ppos, 100, Vector3.new(2,2,2), false, 3)
		end
		AddClientTrail(1, .5, 1.3)
		local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(inf, inf, inf)
		bv.Velocity = Vector3.new(0, 100, 0)
		bv.Name = "bv"
		LocalPlayer.Character.Humanoid.AutoRotate = false
		PlayAnim("Stomp", 15437009238, 1)
		Debris:AddItem(bv, .5)
		task.wait(.8)
		Destroy(bv)
		SetCollidePlayers(false)
		if NearestPlayer and NearestPlayer.Character and FullCharacter(NearestPlayer, {ragdoll = true}) and NearestPlrdistance <= 20 then
			local bodyVelocity = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	        bodyVelocity.Velocity = ((NearestPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)).p - LocalPlayer.Character.HumanoidRootPart.Position) * 600
			task.wait(.2)
			bodyVelocity:Destroy()
		end
		task.wait(.1)
		workspace.Gravity = 1500
		LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
		if NearestPlrdistance > 20 and FullCharacter(NearestPlayer, {ragdoll = true}) and FullCharacter(LocalPlayer) then
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(NearestPlayer.Character.HumanoidRootPart.CFrame.X,LocalPlayer.Character.HumanoidRootPart.CFrame.Y,NearestPlayer.Character.HumanoidRootPart.CFrame.Z)
		end
		local hitbox 
        hitbox = AddHitbox(CFrame.new(0, 0, 0), Vector3.new(15, 8, 15), "[VoidLeap]plrDetector", 1.5, function(v)
	        if not targetFound then 
				if IsPlayerChild(v, true) then
					targetPlayer = Players:GetPlayerFromCharacter(v.Parent)
					Destroy(hitbox)
					shakeCamera(7, LocalPlayer.Character.HumanoidRootPart.Position, true)
					spawn(function() task.wait(.1) SlapAura(OLGlove, 30) task.wait(.2) SetCollidePlayers(true) end)
				end
			end 
        end)
		task.wait(.25)
		workspace.Gravity = 196.2
		StopAnim("Stomp", 15437009238, 1)
	    LocalPlayer.Character.Humanoid.AutoRotate = true
		shakeCamera(3, LocalPlayer.Character.HumanoidRootPart.Position, true)
		for i = 1,20 do
			local ppos=getRandomPositionAroundPlayer(3)
			AddClientRock(ppos, 100, Vector3.new(2,2,2), DeathCubeBoost, 3)
			local ppos=getRandomPositionAroundPlayer(6)
			AddClientRock(ppos, 100, Vector3.new(2.5,2.5,2.5), DeathCubeBoost, 3)
		end
		task.wait(.5)
		PlaySoundRemote("Sword_Impact_On_Dirt", 30)
		STUN = false
		createCooldown({Title = "Void Leap", Time = 3.7})
		task.wait(3.7)
		StompCD = false
	end
end

local function DashMovement()
    if DashCD or DashCD2 or not FullCharacter(LocalPlayer) then return end
    if DeathFlight or STUN then return end
    local DashPower = 80 + BoostValue
    DashCD = true
    DashCD2 = true
	STUN = true
	spawn(function()
		for i = 1,10 do
			AddClientShadow(LocalPlayer, .8, false)
			task.wait()
		end
	end)
    local dashDirection = nil
    local lookVector = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
	local moveDirection = LocalPlayer.Character.Humanoid.MoveDirection
	if moveDirection == Vector3.new(0,0,0) then
		dashDirection = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(lookVector.X, 0, lookVector.Z)
	else
		dashDirection = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(moveDirection.X, 0, moveDirection.Z)
	end
    LocalPlayer.Character.Humanoid.AutoRotate = false
    local bg = Instance.new("BodyGyro", LocalPlayer.Character.HumanoidRootPart)
	bg.MaxTorque = Vector3.new(inf, inf, inf)
	bg.D = 0
	bg.P = 500000
	bg.CFrame = CFrame.lookAt(LocalPlayer.Character.HumanoidRootPart.Position, dashDirection) 
    local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
    bv.Name = "bv"
    if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	    bv.MaxForce = Vector3.new(inf, inf, inf)
    else
        bv.MaxForce = Vector3.new(inf, 0, inf)
    end
    CreateClientSound(LocalPlayer.Character.Torso,1295417556, 5)
    if LocalPlayer.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) and LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	    bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * DashPower
	    PlayAnim("Roll", 16299510063, 1.5)
    elseif LocalPlayer.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	    bv.Velocity = LocalPlayer.Character.Humanoid.MoveDirection * DashPower
	    PlayAnim("Dash", 15436359788, 1)
	elseif LocalPlayer.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		bv.Velocity = LocalPlayer.Character.Humanoid.MoveDirection * (DashPower + 10)
		PlayAnim("Roll", 16299510063, 2)
	elseif LocalPlayer.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) and LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * (DashPower + 10)
		PlayAnim("Roll", 16299510063, 2)
	end
    Debris:AddItem(bv, DashPower)
    task.wait(.25)
    StopAnim("Dash", 15436359788)
    StopAnim("Roll", 16299510063)
    Destroy(bv, bg)
    LocalPlayer.Character.Humanoid.AutoRotate = true
	task.wait(.1)
	DashCD = false
	DashCD2 = false
	STUN = false
end

local function LeapMovement()
	if not FullCharacter(LocalPlayer) or SuperJumpCD or STUN or DeathFlight then return end
	SuperJumpCD = true
	STUN = true
	CreateClientSound(LocalPlayer.Character.Torso, 6772990629, 10)
	if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
		ReplicatedStorage.Events.Silly:FireServer("jump")
	else
		ReplicatedStorage.slapstick:FireServer("fullcharged")
	end
	if LocalPlayer.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
		PlayAnim("SuperJump", 16102806530, 2.4)
	    local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(inf, inf, inf)
	    bv.Velocity = (LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 150) + Vector3.new(0, 100, 0)
	    bv.Name = "bv"
	    LocalPlayer.Character.Humanoid.AutoRotate = false
	    task.wait(.1)
	    Destroy(bv)
	    LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SuperJump", 16102806530)
		task.wait(.5)
		STUN = false
		task.wait(.5)
		SuperJumpCD = false
	else
		PlayAnim("SuperJump", 16102806530, 2.4)
		local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(0, inf, 0)
	    bv.Velocity = Vector3.new(0, 100, 0)
	    bv.Name = "bv"
	    task.wait(.1)
	    Destroy(bv)
	    LocalPlayer.Character.Humanoid.AutoRotate = true
		StopAnim("SuperJump", 16102806530)
		task.wait(.15)
		STUN = false
		SuperJumpCD = false
  	end
end

local CycloneCancel = false
local function DeathCycloneAbility()
    CycloneCancel = true
    if not ScytheMode or not FullCharacter(LocalPlayer) or ScytheSpinCD or STUN or DeathFlight then return end
    
    CycloneCancel = false
    ScytheSpinCD = true
    STUN = true
    
    if LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        createCooldown({Title = "Death's Cyclone", Time = 7, Fill = 5})
        TalkDialogue("Death's Cyclone")
        
        task.spawn(function()
            task.wait(3)
            if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
                LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
            end
        end)
        
        ScytheSpin = true
        FOVTween(70, 120, .5)
        
        local originalPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
        local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(inf, inf, inf)
        bv.Velocity = Vector3.new(0, -50, 0)
        bv.Name = "bv"
        
        task.wait(.1)
        
        local camera = workspace.CurrentCamera
        local orientationConnection
        
        local function updateOrientation()
            if FullCharacter(LocalPlayer) and not CycloneCancel then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                    LocalPlayer.Character.HumanoidRootPart.Position, 
                    LocalPlayer.Character.HumanoidRootPart.Position + camera.CFrame.LookVector
                )
            end
        end
        
        orientationConnection = RunService.Heartbeat:Connect(updateOrientation)
        
        coroutine.wrap(function()
            while ScytheSpin do
                if not FullCharacter(LocalPlayer) or CycloneCancel then 
                    Destroy(bv)
                    FOVTween(120, 70, .2)
                    break
                else
                    PlayAnim("ScytheSpinning", 15437009238, 8)
                    task.wait(0.1)
                    AnimSpeed("ScytheSpinning", 15437009238, 1)
                    task.wait(0.5)
                    StopAnim("ScytheSpinning", 15437009238, 2)
                end
            end
        end)()
        
        local LoopScytheSpin = true    
        
        coroutine.wrap(function()
            while LoopScytheSpin do
                if bv and FullCharacter(LocalPlayer) and not CycloneCancel then
                    bv.Velocity = camera.CFrame.LookVector * 100
                    ReplicatedStorage.slapstick:FireServer("fullcharged")
                    task.wait(0.1)
                else
                    Destroy(bv)
                    StopAnim("ScytheSpinning", 15437009238, 2)
                    STUN = false
                    FOVTween(120, 70, .2)
                    break
                end
            end
        end)()
        
        local targetPlayer
        local targetFound = false
        local startTime = tick()
        
        coroutine.wrap(function()
            while LoopScytheSpin do
                if bv and FullCharacter(LocalPlayer) then
                    if not targetFound then
                        SlapAura(OLGlove, 20)
                    else 
                        SlapTarget(OLGlove, targetPlayer, 20)
                    end
                else
                    break 
                end
                task.wait(0.8)
            end
        end)()
        
        while ScytheSpin do
            targetPlayer = getNearestPlayer(30)
            if targetPlayer then
                targetFound = true
                break
            end
            if tick() - startTime >= 7 then
                ScytheSpin = false
                break
            end
            task.wait(0.1)
        end
        
        if targetFound and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health ~= 0 and LoopScytheSpin then
            while tick() - startTime < 7 and targetPlayer and targetPlayer.Character and FullCharacter(targetPlayer, {ragdoll = true, height = true}) and FullCharacter(LocalPlayer) do
                local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                local localPosition = LocalPlayer.Character.HumanoidRootPart.Position
                local distance = (targetPosition - localPosition).magnitude
                local MoveToPosition = Vector3.new(targetPosition.X, targetPosition.Y + 6, targetPosition.Z)
                
                if distance < 150 then
                    HoldScythe()
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and FullCharacter(targetPlayer, {ragdoll = true, health = true, height = true}) then
                        local targetHumanoid = targetPlayer.Character.Humanoid
                        if targetHumanoid and targetHumanoid.Health > 0 then
	                        local VelocitySpeed = 100
	                        if distance > 50 then
		                        VelocitySpeed = 400
	                        end
                            bv.Velocity = (MoveToPosition - localPosition).unit * (VelocitySpeed + BoostValue)
                        elseif targetHumanoid and targetHumanoid.Health <= 0 then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition
                        end
                    end
                else break end
                task.wait(0.1)
            end
        end
        
        ScytheSpin = false
        Destroy(bv)
        if orientationConnection then
            orientationConnection:Disconnect()
        end
        LoopScytheSpin = false
        FOVTween(120, 70, .2)
        STUN = false
        task.wait(5)
        ScytheSpinCD = false
        
    else
        createCooldown({Title = "Scythe Whirlwind", Time = 7.45, Fill = 5})
        ShiftLock()
        TalkDialogue("Scythe Whirlwind")
        
        task.spawn(function()
            task.wait(5)
            if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
                LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
            end
        end)
        
        local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(inf, inf, inf)
        bv.Velocity = Vector3.new(0, -30, 0)
        bv.Name = "bv"
        task.wait(.1)
        Destroy(bv)
        
        FOVTween(70, 90, .2)
        PlayAnim("ScytheSpinning2", 16102682904, 8)
        PlayAnim("ScytheSpinning1", 15505690455, 5)
        task.wait(.1)
        AnimSpeed("ScytheSpinning1", 15505690455, .00001)
        FOVTween(70, 90, .5)
        
        local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(inf, inf, inf)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Name = "bv"
        
        local LoopScytheSpin = true
        local hitbox
        
        coroutine.wrap(function()
            while LoopScytheSpin do
                if bv and FullCharacter(LocalPlayer) and not CycloneCancel then
                    HoldScythe()
                    bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 80
                    ReplicatedStorage.slapstick:FireServer("fullcharged")
                    task.wait(.1)
                else
                    Destroy(bv)
                    Destroy(hitbox)
                    STUN = false
                    StopAnim("ScytheSpinning2", 16102682904)
                    StopAnim("ScytheSpinning1", 15505690455)
                    ScytheSpin = false
                    FOVTween(90, 70, .2)
                    break
                end
            end
        end)()
        
        local hbdebounce = false 
        hitbox = AddHitbox(CFrame.new(0, 0, 0), Vector3.new(20,20,20), "[Scythe whirlwind]plrdetector", 6, function(v)
            if IsPlayerChild(v, true) and not hbdebounce then
                SlapAura(OLGlove, 30)
                createCooldown({Title = "Whirlwind Force", Time = .8})
                hbdebounce = true
                task.wait(.8)
                hbdebounce = false
            end
        end)
        
        coroutine.wrap(function()
            while LoopScytheSpin do
                if not (bv and FullCharacter(LocalPlayer)) then 
                    Destroy(hitbox) 
                end
                task.wait()
            end
        end)()
        
        task.wait(6)
        Destroy(hitbox)
        ScytheSpin = false
        LoopScytheSpin = false
        task.wait(.25)
        DisableShiftlock()
        Destroy(bv)
        StopAnim("ScytheSpinning2", 16102682904)
        StopAnim("ScytheSpinning2.5", 15505690455)
        FOVTween(90, 70, .2)
        task.wait(.5)
        STUN = false
        task.wait(4.5)
        ScytheSpinCD = false 
    end
end


local RampageCancel = false
local function RampageAbility()
	RampageCancel = true
	if not FullCharacter(LocalPlayer) or RampageCD or STUN or DeathFlight then return end
	if ScytheMode then
		RampageCancel = false
		if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
			STUN = true
			RampageCD = true
			TalkDialogue("Rampage")
		    task.spawn(function()
		    	task.wait(1)
		        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        	LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
			    end
			end)
		    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		    local bv = Instance.new("BodyVelocity")
		    bv.Name = "bv"
		    bv.Parent = character.HumanoidRootPart
		    bv.MaxForce = Vector3.new(9e9, 0, 9e9)
		    bv.Velocity = Vector3.new(0, 0, 0)
			FOVTween(70, 90, .5)
		    PlayAnim("Sprint", 15775758181, 2)
			local targetPlayer
		    local targetFound = false
		    local moveDuration = 1
	        local startTime = tick()
	        local hitbox 
		    coroutine.wrap(function()
	            while not targetFound do task.wait(.01)
	                if bv and FullCharacter(LocalPlayer) and not RampageCancel then
			            bv.Velocity = Vector3.new()
					    bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 100
						AddClientShadow(LocalPlayer, 2, false)
	                else
	                    Destroy(bv, hitbox)
	                    StopAnim("Sprint", 15775758181)
	                    FOVTween(90, 70, .2)
	                    STUN = false
	                    break
	                end
	            end
	        end)()
	        hitbox = AddHitbox(CFrame.new(0, 0, 7), Vector3.new(8, 7, 20), "[Rampage]plrDetector", moveDuration, function(v)
		        if not targetFound then 
					if IsPlayerChild(v, true) then
						targetPlayer = Players:GetPlayerFromCharacter(v.Parent)
						spawn(function() SlapTarget(OLGlove, targetPlayer, 50) task.wait(.1) SlapTarget(OLGlove, targetPlayer, 50) end)
						Destroy(hitbox)
					end
				end 
	        end)
		    while tick() - startTime <= moveDuration do
				if targetPlayer then
					targetFound = true
					break
				end
				task.wait()
			end
		    if targetFound and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health ~= 0 then
	            StopAnim("Sprint", 15775758181)
	                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.Humanoid.Health ~= 0 and FullCharacter(LocalPlayer) then
					    if targetPlayer.Character and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then   
				        local targetHumanoid = targetPlayer.Character.Humanoid
			            if targetHumanoid and targetHumanoid.Health > 0 then
							AddClientTrail(1, .3)
							SetCollidePlayers(false)
							CreateClientSound(LocalPlayer.Character.Head,4861863043, 10)
							HoldScythe()
							PlayAnim("ScytheLMB2", 135557283152371, 1.5)
							AddClientVFX("ScytheLMB2")
							FOVTween(90, 360, .2)
							shakeCamera(30, LocalPlayer.Character.HumanoidRootPart.Position, true)
							bv:Destroy()
							RockRayTP(30)
					    	task.wait(.1)
							SetCollidePlayers(true)
	                    end
			            ReplicatedStorage.slapstick:FireServer("fullcharged")
					end
	            end
	        end
	        RampageCancel = true
	        STUN = false
			FOVTween(110, 70, .2)
			task.wait(.15)
		    if character and character:FindFirstChild("HumanoidRootPart") then
		        Destroy(bv)
		        StopAnim("Sprint", 15775758181)
		    end
			if targetFound then
				createCooldown({Title = "Rampage", Time = 0.85})
				task.wait(0.85)
				RampageCD = false
			else
				createCooldown({Title = "Rampage", Time = 2})
				task.wait(2)
				RampageCD = false
			end 
		end
	elseif BrawlerMode then
		if InvincibleModeAbility then
			RampageCancel = false
			if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
				STUN = true
				RampageCD = true
				TalkDialogue("Spectral Passage")
			    task.spawn(function()
			    	task.wait(1)
			        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
			        	LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
				    end
				end)
			    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
			    local bv = Instance.new("BodyVelocity")
			    bv.Name = "bv"
			    bv.Parent = character.HumanoidRootPart
			    bv.MaxForce = Vector3.new(9e9, 0, 9e9)
			    bv.Velocity = Vector3.new(0, 0, 0)
				FOVTween(70, 90, .5)
			    PlayAnim("Dash", 15436359788, 0)
				local targetPlayer
			    local targetFound = false
			    local moveDuration = 1
		        local startTime = tick()
		        local hitbox 
			    coroutine.wrap(function()
		            while not targetFound do task.wait(.01)
		                if bv and FullCharacter(LocalPlayer) and not RampageCancel then
				            bv.Velocity = Vector3.new()
						    bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 100
							AddClientShadow(LocalPlayer, 2, false)
		                else
		                    Destroy(bv, hitbox)
		                    StopAnim("Dash", 15436359788)
		                    FOVTween(90, 70, .2)
		                    STUN = false
		                    break
		                end
		            end
		        end)()
		        hitbox = AddHitbox(CFrame.new(0, 0, 7), Vector3.new(8, 7, 20), "[Rampage]plrDetector", moveDuration, function(v)
			        if not targetFound then 
						if IsPlayerChild(v, true, true) then
							targetPlayer = Players:GetPlayerFromCharacter(v.Parent)
							Destroy(hitbox)
						end
					end 
		        end)
			    while tick() - startTime <= moveDuration do
					if targetPlayer then
						targetFound = true
						break
					end
					task.wait()
				end
			    if targetFound and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health ~= 0 then
		            StopAnim("Dash", 15436359788)
		                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.Humanoid.Health ~= 0 and FullCharacter(LocalPlayer, {height = true}) then
						    if targetPlayer.Character and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then   
					        local targetHumanoid = targetPlayer.Character.Humanoid
				            if targetHumanoid and targetHumanoid.Health > 0 then
								local att0, att1, trail = AddClientTrail(2, 1)
								CreateClientSound(LocalPlayer.Character.Head,4861863043, 10)
								FOVTween(90, 360, .2)
								shakeCamera(30, LocalPlayer.Character.HumanoidRootPart.Position, true)
								bv:Destroy()
								FlingTarget(targetPlayer, 1)
								wait(.3)
								Destroy(att0, att1, trail)
		                    end
				            ReplicatedStorage.slapstick:FireServer("fullcharged")
						end
		            end
		        end
		        RampageCancel = true
		        STUN = false
				FOVTween(110, 70, .2)
				task.wait(.15)
			    if character and character:FindFirstChild("HumanoidRootPart") then
			        Destroy(bv)
			        StopAnim("Dash", 15436359788)
			    end
				createCooldown({Title = "Spectral Passage", Time = 4})
				task.wait(4)
				RampageCD = false
			end
		else
		-- not invincible mode
		-- shadow fist
		end
	end
end

local CleaveIllusionCancel = false
local function CleavesIllusionAbility()
	CleaveIllusionCancel = true
	if not ScytheMode or not FullCharacter(LocalPlayer) or CleavesIllusionCD or STUN or DeathFlight then return end
	CleaveIllusionCancel = false
	if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
		STUN = true
		CleavesIllusionCD = true
		TalkDialogue("Cleave Illusion")
	    task.spawn(function()
	    	task.wait(5)
	        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
	        	LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
		--[[
		ReplicatedStorage.Prop:FireServer()
		task.wait(.2)
	    local bv = Instance.new("BodyVelocity")
	    bv.Name = "bv"
	    bv.Velocity = (LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * -90) + (LocalPlayer.Character.HumanoidRootPart.CFrame.UpVector * 50)
	    bv.MaxForce = Vector3.new(inf, inf, inf) 
	    bv.Parent = LocalPlayer.Character.HumanoidRootPart
	    PlayAnim("Backflip", 16738720919, 1)
	    task.wait(0.1)
	    Destroy(bv)
	    task.wait(.2)
	    StopAnim("Backflip", 16738720919)
		task.wait(.35)
		]]--
	    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	    local originalPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
	    local bv = Instance.new("BodyVelocity")
	    bv.Name = "bv"
	    bv.Parent = character.HumanoidRootPart
	    bv.MaxForce = Vector3.new(9e9, 0, 9e9)
	    bv.Velocity = Vector3.new(0, 0, 0)
		FOVTween(70, 90, .5)
	    PlayAnim("Sprint", 15775758181, 2)
		local targetPlayer
	    local targetFound = false
	    local moveDuration = 4
        local startTime = tick()
        local hitbox 
	    coroutine.wrap(function()
            while not targetFound do task.wait(.01)
                if bv and FullCharacter(LocalPlayer) and not CleaveIllusionCancel then
		            bv.Velocity = Vector3.new()
				    bv.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 100
					AddClientShadow(LocalPlayer, 2, false)
                else
                    Destroy(bv, hitbox)
                    STUN = false
                    StopAnim("Sprint", 15775758181)
                    FOVTween(90, 70, .2)
                    break
                end
            end
        end)()
        hitbox = AddHitbox(CFrame.new(0, 0, 6), Vector3.new(10, 8, 30), "[Cleave Illusion]plrDetector", moveDuration, function(v)
	        if not targetFound then 
				if IsPlayerChild(v, true) then
					targetPlayer = Players:GetPlayerFromCharacter(v.Parent)
					Destroy(hitbox)
				end
			end 
        end)
	    while tick() - startTime <= moveDuration do
			if targetPlayer then
				targetFound = true
				break
			end
			task.wait()
		end
        local counter = 0
        local LastCounter = 7
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	    if targetFound and targetPlayer.Character and FullCharacter(targetPlayer, {ragdoll = true}) then
			local att0, att1, trail = AddClientTrail(2, 1)
		    local moveDuration = 7
	        local startTime = tick()
            StopAnim("Sprint", 15775758181)
            ShiftLock()
            while tick() - startTime < moveDuration and counter <= LastCounter and not CleaveIllusionCancel do
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.Humanoid.Health ~= 0 and FullCharacter(LocalPlayer) then
 			   local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
				local localPosition = LocalPlayer.Character.HumanoidRootPart.Position
				local distance = (targetPosition - localPosition).magnitude
				if distance < 150 then
				    if targetPlayer.Character and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then   
				        local targetHumanoid = targetPlayer.Character.Humanoid
				            if targetHumanoid and targetHumanoid.Health > 0 then
								AddClientShadow(LocalPlayer, 2, true, 3)
			           	 	character.HumanoidRootPart.CFrame = (targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,8,0)) + targetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5
								CreateClientSound(LocalPlayer.Character.Head,4861863043, 10)
	                        	local random = math.random(1,2)
					            if random == 1 then
						            PlayAnim("ScytheStrongLMB", 75459203439371, 2)
									PlayAnim("ScytheLMB", 16102426718, 1)
					            else
						            PlayAnim("ScytheStrongLMB", 75459203439371, 2)
									PlayAnim("ScytheLMB", 16102426718, 1)
					            end
								HoldScythe()
			    	        	task.wait(.1) 
                                SlapTarget(OLGlove, targetPlayer, 20) counter = counter + 1
			                    task.wait()
				                bv.Velocity = (targetPosition - localPosition).unit * 300
								FOVTween(90, 110, .1)
						    	task.wait(.1)
                                bv.Velocity = Vector3.new(0, 0, 0)
                                FOVTween(110, 90, .1)
				            elseif targetHumanoid and targetHumanoid.Health <= 0 then
				                LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition break
				            end
				        end
                    else break end
				else break end
                task.wait(.13)
            end
            if targetPlayer and targetPlayer.Character and FullCharacter(targetPlayer, {ragdoll = true}) and FullCharacter(LocalPlayer) then
	            StopAnim("DeathPunch", 89369444327104)
	            StopAnim("DeathPunch2", 113771475869829)
	            ReplicatedStorage.slapstick:FireServer("dash")
	            task.wait(.5)
	            PlayAnim("EarthSlam", 14772482253, 1)
	            targetPosition = targetPlayer.Character.HumanoidRootPart.Position
			    localPosition = LocalPlayer.Character.HumanoidRootPart.Position
	            character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
	            task.wait()
	            character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0,10,0)
				Destroy(bv)
				LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
	            workspace.Gravity = 1000
	            task.wait(.3)
	            workspace.Gravity = 196.2
	            ReplicatedStorage.slapstick:FireServer("fullcharged")
            end
            Destroy(trail, att0, att1)
        end
        CleaveIllusionCancel = true
        DisableShiftlock()
        STUN = false
		FOVTween(110, 70, .2)
		task.wait(.15)
	    if character and character:FindFirstChild("HumanoidRootPart") then
	        Destroy(bv, bg)
	        StopAnim("Sprint", 15775758181)
	    end
		if targetFound then
			createCooldown({Title = "Cleaves Illusion", Time = 8})
			task.spawn(function()
		    	task.wait(5)
		        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        	LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
			    end
			end)
			task.wait(8)
			CleavesIllusionCD = false
		else
			createCooldown({Title = "Cleaves Illusion", Time = 3})
			task.spawn(function()
		    	task.wait(5)
		        if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        	LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
			    end
			end)
			task.wait(3)
			CleavesIllusionCD = false
		end  
	end
end

local LMBHitDirectionFlag = false
local function MelleAttack()
    if not CanMelle or not FullCharacter(LocalPlayer, {ragdoll = true, height = true, health = true}) then return end
    if STUN and not (DeathFlight or DashCD) then return end
    if ScytheMode then
	    CreateClientSound(LocalPlayer.Character.Head,8089211478, 10)
		PlaySoundRemote("Sword_Pierce_1", 10)
	    STUN = true
	    CanMelle = false
	    HoldScythe()
	    CreateClientSound(LocalPlayer.Character.Head,4861863043, 5)
		LMBHitDirectionFlag = not LMBHitDirectionFlag
		if LMBHitDirectionFlag then
		    PlayAnim("ScytheLMB", 16102426718, 1)
			AddClientVFX("ScytheLMB")
		else
			PlayAnim("ScytheLMB2", 135557283152371, 1.5)
			AddClientVFX("ScytheLMB2")
		end
	    
	    local hitbox
	    hitbox = AddHitbox(CFrame.new(0, 0, 4.5), Vector3.new(18, 8, 15), "[ScytheHit]plrdetector", .8, function(v)
			if IsPlayerChild(v, true) and v.Parent then
				SlapTarget(OLGlove, Players:GetPlayerFromCharacter(v.Parent), 9e9)
				Destroy(hitbox)
			elseif not IsPlayerChild(v, true) and v.Parent and v.Parent.Name == "Imp" or v.Parent.Name:find(CloneName) then
				SlapMob(OLGlove, v.Parent, 9e9)
				Destroy(hitbox)
			end
	    end, true, true)
	    createCooldown({Title = "Scythe Swing", Time = 1})
	    task.wait(1)
	    STUN = false
	    CanMelle = true
	    StopAnim("ScytheLMB", 16102426718)
    elseif BrawlerMode then 
    	STUN = true
	    CanMelle = false
		createCooldown({Title = "Cursed fist", Time = 1})
		LMBHitDirectionFlag = not LMBHitDirectionFlag
		if not LMBHitDirectionFlag then PlayAnim("Punch1") else PlayAnim("Punch2") end
	    local hitbox
	    hitbox = AddHitbox(CFrame.new(0, 0, 4.5), Vector3.new(15, 5, 12), "[FistHit]plrdetector", .8, function(v)
			if IsPlayerChild(v, true) and v.Parent then
				SlapTarget(OLGlove, Players:GetPlayerFromCharacter(v.Parent), 9e9)
				Destroy(hitbox)
			elseif not IsPlayerChild(v, true) and v.Parent and v.Parent.Name == "Imp" or v.Parent.Name:find(CloneName) then
				SlapMob(OLGlove, v.Parent, 9e9)
				Destroy(hitbox)
			end
	    end, true, true)
		wait(1)
		STUN = false
	    CanMelle = true
    end
end

--[[Setup buttons]]--
local function SetupButtons()
	local ShadowFrame = SG:FindFirstChild("AbilityFrame")
	if ShadowFrame then 
		ShadowFrame:Destroy()
	end
	ShadowFrame = Instance.new("Frame")
	ShadowFrame.Size = UDim2.new(0.4, 0, 0.3, 0)
	ShadowFrame.Name = "AbilityFrame"
	ShadowFrame.Position = UDim2.new(0.59, 0, 0.65, 0)
	ShadowFrame.BackgroundColor3 = Color3.new(0,0,0)
	ShadowFrame.BorderColor3 = Color3.new(1,1,1)
	ShadowFrame.BorderSizePixel = 3
	ShadowFrame.Active = true
	ShadowFrame.BackgroundTransparency = 0
	ShadowFrame.Draggable = false
	ShadowFrame.Parent = SG
	ShadowFrame.Visible = false
	AddGradient(ShadowFrame)
	
	local AbilityFrame = Instance.new("Frame")
	AbilityFrame.Size = UDim2.new(0.6, 0, 1, 0)
	AbilityFrame.Position = UDim2.new(0.4, 0, 0, 0)
	AbilityFrame.BackgroundTransparency = 1
	AbilityFrame.Parent = ShadowFrame
	
	local gridLayout = Instance.new("UIGridLayout")
	gridLayout.CellSize = UDim2.new(.31, 0, 0.47, 0)
	gridLayout.FillDirection = Enum.FillDirection.Horizontal
	gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	gridLayout.Parent = AbilityFrame
	
	local MovementFrame = Instance.new("Frame", ShadowFrame)
	MovementFrame.Size = UDim2.new(0.4, 0, 1, 0)
	MovementFrame.Position = UDim2.new(0, 0, 0, 0)
	MovementFrame.BackgroundColor3 = Color3.new(0,0,0)
	MovementFrame.BorderColor3 = Color3.new(0, 0, 0)
	MovementFrame.BackgroundTransparency = 0
	local gridLayout2 = Instance.new("UIGridLayout")
	gridLayout2.CellSize = UDim2.new(.475, 0, .3, 0)
	gridLayout2.FillDirection = Enum.FillDirection.Horizontal
	gridLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	gridLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	gridLayout2.Parent = MovementFrame
	
	local function AddAbilityButton(Name, Text, pcall, vis)
		local AbilityButton = Instance.new("TextButton", AbilityFrame)	AbilityButton.BackgroundColor3 = Color3.new(0, 0, 0)
		AbilityButton.BorderColor3 = Color3.new(1,1,1)
		AbilityButton.BorderSizePixel = 2
		AbilityButton.Text = Text
		AbilityButton.TextSize = 35
		AbilityButton.Name = Name
		AbilityButton.BackgroundTransparency = 0
		AbilityButton.TextColor3 = Color3.new(1,1,1)
		AbilityButton.Font = Enum.Font.Arcade
		AbilityButton.Visible = vis or true
		local gradient = AddGradient(AbilityButton)
		AbilityButton.MouseButton1Click:Connect(pcall)
		AbilityButton.MouseEnter:Connect(function()
	        local borderTween = TweenService:Create(AbilityButton, TweenInfo.new(0.2), {BorderColor3 = Color3.fromRGB(255, 255, 0)})
			local TextTween = TweenService:Create(AbilityButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 0)})
	        borderTween:Play()
			TextTween:Play()
			CreateClientSound(SoundService, 762117042, 5)
	    end)
	    AbilityButton.MouseLeave:Connect(function()
	        local borderTween = TweenService:Create(AbilityButton, TweenInfo.new(0.8), {BorderColor3 = Color3.fromRGB(255, 255, 255)})
			local TextTween = TweenService:Create(AbilityButton, TweenInfo.new(0.8), {TextColor3 = Color3.fromRGB(255, 255, 255)})
	        borderTween:Play()
			TextTween:Play()
	    end)
		return AbilityButton
	end
	
	local function AddMovementButton(Name, pcall, pcallenter, pcallleave)
		local MovementButton = Instance.new("TextButton", MovementFrame)	
	    MovementButton.BackgroundColor3 = DarkenColor(ThemeColor, .2)
		MovementButton.Text = Name
		MovementButton.TextScaled = true
		MovementButton.Name = Name
		MovementButton.BackgroundTransparency = 0
		MovementButton.TextColor3 = Color3.new(1,1,1)
		MovementButton.Font = Enum.Font.Arcade
		local BorderFrame = Instance.new("Frame")
	    BorderFrame.Size = UDim2.new(1, 0, 1, 0)
	    BorderFrame.BackgroundTransparency = 1
	    BorderFrame.Parent = MovementButton
	    local UIStroke = AddStroke(BorderFrame, 1.5, Color3.new(1,1,1))
		MovementButton.MouseButton1Click:Connect(pcall)
		MovementButton.MouseEnter:Connect(function()
	        local borderTween = TweenService:Create(UIStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(255, 255, 0)})
			local TextTween = TweenService:Create(MovementButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 0)})
	        borderTween:Play()
			TextTween:Play()
			CreateClientSound(SoundService, 762117042, 5)
			if pcallenter then pcallenter() end
	    end)
	    MovementButton.MouseLeave:Connect(function()
	        local borderTween = TweenService:Create(UIStroke, TweenInfo.new(0.5), {Color = Color3.fromRGB(255, 255, 255)})
			local TextTween = TweenService:Create(MovementButton, TweenInfo.new(0.5), {TextColor3 = Color3.fromRGB(255, 255, 255)})
	        borderTween:Play()
			TextTween:Play()
			if pcallleave then pcallleave() end
	    end)
		AddCorner(MovementButton, 5)
		AddCorner(BorderFrame, 5)
		AddGradient(UIStroke, DarkenColor(ThemeColor, 0.5), Color3.new(0,0,0))
		AddGradient(MovementButton, DarkenColor(ThemeColor, 0.8), Color3.new(0,0,0))
		return MovementButton
	end
	
	local FrameWeaponType = Instance.new("Frame", ShadowFrame)
	FrameWeaponType.Size = UDim2.new(1, 0, 0.2, 0)
	FrameWeaponType.Position = UDim2.new(0, 0, -.3, 0)
	FrameWeaponType.BackgroundColor3 = Color3.new(0,0,0)
	FrameWeaponType.BackgroundTransparency = 0
	AddCorner(FrameWeaponType, 5)
	local FWTStroke = AddStroke(FrameWeaponType, 2, Color3.new(1,1,1))
	AddGradient(FWTStroke, ThemeColor, Color3.new(0,0,0))
	
	local TextWeaponType = Instance.new("TextButton", FrameWeaponType)
	TextWeaponType.Size = UDim2.new(1, 0, 1, 0)
	TextWeaponType.TextColor3 = Color3.new(1,1,1)
	TextWeaponType.BackgroundTransparency = 1
	TextWeaponType.Text = "SCYTHE"
	TextWeaponType.TextScaled = true
	TextWeaponType.Font = Enum.Font.Arcade
	AddGradient(TextWeaponType, ThemeColor, Color3.new(0,0,0))
	
	-- Abilities 
	AddAbilityButton("Rampage", 1, function()
		RampageAbility()
	end)
	
	AddAbilityButton("Rapid Slash", 2, function()
		RapidSlashAbility()
	end)
	
	AddAbilityButton("Seismic Descent", 3, function()
		SeismicDescentAbility()
	end)
	
	AddAbilityButton("Void Stomp", 4, function()
		VoidStompAbility()
	end)
	
	AddAbilityButton("Death Cyclone", 5, function()
		CleavesIllusionAbility()
	end)
	
	AddAbilityButton("Cleave Illusion", 6, function()
		DeathCycloneAbility()
	end)
	
	-- Movements
	AddMovementButton("LMB", function()
		MelleAttack()
	end)
	AddMovementButton("E", function()
		EquipGloveFunc()
	end)
	AddMovementButton("B", function()
		TeleportAbility()
	end)
	AddMovementButton("C", function()
		DashMovement() -- remind update: Replace with teleport 
	end)
	AddMovementButton("T", function()
		LeapMovement() -- remind update: Replace with teleport 
	end)
	AddMovementButton("F", function()
		ExtraAbility()
	end, function()
	ExtraAbility("down")
	end, function()
	ExtraAbility("up")
	end)
	return ShadowFrame, TextWeaponType
end


AbilityCDSet(true)


local EquippedValue = ReplicatedStorage.PlayerData[LocalPlayer.Name].Inventory.Equipped
local function GetGloveValue(jsonString)
	if game.PlaceId == 11520107397 then return "Killstreak" end
    local data = game:GetService("HttpService"):JSONDecode(jsonString)
    if data and data.Glove then
        return data.Glove
    else
        return nil
    end
end

local function findGlove(Name)
    local character = LocalPlayer.Character
    if character and FullCharacter() then
        local toolInCharacter = character:FindFirstChildWhichIsA("Tool")
        if toolInCharacter and toolInCharacter.Name == Name then
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

local PlayerIsDeadConnection
local Death
Death = function(ReExecute)
	--[[VARIABLES 3]]--
	if ReExecute ~= true then if LocalPlayer.leaderstats.Glove.Value == NewGlove or LocalPlayer.leaderstats.Glove.Value == "Default" then return end end
	CanStopScript = true
	OLGlove = GetGloveValue(EquippedValue.Value)
	local Character = LocalPlayer.Character
	local Torso = Character:WaitForChild("Torso",15)
	local Head = Character:WaitForChild("Head",15)
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 15)
	local Humanoid = Character and Character:FindFirstChild("Humanoid", 15)
	
	local abilityFrame, AbilityMode = SetupButtons()	
	local function EquipGlove()
			LoadAllAnim()
		    local TimeGlovestatsChecker = false
		    local StartTimeCheck = tick()
		    local EndedTimeCheck = inf
		    local TimeEnded = nil 
		    LocalPlayer.leaderstats.Glove.Value = NewGlove
			task.wait(.1)
			LocalPlayer.leaderstats.Glove.Value = NewGlove
		    local tool
		    		    
			while TimeEnded == nil do
		        if tick() - StartTimeCheck < EndedTimeCheck then
		            if LocalPlayer.leaderstats.Glove.Value ~= NewGlove then
		                return 
		            end
		
		            repeat task.wait() tool = findGlove(OLGlove) until tool or not FullCharacter(LocalPlayer, {health = true}) or LocalPlayer.leaderstats.Glove.Value ~= NewGlove 
		            if tool then
		                if tool.Name == OLGlove then
		                    TimeEnded = false
		                    break
		                else
		                    tool = nil
		                    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "no tool found",Icon = "rbxassetid://7733658504",Duration = 5})
							LocalPlayer.leaderstats.Glove.Value = GetGloveValue(EquippedValue.Value)
		                    return
		                end
		            end
		        else
		            TimeEnded = true
		            LocalPlayer.leaderstats.Glove.Value = OLGlove
		            return
		        end
		        wait()
		    end
		    if tool and LocalPlayer.Character:FindFirstChild("entered") and LocalPlayer.leaderstats.Glove.Value == NewGlove then
				if InvincibleMode then
					for i = 1,10 do 
						LocalPlayer.Character:PivotTo(CFrame.new(0,100000,0))
						task.wait() 
					end
			        tool.Parent = nil
			        LocalPlayer.Character.Humanoid.Health = 0
			        task.wait(3.75)
					repeat task.wait() until FullCharacter()
			        tool.Parent = LocalPlayer.Backpack
			        for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			            LocalPlayer.Character.Humanoid:EquipTool(v)
			        end
			
			        LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Origo.CFrame * CFrame.new(math.random(-50, 50), -5, math.random(-50, 50))
					LocalPlayer.Character.Humanoid.Touched:Connect(DeathInvincibleAnimation)
					PlayButtonVisible(false)
					InvincibleModeAbility = true
				end
				PlayerIsDeadConnection = LocalPlayer.CharacterAdded:Connect(PlayerDeadFunc)
		        DeathSenceConnection = LocalPlayer.Character.Humanoid.Died:Connect(function()
					if DeathSenceConnection then DeathSenceConnection:Disconnect() end
					TalkDialogue("bad choice.")
			        if tool:FindFirstChildWhichIsA("LocalScript") then
			            tool:FindFirstChildWhichIsA("LocalScript").Enabled = true
			        end
					tool = nil
					repeat task.wait()
					pcall(function() LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,100,0) end)
					task.wait()
					until not LocalPlayer.Character or LocalPlayer.Character:FindFirstChild("Humanoid") == nil or LocalPlayer.Character.Humanoid.Health > 0
				end)
		        abilityFrame.Visible = true
				tool.Activated:Connect(function()
					MelleAttack()
				end)
				SG.Enabled = true
		        local touchGui = LocalPlayer.PlayerGui:FindFirstChild("TouchGui")
		        local ContextActionGui = LocalPlayer.PlayerGui:FindFirstChild("ContextActionGui")
		        if ContextActionGui then ContextActionGui.Enabled = false end
		        
		        if touchGui and touchGui.TouchControlFrame then
		            local jumpButton = touchGui.TouchControlFrame:FindFirstChild("JumpButton")
		            if jumpButton then
		                jumpButton.Visible = false
		            end
		        end
		        local mobileShiftLock = LocalPlayer.PlayerGui:FindFirstChild("MobileShiftLock")
		        if mobileShiftLock then
		            mobileShiftLock.Button.Position = UDim2.new(0.7, 0, 0, 0)
		        end
		        for _, v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
		            if v.Name:lower() == "slapcounter" then
		                v.Visible = false
		            end
		        end
		        LocalPlayer.Character.Humanoid:UnequipTools()
		        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
		
				TalkDialogue("Greetings")
				wait(.5)
		        CreateClientSound(LocalPlayer.Character.Head, 3508218059, 10)
		        game:GetService("TweenService"):Create(colorcorrect, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Brightness = 2}):Play() 
				spawn(function()
					wait(1)
					game:GetService("TweenService"):Create(colorcorrect,TweenInfo.new(0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Brightness = 0}):Play()
				end)

		        task.wait(0.5)
		        if tool:FindFirstChildWhichIsA("LocalScript") then
		            tool:FindFirstChildWhichIsA("LocalScript").Enabled = false
		        end
		        
		        if workspace:FindFirstChild("Death's AntiVoid") then
		            workspace:FindFirstChild("Death's AntiVoid"):Destroy()
		        end
		        local antivoid = Instance.new("Part", workspace)
		        antivoid.Position = workspace.Origo.Position - Vector3.new(0, 600, 0) -- CFrame.new(workspace.Origo.Position) * CFrame.new(0, -7.5, 0)
		        antivoid.Name = "Death's AntiVoid"
		        antivoid.Size = Vector3.new(2500, 1000, 2500)
		        antivoid.Anchored = true
		        antivoid.Color = Color3.new(0, 0, 0)
		        antivoid.Transparency = 1
		
		        -- Animations
		        ReplaceAnim("idle", 18870736973)
		        ReplaceAnim("walk", 13548464604)
		        ReplaceAnim("toolnone", 0)
		
				AbilityCDSet(false)
		        task.spawn(DeathPassive)
		        AntiBarriers(true)
		        workspace.Gravity = 196.2
		        tool.Name = tostring(NewGlove)
		        tool.ToolTip = tostring(NewTooltip)
		        ShowScythe = true
		        
		        LocalPlayer.Character.Humanoid:UnequipTools()
		        task.wait(.5)
		        LocalPlayer.Character.Humanoid:EquipTool(tool)

		        EquipGloveConnection = tool.Equipped:Connect(function()
					coroutine.wrap(function()
						for i = 1,2 do ReplicatedStorage.Events.Silly:FireServer("jump") end
					end)()
					ReplicatedStorage.Prop:FireServer()
					workspace.Gravity = 196.2
					--AddClientVFX("EquipScythe")
					AbilityMode.Text = "SCYTHE"
		            CreateClientSound(LocalPlayer.Character.Head, 462606062, 10)
		            ScytheMode = true
					BrawlerMode = false
		            lastMelleTime = 0
		            task.wait(.5)
		            StopAnim("EquipTool", 182393478)
		        end)
		        UnequipGloveConnection = tool.Unequipped:Connect(function()
					coroutine.wrap(function()
						for i = 1,2 do ReplicatedStorage.Events.Silly:FireServer("jump") end
					end)()
					ReplicatedStorage.slapstick:FireServer("fullcharged")
					AbilityMode.Text = "BRAWLER"
		            ScytheMode = false
					BrawlerMode = true
		            CreateClientSound(LocalPlayer.Character.Head, 462606062, 10)
		        end)
		        
		        -- Cube of Boost
		        CubeOfBoost()
		        DeathCubeBoost = false
		        
		        -- Connections for Bless and Return
		        local Bless = workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless") 
		        local Return = workspace:FindFirstChild("Death's AntiVoid")
		        if Bless then
		            BuffEffect_TouchedConnection = Bless.Touched:Connect(BuffEffect_Touched)
		        end
		        if Return then
		            ArenaReturnConnection = Return.Touched:Connect(ArenaReturn_Touched)
		        end
		        CreateClientSound(LocalPlayer.Character.HumanoidRootPart, 635822826, 5)
				CreateClientSound(LocalPlayer.Character.HumanoidRootPart, 744719962, 5)
		        if DeathThemeEnabled then 
		            CreateClientSound(LocalPlayer.Character.HumanoidRootPart,CustomTheme, 3, true)
		        end

		        if HideClientsVFX ~= true then
				    local HandleSet = tool:FindFirstChild("Handle") or tool:WaitForChild("Handle")
				    local Highlight = Instance.new("Highlight", LocalPlayer)
				    Highlight.Name = "Highlight"
				    Highlight.FillColor = Color3.fromRGB(0, 0, 0)
				    Highlight.DepthMode = "AlwaysOnTop"
				    Highlight.FillTransparency = 0
				    Highlight.OutlineColor = Color3.new(1,0,0)
				    Highlight.OutlineTransparency = 1
				    Highlight.Adornee = LocalPlayer.Character
		            Horn()
					for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					    if v:IsA("Part") and not v.Name:find("Radio") and v.Name ~= "HumanoidRootPart" then
					        AddClientVFX("FlameAura", v)
					    end
					end 
		            local toolSet = tool:FindFirstChild("Glove") or tool:WaitForChild("Glove",1)
		            if toolSet then
		                local CurseAttachment = Instance.new("Attachment", toolSet)
		                CurseAttachment.Visible = false 
		                CurseAttachment.Name = "Tool Attachment"
		                CurseAttachment.CFrame = CFrame.new(-0.165016174, 0.142364502, 0.0890109539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
						AddClientVFX("FlameAura", CurseAttachment)
					    toolSet.Color = Color3.new(0, 0, 0)
					    toolSet.Transparency = 0
					    toolSet.Material = Enum.Material.Neon
						HandleSet.Color = Color3.new(0, 0, 0)
						HandleSet.Transparency = 0
						HandleSet.Material = Enum.Material.Neon
					end
				end
				shakeCamera(30, Character.HumanoidRootPart.Position, true)
				DreemurDialogue("DEATH")
				task.spawn(function()
				    task.wait(5)
					if not FullCharacter(LocalPlayer) then debug(5) return end
				    if LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
				        LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
				    end
				end)
		    else
			    PlayerDeadFunc()
		        debug(6) return
		    end
		
	end
	
	PlayerDeadFunc = function()
		AlreadyActivatedDeath = true
		if workspace:FindFirstChild("Death's AntiVoid") then
			workspace:FindFirstChild("Death's AntiVoid"):Destroy()
		end
		if SG then
			SG.Enabled = false
		end
		ShowScythe = false
		AbilityCDSet(true)
		ScytheMode = false
		BrawlerMode = false
		DeathCubeBoost = false
		if workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless") then
			workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless"):Destroy()
		end
		AntiBarriers(false)
		if AntiKnockBackConnection then
			AntiKnockBackConnection:Disconnect()
		end
		if BuffEffect_TouchedConnection then 
	    	BuffEffect_TouchedConnection:Disconnect()
		end 
		if ArenaReturnConnection then 
	    	ArenaReturnConnection:Disconnect()
		end 
		if PCKeyBind then 
			PCKeyBind:Disconnect()
		end
		if PCKeyBindInputEnd then
			PCKeyBindInputEnd:Disconnect()
		end
		if ParryReduceKB then
			ParryReduceKB:Disconnect()
		end
		if InvincibleMode then
			PlayButtonVisible(true)
		end
		if UnequipGloveConnection and EquipGloveConnection then
			UnequipGloveConnection:Disconnect()
			EquipGloveConnection:Disconnect()
		end
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
		for i,v in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
			if v.Name:lower() == "slapcounter" then
				v.Visible = true
			end
		end
		local ContextActionGui = LocalPlayer.PlayerGui:FindFirstChild("ContextActionGui")
	    if ContextActionGui then ContextActionGui.Enabled = true end
		if PlayerIsDeadConnection then PlayerIsDeadConnection:Disconnect() end
		task.wait(.3)
		Death(true)
	end
	
	PCKeyBind = UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.One then
	        RampageAbility()
	    elseif input.KeyCode == Enum.KeyCode.Two then
	        RapidSlashAbility()
	    elseif input.KeyCode == Enum.KeyCode.Three then
	        SeismicDescentAbility()
	    elseif input.KeyCode == Enum.KeyCode.Four then
	        VoidStompAbility()
	    elseif input.KeyCode == Enum.KeyCode.Five then
	        CleavesIllusionAbility()
	    elseif input.KeyCode == Enum.KeyCode.Six then
	        DeathCycloneAbility()
	    elseif input.KeyCode == Enum.KeyCode.C then
	        DashMovement()
	    elseif input.KeyCode == Enum.KeyCode.T then
	        LeapMovement()
	    elseif input.KeyCode == Enum.KeyCode.E then
	        EquipGloveFunc()
		elseif input.KeyCode == Enum.KeyCode.B then
	        TeleportAbility()
		elseif input.KeyCode == Enum.KeyCode.F then
			ExtraAbility("down")
	    end
	end)
	PCKeyBindInputEnd = UserInputService.InputEnded:Connect(function(input)
	    if input.KeyCode == Enum.KeyCode.F then
	        ExtraAbility("up")
	    end
	end)
	--[[CONNECT]]--
	EquipGlove()
end


spawn(Death)

local glitchystats
local function glitchwords(length, characters)    
    local characters =  characters
    local word = ""   
    for i = 1, length do
        local randomIndex = math.random(1, #characters)
        word = word .. string.sub(characters, randomIndex, randomIndex)
    end
    return word
end

local glitchystats = glitchwords(8, "*':;!?/)(+-&_Â£#@1234567890qwertyuiopasdfghjklzxcvbnm")
--Garbages 
--AbilityName.Text = "ABILITY: ???????"
--AbilityType.Text = "PRESS " .. generateRandomWord(1, "12345678EQGFT?*#") .. " TO USE"
--GlovePowerT.Text = "Power: Death"-- .. GlitchyStats
--GloveSpeedT.Text = "Speed: Death"-- .. GlitchyStats
