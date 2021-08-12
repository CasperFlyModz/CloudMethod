local RIP = {}
RIP.ME = game:GetService("Players").LocalPlayer
RIP.Char = ME.Character or ME.CharacterAdded:Wait()
ME.CharacterAdded:Connect(function(v)
    RIP.Char = v
end)
function RIP.SetProperty(Obj, Prop, Val)
    if not Char:FindFirstChild("PompousTheCloud") then
        if not ME.Backpack:FindFirstChild("PompousTheCloud") then
            return error("You do not own VIP or a cloud in your inventory.")
        end
        ME.Backpack.PompousTheCloud.Parent = Char
    end
    Char:WaitForChild("PompousTheCloud").ServerControl:InvokeServer("SetProperty",{
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
    SetProperty(Char:WaitForChild(""):WaitForChild("Head"), "Transparency", 1)
    SetProperty(Char.Head, "Transparency", 0)
    Char[""].Head:ClearAllChildren()
    return Char[""].Head
end
return RIP
