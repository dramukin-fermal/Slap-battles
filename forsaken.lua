--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local sos, speed, grav, gen = nil, 1, 196.2, 3
local disabled = true
local event1, event2, event3, event4, event9, event10, event11
local re=true
local char=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
game.Players.LocalPlayer.CharacterAdded:Connect(function(v)
char=v
end)

local ANIM = {}
for i, v in next, game:GetService("ReplicatedStorage").Assets.Killers:GetChildren() do
for o,b in next, require(v.Config) do
if o=="Animations" then
for p,n in next,b do
if p=="Walk" or p=="Run" then
table.insert(ANIM, n)
end
end
end
end
end

local ANIM = {}
for i, v in next, game:GetService("ReplicatedStorage").Assets.Survivors:GetChildren() do
for o,b in next, require(v.Config) do
if o=="Animations" then
for p,n in next,b do
if p=="Walk" or p=="Run" then
table.insert(ANIM, n)
end
end
end
end
end

function updateToggles() end

local T = {
    players = {},
    tools = {},
    gens = {},
    conns = {},
    flags = {
        survivors = false,
        killers = false,
        tools = false,
        gens = false
    }
}

_G.ForsakenESP = {
    set = function(flagIndex, value)
        if flagIndex == 5 then T.flags.survivors = value
        elseif flagIndex == 6 then T.flags.killers = value
        elseif flagIndex == 7 then T.flags.tools = value
        elseif flagIndex == 8 then T.flags.gens = value end

        if disabled then
            task.spawn(function()
                repeat task.wait() until not disabled
                updateToggles()
            end)
        else
            updateToggles()
        end
    end
}

local Check = false
local lt = 0
local Old
Old = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = { ... }
    local Method = getnamecallmethod()

    if not checkcaller() and typeof(Self) == "Instance" then
        if Method == "InvokeServer" or Method == "FireServer" then
            if tostring(Self) == "RF" then
                if Args[1] == "enter" then
                    Check = true
                elseif Args[1] == "leave" then
                    Check = false
                end
            elseif tostring(Self) == "RE" then
                lt = os.clock()
            elseif tostring(Self) == "UnreliableRemoteEvent" and Args[1]=="FootstepPlayed" and event11 then
return nil
            end
        end
    end

    return Old(Self, unpack(Args))
end)

game:GetService"RunService".Stepped:Connect(function(EL)
local a = game:GetService("Lighting")
if sos then
a.Brightness=3
a.ClockTime=14
a.Ambient=Color3.new(1,1,1)
a.OutdoorAmbient=Color3.new(1,1,1)
a.FogEnd=1e100
a.GlobalShadows=false
for i,v in next,a:GetChildren() do
if v:IsA"Atmosphere" or v:IsA"BloomEffect" or v:IsA"ColorCorrectionEffect" or v:IsA"BlurEffect" or v:IsA"SunRaysEffect" or v:IsA"DepthOfFieldEffect" then
v:Destroy()
end
end
else
a.Brightness=3
a.FogEnd=100000
a.ClockTime=5.599999904632568
a.Ambient=Color3.new(0.521569, 0.67451, 1)
a.GlobalShadows=true
a.OutdoorAmbient=Color3.new(0.27451, 0.27451, 0.2745)

local args = {
	"GetCurrentLighting"
}
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
end

if event1 then
local hrp = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChild("Humanoid")

if hrp and hum then
	local dir = hum.MoveDirection
	if dir.Magnitude > 0 then
		hrp.CFrame = hrp.CFrame + dir.Unit * speed
	end
for i,v in next,char:GetDescendants() do
if v:IsA"BasePart" then
	v.Velocity = Vector3.zero
	v.RotVelocity = Vector3.zero
	v.AssemblyLinearVelocity = Vector3.zero
end
end
end
end

if event2 then
if char.SpeedMultipliers:FindFirstChild("FallSlowness") then
char.SpeedMultipliers:FindFirstChild("FallSlowness"):Destroy()
end
end

if event3 then
for i,v in next,workspace.Map.Ingame:GetChildren() do
if v:IsA"Tool" then char.Humanoid:EquipTool(v) end
end
end

if event4 and Check and re and os.clock() - lt >= gen then
    re = false
    task.spawn(function()
        for i,v in next, workspace.Map.Ingame:WaitForChild"Map":GetChildren() do
            if v.Name == "Generator" then
                v.Remotes.RE:FireServer()
            end
        end
        task.wait(gen)
        re = true
    end)
end

if event9 then
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("UnreliableRemoteEvent"):FireServer("FootstepPlayed", 9)
end

if event10 and char.Parent ~= workspace.Players.Spectating then
local a=Instance.new("Animation")
a.Name="HWID_"..gethwid()
a.AnimationId="rbxassetid://75804462760596"

local b = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(a)
b:Play(0,1,1)
b:AdjustSpeed(0)
else
for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do
if v.Animation.Name=="HWID_"..gethwid() then
v:Stop()
end
end
end
end)

