-- NXP Hub forsaken source code, do not copy any of the code in here please, its my work and you dont have permission to use it.

-- Added some extra features and fixed some bugs
-- Updated version to V2.2 (are we making improvements chat)

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
            repeat hum:MoveTo(waypoint.Position) task.wait() until ((root.Position * Vector3.new(1, 0, 1)) - (waypoint.Position * Vector3.new(1, 0, 1))).magnitude <= 2 or not plr.Character.HumanoidRootPart or hNow ~= h
            if waypoint.Action == Enum.PathWaypointAction.Jump then
                hum.Jump = true
            end
        end
    else
        warn("Path failed!")
    end
end

local autoBlockAnimations = {"rbxassetid://94067586317868", "rbxassetid://107925328038675"} -- like basic slash animations ig
local autoBlockVar
local function hasAbility(name)
    return game:GetService("Players").LocalPlayer.PlayerGui.MainUI:FindFirstChild("AbilityContainer")
        and game:GetService("Players").LocalPlayer.PlayerGui.MainUI.AbilityContainer:FindFirstChild(name)
end
local function hasAbilityReady(name)
    if not hasAbility(name) then
        return false
    end
    return hasAbility(name).CooldownTime.Text == ""
end
local actor = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
if identifyexecutor() ~= "Xeno" and identifyexecutor() ~= "Solara" then
    local function trackAnimations(char)
        local humanoid = char:WaitForChild("Humanoid", 5)
        if not humanoid then return end
        
        local animator = humanoid:WaitForChild("Animator", 5)
        if not animator then return end

        animator.AnimationPlayed:Connect(function(track)
            if hasAbilityReady("Block") and isSurvivor and autoBlockVar and table.find(autoBlockAnimations, track.Animation.AnimationId) then
                warn("fucking hitting")
                if killerModel then
                    local suc, res = pcall(function()
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - killerModel.HumanoidRootPart.Position).magnitude <= 13 then
                            _G._Notify("Blocking", "Hit detected, trying to block", 5)
                            task.wait(Options.AutoBlockMS.Value / 1000)
                            actor.FireServer(actor, "UseActorAbility", "Block")
                            _G._Notify("Blocked", "Hit blocked, you might've still taken damage though", 5)
                        end
                    end)
                    if not suc then
                        warn("error when auto blocking:", res)
                    end
                end
            end
        end)
    end

    workspace.Players.Killers.ChildAdded:Connect(function(killer)
        trackAnimations(killer)
    end)

    for _, killer in ipairs(workspace.Players.Killers:GetChildren()) do
        trackAnimations(killer)
    end

    local killers = game:GetService("ReplicatedStorage").Assets.Killers
    local function getanims(name)
        return killers:FindFirstChild(name) and require(killers[name].Config).Animations
    end
    local jason = getanims("Slasher")
    if jason then
        table.insert(autoBlockAnimations, jason.Slash)
        table.insert(autoBlockAnimations, jason.Behead)
        table.insert(autoBlockAnimations, jason.GashingWoundStart)
    end
    local mathguy = getanims("1x1x1x1")
    if mathguy then
        table.insert(autoBlockAnimations, mathguy.Slash)
        table.insert(autoBlockAnimations, mathguy.MassInfection)
        table.insert(autoBlockAnimations, mathguy.Entanglement)
    end
    local johndoe = getanims("JohnDoe")
    if johndoe then
        table.insert(autoBlockAnimations, johndoe.Slash)
    end
    local noli = getanims("Noli")
    if noli then
        table.insert(autoBlockAnimations, noli.Stab)
        table.insert(autoBlockAnimations, noli.VoidRush.StartDashInit)
    end
    local coolkid = getanims("c00lkidd")
    if coolkid then
        table.insert(autoBlockAnimations, coolkid.Attack)
        table.insert(autoBlockAnimations, coolkid.WalkspeedOverrideStart)
    end
else
    if _G.useLinoria then
        Library:Notify("Your executor is bad! Please dont expect many features to run properly", 6)
    else
        Library:Notify({
            Title = "Bad executor",
            Description = "Your executor is bad! Please dont expect many features to run properly",
            Time = 6,
        })
    end
end

local repo = _G.useLinoria and "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/" or "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
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
_G._Notify = Notify

Options = Library.Options or Options
Toggles = Library.Toggles or Toggles

