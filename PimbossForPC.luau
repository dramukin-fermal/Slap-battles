local cloneref = (cloneref or clonereference or function(instance) return instance end)

local LocalPlayer = cloneref(game:GetService("Players")).LocalPlayer
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Workspace = cloneref(game:GetService("Workspace"))
local Lighting = cloneref(game:GetService("Lighting"))
local RunService = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local ContextActionService = cloneref(game:GetService("ContextActionService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local TeleportService = cloneref(game:GetService("TeleportService"))

function missing(t, f, fallback)
	if type(f) == t then return f end
	return fallback
end

local WindUI do
	local ok, result = pcall(function()
		return require("./src/Init")
	end)
	if ok then
		WindUI = result
	else
		if cloneref(game:GetService("RunService")):IsStudio() then
			WindUI = require(cloneref(ReplicatedStorage:WaitForChild("WindUI"):WaitForChild("Init")))
		else
			WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
		end
	end
end

if not WindUI then
    warn("WindUI failed to load")
    return
end

local function getBody(v)
	local v = v or LocalPlayer
    local character = v.Character
    if not character then return nil, nil, nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local hum = character:FindFirstChild("Humanoid")
    if not hrp then return nil, nil, nil end
    
    return character, hrp, hum
end

local fogRunning = false
local fogConnection
local function toggleFog(state)
	if fogConnection then fogConnection:Disconnect(); fogConnection = nil end
	fogRunning = state
	if state then
		Lighting.FogEnd = 100000
		Lighting.FogStart = 0
		fogConnection = RunService.Heartbeat:Connect(function()
			for i,v in pairs(Lighting:GetDescendants()) do
				if v:IsA("Atmosphere") then
					v:Destroy()
				end
			end
		end)
	else
		Lighting.FogEnd = 1000
		Lighting.FogStart = 0
	end
end

local brightConnection
local function toggleBright(state)
    if brightConnection then brightConnection:Disconnect(); brightConnection = nil end
    if state then
        brightConnection = RunService.Heartbeat:Connect(function()
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end)
    else
        Lighting.Brightness = 1
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1000
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    end
end

local function createButton(name, title, key, action)
    ContextActionService:BindAction(
        name,
        function(actionName, inputState, inputObject)
            if inputState == Enum.UserInputState.Begin then
                action()
            end
        end,
        true,
        key
    )
    ContextActionService:SetTitle(name, title)
    return ContextActionService:GetButton(name)
end

local mfly1, mfly2
local isFlying = false
local FlySpeed = 1
local unmobilefly = function()
    pcall(function()
        isFlying = false
        local char, root, hum = getBody()
        if root then
            local gyro = root:FindFirstChild("bodyGyroDeathFlight")
            local vel = root:FindFirstChild("bodyvelocityDeathFlight")
            local bal = char:FindFirstChild("flyDetectBall")
            if gyro then gyro:Destroy() end
            if vel then vel:Destroy() end
            if bal then bal:Destroy() end
        end
        if mfly1 then mfly1:Disconnect() mfly1 = nil end
        if mfly2 then mfly2:Disconnect() mfly2 = nil end
    end)
end

local mobilefly = function(VFlyspeed, vfly)
    unmobilefly()
    isFlying = true
    VFlyspeed = VFlyspeed or 1
    VFlyspeed = VFlyspeed * 50
    local char, root, hum = getBody()
    if not char or not root or not hum then return end
    
    local camera = workspace.CurrentCamera
    local v3none = Vector3.new()
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)

    local controlModule = nil
    pcall(function()
        controlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    end)
    
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
        local char, root, hum = getBody()
        if not char or not root or not hum then return end
        
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
        local char, root, hum = getBody()
        if not char or not root or not hum then return end 
        if not isFlying then return end
        camera = workspace.CurrentCamera
        local VelocityHandler = root:FindFirstChild("bodyvelocityDeathFlight")
        local GyroHandler = root:FindFirstChild("bodyGyroDeathFlight")
        
        if VelocityHandler and GyroHandler then
            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            GyroHandler.CFrame = camera.CoordinateFrame
            VelocityHandler.Velocity = v3none
            local direction = Vector3.zero
            if controlModule then
                pcall(function()
                    direction = controlModule:GetMoveVector()
                end)
            else
                local moveDir = Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir += Vector3.new(0, 0, -1) end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir += Vector3.new(0, 0, 1) end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir += Vector3.new(-1, 0, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir += Vector3.new(1, 0, 0) end
                direction = moveDir
            end

            local speed = VFlyspeed
            if FlySpeed then speed = FlySpeed * 50 end
            if direction.X > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * speed)
            end
            if direction.X < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * speed)
            end
            if direction.Z > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * speed)
            end
            if direction.Z < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * speed)
            end
        end
    end)
