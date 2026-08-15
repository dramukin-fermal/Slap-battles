game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Credit",Text = "Scripted by @indiffrence guy.",Icon = "rbxassetid://7733658504",Duration = 2})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local function PlrHasGlove(Name)
	if game.Players.LocalPlayer.leaderstats.Glove.Value == Name then
		return true
	end
	fireclickdetector(workspace.Lobby[Name].ClickDetector)
	wait(.5)
	if game.Players.LocalPlayer.leaderstats.Glove.Value == Name then
		return true
	end
	return false
end

local function enterArena()
	repeat task.wait() 
		firetouchinterest(LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
		firetouchinterest(LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
	until LocalPlayer.Character:FindFirstChild("isInArena") and game.Players.LocalPlayer.Character:FindFirstChild("isInArena").Value == true 
end
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("isInArena") and game.Players.LocalPlayer.Character:FindFirstChild("isInArena").Value == true then
	if LocalPlayer.leaderstats.Glove.Value ~= "Doorkeeper" then
		LocalPlayer.Character.Humanoid.Health = 0
		wait(4)
		if not PlrHasGlove("Doorkeeper") then
			game.Players.LocalPlayer:Kick("doorkeeper missing")
		end
	end
else
	if not PlrHasGlove("Doorkeeper") then
		LocalPlayer:Kick("doorkeeper missing")
	end
	enterArena()
end


local function placeDoor(pos, safe)
	spawn(function()
		local st = tick()
		local old = game.Players.LocalPlayer.Character:GetPivot()
		while tick() - st < .7 do
			LocalPlayer.Character:PivotTo(pos * CFrame.new(0,10,0))
			LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
			task.wait()
		end
		LocalPlayer.Character:PivotTo(old)
	end)
	wait(.6)
	local pos2 = safe and (pos * CFrame.Angles(math.rad(-90),0,0)) or pos
	ReplicatedStorage:FindFirstChild("GeneralAbility"):FireServer(pos2)
	wait(.1)
end

local gui = Instance.new("ScreenGui")
gui.Name = "donjosx Doorkeeper"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game.CoreGui

local places = {
    ["Arena"] = workspace.Origo:GetPivot(),
    ["[REDACTED] Dimesion"] = workspace.PocketDimension.Spawnlocation:GetPivot(),
    ["[REDACTED] Upper"] = workspace.PocketDimension.Spawnlocation:GetPivot() * CFrame.new(0,50,0),
    ["Debug Room"] = workspace["Debug Room"].Manhole:GetPivot() * CFrame.new(0,5,0),
    ["Debug Room Upper"] = workspace["Debug Room"].Manhole:GetPivot() * CFrame.new(0,50,0),
    ["Debug Room Maze"] = workspace["Debug Room"].Maze.MazePrize:GetPivot(),
    ["Retro Bridge"] = CFrame.new(-27809, 168, 4834),
    ["Jail Room"] = CFrame.new(17863, -129, -3547),
    ["Hitman Upper"] = CFrame.new(17893, -15, -3564),
    ["Hitman Base"]  = CFrame.new(17896, -112, -3475),
    ["Default Island"] = CFrame.new(-907, 378, -3),
    ["Lobby"] = CFrame.new(-907, 320, -3),
    ["RepressedMemories"] = workspace.RepressedMemories.Portal:GetPivot() * CFrame.new(0,30,0),
    ["Emote Room"] = game:GetService("Workspace").BoogieShop.Building.roof:GetPivot() * CFrame.new(0,-5,0),
    ["Kick"] = CFrame.new(17945, -130, -3540),
    ["Sky"] = CFrame.new(0,10000,0),
    ["Sky But Higher"] = CFrame.new(0,10000000,0),
    ["Your Position"] = CFrame.new(0,0,0),
}
spawn(function()
	pcall(function()
		while wait() do
			fireclickdetector(workspace.FinishDoor_Retro.button.ClickDetector)
		end
	end)
end)

local applyAll = false
local applyOthers = false
local targetInput = ""
local selectedPlace = nil
local dropdownOpen = false
local minimized = false

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.2, 0, 0.45, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BorderColor3 = Color3.new(0, 0, 0)
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true
main.Parent = gui


local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0.141, 0)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.new(0, 0, 0)
titleBar.BorderSizePixel = 0
titleBar.Parent = main

local titleText = Instance.new("TextLabel")
titleText.BackgroundTransparency = 1
titleText.Size = UDim2.new(0.72, 0, 1, 0)
titleText.Position = UDim2.new(0.025, 0, 0, 0)
titleText.Text = "Doorkeeper abuser"
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Font = Enum.Font.SourceSansBold
titleText.TextScaled = true
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0.1, 0, 0.83, 0)
minimizeBtn.Position = UDim2.new(0.78, 0, 0.085, 0)
minimizeBtn.BackgroundColor3 = Color3.new(1, 1, 1)
minimizeBtn.BorderColor3 = Color3.new(0, 0, 0)
minimizeBtn.BorderSizePixel = 1
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextScaled = true
minimizeBtn.TextColor3 = Color3.new(0, 0, 0)
minimizeBtn.Parent = titleBar