local Window
if not _G.useLinoria then
    Window = Library:CreateWindow({
        Title = "NXP hub V2.2",
        Footer = "Forsaken",
        Icon = "rbxassetid://130931198530758",
        NotifySide = "Right",
        ShowCustomCursor = true,
        Size = UDim2.fromOffset(736, 450)
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
    ESP = Window:AddTab("Visuals", "eye"),
    ["Local Player"] = Window:AddTab("Local Player", "user"),
    Killer = Window:AddTab("Killer", "skull"),
    Teleport = Window:AddTab("Locations", "pin"),
    Anti = Window:AddTab("Antis", "ban"),
    Misc = Window:AddTab("Misc", "cloudy"),
    ["UI Settings"] = Window:AddTab("UI Settings", "wrench"),
}


task.spawn(function()
    while task.wait() do
        local _isKiller = false
        if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
            for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                if v:GetAttribute("Username") and game.Players:FindFirstChild(v:GetAttribute("Username")) then
                    killerModel = v
                end
                if v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
                    killerModel = v
                    _isKiller = true
                end
            end
            isSurvivor = not _isKiller
            isKiller = _isKiller
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
local SurvivorsGroup = Tabs.Main:AddRightGroupbox("Survivors", "user")
local ItemsGroup = Tabs.Main:AddLeftGroupbox("Items", "shovel")
local AimbotGroup = Tabs.Main:AddRightGroupbox("Aimbot", "mouse")

local GeneratorsESPGroup = Tabs.ESP:AddLeftGroupbox("Generators", "battery-charging")
local KillersESPGroup = Tabs.ESP:AddLeftGroupbox("Killers", "skull")
local SurvivorsESPGroup = Tabs.ESP:AddRightGroupbox("Survivors", "user")
local ItemsESPGroup = Tabs.ESP:AddRightGroupbox("Items", "shovel")

local function generatorWait()
    task.wait(Options.GeneratorDelay1.Value < Options.GeneratorDelay2.Value and math.random(Options.GeneratorDelay1.Value * 10, Options.GeneratorDelay2.Value * 10) / 10 or math.random(Options.GeneratorDelay2.Value * 10, Options.GeneratorDelay1.Value * 10) / 10)
end

GeneratorsESPGroup:AddToggle("GeneratorsESP", {
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
                                if v.Name == "Generator" and not v:FindFirstChild("gen_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "gen_esp"
                                elseif v:FindFirstChild("gen_esp") and v.Name == "Generator" then
                                    v.gen_esp.OutlineTransparency = Toggles.GeneratorESPOutline.Value and 0 or 1
                                    if v:FindFirstChild("Progress") then
                                        if v.Progress.Value < 100 or not Toggles.GeneratorsESPGreen.Value then
                                            v.gen_esp.FillColor = Options.GeneratorsESPColor.Value
                                        end
                                    end
                                    if v:FindFirstChild("Progress") and v.Progress.Value >= 100 and Toggles.GeneratorsESPGreen.Value then
                                        v.gen_esp.FillColor = Color3.fromRGB(0, 255, 0)
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v.Name == "Generator" and v:FindFirstChild("gen_esp") then
                                    v.gen_esp:Destroy()
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
GeneratorsESPGroup:AddToggle("GeneratorESPOutline", {
    Text = "Show Outline",
})

GeneratorsESPGroup:AddToggle("GeneratorsESPGreen", {
    Text = "Show Green When Done",
})

GeneratorsESPGroup:AddToggle("GeneratorsNametags", {
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
                                    text.TextStrokeTransparency = 0
                                    text.Text = "Generator (" .. (v:FindFirstChild("Progress") and v.Progress.Value or 0) .. "%)"
                                    text.TextSize = 15
                                    text.BackgroundTransparency = 1
                                    text.Size = UDim2.new(1, 0, 1, 0)
                                elseif v:FindFirstChild("nametag") and v.Name == "Generator" then
                                    v.nametag.TextLabel.TextColor3 = Options.GeneratorsNametagsColor.Value
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
}):AddColorPicker("GeneratorsNametagsColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Nametag Color",
})

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
                    local suc, res = pcall(function()
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
                                        generatorWait()
                                    end
                                    activelyAutoing = false
                                    return ""
                                end))
                            end
                        end
                    end)
                    if not suc then
                        warn("error when auto completing generator:", res)
                    end
                end
            end
        end)
    end
})

GeneratorsGroup:AddToggle("AutoStartGenerator", {
    Text = "Auto Start Generator",
    Default = false,
    Callback = function(bool)
        _G.autoGen = bool
        task.spawn(function()
            while _G.autoGen and task.wait() do
                if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                    local suc, res = pcall(function()
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
                    if not suc then
                        warn("error when starting generator:", res)
                    end
                end
            end
        end)
    end
})

GeneratorsGroup:AddButton({
    Text = "Complete Active Generator",
    Func = function()
        if activelyAutoing then return end
        local suc, res = pcall(function()
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
                                    generatorWait()
                                end
                            end
                        end
                    end)
                end
            end
        end)
        if not suc then
            warn("error when completing current generator:", res)
        end
    end
})

GeneratorsGroup:AddButton({
    Text = "Complete All Generators",
    Func = function()
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
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
                            generatorWait()
                        end
                    end)
                end
            end
        end)
        if not suc then
            warn("error when completing generators:", res)
        end
    end
})

GeneratorsGroup:AddSlider("GeneratorDelay1", {
    Text = "Puzzle Delay 1",
    Default = 1.2,
    Min = 1.2,
    Max = 16,
    Rounding = 1,
})

