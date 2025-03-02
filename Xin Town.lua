
local function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

local Tab = library:Window("Xin Town")

Tab:Toggle("ออโต้ส่งของ", false, function(v)
  _G.Farm = v
end)

task.spawn(function()
  while wait() do
    pcall(function()
      if _G.Farm then
        if workspace.system.DeliveryNPCSpawnLocation.NPCS:FindFirstChild("NPC") then
          TP(workspace.system.DeliveryNPCSpawnLocation.NPCS.NPC.HumanoidRootPart.CFrame * CFrame.new(0, 2, -3));wait(0.5)
          fireproximityprompt(workspace.system.DeliveryNPCSpawnLocation.NPCS.NPC.HumanoidRootPart:FindFirstChildOfClass("ProximityPrompt"))
        else
          TP(workspace.system.etc.DeliverJob:FindFirstChild("interact").CFrame * CFrame.new(0, 2, -3));wait(0.5)
          fireproximityprompt(workspace.system.etc.DeliverJob:FindFirstChild("interact"):FindFirstChildOfClass("ProximityPrompt"))
        end
      end
    end)
  end
end)
