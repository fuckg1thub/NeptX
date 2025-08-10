loadstring(game:HttpGet("https://pastefy.app/kkTm4MOG/raw"))()

-- doesnt look like my other scripts at all because i hella rushed it
-- yes, this is my code not pasted 😭
local blocksInfo = require(game:GetService("ReplicatedStorage").Modules.Utilities.BlocksUtil).BlockInfo
_G.originalz = _G.originalz or blocksInfo
local localPlayer = game:GetService("Players").localPlayer

local function getBlockData(block, key)
    return _G.originalz[block][key]
end
local function modifyBlockData(block, key, value)
    blocksInfo[block][key] = value
end

local function getPlane()
    
    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
        local planeSeat = localPlayer.Character.Humanoid.SeatPart
        return planeSeat and (planeSeat and planeSeat.Parent.PrimaryPart) or nil
    end
end

local library = loadstring(game:HttpGet("https://pastefy.app/15xX79gr/raw"))()
local window = library.Window("NeptZ", "Plane")
local blocksTab = window.Tab("Blocks")
local mainsection = blocksTab.Section("Blocks")
mainsection.Toggle("Infinite Fuel", function(call)
    if call == false then
        modifyBlockData("fuel_1", "Fuel", 5)
        modifyBlockData("fuel_2", "Fuel", 10)
        modifyBlockData("fuel_3", "Fuel", 15)
    else
        modifyBlockData("fuel_1", "Fuel", getBlockData("fuel_1", "Fuel"))
        modifyBlockData("fuel_3", "Fuel", getBlockData("fuel_2", "Fuel"))
        modifyBlockData("fuel_3", "Fuel", getBlockData("fuel_3", "Fuel"))
    end
end)
mainsection.Toggle("Better Wings", function(call)
    if call == false then
        modifyBlockData("wing_1", "Lift", 4)
        modifyBlockData("wing_2", "Lift", 8)
        modifyBlockData("wing_3", "Lift", 10)
        modifyBlockData("wing_3", "Lift", getBlockData("wing_blood", "Lift"))
    else
        modifyBlockData("wing_1", "Lift", getBlockData("wing_1", "Lift"))
        modifyBlockData("wing_2", "Lift", getBlockData("wing_2", "Lift"))
        modifyBlockData("wing_3", "Lift", getBlockData("wing_3", "Lift"))
        modifyBlockData("wing_blood", "Lift", getBlockData("wing_blood", "Lift"))
    end
end)
mainsection.Toggle("Better Propellors", function(call)
    if call == false then
        modifyBlockData("propeller_0", "Force", 4)
        modifyBlockData("propeller_1", "Force", 20)
        modifyBlockData("propeller_2", "Force", 35)
        modifyBlockData("propeller_3", "Force", 42)
        modifyBlockData("propeller_blood", "Force", 50)
    else
        modifyBlockData("propeller_0", "Force", 150)
        modifyBlockData("propeller_1", "Force", 150)
        modifyBlockData("propeller_2", "Force", 150)
        modifyBlockData("propeller_3", "Force", 150)
        modifyBlockData("propeller_blood", "Force", 150)
    end
end)
local farmTab = window.Tab("Auto Farm")
local farmSection = farmTab.Section("Farming")
local function yet()
    if getPlane() == nil then return end
    getPlane().CFrame = CFrame.new(getPlane().CFrame.X, 200, getPlane().CFrame.Z)
    local cf = getPlane().CFrame + Vector3.new(10000, 200, 0)
    local aaa = 0
    local origianLpos = getPlane().CFrame
    while true do
        if not getPlane() then break end
        if aaa >= 1 then break end
        aaa = aaa + 0.001
        print(aaa)
        local cframe = origianLpos:lerp(cf, aaa)
        getPlane().CFrame = cframe
        task.wait()
    end
end
farmSection.Toggle("Auto Send To End", function(call)
    _G.funnyuwu = call
    task.spawn(function ()
        while _G.funnyuwu and task.wait() do
            if getPlane() then
                yet()
                task.wait(2)
                firesignal(localPlayer.PlayerGui.Main.LaunchUI.Buttons.ReturnButton.MouseButton1Click)
            end
        end
    end)
end)
farmSection.Toggle("Auto Launch", function(call)
    _G.funnyowo = call
    task.spawn(function ()
        while _G.funnyowo and task.wait() do
            if not getPlane() then
                if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                    firesignal(localPlayer.PlayerGui.Main.LaunchUI.Buttons.LaunchButton.MouseButton1Click)
                end
            end
        end
    end)
end)
local miscTab = window.Tab("Misc")
local miscSection = miscTab.Section("Misc")
miscSection.Button("Move Plane Up", function()
    local plane = getPlane()
    if plane then
        plane.CFrame = plane.CFrame + Vector3.new(0, 15, 0)
    end
end)
miscSection.Button("Move Plane Down", function()
    local plane = getPlane()
    if plane then
        plane.CFrame = plane.CFrame - Vector3.new(0, 15, 0)
    end
end)
miscSection.Button("Send Plane To End", function()
    local plane = getPlane()
    if plane then
        yet()
    end
end)