end

local Window = WindUI:CreateWindow({
	Title = "Taotie hub - Slap Battles Pim bossfight V3 <pc support version>",
	Folder = "taotiehubsb",
	Desc = "Donjosx",
	NewElements = false,
	HideSearchBar = false,
	BackgroundTransparency = 0.5,
	OpenButton = {
		Title = "Taotie hub",
		CornerRadius = UDim.new(1, 0),
		StrokeThickness = 1,
		Enabled = true,
		Draggable = true,
		OnlyMobile = false,
		Scale = 1,
		Color = ColorSequence.new(
			Color3.fromHex("#30FF6A"),
			Color3.fromHex("#e7ff2f")
		),
	},
	Topbar = {
		Height = 44,
		ButtonsType = "Default",
	},
})

local PimPlaceId = tonumber("77963332815593")
if game.PlaceId ~= PimPlaceId then
	local MainTab = Window:Tab({
		Title = "Main",
	})
	MainTab:Button({
	    Title = "Join bossfight (regular)",
	    Callback = function()
	        local arena = workspace:FindFirstChild("Arena")
	        if not arena then 
	            WindUI:Notify({Title = "Error", Content = "Arena not found", Duration = 2})
	            return 
	        end
	        
	        local island5 = arena:FindFirstChild("island5")
	        if not island5 then 
	            WindUI:Notify({Title = "Error", Content = "Island5 not found", Duration = 2})
	            return 
	        end
	        
	        for i, v in pairs(island5:GetChildren()) do
	            if v:FindFirstChild("C") and v.C:FindFirstChild("ClickDetector") then
					if LocalPlayer.Character then
						LocalPlayer.Character:PivotTo(v.C:GetPivot())
					end
					pcall(function()
	                	fireclickdetector(v.C.ClickDetector)
					end)
	                break
	            end
	        end
			task.wait(3)
			pcall(function() 
				if workspace:FindFirstChild("PortalMask") and workspace.PortalMask:FindFirstChild("Main") then
					fireproximityprompt(workspace.PortalMask.Main.ProximityPrompt) 
				end
			end)
	    end,
	})
	MainTab:Button({
	    Title = "Join bossfight (Subplace teleport)",
		Desc = "not recommend, buggy server, turn off verify teleport if you are using Delta",
	    Callback = function()
	        TeleportService:Teleport(PimPlaceId)
			task.wait(10)
			LocalPlayer:Kick("Failed to join subplace, please disable your verify teleport")
	    end,
	})
	return 
end
-------------- [LocalPlayerTab] ---------------
local LocalPlayerTab = Window:Tab({
	Title = "LocalPlayer",
})

-------------- [VisualsTab] ---------------
local VisualsTab = Window:Tab({
	Title = "Visuals",
})

-------------- [SaveTab] ---------------
local CombatTab = Window:Tab({
	Title = "Boss",
})

-------=======[ LocalPlayerTab:MovementSection ]=======--------
local MovementSection = LocalPlayerTab:Section({
	Title = "Movement",
})

MovementSection:Slider({
	Title = "Fly speed",
	Step = 1,
	Value = {
		Min = 1,
		Max = 10,
		Default = 1,
	},
	Callback = function(value)
		FlySpeed = value
	end,
})