local destroyBtn = Instance.new("TextButton")
destroyBtn.Size = UDim2.new(0.1, 0, 0.83, 0)
destroyBtn.Position = UDim2.new(0.895, 0, 0.085, 0)
destroyBtn.BackgroundColor3 = Color3.new(1, 1, 1)
destroyBtn.BorderColor3 = Color3.new(0, 0, 0)
destroyBtn.BorderSizePixel = 1
destroyBtn.Text = "X"
destroyBtn.Font = Enum.Font.SourceSansBold
destroyBtn.TextScaled = true
destroyBtn.TextColor3 = Color3.new(0, 0, 0)
destroyBtn.Parent = titleBar

destroyBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local body = Instance.new("Frame")
body.Name = "Body"
body.Size = UDim2.new(1, 0, 0.859, 0)
body.Position = UDim2.new(0, 0, 0.141, 0)
body.BackgroundTransparency = 1
body.Parent = main

local targetLabel = Instance.new("TextLabel")
targetLabel.BackgroundTransparency = 1
targetLabel.Size = UDim2.new(0.927, 0, 0.094, 0)
targetLabel.Position = UDim2.new(0.036, 0, 0.035, 0)
targetLabel.Text = "Target username:"
targetLabel.Font = Enum.Font.SourceSans
targetLabel.TextScaled = true
targetLabel.TextColor3 = Color3.new(0, 0, 0)
targetLabel.TextXAlignment = Enum.TextXAlignment.Left
targetLabel.Parent = body

local targetBox = Instance.new("TextBox")
targetBox.Size = UDim2.new(0.927, 0, 0.129, 0)
targetBox.Position = UDim2.new(0.036, 0, 0.129, 0)
targetBox.BackgroundColor3 = Color3.new(1, 1, 1)
targetBox.BorderColor3 = Color3.new(0, 0, 0)
targetBox.BorderSizePixel = 1
targetBox.Text = ""
targetBox.PlaceholderText = "input target username"
targetBox.Font = Enum.Font.SourceSans
targetBox.TextScaled = true
targetBox.TextColor3 = Color3.new(0, 0, 0)
targetBox.ClearTextOnFocus = true
targetBox.Parent = body

targetBox:GetPropertyChangedSignal("Text"):Connect(function()
    targetInput = targetBox.Text
end)

local dropdownLabel = Instance.new("TextLabel")
dropdownLabel.BackgroundTransparency = 1
dropdownLabel.Size = UDim2.new(0.927, 0, 0.094, 0)
dropdownLabel.Position = UDim2.new(0.036, 0, 0.282, 0)
dropdownLabel.Text = "Place:"
dropdownLabel.Font = Enum.Font.SourceSans
dropdownLabel.TextScaled = true
dropdownLabel.TextColor3 = Color3.new(0, 0, 0)
dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
dropdownLabel.Parent = body

local dropdownBtn = Instance.new("TextButton")
dropdownBtn.Size = UDim2.new(0.927, 0, 0.129, 0)
dropdownBtn.Position = UDim2.new(0.036, 0, 0.376, 0)
dropdownBtn.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownBtn.BorderColor3 = Color3.new(0, 0, 0)
dropdownBtn.BorderSizePixel = 1
dropdownBtn.Text = "-- Select place --"
dropdownBtn.Font = Enum.Font.SourceSans
dropdownBtn.TextScaled = true
dropdownBtn.TextColor3 = Color3.new(0, 0, 0)
dropdownBtn.Parent = body

local dropdownFrame = Instance.new("Frame")
dropdownFrame.Name = "DropdownFrame"
dropdownFrame.Size = UDim2.new(0.927, 0, 0.475, 0)
dropdownFrame.Position = UDim2.new(0.036, 0, 0.517, 0)
dropdownFrame.BackgroundColor3 = Color3.new(0, 0, 0)
dropdownFrame.BorderSizePixel = 0
dropdownFrame.Visible = false
dropdownFrame.ZIndex = 10
dropdownFrame.Parent = body

