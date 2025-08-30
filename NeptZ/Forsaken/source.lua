-- 🎉 Forsaken script is open source again. Also i added hitbox expander WHICH IS IN BETA!

print"e"
--[[
                            $$\                                                                 $$\            $$\               
                            $$ |                                                                \__|           $$ |              
$$$$$$$\   $$$$$$\   $$$$$$\ $$$$$$\   $$\   $$\ $$$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$$\  $$$$$$\  $$\  $$$$$$\ $$$$$$\    $$$$$$$\ 
$$  __$$\ $$  __$$\ $$  __$$\\_$$  _|  $$ |  $$ |$$  __$$\ $$  __$$\ $$  _____|$$  _____|$$  __$$\ $$ |$$  __$$\\_$$  _|  $$  _____|
$$ |  $$ |$$$$$$$$ |$$ /  $$ | $$ |    $$ |  $$ |$$ |  $$ |$$$$$$$$ |\$$$$$$\  $$ /      $$ |  \__|$$ |$$ /  $$ | $$ |    \$$$$$$\  
$$ |  $$ |$$   ____|$$ |  $$ | $$ |$$\ $$ |  $$ |$$ |  $$ |$$   ____| \____$$\ $$ |      $$ |      $$ |$$ |  $$ | $$ |$$\  \____$$\ 
$$ |  $$ |\$$$$$$$\ $$$$$$$  | \$$$$  |\$$$$$$  |$$ |  $$ |\$$$$$$$\ $$$$$$$  |\$$$$$$$\ $$ |      $$ |$$$$$$$  | \$$$$  |$$$$$$$  |
\__|  \__| \_______|$$  ____/   \____/  \______/ \__|  \__| \_______|\_______/  \_______|\__|      \__|$$  ____/   \____/ \_______/ 
                    $$ |                                                                               $$ |                         
                    $$ |                                                                               $$ |                         
                    \__|                                                                               \__|                             
]]


local Gui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CheckHolder = Instance.new("Frame")
local CheckBox = Instance.new("TextButton")
local CheckMark = Instance.new("TextLabel")
local CheckText = Instance.new("TextLabel")
local LoadBtn = Instance.new("TextButton")
Gui.Name = "ForsakenLoader"
Gui.ResetOnSpawn = false
Gui.Parent = game:GetService("CoreGui")


Frame.Size = UDim2.new(0, 260, 0, 150)
Frame.Position = UDim2.new(0.5, -130, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = Gui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "Forsaken script by nxp hub"
Title.TextColor3 = Color3.fromRGB(235, 235, 235)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Frame

CheckHolder.Size = UDim2.new(0, 200, 0, 24)
CheckHolder.Position = UDim2.new(0, 10, 1, -70)
CheckHolder.BackgroundTransparency = 1
CheckHolder.Parent = Frame

CheckBox.Size = UDim2.new(0, 20, 0, 20)
CheckBox.Position = UDim2.new(0, 0, 0.5, -10)
CheckBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CheckBox.AutoButtonColor = false
CheckBox.Text = ""
CheckBox.Parent = CheckHolder
Instance.new("UICorner", CheckBox).CornerRadius = UDim.new(0, 4)

CheckMark.AnchorPoint = Vector2.new(0.5, 0.5)
CheckMark.Position = UDim2.new(0.5, 0, 0.5, 0)
CheckMark.Size = UDim2.new(0.7, 0, 0.7, 0)
CheckMark.BackgroundTransparency = 1
CheckMark.Text = ""
CheckMark.TextScaled = true
CheckMark.Font = Enum.Font.GothamBold
CheckMark.Parent = CheckBox

CheckText.Size = UDim2.new(0, 170, 1, 0)
CheckText.Position = UDim2.new(0, 30, 0, 0)
CheckText.BackgroundTransparency = 1
CheckText.Text = "Use Linoria GUI (PC only)"
CheckText.TextColor3 = Color3.fromRGB(235, 235, 235)
CheckText.Font = Enum.Font.Gotham
CheckText.TextSize = 14
CheckText.TextXAlignment = Enum.TextXAlignment.Left
CheckText.Parent = CheckHolder

LoadBtn.Size = UDim2.new(1, -6, 0, 32)
LoadBtn.Position = UDim2.new(0, 3, 1, -35)
LoadBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
LoadBtn.Text = "Load Script"
LoadBtn.TextColor3 = Color3.fromRGB(235, 235, 235)
LoadBtn.Font = Enum.Font.GothamBold
LoadBtn.TextSize = 15
LoadBtn.AutoButtonColor = false
LoadBtn.Parent = Frame
Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 6)

_G.useLinoria = false
local toggled = false
local loaded = false

local function rainbowColor(t)
    return Color3.fromHSV(t % 1, 1, 1)
end

CheckBox.MouseButton1Click:Connect(function()
    toggled = not toggled
    _G.useLinoria = toggled
    CheckMark.Text = toggled and utf8.char(10003) or ""
end)

LoadBtn.MouseButton1Click:Connect(function()
    loaded = true
    Gui:Destroy()
end)

task.spawn(function()
    local t = 0
    while task.wait() do
        if toggled and CheckMark.Text ~= "" then
            t = t + 0.001
            CheckMark.TextColor3 = rainbowColor(t)
        end
    end
end)

repeat task.wait() until loaded

local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")