MovementSection:Toggle({
	Title = "Enable fly",
	Desc = "use infinity yield fly if this feature doesn't work",
	Value = false,
	Callback = function(state)
		if state then
			mobilefly(FlySpeed)
		else
			unmobilefly()
		end
	end,
})

local WalkSpeed = 20
local LoopSpeed = false
MovementSection:Slider({
	Title = "Walkspeed",
	Step = 5,
	Value = {
		Min = 20,
		Max = 100,
		Default = 20,
	},
	Callback = function(value)
		WalkSpeed = value
	end,
})

MovementSection:Toggle({
	Title = "Enable WalkSpeed",
	Value = false,
	Callback = function(state)
		LoopSpeed = state
		task.spawn(function()
			while LoopSpeed do
				local char, hrp, hum = getBody()
				if hum then hum.WalkSpeed = WalkSpeed end
				task.wait()
			end
		end)
	end,
})

-------=======[ VisualsTab:Main ]=======--------
local enabledAntiLag = false
VisualsTab:Button({
    Title = "Anti lag",
    Desc = "credit to CasperFlyModz",
    Callback = function()
		_G.Settings = {
		    Players = {
		        ["Ignore Me"] = true,
		        ["Ignore Others"] = true
		    },
		    Meshes = {
		        Destroy = false,
		        LowDetail = false,
		    },
		    Images = {
		        Invisible = false,
		        LowDetail = false,
		        Destroy = false,
		    },
		    ["No Particles"] = false,
		    ["No Camera Effects"] = true,
		    ["No Explosions"] = false,
		    ["No Clothes"] = true,
		    ["Low Water Graphics"] = true,
		    ["No Shadows"] = true,
		    ["Low Rendering"] = true,
		    ["Low Quality Parts"] = true
		}
		if enabledAntiLag then return end
		enabledAntiLag = true
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
		end)
    end,
})
VisualsTab:Button({
    Title = "Remove skybox",
    Callback = function()
		for i,v in pairs(Lighting:GetChildren()) do 
			if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") then
				v:Destroy() 
			end
		end
    end,
})

VisualsTab:Toggle({
	Title = "No Fog",
	Value = false,
	Callback = function(state)
		toggleFog(state)
	end,
})

VisualsTab:Toggle({
	Title = "Full Bright",
	Value = false,
	Callback = function(state)
		toggleBright(state)
	end,
})

-------=======[ CombatTab ]=======--------
local KeySection = CombatTab:Section({
	Title = "Start Stage",
})

KeySection:Button({
    Title = "Start hardmode",
    Callback = function()
        local char, hrp, hum = getBody()
        if not char then return end
        
        local skip = workspace:FindFirstChild("Skip")
        if not skip or not skip:FindFirstChild("Hardmode") or not skip.Hardmode:FindFirstChild("ProximityPrompt") then
            WindUI:Notify({Title = "Error",Content = "Hardmode duck not found! Complete normal mode to unlock hard mode",Duration = 3,})
            return
        end
        
        local prompt = skip.Hardmode:FindFirstChild("ProximityPrompt")
        if prompt then
            hrp:PivotTo(skip.Hardmode:GetPivot())
            task.wait(0.3)
            pcall(function()
                fireproximityprompt(prompt)
            end)
        end
    end,
})
local workingTask = false
KeySection:Button({
    Title = "Get keys",
    Callback = function()
	    local char, hrp, hum = getBody()
		if workingTask then return end
		workingTask = true
		if hum then
		    local ogpos = char:GetPivot()
			for i,v in pairs(workspace:GetChildren()) do
				if v.Name == "BasicChest" and v:FindFirstChild("Base") then
					char:PivotTo(v:GetPivot())
					task.wait(.3)
					pcall(function()
						fireproximityprompt(v.Base.ProximityPrompt)
					end)
				end
			end
			if not fireproximityprompt then
				WindUI:Notify({Title = "Error",Content = "Your executor doesn't support fireproximityprompt, can't collect keys!",Duration = 10,})
			end
			char:PivotTo(ogpos)
		end
		workingTask = false
    end,
})