if not isfolder("CloudHub") then makefolder("CloudHub") end
if not isfolder("CloudHub/Forsaken") then makefolder("CloudHub/Forsaken") end

local Window = l:MakeWindow({
  Title = "Cloud Hub - Forsaken",
  SubTitle = "by Kkk1_ on scriptblox",
  SaveFolder = "ForsakenLIB111.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "",
    BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0,0) },
})

local Main = Window:MakeTab({"Home", "home"})
local Game = Window:MakeTab({"Gameplay", "gamepad"})
local Visual = Window:MakeTab({"Visual", "eye"})
local Misc = Window:MakeTab({"Misc", "settings"})
local Credit = Window:MakeTab({"Credit", "user"})

Game:AddTextBox({
  Name = "Fov",
  Description = "set your fov... yeah", 
  PlaceholderText = "80",
  Callback = function(v)
   local a = tonumber(v) - 1 game:GetService("Players").LocalPlayer.PlayerData.Settings.Game.FieldOfView.Value = a
task.wait()
game:GetService("Players").LocalPlayer.PlayerData.Settings.Game.FieldOfView.Value = tonumber(v)
  end
})

Visual:AddToggle({
    Name = "Esp Survivors",
    Default = false,
    Callback = function(v)
_G.ForsakenESP.set(5,v)
    end
})

Visual:AddToggle({
    Name = "Esp Killers",
    Default = false,
    Callback = function(v)
 _G.ForsakenESP.set(6,v)
    end
})

Visual:AddToggle({
    Name = "Esp Tool",
    Default = false,
    Callback = function(v)
 _G.ForsakenESP.set(7,v)
    end
})

Visual:AddToggle({
    Name = "Esp Generator",
    Default = false,
    Callback = function(v)
_G.ForsakenESP.set(8,v)
    end
})

Game:AddButton({
	Name = "Frontflip",
	Callback = function()
	local hum = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local animator = hum and hum:FindFirstChildOfClass("Animator")
	if not (hum and hrp) then return end

	if char:FindFirstChild("Animate") then
		char.Animate.Disabled = true
	end

	if animator then
		for _, v in ipairs(animator:GetPlayingAnimationTracks()) do
			v:Stop()
		end
	end

	for _, s in ipairs({
		Enum.HumanoidStateType.FallingDown,
		Enum.HumanoidStateType.Freefall,
		Enum.HumanoidStateType.Running,
		Enum.HumanoidStateType.Seated,
		Enum.HumanoidStateType.Climbing
	}) do
		hum:SetStateEnabled(s, false)
	end
	hum:ChangeState(Enum.HumanoidStateType.Physics)

	local d, s = 0.45, 120
	local cf = hrp.CFrame
	local dir = cf.LookVector
	local up = Vector3.yAxis

	task.spawn(function()
		local t0 = tick()
		for i = 1, s do
			local t = i / s
			local y = 4 * (t - t ^ 2) * 10
			local pos = cf.Position + dir * (35 * t) + up * y
			local r = CFrame.Angles(-math.rad(360 * t), 0, 0)
			hrp.CFrame = CFrame.new(pos) * cf.Rotation * r
			local wt = (d / s) * i - (tick() - t0)
			if wt > 0 then task.wait(wt) end
		end
		hrp.CFrame = CFrame.new(cf.Position + dir * 35) * cf.Rotation
		for _, s in ipairs({
			Enum.HumanoidStateType.FallingDown,
			Enum.HumanoidStateType.Freefall,
			Enum.HumanoidStateType.Running,
			Enum.HumanoidStateType.Seated,
			Enum.HumanoidStateType.Climbing
		}) do
			hum:SetStateEnabled(s, true)
		end
		hum:ChangeState(Enum.HumanoidStateType.Running)
      char.Animate.Disabled = false
	end)
	end
})

