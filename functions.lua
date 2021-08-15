local RIP = {}
ME = game:GetService("Players").LocalPlayer
Char = ME.Character or ME.CharacterAdded:Wait()
ME.CharacterAdded:Connect(function(v)
	Char = v
end)
function RIP.SetProperty(Obj, Prop, Val)
	if not Char:FindFirstChild("PompousTheCloud") then
		if not ME.Backpack:FindFirstChild("PompousTheCloud") then
			return error("You do not own VIP or a cloud in your inventory.")
		end
		ME.Backpack.PompousTheCloud.Parent = Char
	end
	Char:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("SetProperty", {
		["Object"] = Obj,
		["Property"] = tostring(Prop),
		["Value"] = Val
	})
	return Obj
end
function RIP.GuiEvent()
	if Char:FindFirstChildOfClass("Model") then
		Char:FindFirstChildOfClass("Model"):Destroy()
	end
	workspace.GuiEvent:FireServer("")
	RIP.SetProperty(Char:WaitForChild(""):WaitForChild("Head"), "Transparency", 1)
	RIP.SetProperty(Char.Head, "Transparency", 0)
	Char[""].Head:ClearAllChildren()
	return Char[""]
end
function RIP.Kill(player, method)
	if not method or method:lower() == "guievent" or method:lower() == "rp" then
		RIP.SetProperty(RIP.GuiEvent():WaitForChild("Head"), "Parent", plr.Character or game:GetService("Players"):FindFirstChild(plr).Character)
		Char[""]:Destroy()
	elseif method:lower() == "ec" or method:lower() == "effectcloud" then
		RIP.EC(true):ClearAllChildren()
		RIP.SetProperty(Char.PompousTheCloud.EffectCloud, "Transparency", 1)
		RIP.SetProperty(Char.PompousTheCloud.EffectCloud, "Name", "Head")
		RIP.SetProperty(Char.PompousTheCloud:WaitForChild("Head"), "Parent", plr.Charatcer or game:GetService("Players"):FindFirstChild(plr).Character)
		RIP.EC(false)
	end
end
function RIP.EC(bool)
	if not Char:FindFirstChild("PompousTheCloud") then
		if not ME.Backpack:FindFirstChild("PompousTheCloud") then
			return error("You do not own VIP or a cloud in your inventory.")
		end
		ME.Backpack.PompousTheCloud.Parent = Char
	end
	Char:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("Fly", {
		["Flying"] = bool
	})
	if bool == true then
		Char.PompousTheCloud:WaitForChild("EffectCloud").CanCollide = false
		return Char.PompousTheCloud.EffectCloud
	end
end
function RIP.GP(str)
	local Found, str = {}, tostring(str):lower()
	if str == "all" then
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= ME.Name then
				table.insert(Found, v)
			end
		end
	elseif str == "me" then
		table.insert(Found, ME)
	elseif str == "others" then
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= ME.Name then
				table.insert(Found, v)
			end
		end
	else
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #str) == str:lower() or v.DisplayName:lower():sub(1, #str) == str:lower() and v ~= ME then
				table.insert(Found, v)
			end
		end
	end
	return Found
end
return RIP
