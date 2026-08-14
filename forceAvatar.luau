local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer


if not game:IsLoaded() then
    game.Loaded:Wait()
end
if not LocalPlayer.Character then
    LocalPlayer.CharacterAdded:Wait()
end

local character = LocalPlayer.Character
local args = {[1]={["Action"]="WearCommunityOutfit",["OutfitInfo"]={["Created"]=1723260362,["IncludesOffsaleItems"]=false,["Creator"]=121665370,["Tags"]="",["OutfitCode"]=4411131,["Price"]=0,["OutfitInfo"]={["HatAccessory"]="",["MoodAnimation"]=0,["Torso"]=0,["ProportionScale"]=0,["ClimbAnimation"]=0,["FrontAccessory"]="",["FaceAccessory"]="",["RightArmColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["HairAccessory"]="",["RightArm"]=0,["Head"]=0,["FallAnimation"]=0,["TorsoColor"]={["r"]=3,["IsRGBTable"]=true,["g"]=0,["b"]=29},["DepthScale"]=1,["LeftArm"]=0,["HeightScale"]=1.0499999523162842,["WaistAccessory"]="",["LayeredClothing"]={},["RightLegColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["LeftLegColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["JumpAnimation"]=0,["BodyTypeScale"]=0,["RunAnimation"]=0,["LeftArmColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["Pants"]=0,["ShouldersAccessory"]="",["WidthScale"]=1,["LeftLeg"]=0,["HeadColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["RightLeg"]=0,["Shirt"]=0,["NeckAccessory"]="",["WalkAnimation"]=0,["IdleAnimation"]=0,["SwimAnimation"]=0,["HeadScale"]=1,["BackAccessory"]="",["GraphicTShirt"]=0,["Face"]=0},["Id"]="1723260362:121665370",["Items"]={[1]="",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]=0,[10]=0,[11]=0,[12]=0,[13]=0,[14]=0,[15]=0,[16]="0,0,0",[17]="0,0,0",[18]="0,0,0",[19]="0,0,0",[20]="0,0,0",[21]="3,0,29",[22]=0,[23]=0,[24]=0,[25]=0,[26]=0,[27]=0,[28]=0,[29]=0,[30]=0,[31]=0,[32]=0,[33]=1,[34]=1,[35]=1.0499999523162842,[36]=0,[37]=1,[38]={},[39]=0},["RecentTryOns"]=14,["LastUpdated"]=1754512407,["Trys"]=549,["Name"]="free all black outfit",["RigType"]="R6",["RecommendationItemId"]="5633e6f4-4469-43ac-b634-02a1bc4d7c2f",["CommentsDisabled"]=true}}}
local outfitInfo = args[1].OutfitInfo.OutfitInfo

local function match(part, e)
    local c = character[part].Color
    return math.floor(c.r*255+0.5)==e.r and math.floor(c.g*255+0.5)==e.g and math.floor(c.b*255+0.5)==e.b
end

if not (match("Right Arm", outfitInfo.RightArmColor) and match("Left Arm", outfitInfo.LeftArmColor) and match("Torso", outfitInfo.TorsoColor) and match("Head", outfitInfo.HeadColor) and match("Right Leg", outfitInfo.RightLegColor) and match("Left Leg", outfitInfo.LeftLegColor)) then
    if game.PlaceId ~= tonumber("7041939546") then
	    local queue_on_teleport = queueonteleport or queue_on_teleport
		if queue_on_teleport then
	        queue_on_teleport([[
				local Players = game:GetService("Players")
				local LocalPlayer = Players.LocalPlayer
			    local PlayerGui = LocalPlayer.PlayerGui
			    local VIM = game:GetService("VirtualInputManager")
				local StarterGui = game:GetService("StarterGui")
				local TeleportService = game:GetService("TeleportService")
			    local GuiService = game:GetService("GuiService")
				StarterGui:SetCore("SendNotification", {
			        Title = "queue is running",
			        Text = "you're not be able to turn off Delta verify teleport now if you haven't",
			        Duration = 3
			    })
				local ScreenGui = Instance.new("ScreenGui")
				ScreenGui.Name = "TeleportBackGui"
				ScreenGui.ResetOnSpawn = false
				ScreenGui.Parent = PlayerGui
				
				local Button = Instance.new("TextButton")
				Button.Name = "TeleportBackButton"
				Button.Size = UDim2.new(0, 160, 0, 40)
				Button.Position = UDim2.new(0.5, -60, 0, 10)
				Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.Font = Enum.Font.GothamBold
				Button.TextSize = 16
				Button.Text = "Teleport Back"
				Button.Parent = ScreenGui
				
				Button.MouseButton1Click:Connect(function()
				    StarterGui:SetCore("SendNotification", {
				        Title = "Teleporting",
				        Text = "Teleporting to Slap Battles...",
				        Duration = 3
				    })
				    TeleportService:Teleport(tonumber("124596094333302"))
				end)
			    local function clickCenter(button)
			        local pos = button.AbsolutePosition
			        local size = button.AbsoluteSize
			        local inset = GuiService:GetGuiInset()
			        local x = pos.X + size.X / 2
			        local y = pos.Y + size.Y / 2 + inset.Y
			
			        if mousemoveabs then
			            mousemoveabs(x, y)
			            wait(0.05)
			            mouse1press()
			            wait(0.05)
			            mouse1release()
			        else
			            VIM:SendMouseMoveEvent(x, y, game)
			            wait()
			            VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
			            wait()
			            VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
			        end
			    end
				local args = {[1]={["Action"]="WearCommunityOutfit",["OutfitInfo"]={["Created"]=1723260362,["IncludesOffsaleItems"]=false,["Creator"]=121665370,["Tags"]="",["OutfitCode"]=4411131,["Price"]=0,["OutfitInfo"]={["HatAccessory"]="",["MoodAnimation"]=0,["Torso"]=0,["ProportionScale"]=0,["ClimbAnimation"]=0,["FrontAccessory"]="",["FaceAccessory"]="",["RightArmColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["HairAccessory"]="",["RightArm"]=0,["Head"]=0,["FallAnimation"]=0,["TorsoColor"]={["r"]=3,["IsRGBTable"]=true,["g"]=0,["b"]=29},["DepthScale"]=1,["LeftArm"]=0,["HeightScale"]=1.0499999523162842,["WaistAccessory"]="",["LayeredClothing"]={},["RightLegColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["LeftLegColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["JumpAnimation"]=0,["BodyTypeScale"]=0,["RunAnimation"]=0,["LeftArmColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["Pants"]=0,["ShouldersAccessory"]="",["WidthScale"]=1,["LeftLeg"]=0,["HeadColor"]={["r"]=0,["IsRGBTable"]=true,["g"]=0,["b"]=0},["RightLeg"]=0,["Shirt"]=0,["NeckAccessory"]="",["WalkAnimation"]=0,["IdleAnimation"]=0,["SwimAnimation"]=0,["HeadScale"]=1,["BackAccessory"]="",["GraphicTShirt"]=0,["Face"]=0},["Id"]="1723260362:121665370",["Items"]={[1]="",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]=0,[10]=0,[11]=0,[12]=0,[13]=0,[14]=0,[15]=0,[16]="0,0,0",[17]="0,0,0",[18]="0,0,0",[19]="0,0,0",[20]="0,0,0",[21]="3,0,29",[22]=0,[23]=0,[24]=0,[25]=0,[26]=0,[27]=0,[28]=0,[29]=0,[30]=0,[31]=0,[32]=0,[33]=1,[34]=1,[35]=1.0499999523162842,[36]=0,[37]=1,[38]={},[39]=0},["RecentTryOns"]=14,["LastUpdated"]=1754512407,["Trys"]=549,["Name"]="free all black outfit",["RigType"]="R6",["RecommendationItemId"]="5633e6f4-4469-43ac-b634-02a1bc4d7c2f",["CommentsDisabled"]=true}}}
			    game:GetService("ReplicatedStorage").CommunityOutfitsRemote:InvokeServer(unpack(args))
			    wait(2)
			    game.ReplicatedStorage.Events.ClientSaveOutfitToRoblox:Fire(nil, nil, nil, true)
			    wait()
			
			    for i = 1, 10 do
			        wait()
			        clickCenter(PlayerGui.SaveOutfitToRobloxV3.Main.PageHolder.StageOne_HowToSave.Options.RobloxAvatar)
			    end
			    for i = 1, 10 do
			        wait()
			        clickCenter(PlayerGui.SaveOutfitToRobloxV3.Main.PageHolder.StageTwo_OwnershipCheck.SaveButton)
			    end
			]])
		else
			StarterGui:SetCore("SendNotification", {
		        Title = "System",
		        Text = "Your executor doesn't support queueonteleport, execute the script once again in new game.",
		        Duration = 3
		    })
			wait(3)
		end
        game:GetService("TeleportService"):Teleport(tonumber("7041939546"))
        wait(10)
        game.Players.LocalPlayer:Kick("Turn off Delta's verify teleport first\n You have to watch tutorial")
        return
    end

    local PlayerGui = LocalPlayer.PlayerGui
    local VIM = game:GetService("VirtualInputManager")
    local GuiService = game:GetService("GuiService")
	local StarterGui = game:GetService("StarterGui")
	local TeleportService = game:GetService("TeleportService")

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "TeleportBackGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.Parent = PlayerGui
	
	local Button = Instance.new("TextButton")
	Button.Name = "TeleportBackButton"
	Button.Size = UDim2.new(0, 160, 0, 40)
	Button.Position = UDim2.new(0.5, -60, 0, 10)
	Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 16
	Button.Text = "Teleport Back"
	Button.Parent = ScreenGui
	
	Button.MouseButton1Click:Connect(function()
	    StarterGui:SetCore("SendNotification", {
	        Title = "Teleporting",
	        Text = "Teleporting to Slap Battles...",
	        Duration = 3
	    })
	    TeleportService:Teleport(tonumber("124596094333302"))
	end)
    local function clickCenter(button)
        local pos = button.AbsolutePosition
        local size = button.AbsoluteSize
        local inset = GuiService:GetGuiInset()
        local x = pos.X + size.X / 2
        local y = pos.Y + size.Y / 2 + inset.Y

        if mousemoveabs then
            mousemoveabs(x, y)
            wait(0.05)
            mouse1press()
            wait(0.05)
            mouse1release()
        else
            VIM:SendMouseMoveEvent(x, y, game)
            wait()
            VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
            wait()
            VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
        end
    end

    game:GetService("ReplicatedStorage").CommunityOutfitsRemote:InvokeServer(unpack(args))
    wait(2)
    game.ReplicatedStorage.Events.ClientSaveOutfitToRoblox:Fire(nil, nil, nil, true)
    wait()

    for i = 1, 10 do
        wait()
        clickCenter(PlayerGui.SaveOutfitToRobloxV3.Main.PageHolder.StageOne_HowToSave.Options.RobloxAvatar)
    end
    for i = 1, 10 do
        wait()
        clickCenter(PlayerGui.SaveOutfitToRobloxV3.Main.PageHolder.StageTwo_OwnershipCheck.SaveButton)
    end
    return
end