local h = 0
local function pathfindTo(targetPos)
    local hNow = h
    local plr = Players.LocalPlayer
    local char = plr.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if (not char) or (not hum) then return end
    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = false,
        AgentJumpHeight = 10,
        AgentMaxSlope = 45
    })

    path:ComputeAsync(root.Position, targetPos)

    if path.Status == Enum.PathStatus.Success then
        for _, waypoint in ipairs(path:GetWaypoints()) do
            if hNow ~= h then return end
            hum:MoveTo(waypoint.Position)
            repeat task.wait() until ((root.Position * Vector3.new(1, 0, 1)) - (waypoint.Position * Vector3.new(1, 0, 1))).magnitude <= 2 or not plr.Character.HumanoidRootPart or hNow ~= h
            if waypoint.Action == Enum.PathWaypointAction.Jump then
                hum.Jump = true
            end
        end
    else
        warn("Path failed!")
    end
end

local repo = _G.useLinoria and "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/" or "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local function Notify(Title, Text, Duration)
    if _G.useLinoria then
        Library:Notify(Text, Duration)
    else
        Library:Notify({
            Title = Title,
            Description = Text,
            Time = Duration,
        })
    end
end

local Options = Library.Options or Options
local Toggles = Library.Toggles or Toggles

local Window
if not _G.useLinoria then
    Window = Library:CreateWindow({
        Title = "NXP hub V2",
        Footer = "Forsaken",
        Icon = "rbxassetid://130931198530758",
        NotifySide = "Right",
        ShowCustomCursor = true,
        Size = UDim2.fromOffset(736, 361)
    })
else
    Window = Library:CreateWindow({
        Title = 'NXP Hub Linoria',
        Center = true,
        AutoShow = true,
        TabPadding = 6,
        MenuFadeTime = 0.2,
        Size = UDim2.fromOffset(630, 600)
    })
end

local Tabs = {
    ReadMe = Window:AddTab("Read Me", "info"),
    Main = Window:AddTab("Main", "zap"),
    ["Local Player"] = Window:AddTab("Local Player", "user"),
    Killer = Window:AddTab("Killer", "skull"),
    Teleport = Window:AddTab("Locations", "pin"),
    Misc = Window:AddTab("Misc", "cloudy"),
    ["UI Settings"] = Window:AddTab("UI Settings", "wrench"),
}

local isKiller, isSurvivor, killerModel 

task.spawn(function()
    while task.wait() do
        if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
            for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                if v:GetAttribute("Username") and game.Players:FindFirstChild(v:GetAttribute("Username")) then
                    killerModel = v
                end
                if v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
                    isKiller = true
                end
            end
            isSurvivor = not isKiller
        end
    end
end)

local function getClosestSurvivorToMouse(x, y)
    local closestDistance = math.huge
    local closestSurvivor = nil
    local cam = workspace.CurrentCamera
    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
            if v:GetAttribute("Username") ~= game.Players.LocalPlayer.Name then
                if v:FindFirstChild("HumanoidRootPart")then
                    local nihpos = v.HumanoidRootPart.Position
                    local vector, onScreen = cam:WorldToViewportPoint(nihpos)
                    if onScreen then
                        local mag = (Vector2.new(x, y) - Vector2.new(vector.X, vector.Y)).Magnitude
                        if mag < closestDistance then
                            closestDistance = mag
                            closestSurvivor = v
                        end
                    end
                end
            end
        end
    end
    return closestSurvivor
end

do
    local Credits = Tabs.ReadMe:AddLeftGroupbox("Credits")
    Credits:AddButton({ Text = utf8.char(128147) .. " Made by neptunescripts :3", Func = function() end })
    Credits:AddButton({ Text = "rscripts: @NXPHub", Func = function() setclipboard("https://rscripts.net/@NXPHub") end })
    Credits:AddButton({ Text = "my scriptblox got banned :(", Func = function()  end })
end

local GeneratorsGroup = Tabs.Main:AddLeftGroupbox("Generators", "battery-charging")
local KillersGroup = Tabs.Main:AddRightGroupbox("Killers", "skull")
local SurvivorsGroup = Tabs.Main:AddRightGroupbox("Survivors", "user")
local ItemsGroup = Tabs.Main:AddLeftGroupbox("Items", "shovel")
local AimbotGroup = Tabs.Main:AddRightGroupbox("Aimbot", "mouse")