KeySection:Button({
    Title = "Teleport to key room",
    Callback = function()
	    local char, hrp, hum = getBody()
		if char then char:PivotTo(CFrame.new(-146, 5, -126)) end
    end,
})
local BossSection1 = CombatTab:Section({
	Title = "Light Stage",
})

local function Slap(v)
	local args = {
	    [1] = v,
	    [2] = Vector3.new(-0.6, -0.7, 0.2)
	}
	
	ReplicatedStorage.Remotes.SlapPest:FireServer(unpack(args))
end

local autoLightsConnection = nil

local function AutoLights(state)
    local player = LocalPlayer
    local camera = workspace.CurrentCamera
    
    if not state then
        if autoLightsConnection then
            autoLightsConnection:Disconnect()
            autoLightsConnection = nil
        end
        return
    end
    
    autoLightsConnection = game:GetService("RunService").Heartbeat:Connect(function()
        local character = player.Character
        if not character then return end
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then return end
        
        local lightPlatforms = workspace:FindFirstChild("StartCorridor") and workspace.StartCorridor:FindFirstChild("FinalRing") and workspace.StartCorridor.FinalRing:FindFirstChild("LightPlatforms")
        if not lightPlatforms then return end
        
        for _, lightObj in pairs(lightPlatforms:GetChildren()) do
            if lightObj.Name:match("^Light") then
                local rotatingBloomingLight = lightObj:FindFirstChild("RotatingBloomingLight")
                if rotatingBloomingLight then
                    local rotatingModel = rotatingBloomingLight:FindFirstChild("RotatingModel")
                    if rotatingModel then
                        local housing = rotatingModel:FindFirstChild("Housing")
                        if housing then
                            local lightBeam = rotatingBloomingLight:FindFirstChild("LightBeam")
                            if not lightBeam or lightBeam.Transparency >= 1 then
                                camera.CFrame = CFrame.new(camera.CFrame.Position, housing.Position)
                                
                                local angle = tick() * 1.5
                                local x = math.cos(angle) * 30
                                local z = math.sin(angle) * 30
                                local targetPosition = housing.Position + Vector3.new(x, 0, z)
                                humanoidRootPart.CFrame = CFrame.new(targetPosition)
                                
                                return
                            end
                        end
                    end
                end
            end
        end
    end)
end

BossSection1:Button({
    Title = "Show light orbs",
    Callback = function()
	    local char, hrp, hum = getBody()
	    if workingTask then return end
		workingTask = true
		if hum then
			ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-172_11_-116")
			ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_155_91_-139")
			ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-45_11_131")
			ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-172_11_-116")
			ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_155_91_-139")
			ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-45_11_131")
		end
		workingTask = false
    end,
})

local lastSlap = 0
local function slap()
    if tick() - lastSlap < 0.5 then return end
    local char, hrp, hum = getBody()
    if char then
        local glove = char:FindFirstChildWhichIsA("Tool")
        if glove then 
            glove:Activate() 
            lastSlap = tick()
        end
    end
end

