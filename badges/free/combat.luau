local queue_on_teleport = queue_on_teleport or queueonteleport or syn and syn.queue_on_teleport or fluxus and fluxus.queue_on_teleport

local script = [[
local tps = game:GetService("TeleportService")
local rs = game:GetService("ReplicatedStorage")
local runs = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local plrs = game.Players
local StarterGui = game:GetService("StarterGui")
local lp = plrs.LocalPlayer

local function body(plr)
    plr = lp or plr
    return plr.Character, plr.Character:FindFirstChild("HumanoidRootPart"), plr.Character:FindFirstChild("Humanoid")
end

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5,
        })
    end)
end

local subplace = tonumber("109531711255421")
if game.PlaceId ~= subplace then
    notify("Teleporting", "Teleporting to another experience. Make sure you've already disabled 'Verify Teleport', or it won't work.", 8)
    if queue_on_teleport then
        pcall(queue_on_teleport, script)
    end
    tps:Teleport(subplace)
    task.wait(8)
    lp:Kick("Cannot teleport.\nDisable 'Verify Teleport' while not having any script executed if you're using Delta.")
    return
end

notify("Script Executed", "Script executed. Wait 5 minutes to get the combat badge!", 8)

local ANCHOR_POS = Vector3.new(-70, 61, -57)
local MAX_DIST = 180
local OFFSET_RANGE = 0.5
local Y_OFFSET = 0.5

local function setTransparency(alpha)
    if not lp.Character then return end
    for _, part in ipairs(lp.Character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Transparency = alpha
        elseif part:IsA("Decal") then
            part.Transparency = alpha
        end
    end
end

setTransparency(1)

task.spawn(function()
    while task.wait() do
        if lp.CameraMode ~= Enum.CameraMode.Classic then
            lp.CameraMode = Enum.CameraMode.Classic
        end
    end
end)

while task.wait() do
    local originalCFrame = lp.Character and lp.Character.HumanoidRootPart.CFrame
    local foundEnemy = false

    for i, v in pairs(workspace.Enemies:GetChildren()) do
        if not (v and v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart")) then
            continue
        end
        if v.Humanoid.Health <= 0 then continue end
        if v.HumanoidRootPart.CFrame.Y < 40 then continue end
        if (v.HumanoidRootPart.Position - ANCHOR_POS).Magnitude > MAX_DIST then continue end

        foundEnemy = true
        setTransparency(1)

        while v and v.Parent
            and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0
            and v:FindFirstChild("HumanoidRootPart")
            and v.HumanoidRootPart.CFrame.Y >= 40
            and (v.HumanoidRootPart.Position - ANCHOR_POS).Magnitude <= MAX_DIST
            and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") do
            local offset = Vector3.new(
                (math.random() - 0.5) * 2 * OFFSET_RANGE,
                Y_OFFSET,
                (math.random() - 0.5) * 2 * OFFSET_RANGE
            )
            local spin = CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), 0)
            lp.Character:PivotTo(v.HumanoidRootPart.CFrame * CFrame.new(offset) * spin)
            lp.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1000, -50, 0)
            task.wait()
        end

        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and originalCFrame then
            lp.Character:PivotTo(originalCFrame)
            lp.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        end
    end

    if not foundEnemy then
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character:PivotTo(CFrame.new(ANCHOR_POS))
            lp.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
        end
    end
end
]]

if queue_on_teleport then
    pcall(queue_on_teleport, script)
end

local fn = loadstring and loadstring(script) or load(script)
if fn then
    fn()
end
