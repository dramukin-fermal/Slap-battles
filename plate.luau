game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Notification",Text = "Script made by DonjoSx aka the dumb cat!",Icon = "rbxassetid://7733658504",Duration = 5})
if game.PlaceId ~= 106620300132058 then
	game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Notification",Text = "Teleporting you to the plate place",Icon = "rbxassetid://7733658504",Duration = 5})
	local ScriptSpawnSlap = queueonteleport or queue_on_teleport
	if ScriptSpawnSlap then
	    ScriptSpawnSlap([[
			if not game:IsLoaded() then
			    game.Loaded:Wait()
			end
			repeat wait() until game.Players.LocalPlayer
			wait(0.25)
			workspace.Obstacles.DescendantAdded:Connect(function(v)
				repeat wait() until v and v.Parent
				if v:IsA("Part") or v:IsA("BasePart") then 
					v.Transparency = .8
					v.CanTouch = false
					v.CanCollide = false
				end
			end)
			for i,v in pairs(workspace.Obstacles: GetDescendants()) do
				if v:IsA("Part") or v:IsA("BasePart") then 
					v.Transparency = .8
					v.CanTouch = false
					v.CanCollide = false
				end
			end
			
			while true do
				pcall(function()
					firetouchinterest(game.Players.LocalPlayer.Character.Head,workspace["Glove Model"].Hand, 0)
				end)
				wait(.1)
			end
	    ]])
	end
	game:GetService("TeleportService"):Teleport(106620300132058)
	
	return 
else 
	if not game:IsLoaded() then
			    game.Loaded:Wait()
			end
			repeat wait() until game.Players.LocalPlayer
			wait(.5)
			game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Notification",Text = "Automatic bypass objects is on!",Icon = "rbxassetid://7733658504",Duration = 5})
	workspace.Obstacles.DescendantAdded:Connect(function(v)
		repeat wait() until v and v.Parent
		if v:IsA("Part") or v:IsA("BasePart") then 
			v.Transparency = .8
			v.CanTouch = false
			v.CanCollide = false
		end
	end)
	for i,v in pairs(workspace.Obstacles: GetDescendants()) do
		if v:IsA("Part") or v:IsA("BasePart") then 
			v.Transparency = .8
			v.CanTouch = false
			v.CanCollide = false
		end
	end
	
	while true do
		pcall(function()
			firetouchinterest(game.Players.LocalPlayer.Character.Head,workspace["Glove Model"].Hand, 0)
		end)
		wait(.1)
	end
end