GeneratorsGroup:AddSlider("GeneratorDelay2", {
    Text = "Puzzle Delay 2",
    Default = 1.2,
    Min = 1.2,
    Max = 16,
    Rounding = 1,
})

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
                            cam.CFrame = CFrame.new(cam.CFrame.Position, root.Position + (Toggles.AimbotPrediction.Value and (v.HumanoidRootPart.Velocity * (10 / Options.PredictionLevel.Value)) or Vector3.one))
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

KillersESPGroup:AddToggle("KillerESP", {
    Text = "Killer ESP",
    Default = false,
    Callback = function(bool)
        _G.killers = bool
        task.spawn(function()
            while task.wait() do
                if _G.killers == true and not isKiller then
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
                        for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                            if not v:FindFirstChild("killer_esp") then
                                local hl = Instance.new("Highlight", v)
                                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                hl.Name = "killer_esp"
                                hl.OutlineTransparency = 1
                            else
                                v.killer_esp.FillColor = Options.KillerESPColor.Value
                                v.killer_esp.OutlineTransparency = Toggles.KillerESPOutline.Value and 0 or 1
                            end
                        end
                    end
                else
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers") then
                        for _, v in pairs(workspace.Players.Killers:GetChildren()) do
                            if v:FindFirstChild("killer_esp") then
                                v.killer_esp:Destroy()
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
KillersESPGroup:AddToggle("KillerESPOutline", {
    Text = "Show Outline",
})

KillersESPGroup:AddToggle("KillersNametags", {
    Text = "Killer Nametag",
    Default = false,
    Callback = function(bool)
        _G.killertag = bool
        task.spawn(function()
            while task.wait() do
                if _G.killertag then
                    pcall(function()
                        local v = killerModel
                        if v and not v:FindFirstChild("nametag") then
                            local bb = Instance.new("BillboardGui", v)
                            bb.Size = UDim2.new(4, 0, 1, 0)
                            bb.AlwaysOnTop = true
                            bb.Name = "nametag"
                            local text = Instance.new("TextLabel", bb)
                            text.TextStrokeTransparency = 0
                            text.Text = "Killer"
                            text.TextSize = 15
                            text.BackgroundTransparency = 1
                            text.Size = UDim2.new(1, 0, 1, 0)
                        elseif v and v:FindFirstChild("nametag") then
                            v.nametag.TextLabel.TextColor3 = Options.KillerNametagColor.Value
                        end
                    end)
                else
                    pcall(function()
                        if killerModel and killerModel:FindFirstChild("nametag") then
                            killerModel.nametag:Destroy()
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("KillerNametagColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color",
})

SurvivorsESPGroup:AddToggle("SurvivorESP", {
    Text = "Survivors ESP",
    Default = false,
    Callback = function(bool)
        _G.survivors = bool
        task.spawn(function()
            while task.wait() do
                if _G.survivors == true then
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
                        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:GetAttribute("Username") ~= game.Players.LocalPlayer.Name then
                                if not v:FindFirstChild("survivor_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "survivor_esp"
                                else    
                                    v.survivor_esp.FillColor = Options.SurvivorsESP.Value
                                    v.survivor_esp.OutlineTransparency = Toggles.SurvivorsESPOutline.Value and 0 or 1
                                end
                            end
                        end
                    end
                else
                    if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors") then
                        for _, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:FindFirstChild("survivor_esp") then
                                v.survivor_esp:Destroy()
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
SurvivorsESPGroup:AddToggle("SurvivorsESPOutline", {
    Text = "Show Outline",
})

SurvivorsESPGroup:AddToggle("SurvivorsNametags", {
    Text = "Survivors Nametag",
    Default = false,
    Callback = function(bool)
        _G.survivorstag = bool
        task.spawn(function()
            while task.wait() do
                if _G.survivorstag then
                    pcall(function()
                        for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:GetAttribute("Username") ~= game.Players.LocalPlayer.Name then
                                if not v:FindFirstChild("nametag") then
                                    local bb = Instance.new("BillboardGui", v)
                                    bb.Size = UDim2.new(4, 0, 1, 0)
                                    bb.AlwaysOnTop = true
                                    bb.Name = "nametag"
                                    local text = Instance.new("TextLabel", bb)
                                    text.TextStrokeTransparency = 0
                                    text.Text = "Survivor"
                                    text.TextSize = 15
                                    text.BackgroundTransparency = 1
                                    text.Size = UDim2.new(1, 0, 1, 0)
                                elseif v:FindFirstChild("nametag") then
                                    v.nametag.TextLabel.TextColor3 = Options.SurvivorNametagColor.Value
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        for i, v in pairs(workspace.Players.Survivors:GetChildren()) do
                            if v:FindFirstChild("nametag") then
                                v.nametag:Destroy()
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("SurvivorNametagColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color",
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

-- silent aim bruh
local SilentAimGroup = Tabs.Main:AddLeftGroupbox("Silent Aim", "swords")
SilentAimGroup:AddToggle("DusekkarSilentAim", {
    Text = "Dusekkar Silent Aim",
})
SilentAimGroup:AddToggle("CoolkidSilentAim", {
    Text = "c00lkid Silent Aim",
})
local suc, res = pcall(function()
    local isDusekkar = false
    local isCoolkid
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        if typeof(self) == "Instance" and tostring(self) == "RemoteEvent" then
            if ({...})[2] == "PlasmaBeam" then
                isDusekkar = true
                task.spawn(function()
                    task.wait(3)
                    isDusekkar = false
                end)
            elseif ({...})[2] == "CorruptNature" then
                isCoolkid = true
                task.spawn(function()
                    task.wait(3)
                    isCoolkid = false
                end)
            end
        end
        return old(self, ...)
    end)
    local gmp = require(game:GetService("ReplicatedStorage").Systems.Player.Miscellaneous.GetPlayerMousePosition).GetMousePos
    local old; old = hookfunction(gmp, newcclosure(function()
        if isDusekkar and killerModel and Toggles.DusekkarSilentAim.Value then
            return killerModel.HumanoidRootPart.Position
        end
        if isCoolkid and getClosestSurvivor() and Toggles.CoolkidSilentAim.Value then
            return getClosestSurvivor().HumanoidRootPart.Position
        end
        return old()
    end))
end)
if not suc then
    warn("error in silent aim:", res)
else
    print("dusekkar set up")
end

SurvivorsGroup:AddToggle("AutoBlock", {
    Text = "Auto Block",
    Default = false,
    Callback = function(cool)
        autoBlockVar = cool
        if autoBlockVar then
            Notify("beware", "this feature is very beta IDK in what cases it works LOL", 7)
        end
    end
})
SurvivorsGroup:AddSlider("AutoBlockMS", {
    Text = "Block Delay [ms]",
    Default = 110,
    Min = 0,
    Max = 300,
    Rounding = 0
})

local function hasNotification(text)
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notis:GetChildren()) do
        if string.find(v.Text:lower(), text) then
            return true
        end
    end
end
local function backstab(model)
    if not model then
        return
    else
        local stabbing = tick()
        local oldCf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        task.spawn(function()
            task.wait(0.2)
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "Dagger")
        end)
        repeat
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = model.HumanoidRootPart.CFrame - (model.HumanoidRootPart.CFrame.LookVector * 1)
            task.wait()
        until (tick() - stabbing >= 3.5) or hasNotification("stab")
        task.wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCf
    end
end
local function backstabClose(model)
    if not model then
        return
    else
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - model.HumanoidRootPart.Position).magnitude <= Options.BackstabRange.Value then
            backstab(model)
        end
    end
end
SurvivorsGroup:AddToggle("AutoDagger", {
    Text = "Auto Backstab",
    Default = false,
    Callback = function(cool)
        task.spawn(function()
            while Toggles.AutoDagger.Value and task.wait(0.1) do
                if hasAbilityReady("Dagger") and isSurvivor then
                    local suc, res = pcall(backstab, killerModel)
                    if not suc then
                        warn("error when backstabbing:", res)
                    end
                end
            end
        end)
    end
})
SurvivorsGroup:AddToggle("DaggerAura", {
    Text = "Backstab Aura",
    Default = false,
    Callback = function(cool)
        task.spawn(function()
            while Toggles.DaggerAura.Value and task.wait(0.1) do
                if not Toggles.AutoDagger.Value and hasAbilityReady("Dagger") and isSurvivor then
                    local suc, res = pcall(backstabClose, killerModel)
                    if not suc then
                        warn("error when backstabbing near killer:", res)
                    end
                end
            end
        end)
    end
})
SurvivorsGroup:AddSlider("BackstabRange", {
    Text = "Backstab Aura Range",
    Default = 20,
    Min = 7,
    Max = 99,
    Rounding = 0
})

ItemsESPGroup:AddToggle("ItemsESP", {
    Text = "Items ESP",
    Default = false,
    Callback = function(bool)
        _G.items = bool
        task.spawn(function()
            while task.wait() do
                if _G.items == true then
                    local suc, res = pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                            for _, v in pairs(workspace.Map.Ingame:GetChildren()) do
                                if v:IsA("Tool") and not v:FindFirstChild("tool_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "tool_esp"
                                    hl.OutlineTransparency = 1
                                elseif v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp.FillColor = Options.ItemsESPColor.Value
                                    v.tool_esp.OutlineTransparency = Toggles.ItemsESPOutline.Value and 0 or 1
                                end
                            end
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and not v:FindFirstChild("tool_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "tool_esp"
                                    hl.OutlineTransparency = 1
                                elseif v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp.FillColor = Options.ItemsESPColor.Value
                                    v.tool_esp.OutlineTransparency = Toggles.ItemsESPOutline.Value and 0 or 1
                                end
                            end
                        end
                    end)
                    if not suc then
                        warn("error when adding item esp:", res)
                    end
                else
                    local suc, res = pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(workspace.Map.Ingame:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp:Destroy()
                                end
                            end
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp:Destroy()
                                end
                            end
                        end
                    end)
                    if not suc then
                        warn("error when removing item esp:", res)
                    end
                    break
                end
            end
        end)
    end
}):AddColorPicker("ItemsESPColor", {
    Default = Color3.fromRGB(0, 255, 255),
    Title = "Item Color",
})
ItemsESPGroup:AddToggle("ItemsESPOutline", {
    Text = "Show Outline",
})

ItemsESPGroup:AddToggle("ItemsNametags", {
    Text = "Items Nametag",
    Default = false,
    Callback = function(bool)
        _G.killertag = bool
        task.spawn(function()
            while task.wait() do
                if _G.killertag then
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                            for _, v in pairs(workspace.Map.Ingame:GetChildren()) do
                                if v:IsA("Tool") then
                                    if not v:FindFirstChild("tool_nametag") then
                                        local bb = Instance.new("BillboardGui", v)
                                        bb.Size = UDim2.new(4, 0, 1, 0)
                                        bb.AlwaysOnTop = true
                                        bb.Name = "tool_nametag"
                                        local text = Instance.new("TextLabel", bb)
                                        text.TextStrokeTransparency = 0
                                        text.Text = (v.Name == "BloxyCola" and "Bloxy Cola") or v.Name
                                        text.TextSize = 15
                                        text.BackgroundTransparency = 1
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                    elseif v:FindFirstChild("tool_nametag") then
                                        v.tool_nametag.TextLabel.TextColor3 = Options.itemNametagColor.Value
                                    end
                                end
                            end
                            for _, v in pairs(workspace.Map.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") then
                                    if not v:FindFirstChild("tool_nametag") then
                                        local bb = Instance.new("BillboardGui", v)
                                        bb.Size = UDim2.new(4, 0, 1, 0)
                                        bb.AlwaysOnTop = true
                                        bb.Name = "tool_nametag"
                                        local text = Instance.new("TextLabel", bb)
                                        text.TextStrokeTransparency = 0
                                        text.Text = (v.Name == "BloxyCola" and "Bloxy Cola") or v.Name
                                        text.TextSize = 15
                                        text.BackgroundTransparency = 1
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                    elseif v:FindFirstChild("tool_nametag") then
                                        v.tool_nametag.TextLabel.TextColor3 = Options.itemNametagColor.Value
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") then
                            for _, v in pairs(workspace.Map.Ingame:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_nametag") then
                                    v.tool_nametag:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
}):AddColorPicker("itemNametagColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color",
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
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
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

local StaminaGroup = Tabs["Local Player"]:AddLeftGroupbox("Stamina", "biceps-flexed")
local oldstamina
StaminaGroup:AddToggle("InfStamina", {
    Text = "Infinite Stamina",
    Callback = function(Val)
        local sprintmodule = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
        if Val then
            oldstamina = sprintmodule.Stamina
            task.spawn(function()
                while Toggles.InfStamina.Value do
                    sprintmodule.Stamina = sprintmodule.MaxStamina
                    sprintmodule.__staminaChangedEvent:Fire()
                    task.wait()
                end
            end)
        else
            sprintmodule.Stamina = oldstamina
            sprintmodule.__staminaChangedEvent:Fire()
        end
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

local InfJumpGroup = Tabs["Local Player"]:AddLeftGroupbox("Misc", "wind")
local up, down
local uis = game:GetService("UserInputService")
uis.InputBegan:Connect(function(h,g)
    if h.KeyCode == Enum.KeyCode.LeftShift then
        down = true
    end
    if h.KeyCode == Enum.KeyCode.Space then
        if g then return end
        up = true
    end
end)
uis.InputEnded:Connect(function(h,g)
    if h.KeyCode == Enum.KeyCode.LeftShift then
        down = false
    end
    if h.KeyCode == Enum.KeyCode.Space then
        if g then return end
        up = false
    end
end)
local localPlayer = game.Players.LocalPlayer
local fly = InfJumpGroup:AddToggle("InfiniteJump", {
    Text = "Fly",
    Default = false,
    Callback = function ()
        task.spawn(function()
            while Toggles.InfiniteJump.Value and task.wait() do
                if localPlayer.Character then
                    local root = localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        local vel = 2.45
                        if up then
                            vel = vel + Options.FlyVerticalSpeed.Value - 2.45
                        end
                        if down then
                            vel = vel - Options.FlyVerticalSpeed.Value + 2.45
                        end
                        if root then
                            root.Velocity = Vector3.new(root.Velocity.X, vel, root.Velocity.Z)
                            if localPlayer.Character.Humanoid.MoveDirection ~= Vector3.zero then
                                localPlayer.Character:TranslateBy(localPlayer.Character.Humanoid.MoveDirection * Options.FlySpeed.Value * game:GetService("RunService").RenderStepped:Wait())
                            end
                        end
                    end
                end
            end
        end)
    end
})
fly:AddKeyPicker("KeyPicker", {
	Default = "Z",
	Text = "fly keybind",
	NoUI = false,
	Callback = function()
        print("h")
		Toggles.InfiniteJump:SetValue(not Toggles.InfiniteJump.Value)
	end,
})
InfJumpGroup:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 0,
})
InfJumpGroup:AddSlider("FlyVerticalSpeed", {
    Text = "Fly Vertical Speed",
    Default = 34,
    Min = 7,
    Max = 80,
    Rounding = 0,
})

local loopRunning, loopThread, currentAnim, lastAnim
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75804462760596"
InfJumpGroup:AddToggle("Invis", {
    Text = "Invisibility",
    Default = false,
    Callback = function(Value)
        if game.PlaceId ~= 18687417158 then
            if not Value then return end
            return Notify("Please use in real forsaken", "Invisibility doesnt work in games that are not the real forsaken", 8)
        end
        if Value then
            Notify("Warning", "You can still be seen when people use certain abilities or if they have the collision hitboxes setting on.", 6)
            loopRunning = true
            loopThread = task.spawn(function()
                while loopRunning do
                    local hum = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("Humanoid")
                    if hum then
                        for _, v in pairs(localPlayer.Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                    if hum then
                        local loadedAnim = hum:LoadAnimation(anim)
                        currentAnim = loadedAnim
                        loadedAnim.Looped = false
                        loadedAnim:Play()
                        loadedAnim:AdjustSpeed(0)
                        task.wait(0.1)
                        if lastAnim then
                            lastAnim:Stop()
                            lastAnim:Destroy()
                        end
                        lastAnim = currentAnim
                    else
                        currentAnim = nil
                    end
                    task.wait()
                end
            end)
        else
            loopRunning = false
            if loopThread then
                loopRunning = false
                task.cancel(loopThread)
            end
            if currentAnim then
                currentAnim:Stop()
                currentAnim = nil
            end
            local Humanoid = localPlayer.Character and (localPlayer.Character:FindFirstChildOfClass("Humanoid") or localPlayer.Character:FindFirstChildOfClass("AnimationController"))
            if Humanoid then
                for _, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
                    v:AdjustSpeed(100000)
                end
                for _, v in pairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
            local animateScript = localPlayer.Character and localPlayer.Character:FindFirstChild("Animate")
            if animateScript then
                animateScript.Disabled = true
                animateScript.Disabled = false
            end
        end
    end
})

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
                            local walls = workspace.Map.Ingame.Map:FindFirstChild("Killer_Only Wall") or workspace.Map.Ingame.Map:FindFirstChild("KillerOnlyEntrances")
                            if walls then
                                for _, v in pairs(walls:GetChildren()) do
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
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
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
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
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
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
        if isSurvivor then
            return Notify("Please be killer", "To use this feature, you must be killer", 7)
        end
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
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end
            pcall(function()
                if not (workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")) then return end
                local survs = workspace.Players.Survivors:GetChildren()
                if #survs == 0 then return end

                local target = survs[math.random(1, #survs)]
                local hrp = target:WaitForChild("HumanoidRootPart")

                while target.Parent and hrp and hrp.Parent and (localPlayer.Character.Humanoid.Position - hrp.Position).magnitude >= 5 do
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

function getClosestSurvivor()
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
    Text = "Reach Expander",
    Default = false,
})

KillerMisc:AddButton({
    Text = "Fling Killer",
    Func = function()
        Notify("warning", "this feature kinda only works in some certain fake forsaken games cuz forsaken has collision stuff", 7)
        if isKiller then
            return Notify("Trying to fling yourself", "you're the killer buddy", 7)
        end
        if playingState == "Spectating" then
            return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
        end
        pcall(function()
            if killerModel and isSurvivor then
                local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local fail = tick()
                    local old = hrp.CFrame
                    for _, v in pairs(localPlayer.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                    repeat
                        hrp.Velocity = Vector3.new(0, -10000, 0)
                        hrp.CFrame = killerModel.HumanoidRootPart.CFrame
                        if killerModel.HumanoidRootPart.Velocity.magnitude >= 50 then
                            Notify("Success?", "If the killer got fling, he will respawn in a random spot, or in very rare cases he will die", 7)
                            break
                        end
                        task.wait()
                    until tick() - fail >= 3
                    for _, v in pairs(localPlayer.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                        end
                    end
                    hrp.Velocity = Vector3.zero
                    hrp.CFrame = old
                end
            end
        end)
    end
})

local function getHitboxesFromPlayer()
    for i, v in pairs(game.Workspace.Hitboxes:GetChildren()) do
        if string.find(v.Name, game.Players.LocalPlayer.Name) then
            return true
        end
    end
end
game:GetService("RunService").Heartbeat:Connect(function()
    if Toggles.HitboxExpander.Value and getHitboxesFromPlayer() then
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart
        if hrp then
            local currentVelocity = hrp.Velocity
            hrp.AssemblyLinearVelocity = hrp.CFrame.LookVector * 250
            game:GetService("RunService").RenderStepped:Wait()
            hrp.Velocity = currentVelocity 
        end
    end
end)

local GensTP = Tabs.Teleport:AddLeftGroupbox("Generators Teleport", "pin")
for i = 1, 5 do
    GensTP:AddButton({
        Text = "Teleport To Generator " .. i,
        Func = function ()
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end
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
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end
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
            if playingState == "Spectating" then
                return Notify("Must be in the round", "Cannot use this feature while spectating", 7)
            end
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
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
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

Players = game:GetService("Players")
MarketplaceService = game:GetService("MarketplaceService")
RunService = game:GetService("RunService")
player = Players.LocalPlayer

replacementAnimations = {
    idle = "rbxassetid://134624270247120",
    walk = "rbxassetid://132377038617766",
    run = "rbxassetid://115946474977409"
}

animationNameCache = {}
currentTrack = nil
currentType = nil
toggleEnabled = false

getAnimationNameFromId = function(assetId)
    if animationNameCache[assetId] then
        return animationNameCache[assetId]
    end

    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(assetId)
    end)

    if success and info and info.Name then
        animationNameCache[assetId] = info.Name
        return info.Name
    end

    return nil
end

playReplacementAnimation = function(animator, animType)
    if currentTrack then
        currentTrack:Stop()
    end

    local anim = Instance.new("Animation")
    anim.AnimationId = replacementAnimations[animType]
    local track = animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Movement
    track:Play()

    currentTrack = track
    currentType = animType
end

setupCharacter = function(char)
    local humanoid = char:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end

    RunService.Heartbeat:Connect(function()
        if toggleEnabled and currentTrack then
            if currentType == "idle" then
                currentTrack:AdjustSpeed(1)
            elseif currentType == "walk" then
                currentTrack:AdjustSpeed(humanoid.WalkSpeed / 12)
            elseif currentType == "run" then
                currentTrack:AdjustSpeed(humanoid.WalkSpeed / 26)
            end
        end
    end)

    animator.AnimationPlayed:Connect(function(track)
        if toggleEnabled then
            local animationId = track.Animation.AnimationId
            local assetId = animationId:match("%d+")

            if assetId then
                local animName = getAnimationNameFromId(tonumber(assetId))
                if animName then
                    local lowerName = animName:lower()

                    if lowerName:find("idle") then
                        track:Stop()
                        playReplacementAnimation(animator, "idle")
                    elseif lowerName:find("walk") then
                        track:Stop()
                        playReplacementAnimation(animator, "walk")
                    elseif lowerName:find("run") then
                        track:Stop()
                        playReplacementAnimation(animator, "run")
                    end
                end
            end
        end
    end)
end

if player.Character then
    setupCharacter(player.Character)
end
player.CharacterAdded:Connect(setupCharacter)

MiscGroup:AddToggle("FakeInjure", {
    Text = "Fake Injured Animations",
    Callback = function(value)
        toggleEnabled = value
        if not value and currentTrack then
            currentTrack:Stop()
        end
    end
})

local function pressReturnButton()
    if not firesignal then
        return print("🥺")
    else
        local exists, GUI = pcall(function()
            return game:GetService("Players").LocalPlayer.PlayerGui.EndScreen.Main.Return
        end)
        if not exists then
            return
        else
            firesignal(GUI.MouseButton1Click)
        end
    end
end
MiscGroup:AddToggle("AutoLobby", {
    Text = "Auto Lobby",
    Callback = function(value)
        task.spawn(function()
            while Toggles.AutoLobby.Value and task.wait(0.2) do
                pressReturnButton()
            end
        end)
    end
})

pcall(function()
    if workspace.Players.Spectating:FindFirstChild(localPlayer.Name) then
        playingState = "Spectating"
    else
        playingState = "Playing"
    end
    workspace.Players.Spectating.ChildAdded:Connect(function(v)
        if v.Name == localPlayer.Name then
            playingState = "Spectating"
            Notify("Playing state", playingState, 7)
        end
    end)
    workspace.Players.Spectating.ChildRemoved:Connect(function(v)
        if v.Name == localPlayer.Name then
            playingState = "Playing"
            Notify("Playing state", "In Round", 7)
        end
    end)
    MiscGroup:AddToggle('AlwaysShowChat', {
        Text = "Always Show Chat",
        Callback = function(state)
            if state then
                _G.showChat = true
                task.spawn(function()
                    while _G.showChat and task.wait() do
                        game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = true
                    end
                end)
            else
                _G.showChat = false
                if playingState ~= "Spectating" then
                    game:GetService("TextChatService"):FindFirstChildOfClass("ChatWindowConfiguration").Enabled = false
                end
            end
        end
    })

    local KillerChanceText = MiscGroup:AddLabel({
        Text = "Chance to be killer: n/a%",
    })
    task.spawn(function()
        while true do
            KillerChanceText:SetText(string.format("Chance to be killer: %d%%", localPlayer.leaderstats.KillerChance.Value))
            task.wait(0.3)
        end
    end)
end)

local AntiGroup = Tabs.Anti:AddLeftGroupbox("Anti", "ban")
AntiGroup:AddToggle("AutoRemove1x1x1x1", {
    Text = "Anti 1x1x1x1 popups",
    Default = false,
    Callback = function (bool)
        _G.no1x= bool
        task.spawn(function ()
            while _G.no1x and task.wait() do
                local temp = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TemporaryUI")
                if temp and temp:FindFirstChild("1x1x1x1Popup") then
                    if firesignal then
                        firesignal(temp["1x1x1x1Popup"].MouseButton1Click)
                    end
                    warn("yes its gone, maybe")
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiStun", {
    Text = "Anti Stun",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiStun.Value and task.wait() do
                if localPlayer.Character and localPlayer.Character:FindFirstChild("SpeedMultipliers") then
                    if localPlayer.Character.SpeedMultipliers:FindFirstChild("Stunned") then
                        localPlayer.Character.SpeedMultipliers:FindFirstChild("Stunned").Value = 1
                    end
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiSlow", {
    Text = "Anti Slow",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiSlow.Value and task.wait() do
                if localPlayer.Character and localPlayer.Character:FindFirstChild("SpeedMultipliers") then
                    for i, v in localPlayer.Character.SpeedMultipliers:GetChildren() do
                        if v.Value < 1 then
                            v.Value = 1
                        end
                    end
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiBlindness", {
    Text = "Anti Blindness",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiBlindness.Value and task.wait() do
                if game.Lighting:FindFirstChild("BlindnessBlur") then
                    game.Lighting.BlindnessBlur:Destroy()
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiSubspace", {
    Text = "Anti Subspace",
    Default = false,
    Callback = function ()
        task.spawn(function ()
            while Toggles.AntiSubspace.Value and task.wait() do
                local subspace = {
                    "SubspaceVFXBlur",
                    "SubspaceVFXColorCorrection"
                }
                for i, v in pairs(subspace) do
                    if game.Lighting:FindFirstChild(v) then
                        game.Lighting[v]:Destroy()
                    end
                end
            end
        end)
    end
})
AntiGroup:AddToggle("AntiFootsteps", {
    Text = "Anti Footsteps",
    Default = false,
})
pcall(function()
    local old; old = hookmetamethod(game, "__namecall", function (self, ...)
        local args = {...}
        if Toggles.AntiFootsteps.Value and args[1] == "FootstepPlayed" and type(args[2]) == "number" then
            warn("no footstep")
            return 
        end
        return old(self, unpack(args))
    end)
end)

local Players = game:GetService("Players")
local originalValues = {}
local paths = {
    "HideKillerWins",
    "HidePlaytime",
    "HideSurvivorWins"
}
local function saveOriginals(player)
    if not originalValues[player.UserId] then
        originalValues[player.UserId] = {}
    end
    for _, key in ipairs(paths) do
        local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
        originalValues[player.UserId][key] = value.Value
    end
end
local function reveal(player)
    for _, key in ipairs(paths) do
        local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
        value.Value = false
    end
end
local function restore(player)
    if originalValues[player.UserId] then
        for key, val in pairs(originalValues[player.UserId]) do
            local value = player.PlayerData.Settings.Privacy:FindFirstChild(key)
            value.Value = val
        end
    end
end
local function hiddenStatsFunc(disable)
    for _, player in ipairs(Players:GetPlayers()) do
        if disable then
            saveOriginals(player)
            reveal(player)
        else
            restore(player)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if toggleState == true then
        saveOriginals(player)
        reveal(player)
    end
end)
AntiGroup:AddToggle("AntiHiddenStats", {
    Text = "Anti Hidden Stats",
    Default = false,
    Tooltip = "lets you view peoples stats even if they are off",
    Callback = function(value)
        hiddenStatsFunc(value)
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

local function unlock(achieve)
   local remote = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
   remote:FireServer("UnlockAchievement", achieve)
end
local BadgeGroup = Tabs.Misc:AddRightGroupbox("Achievements", "award")
BadgeGroup:AddButton({
   Text = "\".\"",
   Func = function() unlock("MeetBrandon") end,
})

BadgeGroup:AddButton({
   Text = "\"Meow meow meow\"",
   Func = function() unlock("ILoveCats") end,
})

BadgeGroup:AddButton({
   Text = "\"Coming straight from YOUR house\"",
   Func = function() unlock("TVTIME") end,
})

BadgeGroup:AddButton({
   Text = "\"A Captain and his Ship\"",
   Func = function() unlock("MeetDemophon") end,
})

BadgeGroup:AddButton({
   Text = "\"Black, white, and gray\"",
   Func = function() unlock("Morality") end,
})

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