local dropdownList = Instance.new("ScrollingFrame")
dropdownList.Name = "ScrollingFrame"
dropdownList.Size = UDim2.new(0.94, 0, 0.9, 0)
dropdownList.Position = UDim2.new(0.03, 0, 0.05, 0)
dropdownList.BackgroundColor3 = Color3.new(1, 1, 1)
dropdownList.BorderSizePixel = 0
dropdownList.ZIndex = 11
dropdownList.ScrollBarThickness = 1
dropdownList.ScrollBarImageTransparency = 1
dropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdownList.AutomaticCanvasSize = Enum.AutomaticSize.Y
dropdownList.ScrollingDirection = Enum.ScrollingDirection.Y
dropdownList.Parent = dropdownFrame

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0.01, 0)
listLayout.Parent = dropdownList

local listPadding = Instance.new("UIPadding")
listPadding.PaddingTop = UDim.new(0.02, 0)
listPadding.PaddingBottom = UDim.new(0.02, 0)
listPadding.PaddingLeft = UDim.new(0.01, 0)
listPadding.PaddingRight = UDim.new(0.01, 0)
listPadding.Parent = dropdownList

local placeNames = {}

for name in pairs(places) do
    table.insert(placeNames, name)
end

table.sort(placeNames)

for index, name in ipairs(placeNames) do
    local optionBtn = Instance.new("TextButton")
    optionBtn.Name = "Option_" .. index
    optionBtn.Size = UDim2.new(0.98, 0, 0, 20)
    optionBtn.BackgroundColor3 = Color3.new(1, 1, 1)
    optionBtn.BorderColor3 = Color3.new(0, 0, 0)
    optionBtn.BorderSizePixel = 1
    optionBtn.Text = name
    optionBtn.Font = Enum.Font.SourceSans
    optionBtn.TextScaled = true
    optionBtn.TextColor3 = Color3.new(0, 0, 0)
    optionBtn.ZIndex = 12
    optionBtn.Parent = dropdownList

    optionBtn.MouseButton1Click:Connect(function()
        selectedPlace = name
        dropdownBtn.Text = name
        dropdownFrame.Visible = false
        dropdownOpen = false
    end)
end

dropdownBtn.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    dropdownFrame.Visible = dropdownOpen
end)

local toggleOthersFrame = Instance.new("Frame")
toggleOthersFrame.Size = UDim2.new(0.927, 0, 0.129, 0)
toggleOthersFrame.Position = UDim2.new(0.036, 0, 0.53, 0)
toggleOthersFrame.BackgroundTransparency = 1
toggleOthersFrame.Parent = body

local toggleOthersLabel = Instance.new("TextLabel")
toggleOthersLabel.BackgroundTransparency = 1
toggleOthersLabel.Size = UDim2.new(0.78, 0, 1, 0)
toggleOthersLabel.Text = "Apply Others"
toggleOthersLabel.Font = Enum.Font.SourceSans
toggleOthersLabel.TextScaled = true
toggleOthersLabel.TextColor3 = Color3.new(0, 0, 0)
toggleOthersLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleOthersLabel.Parent = toggleOthersFrame

local toggleOthersBtn = Instance.new("TextButton")
toggleOthersBtn.Size = UDim2.new(0.105, 0, 0.95, 0)
toggleOthersBtn.Position = UDim2.new(0.895, 0, 0.025, 0)
toggleOthersBtn.BackgroundColor3 = Color3.new(1, 1, 1)
toggleOthersBtn.BorderColor3 = Color3.new(0, 0, 0)
toggleOthersBtn.BorderSizePixel = 1
toggleOthersBtn.Text = ""
toggleOthersBtn.Parent = toggleOthersFrame

local toggleOthersFill = Instance.new("Frame")
toggleOthersFill.Size = UDim2.new(0.7, 0, 0.7, 0)
toggleOthersFill.Position = UDim2.new(0.15, 0, 0.15, 0)
toggleOthersFill.BackgroundColor3 = Color3.new(0, 0, 0)
toggleOthersFill.BorderSizePixel = 0
toggleOthersFill.Visible = false
toggleOthersFill.Parent = toggleOthersBtn

local toggleFrame = Instance.new("Frame")
toggleFrame.Size = UDim2.new(0.927, 0, 0.129, 0)
toggleFrame.Position = UDim2.new(0.036, 0, 0.665, 0)
toggleFrame.BackgroundTransparency = 1
toggleFrame.Parent = body

local toggleLabel = Instance.new("TextLabel")
toggleLabel.BackgroundTransparency = 1
toggleLabel.Size = UDim2.new(0.78, 0, 1, 0)
toggleLabel.Text = "Apply All"
toggleLabel.Font = Enum.Font.SourceSans
toggleLabel.TextScaled = true
toggleLabel.TextColor3 = Color3.new(0, 0, 0)
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
toggleLabel.Parent = toggleFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.105, 0, 0.95, 0)
toggleBtn.Position = UDim2.new(0.895, 0, 0.025, 0)
toggleBtn.BackgroundColor3 = Color3.new(1, 1, 1)
toggleBtn.BorderColor3 = Color3.new(0, 0, 0)
toggleBtn.BorderSizePixel = 1
toggleBtn.Text = ""
toggleBtn.Parent = toggleFrame