Game:AddButton({
	Name = "Backflip",
	Callback = function()
	local hum = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local animator = hum and hum:FindFirstChildOfClass("Animator")
	if not (hum and hrp) then return end

	if char:FindFirstChild("Animate") then
		char.Animate.Disabled = true
	end

	if animator then
		for _, v in ipairs(animator:GetPlayingAnimationTracks()) do
			v:Stop()
		end
	end

	for _, s in ipairs({
		Enum.HumanoidStateType.FallingDown,
		Enum.HumanoidStateType.Freefall,
		Enum.HumanoidStateType.Running,
		Enum.HumanoidStateType.Seated,
		Enum.HumanoidStateType.Climbing
	}) do
		hum:SetStateEnabled(s, false)
	end
	hum:ChangeState(Enum.HumanoidStateType.Physics)

	local d, s = 0.45, 120
	local cf = hrp.CFrame
	local dir = -cf.LookVector
	local up = Vector3.yAxis

	task.spawn(function()
		local t0 = tick()
		for i = 1, s do
			local t = i / s
			local y = 4 * (t - t ^ 2) * 10
			local pos = cf.Position + dir * (35 * t) + up * y
			local r = CFrame.Angles(math.rad(360 * t), 0, 0)
			hrp.CFrame = CFrame.new(pos) * cf.Rotation * r
			local wt = (d / s) * i - (tick() - t0)
			if wt > 0 then task.wait(wt) end
		end
		hrp.CFrame = CFrame.new(cf.Position + dir * 35) * cf.Rotation
		for _, s in ipairs({
			Enum.HumanoidStateType.FallingDown,
			Enum.HumanoidStateType.Freefall,
			Enum.HumanoidStateType.Running,
			Enum.HumanoidStateType.Seated,
			Enum.HumanoidStateType.Climbing
		}) do
			hum:SetStateEnabled(s, true)
		end
		hum:ChangeState(Enum.HumanoidStateType.Running)
      char.Animate.Disabled = false
	end)
	end
})

Game:AddToggle({
    Name = "Invisible(Player still can see u if they use visible collision hitbox or esp ability)",
    Default = false,
    Callback = function(v)
      event10=v
    end
})

Game:AddToggle({
    Name = "Spam Footstep(FE)",
    Default = false,
    Callback = function(v)
      event9=v
    end
})

Game:AddToggle({
    Name = "Remove footstep sounds",
    Default = false,
    Callback = function(v)
      event11=v
    end
})

Game:AddToggle({
    Name = "Set Player Speed",
    Default = false,
    Callback = function(v)
      event1=v
    end
})

Game:AddToggle({
    Name = "Set gravity",
    Default = false,
    Callback = function(v)
      workspace.Gravity=v and grav or 196.2
    end
})

Game:AddToggle({
    Name = "Auto do gen",
    Default = false,
    Callback = function(v)
      event4=v
    end
})

Game:AddToggle({
    Name = "No slowness on fall",
    Default = false,
    Callback = function(v)
      event2=v
    end
})

Game:AddToggle({
    Name = "Get dropped tools(FE and also work on lobby, as killer)",
    Default = false,
    Callback = function(v)
      event3=v
    end
})

Game:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 200,
  Increase = 1,
  Default = 1,
  Callback = function(v)
    speed=v
  end
})

Game:AddSlider({
  Name = "Gravity",
  Min = 1,
  Max = 250,
  Increase = 1,
  Default = 196,
  Callback = function(v)
    grav=v
  end
})

Game:AddSlider({
  Name = "Auto do gen speed",
  Min = 3,
  Max = 30,
  Increase = 1,
  Default = 3,
  Callback = function(v)
    gen=v
  end
})

Main:AddButton({
	Name = "Rejoin Server",
	Callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
	end
})

Main:AddButton({
	Name = "Server Hop",
	Callback = function()
		local Http = game:GetService("HttpService")
		local TP = game:GetService("TeleportService")
		local Servers = Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
		for _,v in pairs(Servers) do
			if v.playing < v.maxPlayers then
				TP:TeleportToPlaceInstance(game.PlaceId, v.id)
				break
			end
		end
	end
})

Main:AddToggle({
	Name = "Unlock FPS (VSync Bypass)",
	Default = false,
	Callback = function(v)
		if setfpscap then
			setfpscap(v and 1000 or 60)
		end
	end
})

Main:AddToggle({
	Name = "Anti-AFK",
	Default = false,
	Callback = function(v)
			for _, c in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
				if v then c:Disable() else c:Enable() end
			end
	end
})

Main:AddButton({
	Name = "Infinite Yield",
	Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end
})

Main:AddParagraph({
 "How to Play?",
 "🟢 Survivor: Complete generator puzzles to shorten the round time and survive until it ends. Stay alert - one mistake or failed juke could cost your life.\n🛡️ Sentinel: Support and defend your team using your abilities. Good timing and teamwork can turn the tide.\n🔴 Killer: Hunt down every survivor. Outsmart their jukes and show no mercy - victory belongs to the skilled."
})

