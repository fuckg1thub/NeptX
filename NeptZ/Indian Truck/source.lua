-- i give up on putting comments for each section of the script
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckg1thub/assets/refs/heads/main/lib.lua"))()
local window = library.Window("NeptZ", "Indian Truck")
local trucksTab = window.Tab("Trucks")
local trucksSection = trucksTab.Section("Free Trucks")

local localPlayer = game:GetService("Players").LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

local noTruckPrompts
local allTrucksFree
local truckSpeedValue = 320

if not _G.hooked then
    _G.hooked = true
    for i, v in pairs(localPlayer.PlayerGui.TruckSpawningUI.MainFrame.ScrollingFrame:GetChildren()) do
        if v:FindFirstChild("ClickToSpawn") then
            v.ClickToSpawn.MouseButton1Click:Connect(function()
                if not allTrucksFree then return end
                replicatedStorage.TruckSpawningEvents.PlaceVehicle:FireServer(v.Name)
            end)
        end
    end
end

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    if getnamecallmethod() == "PromptGamePassPurchase" and tostring(getcallingscript()) == "SpawnTruckManager" and noTruckPrompts then
        return
    end
    return old(self, ...)
end)

trucksSection.Toggle("Get All Trucks For Free", function (state)
    allTrucksFree = state
end)
trucksSection.Toggle("No Gamepass Prompts", function (state)
    noTruckPrompts = state
end)

local modificationsSection = trucksTab.Section("Modifications")
modificationsSection.Button("Give Truck Speed", function()
    local seat = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.SeatPart
    if seat then
        require(seat.Parent["A-Chassis Tune"]).Horsepower = truckSpeedValue
    end
end)
modificationsSection.Slider("Truck Speed", 320, 320, 40000, function (val)
    truckSpeedValue = val
end)
