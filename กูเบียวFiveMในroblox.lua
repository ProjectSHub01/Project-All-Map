
local getgenv, getnamecallmethod, hookmetamethod, hookfunction, newcclosure, checkcaller, lower, gsub, match
    = getgenv, getnamecallmethod, hookmetamethod, hookfunction, newcclosure, checkcaller, string.lower, string.gsub, string.match;

if getgenv().ED_AntiKick then
    return
end

local cloneref = cloneref or function(...) return ... end
local clonefunction = clonefunction or function(...) return ... end
local Players, LocalPlayer, StarterGui = cloneref(game:GetService("Players")), cloneref(game:GetService("Players").LocalPlayer), cloneref(game:GetService("StarterGui"))

local SetCore = clonefunction(StarterGui.SetCore)
local GetDebugId = clonefunction(game.GetDebugId)
local FindFirstChild = clonefunction(game.FindFirstChild)

local compareinstances = (compareinstances and function(ins1, ins2)
        if typeof(ins1) == "Instance" and typeof(ins2) == "Instance" then
            return compareinstances(ins1, ins2);
        end
    end)
or
function(ins1, ins2)
    return (typeof(ins1) == "Instance" and typeof(ins2) == "Instance") and GetDebugId(ins1) == GetDebugId(ins2);
end;

local function CanCastToSTDString(val)
    local success, err = pcall(FindFirstChild, game, val);
    return success
end

getgenv().ED_AntiKick = {
    Enabled = true,
    SendNotifications = false,
    CheckCaller = false
}

local OldNamecall;
OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local self, message = ...
    local method = getnamecallmethod()
    
    if ((getgenv().ED_AntiKick.CheckCaller and not checkcaller()) or true) and compareinstances(self, LocalPlayer) and gsub(method, "^%l", string.upper) == "Kick" and ED_AntiKick.Enabled then
        if CanCastToSTDString(message) then
            return;
        end
    end

    return OldNamecall(...)
end))

local OldFunction;
OldFunction = hookfunction(LocalPlayer.Kick, function(...)
    local self, message = ...

    if ((getgenv().ED_AntiKick.CheckCaller and not checkcaller()) or true) and compareinstances(self, LocalPlayer) and ED_AntiKick.Enabled then
        if CanCastToSTDString(message) then
            return;
        end
    end
end)



function ESP(obj, Name)
    if not obj:FindFirstChildOfClass('BillboardGui') then
        local BillboardGui = Instance.new('BillboardGui', obj)
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(0, 60, 0, 50)
        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)

        local TextLabel = Instance.new('TextLabel', BillboardGui)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.Text = Name
        TextLabel.TextScaled = true
        TextLabel.TextStrokeTransparency = 0.5
        TextLabel.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)

        game:GetService("RunService").RenderStepped:Connect(function()
            if obj:FindFirstChild("MainPart") and obj.MainPart:FindFirstChild("Attachment1") then
                local attachment = obj.MainPart.Attachment1
                if attachment:FindFirstChild("BBG") and attachment.BBG:FindFirstChild("Available") then
                    TextLabel.Text = Name.." | "..attachment.BBG.Available.Text
                end
            end
            TextLabel.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        end)
    end
end
local Map = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local admin = {"Sky_Alinsip", "KAVA_IS", "BossFriends9", "thong2821", "may65448"}
function ButtonUi()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectSHub01/SSS-UI/refs/heads/main/Button.lua"))()
end
ButtonUi()
local function FireAirDrop()
    local Hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local Crate = workspace.AD_Folder:FindFirstChild("AirDrop") and workspace.AD_Folder.AirDrop:FindFirstChild("Crate")
    local ButtonAir = Crate and Crate:FindFirstChild("Attachment01") and Crate.Attachment01:FindFirstChild("AirdropButton")
    if Hrp and Crate and ButtonAir then
        local CF = Hrp.CFrame
        local safetyPart = Instance.new("Part")
        safetyPart.Size = Vector3.new(1, 1, 1)
        safetyPart.Position = Vector3.new(Crate.Position.X, -8, Crate.Position.Z)
        safetyPart.Anchored = true
        safetyPart.Parent = workspace
        Hrp.CFrame = safetyPart.CFrame
        wait(0.1)
        for i = 1, 5 do
            fireproximityprompt(ButtonAir)
        end
        wait(0.1)
        Hrp.CFrame = CF
        safetyPart:Destroy()
    else
        print("nil")
    end
end



local SSS = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectSHub01/SSS-UI/refs/heads/main/Ui.lua"))()
local Window = SSS:MakeWindow({
  Title = "SSS Hub | "..Map, -- Extreme City
  SubTitle = "",
  SaveFolder = ""
})

local Tab1 = Window:MakeTab({"| AutoFarm","Sword"})
local Tab2 = Window:MakeTab({"| Esp & item","Sword"})
local Tab3 = Window:MakeTab({"| Player & System","Sword"})