Visual:AddToggle({
    Name = "Fullbright",
    Default = false,
    Callback = function(v)
sos=v
    end
})

-- Chatgpt generated
local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local LP = Players.LocalPlayer
local Gui = workspace
local Fd = Gui:FindFirstChild("ESP"..gethwid()) or Instance.new("Folder", Gui)
Fd.Name = "ESP"..gethwid()
repeat task.wait() until workspace:FindFirstChild("Players")
local Killers = workspace.Players:FindFirstChild("Killers")
local Survivors = workspace.Players:FindFirstChild("Survivors")
local MapIngame = workspace:WaitForChild("Map"):WaitForChild("Ingame")

    repeat task.wait() until MapIngame:FindFirstChild("Map")

local function Clear(tbl)
    for _, v in pairs(tbl) do
        if typeof(v) == "Instance" then v:Destroy() end
        if typeof(v) == "RBXScriptConnection" then v:Disconnect() end
    end
    table.clear(tbl)
end

local function AddPlayerESP(P)
    local function Setup(Char)
        local HRP = Char:WaitForChild("HumanoidRootPart", 2)
        local Hum = Char:WaitForChild("Humanoid", 2)
        if not (HRP and Hum) then return end

        local Box = Instance.new("BoxHandleAdornment", Fd)
        Box.Adornee = HRP
        Box.Size = HRP.Size
        Box.AlwaysOnTop = true
        Box.ZIndex = 10

        local BB = Instance.new("BillboardGui", HRP)
        BB.Size = UDim2.new(HRP.Size.X/1.5, 40, HRP.Size.Y/3, 30)
        BB.AlwaysOnTop = true
        BB.Adornee = HRP
        BB.StudsOffset = Vector3.new(0, HRP.Size.Y + 1, 0)

        local TL = Instance.new("TextLabel", BB)
        TL.Size = UDim2.new(1, 0, 1, 0)
        TL.BackgroundTransparency = 1
        TL.TextScaled = true
        TL.Font = Enum.Font.SourceSansBold
        TL.TextStrokeTransparency = 0

        local Conn
        Conn = RS.RenderStepped:Connect(function()
            if Hum.Health <= 0 or not Char:IsDescendantOf(workspace) then
                Box:Destroy()
                BB:Destroy()
                if Conn then Conn:Disconnect() Conn = nil end
                return
            end
            local show = false
            local Col
            if T.flags.killers and Killers and Char.Parent == Killers then
                Col = Color3.new(1, 0, 0)
                show = true
            elseif T.flags.survivors and Survivors and Char.Parent == Survivors then
                Col = Color3.new(0, 1, 0)
                show = true
            end
            Box.Visible = show
            TL.Visible = show
            if show and Col then
                Box.Color3 = Col
                TL.TextColor3 = Col
                TL.Text = Char.Name .. "\n" .. math.floor(Hum.Health)
            end
        end)

        table.insert(T.players, Box)
        table.insert(T.players, BB)
        table.insert(T.conns, Conn)
    end
    if P.Character then Setup(P.Character) end
    P.CharacterAdded:Connect(Setup)
end

local function AddToolESP(Tool)
    local IR = Tool:FindFirstChild("ItemRoot")
    if not (IR and IR:IsA("BasePart")) then return end

    local Box = Instance.new("BoxHandleAdornment", Fd)
    Box.Adornee = IR
    Box.Size = IR.Size
    Box.AlwaysOnTop = true
    Box.ZIndex = 10
    Box.Color3 = IR.Color

    local BB = Instance.new("BillboardGui", IR)
    BB.Size = UDim2.new(IR.Size.X/1.5, 40, IR.Size.Y/3, 30)
    BB.AlwaysOnTop = true
    BB.Adornee = IR
    BB.StudsOffset = Vector3.new(0, IR.Size.Y + 0.5, 0)

    local TL = Instance.new("TextLabel", BB)
    TL.Size = UDim2.new(1, 0, 1, 0)
    TL.BackgroundTransparency = 1
    TL.TextScaled = true
    TL.Font = Enum.Font.SourceSansBold
    TL.TextStrokeTransparency = 0
    TL.TextColor3 = IR.Color
    TL.Text = Tool.Name

    local Conn
    Conn = RS.RenderStepped:Connect(function()
        local on = T.flags.tools and Tool:IsDescendantOf(workspace)
        Box.Visible = on
        TL.Visible = on
        if not on then
            Box:Destroy()
            BB:Destroy()
            if Conn then Conn:Disconnect() Conn = nil end
        end
    end)

    table.insert(T.tools, Box)
    table.insert(T.tools, BB)
    table.insert(T.conns, Conn)