BossSection1:Button({
    Title = "Trigger light orbs",
    Desc = "don't use during cutsence or else boss fight will be broken",
    Callback = function()
	    local char, hrp, hum = getBody()
		if workingTask then return end
		workingTask = true
		local trigger = workspace:FindFirstChild("StartCorridor") and workspace.StartCorridor:FindFirstChild("FinalRing") and workspace.StartCorridor.FinalRing:FindFirstChild("Trigger") 
		if trigger then
			workingTask = false
			hrp:PivotTo(trigger:GetPivot()) 
			return 
		end 
		if hum then
			local startTime = tick()
			local timeout = 15
			
			repeat
				if tick() - startTime >= timeout then
					workingTask = false
					return
				end
				trigger = workspace:FindFirstChild("StartCorridor") and workspace.StartCorridor:FindFirstChild("FinalRing") and workspace.StartCorridor.FinalRing:FindFirstChild("Trigger")  
				if not workspace:FindFirstChild("LightOrb") then
					ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-172_11_-116")
					ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_155_91_-139")
					ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-45_11_131")
					ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-172_11_-116")
					ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_155_91_-139")
					ReplicatedStorage.Remotes.RevealLightSpawner:FireServer("s1_-45_11_131")
				end
				task.wait()
				for i,v in pairs(workspace:GetChildren()) do 
					if v.Name == "LightOrb" then 
						local old = v:GetPivot()
						repeat task.wait()
							hrp:PivotTo(v:GetPivot() * CFrame.new(0,0,5))
							hrp.Velocity = Vector3.new(0,0,0)
							ReplicatedStorage.Remotes.SlapPest:FireServer(v,Vector3.new(0,0,0))
							slap()
							if tick() - startTime >= timeout then
								workingTask = false
								return
							end
						until not v or not v.Parent
					end
				end
				trigger = workspace:FindFirstChild("StartCorridor") and workspace.StartCorridor:FindFirstChild("FinalRing") and workspace.StartCorridor.FinalRing:FindFirstChild("Trigger") 
			until trigger or (tick() - startTime >= timeout)
			
			if trigger then
				task.wait(.5)
				hrp:PivotTo(trigger:GetPivot()) 
			end
		end
		workingTask = false
    end,
})

BossSection1:Button({
    Title = "Teleport to boss place",
    Desc = "use it if you got stuck in safe spot",
    Callback = function()
	    local char, hrp, hum = getBody()
	    local trigger = workspace:FindFirstChild("StartCorridor") and workspace.StartCorridor:FindFirstChild("FinalRing") and workspace.StartCorridor.FinalRing:FindFirstChild("Trigger") 
		if hrp and trigger then hrp:PivotTo(trigger:GetPivot()) end
	end,
})

local BossSection2 = CombatTab:Section({
	Title = "Boss Stage",
})

local AutoManaInf = false
BossSection2:Toggle({
    Title = "Infinity mana",
    Value = false,
    Callback = function(state)
        AutoManaInf = state
        task.spawn(function()
            while AutoManaInf do
                local mana = LocalPlayer:GetAttribute("Mana") or 100
                if mana <= 100 then
                    ReplicatedStorage.Remotes.ManaSpend:FireServer(-math.huge)
                end
                task.wait(0.1)
            end
        end)
    end,
})

local AutoStaticOrb = false
BossSection2:Toggle({
	Title = "Auto slap static orb",
	Value = false,
	Callback = function(state)
		AutoStaticOrb = state
		task.spawn(function()
			while AutoStaticOrb do
				pcall(function()
					if workspace:FindFirstChild("StaticOrb") then
						Slap(workspace:FindFirstChild("StaticOrb"))
						slap()
					end
				end)
				task.wait()
			end
		end)
	end,
})

local safespotName = "safespot taotie"
local safespot = workspace:FindFirstChild(safespotName)
if not safespot then
    safespot = Instance.new("Part", workspace)
end
safespot.Name = safespotName
safespot.Size = Vector3.new(2000, 5, 2000)
safespot.Anchored = true
safespot.Transparency = 0.2
safespot.Material = Enum.Material.ForceField
safespot.CFrame = CFrame.new(0, 6000, 0)
safespot.CanCollide = true

local lastPosition = nil
BossSection2:Toggle({
	Title = "Safe spot toggle [G]",
	Value = false,
	Callback = function(state)
		if state then
			local safebtn = createButton("toggle safespot", "safe", Enum.KeyCode.G, function()
				local char, hrp, hum = getBody()
				if not hrp then return end 
			    local currentPos = hrp.Position
			    local safespotPos = safespot.Position
			    local distance = (currentPos - safespotPos).Magnitude
			    
			    if distance > 2000 then
			        lastPosition = currentPos
			        hrp.CFrame = safespot.CFrame + Vector3.new(0, 3, 0)
			    else
			        if lastPosition then
			            hrp.CFrame = CFrame.new(lastPosition)
			            lastPosition = nil
			        end
			    end
			end)
			if safebtn then
				safebtn.Position = UDim2.new(.4,0,-0.9,0)
			end
		else
			ContextActionService:UnbindAction("toggle safespot")
		end
	end,
})