Tab1:AddToggle({
  Name = "Auto Farm | Wood",
  Default = false,
  Callback = function(a1)
    _G.HEE1 = a1
  end
})
Tab1:AddToggle({
  Name = "Auto Farm | Rock",
  Default = false,
  Callback = function(a2)
    _G.HEE2 = a2
  end
})
Tab1:AddToggle({
  Name = "Auto Farm | Strawberry",
  Default = false,
  Callback = function(a4)
    _G.HEE3 = a4
  end
})
Tab1:AddToggle({
  Name = "Auto Farm | ChineseNewYear [Event]",
  Default = false,
  Callback = function(a5)
    _G.HEE4 = a5
  end
})
Tab1:AddToggle({
  Name = "Auto Farm | Scrap",
  Default = false,
  Callback = function(a6)
    _G.HEE5 = a6
  end
})
Tab2:AddToggle({
  Name = "ESP | JobBlack",
  Default = false,
  Callback = function(a3)
    _G.EspJobBlack = a3
  end
})
Tab2:AddToggle({
  Name = "Auto Craft Bullet",
  Default = false,
  Callback = function(a7)
    _G.HEE6 = a7
  end
})
Tab3:AddButton({
  Name = "Anti Admin",
  Callback = function()
    game.Players.PlayerAdded:Connect(function(player)
      if table.find(admin, player.Name) then
        game:Shutdown()
      end
    end)
    for _, player in pairs(game.Players:GetPlayers()) do
      if table.find(admin, player.Name) then
        game:Shutdown()
      end
    end
  end
})
Tab3:AddButton({
  Name = "Respawn",
  Callback = function()
    local args = {
    [1] = "Respawn",
    [2] = game:GetService("Players").LocalPlayer
}

game:GetService("ReplicatedStorage").Assets.ReviveSystem.Event:FireServer(unpack(args))
  end
})
Tab3:AddButton({
  Name = "Anti AFK",
  Callback = function()
    if getconnections then 
      for _, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
        v:Disable()
      end
    end
  end
})
Tab3:AddButton({
  Name = "FireAirDrop",
  Callback = function()
    FireAirDrop()
  end
})
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.HEE1 then
        if game:GetService("Players").LocalPlayer.Inventory:FindFirstChild("WoodProcess") and game:GetService("Players").LocalPlayer.Inventory.WoodProcess.Value >= 60 then
          game:GetService("ReplicatedStorage").Remote.Economy:FireServer("Sell", "WoodProcess", "60")
        else
          for _, v in pairs(workspace.Farm.Wood:GetDescendants()) do
            if v:IsA("MeshPart") and v.Name == "Wood" then
              v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
          end
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ProcessW.Wood.CFrame * CFrame.new(0, -10, 0)
          fireproximityprompt(workspace.ProcessW.Wood.Prompt)
        end
      end
    end)
  end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.HEE4 then
                if #game.Players:GetPlayers() > 1 then
                    game:Shutdown()
                    return
                end
                local allDisabled = true
                for _, v in pairs(workspace["ChineseNewYear _E"]:GetDescendants()) do
                    if v:IsA("ProximityPrompt") and v.Enabled then
                        allDisabled = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                        fireproximityprompt(v)
                    end
                end
                if allDisabled then
                    wait(5)
                    game:Shutdown()
                end
            end
        end)
    end
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if _G.HEE3 then
              game:GetService'VirtualUser':CaptureController()
              game:GetService'VirtualUser':ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                if game.Players.LocalPlayer.Inventory:FindFirstChild("Strawberry") and 
                   game.Players.LocalPlayer.Inventory.Strawberry.Value >= 50 then
                    game.ReplicatedStorage.Remote.Economy:FireServer("Sell", "Strawberry", 50)
                else
                    for _, v in pairs(workspace.Farm.Strawberry:GetDescendants()) do
                        if v:IsA("MeshPart") then
                        game.Players.LocalPlayer.Character.Humanoid:MoveTo(v.Position)
                        break
                        end 
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.HEE2 then
        for _, v in pairs(workspace.Farm.Stone:GetDescendants()) do
          if v:IsA("MeshPart") and v.Name == "Stone" then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          end
        end 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Process.Stone.CFrame * CFrame.new(0, -10, 0)
        fireproximityprompt(workspace.Process.Stone.Prompt)
        if game.Players.LocalPlayer.Inventory:FindFirstChild("Stone") and game.Players.LocalPlayer.Inventory.Stone.Value > 50 then
          game.ReplicatedStorage.Remote.Economy:FireServer("Sell", "Stone", "10")
        end
        if game.Players.LocalPlayer.Inventory.Steel.Value >= 60 then
          game.ReplicatedStorage.Remote.Vault:FireServer("Store", "Steel", 60)
        end
        if game.Players.LocalPlayer.Inventory.Vibranium.Value >= 10 then
          game.ReplicatedStorage.Remote.Vault:FireServer("Store", "Vibranium", 10)
        end
      end
    end)
  end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.HEE5 then
        for _, v in pairs(workspace.Farm.Scrap.FarmItem:GetDescendants()) do
          if v:IsA("MeshPart") then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
          end
        end 
      end
    end)
  end
end)
task.spawn(function()
  while wait(1) do
    pcall(function()
      if _G.HEE6 then
        game:GetService("ReplicatedStorage").Remote.Craft:FireServer("Material","Bullet",1)
      end
    end)
  end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.EspJobBlack then
        for _, v in pairs(workspace.BlackJobs:GetChildren()) do
          if v:IsA("Model") then
            ESP(v, v.Name)
          end
        end
      end
    end)
  end
end)

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.HEE1 or _G.HEE2 or _G.HEE4 then
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and not hrp:FindFirstChild("BodyClip") then
                local noclip = Instance.new("BodyVelocity")
                noclip.Name = "BodyClip"
                noclip.Parent = hrp
                noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                noclip.Velocity = Vector3.new(0, 0, 0)
            end
        else
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("BodyClip") then
                hrp.BodyClip:Destroy()
            end
        end
    end)
end)