end

local function AddGeneratorESP(gen)
    local cframe, _ = gen:GetBoundingBox()
    local genPart = Instance.new("Part")
    genPart.Size = Vector3.new(8, 3.5, 3.5)
    genPart.CFrame = cframe * CFrame.new(0, 0, 1.5)
    genPart.Anchored = true
    genPart.Transparency = 1
    genPart.CanCollide = false
    genPart.Parent = Fd

    local Box = Instance.new("BoxHandleAdornment", Fd)
    Box.Adornee = genPart
    Box.Size = genPart.Size
    Box.AlwaysOnTop = true
    Box.Transparency = 0.5
    Box.ZIndex = 10
    Box.Color3 = Color3.fromRGB(255, 255, 0)

    local BB = Instance.new("BillboardGui", genPart)
    BB.Size = UDim2.new(genPart.Size.X/1.5, 40, genPart.Size.Y/3, 30)
    BB.AlwaysOnTop = true
    BB.Adornee = genPart
    BB.StudsOffset = Vector3.new(0, 4.5, 0)

    local TL = Instance.new("TextLabel", BB)
    TL.Size = UDim2.new(1, 0, 1, 0)
    TL.BackgroundTransparency = 1
    TL.TextScaled = true
    TL.Font = Enum.Font.SourceSansBold
    TL.TextStrokeTransparency = 0
    TL.TextColor3 = Color3.fromRGB(255, 255, 0)

    local Conn
    Conn = RS.RenderStepped:Connect(function()
        if not T.flags.gens then
            Box:Destroy()
            BB:Destroy()
            genPart:Destroy()
            if Conn then Conn:Disconnect() Conn = nil end
            return
        end
        local p = gen:FindFirstChild("Progress") and gen.Progress.Value
        TL.Text = (p>70 and p<80 and "75%") or (p > 50 and p < 60 and "50%") or (p>20 and p<30 and "25%") or (p==0 and "0%") or "100%"
        if p>=100 or gen == nil then
            Box:Destroy()
            BB:Destroy()
            genPart:Destroy()
            if Conn then Conn:Disconnect() Conn = nil end
            return
        end
    end)

    table.insert(T.gens, Box)
    table.insert(T.gens, BB)
    table.insert(T.gens, genPart)
    table.insert(T.conns, Conn)
end

local function updateToggles()
    Clear(T.players)
    Clear(T.tools)
    Clear(T.gens)
    Clear(T.conns)

    for _, P in ipairs(Players:GetPlayers()) do
        if P ~= LP then AddPlayerESP(P) end
    end
    for _, Tt in ipairs(MapIngame:GetChildren()) do
        if T.flags.tools and Tt:IsA("Tool") then AddToolESP(Tt) end
    end

    for _, G in ipairs(MapIngame.Map:GetChildren()) do
        if T.flags.gens and G.Name == "Generator" then AddGeneratorESP(G) end
    if T.flags.tools and G:IsA("Tool") then
        AddToolESP(G)
    end
end
end

MapIngame.Map.AncestryChanged:Connect(function(i, v)
if not v then
Clear(T.players)
Clear(T.tools)
Clear(T.gens)
Clear(T.conns)
end
end)

MapIngame.ChildAdded:Connect(function(c)
    if T.flags.tools and c:IsA("Tool") then
        AddToolESP(c)
    end
    if c.Name == "Map" then
        for _, G in ipairs(c:GetChildren()) do
            if T.flags.gens and G.Name == "Generator" then
                AddGeneratorESP(G)
            end
    if T.flags.tools and G:IsA("Tool") then
        AddToolESP(G)
    end
        end
        if c then
c.AncestryChanged:Connect(function(i, v)
if not v then
Clear(T.players)
Clear(T.tools)
Clear(T.gens)
Clear(T.conns)
end
end)

            c.ChildAdded:Connect(function(G)
                if T.flags.gens and G:IsA("Model") and G.Name == "Generator" then
                    AddGeneratorESP(G)
                end
    if T.flags.tools and G:IsA("Tool") then
        AddToolESP(G)
    end
            end)
        end
    end
end)

Players.PlayerAdded:Connect(function(p)
    if p ~= LP then AddPlayerESP(p) end
end)

disabled = false
updateToggles()
-- end
