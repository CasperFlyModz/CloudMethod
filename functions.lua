local RIP = {}
RIP.ME = game:GetService("Players").LocalPlayer
RIP.Char = ME.Character or ME.CharacterAdded:Wait()
ME.CharacterAdded:Connect(function(v)
	RIP.Char = v
end)
function RIP.SetProperty(Obj, Prop, Val)
	if not RIP.Char:FindFirstChild("PompousTheCloud") then
		if not RIP.ME.Backpack:FindFirstChild("PompousTheCloud") then
			return error("You do not own VIP or a cloud in your inventory.")
		end
		RIP.ME.Backpack.PompousTheCloud.Parent = RIP.Char
	end
	RIP.Char:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("SetProperty", {
		["Object"] = Obj,
		["Property"] = tostring(Prop),
		["Value"] = Val
	})
	return Obj
end
function RIP.GuiEvent()
	if RIP.Char:FindFirstChildOfClass("Model") then
		RIP.Char:FindFirstChildOfClass("Model"):Destroy()
	end
	workspace.GuiEvent:FireServer("")
	RIP.SetProperty(RIP.Char:WaitForChild(""):WaitForChild("Head"), "Transparency", 1)
	RIP.SetProperty(RIP.Char.Head, "Transparency", 0)
	RIP.Char[""].Head:ClearAllChildren()
	return RIP.Char[""]
end
function RIP.Kill(player)
	RIP.SetProperty(RIP.GuiEvent():WaitForChild("Head"), "Parent", plr.Character or game:GetService("Players"):FindFirstChild(plr).Character)
	RIP.Char[""]:Destroy()
end
function RIP.EC(bool)
	if not RIP.Char:FindFirstChild("PompousTheCloud") then
		if not RIP.ME.Backpack:FindFirstChild("PompousTheCloud") then
			return error("You do not own VIP or a cloud in your inventory.")
		end
		RIP.ME.Backpack.PompousTheCloud.Parent = RIP.Char
	end
	RIP.Char:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", {
		["Flying"] = bool
	})
end
function RIP.GP(str)
	local Found, str = {}, tostring(str):lower()
	if str == "all" then
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= RIP.ME.Name then
				table.insert(Found, v)
			end
		end
	elseif str == "me" then
		table.insert(Found, RIP.ME)
	elseif str == "others" then
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= RIP.ME.Name then
				table.insert(Found, v)
			end
		end
	else
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #str) == str:lower() or v.DisplayName:lower():sub(1, #str) == str:lower() and v ~= RIP.ME then
				table.insert(Found, v)
			end
		end
	end
	return Found
end
return RIP