local AutoShout = false
BossSection2:Toggle({
    Title = "Auto Shout to eyes",
    Desc = "Unreliable ngl",
    Value = false,
    Callback = function(state)
        AutoShout = state
        task.spawn(function()
            while AutoShout do
                for _, obj in ipairs(workspace:GetChildren()) do
                    local name = obj.Name:lower()
                    if (name:find("eye") or name:find("chomper") or name:find("laser") or name:find("enraged")) and obj:FindFirstChild("Base") then
                        local highlightContainer = obj.Base:FindFirstChild("Highlight")
                        if highlightContainer then
                            for _, highlight in ipairs(highlightContainer:GetChildren()) do
                                if highlight:IsA("Highlight") and (highlight.FillTransparency ~= 1 or highlight.OutlineTransparency ~= 1) then
                                    local char, hrp, hum = getBody()
                                    if char and hrp then
                                        local lookVector = (obj.Base.Position - hrp.Position).Unit
                                        local args = {
                                            [1] = "Shout",
                                            [2] = lookVector
                                        }
                                        ReplicatedStorage.Remotes.ActivateAbility:FireServer(unpack(args))
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(.1)
            end
        end)
    end,
})

local AutoEyes = false
BossSection2:Toggle({
    Title = "Auto slap eyes",
    Desc = "Now work for enraged eyes",
    Value = false,
    Callback = function(state)
        AutoEyes = state
        task.spawn(function()
            while AutoEyes do
                local char, hrp, hum = getBody()
                if char and hrp then
                    for _, obj in ipairs(workspace:GetChildren()) do
                        local name = obj.Name:lower()
                        if (name:find("eye") or name:find("chomper") or name:find("laser") or name:find("enraged")) then
                            local target = obj:FindFirstChild("Base") or obj:FindFirstChild("Hitbox")
                            if target then
                                local dist = (hrp.Position - target.Position).Magnitude
                                if dist <= 60 then
                                    pcall(function()
                                        local args = {
                                            [1] = target,
                                            [2] = Vector3.new(0.4924832284450531, 0.17866811156272888, 0.8517852425575256)
                                        }
                                        ReplicatedStorage.Remotes.SlapPest:FireServer(unpack(args))
                                        slap()
                                    end)
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        end)
    end,
})

local AutoDodgeShockwave = false
BossSection2:Toggle({
    Title = "Auto dodge shockwave",
    Desc = "must use with fly, harder to dodge if you are near boss, fly above boss when it's down",
    Value = false,
    Callback = function(state)
        AutoDodgeShockwave = state
    end,
})

workspace.ChildAdded:Connect(function(v)
	if AutoDodgeShockwave then
		if v.Name:lower():find("shockwave") then
			local char, hrp, hum = getBody()
			if hrp then hrp.CFrame = hrp.CFrame * CFrame.new(0,30,0) end
		end
	end
end)

local AboutTab = Window:Tab({
	Title = "About",
})

AboutTab:Paragraph({
	Title = "Made by @indifferenceguy",
	Desc = "aka donjos on YT",
	TextSize = 16,
})

local inviteCode = "R33ZyPS94"
AboutTab:Button({
    Title = "Copy Discord Invite",
    Desc = "Join our Discord community",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/" .. inviteCode)
            WindUI:Notify({
                Title = "Copied!",
                Content = "Discord invite copied to clipboard!",
                Duration = 2,
            })
        else
            WindUI:Notify({
                Title = "Discord Invite",
                Content = "https://discord.gg/" .. inviteCode,
                Duration = 3,
            })
        end
    end,
})