local toggleFill = Instance.new("Frame")
toggleFill.Size = UDim2.new(0.7, 0, 0.7, 0)
toggleFill.Position = UDim2.new(0.15, 0, 0.15, 0)
toggleFill.BackgroundColor3 = Color3.new(0, 0, 0)
toggleFill.BorderSizePixel = 0
toggleFill.Visible = false
toggleFill.Parent = toggleBtn

toggleBtn.MouseButton1Click:Connect(function()
    applyAll = not applyAll
    toggleFill.Visible = applyAll

    if applyAll and applyOthers then
        applyOthers = false
        toggleOthersFill.Visible = false
    end
end)

toggleOthersBtn.MouseButton1Click:Connect(function()
    applyOthers = not applyOthers
    toggleOthersFill.Visible = applyOthers

    if applyOthers and applyAll then
        applyAll = false
        toggleFill.Visible = false
    end
end)

local bringBtn = Instance.new("TextButton")
bringBtn.Size = UDim2.new(0.927, 0, 0.153, 0)
bringBtn.Position = UDim2.new(0.036, 0, 0.83, 0)
bringBtn.BackgroundColor3 = Color3.new(0, 0, 0)
bringBtn.BorderColor3 = Color3.new(0, 0, 0)
bringBtn.BorderSizePixel = 1
bringBtn.Text = "Teleport"
bringBtn.Font = Enum.Font.SourceSansBold
bringBtn.TextScaled = true
bringBtn.TextColor3 = Color3.new(1, 1, 1)
bringBtn.Parent = body

local function findPlayersByInput(input)
    input = input:lower():gsub("^%s+", ""):gsub("%s+$", "")

    if input == "" then
        return {}
    end

    local results = {}

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower() == input or plr.DisplayName:lower() == input then
            table.insert(results, plr)
        end
    end

    if #results > 0 then
        return results
    end

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(input, 1, true) or plr.DisplayName:lower():find(input, 1, true) then
            table.insert(results, plr)
        end
    end

    return results
end

targetBox.FocusLost:Connect(function(enterPressed)
    local raw = targetBox.Text

    if raw == "" then
        return
    end

    local found = findPlayersByInput(raw)

    if #found == 0 then
        return
    end

    local match = found[1]
    targetBox.Text = match.Name
    targetInput = match.Name
end)

local function bringPlayer(plr, cframe)
    local char = plr.Character

    if not char then
        return
    end

    local hrp = char:FindFirstChild("HumanoidRootPart")

    if hrp then
		pcall(function() ReplicatedStorage.GeneralHit:FireServer(hrp) end)
    end
end

bringBtn.MouseButton1Click:Connect(function()
    if not selectedPlace then
        return
    end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("isInArena") and game.Players.LocalPlayer.Character:FindFirstChild("isInArena").Value == true then
		if LocalPlayer.leaderstats.Glove.Value ~= "Doorkeeper" then
			LocalPlayer.Character.Humanoid.Health = 0
			wait(4)
			if not PlrHasGlove("Doorkeeper") then
				game.Players.LocalPlayer:Kick("doorkeeper missing")
			end
		end
	end
    enterArena()
    local cframe = places[selectedPlace]
    if selectedPlace == "Your Position" then 
	    cframe = LocalPlayer.Character and LocalPlayer.Character:GetPivot() or CFrame.new(0,0,0)
    end
	placeDoor(cframe, selectedPlace ~= "Kick")
	
    if applyAll then
        for _, plr in ipairs(Players:GetPlayers()) do
            bringPlayer(plr, cframe)
        end
    elseif applyOthers then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                bringPlayer(plr, cframe)
            end
        end
    else
        local found = findPlayersByInput(targetInput)

        if #found == 0 then
            return
        end

        for _, plr in ipairs(found) do
            bringPlayer(plr, cframe)
        end
    end
end)

minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        body.Visible = false
        main.Size = UDim2.new(0.2, 0, 0.05, 0)
        titleBar.Size = UDim2.new(1, 0, 1, 0)
        minimizeBtn.Text = "+"
    else
        main.Size = UDim2.new(0.2, 0, 0.45, 0)
        titleBar.Size = UDim2.new(1, 0, 0.14, 0)
        body.Visible = true
        minimizeBtn.Text = "-"
    end
end)
