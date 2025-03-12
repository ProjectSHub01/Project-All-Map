local Player = {}
for _, v in pairs(game.Players:GetPlayers()) do
  if v ~= game.Players.LocalPlayer then
    table.insert(Player, v.Name)
  end
end
local Kill = function(x, y)
    game:GetService("Players").LocalPlayer.Character.PUNCH.LocalScript.Damage:FireServer(x, y)
end
local Kill2 = function(x, y)
game:GetService("Players").LocalPlayer.Character.BROKENBOTTLELLv3.LocalScript.Damage:FireServer(x, y, false)
end
local Kill3 = function(x, y)
  local args = {
    [1] = x,
    [2] = y
}

game:GetService("Players").LocalPlayer.Character.PoolcueLv3.LocalScript.Damage:FireServer(unpack(args))
end
if game:GetService("ReplicatedStorage"):FindFirstChild("anti_axis") then
  game:GetService("ReplicatedStorage").anti_axis:Destroy()
end
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Name = "ButtonGui"
ScreenGui1.Parent = CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local TextButton1 = Instance.new("TextButton")
TextButton1.Parent = ScreenGui1
TextButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
TextButton1.Size = UDim2.new(0, 50, 0, 50)
TextButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
TextButton1.BackgroundTransparency = 0.5
TextButton1.Text = ""
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = TextButton1
local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = TextButton1
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 2
local Sound1 = Instance.new("Sound")
Sound1.Parent = TextButton1
Sound1.SoundId = "rbxassetid://12221967"
Sound1.Volume = 1
local isOn = false
TextButton1.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TextButton1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        TextButton1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
    Sound1:Play()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
end)
local Window = Fluent:CreateWindow({
    Title = "👾  ดับเลโก้ Store",
    SubTitle = "| ตัวร้ายเลโก้",
    TabWidth = 120,
    Size = UDim2.fromOffset(420, 340),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})


Main = Window:AddTab({Title = "👑 | Function Op"})
Main2 = Window:AddTab({Title = "⚡ | God Mode"})
Main3 = Window:AddTab({Title = "🫀 | Respawn"})
Main4 = Window:AddTab({Title = "📊 | Player"})

Fluent:Notify({
  Title = "Notification By MarvenRiz",
  Content = "TikTok : Name",
  SubContent = "ติดตามด้วยนะคับ ตัวร้ายเลโก้ทั้งหลาย",
  Duration = 10
})

Main:AddToggle("nil", {
    Title = "One Hit",
    Description = "ต่อยทีเดียวตายไงคับหนูๆ",
    Default = false,
    Callback = function(Value)
        _G.OneHit = Value
    end
})
Main:AddToggle("nil", {
    Title = "loop Kill All| ตายรัวๆยกเซิฟ",
    Default = false,
    Callback = function(Ro)
        _G.Rob = Ro
    end
})
spawn(function()
  while wait() do
    pcall(function()
      if _G.Rob then
        local localPlayer = game.Players.LocalPlayer
        for _, v in pairs(game.Players:GetPlayers()) do
          if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Humanoid") then
            Kill(workspace[v.Name].Humanoid, math.huge)
          end
        end
      end
    end)
  end
end)
Main:AddSection("| Kill 💥")
Main:AddButton({
    Title = "Kill All",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Humanoid") then
                Kill(workspace[v.Name].Humanoid, math.huge)
            end
        end
    end
})
Main2:AddButton({
    Title = "God Mode",
    Callback = function()
        Kill(game.Players.LocalPlayer.Character.Humanoid, -10000000000)
    end
})
Main2:AddButton({
    Title = "God Mode All",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Humanoid") then
                Kill(workspace[v.Name].Humanoid, -10000000000)
            end
        end
    end
})
Main3:AddButton({
  Title = "Respawn",
  Description = "เกิดใหม่แค่ตัวเอง",
  Callback = function()
    game:GetService("ReplicatedStorage").ReviveSystem.Event:FireServer("Respawn",game:GetService("Players").LocalPlayer)
  end
})
Main3:AddButton({
  Title = "Reset All",
  Description = "เกิดใหม่ยกเซิฟไงหนูๆ",
  Callback = function()
    for _, v in pairs(game.Players:GetPlayers()) do
      if v then
        game:GetService("ReplicatedStorage").RemoteEventA.AED_Remote:FireServer(v)
      end
    end
  end
})
Main4:AddDropdown("Dropdown", {
  Title = "เลือก ผู้เล่น",
  Values = Player,
  Multi = false,
  Default = 1,
  Callback = function(v)
    _G.PlayersHee = v
  end
})
Main4:AddButton({
  Title = "Teleport | วาปไปหาผู้เล่นที่เลือก",
  Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.PlayersHee].Character.HumanoidRootPart.CFrame*CFrame.new(0,5,0)
  end
})
Main4:AddButton({
  Title = "Respawn | ผู้เล่นที่เลือกเกิดใหม่",
  Callback = function()
  game:GetService("ReplicatedStorage").RemoteEventA.AED_Remote:FireServer(game.Players[_G.PlayersHee])
  end
})
Main4:AddButton({
  Title = "God Mode | ทำให้ผู้เล่นคนที่เลือกเป็นอมตะ",
  Callback = function()
    Kill(workspace[_G.PlayersHee].Humanoid, -math.huge)
  end
})
Main4:AddButton({
  Title = "Kill Player | ฆ่าผู้เล่นคนที่เลือก",
  Callback = function()
    Kill(workspace[_G.PlayersHee].Humanoid, -math.huge)
  end
})

local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    if _G.OneHit and getnamecallmethod() == "FireServer" and self.Name == "Damage" then
        if typeof(args[2]) == "number" then
            args[2] = math.huge
        end
    end
    return oldNamecall(self, unpack(args))
end)
setreadonly(mt, true)