GeneratorsGroup:AddToggle("GeneratorsESP", {
    Text = "Generators ESP",
    Default = false,
    Callback = function(bool)
        _G.generators = bool
        task.spawn(function()
            while task.wait() do
                if _G.generators then
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and not v:FindFirstChild("iskiddedfromneptz") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "iskiddedfromneptz"
                                elseif v:FindFirstChild("iskiddedfromneptz") and v.Name == "Generator" then
                                    v.iskiddedfromneptz.OutlineTransparency = Toggles.GeneratorESPOutline.Value and 0 or 1
                                    if v:FindFirstChild("Progress") then
                                        if v.Progress.Value < 100 or not Toggles.GeneratorsESPGreen.Value then
                                            v.iskiddedfromneptz.FillColor = Options.GeneratorsESPColor.Value
                                        end
                                    end
                                    if v:FindFirstChild("Progress") and v.Progress.Value >= 100 and Toggles.GeneratorsESPGreen.Value then
                                        v.iskiddedfromneptz.FillColor = Color3.fromRGB(0, 255, 0)
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and v:FindFirstChild("iskiddedfromneptz") then
                                    v.iskiddedfromneptz:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("GeneratorsESPColor", {
    Default = Color3.fromRGB(255, 255, 51),
    Title = "Generator Color",
})
GeneratorsGroup:AddToggle("GeneratorESPOutline", {
    Text = "Show Outline",
})

GeneratorsGroup:AddToggle("GeneratorsESPGreen", {
    Text = "Show Green When Done",
})

-- Generators: Nametags
GeneratorsGroup:AddToggle("GeneratorsNametags", {
    Text = "Generators Nametags",
    Default = false,
    Callback = function(bool)
        _G.generatorstag = bool
        task.spawn(function()
            while task.wait() do
                if _G.generatorstag then
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and not v:FindFirstChild("nametag") then
                                    local bb = Instance.new("BillboardGui", v)
                                    bb.Size = UDim2.new(4, 0, 1, 0)
                                    bb.AlwaysOnTop = true
                                    bb.Name = "nametag"
                                    local text = Instance.new("TextLabel", bb)
                                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    text.TextStrokeTransparency = 0
                                    text.Text = "Generator (" .. (v:FindFirstChild("Progress") and v.Progress.Value or 0) .. "%)"
                                    text.TextSize = 20
                                    text.BackgroundTransparency = 1
                                    text.Size = UDim2.new(1, 0, 1, 0)
                                elseif v:FindFirstChild("nametag") and v.Name == "Generator" then
                                    if v:FindFirstChild("Progress") then
                                        v.nametag.TextLabel.Text = "Generator (" .. v.Progress.Value .. "%)"
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and v:FindFirstChild("nametag") then
                                    v.nametag:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
})

-- Auto Complete Generator
local generatorsDid = {}
local activelyAutoing = false
GeneratorsGroup:AddToggle("AutoCompleteGenerator", {
    Text = "Auto Complete Generator",
    Default = false,
    Callback = function(bool)
        _G.instantGenerator = bool
        task.spawn(function()
            while _G.instantGenerator and task.wait() do
                if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                    pcall(function()
                        for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                            if not generatorsDid[v] and v.Name == "Generator" and v:FindFirstChild("Scripts") and v.Scripts:FindFirstChild("Client") then
                                generatorsDid[v] = true
                                local old; old = hookfunction(getsenv(v.Scripts.Client).toggleGeneratorState, newcclosure(function(a)
                                    if checkcaller() then return old(a) end
                                    if not _G.instantGenerator then return old(a) end
                                    if a ~= "enter" then return old("leave") end
                                    local ou = v.Remotes.RF:InvokeServer("enter")
                                    if ou ~= "fixing" then return end
                                    activelyAutoing = true
                                    for i = 1, 4 do
                                        if v.Progress.Value >= 100 then break end
                                        v.Remotes.RE:FireServer()
                                        setthreadidentity(8)
                                        Notify(
                                            "Generator Step",
                                            "Finished puzzle " .. i,
                                            4
                                        )
                                        task.wait(1.2)
                                    end
                                    activelyAutoing = false
                                    return ""
                                end))
                            end
                        end
                    end)
                end
            end
        end)
    end
})

-- Auto Start Generator
GeneratorsGroup:AddToggle("AutoStartGenerator", {
    Text = "Auto Start Generator",
    Default = false,
    Callback = function(bool)
        _G.autoGen = bool
        task.spawn(function()
            while _G.autoGen and task.wait() do
                if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                    pcall(function()
                        for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                            if v.Name == "Generator" then
                                pcall(function ()
                                    local function continue()
                                        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then return end
                                        if activelyAutoing then return end
                                        if v.Main:FindFirstChild("Prompt") then
                                            fireproximityprompt(v.Main.Prompt)
                                        end
                                        task.wait(1)
                                    end
                                    local hello = v.Positions.Center.Position
                                    local hello2 = v.Positions.Right.Position
                                    local hello3 = v.Positions.Left.Position
                                    local lp = game.Players.LocalPlayer
                                    if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
                                    local pos = lp.Character.HumanoidRootPart.Position
                                    if (pos - hello).Magnitude <= 4 then
                                        continue()
                                    elseif (pos - hello2).Magnitude <= 4 then
                                        continue()
                                    elseif (pos - hello3).Magnitude <= 4 then
                                        continue()
                                    end
                                end)
                            end
                        end
                    end)
                end
            end
        end)
    end
})

-- Complete Active Generator
GeneratorsGroup:AddButton({
    Text = "Complete Active Generator",
    Func = function()
        if activelyAutoing then return end
        pcall(function()
            if not (workspace.Map and workspace.Map.Ingame and workspace.Map.Ingame.Map) then return end
            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    pcall(function ()
                        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
                            local hello = v.Positions.Center.Position
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hello).Magnitude <= 21 then
                                for i = 1, 4 do
                                    if v.Progress.Value >= 100 then break end
                                    if activelyAutoing then return end
                                    if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then break end
                                    setthreadidentity(8)
                                    Notify(
                                        "Generator Step",
                                        "Finished puzzle " .. i,
                                        4
                                    )
                                    v.Remotes.RE:FireServer()
                                    task.wait(1.2)
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end
})

-- Complete All Generators
GeneratorsGroup:AddButton({
    Text = "Complete All Generators",
    Func = function()
        if activelyAutoing then return end
        local suc, res = pcall(function()
            if not (workspace.Map and workspace.Map.Ingame and workspace.Map.Ingame.Map) then return end
            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                if v.Name == "Generator" then
                    pcall(function ()
                        if v.Progress.Value >= 100 then return end
                        local function checkOccupance(pos)
                            if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then print("yeah 1") return false end
                            for _, sv in pairs(workspace.Players.Survivors:GetChildren()) do
                                if sv:FindFirstChild("HumanoidRootPart") then
                                    if sv ~= game.Players.LocalPlayer then
                                        if (sv.HumanoidRootPart.Position - pos).Magnitude <= 6 then
                                            return true
                                        end
                                    end
                                end
                            end
                            return false
                        end
                        local centerOccupied, rightOccupied, leftOccupied =
                            checkOccupance(v.Positions.Center.Position),
                            checkOccupance(v.Positions.Right.Position),
                            checkOccupance(v.Positions.Left.Position)
                            print(centerOccupied, rightOccupied, leftOccupied)
                        if centerOccupied and rightOccupied and leftOccupied then return print("occuhpied")end
                        if not centerOccupied then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Center.CFrame
                        elseif not rightOccupied then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Right.CFrame
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Positions.Left.CFrame
                        end
                        task.wait(0.2)
                        v.Remotes.RF:InvokeServer("enter")
                        for j = 1, 4 do
                            if v.Progress.Value >= 100 then print("break") break end
                            if activelyAutoing then return print("activelyAutoing") end
                            setthreadidentity(8)
                            Notify(
                                "Generator Step",
                                "Finished puzzle " .. tostring(j),
                                4
                            )
                            v.Remotes.RE:FireServer()
                            task.wait(1.2)
                        end
                    end)
                end
            end
        end)
        if not suc then
            warn(res)
        end
    end
})

-- Aimbot
local aimbotHeld = false
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function (i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHeld = true
    end
end)
uis.InputEnded:Connect(function (i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotHeld = false
    end
end)
AimbotGroup:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Callback = function (bool)
        _G.aimbot = bool
        if bool then
            game.StarterGui:SetCore("SendNotification", { Title = "aimbot enabled", Text = "aimbot is now on you can now hold right click to lock onto a survivor or the killer", Duration = 9 })
        end
        task.spawn(function()
            while _G.aimbot do
                if aimbotHeld then
                    local cam = workspace.CurrentCamera
                    if isKiller then
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local x, y = mouse.X, mouse.Y
                        local v = getClosestSurvivorToMouse(x, y)
                        if v then
                            local root = v.HumanoidRootPart
                            cam.CFrame = CFrame.new(cam.CFrame.Position, root.Position + (Toggles.AimbotPrediction.Value and (v.HumanoidRootPart.Velocity * 2) or Vector3.one))
                        end
                    elseif isSurvivor then
                        if killerModel and ({cam:WorldToViewportPoint(killerModel.HumanoidRootPart.Position)})[2] then
                            cam.CFrame = CFrame.new(cam.CFrame.Position, killerModel.HumanoidRootPart.Position + (Toggles.AimbotPrediction.Value and (killerModel.HumanoidRootPart.Velocity * (10 / Options.PredictionLevel.Value )) or Vector3.one))
                        end
                    end
                end 
                task.wait()
            end
        end)
    end
})
AimbotGroup:AddToggle("AimbotPrediction", {
    Text = "Prediction",
    Default = true
})
AimbotGroup:AddSlider("PredictionLevel", {
    Text = "Prediction Level",
    Default = 100,
    Min = 25,
    Max = 100,
    Rounding = 0,
})

-- Killers ESP
KillersGroup:AddToggle("KillerESP", {
    Text = "Killer ESP",
    Default = false,
    Callback = function(bool)
        _G.killers = bool
        task.spawn(function()
            while task.wait() do
                if _G.killers == true then
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
                        for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                            if not v:FindFirstChild("iskiddedfromneptz") then
                                local hl = Instance.new("Highlight", v)
                                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                hl.Name = "iskiddedfromneptz"
                                hl.OutlineTransparency = 1
                            else
                                v.iskiddedfromneptz.FillColor = Options.KillerESPColor.Value
                                v.iskiddedfromneptz.OutlineTransparency = Toggles.KillerESPOutline.Value and 0 or 1
                            end
                        end
                    end
                else
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
                        for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                            if v:FindFirstChild("iskiddedfromneptz") then
                                v.iskiddedfromneptz:Destroy()
                            end
                        end
                    end
                    break
                end
            end
        end)
    end
}):AddColorPicker("KillerESPColor", {
    Default = Color3.fromRGB(255, 0, 0),
    Title = "Killer Color",
})
KillersGroup:AddToggle("KillerESPOutline", {
    Text = "Show Outline",
})

-- Survivors ESP + Coin Flip
SurvivorsGroup:AddToggle("SurvivorESP", {
    Text = "Survivors ESP",
    Default = false,
    Callback = function(bool)
        _G.survivors = bool
        task.spawn(function()
            while task.wait() do
                if _G.survivors == true then
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
                        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if not v:FindFirstChild("iskiddedfromneptz") then
                                local hl = Instance.new("Highlight", v)
                                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                hl.Name = "iskiddedfromneptz"
                            else
                                v.iskiddedfromneptz.FillColor = Options.SurvivorsESP.Value
                                v.iskiddedfromneptz.OutlineTransparency = Toggles.SurvivorsESPOutline.Value and 0 or 1
                            end
                        end
                    end
                else
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
                        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:FindFirstChild("iskiddedfromneptz") then
                                v.iskiddedfromneptz:Destroy()
                            end
                        end
                    end
                    break
                end
            end
        end)
    end
}):AddColorPicker("SurvivorsESP", {
    Default = Color3.fromRGB(0, 0, 255),
    Title = "Survivor Color",
})
SurvivorsGroup:AddToggle("SurvivorsESPOutline", {
    Text = "Show Outline",
})

SurvivorsGroup:AddToggle("AutoCoinFlip", {
    Text = "Auto Coin Flip",
    Default = false,
    Callback = function (cool)
        _G.coin = cool
        task.spawn(function ()
            while _G.coin and task.wait(2.1) do
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "CoinFlip")
            end
        end)
    end
})

-- Items ESP / Pickup
ItemsGroup:AddToggle("ItemsESP", {
    Text = "Items ESP",
    Default = false,
    Callback = function(bool)
        _G.items = bool
        task.spawn(function()
            while task.wait() do
                if _G.items == true then
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                            for _, v in pairs(workspace.Map.Ingame:GetDescendants()) do
                                if v:IsA("Tool") and not v:FindFirstChild("iskiddedfromneptz") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "iskiddedfromneptz"
                                    hl.OutlineTransparency = 1
                                elseif v:IsA("Tool") and v:FindFirstChild("iskiddedfromneptz") then
                                    v.iskiddedfromneptz.FillColor = Options.ItemsESPColor.Value
                                    v.iskiddedfromneptz.OutlineTransparency = Toggles.ItemsESPOutline.Value and 0 or 1
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("iskiddedfromneptz") then
                                    v.iskiddedfromneptz:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("ItemsESPColor", {
    Default = Color3.fromRGB(0, 255, 255),
    Title = "Item Color",
})
ItemsGroup:AddToggle("ItemsESPOutline", {
    Text = "Show Outline",
})

ItemsGroup:AddToggle("AutoPickUpNearItems", {
    Text = "Auto Pick Up Near Items",
    Default = false,
    Callback = function (call)
        _G.pickUpNear = call
        task.spawn(function()
            while _G.pickUpNear and task.wait() do
                pcall(function()
                    if isKiller then return end
                    local items = {}
                    if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                        for _, v in pairs(workspace.Map.Ingame:GetDescendants()) do
                            if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                                table.insert(items, v.ItemRoot)
                            end
                        end
                    end
                    for _, itemRoot in pairs(items) do
                        local lp = game.Players.LocalPlayer
                        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                            local magnitude = (lp.Character.HumanoidRootPart.Position - itemRoot.Position).Magnitude
                            if magnitude <= 10 then
                                if itemRoot:FindFirstChild("ProximityPrompt") then
                                    fireproximityprompt(itemRoot.ProximityPrompt)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

ItemsGroup:AddButton({
    Text = "Pick Up Available Items",
    Func = function()
        pcall(function()
            if isKiller then return end
            local items = {}
            if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                for _, v in pairs(workspace.Map.Ingame:GetDescendants()) do
                    if v:IsA("Tool") and v:FindFirstChild("ItemRoot") then
                        table.insert(items, v.ItemRoot)
                    end
                end
            end
            for _, itemRoot in pairs(items) do
                local toolName = itemRoot.Parent and itemRoot.Parent.Name
                if toolName and not game.Players.LocalPlayer.Backpack:FindFirstChild(toolName) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = itemRoot.CFrame
                    task.wait(0.5)
                    if itemRoot:FindFirstChild("ProximityPrompt") then
                        fireproximityprompt(itemRoot.ProximityPrompt)
                    end
                end
            end
        end)
    end
})

ItemsGroup:AddButton({
    Text = "Walk To Random Item",
    Func = function()
        pcall(function ()
            local items = {}
            if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                for _, v in pairs(workspace.Map.Ingame:GetDescendants()) do
                    if v:IsA("Tool") then
                        table.insert(items, v)
                    end
                end
            end
            if #items > 0 and items[1]:FindFirstChild("ItemRoot") then
                pathfindTo(items[math.random(1, #items)].ItemRoot.Position)
            end
        end)
    end
})

-- ========== Local Player Tab ==========
local StaminaGroup = Tabs["Local Player"]:AddLeftGroupbox("Stamina", "biceps-flexed")
StaminaGroup:AddButton({
    Text = "Infinite Stamina",
    Func = function()
        require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.MaxStamina = 9999
        require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting).DefaultConfig.StaminaLoss = 0
        game.StarterGui:SetCore("SendNotification", { Title = "warning", Text = "this effect wont apply until next round, but you only have to press it once this entire session", Duration = 9 })
    end
})
StaminaGroup:AddToggle("AlwaysSprint", {
    Text = "Always Sprint",
    Default = false,
    Callback = function (call)
        _G.alwaysSprint = call
        task.spawn(function()
            while _G.alwaysSprint and task.wait() do
                local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
                if not sprint.IsSprinting then
                    sprint.IsSprinting = true
                    sprint.__sprintedEvent:Fire(true)
                end
            end
        end)
    end
})

local sprintSpeed = 26
StaminaGroup:AddToggle("FastSprint", {
    Text = "Fast Sprint",
    Default = false,
    Callback = function (call)
        _G.fsprint = call
        if call then
            game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "this feature can get you kicked, and is EXTREMELY risky!", Duration = 9 })
        end
    end
})
task.spawn(function ()
    local sprint = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
    while true do
        if _G.fsprint then
            sprint.SprintSpeed = sprintSpeed
        else
            sprint.SprintSpeed = 26
        end
        task.wait()
    end 
end)
StaminaGroup:AddSlider("SprintSpeed", {
    Text = "Sprint Speed",
    Default = 26,
    Min = 26,
    Max = 80,
    Rounding = 0,
    Callback = function (slid) sprintSpeed = slid end
})

local SpeedGroup = Tabs["Local Player"]:AddRightGroupbox("Speed", "wind")
local yeahvariable = 0
SpeedGroup:AddSlider("SpeedBypass", {
    Text = "Speed (Bypass)",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0,
    Callback = function (s) yeahvariable = s end
})
SpeedGroup:AddToggle("SpeedToggle", {
    Text = "Speed Toggle",
    Default = false,
    Callback = function (s)
        _G.mhhmmm = s
        task.spawn(function ()
            local localPlayer = game:GetService("Players").LocalPlayer
            while task.wait() do
                if not _G.mhhmmm then break end
                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.MoveDirection ~= Vector3.zero then
                    localPlayer.Character:TranslateBy(humanoid.MoveDirection * yeahvariable * game:GetService("RunService").RenderStepped:Wait())
                end
            end
        end)
    end
})

local NoclipGroup = Tabs["Local Player"]:AddRightGroupbox("Noclip", "cuboid")
NoclipGroup:AddToggle("EnableNoclip", {
    Text = "Enable Noclip",
    Default = false,
    Callback = function (s)
        if s == true then
            game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "you WILL get kicked if you are inside a wall for more than a second! only use for small shortcuts", Duration = 9 })
        end
        _G.nokia = s
        local cachey = {}
        task.spawn(function ()
            local localPlayer = game:GetService("Players").LocalPlayer
            while task.wait() do
                if not _G.nokia then
                    for _, v in pairs(cachey) do
                        v.CanCollide = true
                    end
                    break
                end
                if localPlayer.Character then
                    for _, v in pairs(localPlayer.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            cachey[v] = v
                            v.CanCollide = false
                        end
                    end
                end
            end
        end)
    end
})

local InfJumpGroup = Tabs["Local Player"]:AddLeftGroupbox("Infinite Jump", "wind")
InfJumpGroup:AddToggle("InfiniteJump", {
    Text = "Infinite Jump",
    Default = false,
    Callback = function (s)
        if s == false then
            if _G.connection then _G.connection:Disconnect() end
            return
        end
        _G.connection = game:GetService("UserInputService").JumpRequest:Connect(function ()
            pcall(function ()
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
        end)
    end
})

-- ========== Killer Tab ==========
local KillerGroup = Tabs.Killer:AddLeftGroupbox("Killer", "skull")
local KillerMisc = Tabs.Killer:AddRightGroupbox("Misc", "cloud")
KillerGroup:AddToggle("AllowKillerEntrances", {
    Text = "Allow Killer Entrances",
    Default = false,
    Callback = function (call)
        _G.killerent = call
        local function s9audioak()
            if not (workspace.Map and workspace.Map.Ingame and workspace.Map.Ingame:FindFirstChild("Map")) then return end
            local walls = workspace.Map.Ingame.Map:FindFirstChild("Killer_Only Wall") or workspace.Map.Ingame.Map:FindFirstChild("KillerOnlyEntrances")
            if not walls then return end
            for _, v in pairs(walls:GetChildren()) do
                v.CanCollide = true
            end
        end
        if not _G.killerent then
            pcall(s9audioak)
            return
        end
        task.spawn(function ()
            while _G.killerent and task.wait() do
                if (workspace.Map and workspace.Map.Ingame and workspace.Map.Ingame:FindFirstChild("Map")) then
                    local walls = workspace.Map.Ingame.Map:FindFirstChild("Killer_Only Wall") or workspace.Map.Ingame.Map:FindFirstChild("KillerOnlyEntrances")
                    if walls then
                        if not _G.killerent then
                            pcall(s9audioak)
                            break
                        end
                        pcall(function ()
                            if workspace.Map.Ingame.Map:FindFirstChild("KillerOnlyEntrances") then
                                for _, v in pairs(workspace.Map.Ingame.Map.KillerOnlyEntrances:GetChildren()) do
                                    v.CanCollide = false
                                end
                            end
                        end)
                    end
                end
            end
        end)
    end
})

KillerGroup:AddToggle("SpectateKiller", {
    Text = "Spectate Killer",
    Default = false,
    Callback = function (state)
        if state then
            local killer = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") and workspace.Players.Killers:GetChildren()[1]
            if killer then
                workspace.CurrentCamera.CameraSubject = killer
            end
        else
            pcall(function()
                workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
            end)
        end
    end
})

KillerGroup:AddButton({
    Text = "Teleport To Killer",
    Func = function ()
        local killer = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") and workspace.Players.Killers:GetChildren()[1]
        if killer then
            pcall(function ()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = killer.PrimaryPart.CFrame
            end)
        end
    end
})

KillerGroup:AddButton({
    Text = "Teleport To Random Survivor",
    Func = function()
        pcall(function()
            if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then return end
            local survs = workspace.Players.Survivors:GetChildren()
            if #survs == 0 then return end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = survs[math.random(1, #survs)].HumanoidRootPart.CFrame
        end)
    end
})

KillerGroup:AddToggle('KillAll', {
    Text = "Kill All",
    Callback = function(s)
        if not Toggles.KillAll.Value then return end
        if game.Players.LocalPlayer:GetNetworkPing() >= 0.3 then
            Toggles.KillAll:SetValue(false)
            return game.StarterGui:SetCore("SendNotification", { Title = "Kill all stopped", Text = "kill all stopped because your ping is too high. try getting better wifi and try again", Duration = 9 })
        end
        if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then Toggles.KillAll:SetValue(false) return end
        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
            local name = v:GetAttribute("Username")
            local plr = game.Players:FindFirstChild(name)
            if plr then
                local skipTimeout = tick()
                while tick() - skipTimeout <= 15 do
                    if game.Players.LocalPlayer:GetNetworkPing() >= 0.3 then
                        Toggles.KillAll:SetValue(false)
                        return game.StarterGui:SetCore("SendNotification", { Title = "Kill all stopped", Text = "kill all stopped because your ping is too high. try getting better wifi and try again", Duration = 9 })
                    end
                    if game.Players:FindFirstChild(name) == nil then  break end
                    if plr.Character == nil then break end
                    if plr.Character:FindFirstChild("Humanoid") == nil then Toggles.KillAll:SetValue(false) return end
                    if plr.Character.Humanoid.Health <= 0 then  break end
                    if not Toggles.KillAll.Value then return end
                    if not (workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame")) then  end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "Slash")
                    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "Punch")
                    task.wait()
                end
            end
        end
    end
})

KillerMisc:AddButton({
    Text = "Walk To Random Survivor",
    Func = function()
        task.spawn(function()
            pcall(function()
                if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then return end
                local survs = workspace.Players.Survivors:GetChildren()
                if #survs == 0 then return end

                local target = survs[math.random(1, #survs)]
                local hrp = target:WaitForChild("HumanoidRootPart")

                while target.Parent and hrp and hrp.Parent do
                    pathfindTo(hrp.Position)
                    task.wait(0.3)
                end
            end)
        end)
    end
})

local function getASurvivor(dist)
    local char = game.Players.LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, s in ipairs(workspace.Players.Survivors:GetChildren()) do
        local h = s:FindFirstChild("HumanoidRootPart")
        if h then
            local d = (hrp.Position - h.Position).Magnitude
            if d < dist then
                return s
            end
        end
    end
end

local function getClosestSurvivor()
    local closest, dist = nil, math.huge
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil, nil end
    for _, s in pairs(workspace.Players.Survivors:GetChildren()) do
        local hrp2 = s:FindFirstChild("HumanoidRootPart")
        if hrp2 then
            local d = (hrp.Position - hrp2.Position).Magnitude
            if d < dist then
                closest = s
                dist = d
            end
        end
    end
    return closest, dist
end

KillerMisc:AddToggle("SlashAura", { 
    Text = "Slash Aura",
    Default = false,
    Callback = function()
        task.spawn(function()
            while Toggles.SlashAura.Value do
                local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local yh = getASurvivor(Options.SlashAuraRange.Value)
                    if yh then
                        print("lowkey found him bro")
                        game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("UseActorAbility", "Slash")
                        game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer("UseActorAbility", "Punch")
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

KillerMisc:AddSlider("SlashAuraRange", {
    Text = "Slash Aura Range",
    Default = 7,
    Min = 4,
    Max = 11,
    Rounding = 0,
})

KillerMisc:AddToggle("HitboxExpander", { 
    Text = "Beta Hitbox Expander",
    Default = false,
})
workspace.Hitboxes.ChildAdded:Connect(function(v)
    if string.find(v.Name, game.Players.LocalPlayer.Name) and Toggles.HitboxExpander.Value then
        local rooting = game.Players.LocalPlayer.Character.HumanoidRootPart
        local startCF = rooting.CFrame
        local shit = rooting.CFrame.LookVector
        local t = tick()
        while ((tick() - t) <= (game.Players.LocalPlayer:GetNetworkPing() + 0.6)) and task.wait() do
            rooting.CFrame = startCF
            rooting.AssemblyLinearVelocity = shit * 70
        end
        rooting.AssemblyLinearVelocity, rooting.Velocity = Vector3.zero, Vector3.zero
    end
end)

-- ========== Teleport Tab ==========
local GensTP = Tabs.Teleport:AddLeftGroupbox("Generators Teleport", "pin")
for i = 1, 5 do
    GensTP:AddButton({
        Text = "Teleport To Generator " .. i,
        Func = function ()
            pcall(function ()
                if not (workspace.Map and workspace.Map.Ingame and workspace.Map.Ingame.Map) then return end
                local gens = {}
                for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" then
                        table.insert(gens, v)
                    end
                end
                if gens[i] and gens[i]:FindFirstChild("Positions") and gens[i].Positions:FindFirstChild("Center") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gens[i].Positions.Center.CFrame + Vector3.new(0, 10, 0)
                end
            end)
        end
    })
end
local GensTP = Tabs.Teleport:AddRightGroupbox("Generators Walk", "pin")
for i = 1, 5 do
    GensTP:AddButton({
        Text = "Walk To Generator " .. i,
        Func = function ()
            local s, r = pcall(function ()
                if not (workspace.Map and workspace.Map.Ingame and workspace.Map.Ingame.Map) then return end
                local gens = {}
                for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" then
                        table.insert(gens, v)
                    end
                end
                if gens[i] and gens[i]:FindFirstChild("Positions") and gens[i].Positions:FindFirstChild("Center") then
                    pcall(pathfindTo, gens[i].Positions.Center.Position)
                end
            end)
            if not s then warn("Pathfind failed", r) end
        end
    })
end
local ItemsTP = Tabs.Teleport:AddRightGroupbox("Items", "shovel")
ItemsTP:AddButton({
    Text = "Teleport To Random Item",
    Func = function ()
        local items = {}
        pcall(function ()
            if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                for _, v in pairs(workspace.Map.Ingame:GetDescendants()) do
                    if v:IsA("Tool") then
                        table.insert(items, v)
                    end
                end
            end
        end)
        if #items > 0 and items[1]:FindFirstChild("ItemRoot") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = items[math.random(1, #items)].ItemRoot.CFrame + Vector3.new(0, 10, 0)
        end
    end
})

-- ========== Misc Tab ==========
local MiscGroup = Tabs.Misc:AddLeftGroupbox("Miscallenous", "circle-question-mark")
MiscGroup:AddToggle("AllowJump", {
    Text = "Allow Jump",
    Default = false,
    Callback = function (s)
        _G.mhhmmm2 = s
        if s then
            game.StarterGui:SetCore("SendNotification", { Title = "KICK WARNING", Text = "WARNING jumping repeatedly will KICK YOU because the game will think you are flying!", Duration = 9 })
        end
        task.spawn(function ()
            local localPlayer = game:GetService("Players").LocalPlayer
            while task.wait() do
                if not _G.mhhmmm2 then break end
                local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.JumpPower = 50
                end
            end
        end)
    end
})
local function FullBright()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
    game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end
MiscGroup:AddButton({
    Text = "No Fog",
    Func = function ()
        for _,v in pairs(game.Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
        game.Lighting.FogEnd = 999999
    end
})
MiscGroup:AddButton({
    Text = "Full Bright",
    Func = FullBright
})
MiscGroup:AddButton({
    Text = "Kill Yourself",
    Func = function ()
        pcall(function ()
            game.Players.LocalPlayer.Character:BreakJoints()
        end)
    end
})
MiscGroup:AddButton({
    Text = "Rejoin",
    Func = function ()
        pcall(function ()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.localPlayer)
        end)
    end
})
MiscGroup:AddToggle('IZD', {
    Text = "Infinite Zoom Distance",
    Callback = function(state)
        game.Players.LocalPlayer.CameraMaxZoomDistance = state and math.huge or 12
    end
})
MiscGroup:AddToggle('IZD', {
    Text = "Camera Noclip",
    Callback = function(state)
        game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode[state and "Invisicam" or "Zoom"]
    end
})

local PopupsGroup = Tabs.Misc:AddRightGroupbox("Popups", "triangle-alert")
PopupsGroup:AddToggle("AutoRemove1x1x1x1", {
    Text = "Auto Remove 1x1x1x1 popups",
    Default = false,
    Callback = function (bool)
        _G.no1x= bool
        task.spawn(function ()
            while _G.no1x and task.wait() do
                local temp = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
                if temp and temp:FindFirstChild("1x1x1x1Popup") then
                    temp["1x1x1x1Popup"]:Destroy()
                    warn("yes its gone")
                end
            end
        end)
    end
})

local canDoRequire = pcall(function()
    require(game:GetService("ReplicatedStorage").Assets.Emotes.AICatDance)
end)
if canDoRequire then
    local EmoteGroup = Tabs.Misc:AddRightGroupbox("Emote As Killer", "party-popper")
    local emoteName = "AICatDance"
    local emoteTable = {}
    for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Emotes:GetChildren()) do
        table.insert(emoteTable, require(v).DisplayName)
    end
    table.sort(emoteTable)
    EmoteGroup:AddDropdown("EmoteDropdown", {
        Values = emoteTable,
        Default = emoteName,
        Multi = false,
        Text = "Select Emote (must own)",
        Callback = function(e) emoteName = e end
    })
    EmoteGroup:AddButton({
        Text = "Play Emote",
        Func = function ()
            local p
            for _, v in pairs(game:GetService("ReplicatedStorage").Assets.Emotes:GetChildren()) do
                if require(v).DisplayName == emoteName then
                    p = v.Name
                    break
                end
            end
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("PlayEmote", "Animations", p)
        end
    });
end

if not _G.useLinoria then
    local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")
    MenuGroup:AddToggle("KeybindMenuOpen", {
        Default = Library.KeybindFrame.Visible,
        Text = "Open Keybind Menu",
        Callback = function(value)
            Library.KeybindFrame.Visible = value
        end,
    })
    MenuGroup:AddButton('Unload', function() Library:Unload() end)
    MenuGroup:AddToggle("ShowCustomCursor", {
        Text = "Custom Cursor",
        Default = true,
        Callback = function(Value)
            Library.ShowCustomCursor = Value
        end,
    })
    MenuGroup:AddDropdown("NotificationSide", {
        Values = { "Left", "Right" },
        Default = "Right",
        Text = "Notification Side",
        Callback = function(Value)
            Library:SetNotifySide(Value)
        end,
    })
    MenuGroup:AddDropdown("DPIDropdown", {
        Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
        Default = "100%",
        Text = "DPI Scale",
        Callback = function(Value)
            Value = Value:gsub("%%", "")
            local DPI = tonumber(Value)
            Library:SetDPIScale(DPI)
        end,
    })
    MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
else
    local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
    MenuGroup:AddButton('Unload', function() Library:Unload() end)
    MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
end
Library.ToggleKeybind = Options.MenuKeybind
-- Managers
if not _G.useLinoria then
    ThemeManager:SetLibrary(Library)
    ThemeManager:ApplyToTab(Tabs["UI Settings"])
    ThemeManager:SetFolder("NXP_Hub")
    ThemeManager:ApplyTheme("Tokyo Night")
end
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
if not _G.useLinoria then SaveManager:SetSubFolder("Forsaken") end
SaveManager:SetFolder("NXP_Hub/Forsaken")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

if _G.useLinoria then
    while task.wait() do
        Library.AccentColor = Library.CurrentRainbowColor
        Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
        Library:UpdateColorsUsingRegistry()
    end
end
